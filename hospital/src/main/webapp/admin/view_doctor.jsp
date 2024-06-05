<%@page import="com.entities.Doctor"%>
<%@page import="com.daoImpl.DoctorDaoImpl"%>
<%@page import="com.dao.DoctorDao"%>
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
<title>doctor details page</title>
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
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">

					<div class="card-body">
						<p class="text-center fs-3">Doctor Details</p>
						
						<!--printing message -->
						<c:if test="${not empty success}">
							<p class="text-center text-success fs-3 ">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty failure}">
							<p class="text-center text-danger fs-3">${failure}</p>
							<c:remove var="failure" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
                                    <th scope="col">#Id</th>
									<th scope="col">Fullname</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist type</th>
									<th scope="col">Email</th>
									<th scope="col">Contact</th>
									<th scope="col">Action</th>
								</tr>
								<%
								DoctorDao doctorDao = new DoctorDaoImpl(DBConnection.getConnection());
								List<Doctor> doctors = doctorDao.getAllDoctor();
								for (Doctor doctor : doctors) {
								%>
								<tr>
                                    <td>#h12d<%=doctor.getDoctorId()%>or</td>
									<td><%=doctor.getDoctorName()%></td>
									<td><%=doctor.getDoctorDob()%></td>
									<td><%=doctor.getDoctorQualification()%></td>
									<td><%=doctor.getSpecialist()%></td>
									<td><%=doctor.getDoctorEmail()%></td>
									<td><%=doctor.getDoctorPhone()%></td>
									<td><a href="edit_doctor.jsp?id=<%=doctor.getDoctorId()%>" class="btn btn-sm btn-warning text-light">Edit</a>
										<a href="../deleteDoctor?id=<%=doctor.getDoctorId()%>" class="btn btn-sm btn-danger text-light">delete</a>
									</td>
								</tr>
								<%
								}
								%>

							</thead>


						</table>
					</div>

				</div>

			</div>


		</div>


	</div>

</body>
</html>