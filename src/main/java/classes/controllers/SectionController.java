package classes.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.models.Genero;
import classes.models.Section;

@WebServlet("/sections")
public class SectionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PrintWriter out;
	private Section section = new Section();
    public SectionController() {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();

		ArrayList<Section> listSections = section.listSections();

		String sectionsJSON = "[]";
		String parameter = request.getParameter("action");
		
		if(parameter == null) {
			
			listSections = section.listSections();
	
		}
		else if(parameter.equals("sectionName")) {
			
			String valor = request.getParameter("value");
			listSections = section.buscarPor("nome", valor);
			
		}
		else if(parameter.equals("sectionDescr")) {
			
			String valor = request.getParameter("value");
			listSections = section.buscarPor("descr", valor);
			
		}
		else if(parameter.equals("sectionId")) {
			
			String valor = request.getParameter("value");
			listSections = section.buscarPor("id", valor);
			
		}
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

		section.setNome(request.getParameter("txtNome"));
		section.setDescription(request.getParameter("txtDescr"));

		section.salvar();

		out.print("{\"id\": \"" + section.getIdSection() + "\", \"nome\": \"" + section.getNome() + "\", \"descr\": \"" + section.getDescription() + "\"}");

	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();
		String sectionId = request.getParameter("sectionId");
		int status = 0;
		
		ArrayList<Section> sectionEncontrado = section.buscarPor("id", sectionId);
		if(sectionEncontrado.size() != 0) {
			
			sectionEncontrado.get(0).setNome(request.getParameter("txtNome"));
			sectionEncontrado.get(0).setDescription(request.getParameter("txtDescription"));
			status = sectionEncontrado.get(0).update();
		}
		out.print(status);
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();
		String sectionId = request.getParameter("sectionId");
		int status = 0;
		
		ArrayList<Section> sectionEncontrada = section.buscarPor("id", sectionId);
		if(sectionEncontrada.size() != 0) {
			status = sectionEncontrada.get(0).deletar();
		}
		out.print(status);
		
	}

}















