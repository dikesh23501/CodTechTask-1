package com.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dao.UserDao;
import com.entities.User;

public class UserDaoImpl implements UserDao {
	
	private Connection connection;
	private PreparedStatement statement;
	
	public UserDaoImpl( Connection connection) 
	{
		this.connection=connection;
	}

	@Override
	public boolean insert(User user)
	{
		
		boolean flag=false;
		try 
		{
			//creting query
			String query="insert into user_dtls (userName,userEmail,userPassword,userPhone,userAddress)values(?,?,?,?,?)";
		    
			//passing query to prepareStatement()
			PreparedStatement statement = connection.prepareStatement(query);
		    
			//passing dynamic value to each column
			statement.setString(1, user.getUserName());
		    statement.setString(2, user.getUserEmail());
		    statement.setString(3, user.getUserPassword());
		    statement.setString(4, user.getUserPhone());
		    statement.setString(5, user.getUserAddress());
		    
		    //execuating statement
		    int result = statement.executeUpdate();
		    flag=(result>0)?true: false;
		
		
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public User validUserOrNot(String email, String password) 
	{
		User user=null;
		try 
		{
			String query="select * from user_dtls where userEmail=? and userPassword=?";
			PreparedStatement statement = connection.prepareStatement(query);
		    statement.setString(1, email);
		    statement.setString(2, password);
		    
		    ResultSet result = statement.executeQuery();
		    while(result.next())
		    {
		    	  user=new User();
		    	  user.setUserId(result.getInt(1));
		    	  user.setUserName(result.getString(2));
		    	  user.setUserEmail(result.getString(3));
		    	  user.setUserPassword(result.getString(4));
		    	  user.setUserPhone(result.getString(5));
		    	  user.setUserAddress(result.getString(6));
		    }
		
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public int countUser() 
	{
		int noOfUsers=0;
		try 
		{
			 String query="select * from userdetails";
			 statement=connection.prepareStatement(query);
			 ResultSet results = statement.executeQuery();
			 while(results.next())
			 {
				 noOfUsers++;
			 }
			 
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return noOfUsers;
	}

	@Override
	public boolean checkOldPassword(int userId, String oldPassword) {
		
		boolean flag=false;
		try 
		{
			String query="select * from userDetails where userId=? and userPassword=?";
			statement=connection.prepareStatement(query);
			statement.setInt(1, userId);
			statement.setString(2, oldPassword);
			
			ResultSet result = statement.executeQuery();
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
	public boolean changePassword(int userId, String newPassword) {
		boolean flag=false;
		try 
		{
			String query="update userdetails set userPassword=? where userId=?";
			statement=connection.prepareStatement(query);
			statement.setString(1, newPassword);
			statement.setInt(2, userId);
			
			int result = statement.executeUpdate();
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

	
}
