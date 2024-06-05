<%@page import="com.entities.Doctor"%>
<%@page import="com.daoImpl.DoctorDaoImpl"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entities.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.daoImpl.AppointmentDaoImpl"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Appointments</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backimage {
	background: linear-gradient(rgba(0, 0, 0, -4), rgba(0, 0, 0, -4)),
		url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid backimage p-5">
		<p class="text-center fs-2 text-light"></p>
	</div>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-info">Appointment List</p>
						<table class="table">
							<thead>
								<tr>
                                     <th scope="col">Name</th>
                                     <th scope="col">Gender</th>
                                     <th scope="col">Age</th>
                                     <th scope="col">Appointment Date</th>
                                     <th scope="col">Disease</th>
                                     <th scope="col">Doctor Name</th>
                                     <th scope="col">Status</th>
                                     
								</tr>
							</thead>
							<tbody>
							
							     <%
							       int userId=((User)session.getAttribute("userObject")).getUserId();
							       AppointmentDao appointmentDao=new AppointmentDaoImpl(DBConnection.getConnection());
							       DoctorDao doctorDao=new DoctorDaoImpl(DBConnection.getConnection());
							       List<Appointment> appointments=appointmentDao.getAllAppointments(userId);
							       for(Appointment appointment : appointments)
							       {
							    	 Doctor doctor =doctorDao.getSingleDoctor(appointment.getDoctorId());
							     %>
							
							      <tr>
							          <td class="fw-bold"><%=appointment.getName()%></td>
							          <td><%=appointment.getGender()%></td>
							          <td><%=appointment.getAge()%></td>
							          <td><%=appointment.getAppointDate()%></td>
							          <td><%=appointment.getDisease()%></td>
							          <td><%=doctor.getDoctorName()%></td>
							          <td>
							             <%
							                 if(appointment.getStatus().equals("pending"))
							                 {
							              %>  	 
							                
							                   <button class="btn btn-warning btn-sm text-dark">Pending</button>	 
							             <%   	 
							                 }
							                 else
							                 {
							             %>
							                 <%=appointment.getStatus()%> 
							                  
							             <%
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
			
			<div class="col-md-3 p-3">
			     <img alt="image not found" src="img/doctor3.png" height="500px" >
			</div>
		</div>

	</div>

</body>
</html>