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
import com.fasterxml.jackson.annotation.JsonFormat;

@NamedNativeQueries({
	@NamedNativeQuery(
			name="searchLeave",
			query="select l.id, l.date_of_leave, l.time_of_leave, m.name, l.employee_id, emp.employee_code, m.leavetype_id from emp_leave l, emp_employee emp, mas_leavetype  m where  l.employee_id = :empId and l.employee_id = emp.id and l.leavetype_id = m.leavetype_id",																																																																					
			resultClass = LeaveDto.class)
			
})

@Entity
public class LeaveDto {

	@Column(name ="ID")
	@Id
	private Integer id;

	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DATE_OF_LEAVE")
	private Date dateOfLeave;
	
	@Column(name="TIME_OF_LEAVE")
	private Double timeOfLeave;
	
	@Column(name = "NAME")
	private String masleavetype;
	
	
	@Column(name = "EMPLOYEE_ID")
	private Integer employeeId;
	
	@Column(name = "EMPLOYEE_CODE")
	private String employeeCode;
	

	@Column(name = "LEAVETYPE_ID")
	private Integer masleavetypeId;


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


	public Double getTimeOfLeave() {
		return timeOfLeave;
	}


	public void setTimeOfLeave(Double timeOfLeave) {
		this.timeOfLeave = timeOfLeave;
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




	
	
}
