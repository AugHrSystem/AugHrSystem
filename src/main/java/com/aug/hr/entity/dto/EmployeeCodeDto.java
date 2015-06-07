package com.aug.hr.entity.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.NamedNativeQueries;
import org.hibernate.annotations.NamedNativeQuery;


@NamedNativeQueries({
	@NamedNativeQuery(
            name = "runningNo",
              query = "select LOCATION_ID,SUBSTRING(EMPLOYEE_CODE,5,3) as RUNNING_NO from EMP_EMPLOYEE "
              		+ "where LOCATION_ID=:location "
              		+ "order by ID desc "
              		+ "LIMIT 1",
            resultClass = EmployeeCodeDto.class)
  })




@Entity
public class EmployeeCodeDto {
	
	private Integer id;
	private Integer rungingNumber;
	
	@Id
	@Column(name="LOCATION_ID")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="RUNNING_NO")
	public Integer getRungingNumber() {
		return rungingNumber;
	}
	
	
	public void setRungingNumber(Integer rungingNumber) {
		this.rungingNumber = rungingNumber;
	}
	
	

}
