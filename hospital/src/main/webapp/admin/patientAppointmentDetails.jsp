<%@page import="com.daoImpl.DoctorDaoImpl"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entities.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.daoImpl.AppointmentDaoImpl"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Appointments</title>
<link rel="icon" type="image/x-icon" href="../img/logo.png">
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="admin_navbar.jsp"%>

	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Patient Details</p>

				<table class="table">
					<thead>
						<tr>
                             <th scope="col">Name</th>
                             <th scope="col">Gender</th>
                             <th scope="col">Age</th>
                             <th scope="col">Appointment</th>
                             <th scope="col">Email</th>
                             <th scope="col">MobileNo</th>
                             <th scope="col">Disease</th>
                             <th scope="col">Doctor Name</th>
                             <th scope="col">Status</th>
						</tr>

					</thead>
					
					<tbody>
					<%
					  AppointmentDao appointmentDao=new AppointmentDaoImpl(DBConnection.getConnection());
					  List<Appointment> appointments =appointmentDao.getAllAppointments();
					  DoctorDao doctorDao=new DoctorDaoImpl(DBConnection.getConnection());
					  
					  for(Appointment appointment : appointments)
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
					               <td><%=doctorDao.getSingleDoctor(appointment.getDoctorId()) %></td>
					               <td><%=appointment.getStatus() %></td>
					         </tr>
					         
					   <%
					   }
					   %>      
					</tbody>

				</table>
			</div>
		</div>

	</div>
</body>
</html>