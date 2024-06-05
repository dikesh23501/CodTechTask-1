package com.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.SpecialistDao;
import com.entities.Specialist;


public class SpecialistDaoImpl implements SpecialistDao {

	private  Connection connection;
	private PreparedStatement preparedStatement=null;
	public SpecialistDaoImpl(Connection connection)
	{
		this.connection=connection;
	}
	
	@Override
	public boolean addSpecialist(String specialistName) 
	{
		boolean flag=false;
		try 
		{
			 String query="insert into specialist(specialistName) values (?)";
		     preparedStatement = connection.prepareStatement(query);
		     preparedStatement.setString(1, specialistName);
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
	public List<Specialist> getAllSpecialist() 
	{
		List<Specialist> list=new ArrayList<>();
		Specialist specialist=null;
		
		try 
		{
			 String query="select * from specialist";
			 preparedStatement = connection.prepareStatement(query);
		     ResultSet allSpecialist = preparedStatement.executeQuery();
		     
		     while(allSpecialist.next())
		     {
		    	 specialist=new Specialist();
		    	 specialist.setSpecialistId(allSpecialist.getInt(1));
		    	 specialist.setSpecialistName(allSpecialist.getString(2));
		    	 
		    	 list.add(specialist);
		    	 
		     }
		
		
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int countSpecialists() 
	{
		int noOfSpecialist=0;
	    try 
	    {
			String query="select * from specialist";
			preparedStatement=connection.prepareStatement(query);
			ResultSet result = preparedStatement.executeQuery();
			while(result.next())
			{
				noOfSpecialist++;
			}
		} 
	    catch (Exception e) 
	    {
			e.printStackTrace();
		}
		return noOfSpecialist;
		
	}

}