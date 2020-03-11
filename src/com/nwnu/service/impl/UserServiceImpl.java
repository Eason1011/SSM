package com.nwnu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nwnu.dao.UserDao;
import com.nwnu.pojo.User;
import com.nwnu.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	@Override
	public User findUser(String code, String password) {
		
		User user=this.userDao.findUser(code, password);
		return user;
	}

}
