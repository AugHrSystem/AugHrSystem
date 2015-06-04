package com.aug.hr.entity.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.NamedNativeQueries;
import org.hibernate.annotations.NamedNativeQuery;



@NamedNativeQueries({
	@NamedNativeQuery(
            name = "listHealth",
              query = "select health.ID,health.CONGENITAL_DISEASE,health.CONGENITAL_DISEASE_SPECIFIED1,health.CONGENITAL_DISEASE_SPECIFIED2,health.CONGENITAL_DISEASE_SPECIFIED3,"
              		+ "health.GENETIC_DISEASE,health.GENETIC_DISEASE_SPECIFIED1,health.GENETIC_DISEASE_SPECIFIED2,health.GENETIC_DISEASE_SPECIFIED3,"
              		+ "health.TAKE_MEDICINE,health.TAKE_MEDICINE_EXPLAIN,health.INTOLERANCE,health.INTOLERANCE_EXPLAIN,health.EMPLOYEE_ID,emp.EMPLOYEE_CODE "
              		//+ "CONCAT(health.CONGENITAL_DISEASE_EXPLAIN1,CONCAT(',',health.CONGENITAL_DISEASE_EXPLAIN2),CONCAT(',',health.CONGENITAL_DISEASE_EXPLAIN3)) as CONGENITAL_DISEASE_ALLEXPLAIN,"
              		//+ "CONCAT(health.GENETIC_DISEASE_EXPLAIN1,CONCAT(',',health.GENETIC_DISEASE_EXPLAIN2),CONCAT(',',health.GENETIC_DISEASE_EXPLAIN3)) as GENETIC_DISEASE_ALLEXPLAIN "
              		+ "from  EMP_HEALTH  health join EMP_EMPLOYEE emp on health.EMPLOYEE_ID=emp.ID "
              		+ "where health.EMPLOYEE_ID=:empId",
            resultClass = HealthDto.class)
  })

@Entity
public class HealthDto {
	
	
	private Integer id;
	private String congenitalDisease;
	private String congenitalDiseaseExplain;
	private String congenitalDiseaseExplain2;
	private String congenitalDiseaseExplain3;
	//private String congenitalDiseaseAllExplain;
	private String geneticDisease;
	private String geneticDiseaseExplain;
	private String geneticDiseaseExplain2;
	private String geneticDiseaseExplain3;
	//private String geneticDiseaseAllExplain;
	private String takeMedicine;
	private String takeMedicineExplain;
	private String intolerance;
	private String intoleranceExplain;
	private Integer employeeId;
	private String employeeCode;
	
	@Id
	@Column(name="ID")
	public Integer getId() {
		return id;
	}
	
	
	public void setId(Integer id) {
		this.id = id;
	}

	
	@Column(name="CONGENITAL_DISEASE")
	public String getCongenitalDisease() {
		return congenitalDisease;
	}
	
	
	public void setCongenitalDisease(String congenitalDisease) {
		this.congenitalDisease = congenitalDisease;
	}
	
	@Column(name="CONGENITAL_DISEASE_SPECIFIED1")
	public String getCongenitalDiseaseExplain() {
		return congenitalDiseaseExplain;
	}
	
	
	public void setCongenitalDiseaseExplain(String congenitalDiseaseExplain) {
		this.congenitalDiseaseExplain = congenitalDiseaseExplain;
	}
	
	
	@Column(name="CONGENITAL_DISEASE_SPECIFIED2")
	public String getCongenitalDiseaseExplain2() {
		return congenitalDiseaseExplain2;
	}


	public void setCongenitalDiseaseExplain2(String congenitalDiseaseExplain2) {
		this.congenitalDiseaseExplain2 = congenitalDiseaseExplain2;
	}


	@Column(name="CONGENITAL_DISEASE_SPECIFIED3")
	public String getCongenitalDiseaseExplain3() {
		return congenitalDiseaseExplain3;
	}


	public void setCongenitalDiseaseExplain3(String congenitalDiseaseExplain3) {
		this.congenitalDiseaseExplain3 = congenitalDiseaseExplain3;
	}

	
	@Column(name="GENETIC_DISEASE")
	public String getGeneticDisease() {
		return geneticDisease;
	}


	public void setGeneticDisease(String geneticDisease) {
		this.geneticDisease = geneticDisease;
	}

	
	@Column(name="GENETIC_DISEASE_SPECIFIED1")
	public String getGeneticDiseaseExplain() {
		return geneticDiseaseExplain;
	}


	public void setGeneticDiseaseExplain(String geneticDiseaseExplain) {
		this.geneticDiseaseExplain = geneticDiseaseExplain;
	}

	
	@Column(name="GENETIC_DISEASE_SPECIFIED2")
	public String getGeneticDiseaseExplain2() {
		return geneticDiseaseExplain2;
	}


	public void setGeneticDiseaseExplain2(String geneticDiseaseExplain2) {
		this.geneticDiseaseExplain2 = geneticDiseaseExplain2;
	}

	
	@Column(name="GENETIC_DISEASE_SPECIFIED3")
	public String getGeneticDiseaseExplain3() {
		return geneticDiseaseExplain3;
	}


	public void setGeneticDiseaseExplain3(String geneticDiseaseExplain3) {
		this.geneticDiseaseExplain3 = geneticDiseaseExplain3;
	}


	@Column(name="TAKE_MEDICINE")
	public String getTakeMedicine() {
		return takeMedicine;
	}
	
	
	public void setTakeMedicine(String takeMedicine) {
		this.takeMedicine = takeMedicine;
	}
	
	@Column(name="TAKE_MEDICINE_EXPLAIN")
	public String getTakeMedicineExplain() {
		return takeMedicineExplain;
	}
	
	
	public void setTakeMedicineExplain(String takeMedicineExplain) {
		this.takeMedicineExplain = takeMedicineExplain;
	}
	
	@Column(name="INTOLERANCE")
	public String getIntolerance() {
		return intolerance;
	}
	
	
	public void setIntolerance(String intolerance) {
		this.intolerance = intolerance;
	}
	
	@Column(name="INTOLERANCE_EXPLAIN")
	public String getIntoleranceExplain() {
		return intoleranceExplain;
	}
	
	
	public void setIntoleranceExplain(String intoleranceExplain) {
		this.intoleranceExplain = intoleranceExplain;
	}


	
	@Column(name="EMPLOYEE_ID")
	public Integer getEmployeeId() {
		return employeeId;
	}
	
	
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	
	@Column(name="EMPLOYEE_CODE")
	public String getEmployeeCode() {
		return employeeCode;
	}
	
	
	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}
	
	

	/*
	@Column(name="CONGENITAL_DISEASE_ALLEXPLAIN")
	public String getCongenitalDiseaseAllExplain() {
		return congenitalDiseaseAllExplain;
	}


	public void setCongenitalDiseaseAllExplain(String congenitalDiseaseAllExplain) {
		this.congenitalDiseaseAllExplain = congenitalDiseaseAllExplain;
	}


	@Column(name="GENETIC_DISEASE_ALLEXPLAIN")
	public String getGeneticDiseaseAllExplain() {
		return geneticDiseaseAllExplain;
	}


	public void setGeneticDiseaseAllExplain(String geneticDiseaseAllExplain) {
		this.geneticDiseaseAllExplain = geneticDiseaseAllExplain;
	}
   */
	

	/*@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("HealthDto [id=");
		builder.append(id);
		builder.append(", congenitalDisease=");
		builder.append(congenitalDisease);
		builder.append(", congenitalDiseaseExplain=");
		builder.append(congenitalDiseaseExplain);
		builder.append(", congenitalDiseaseExplain2=");
		builder.append(congenitalDiseaseExplain2);
		builder.append(", congenitalDiseaseExplain3=");
		builder.append(congenitalDiseaseExplain3);
		builder.append(", congenitalDiseaseAllExplain=");
		builder.append(congenitalDiseaseAllExplain);
		builder.append(", geneticDisease=");
		builder.append(geneticDisease);
		builder.append(", geneticDiseaseExplain=");
		builder.append(geneticDiseaseExplain);
		builder.append(", geneticDiseaseExplain2=");
		builder.append(geneticDiseaseExplain2);
		builder.append(", geneticDiseaseExplain3=");
		builder.append(geneticDiseaseExplain3);
		builder.append(", geneticDiseaseAllExplain=");
		builder.append(geneticDiseaseAllExplain);
		builder.append(", takeMedicine=");
		builder.append(takeMedicine);
		builder.append(", takeMedicineExplain=");
		builder.append(takeMedicineExplain);
		builder.append(", intolerance=");
		builder.append(intolerance);
		builder.append(", intoleranceExplain=");
		builder.append(intoleranceExplain);
		builder.append(", employeeId=");
		builder.append(employeeId);
		builder.append(", employeeCode=");
		builder.append(employeeCode);
		builder.append("]");
		return builder.toString();
	}

	*/
	
	

	
	
	

}
