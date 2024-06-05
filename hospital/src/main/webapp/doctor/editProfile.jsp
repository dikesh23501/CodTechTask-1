<%@page import="com.entities.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.daoImpl.SpecialistDaoImpl"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<link rel="icon" type="image/x-icon" href="../img/logo.png">
<%@include file="../component/allcss.jsp"%>
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
	<div class="container">
		<div class="row">
			<div class="col-md-4 ">
				<div class="card paint-card mt-3">
				<p class="text-center fs-3">Update Password</p>
					<div class="card-body">
						<form action="../changeDoctorPassword" method="post">

							<!--printing message -->
							<c:if test="${not empty successMsg}">
								<p class="text-center text-success fs-3">${successMsg}</p>
								<c:remove var="successMsg" scope="session" />
							</c:if>
							<c:if test="${not empty errorMsg}">
								<p class="text-center text-danger fs-3">${errorMsg}</p>
								<c:remove var="errorMsg" scope="session" />
							</c:if>
							<div class="mb-3">
								<label class="form-label">Enter New Password</label> <input
									type="text" name="newPassword" class="form-control"
									required="required">
							</div>

							<div class="mb-3">
								<label class="form-label">Enter Old Password</label> <input
									type="text" name="oldPassword" class="form-control"
									required="required">
							</div>
							<input type="hidden" value="${doctorObject.doctorId}" name="doctorId">
							<button class="btn btn-info text-light col-md-12">Change
								Password</button>

						</form>
					</div>
				</div>

			</div>

			<div class="col-md-5 offset-md-1 mt-3">
				<div class="card paint-card">
				     <p class="text-center fs-3">Edit Profile</p>
					<div class="card-body">
                 
						<form action="../editDoctor" method="post">
							<!--printing message -->
							<c:if test="${not empty success}">
								<p class="text-center text-success fs-3">${success}</p>
								<c:remove var="success" scope="session" />
							</c:if>
							<c:if test="${not empty error}">
								<p class="text-center text-danger fs-3">${error}</p>
								<c:remove var="error" scope="session" />
							</c:if>
							<div class="mb-3">
								<label class="form-label">Enter Full Name</label> <input
									type="text" name="name" class="form-control"
									required="required" value="${doctorObject.doctorName }">
							</div>

							<div class="mb-3">
								<label class="form-label">Enter DOB</label> <input type="date"
									name="dob" class="form-control" required="required" value="${doctorObject.doctorDob }">
							</div>

							<div class="mb-3">
								<label class="form-label">Enter Qualification</label> <input
									type="text" name="qualification" class="form-control" value="${doctorObject.doctorQualification }"
									required="required">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									class="form-control" name="specialist">
									<option>${doctorObject.specialist}</option>
									<%
									SpecialistDao specialistDao = new SpecialistDaoImpl(DBConnection.getConnection());
									List<Specialist> list = specialistDao.getAllSpecialist();

									for (Specialist specialist : list) {
									%>
									<option><%=specialist.getSpecialistName()%></option>
									<%
									}
									%>


								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Enter Email</label> <input
									type="email" name="email" value="${doctorObject.doctorEmail }" class="form-control" readonly="readonly"
									required="required">
							</div>

							<div class="mb-3">
								<label class="form-label">Enter Mobile No</label> <input
									type="text" name="phone" class="form-control" value="${doctorObject.doctorPhone }"
									required="required">
							</div>

							<input type="hidden" value="${doctorObject.doctorId}" name="doctorId">
							<div class="text-center mt-2">
								<button class="btn btn-info col-md-12 text-light">Update</button>
							</div>
						</form>

					</div>

				</div>

			</div>

		</div>

	</div>
</body>
</html>