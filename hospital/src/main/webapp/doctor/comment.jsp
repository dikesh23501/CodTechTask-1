<%@page import="com.entities.Appointment"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.daoImpl.AppointmentDaoImpl"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comment page</title>
<link rel="icon" type="image/x-icon" href="../img/logo.png">
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
.backimage {
	background: linear-gradient(rgba(0, 0, 0, -4), rgba(0, 0, 0, -4)),
		url("../img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
<c:if test="${empty doctorObject}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="doctor_navbar.jsp"%>
	<div class="container-fluid backimage p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	
	<div class="container p-3">
	  <div class="row">
	     <div class="col-md-6 offset-md-3">
	         <div class="card paint-card">
	              <div class="card-body">
	                  <p class="text-center fs-4">Patient Comment</p>
	                  
	                  <%
	                     int appointmentId=Integer.parseInt(request.getParameter("appointmentId"));
	                     AppointmentDao appointmentDao=new AppointmentDaoImpl(DBConnection.getConnection());
	                     Appointment appointment=appointmentDao.getAppointmentById(appointmentId);
	                   %>
	                  
	                  <form class="row" action="../addComment" method="post">
	                      <div class="col-md-6">
	                        <label class="form-label">Patient Name</label> 
	                        <input type="text" readonly value="<%=appointment.getName() %>" class="form-control">
	                      </div>
	                      
	                       <div class="col-md-6">
	                        <label class="form-label">Age</label> 
	                        <input type="text" readonly value="<%=appointment.getAge() %>" class="form-control">
	                      </div>
	                      
	                      
	                       <div class="col-md-6">
	                        <label class="form-label">Mobile No</label> 
	                        <input type="text" readonly value="<%=appointment.getPhone() %>" class="form-control">
	                      </div>
	                      
	                       <div class="col-md-6">
	                        <label class="form-label">Disease</label> 
	                        <input type="text" readonly value="<%=appointment.getDisease() %>" class="form-control">
	                      </div>
	                      
	                       <div class="col-md-12">
	                        <label class="form-label">Comment</label> 
	                        <textarea required="required" name="comment" class="form-control" rows="3" ></textarea>
	                      </div>
	                      
	                      <input type="hidden" name="id" value="<%=appointmentId%>">
	                      <input type="hidden" name="doctorId" value="<%=appointment.getDoctorId()%>">
	                  
	                      <button class="mt-3 btn btn-info col-md-6 offset-md-3">Submit</button>
	                  </form>
	              </div>
	         </div>
	     </div>
	  
	  </div>
	</div>

</body>
</html>