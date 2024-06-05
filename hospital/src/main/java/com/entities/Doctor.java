package com.entities;

public class Doctor {
	private int doctorId;
	private String doctorName;
	private String doctorDob;
	private String doctorQualification;
	private String specialist;
	private String doctorEmail;
	private String doctorPassword;
	private String doctorPhone;

	public Doctor() {
		super();

	}

	public Doctor(String doctorName, String doctorDob, String doctorQualification, String specialist,
			String doctorEmail, String doctorPassword, String doctorPhone) {
		super();
		this.doctorName = doctorName;
		this.doctorDob = doctorDob;
		this.doctorQualification = doctorQualification;
		this.specialist = specialist;
		this.doctorEmail = doctorEmail;
		this.doctorPassword = doctorPassword;
		this.doctorPhone = doctorPhone;
	}
	

	public Doctor(int doctorId, String doctorName, String doctorDob, String doctorQualification, String specialist,
			String doctorEmail, String doctorPassword, String doctorPhone) {
		super();
		this.doctorId = doctorId;
		this.doctorName = doctorName;
		this.doctorDob = doctorDob;
		this.doctorQualification = doctorQualification;
		this.specialist = specialist;
		this.doctorEmail = doctorEmail;
		this.doctorPassword = doctorPassword;
		this.doctorPhone = doctorPhone;
	}

	public Doctor(int doctorId,String doctorName, String doctorDob, String doctorQualification, String specialist, String doctorPhone) {
		super();
		this.doctorId=doctorId;
		this.doctorName = doctorName;
		this.doctorDob = doctorDob;
		this.doctorQualification = doctorQualification;
		this.specialist = specialist;
		this.doctorPhone = doctorPhone;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getDoctorDob() {
		return doctorDob;
	}

	public void setDoctorDob(String doctorDob) {
		this.doctorDob = doctorDob;
	}

	public String getDoctorQualification() {
		return doctorQualification;
	}

	public void setDoctorQualification(String doctorQualification) {
		this.doctorQualification = doctorQualification;
	}

	public String getSpecialist() {
		return specialist;
	}

	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}

	public String getDoctorEmail() {
		return doctorEmail;
	}

	public void setDoctorEmail(String doctorEmail) {
		this.doctorEmail = doctorEmail;
	}

	public String getDoctorPassword() {
		return doctorPassword;
	}

	public void setDoctorPassword(String doctorPassword) {
		this.doctorPassword = doctorPassword;
	}

	public String getDoctorPhone() {
		return doctorPhone;
	}

	public void setDoctorPhone(String doctorPhone) {
		this.doctorPhone = doctorPhone;
	}

}