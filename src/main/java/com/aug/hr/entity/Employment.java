/**
 *
 * @author natechanok
 * @date Apr 21, 2015
 */

package com.aug.hr.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name = "EMPLOYMENT")
public class Employment extends BaseEntity implements Serializable{
	
	@Id
	@Column(name = "ID", length = 10)
	@GeneratedValue
	
	private Integer Id;
	
	@Column(name = "NAME", nullable = false, length = 200)
	private String Name;
	
	@Column(name = "CODE")
	private String code;
	
	@Column(name = "ISACTIVE")
	private Boolean isActive;

	
	@OneToMany(mappedBy = "employment")
	private Set<Employee> employees = new HashSet<Employee>();
	
	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
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

	public Set<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}
	
	

}
