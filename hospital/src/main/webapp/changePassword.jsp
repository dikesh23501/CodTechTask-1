<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChangePassword</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

	<c:if test="${empty userObject }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	<%@include file="component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card mt-3">
				   <p class="text-center fs-3">Update Password</p>
					<div class="card-body">
					 <form action="changePassword" method="post">
					  
					  <!--printing message -->
						<c:if test="${not empty successMsg}">
						  <p class="text-center text-success fs-3">${successMsg}</p>
						  <c:remove var="successMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty errorMsg}">
						  <p class="text-center text-danger fs-3">${errorMsg}</p>
						  <c:remove var="errorMsg" scope="session"/>
						</c:if>
					     <div class="mb-3">
					         <label class="form-label">Enter New Password</label>
					         <input type="text" name="newPassword" class="form-control" required="required">
					     </div>
					     
					     <div class="mb-3">
					         <label class="form-label">Enter Old Password</label>
					         <input type="text" name="oldPassword" class="form-control" required="required">
					     </div>
					      <input type="hidden" value="${userObject.userId}" name="userId">
					     <button class="btn btn-info text-light col-md-12">Change Password</button>
					     
					   </form>
					</div>
				</div>

			</div>
		</div>

	</div>

</body>
</html>