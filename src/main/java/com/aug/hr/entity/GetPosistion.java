/**
 *
 * @author Preeyaporn
 * @date 12 พ.ค. 2558
 */
package com.aug.hr.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "GETPOSITION")
public class GetPosistion extends BaseEntity{

	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;
	
	@Column(name = "POSITION" ,nullable = false)
	private String position;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "EMP_ID")
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

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
