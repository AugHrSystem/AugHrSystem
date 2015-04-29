/**
 *
 * @author Pranrajit
 * @date 22 เม.ย. 2558
 */
package com.aug.hr.entity;

import java.util.Set;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "DEGREETYPE")
public class MasDegreetype {

	@Id
	@Column(name = "ID", length = 10)
	@GeneratedValue
	private Integer id;

	@Column(name = "NAME", nullable = false, length = 200)
	private String name;
	
	@Column(name = "CODE",nullable =false)
	private String code;
	
	@Column(name = "ISACTIVE" ,nullable =false)
	private String isactive;
	
	@OneToMany(mappedBy = "masdegreetype")
	private Set<Education> educations;

	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getIsactive() {
		return isactive;
	}

	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}

	public Set<Education> getEducations() {
		return educations;
	}

	public void setEducations(Set<Education> educations) {
		this.educations = educations;
	}

	
	
}
