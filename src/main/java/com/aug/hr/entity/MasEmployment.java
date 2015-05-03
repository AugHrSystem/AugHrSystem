/**
 *
 * @author natechanok
 * @date Apr 21, 2015
 */

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
@Table(name = "MASEMPLOYMENT")
public class MasEmployment extends BaseEntity {
	
	@Id
	@Column(name = "ID", length = 10)
	@GeneratedValue
	
	private Integer Id;
	
	@Column(name = "NAME", nullable = false, length = 200)
	private String name;
	
	@Column(name = "CODE", nullable = false)
	private String code;
	
	@Column(name = "ISACTIVE", nullable = false)
	private Boolean isActive;

	
	@OneToMany(mappedBy = "employment")
	private Set<Official> officials = new HashSet<Official>();


	public Integer getId() {
		return Id;
	}


	public void setId(Integer id) {
		Id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public Boolean getIsActive() {
		return isActive;
	}


	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}


	public Set<Official> getOfficials() {
		return officials;
	}


	public void setOfficials(Set<Official> officials) {
		this.officials = officials;
	}


	
	
	
	
	
	

}
