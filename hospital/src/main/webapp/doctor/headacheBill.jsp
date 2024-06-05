<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medicine Bill</title>
<link rel="icon" type="image/x-icon" href="../img/logo.png">
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backimage {
	background: linear-gradient(rgba(0, 0, 0, -4), rgba(0, 0, 0, -4)),
		url("../img/hospital.jpg");
	height: 16vh;
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
					<div class="card-body ">
						<p class="text-center fs-3">Medicine Billing System</p>

						<form action="../finalBill" method="post" class="row">
							<c:if test="${not empty successMsg}">
								<p class="text-center text-success fs-3">${successMsg}</p>
								<c:remove var="successMsg" scope="session" />
							</c:if>
							<c:if test="${not empty errorMsg}">
								<p class="text-center text-danger fs-3">${errorMsg}</p>
								<c:remove var="errorMsg" scope="session" />
							</c:if>
							<input type="hidden" value="<%=request.getParameter("id")%>"
								name="id">
							<div class="col-md-6">
								<label class="form-label">Paracetamol (Acetaminophen):</label><span>
									<input type="text" name="paracetamol" class="form-control"
									required="required">
								</span>
							</div>

							<div class="col-md-6">
								<label class="form-label">Aspirin:</label> <input type="text"
									name="aspirin" class="form-control" required="required">
							</div>

							<div class="col-md-6">
								<label class="form-label">Ibuprofen:</label> <input type="text"
									name="ibuprofen" class="form-control" required="required">
							</div>

							<div class="col-md-6">
								<label class="form-label">Sumatriptan:</label> <input
									type="text" name="sumatriptan" class="form-control"
									required="required">
							</div>

							<div class="col-md-6">
								<label class="form-label">Naproxen:</label> <input type="text"
									name="naproxen" class="form-control" required="required">
							</div>

							<div class="col-md-6">
								<label class="form-label">Ergotamine:</label> <input type="text"
									name="ergotamine" class="form-control" required="required">
							</div>

							<div class="col-md-6">
								<label class="form-label">Buspirone:</label> <input type="text"
									name="buspirone" class="form-control" required="required">
							</div>



							<div class="col-md-6">
								<label class="form-label">Tizanidine:</label> <input type="text"
									name="tizanidine" class="form-control" required="required">
							</div>

							<div class="container text-center">
								<button class="btn btn-info mt-2 col-md-4 mx-2" type="submit">Submit</button>

							</div>


						</form>


					</div>

				</div>

			</div>

		</div>
	</div>

</body>
</html>