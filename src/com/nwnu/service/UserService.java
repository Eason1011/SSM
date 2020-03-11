package com.nwnu.service;

import com.nwnu.common.utils.Page;
import com.nwnu.pojo.Student;
import com.nwnu.pojo.User;

public interface UserService {

	public User findUser(String code,String password);

}
