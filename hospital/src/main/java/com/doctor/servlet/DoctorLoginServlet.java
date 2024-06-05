package com.doctor.servlet;

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
import com.entities.Doctor;

@WebServlet("/doctorLogin")
public class DoctorLoginServlet extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		DoctorDao doctorDao=new DoctorDaoImpl(DBConnection.getConnection());
		Doctor doctor = doctorDao.validDoctor(email, password);
		HttpSession session=request.getSession();
		if(doctor != null)
		{
			session.setAttribute("doctorObject", doctor);
			response.sendRedirect("doctor/index.jsp");
		}
		else
		{
			session.setAttribute("msg", "Invalid Credentials");
			response.sendRedirect("doctor_login.jsp");
		}
		
	}
   
}