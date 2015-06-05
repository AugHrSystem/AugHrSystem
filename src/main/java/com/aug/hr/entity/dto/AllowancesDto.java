/**
 *
 * @author Preeyaporn
 * @date 3 มิ.ย. 2558
 */
package com.aug.hr.entity.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@NamedNativeQueries({
	@NamedNativeQuery(
			name="searchAllowances",
			query="select a.id,a.allowances_type,a.amount_allowances,a.employeeId from emp_allowances as a,emp_employee as emp where a.employee_id=:empId  and a.employee_id = emp.id",																																																																					
			resultClass = EducationDto.class)
			
})

@Entity
public class AllowancesDto {

	@Column(name ="ID")
	@Id
	private Integer id;
	@Column(name = "AMOUNT")
	private Double amount;
	@Column(name = "NAME" )
	private String masallowances;
	@Column(name ="EMPLOYEE_ID")
	private Integer employeeId;
	@Column(name ="AllO_ID")
	private Integer masAllowancesId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMasallowances() {
		return masallowances;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public void setMasallowances(String masallowances) {
		this.masallowances = masallowances;
	}
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	public Integer getMasAllowancesId() {
		return masAllowancesId;
	}
	public void setMasAllowancesId(Integer masAllowancesId) {
		this.masAllowancesId = masAllowancesId;
	}
	
}
