/**
 *
 * @author Pranrajit
 * @date 25 พ.ค. 2558
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
import com.aug.hr.entity.dto.LeaveDto;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="EMP_LEAVE")
public class Leave extends BaseEntity {
	
	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Column(name = "DATE_OF_LEAVE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateOfLeave;
	
	@Column(name="TIME_OF_LEAVE")
	private Double timeOfLeave;
	
	
	@ManyToOne()
	@JoinColumn(name = "LEAVETYPE_ID",nullable = false,referencedColumnName="LEAVETYPE_ID")
	//@JsonBackReference
	private MasLeaveType masleavetype;
	
	@ManyToOne()
	@JoinColumn(name = "EMPLOYEE_ID",nullable = false,referencedColumnName="id")
	//@JsonBackReference
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
	
	
	public LeaveDto toLeaveDto(){
		LeaveDto leaveDto = new LeaveDto();
		leaveDto.setId(this.id);
		leaveDto.setDateOfLeave(this.dateOfLeave);
		leaveDto.setTimeOfLeave(this.timeOfLeave);
		leaveDto.setEmployeeCode(this.employee.getEmployeeCode());
		leaveDto.setEmployeeId(this.employee.getId());
		leaveDto.setMasleavetypeId(this.masleavetype.getId());
		leaveDto.setMasleavetype(this.masleavetype.getName());
		return leaveDto;
	}
	
	public Leave fromLeaveDto (LeaveDto leaveDto){
		Leave leave = new Leave();
		leave.setId(leaveDto.getId());
		leave.setDateOfLeave(leaveDto.getDateOfLeave());
		leave.setTimeOfLeave(leaveDto.getTimeOfLeave());
		
		MasLeaveType masleavetype=new MasLeaveType();
		masleavetype.setId(leaveDto.getMasleavetypeId());
		masleavetype.setName(leaveDto.getMasleavetype());
		leave.setMasleavetype(masleavetype);
		
		
		Employee employee = new Employee();
		employee.setId(leaveDto.getEmployeeId());
		leave.setEmployee(employee);

		return leave;
		
	}
	
}
