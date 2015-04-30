/**
 *
 * @author Pranrajit
 * @date 20 เม.ย. 2558
 */
package com.aug.hr.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

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



@Entity
@Table(name="ABILITY")
public class Ability extends BaseEntity  {
	public Ability() {
	}

	@Id
	@Column(name = "ID", unique = true, length = 10)
	@GeneratedValue
	private Integer id;


	@ManyToOne
	@JoinColumn(name = "EMP_ID")
	private Employee employee;

	@Column(name = "RANK",nullable = false)
	private Integer rank;
	@Column(name = "CODE",nullable = false)
	private String code;
	@Column(name = "ISACTIVE",nullable = false)
	private Boolean isActive;
	
	@ManyToOne
	@JoinColumn(name = "SPEC_ID")
	private MasSpecialty masspecialty;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public MasSpecialty getMasSpecialty() {
		return masspecialty;
	}

	public void setSpecialty(MasSpecialty masspecialty) {
		this.masspecialty = masspecialty;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}


	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
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

	

	
}
