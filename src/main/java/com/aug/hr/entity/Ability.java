/**
 *
 * @author Pranrajit
 * @date 20 เม.ย. 2558
 */
package com.aug.hr.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Id;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.mapping.Set;
import org.springframework.stereotype.Repository;

@Entity
@Table(name="Ability")
@Repository
public class Ability extends BaseEntity implements Serializable {
	
	public Ability() {}
	
	@Id
	@Column(name="ID",unique=true,length=10)
	@GeneratedValue
	private Integer id;
	
	
	@ManyToOne
	@JoinColumn(name = "Emp_ID" ,referencedColumnName="ID")
	private Employee employee;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "Special", cascade=CascadeType.ALL, orphanRemoval=true)
	private Set<Special> specials;

	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	public Set<Special> getSpecials() {
		return specials;
	}

	public void setSpecials(Set<Special> specials) {
		this.specials = specials;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
 
	
	

}
