<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-info">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i class="fas fa-clinic-medical"></i> HEALTH GATEWAY</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
			
			<c:if test="${empty userObject }">
				<li class="nav-item">
				    <a class="nav-link active"
				    aria-current="page" href="admin_login.jsp"><i class="fa-solid fa-right-to-bracket"></i> ADMIN</a>
				</li>
				<li class="nav-item">
				    <a class="nav-link active"
				    aria-current="page" href="doctor_login.jsp"><i class="fa-solid fa-user-doctor"></i> DOCTOR</a>
				</li>
				<li class="nav-item">
				    <a class="nav-link active"
				    aria-current="page" href="user_appointment.jsp"><i class="fa-solid fa-calendar-check"></i> APPOINTMENT</a>
				</li>
				<li class="nav-item">
				    <a class="nav-link active"
				    aria-current="page" href="user_login.jsp"><i class="fa-solid fa-user"></i> USER</a>
				</li>
			</c:if>	
				
				<c:if test="${not empty userObject }">
				<li class="nav-item">
				    <a class="nav-link active"
				    aria-current="page" href="user_appointment.jsp"><i class="fa-solid fa-calendar-check"></i> APPOINTMENT</a>
				</li>
				<li class="nav-item">
				    <a class="nav-link active"
				    aria-current="page" href="view_appointment.jsp"><i class="fa-solid fa-calendar-check"></i> VIEW APPOINTMENT</a>
				</li>
				 <li class="nav-item dropdown">
				 <button
					class="btn  active btn-light dropdown-toggle"  id="navbarDropdown"
					type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-user-circle"></i>
						${userObject.userName}</button>
						
					<ul class="dropdown-menu mt-2" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="changePassword.jsp"> Change Password </a></li>
						<li><a class="dropdown-item" href="userLogout"> Logout  </a></li>
						
						
					</ul>
			     </li> 
			    </c:if>
			</ul>
			
			
			
			<!-- <form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-warning" type="submit">Search</button>
			</form> -->
		</div>
	</div>
</nav>