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



/*@NamedNativeQueries({
	@NamedNativeQuery(
            name = "reportLeave",
            query="select l.id,l.aim, l.start_date as startDate,l.end_date as endDate,l.reason, m.name as masleavetype,"
            		+ "l.employee_id as employee,emp.id as id, emp.employee_code as employeeCode "
            		+ "from EMP_LEAVE l, EMP_EMPLOYEE emp,MAS_LEAVETYPE  m  "
            		+ "where  l.employee_id = emp.id and l.employee_id = emp.id  ",
            	                                                                                               	
					
					
            query = "select l.id,l.aim,l.dayWork, l.start_date as startDate,l.end_date as endDate, l.start_time as startTime ,l.end_time as endTime"
                    +",l.reason, m.name as masleavetype, l.employee_id as employee,emp.id as id, emp.employee_code as employeeCode, m.leavetype_id as id,aim.nameEng as nameEng,"
            		+"aim.nameThai as nameThai,aim.age as age,aim.dateOfBirth as dateOfBirth,"
            		+"YEAR(CURDATE()) - YEAR(dateofbirth) -IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '/', MONTH(dateofbirth), '/', DAY(dateofbirth)) ,'%Y-%c-%e') > CURDATE(), 1, 0) as yearAge ,"
					+"month(curdate()) - month(dateofbirth) -IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '/', MONTH(dateofbirth), '/', DAY(dateofbirth)) ,'%Y-%c-%e') > CURDATE(), 1, 0) as monthAge ,"
					+"day(curdate()) - day(dateofbirth) -IF(STR_TO_DATE(CONCAT(YEAR(CURDATE()), '/', MONTH(dateofbirth), '/', DAY(dateofbirth)) ,'%Y-%c-%e') > CURDATE(), 1, 0) as dayAge"
					+"from EMP_LEAVE l, EMP_EMPLOYEE emp,MAS_LEAVETYPE  m ,"
            		+"(select  e.name_Eng as nameEng,e.name_Thai as nameThai,e.dateOfBirth as dateOfBirth,e.age as age,l.ID as id from EMP_LEAVE l"
            		+"join EMP_EMPLOYEE e on e.ID=l.AIM where l.AIM=e.ID) aim"
            		+"where  l.employee_id = emp.id and l.employee_id = emp.id"
            		+"and l.leavetype_id = m.leavetype_id and aim.id=l.id",

            resultClass = ReportLeaveDto.class)
  })
*/

//@Entity
public class ReportLeaveDto {
	

	//@Id
	//@Column(name ="ID")
	private Integer id;
	@Column(name = "EMPLOYEE_ID")
	private Integer employeeId;
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
	@Column(name="startTime")
	private Date startTime;
	@Column(name="endTime")
	private Date endTime;
	@Column(name="reason")
	private String reason;
	@Column(name = "leavetype_id")
	private Integer masleavetypeId;
	@Column(name = "masleavetype")
	private String masleavetype;
	@Column(name="aim")
	private String aim;
	
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
	
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
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
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Integer getMasleavetypeId() {
		return masleavetypeId;
	}
	public void setMasleavetypeId(Integer masleavetypeId) {
		this.masleavetypeId = masleavetypeId;
	}
	public String getMasleavetype() {
		return masleavetype;
	}
	public void setMasleavetype(String masleavetype) {
		this.masleavetype = masleavetype;
	}
	public String getAim() {
		return aim;
	}
	public void setAim(String aim) {
		this.aim = aim;
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
	
	
	
	
	
}
