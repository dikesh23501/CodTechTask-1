<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration page</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-4">
			<div class="col-md-4 offset-md-4 paint-card">
				<div class="card">

					<div class="card-body px-5 ">

						<div class="container text-center">
							<img alt="image not found" 
							     src="img/add_friend.png"
								 style="max-widht: 100px; height: 100px;" 
								 class="img-fluid">
						</div>
						<h3 class="text-center my-2 ">Sign up here !!</h3>
						<c:if test="${not empty msg}">
						  <p class="text-center text-danger fs-3">${msg}</p>
						  <c:remove var="msg" scope="session"/>
						</c:if>
						<form action="UserRegister" method="post">

							<div class="form-group">
								<label for="name">User Name</label> 
								<input type="text"
									   class="form-control" 
									   id="name" 
									   name="name">
							</div>
							<c:if test="${not empty name}">
						       <p class="text-danger" style="font-size:13px;">${name}</p>
						    <c:remove var="name" scope="session"/>
						    </c:if>
							<div class="form-group mt-2">
								<label for="email">User Email</label> 
								<input type="email"
									   class="form-control" 
									   id="email" 
									   required="required"
									   name="email">
							</div>
							<div class="form-group mt-2">
								<label for="password">User Password</label> 
								<input
									   type="password" 
									   class="form-control" 
									   id="password"
									   required="required"
									   name="password">
							</div>
							<div class="form-group mt-2">
								<label for="phone">User Phone</label>
								<input type="text"
									   class="form-control" 
									   id="phone" 
									   required="required"
									   name="phone">
							</div>
							<div class="form-group mt-2">
								<label for="address">User Address</label>
								<textarea style="height: 100px" class="form-control" required="required" id="address" name="address"> </textarea>
							</div>

							<button class="btn  col-md-12 mt-2 bg-info text-white">Register
								here</button>



						</form>
					</div>

				</div>

			</div>


		</div>

	</div>
</body>
</html>