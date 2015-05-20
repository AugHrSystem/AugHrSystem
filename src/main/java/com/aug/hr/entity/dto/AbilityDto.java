/**
 *
 * @author Pranrajit
 * @date 19 พ.ค. 2558
 */
package com.aug.hr.entity.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;








@NamedNativeQueries({
	@NamedNativeQuery(
			name="searchAbility",
			query="select ability.id,ability.rank,mas_specialty.name,ability.employee_id,emp.employee_code from emp_ability as ability ,emp_employee as emp, mas_specialty where ability.employee_id=:empId and ability.employee_id = emp.id and mas_specialty.SPEC_ID = ability.specialty_id",
			resultClass = AbilityDto.class)
			
	
	
	
	
})

@Entity
public class AbilityDto {
	@Column(name="ID")
	@Id
	private Integer id;
	@Column(name = "RANK",nullable = false)
	private Integer rank;
	@Column(name = "NAME")
	private String masspecialty;
	@Column(name ="EMPLOYEE_ID")
	private String employeeId;	
	@Column(name = "EMPLOYEE_CODE")
	private String employeeCode;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	public String getMasspecialty() {
		return masspecialty;
	}

	public void setMasspecialty(String masspecialty) {
		this.masspecialty = masspecialty;
	}



	
	
	
	
}
