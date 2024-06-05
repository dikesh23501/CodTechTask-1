<%@page import="com.daoImpl.SpecialistDaoImpl"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.daoImpl.AppointmentDaoImpl"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.daoImpl.UserDaoImpl"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.daoImpl.DoctorDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin dashboard</title>
<link rel="icon" type="image/x-icon" href="../img/logo.png">
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
    <c:if test="${empty admin }">
     <c:redirect url="../admin_login.jsp"></c:redirect>
    </c:if>
	<%@include file="admin_navbar.jsp"%>
     
     <!--printing message -->
		<c:if test="${not empty success}">
		<p class="text-center text-success fs-3 ">${success}</p>
		<c:remove var="success" scope="session"/>
		</c:if>
		<c:if test="${not empty failure}">
		<p class="text-center text-danger fs-3">${failure}</p>
		<c:remove var="failure" scope="session"/>
		</c:if>
	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>

       <%
          Connection connection=DBConnection.getConnection();
          DoctorDao doctorDao=new DoctorDaoImpl(connection);
          UserDao userDao=new UserDaoImpl(connection);
          AppointmentDao appointmentDao=new AppointmentDaoImpl(connection);
          SpecialistDao specialistDao=new SpecialistDaoImpl(connection);
       
       %>
		<!-- card-1 -->
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-info">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br> <%=doctorDao.countDoctor()%>
						</p>
					</div>

				</div>
			</div>


			<!-- card-2 -->
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-info">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							User <br><%=userDao.countUser() %>
						</p>
					</div>

				</div>
			</div>

			<!-- card-3 -->
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-info">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%=appointmentDao.countAppointments() %>
						</p>
					</div>

				</div>
			</div>

			<!-- card-4 -->
			<div class="col-md-4 mt-2">
			<!-- card trigger modal -->
				<div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
					<div class="card-body text-center text-info">
						<i class="fas fa-user fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist <br><%=specialistDao.countSpecialists() %>
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>
	
	
	<!-- specialist modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      <form action="../addSpecialist" method="post">
       <div class="form-group">
         <label >Enter Specialist catagory </label>
         <input type="text" name="name" class="form-control" required="required" >
       </div>
       <div class="text-center mt-2">
          <button class="btn btn-info">Add</button>
       </div>
       
      </form>
        
      </div>
      
    </div>
  </div>
</div>
</body>
</html>