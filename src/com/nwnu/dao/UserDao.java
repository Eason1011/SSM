package com.nwnu.dao;

import org.apache.ibatis.annotations.Param;

import com.nwnu.pojo.User;

public interface UserDao {
	public User findUser(@Param("code") String code,@Param("password") String password);
}
