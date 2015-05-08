/**
 *
 * @author Preeyaporn
 * @date 21 เม.ย. 2558
 */
package com.aug.hr.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "MASDIVISION")
public class MasDivision extends BaseEntity{
	
	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;
	
	@Column(name = "NAME" ,nullable = false)
	private String name;
	
	@Column(name = "CODE" ,nullable =false)
	private String code;

	@Column(name = "ISACTIVE" ,nullable =false)
	private Boolean isActive;
	
	
	
	 /*@ManyToOne(fetch=FetchType.EAGER)
	 @JoinColumn(name="OFFICIAL_ID" , referencedColumnName="id")
	 private Official official;*/
	
	@OneToMany(mappedBy = "masDivision")
	private Set<Employee> employees;
	
	/*---------------------- getter / setter ----------------------*/

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
	
	

	public Set<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}



	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	
}
