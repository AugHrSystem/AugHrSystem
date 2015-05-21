/**
 *
 * @author natechanok
 * @date Apr 30, 2015
 */

package com.aug.hr.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "EMP_OFFICIAL")
public class Official {
		@Id
	    @GeneratedValue
	    @Column(name = "ID")
	    private Integer id;
		
		@Column(name = "DATE")
		private Date date;

	 	@Column(name = "POSITION_APPLIED_FOR", nullable = true)
		private String positionAppliedFor;
		
		@Column(name = "SALARY_EXPECTED", nullable = true)
		private Double salaryExpected;
	    
		
		 @OneToOne(fetch=FetchType.EAGER, mappedBy="official")
		 private Employee empOfficial;

		 
		

//---------------------------------------------- getter setter ---------------------------------------------//
		 
		public Integer getId() {
			return id;
		}


		public void setId(Integer id) {
			this.id = id;
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


		public Employee getEmpOfficial() {
			return empOfficial;
		}


		public void setEmpOfficial(Employee empOfficial) {
			this.empOfficial = empOfficial;
		}

		
		public Date getDate() {
			return date;
		}


		public void setDate(Date date) {
			this.date = date;
		}



}
