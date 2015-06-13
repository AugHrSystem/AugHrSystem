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

import org.hibernate.validator.constraints.NotEmpty;

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
	@Column(name = "START_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date startDate;
	

	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Column(name = "END_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date endDate;
	

	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="HH:mm")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="START_TIME")
	private  Date startTime;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="HH:mm")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="END_TIME")
	private Date endTime;
	
	
	@Column(name="REASON")
	private String reason;
	
	@Column(name="AIM",nullable = false)
	@NotEmpty
	private String aim;
	
	
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



	
	

	public String getAim() {
		return aim;
	}

	public void setAim(String aim) {
		this.aim = aim;
	}

	public LeaveDto toLeaveDto(){
		LeaveDto leaveDto = new LeaveDto();
		leaveDto.setId(this.id);
		leaveDto.setStartDate(this.startDate);
		leaveDto.setStartTime(this.startTime);
		leaveDto.setEndDate(this.endDate);
		leaveDto.setEndTime(this.endTime);
		leaveDto.setReason(this.reason);
		leaveDto.setAim(this.aim);
		leaveDto.setEmployeeCode(this.employee.getEmployeeCode());
		leaveDto.setEmployeeId(this.employee.getId());
		leaveDto.setMasleavetypeId(this.masleavetype.getId());
		leaveDto.setMasleavetype(this.masleavetype.getName());
		return leaveDto;
	}
	
	public Leave fromLeaveDto (LeaveDto leaveDto,Leave leave){
		//Leave leave = new Leave();
		//leave.setId(leaveDto.getId());
		leave.setStartDate(leaveDto.getStartDate());
		leave.setStartTime(leaveDto.getStartTime());
		leave.setEndDate(leaveDto.getEndDate());
		leave.setEndTime(leaveDto.getEndTime());
		leave.setReason(leaveDto.getReason());
		leave.setAim(leaveDto.getAim());
		
		
		
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
