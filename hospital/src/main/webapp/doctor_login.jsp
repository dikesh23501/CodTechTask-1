<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor login page</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
      .paint-card {
	  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.3);
      }
     
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container ">
		<div class="row">
			<div class="col-md-6 offset-md-3 paint-card mt-4">
				<div class="card">
					<div class="card-header text-center text-dark">

						<h3>Doctor Login</h3>
						<!--printing message -->
						<c:if test="${not empty msg}">
						  <p class="text-center text-danger fs-3">${msg}</p>
						  <c:remove var="msg" scope="session"/>
						</c:if>
						<c:if test="${not empty success}">
						  <p class="text-center text-success fs-3">${success}</p>
						  <c:remove var="success" scope="session"/>
						</c:if>
					</div>
					<div class="card-body ">

						<form action="doctorLogin" method="post">
							<div class="form-group mb-2">
								<label for="email">Email Address</label> <input type="email"
									class="form-control" id="email" name="email">
							</div>
							<div class="form-group">
								<label for="email">User Password</label> <input type="password"
									class="form-control" id="password" name="password">
							</div>


							<button class="btn btn-info custom-bg col-md-12 mt-3 text-white" type="submit">Login</button>


						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>