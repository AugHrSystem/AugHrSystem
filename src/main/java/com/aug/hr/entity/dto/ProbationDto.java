package com.aug.hr.entity.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.aug.hr.entity.Probation;
import com.fasterxml.jackson.annotation.JsonFormat;

@NamedNativeQueries({
        @NamedNativeQuery(
                name = "searchProbation",
                query = "select pro.id, "
                		+ "pro.date_from, "
                		+ "pro.date_to, "
                		+ "pro.status,"
                		+ "pro.employee_id, "
                		+ "emp.employee_code "
                		+ "from emp_probation as pro, emp_employee as emp "
                		+ "where pro.employee_id=:empId and emp.id = pro.employee_id",
                resultClass = ProbationDto.class),
//        @NamedNativeQuery(name = "createProbation", 
//        		query = "insert into emp_probation as pro (pro.date_from, pro.date_to, pro.status,pro.employee_id) values (?dateFrom, ?dateTo, ?status, ?employeeId)",
//        		resultClass = Probation.class)
})
@Entity
public class ProbationDto {
    @Id
    @Column(name = "ID")
    private Integer id;
    @Column(name = "DATE_FROM")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-mm-yyyy")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateFrom;
    @Column(name = "DATE_TO")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-mm-yyyy")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateTo;
    @Column(name = "STATUS")
    private String status;
    @Column(name = "EMPLOYEE_ID")
    private Integer employeeId;
    @Column(name = "EMPLOYEE_CODE")
    private String employeeCode;

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

    public String getEmployeeCode() {
        return employeeCode;
    }

    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }


}
