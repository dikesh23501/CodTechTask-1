package com.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.DoctorDao;
import com.entities.Doctor;

public class DoctorDaoImpl implements DoctorDao 
{

	private Connection connection;
	private PreparedStatement preparedStatement;
	
	public DoctorDaoImpl(Connection connection)
	{
		this.connection=connection;
	}
	
	@Override
	public boolean addDoctor(Doctor doctor) 
	{
		boolean flag=false;
		try 
		{
			String query="insert into doctor (doctorName,dob,doctorQualification,specialist,doctorEmail,doctorPhone,doctorPassword) values(?,?,?,?,?,?,?);";
		    preparedStatement = connection.prepareStatement(query);
		    
		    preparedStatement.setString(1, doctor.getDoctorName());
		    preparedStatement.setString(2, doctor.getDoctorDob());
		    preparedStatement.setString(3, doctor.getDoctorQualification());
		    preparedStatement.setString(4, doctor.getSpecialist());
		    preparedStatement.setString(5, doctor.getDoctorEmail());
		    preparedStatement.setString(6, doctor.getDoctorPhone());
		    preparedStatement.setString(7, doctor.getDoctorPassword());
		    
		    int result = preparedStatement.executeUpdate();
		    
		    flag=(result>0)?true: false;
		    
		  } 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Doctor> getAllDoctor() 
	{
		List<Doctor> list=new ArrayList<>();
		Doctor doctor=null;
		try 
		{
			String query="select * from doctor order by id desc";
			preparedStatement=connection.prepareStatement(query);
			ResultSet result = preparedStatement.executeQuery();
			
			while(result.next())
			{
				 doctor=new Doctor();
				 doctor.setDoctorId(result.getInt(1)); 
				 doctor.setDoctorName(result.getString(2));
				 doctor.setDoctorDob(result.getString(3));
				 doctor.setDoctorQualification(result.getString(4));
				 doctor.setSpecialist(result.getString(5));
				 doctor.setDoctorEmail(result.getString(6));
				 doctor.setDoctorPhone(result.getString(7));
				 doctor.setDoctorPassword(result.getString(8));
				 
				 list.add(doctor);
				 
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Doctor getSingleDoctor(int id) 
	{
		Doctor doctor=null;
		try 
		{
			String query="select * from doctor where id = ? ";
			preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			
			ResultSet result = preparedStatement.executeQuery();
			while(result.next())
			{
		     doctor=new Doctor();
			 doctor.setDoctorId(result.getInt(1)); 
			 doctor.setDoctorName(result.getString(2));
			 doctor.setDoctorDob(result.getString(3));
			 doctor.setDoctorQualification(result.getString(4));
			 doctor.setSpecialist(result.getString(5));
			 doctor.setDoctorEmail(result.getString(6));
			 doctor.setDoctorPhone(result.getString(7));
			 doctor.setDoctorPassword(result.getString(8));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return doctor;
	}

	@Override
	public boolean updateDoctor(Doctor doctor) 
	{
		boolean flag=false;
		try 
		{
			String query="update doctor set doctorName=?,dob=?,doctorQualification=?,specialist=?,doctorEmail=?,doctorPhone=?,doctorPassword=?  where id=?";
		    preparedStatement = connection.prepareStatement(query);
		    
		    preparedStatement.setString(1, doctor.getDoctorName());
		    preparedStatement.setString(2, doctor.getDoctorDob());
		    preparedStatement.setString(3, doctor.getDoctorQualification());
		    preparedStatement.setString(4, doctor.getSpecialist());
		    preparedStatement.setString(5, doctor.getDoctorEmail());
		    preparedStatement.setString(6, doctor.getDoctorPhone());
		    preparedStatement.setString(7, doctor.getDoctorPassword());
		    preparedStatement.setInt(8, doctor.getDoctorId());
		    
		    int result = preparedStatement.executeUpdate();
		    
		    flag=(result>0)?true: false;
		    
		  } 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean deleteDoctor(int id) 
	{
		boolean flag=false;
		try 
		{
			String query="delete from doctor where id=?";
			preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			
			int isDeleted=preparedStatement.executeUpdate();
			flag=(isDeleted>0) ? true : false;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public Doctor validDoctor(String email, String password) 
	{
		Doctor doctor=null;
		try 
		{
			String query="select * from doctor where doctorEmail=? and doctorPassword=?";
			preparedStatement=connection.prepareStatement(query);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			
			ResultSet result = preparedStatement.executeQuery();
			while(result.next())
			{
				 doctor=new Doctor();
				 doctor.setDoctorId(result.getInt(1)); 
				 doctor.setDoctorName(result.getString(2));
				 doctor.setDoctorDob(result.getString(3));
				 doctor.setDoctorQualification(result.getString(4));
				 doctor.setSpecialist(result.getString(5));
				 doctor.setDoctorEmail(result.getString(6));
				 doctor.setDoctorPhone(result.getString(7));
				 doctor.setDoctorPassword(result.getString(8));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return doctor;
	}

	@Override
	public int countDoctor() 
	{
	    int noOfDoctors=0;
	    try 
	    {
			String query="select * from doctor";
			preparedStatement=connection.prepareStatement(query);
			ResultSet result = preparedStatement.executeQuery();
			while(result.next())
			{
				noOfDoctors++;
			}
		} 
	    catch (Exception e) 
	    {
			e.printStackTrace();
		}
		return noOfDoctors;
	}

	@Override
	public int countAppointmentsOfPatientById(int doctorId) {
		
		int noOfAppointmentsByDoctor=0;
		try 
		{
			String query="select * from appointment where doctorId=?";
			preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1, doctorId);
			
			ResultSet result = preparedStatement.executeQuery();
			while(result.next())
			{
				noOfAppointmentsByDoctor++;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return noOfAppointmentsByDoctor;
	}

	@Override
	public boolean checkOldPassword(int doctorId, String oldPassword) {
		
		boolean flag=false;
		try 
		{
			String query="select * from doctor where id=? and doctorPassword=?";
			preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1, doctorId);
			preparedStatement.setString(2, oldPassword);
			
			ResultSet result = preparedStatement.executeQuery();
			if(result.next())
			{
				flag=true;
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return flag;
		
	}

	@Override
	public boolean changePassword(int doctorId, String newPassword) {
		
		boolean flag=false;
		try 
		{
			String query="update doctor set doctorPassword=? where id=?";
			preparedStatement=connection.prepareStatement(query);
			preparedStatement.setString(1, newPassword);
			preparedStatement.setInt(2, doctorId);
			
			int result = preparedStatement.executeUpdate();
			if(result>0)
			{
				flag=true;
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean editDoctor(Doctor doctor) 
	{
		boolean flag=false;
		try 
		{
			String query="update doctor set doctorName=?,dob=?,doctorQualification=?,specialist=?,doctorPhone=? where id=?";
		    preparedStatement = connection.prepareStatement(query);
		    
		    preparedStatement.setString(1, doctor.getDoctorName());
		    preparedStatement.setString(2, doctor.getDoctorDob());
		    preparedStatement.setString(3, doctor.getDoctorQualification());
		    preparedStatement.setString(4, doctor.getSpecialist());
		    preparedStatement.setString(5, doctor.getDoctorPhone());
		    preparedStatement.setInt(6, doctor.getDoctorId());
		    
		    int result = preparedStatement.executeUpdate();
		    
		    flag=(result>0)?true: false;
		    
		  } 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return flag;
	}

	

}
