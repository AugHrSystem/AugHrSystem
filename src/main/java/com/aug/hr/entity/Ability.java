/**
 *
 * @author Pranrajit
 * @date 20 เม.ย. 2558
 */
package com.aug.hr.entity;


import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Id;
import javax.persistence.Entity;
import javax.persistence.Table;




@Entity
@Table(name="EMP_ABILITY")
public class Ability extends BaseEntity  {
	

	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;


	@Column(name = "RANK",nullable = false)
	private Integer rank;
	
	@Column(name = "PICTURE",nullable = true)
    private String picture;
	
	/*@ManyToOne(fetch=FetchType.EAGER)
	 @JoinColumn(name="OFFICIAL_ID" , referencedColumnName="id")
	 private Official official;*/
	

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "EMPLOYEE_ID",nullable = false,referencedColumnName="id")
	private Employee employee;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "SPECIALTY_ID",nullable = false,referencedColumnName="SPEC_ID")

//	@JsonIgnore
	private MasSpecialty masspecialty;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	
	public Integer getRank() {
		return rank;
	}


	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public MasSpecialty getMasspecialty() {
		return masspecialty;
	}

	public void setMasspecialty(MasSpecialty masspecialty) {
		this.masspecialty = masspecialty;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
 
	
}
