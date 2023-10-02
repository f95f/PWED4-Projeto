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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();
		
		Section newSection = new Section();
		newSection.setNome(request.getParameter("txtNome"));
		newSection.setDescription(request.getParameter("txtDescr"));
		
		newSection.salvar();
		
		out.print("{\"id\": \"" + newSection.getIdSection() + "\", \"nome\": \"" + newSection.getNome() + "\", \"descr\": \"" + newSection.getDescription() + "\"}");
		
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}















