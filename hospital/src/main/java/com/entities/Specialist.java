package com.entities;

public class Specialist {
	private int specialistId;
	private String specialistName;

	public Specialist() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Specialist(int specialistId, String specialistName) {
		super();
		this.specialistId = specialistId;
		this.specialistName = specialistName;
	}

	public int getSpecialistId() {
		return specialistId;
	}

	public void setSpecialistId(int specialistId) {
		this.specialistId = specialistId;
	}

	public String getSpecialistName() {
		return specialistName;
	}

	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}

	@Override
	public String toString() {
		return "Specialist [specialistId=" + specialistId + ", specialistName=" + specialistName + "]";
	}

}
