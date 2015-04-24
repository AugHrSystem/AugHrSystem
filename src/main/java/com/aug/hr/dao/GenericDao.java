package com.aug.hr.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.springframework.dao.DataAccessException;

public interface GenericDao <E, I extends Serializable> {
	    public Session getCurrentSession();
	    public List<E> findAll() throws DataAccessException;
	    public E find(I id);
	    public void create(E e);
	    public void update(E e);
	    public void delete(E e);
	    public void flush();
}
