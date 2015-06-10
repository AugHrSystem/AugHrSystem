package com.aug.hr.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

 @NamedNativeQueries({
	@NamedNativeQuery(
            name = "insertFamily",
            query = "insert into EMP_EMPLOYEEFAMILY(FIRSTNAME,LASTNAME,AGE,ADDRESS,OCCUPATION,POSITION,TEL,MASRELATION_ID, "
              		+ "EMPLOYEE_ID,GENDER,AUDITFLAG,CREATEDBY,CREATEDTIMESTAMP) "
              		+ "values(:FIRSTNAME,:LASTNAME,:AGE,:ADDRESS,:OCCUPATION,:POSITION,:TEL, "
              		+ ":MASRELATION_ID,:EMPLOYEE_ID,:GENDER,'C',:CREATEDBY,NOW());",
              		resultClass=Family.class),
     @NamedNativeQuery(
             name = "updateFamily",
             query = "update EMP_EMPLOYEEFAMILY "
             		+ "SET FIRSTNAME=:FIRSTNAME,"
             		+ "LASTNAME=:LASTNAME,"
             		+ "AGE=:AGE,"
             		+ "ADDRESS=:ADDRESS,"
             		+ "OCCUPATION=:OCCUPATION,"
             		+ "POSITION=:POSITION,"
             		+ "TEL=:TEL,"
             		+ "MASRELATION_ID=:MASRELATION_ID, "
              	   // + "EMPLOYEE_ID=:EMPLOYEE_ID,"
              	    + "GENDER=:GENDER,"
              	    + "AUDITFLAG='U',"
              	    + "UPDATEDBY=:UPDATEDBY,"
              	    + "UPDATEDTIMESTAMP=NOW() "
              	    + "where ID=:familyId",
              	    resultClass=Family.class),
       @NamedNativeQuery(
                name = "deleteFamily",
                query = "delete from EMP_EMPLOYEEFAMILY where ID=:familyId",
                    resultClass=Family.class) 
  })



@Entity
@Table(name="EMP_EMPLOYEEFAMILY")
public class Family extends BaseEntity implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5187864989377656419L;
	private Integer id; //empFamilyId
	private String firstName;
	private String lastName;
	private String gender;
	private Integer age;
	private String mobile;
	private String address;
	private String occupation; 
	private String position; 
	private Employee employee;
	private MasRelationType masRelationType;
	/*@Transient
	private String relationName;
	@Transient
	private String status;
	@Transient
	private String name;*/
	
	
	@Id
	@GeneratedValue
	@Column(name="ID",length=6)
	public Integer getId() {
		return id;
	}
	
	
	public void setId(Integer id) {
		this.id = id;
	}

	
	
	@Column(name="FIRSTNAME",length=50)	
	@NotNull
	@NotEmpty
	public String getFirstName() {
		return firstName;
	}

	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	
	
	@Column(name="LASTNAME",length=50)
	@NotNull
	@NotEmpty
	public String getLastName() {
		return lastName;
	}
	
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	@Column(name="GENDER",length=10)
	@NotNull
	@NotEmpty
	public String getGender() {
		return gender;
	}
	
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	@Column(name="AGE",length=3)
	@NotNull
	public Integer getAge() {
		return age;
	}
	
	
	public void setAge(Integer age) {
		this.age = age;
	}
	
	
	
	
	@Column(name="TEL",length=10)
	@NotNull
	@NotEmpty
	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	@Column(name="ADDRESS")
	@NotNull
	@NotEmpty
	public String getAddress() {
		return address;
	}
	
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	@Column(name="OCCUPATION")
	public String getOccupation() {
		return occupation;
	}
	
	
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	
	@Column(name="POSITION")
	public String getPosition() {
		return position;
	}
	
	
	public void setPosition(String position) {
		this.position = position;
	}
	
	
   
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="MASRELATION_ID",nullable=false)
	public MasRelationType getMasRelation() {
		return masRelationType;
	}


	public void setMasRelation(MasRelationType masRelation) {
		this.masRelationType = masRelation;
	}
	
	
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="EMPLOYEE_ID",nullable=false)
	public Employee getEmployee() {
		return employee;
	}

	

	public void setEmployee(Employee employee){
		this.employee = employee;
	}



	/*public String getRelationName() {
		return relationName;
	}


	public void setRelationName(String relationName) {
		this.relationName = relationName;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

	

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	*/

	/*@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Family [id=");
		builder.append(id);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", age=");
		builder.append(age);
		builder.append(", mobile=");
		builder.append(mobile);
		builder.append(", address=");
		builder.append(address);
		builder.append(", occupation=");
		builder.append(occupation);
		builder.append(", position=");
		builder.append(position);
		builder.append(", employee=");
		builder.append(employee);
		builder.append(", masRelation=");
		builder.append(masRelationType);
		builder.append(", relationName=");
		builder.append(relationName);
		builder.append(", status=");
		builder.append(status);
		builder.append(", name=");
		builder.append(name);
		builder.append("]");
		return builder.toString();
	}*/

}
