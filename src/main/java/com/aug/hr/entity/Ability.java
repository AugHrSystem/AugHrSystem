/**
 *
 * @author Pranrajit
 * @date 20 เม.ย. 2558
 */
package com.aug.hr.entity;




import javax.persistence.Column;

import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Id;
import javax.persistence.Entity;

import javax.persistence.Table;



@Entity
@Table(name="ABILITY")
public class Ability extends BaseEntity  {
	

	@Id
	@Column(name = "ID", unique = true, length = 10)
	@GeneratedValue
	private Integer id;


	@Column(name = "RANK",nullable = false)
	private Integer rank;

	
	@ManyToOne
	@JoinColumn(name = "EMP_ID")
	private Employee employee;
	
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

	

	

	
}
