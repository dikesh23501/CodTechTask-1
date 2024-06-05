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
@WebServlet("/changeDoctorPassword")
public class ChangeDoctorPassword extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		
		String oldPassword=request.getParameter("oldPassword");
		String newPassword=request.getParameter("newPassword");
		
		DoctorDao doctorDao=new DoctorDaoImpl(DBConnection.getConnection());
		HttpSession session = request.getSession();
		if(doctorDao.checkOldPassword(doctorId, oldPassword))
		{
			if(doctorDao.changePassword(doctorId, newPassword))
			{
				session.setAttribute("successMsg", "Password Updated Successfully");
				response.sendRedirect("doctor/editProfile.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "Something went wrong in server !");
				response.sendRedirect("doctor/editProfile.jsp");	
			}
		}
		else
		{
			session.setAttribute("errorMsg", "Invalid old password");
			response.sendRedirect("doctor/editProfile.jsp");
		}
		
	}
   
}