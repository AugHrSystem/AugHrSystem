/**
 *
 * @author Pranrajit
 * @date 9 มิ.ย. 2558
 */
package com.aug.hr.entity.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;



@NamedNativeQueries({
	@NamedNativeQuery(
            name = "reportLeave",
            
            	                                                                                               	
					
					
            query = "select emp.id, "
            		+ "emp.employee_code as employeeCode,"
            		+ "emp.dateofbirth as dateOfBirth,"
				+ "YEAR(CURDATE()) - YEAR(dateOfBirth) -IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '/', MONTH(dateOfBirth), '/', DAY(dateOfBirth)) ,'%Y-%c-%e') > CURDATE(), 1, 0) as yearAge ,"
				+ "MONTH(CURDATE()) - MONTH(dateOfBirth) -IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '/', MONTH(dateOfBirth), '/', DAY(dateOfBirth)) ,'%Y-%c-%e') > CURDATE(), 1, 0) as monthAge, "
				+ "DAY(CURDATE()) - DAY(dateOfBirth) -IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '/', MONTH(dateOfBirth), '/', DAY(dateOfBirth)) ,'%Y-%c-%e') > CURDATE(), 1, 0) as dayAge,"
				+ "emp.age as age,emp.name_thai as nameThai,emp.name_eng as nameEng,l.START_DATE as startDate,l.end_date as endDate,off.START_WORK_DATE as startWorkDate,"
				+ "YEAR(CURDATE()) - YEAR(off.START_WORK_DATE) -IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '/', MONTH(off.START_WORK_DATE), '/', DAY(off.START_WORK_DATE)) ,'%Y-%c-%e') > CURDATE(), 1, 0) as dayWork ,"
				+ "MONTH(CURDATE()) - MONTH(off.START_WORK_DATE) -IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '/', MONTH(off.START_WORK_DATE), '/', DAY(off.START_WORK_DATE)) ,'%Y-%c-%e') > CURDATE(), 1, 0) as monthWork ,"
				+ "DAY(CURDATE()) - DAY(off.START_WORK_DATE) -IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '/', MONTH(off.START_WORK_DATE), '/', DAY(off.START_WORK_DATE)) ,'%Y-%c-%e') > CURDATE(), 1, 0) as yearWork,"
				+ "SUM( CASE when l.`leavetype_id`= 1 then DAY(l.end_date) - DAY(l.START_DATE) else 0 end	) as 'dayAnnual',"
				+ "SUM( CASE when l.`leavetype_id`= 3 then DAY(l.end_date) - DAY(l.START_DATE) else 0 end) as 'daySick',"
				+ "SUM( CASE when l.`leavetype_id`= 4 then DAY(l.end_date) - DAY(l.START_DATE) else 0 end) as 'dayPersonal',"
				+ "SUM((CASE when l.`leavetype_id`= 4 then DAY(l.end_date) - DAY(l.START_DATE) else 0 end)+(CASE when l.`leavetype_id`= 3 then DAY(l.end_date) - DAY(l.START_DATE)else 0 end)+"
				+ "(CASE when l.`leavetype_id`= 1 then DAY(l.end_date) - DAY(l.START_DATE) else 0 end )) as totalDayLeave "
				+ "from emp_employee emp join emp_official off join emp_leave as l where emp.id = l.employee_id group by emp.employee_code",

            resultClass = ReportLeaveDto.class)
  })


@Entity
public class ReportLeaveDto {
	

	@Id
	@Column(name ="ID")
	private Integer id;
	@Column(name = "employeeCode")
	private String employeeCode;
	@Column(name = "dateOfBirth")
	private Date dateOfBirth;
	@Column(name = "nameEng")
	private String nameEng;
	@Column(name = "nameThai")
	private String nameThai;
	@Column(name = "age")
	private Integer age;
	@Column(name = "startDate")
	private Date startDate;
	@Column(name = "endDate")
	private Date endDate;	
	@Column(name = "startWorkDate")
	private Date startWorkDate;
	@Column(name = "dayWork")
	private Integer dayWork;
	@Column(name = "monthWork")
	private Integer monthWork;
	@Column(name = "yearWork")
	private Integer yearWork;	
	@Column(name = "dayAge")
	private Integer dayAge;
	@Column(name = "monthAge")
	private Integer monthAge;
	@Column(name = "yearAge")
	private Integer yearAge;
	@Column(name = "dayAnnual")
	private Integer dayAnnual;
	@Column(name = "daySick")
	private Integer daySick;
	@Column(name = "dayPersonal")
	private Integer dayPersonal;	
	@Column(name = "totalDayLeave")
	private Integer totalDayLeave;
		
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEmployeeCode() {
		return employeeCode;
	}
	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getNameEng() {
		return nameEng;
	}
	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}
	public String getNameThai() {
		return nameThai;
	}
	public void setNameThai(String nameThai) {
		this.nameThai = nameThai;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Integer getDayWork() {
		return dayWork;
	}
	public void setDayWork(Integer dayWork) {
		this.dayWork = dayWork;
	}
	public Integer getMonthWork() {
		return monthWork;
	}
	public void setMonthWork(Integer monthWork) {
		this.monthWork = monthWork;
	}
	public Integer getYearWork() {
		return yearWork;
	}
	public void setYearWork(Integer yearWork) {
		this.yearWork = yearWork;
	}
	public Integer getDayAge() {
		return dayAge;
	}
	public void setDayAge(Integer dayAge) {
		this.dayAge = dayAge;
	}
	public Integer getMonthAge() {
		return monthAge;
	}
	public void setMonthAge(Integer monthAge) {
		this.monthAge = monthAge;
	}
	public Integer getYearAge() {
		return yearAge;
	}
	public void setYearAge(Integer yearAge) {
		this.yearAge = yearAge;
	}
	public Integer getDayAnnual() {
		return dayAnnual;
	}
	public void setDayAnnual(Integer dayAnnual) {
		this.dayAnnual = dayAnnual;
	}
	public Integer getDaySick() {
		return daySick;
	}
	public void setDaySick(Integer daySick) {
		this.daySick = daySick;
	}
	public Integer getDayPersonal() {
		return dayPersonal;
	}
	public void setDayPersonal(Integer dayPersonal) {
		this.dayPersonal = dayPersonal;
	}
	public Integer getTotalDayLeave() {
		return totalDayLeave;
	}
	public void setTotalDayLeave(Integer totalDayLeave) {
		this.totalDayLeave = totalDayLeave;
	}
	public Date getStartWorkDate() {
		return startWorkDate;
	}
	public void setStartWorkDate(Date startWorkDate) {
		this.startWorkDate = startWorkDate;
	}
	
	
	
	
	
}
