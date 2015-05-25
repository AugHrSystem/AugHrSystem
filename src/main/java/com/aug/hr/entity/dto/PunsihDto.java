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
			name = "searchPunish",
			query= "select punish.id,punish.date,punish.description,punish.employee_id from emp_punish as punish,emp_employee as emp where punish.employee_id =:empId and punish.employee_id=emp.id", 
			resultClass = PunsihDto.class)
	})

@Entity
public class PunsihDto {
	@Id
	@Column(name = "ID")
	private Integer id;
	
	
	@Column(name ="DATE")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy")
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;
	
	@Column(name = "DESCRIPTION")
	private String description;
	
	@Column(name ="EMPLOYEE_ID")
	private String employeeId;
	
	
	
	

}
