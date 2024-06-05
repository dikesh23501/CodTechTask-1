package com.admin.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.daoImpl.DoctorDaoImpl;
import com.db.DBConnection;

@SuppressWarnings("serial")
@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	int id = Integer.parseInt(request.getParameter("id"));
	HttpSession session=request.getSession();
	DoctorDao doctorDao=new DoctorDaoImpl(DBConnection.getConnection());
	if(doctorDao.deleteDoctor(id))
	{
		session.setAttribute("success", "Doctor deleted successfully !");
		response.sendRedirect("admin/view_doctor.jsp");
	}
	else
	{
		session.setAttribute("failure", "Something went wrong on server");
		response.sendRedirect("admin/view_doctor.jsp");
	}
	}
   
}