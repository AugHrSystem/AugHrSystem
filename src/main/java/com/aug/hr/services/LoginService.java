package com.aug.hr.services;

import java.util.List;

import com.aug.hr.entity.Login;

public interface LoginService {
	
	public void create(Login login);
	public void update(Login login);
	public void delete(Login login);
	public Login find(Integer id);
	public List<Login> findAll();
	public Login findByUserName(String name);
	public Login deleteById(Integer id);

}
