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
import com.entities.Doctor;

@SuppressWarnings("serial")
@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String dob=request.getParameter("dob");
		String qualification=request.getParameter("qualification");
		String specialist=request.getParameter("specialist");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String password=request.getParameter("password");	
		
		Doctor doctor=new Doctor(id, name, dob, qualification, specialist, email, password, phone) ;
		DoctorDao doctorDao=new DoctorDaoImpl(DBConnection.getConnection());
		HttpSession session = request.getSession();
		if(doctorDao.updateDoctor(doctor))
		{
			session.setAttribute("success", "Doctor updated successfully !");
			response.sendRedirect("admin/view_doctor.jsp");
		}
		else 
		{
			session.setAttribute("failure", "Something went wrong on server");
			response.sendRedirect("admin/view_doctor.jsp");
		}
	}

}