package com.admin.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.daoImpl.SpecialistDaoImpl;
import com.db.DBConnection;

@SuppressWarnings("serial")
@WebServlet("/addSpecialist")
public class SpecialistServlet extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String specialistName = request.getParameter("name");
		SpecialistDao specialistDao=new SpecialistDaoImpl(DBConnection.getConnection());
		HttpSession session = request.getSession();
		if(specialistDao.addSpecialist(specialistName))
		{
		    session.setAttribute("success", "Specialist added successfully !");
		    response.sendRedirect("admin/index.jsp");
		}
		else 
		{
			session.setAttribute("error", "Something went wrong on server");
			response.sendRedirect("admin/specialist.jsp");
		}
	}

}