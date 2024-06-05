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

@WebServlet("/editDoctor")
public class EditDoctorProfile  extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("doctorId"));
		String name=request.getParameter("name");
		String dob=request.getParameter("dob");
		String qualification=request.getParameter("qualification");
		String specialist=request.getParameter("specialist");
        String phone=request.getParameter("phone");
		
		
		Doctor doctor=new Doctor(id,name, dob, qualification, specialist,phone) ;
		DoctorDao doctorDao=new DoctorDaoImpl(DBConnection.getConnection());
		HttpSession session = request.getSession();
		if(doctorDao.editDoctor(doctor))
		{
			Doctor updatedDoctor = doctorDao.getSingleDoctor(id);
			session.setAttribute("success", "Doctor updated successfully !");
			session.setAttribute("doctorObject", updatedDoctor);
			response.sendRedirect("doctor/editProfile.jsp");
		}
		else 
		{
			session.setAttribute("error", "Something went wrong on server");
			response.sendRedirect("doctor/editProfile.jsp");
		}
	}
		
	

}