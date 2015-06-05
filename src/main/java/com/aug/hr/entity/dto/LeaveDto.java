/**
 *
 * @author Pranrajit
 * @date 25 พ.ค. 2558
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

import com.aug.hr.entity.Employee;
import com.fasterxml.jackson.annotation.JsonFormat;

@NamedNativeQueries({
	@NamedNativeQuery(
			name="searchLeave",
			query="select l.id, l.start_date,l.end_date, l.start_time,l.end_time,l.reason, m.name, l.employee_id, emp.employee_code, m.leavetype_id from emp_leave l, emp_employee emp, mas_leavetype  m where  l.employee_id = :empId and l.employee_id = emp.id and l.leavetype_id = m.leavetype_id",																																																																					
			resultClass = LeaveDto.class),
			 

			@NamedNativeQuery(
		            name = "searchAim",
		            query = "select emp.aim_emp_id,emp.name_eng from EMP_EMPLOYEE as emp where emp.aim_emp_id=emp.id;",
		            resultClass = LeaveDto.class)
		  })
			


@Entity
public class LeaveDto {

	@Column(name ="ID")
	@Id
	private Integer id;

	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "START_DATE")
	private Date startDate;
	
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "END_DATE")
	private Date endDate;
	
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="HH:mm")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="START_TIME")
	private Date startTime;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="HH:mm")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="END_TIME")
	private Date endTime;
	
	
	@Column(name="REASON")
	private String reason;
	
	@Column(name = "NAME")
	private String masleavetype;
	
	
	@Column(name = "EMPLOYEE_ID")
	private Integer employeeId;
	
	@Column(name = "EMPLOYEE_CODE")
	private String employeeCode;
	

	@Column(name = "LEAVETYPE_ID")
	private Integer masleavetypeId;

	
	@Column(name="AIM")
	private String aim;
	
	

	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}



	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public Date getStartTime() {
		return startTime;
	}


	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}


	public Date getEndTime() {
		return endTime;
	}


	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public String getMasleavetype() {
		return masleavetype;
	}


	public void setMasleavetype(String masleavetype) {
		this.masleavetype = masleavetype;
	}


	public Integer getEmployeeId() {
		return employeeId;
	}


	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}


	public String getEmployeeCode() {
		return employeeCode;
	}


	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}


	public Integer getMasleavetypeId() {
		return masleavetypeId;
	}


	public void setMasleavetypeId(Integer masleavetypeId) {
		this.masleavetypeId = masleavetypeId;
	}


	public String getAim() {
		return aim;
	}


	public void setAim(String aim) {
		this.aim = aim;
	}




	
	
}
