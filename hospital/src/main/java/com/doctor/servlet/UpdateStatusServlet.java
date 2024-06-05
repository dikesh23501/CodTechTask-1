package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.daoImpl.AppointmentDaoImpl;
import com.db.DBConnection;

@WebServlet("/addComment")
public class UpdateStatusServlet  extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	int id = Integer.parseInt(request.getParameter("id"));
	int doctorId=Integer.parseInt(request.getParameter("doctorId"))	;
	String status=request.getParameter("comment");
	AppointmentDao appointmentDao=new AppointmentDaoImpl(DBConnection.getConnection());
	HttpSession session=request.getSession();
	if(appointmentDao.updateCommentStatus(id, doctorId, status))
	{
		session.setAttribute("successMsg", "Comment Updated");
		response.sendRedirect("doctor/patient.jsp");
	}
	else
	{
		session.setAttribute("errorMsg", "Something went wrong");
		response.sendRedirect("doctor/comment.jsp");
	}
	
	}
   
}