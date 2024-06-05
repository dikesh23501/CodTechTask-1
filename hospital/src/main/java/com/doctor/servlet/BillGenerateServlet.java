package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BillGenerate")
public class BillGenerateServlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String disease=request.getParameter("disease").trim();
		int appointmentId=  Integer.parseInt(request.getParameter("id"));
		
		
		HttpSession session=request.getSession();
		if(disease.equalsIgnoreCase("Headache"))
		{
			response.sendRedirect("doctor/headacheBill.jsp?id="+appointmentId+"");
		}
		else {
			session.setAttribute("suggestion", "Only Headache medicines are available ! ");
			response.sendRedirect("doctor/patient.jsp");
			
		}
	}
  
	
	
}