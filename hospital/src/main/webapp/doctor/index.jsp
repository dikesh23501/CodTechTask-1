<%@page import="com.daoImpl.DoctorDaoImpl"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entities.Doctor"%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../component/allcss.jsp"%>
<link rel="icon" type="image/x-icon" href="../img/logo.png">
<title>doctor index page</title>
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
	<%@include file="doctor_navbar.jsp"%>
	<p class="text-center fs-1 mt-3 ">Doctor Dashboard</p>
    <%
       Doctor doctor =(Doctor)session.getAttribute("doctorObject");
       Connection connection=DBConnection.getConnection();
       DoctorDao doctorDao=new DoctorDaoImpl(connection);
    
    %>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-info">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">Doctor
						 <br>
						 <%=doctorDao.countDoctor() %>
						</p>
						
					</div>
				</div>
			</div>

			<div class="col-md-4 ">
				<div class="card paint-card">
					<div class="card-body text-center text-info">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">Total Appointment
						 <br>
						  <%=doctorDao.countAppointmentsOfPatientById(doctor.getDoctorId()) %>
						</p>
					   
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>