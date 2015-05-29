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
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.NamedNativeQueries;
import org.hibernate.annotations.NamedNativeQuery;

import com.fasterxml.jackson.annotation.JsonFormat;



@NamedNativeQueries({
	@NamedNativeQuery(
            name = "insertOfficial",
            query = "insert into EMP_OFFICIAL("
            		+ "START_DATE,"
            		+ "POSITION_APPLIED_FOR,"
            		+ "SALARY_EXPECTED,"
            		+ "createdTimeStamp,"
            		+ "createdBy,"
            		+ "auditFlag"
            		//+ "EMPLOYEE_ID"
            		+ ") "
            		+ " values("
            		+ ":START_DATE,"
            		+ ":POSITION_APPLIED_FOR,"
            		+ ":SALARY_EXPECTED,"
            		+ "NOW(),"
            		+ "0,"
            		+ "'C'"
            		//+ ":EMPLOYEE_ID"
            		+ ")"
            	
            		,resultClass= Official.class),
            		
@NamedNativeQuery(
           name = "searchIdEmptoOfficial",
           query = "select * from EMP_OFFICIAL ORDER BY ID desc LIMIT 1;", 
            resultClass = Official.class)
  })

@Entity
@Table(name = "EMP_OFFICIAL",uniqueConstraints = {@UniqueConstraint(columnNames = {"id"})})
public class Official extends BaseEntity{
		@Id
	    @GeneratedValue
	    @Column(name = "ID")
	    private Integer id;
		
		@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-mm-yyyy")
		@Column(name = "START_DATE")
		//@Temporal(TemporalType.TIMESTAMP)
		private Date startDate;

	 	@Column(name = "POSITION_APPLIED_FOR", nullable = true)
		private String positionAppliedFor;
		
		@Column(name = "SALARY_EXPECTED", nullable = true)
		private Double salaryExpected;
	    
		 @OneToOne(fetch=FetchType.LAZY,mappedBy="official")
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


		public Date getStartDate() {
			return startDate;
		}


		public void setStartDate(Date startDate) {
			this.startDate = startDate;
		}




}
