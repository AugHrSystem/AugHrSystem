package com.aug.hr.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.aug.hr.entity.dto.ProbationDto;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "EMP_PROBATION")
public class Probation extends BaseEntity {

    @Id
    @GeneratedValue
    @Column(name = "ID")
    private Integer id;
    @Column(name = "DATE_FROM")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateFrom;
    @Column(name = "DATE_TO")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateTo;
    @Column(name = "STATUS")
    private String status;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "EMPLOYEE_ID", referencedColumnName = "id", nullable = false)
 //   @JsonManagedReference
    private Employee employee;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }

    public Date getDateTo() {
        return dateTo;
    }

    public void setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public ProbationDto toProbationDto() {
        ProbationDto probationDto = new ProbationDto();
        probationDto.setId(this.id);
        probationDto.setDateFrom(this.dateFrom);
        probationDto.setDateTo(this.dateTo);
        probationDto.setEmployeeCode(this.employee.getEmployeeCode());
        probationDto.setEmployeeId(this.employee.getId());
        probationDto.setStatus(this.status);

        return probationDto;
    }
    
    public Probation fromProbationDto(ProbationDto probationDto){
    	Probation probation = new Probation();
    	probation.setId(probationDto.getId());
    	probation.setDateFrom(probationDto.getDateFrom());
    	probation.setDateTo(getDateTo());
    	probation.setStatus(probationDto.getStatus());
    	Employee employee = new Employee();
    	employee.setId(probationDto.getEmployeeId());
    	probation.setEmployee(employee);
    	return probation;
    }


}
