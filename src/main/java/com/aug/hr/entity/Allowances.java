/**
 *
 * @author Preeyaporn
 * @date 3 มิ.ย. 2558
 */
package com.aug.hr.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.aug.hr.entity.dto.AllowancesDto;

@Entity
@Table(name = "EMP_ALLOWANCES")
public class Allowances extends BaseEntity{

	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;
	
	@Column(name = "AMOUNT" ,nullable = false)
	private Double amount;

	@ManyToOne()
	@JoinColumn(name = "EMPLOYEE_ID", referencedColumnName="id", nullable = false)
	private Employee employee;
	
	@ManyToOne()
	@JoinColumn(name = "MAS_ALLWANCES_ID", referencedColumnName="AllO_ID", nullable = false)
	private MasAllowances masallowances;
	
	/*---------------------- getter / setter ----------------------*/
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public MasAllowances getMasallowances() {
		return masallowances;
	}

	public void setMasallowances(MasAllowances masallowances) {
		this.masallowances = masallowances;
	}

	public Allowances fromAllowancesDto(Allowances allowances, AllowancesDto allowancesDto) {
		
		allowances.setAmount(allowancesDto.getAmount());
		
		Employee employee = new Employee();
		employee.setId(allowancesDto.getEmployeeId());
		allowances.setEmployee(employee);
		
		MasAllowances masAllowances = new MasAllowances();
		masAllowances.setId(allowancesDto.getMasAllowancesId());
		masAllowances.setName(allowancesDto.getMasallowances());
		allowances.setMasallowances(masAllowances);
		
		return allowances;
	}

	
	public AllowancesDto toAllowancesDto() {
		
		AllowancesDto allowancesDto = new AllowancesDto();
		
		allowancesDto.setId(this.id);
		allowancesDto.setAmount(this.amount);
		allowancesDto.setEmployeeId(this.employee.getId());
		allowancesDto.setMasAllowancesId(this.masallowances.getId());
		allowancesDto.setMasallowances(this.masallowances.getName());
		
		return allowancesDto;
	}
	
}
