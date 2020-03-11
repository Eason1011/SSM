package com.nwnu.dao;

import com.nwnu.pojo.Account;

public interface AccountDao {
	//根据ID获取账户信息
	public Account findAccountById(int id);
}
