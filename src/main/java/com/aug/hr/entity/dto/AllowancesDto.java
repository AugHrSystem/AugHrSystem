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
	@Column(name = "ALLOWANCES_TYPE")
	private String allowances_type;
	@Column(name = "AMOUNT_ALLOWANCES")
	private String amount_allowances;
	@Column(name ="EMPLOYEE_ID")
	private Integer employeeId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAllowances_type() {
		return allowances_type;
	}
	public void setAllowances_type(String allowances_type) {
		this.allowances_type = allowances_type;
	}
	public String getAmount_allowances() {
		return amount_allowances;
	}
	public void setAmount_allowances(String amount_allowances) {
		this.amount_allowances = amount_allowances;
	}
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	
}
