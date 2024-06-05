package com.validation;

public class UserValidation {
	
	public static  boolean checkName(String name)
	{
		boolean flag=true;
		if(name==null)
		{
			flag=false;
		}
		else if(name.length()==0 || name.length()>45)
		{
			flag=false;
		}
		return flag;
	}
	
	

}