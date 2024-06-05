package com.dao;

import com.entities.User;

public interface UserDao {
	
	boolean insert(User user);
	
	public User validUserOrNot(String email,String passowrd);
	public int countUser();
	public boolean checkOldPassword(int userId,String oldPassword);
    public boolean changePassword(int userId, String newPassword);

}