package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;

import com.db.DBInfo;

public class ConnectionProvider {

	private static Connection connection;
	
	private ConnectionProvider() {}

	public static Connection getConnection() {
		
		if(connection==null)
		{
			try 
			{
				Class.forName(DBInfo.DRIVER);
			    connection=DriverManager.getConnection(DBInfo.URL,DBInfo.USERNAME,DBInfo.PASSWORD);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		
		return connection;

	}

}
