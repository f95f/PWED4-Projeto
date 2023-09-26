package classes.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.models.Section;

@WebServlet("/section")
public class SectionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private PrintWriter out;
    public SectionController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();
		out.print("sla lkkkk");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();
		
		Section newSection = new Section();
		newSection.setNome(request.getParameter("txtNome"));
		newSection.setDescription(request.getParameter("txtDescr"));
		
		newSection.salvar();
		
		out.print("{\"id\": \"" + newSection.getIdSection() + "\", \"nome\": \"" + newSection.getNome() + "\", \"descr\": \"" + newSection.getDescription() + "\"}");
		
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}















