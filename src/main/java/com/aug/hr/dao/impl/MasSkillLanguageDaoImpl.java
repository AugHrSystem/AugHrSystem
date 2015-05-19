package com.aug.hr.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.hr.dao.MasSkillLanguageDao;
import com.aug.hr.entity.MasSkillLanguage;

@Repository
public class MasSkillLanguageDaoImpl extends GenericDaoImpl<MasSkillLanguage, Integer> implements Serializable,MasSkillLanguageDao{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1257834078761431174L;

	public MasSkillLanguageDaoImpl() {
		super(MasSkillLanguage.class);
		// TODO Auto-generated constructor stub
	}

}
