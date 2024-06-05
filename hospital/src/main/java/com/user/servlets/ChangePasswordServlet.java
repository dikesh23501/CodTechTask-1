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

@SuppressWarnings("serial")
@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		String oldPassword=request.getParameter("oldPassword");
		String newPassword=request.getParameter("newPassword");
		UserDao userDao=new UserDaoImpl(DBConnection.getConnection());
		HttpSession session = request.getSession();
		
		if(userDao.checkOldPassword(userId, oldPassword))
		{
			if(userDao.changePassword(userId, newPassword))
			{
				session.setAttribute("successMsg", "Password Updated Successfull ");
				response.sendRedirect("changePassword.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "Something went wrong on server !");
			    response.sendRedirect("changePassword.jsp");
			}
		}
		else
		{
			session.setAttribute("errorMsg", "Invalid Old Password");
		    response.sendRedirect("changePassword.jsp");
		}
	}

}
