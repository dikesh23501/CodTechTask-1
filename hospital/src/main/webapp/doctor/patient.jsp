<%@page import="com.entities.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.daoImpl.AppointmentDaoImpl"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entities.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../component/allcss.jsp"%>
<link rel="icon" type="image/x-icon" href="../img/logo.png">
<title>Patient Details</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty doctorObject}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="../doctor/doctor_navbar.jsp"%>

	<div class="container p-3">
	   <div class="row">
	       <div class="col-md-12">
	         <div class="card paint-card">
	            <div class="card-body">
	                <p class="fs-3 text-center">Patient Details</p>
	                <c:if test="${not empty suggestion}">
						  <p class="text-center text-danger fs-3">${suggestion}</p>
						  <c:remove var="suggestion" scope="session"/>
						</c:if>
	                <c:if test="${not empty errorMsg}">
						  <p class="text-center text-danger fs-3">${errorMsg}</p>
						  <c:remove var="errorMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty successMsg}">
						  <p class="text-center text-success fs-3">${successMsg}</p>
						  <c:remove var="successMsg" scope="session"/>
				    </c:if>
				    
				    <table class="table">
				       <thead>
				              <tr>
				                   <th scope="col">Name</th>
				                   <th scope="col">Gender</th>
				                   <th scope="col">Age</th>
				                   <th scope="col">Appointment Date</th>
				                   <th scope="col">Email</th>
				                   <th scope="col">Mobile No</th>
				                   <th scope="col">Disease</th>
				                   <th scope="col">Status</th>
				                   <th scope="col">Action</th>
				                   <th scope="col">Bill</th>
				              </tr>
				       </thead>
				       
				       <tbody>
				        <%
				           int doctorId =((Doctor)session.getAttribute("doctorObject")).getDoctorId();
				           AppointmentDao appointmentDao=new AppointmentDaoImpl(DBConnection.getConnection());
				           List<Appointment> appointments =appointmentDao.getAllAppointmentsOfLoginDoctor(doctorId);
				          
				           for(Appointment appointment:appointments)
				           {
				        %>
				              <tr>
				                  <td><%=appointment.getName() %></td>
				                  <td><%=appointment.getGender() %></td>
				                  <td><%=appointment.getAge() %></td>
				                  <td><%=appointment.getAppointDate() %></td>
				                  <td><%=appointment.getEmail() %></td>
				                  <td><%=appointment.getPhone() %></td>
				                  <td><%=appointment.getDisease() %></td>
				                  <td><%=appointment.getStatus() %></td>
				                  <td>
				                  <%
				                     if(appointment.getStatus().equals("pending"))
				                     {
				                  %>
				                   <a href="comment.jsp?appointmentId=<%=appointment.getId() %>" class="btn btn-info btn-sm text-light">Comment</a>
				                  <%
				                     }
				                     else
				                     {
				                  %>
				                     <a href="#" class="btn btn-info btn-sm text-light disabled">Commented</a>
				                   <%
				                     }
				                   %>
				                   
				                  </td>
				                  <td>
				                       <%
				                           if((appointment.getStatus().equalsIgnoreCase("Checkup Completed")) && (appointment.getBill().equalsIgnoreCase("not generated")))
				                           { 
				                       %>
				                          <a href="../BillGenerate?disease=<%=appointment.getDisease() %>&id=<%=appointment.getId() %>" class="btn btn-info btn-sm text-light">Generate</a>  
				                       <%
				                           }
				                           else
				                           {
				                        	   if(appointment.getStatus().equalsIgnoreCase("pending"))
				                        	   {
				                       %>
				                                 <a href="../BillGenerate?disease=<%=appointment.getDisease() %>&id=<%=appointment.getId() %>" class="btn btn-info btn-sm text-light disabled">Generate</a>
				                          
				                       <%
				                               }
				                        	   else
				                        	   {
				                       %>
				                                <a href="#" class="btn btn-info btn-sm text-light disabled">Bill Submitted</a>
				                                
				                                <% 
				                        	   }
				                           }  
				                                %>
				                                
				                  </td>
				              </tr>
				          <%
				           }
				          %>
				       </tbody>
				    
				    
				    
				    </table>
				    
	            </div>
	         
	         </div>
	       
	       </div>
	   
	   </div>
	
	
	</div>



</body>
</html>