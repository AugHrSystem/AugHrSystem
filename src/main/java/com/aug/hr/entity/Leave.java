/**
 *
 * @author Pranrajit
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="EMP_LEAVE")
public class Leave extends BaseEntity {
	
	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Column(name = "DATE_OF_LEAVE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateOfLeave;
	
	@Column(name="TIME_OF_LEAVE")
	private Double timeOfLeave;
	
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "LEAVETYPE_ID", nullable = false)
	@JsonBackReference
	private MasLeaveType masleavetype;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "EMPLOYEE_ID",nullable = false,referencedColumnName="id")
	@JsonBackReference
	private Employee employee;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getDateOfLeave() {
		return dateOfLeave;
	}

	public void setDateOfLeave(Date dateOfLeave) {
		this.dateOfLeave = dateOfLeave;
	}

	public MasLeaveType getMasleavetype() {
		return masleavetype;
	}

	public void setMasleavetype(MasLeaveType masleavetype) {
		this.masleavetype = masleavetype;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Double getTimeOfLeave() {
		return timeOfLeave;
	}

	public void setTimeOfLeave(Double timeOfLeave) {
		this.timeOfLeave = timeOfLeave;
	}
	
	
}
