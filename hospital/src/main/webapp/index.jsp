
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index page</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	
	
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/team.jpg" class="d-block w-100" height="640px"
					alt="image not found">
			</div>
			<div class="carousel-item">
				<img src="img/doctor1.jpg" class="d-block w-100" height="640px"
					alt="image not found">
			</div>
			<div class="carousel-item">
				<img src="img/doctor4.png" class="d-block w-100" height="640px"
					alt="image not found">
			</div>

		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container p-3">
		<p class="text-center fs-2">Key Feature of our hospital</p>

		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">

					<!-- col-1 -->
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>To keep staff,patients and visitors safe, our hospital use
								a range of security measures,including the use of CCTV cameras,duress alarms 
								for staff members and electronic access control systems for doorways.</p>
							</div>

						</div>

					</div>

					<!-- col-2 -->
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>There is no seepage on the roofs and walls of the hospital
								.Patients mattresses,furniture,fixtures are without 
								grease and dust.There is no foul smell in any are
								of the our hospital.</p>
							</div>

						</div>

					</div>
					<br>
					<!-- col-1 -->
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Frindely Doctors</p>
								<p>Our hospital doctors now making a doctor-patient relationship(DPR)
								.So that it can be considered as the core element in the ethical principal of medicine.</p>
							</div>

						</div>

					</div>

					<!-- col-2 -->
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Reasearch</p>
								<p>MR is now provided by our hospital which is a feature of teaching
								hospitals and medical schools,where scientists and physicians work
								to develop new treatments and innovations.</p>
							</div>

						</div>

					</div>

				</div>



			</div>

			<div class="col-md-4">
				<img src="img/doctor3.png" width="100%" height="460px"
					alt="imgae not found">
			</div>

		</div>

	</div>

	<hr>

	<div class="container p-2">
		<p class="text-center fs-2 ">Our Team</p>


		<div class="row">

			<!--col-1  -->
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="image not found" src="img/doctor5.png" width="250px"
							height="300px">
						<p class="fw-bold fs-5">Dr Carolina Schneider</p>
						<p class="fw-bold fs-7">(Psychiatrist)</p>
					</div>
				</div>
			</div>

			<!--col-2  -->
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="image not found" src="img/doctor6.png" width="250px"
							height="300px">
						<p class="fw-bold fs-5">Dr Hilary Jones</p>
						<p class="fw-bold fs-7">(Dentist)</p>
					</div>
				</div>
			</div>

			<!--col-3  -->
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="image not found" src="img/doctor7.png" width="250px"
							height="300px">
						<p class="fw-bold fs-5">Dr Billy Wong</p>
						<p class="fw-bold fs-7">(Heart Specialist)</p>
					</div>
				</div>
			</div>

			<!--col-4  -->
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="image not found" src="img/doctor8.png" width="250px"
							height="300px">
						<p class="fw-bold fs-5">Dr Antonio Belloso</p>
						<p class="fw-bold fs-7">(Orthopaedist)</p>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="component/footer.jsp" %>

</body>
</html>