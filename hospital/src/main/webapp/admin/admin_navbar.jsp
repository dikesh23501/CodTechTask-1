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
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
				    <a class="nav-link active"
				    aria-current="page" href="index.jsp">HOME</a>
				</li>
				<li class="nav-item">
				    <a class="nav-link active"
				    aria-current="page" href="doctor.jsp">DOCTOR</a>
				</li>
				<li class="nav-item">
				    <a class="nav-link active"
				    aria-current="page" href="view_doctor.jsp">VIEW DOCTOR</a>
				</li>
				<li class="nav-item">
				    <a class="nav-link active"
				    aria-current="page" href="patientAppointmentDetails.jsp">PATIENT</a>
				</li>
				
				</ul>
				
				<div class="dropdown">
                <button class="btn btn-light dropdown-toggle" 
                        type="button" 
                        id="dropdownMenuButton1" 
                        data-bs-toggle="dropdown" 
                        aria-expanded="false">
                        <i class="fa-solid fa-right-to-bracket"></i> Admin
                </button>
                 <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                 <li><a class="dropdown-item" href="../adminlogout">Logout</a></li>
                 </ul>
               </div>
				
		</div>
	</div>
</nav>