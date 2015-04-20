package com.aug.hr.entities;

import javax.persistence.*;
import java.util.List;

/**
 * Created by amanurat on 4/20/15 AD.
 */
@Entity
@Table(name = "EDUCATION")
public class Education {

    @Id
    @GeneratedValue
    @Column(name = "ID")
    private Long id;

    @Column(name = "UNIVERSITY")
    private String university;

    @OneToMany(mappedBy = "education")
    private List<Employee> employeeList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public List<Employee> getEmployeeList() {
        return employeeList;
    }

    public void setEmployeeList(List<Employee> employeeList) {
        this.employeeList = employeeList;
    }
}
