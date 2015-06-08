/**
 *
 * @author Preeyaporn
 * @date 25 พ.ค. 2558
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

import com.aug.hr.entity.dto.CertificationDto;


@Entity
@Table(name = "EMP_CERTIFICATION")
public class Certification extends BaseEntity {

	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;
	
	@Column(name = "YEAR" ,nullable = false)
	private String year;
	
	@Column(name = "NAME" ,nullable = false)
	private String name;
	
	@Column(name = "CERTIFICATION_FROM" ,nullable = false)
	private String certificationFrom;

	
	@Column(name = "DESCRIPTION" ,nullable = false)
	private String description;
	
	@ManyToOne()
	@JoinColumn(name = "EMPLOYEE_ID", nullable = false,referencedColumnName="id")
	private Employee employee;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCertificationFrom() {
		return certificationFrom;
	}

	public void setCertificationFrom(String certificationFrom) {
		this.certificationFrom = certificationFrom;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	

	public Certification fromCertificationDto(Certification certification, CertificationDto certificationDto) {
		
//		Certification certification = new Certification();
		
//		certification.setId(certificationDto.getId());
		certification.setYear(certificationDto.getYear());
		certification.setName(certificationDto.getName());
		certification.setCertificationFrom(certificationDto.getCertificationFrom());
		certification.setDescription(certificationDto.getDescription());

		Employee employee = new Employee();
		employee.setId(certificationDto.getEmployeeId());
		certification.setEmployee(employee);
		
		return certification;
	}

	public CertificationDto toCertificationDto() {

		CertificationDto certificationDto = new CertificationDto();
		
		certificationDto.setId(this.id);
		certificationDto.setYear(this.year);
		certificationDto.setName(this.name);
		certificationDto.setCertificationFrom(this.certificationFrom);
		certificationDto.setDescription(this.description);
		certificationDto.setEmployeeId(this.employee.getId());
		
		return certificationDto;
	}
	
	
	
	
	
}
