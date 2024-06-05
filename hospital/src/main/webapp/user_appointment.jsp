
<%@page import="com.entities.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.daoImpl.DoctorDaoImpl"%>
<%@page import="com.dao.DoctorDao"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User appointment</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0.3);
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
		<p class="text-center fs-2 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="image not found" height="500px" src="img/doctor3.png">
			</div>

			<div class="col-md-6">
				<div class="card paint-card mt-3">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form class="row g-3" action="addAppointment" method="post">

							<input type="hidden" name="userId" value="${userObject.userId}">
							<div class="col-md-6">
								<label class="form-label" for="name">Full Name</label> 
								<input type="text" class="form-control" required="required" name="name">
							</div>

							<div class="col-md-6">
								<label class="form-label">Gender</label> 
								<select class="form-control" name="gender"
									    required="required">
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="age" class="form-label">Age</label> <input
									type="number" class="form-control" name="age" required="required"/>
							</div>
							<div class="col-md-6">
								<label for="appointment" class="form-label">Date</label> <input
									type="date" class="form-control" required="required"
									name="appointDate">
							</div>
							<div class="col-md-6">
								<label for="email" class="form-label">Email</label> <input
									type="email" class="form-control" required="required"
									name="email">
							</div>

							<div class="col-md-6">
								<label for="phone" class="form-label">Phone No</label> <input
									type="number" maxlength="10" class="form-control"
									required="required" name="phone">
							</div>
							<div class="col-md-6">
								<label for="disease" class="form-label">Disease</label> <input
									type="text" class="form-control" required="required"
									name="disease">
							</div>
							<div class="col-md-6">
								<label class="form-label">Doctor</label> <select
									class="form-control" name="doctor">
									<option>--select--</option>
								<%
								DoctorDao doctorDao = new DoctorDaoImpl(DBConnection.getConnection());
								List<Doctor> doctors = doctorDao.getAllDoctor();
								for (Doctor doctor : doctors) {
								%>
								<option value="<%=doctor.getDoctorId()%>"><%=doctor.getDoctorName()%> (<%=doctor.getSpecialist()%>)</option>
								<%
								}
								%>
									
								</select>
							</div>
                            
							<div class="col-md-12">
								<label class="form-label">Address</label>
								<textarea rows="3" class="form-control" name="address"
									required="required"></textarea>
							</div>
							<c:if test="${empty userObject}">
								<a href="user_login.jsp"
									class="col-md-6 offset-md-3 btn btn-info">Submit</a>
							</c:if>
							<c:if test="${not empty userObject}">
								<button class="col-md-8 offset-md-2 btn btn-info">Submit</button>
							</c:if>




						</form>



					</div>

				</div>

			</div>

		</div>
</div>
<%@include file="component/footer.jsp" %>

</body>
</html>