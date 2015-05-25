/**
 *
 * @author Preeyaporn
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.entity.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@NamedNativeQueries({
	@NamedNativeQuery(
			name="searchCertification",
			query="select edu.id,edu.university,edu.gpa,edu.faculty,edu.major,mas_degreetype.name,edu.certificate,edu.description,edu.start_date,edu.graduated_date,edu.employee_id from emp_education as edu,emp_employee as emp,mas_degreetype where edu.employee_id=:empId  and edu.employee_id = emp.id and mas_degreetype.id = edu.degreetype_id",																																																																					
			resultClass = EducationDto.class)
			
})

@Entity
public class CertificationDto {

	@Column(name ="ID")
	@Id
	private Integer id;
//	@Column(name = "UNIVERSITY")
//	private String university;
	
}
