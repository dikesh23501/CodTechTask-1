package com.db;

import java.sql.Connection;

import com.helper.ConnectionProvider;

public class DBConnection {
	
	private static Connection connection;
	private DBConnection() {}
	
	public static Connection getConnection()
	{
		if(connection == null)
		{
		 connection = ConnectionProvider.getConnection();
		  
		}
		//System.out.println(connection);
		return connection;
	}
}