<%@page import="com.entities.Doctor"%>
<%@page import="com.daoImpl.DoctorDaoImpl"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.entities.Specialist"%>
<%@page import="java.util.List"%>
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
<link rel="icon" type="image/x-icon" href="../img/logo.png">
<title>Edit doctor page</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
<%@include file="admin_navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor Details</p>
						<!--printing message -->
						<c:if test="${not empty success}">
							<p class="text-center text-success fs-3 ">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty failure}">
							<p class="text-center text-danger fs-3">${failure}</p>
							<c:remove var="failure" scope="session" />
						</c:if>
                       <%
                           int id=Integer.parseInt(request.getParameter("id"));
                           DoctorDao doctorDao=new DoctorDaoImpl(DBConnection.getConnection());
                           Doctor doctor=doctorDao.getSingleDoctor(id);
                       %>
						<form action="../updateDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Enter Full Name</label> <input
									type="text" value="<%=doctor.getDoctorName() %>" name="name" class="form-control"
									required="required">
							</div>

							<div class="mb-3">
								<label class="form-label">Enter DOB</label> <input type="date"
									name="dob" value="<%=doctor.getDoctorDob() %>" class="form-control" required="required">
							</div>

							<div class="mb-3">
								<label class="form-label">Enter Qualification</label> <input
									type="text" name="qualification" value="<%=doctor.getDoctorQualification()%>"class="form-control"
									required="required">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									class="form-control"  name="specialist">
									<option><%=doctor.getSpecialist()%></option>
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
									type="email" name="email" value="<%=doctor.getDoctorEmail() %>" class="form-control"
									required="required">
							</div>

							<div class="mb-3">
								<label class="form-label">Enter Mobile No</label> <input
									type="text" name="phone" value="<%=doctor.getDoctorPhone() %>" class="form-control"
									required="required">
							</div>

							<div class="mb-3">
								<label class="form-label">Enter Password</label> <input
									type="text" name="password" value="<%=doctor.getDoctorPassword() %>" class="form-control"
									required="required">
							</div>
							<div class="text-center mt-2">
							     <input type="hidden" name="id" value="<%=doctor.getDoctorId()%>">
								<button class="btn btn-info col-md-12">Update</button>
							</div>
						</form>
					</div>

				</div>

			</div>
			
			</div>


	</div>

</body>
</html>