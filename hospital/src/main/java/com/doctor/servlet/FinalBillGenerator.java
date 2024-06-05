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



@WebServlet("/finalBill")
public class FinalBillGenerator  extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int id = Integer.parseInt(req.getParameter("id"));
		double paracetamol = Double.parseDouble(req.getParameter("paracetamol"));
		double aspirin = Double.parseDouble(req.getParameter("aspirin"));
		double ibuprofen = Double.parseDouble(req.getParameter("ibuprofen"));
		double sumatriptan = Double.parseDouble(req.getParameter("sumatriptan"));
		double naproxen = Double.parseDouble(req.getParameter("naproxen"));
		double ergotamine = Double.parseDouble(req.getParameter("ergotamine"));
		double buspirone = Double.parseDouble(req.getParameter("buspirone"));
		
		double tizanidine = Double.parseDouble(req.getParameter("tizanidine"));
	    
	    
	    
	    double total=(paracetamol+aspirin+ibuprofen+sumatriptan+naproxen+ergotamine+buspirone+tizanidine);
	    
	    HttpSession session=req.getSession();
	    
	    AppointmentDao appointmentDao=new AppointmentDaoImpl(DBConnection.getConnection());
	     
	    if(appointmentDao.updateBill(id))
	    {
	    	
		    session.setAttribute("successMsg", "Bill created successfully <br> Total bill = "+total+" /-");
		    resp.sendRedirect("doctor/headacheBill.jsp");
	    }
	    
	    else 
	    {
	    	session.setAttribute("errorMsg", "Something wrong on server !");
		    resp.sendRedirect("doctor/headacheBill.jsp");
		}
	    
	   
	   
	    
	
	
	}
   
}