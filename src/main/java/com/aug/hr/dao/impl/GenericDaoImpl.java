/**
 *
 * @author Ekkachai.K
 * @date 2 December 2014
 */
package com.aug.hr.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;

import com.aug.hr.dao.GenericDao;


public class GenericDaoImpl<E, I extends Serializable> implements GenericDao<E, I> {
    private Class<E> entityClass;

    @Autowired
    private SessionFactory sessionFactory;

    public GenericDaoImpl(Class<E> entityClass) {
        this.entityClass = entityClass;
    }

    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("unchecked")
    public List<E> findAll() throws DataAccessException {
        return getCurrentSession().createCriteria(entityClass).list();
    }

    @SuppressWarnings("unchecked")
    public E find(I id) {
        return (E) getCurrentSession().get(entityClass, id);
    }

    public void create(E e) {
        getCurrentSession().save(e);
    }

    public void update(E e)  {
        getCurrentSession().update(e);
    }

    public void delete(E e) {
        getCurrentSession().delete(e);
    }

    public void flush() {
        getCurrentSession().flush();
    }
}