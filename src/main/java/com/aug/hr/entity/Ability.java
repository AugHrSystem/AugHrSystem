/**
 *
 * @author Pranrajit
 * @date 20 เม.ย. 2558
 */
package com.aug.hr.entity;

import java.io.Serializable;
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
@Table(name = "ABILITY")
public class Ability extends BaseEntity implements Serializable {
	public Ability() {
	}

	@Id
	@Column(name = "ID", unique = true, length = 10)
	@GeneratedValue
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "EMP_ID")
	private Employee employee;

	@Column(name = "RANK")
	private Integer rank;
	@Column(name = "CODE")
	private String code;
	@Column(name = "ISACTIVE")
	private Boolean isActive;
	
	@ManyToOne
	@JoinColumn(name = "SPEC_ID")
	private Specialty specialty;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Specialty getSpecialty() {
		return specialty;
	}

	public void setSpecialty(Specialty specialty) {
		this.specialty = specialty;
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