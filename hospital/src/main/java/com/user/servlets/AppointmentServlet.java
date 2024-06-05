package com.user.servlets;

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
import com.entities.Appointment;

@SuppressWarnings("serial")
@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet 
{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	int userId = Integer.parseInt(request.getParameter("userId"));
	String name	=request.getParameter("name");
	String gender=request.getParameter("gender");
	int age=Integer.parseInt(request.getParameter("age"));
	String date=request.getParameter("appointDate");
	String email=request.getParameter("email");
	String phone=request.getParameter("phone");
	String disease=request.getParameter("disease");
	int doctorId= Integer.parseInt(request.getParameter("doctor"));
	String address=request.getParameter("address");
	
	Appointment appointment=new Appointment(userId,name,gender, age, date, email, phone, disease, doctorId, address, "pending","not generated");
	
    AppointmentDao appointmentDao=new AppointmentDaoImpl(DBConnection.getConnection());	
	HttpSession session=request.getSession();
    if(appointmentDao.addAppointment(appointment))
    {
    	session.setAttribute("succMsg", "Appointment Successfull !");
    	response.sendRedirect("user_appointment.jsp");
    }
    else
    {
    	session.setAttribute("errorMsg", "Something wrong on server");
    	response.sendRedirect("user_appointment.jsp");
    }
	
	}

}
