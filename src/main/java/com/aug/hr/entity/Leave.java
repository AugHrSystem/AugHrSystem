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
	@Column(name = "DATE_FROM")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateFrom;
	

	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Column(name = "DATE_TO")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateTo;
	

	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="HH:mm")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="TIME_FROM")
	private  Date timeFrom;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="HH:mm")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="TIME_TO")
	private Date timeTo;
	
	
	
	
	
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

	

	public Date getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}

	public Date getDateTo() {
		return dateTo;
	}

	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
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


	
	
	

	public Date getTimeFrom() {
		return timeFrom;
	}

	public void setTimeFrom(Date timeFrom) {
		this.timeFrom = timeFrom;
	}

	public Date getTimeTo() {
		return timeTo;
	}

	public void setTimeTo(Date timeTo) {
		this.timeTo = timeTo;
	}

	public LeaveDto toLeaveDto(){
		LeaveDto leaveDto = new LeaveDto();
		leaveDto.setId(this.id);
		leaveDto.setDateFrom(this.dateFrom);
		leaveDto.setDateTo(this.dateTo);
		leaveDto.setTimeFrom(this.timeFrom);
		leaveDto.setTimeTo(this.timeTo);
		leaveDto.setEmployeeCode(this.employee.getEmployeeCode());
		leaveDto.setEmployeeId(this.employee.getId());
		leaveDto.setMasleavetypeId(this.masleavetype.getId());
		leaveDto.setMasleavetype(this.masleavetype.getName());
		return leaveDto;
	}
	
	public Leave fromLeaveDto (LeaveDto leaveDto){
		Leave leave = new Leave();
		leave.setId(leaveDto.getId());
		leave.setDateFrom(leaveDto.getDateFrom());
		leave.setDateTo(leaveDto.getDateTo());
		leave.setTimeFrom(leaveDto.getTimeFrom());
		leave.setTimeTo(leaveDto.getTimeTo());
		
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
