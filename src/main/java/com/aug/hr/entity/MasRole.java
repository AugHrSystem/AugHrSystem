package com.aug.hr.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "MAS_ROLE")
public class MasRole extends BaseEnityMasterData{
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	private Integer id;
	
	@Column(name="TYPE",nullable = false)
	private String type;
	
	@OneToMany(mappedBy = "masRole")
	private Set<Login> logins = new HashSet<Login>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Set<Login> getLogins() {
		return logins;
	}

	public void setLogins(Set<Login> logins) {
		this.logins = logins;
	}
	
	
}
