package com.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.AppointmentDao;
import com.entities.Appointment;

public class AppointmentDaoImpl implements AppointmentDao 
{
    private Connection connection;
    private PreparedStatement preparedStatement;
    public AppointmentDaoImpl(Connection connection) 
    {
		this.connection=connection;
	}
    
    public boolean addAppointment(Appointment appointment)
    {
    	boolean flag=false;
    	try 
    	{
    		 String query="insert into appointment (userId,name,gender,age,appointDate,email,phone,disease,doctorId,address,status)"
    		 		+ "values(?,?,?,?,?,?,?,?,?,?,?)";
    		 
    		preparedStatement=connection.prepareStatement(query);
    		preparedStatement.setInt(1, appointment.getUserId());
    		preparedStatement.setString(2, appointment.getName());
    		preparedStatement.setString(3, appointment.getGender());
    		preparedStatement.setInt(4,appointment.getAge());
    		preparedStatement.setString(5, appointment.getAppointDate());
    		preparedStatement.setString(6, appointment.getEmail());
    		preparedStatement.setString(7, appointment.getPhone());
    		preparedStatement.setString(8, appointment.getDisease());
    		preparedStatement.setInt(9, appointment.getDoctorId());
    		preparedStatement.setString(10, appointment.getAddress());
    		preparedStatement.setString(11, appointment.getStatus());
    		preparedStatement.setString(12, appointment.getBill());
    		int result = preparedStatement.executeUpdate();
    		flag=(result>0)?true:false;
			
		} 
    	catch (Exception e) 
    	{
			e.printStackTrace();
		}
    	return flag;
    }

	@Override
	public List<Appointment> getAllAppointments(int userId) 
	{
		List<Appointment> list=new ArrayList<>();
		Appointment appointment=null;
		
		try 
		{
			String query="select * from appointment where userId=?";
			preparedStatement=connection.prepareStatement(query);
			
			preparedStatement.setInt(1, userId);
			
			ResultSet result = preparedStatement.executeQuery();
			while(result.next())
			{
				 appointment=new Appointment();
				 appointment.setId(result.getInt(1));
				 appointment.setUserId(result.getInt(2));
				 appointment.setName(result.getString(3));
				 appointment.setGender(result.getString(4));
				 appointment.setAge(result.getInt(5));
				 appointment.setAppointDate(result.getString(6));
				 appointment.setEmail(result.getString(7));
				 appointment.setPhone(result.getString(8));
				 appointment.setDisease(result.getString(9));
				 appointment.setDoctorId(result.getInt(10));
				 appointment.setAddress(result.getString(11));
				 appointment.setStatus(result.getString(12));
				 
				 list.add(appointment);
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Appointment> getAllAppointmentsOfLoginDoctor(int doctorId) {
		

		List<Appointment> list=new ArrayList<>();
		Appointment appointment=null;
		
		try 
		{
			String query="select * from appointment where doctorId=?";
			preparedStatement=connection.prepareStatement(query);
			
			preparedStatement.setInt(1, doctorId);
			
			ResultSet result = preparedStatement.executeQuery();
			while(result.next())
			{
				 appointment=new Appointment();
				 appointment.setId(result.getInt(1));
				 appointment.setUserId(result.getInt(2));
				 appointment.setName(result.getString(3));
				 appointment.setGender(result.getString(4));
				 appointment.setAge(result.getInt(5));
				 appointment.setAppointDate(result.getString(6));
				 appointment.setEmail(result.getString(7));
				 appointment.setPhone(result.getString(8));
				 appointment.setDisease(result.getString(9));
				 appointment.setDoctorId(result.getInt(10));
				 appointment.setAddress(result.getString(11));
				 appointment.setStatus(result.getString(12));
				 appointment.setBill(result.getString(13));
				 
				 list.add(appointment);
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return list;
		
		
	}

	@Override
	public Appointment getAppointmentById(int appointmentId) {
		
		Appointment appointment=null;
		
		try 
		{
			String query="select * from appointment where id=?";
			preparedStatement=connection.prepareStatement(query);
			
			preparedStatement.setInt(1, appointmentId);
			
			ResultSet result = preparedStatement.executeQuery();
			while(result.next())
			{
				 appointment=new Appointment();
				 appointment.setId(result.getInt(1));
				 appointment.setUserId(result.getInt(2));
				 appointment.setName(result.getString(3));
				 appointment.setGender(result.getString(4));
				 appointment.setAge(result.getInt(5));
				 appointment.setAppointDate(result.getString(6));
				 appointment.setEmail(result.getString(7));
				 appointment.setPhone(result.getString(8));
				 appointment.setDisease(result.getString(9));
				 appointment.setDoctorId(result.getInt(10));
				 appointment.setAddress(result.getString(11));
				 appointment.setStatus(result.getString(12));
				 
				 
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return appointment;
	}

	@Override
	public boolean updateCommentStatus(int id, int doctorId, String comment) {
		
		boolean flag=false;
		try 
		{
			String query="update appointment set status=? where id=? and doctorId=?";
			preparedStatement=connection.prepareStatement(query);
			preparedStatement.setString(1, comment);
			preparedStatement.setInt(2, id);
			preparedStatement.setInt(3, doctorId);
			
			int result = preparedStatement.executeUpdate();
			flag=(result>0) ? true : false;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Appointment> getAllAppointments() 
	{
		
		List<Appointment> list=new ArrayList<>();
		Appointment appointment=null;
    	try 
    	{
    		 String query="select * from appointment order by id desc";
    		 
    		preparedStatement=connection.prepareStatement(query);
    		ResultSet result = preparedStatement.executeQuery();
    		while(result.next())
			{
				 appointment=new Appointment();
				 appointment.setId(result.getInt(1));
				 appointment.setUserId(result.getInt(2));
				 appointment.setName(result.getString(3));
				 appointment.setGender(result.getString(4));
				 appointment.setAge(result.getInt(5));
				 appointment.setAppointDate(result.getString(6));
				 appointment.setEmail(result.getString(7));
				 appointment.setPhone(result.getString(8));
				 appointment.setDisease(result.getString(9));
				 appointment.setDoctorId(result.getInt(10));
				 appointment.setAddress(result.getString(11));
				 appointment.setStatus(result.getString(12));
				 list.add(appointment);
				 
			}
    	} 
    	catch (Exception e) 
    	{
			e.printStackTrace();
		}
    	return list;
	}

	@Override
	public int countAppointments() 
	{
		int noOfAppointments=0;
		try 
		{
			String query="select * from appointment";
			preparedStatement=connection.prepareStatement(query);
			ResultSet result = preparedStatement.executeQuery();
			while(result.next())
			{
				noOfAppointments++;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return noOfAppointments;
	}

	@Override
	public boolean updateBill(int id) 
	{
		boolean flag=false;
		try 
		{
			String query="update appointment set bill= ? where id=?";
			preparedStatement=connection.prepareStatement(query);
			preparedStatement.setString(1, "Generated");
			preparedStatement.setInt(2, id);
			
			int result = preparedStatement.executeUpdate();
			
			flag=(result>0)? true:false;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return flag;
	}
    
    
}