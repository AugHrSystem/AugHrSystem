/**
 *
 * @author Preeyaporn
 * @date 20 พ.ค. 2558
 */
package com.aug.hr.entity.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;

@NamedNativeQueries({
	@NamedNativeQuery(
            name = "searchHistory",
            query = "select his.id, his.position, his.salary, his.old_salary, his.date_of_adjustment, his.reason_of_adjustment, his.adjustment_time, his.employee_id, his.employee_code from emp_history as his, emp_employee as emp where his.employee_id=:empId and emp.id = his.employee_id", 
            resultClass = HistoryDto.class)
  })

@Entity
public class HistoryDto {

	@Id
	@Column(name = "ID")
	private Integer id;
	
	@Column(name = "POSITION")
	private String position;
	
	@Column(name = "SALARY")
	private Double salary;
	
	@Column(name = "OLD_SALARY")
	private Double oldSalary;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Column(name = "DATE_OF_ADJUSTMENT")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateOfAdjustment;
	
	@Column(name = "REASON_OF_ADJUSTMENT")
	private String reasonOfAdjustment;
	
	@Column(name = "ADJUSTMENT_TIME")
	private Integer adjustmentTime;
	
	@Column(name = "EMPLOYEE_ID")
	private String employeeId;

	@Column(name = "EMPLOYEE_CODE")
	private String employeeCode;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	public Double getOldSalary() {
		return oldSalary;
	}

	public void setOldSalary(Double oldSalary) {
		this.oldSalary = oldSalary;
	}

	public Date getDateOfAdjustment() {
		return dateOfAdjustment;
	}

	public void setDateOfAdjustment(Date dateOfAdjustment) {
		this.dateOfAdjustment = dateOfAdjustment;
	}

	public String getReasonOfAdjustment() {
		return reasonOfAdjustment;
	}

	public void setReasonOfAdjustment(String reasonOfAdjustment) {
		this.reasonOfAdjustment = reasonOfAdjustment;
	}

	public Integer getAdjustmentTime() {
		return adjustmentTime;
	}

	public void setAdjustmentTime(Integer adjustmentTime) {
		this.adjustmentTime = adjustmentTime;
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
	
	
}
