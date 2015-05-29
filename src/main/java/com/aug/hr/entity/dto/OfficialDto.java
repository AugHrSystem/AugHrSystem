/**
 *
 * @author natechanok
 * @date May 28, 2015
 */

package com.aug.hr.entity.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;




@Component
//@Entity
public class OfficialDto {
	
	 //@Column(name = "ID")
	    private Integer id;
		
	//@Column(name = "DATE")
	    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-mm-yyyy")
	    @Temporal(TemporalType.TIMESTAMP)
	    private Date startDate;

	 //@Column(name = "POSITION_APPLIED_FOR", nullable = true)
		private String positionAppliedFor;
		
	//@Column(name = "SALARY_EXPECTED", nullable = true)
		private Double salaryExpected;
	    
		private Integer employeeId;

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

		public String getPositionAppliedFor() {
			return positionAppliedFor;
		}

		public void setPositionAppliedFor(String positionAppliedFor) {
			this.positionAppliedFor = positionAppliedFor;
		}

		public Double getSalaryExpected() {
			return salaryExpected;
		}

		public void setSalaryExpected(Double salaryExpected) {
			this.salaryExpected = salaryExpected;
		}

		public Integer getEmployeeId() {
			return employeeId;
		}

		public void setEmployeeId(Integer employeeId) {
			this.employeeId = employeeId;
		}	
		
		

}
