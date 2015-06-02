package com.aug.hr.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.LoginDao;
import com.aug.hr.entity.Login;
import com.aug.hr.entity.Official;
import com.aug.hr.services.LoginService;

@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService{

	@Autowired private LoginDao loginDao;
	
	@Override
	public void create(Login login) {
		loginDao.create(login);
		
	}

	@Override
	public void update(Login login) {
		loginDao.update(login);
	}

	@Override
	public void delete(Login login) {
		loginDao.delete(login);
	}

	@Override
	public Login find(Integer id) {
		return loginDao.find(id);
	}

	@Override
	public List<Login> findAll() {
		return loginDao.findAll();
	}

	@Override
	public Login findByUserName(String name) {
		return loginDao.findByUserName(name);
	}

	@Override
	public Login deleteById(Integer id) {
		return loginDao.deleteById(id);
	}
	
	@Override
	public Login searhEmpIdtoLogin() {		
		return loginDao.searhEmpIdtoLogin();
	}

}
