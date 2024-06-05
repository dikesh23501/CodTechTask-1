package com.user.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.daoImpl.UserDaoImpl;
import com.db.DBConnection;
import com.entities.User;
import com.validation.UserValidation;



@SuppressWarnings("serial")
@WebServlet("/UserRegister")
public class UserRegister  extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int errorOccured=0;
		//creating session for storing information
	    HttpSession session = request.getSession();
		response.setContentType("text/html");
		
		String userName=request.getParameter("name");
		if(!UserValidation.checkName(userName))
		{
			session.setAttribute("name", "Length of name must be greaterthan 0 and lessthan 45 character and not contain any number");
			errorOccured++;
		}
		String userEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		String userPhone=request.getParameter("phone");
		String userAddress=request.getParameter("address");
		
		
		
		
		
		//creaing UserDao object for inserting user information into databae
		UserDao userDao= new UserDaoImpl(DBConnection.getConnection());
		
		if(errorOccured>0)
		{
			response.sendRedirect("user_registration.jsp");
		}
		else 
		{
			//creating user with dynamic values provided by user_registration.jsp
			User user=new User(userName, userEmail, userPassword, userPhone, userAddress);
			
			if(userDao.insert(user))
			{
				session.setAttribute("msg", "User Registration Successful !");
				response.sendRedirect("user_login.jsp");
			} 
		}
		
		
		
		
	}
     
}
