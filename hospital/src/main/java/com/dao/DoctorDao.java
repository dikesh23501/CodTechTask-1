package com.dao;

import java.util.List;

import com.entities.Doctor;

public interface DoctorDao {
	
	public boolean addDoctor(Doctor doctor);
	public List<Doctor> getAllDoctor();
	public Doctor getSingleDoctor(int id);
	public boolean updateDoctor(Doctor doctor);
	public boolean deleteDoctor(int id);
	public Doctor validDoctor(String email,String password);
	public int countDoctor();
	public int countAppointmentsOfPatientById(int doctorId);
	public boolean checkOldPassword(int userId,String oldPassword);
    public boolean changePassword(int userId, String newPassword);
    public boolean editDoctor(Doctor doctor);
}