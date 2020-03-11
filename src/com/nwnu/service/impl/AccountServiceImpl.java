package com.nwnu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nwnu.dao.AccountDao;
import com.nwnu.pojo.Account;
import com.nwnu.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountDao accountDao;
	@Override
	public Account findAccountById(int id) {
		return accountDao.findAccountById(id);
	}

}
