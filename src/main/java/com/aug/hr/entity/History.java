/**
 *
 * @author Preeyaporn
 * @date 12 พ.ค. 2558
 */
package com.aug.hr.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "EMP_HISTORY")
public class History extends BaseEntity{

	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;
	
	@Column(name = "POSITION" ,nullable = false)
	private String position;
	
	@Column(name = "SALARY" ,nullable = false)
	private Double salary;
	
	@Column(name = "OLD_SALARY" ,nullable = false)
	private Double oldSalary;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Column(name = "DATE_OF_ADJUSTMENT")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateOfAdjustment;
	
	@Column(name = "REASON_OF_ADJUSTMENT" ,nullable = false)
	private String reasonOfAdjustment;
	
	@Column(name = "ADJUSTMENT_TIME" ,nullable = false)
	private Integer adjustmentTime;
	
	@ManyToOne()
	@JoinColumn(name = "EMPLOYEE_ID", referencedColumnName="id", nullable=false)
	private Employee employee;

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

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
