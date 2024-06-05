package com.admin.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entities.User;

@SuppressWarnings("serial")
@WebServlet("/AdminLogin")
public class AdminLogin  extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	   
		String userEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		HttpSession session = request.getSession();
		
		if(userEmail.equals("admin@gmail.com") && userPassword.equals("admin"))
		{
			session.setAttribute("admin", new User());
			response.sendRedirect("admin/index.jsp");
		}
		else 
		{
		    session.setAttribute("msg", "Invalid Credentials !");
		    response.sendRedirect("admin_login.jsp");
		}
		
	}
	
}