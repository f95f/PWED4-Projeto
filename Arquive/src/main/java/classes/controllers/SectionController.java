package classes.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.models.Section;

@WebServlet("/sections")
public class SectionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PrintWriter out;
	private Section sections = new Section();
    public SectionController() {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();

		ArrayList<Section> listSections = sections.listSections();

		String sectionsJSON = "[]";

		if(listSections.size() != 0){

			sectionsJSON = "[";
			for(int i = 0; i < listSections.size(); i++){

				sectionsJSON += "   {\"id\": \"" + listSections.get(i).getIdSection() + "\", "
								+ "\"nome\": \"" + listSections.get(i).getNome() + "\", "
							   + "\"descr\": \"" + listSections.get(i).getDescription() + "\"}" + ((i < listSections.size() -1)? ", " : "");

			}
			sectionsJSON += "]";
		}

		out.print(sectionsJSON);


	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();

		sections.setNome(request.getParameter("txtNome"));
		sections.setDescription(request.getParameter("txtDescr"));

		sections.salvar();

		out.print("{\"id\": \"" + sections.getIdSection() + "\", \"nome\": \"" + sections.getNome() + "\", \"descr\": \"" + sections.getDescription() + "\"}");

	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}















