package com.aug.hr.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import com.aug.hr.entity.dto.ReferenceDto;




@Entity
@Table(name = "EMP_REFERENCE")
public class Reference {
	
	
	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;
	
	@Column(name = "NAME" ,nullable = false)
	@NotEmpty 
	private String name;
//	@Column(name = "ADDRESS" ,nullable = false)
//	private String address;
	@Column(name = "TEL" ,nullable = false)
	@NotEmpty
	private String tel;
//	@Column(name = "OCCUPATION" ,nullable = false)
//	private String occupation;

	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "EMPLOYEE_ID" ,referencedColumnName="id", nullable=false)
//	@JsonIgnore
	private Employee employee;




	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public ReferenceDto toReferenceDto(){
		ReferenceDto referenceDto = new ReferenceDto();
		referenceDto.setId(this.id);
		referenceDto.setName(this.name);
//		referenceDto.setAddress(this.address);
		referenceDto.setTel(this.tel);
//		referenceDto.setOccupation(this.occupation);
		referenceDto.setEmployeeId(this.employee.getId());
		return referenceDto;
	}

	public Reference fromReferenceDto(Reference reference,ReferenceDto referenceDto){
		//Reference reference = new Reference();
		reference.setId(referenceDto.getId());
		reference.setName(referenceDto.getName());
//		reference.setAddress(referenceDto.getAddress());
		reference.setTel(referenceDto.getTel());
//		reference.setOccupation(referenceDto.getOccupation());		
		
		Employee employee = new Employee();
		employee.setId(referenceDto.getEmployeeId());
		reference.setEmployee(employee);
		return reference;
	}

}
