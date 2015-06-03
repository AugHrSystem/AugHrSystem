/**
 *
 * @author Preeyaporn
 * @date 3 มิ.ย. 2558
 */
package com.aug.hr.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "EMP_ALLOWANCES")
public class Allowances extends BaseEntity{

	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;
	
	@Column(name = "ALLOWANCES_TYPE" ,nullable = false)
	private String allowances_type;
	
	@Column(name = "AMOUNT_ALLOWANCES" ,nullable = false)
	private String amount_allowances;

	@ManyToOne()
	@JoinColumn(name = "EMPLOYEE_ID", referencedColumnName="id", nullable = false)
	private Employee employee;
	
	/*---------------------- getter / setter ----------------------*/
	
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

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
