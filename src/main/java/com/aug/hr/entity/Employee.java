/**
 *
 * @author natechanok
 * @date May 2, 2015
 */

package com.aug.hr.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.NamedNativeQueries;
import org.hibernate.annotations.NamedNativeQuery;

import com.aug.hr.entity.dto.ExperienceDto;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;


@NamedNativeQueries({
	@NamedNativeQuery(
            name = "insertEmployee",
            query = "insert into EMP_EMPLOYEE("
            		+"EMPLOYEE_CODE,"
            		+ "NAME_THAI,"
            		+ "SURNAME_THAI,"
            		+ "NICKNAME_THAI,"
            		+ "NAME_ENG,"
            		+ "SURNAME_ENG,"
            		+ "NICKNAME_ENG,"
            		+ "EMAIL,"
            		+ "TEL_HOME,"
            		+ "TEL_MOBILE,"
            		+ "TEL_FAX,"
            		+ "CONGENITAL_DISEASE,"
            		+ "HOSPITAL,"
            		+ "EMERGENCY_CONTACT,"
            		+ "RELATIONSHIP_WITH_EMERGENCY_CONTACT,"
            		+ "EMERGENCY_CONTACT_ADDRESS,"
            		+ "EMERGENCY_CONTACT_PHONE_NUMBER,"
            		+ "DATEOFBIRTH,"
            		+ "PLACEOFBIRTH,"
            		+ "AGE,"
            		+ "RELIGION,"
            		+ "ID_CARD,"
            		+ "ISSUED_OFFICE,"
            		+ "EXPIRY_DATE,"
            		+ "HEIGHT,"
            		+ "WEIGTH,"
            		+ "SEX,"
            		+ "MARITAL_STATUS,"
            		+ "NUMBER_OF_CHILDREN,"
            		+ "SPOUSE_NAME,"
            		+ "MARRIAGE_CERTIFICATE_NO,"
            		+ "ISSUED_OFFICE2,"
            		+ "ADDRESS,"
            		+ "OCCUPATION,"
            		+ "KNOW_AUG_NEWSPAPER,"
            		+ "DESCRIPTION_NEWSPAPER,"
            		+ "KNOW_AUG_MAGAZINE,"
            		+ "DESCRIPTION_MAGAZINE,"
            		+ "KNOW_AUG_WEBSITE,"
            		+ "DESCRIPTION_WEBSITE,"
            		+ "KNOW_AUG_FRIEND,"
            		+ "DESCRIPTION_FRIEND,"
            		+ "KNOW_AUG_OTHER,"
            		+ "DESCRIPTION_OTHER,"
            		+ "KNOW_EMPLOYED_YES,"
            		+ "DESCRIPTION_YES,"
            		+ "KNOW_EMPLOYER_NO,"
            		+ "MILITARY_SERVICE_YES,"
            		+ "FROM_YEAR,"
					+ "TO_YEAR,"
            		+ "BRANCH_OF_SERVICE,"
            		+ "SERVICE_NO,"
            		+ "MILITARY_SERVICE_NO,"
            		+ "REASONS_NO,"
            		+ "DATE_TO_BE_DRAFTED,"
            		+ "PREVIOUS_EMPLOYER_YES,"
            		+ "PREVIOUS_EMPLOYER_NO,"
            		+ "PREVIOUSEMP_REASONS_NO,"
            		+ "IMAGE,"
            		+ "ISMANAGER,"
            		+ "AIM_EMP_ID,"
            		+ "DIVISION_ID,"
            		+ "JOBLEVEL_ID,"
            		+ "EMPLOYMENT_ID,"
            		+ "TECHNOLOGY_ID,"
            		+ "MAS_CORE_SKILL_ID,"
            		+ "STAFFTYPE_ID,"
            		+ "LOCATION_ID,"
            		+ "OFFICIAL_ID, "
            		+ "ISMANAGER,"
            		+ "AIM_EMP_ID"
            		+ ") "
            		+ " values("
            		+ ":EMPLOYEE_CODE,"
            		+ ":NAME_THAI,"
            		+ ":SURNAME_THAI,"
            		+ ":NICKNAME_THAI,"
            		+ ":NAME_ENG,"
            		+ ":SURNAME_ENG,"
            		+ ":NICKNAME_ENG,"
            		+ ":EMAIL,"
            		+ ":TEL_HOME,"
            		+ ":TEL_MOBILE,"
            		+ ":TEL_FAX,"
            		+ ":CONGENITAL_DISEASE,"
            		+ ":HOSPITAL,"
            		+ ":EMERGENCY_CONTACT,"
            		+ ":RELATIONSHIP_WITH_EMERGENCY_CONTACT,"
            		+ ":EMERGENCY_CONTACT_ADDRESS,"
            		+ ":EMERGENCY_CONTACT_PHONE_NUMBER,"
            		+ ":DATEOFBIRTH,"
            		+ ":PLACEOFBIRTH,"
            		+ ":AGE,"
            		+ ":RELIGION,"
            		+ ":ID_CARD,"
            		+ ":ISSUED_OFFICE,"
            		+ ":EXPIRY_DATE,"
            		+ ":HEIGHT,"
            		+ ":WEIGTH,"
            		+ ":SEX,"
            		+ ":MARITAL_STATUS,"
            		+ ":NUMBER_OF_CHILDREN,"
            		+ ":SPOUSE_NAME,"
            		+ ":MARRIAGE_CERTIFICATE_NO,"
            		+ ":ISSUED_OFFICE2,"
            		+ ":ADDRESS,"
            		+ ":OCCUPATION,"
            		+ ":KNOW_AUG_NEWSPAPER,"
            		+ ":DESCRIPTION_NEWSPAPER,"
            		+ ":KNOW_AUG_MAGAZINE,"
            		+ ":DESCRIPTION_MAGAZINE,"
            		+ ":KNOW_AUG_WEBSITE,"
            		+ ":DESCRIPTION_WEBSITE,"
            		+ ":KNOW_AUG_FRIEND,"
            		+ ":DESCRIPTION_FRIEND,"
            		+ ":KNOW_AUG_OTHER,"
            		+ ":DESCRIPTION_OTHER,"
            		+ ":KNOW_EMPLOYED_YES,"
            		+ ":DESCRIPTION_YES,"
            		+ ":KNOW_EMPLOYER_NO,"
            		+ ":MILITARY_SERVICE_YES,"
            		+ ":FROM_YEAR,"
            		+ ":TO_YEAR,"
            		+ ":BRANCH_OF_SERVICE,"
            		+ ":SERVICE_NO,"
            		+ ":MILITARY_SERVICE_NO,"
            		+ ":REASONS_NO,"
            		+ ":DATE_TO_BE_DRAFTED,"
            		+ ":PREVIOUS_EMPLOYER_YES,"
            		+ ":PREVIOUS_EMPLOYER_NO,"
            		+ ":PREVIOUSEMP_REASONS_NO,"
            		+ ":IMAGE,"
            		+ ":ISMANAGER,"
            		+ ":AIM_EMP_ID,"
            		+ ":DIVISION_ID,"
            		+ ":JOBLEVEL_ID,"
            		+ ":EMPLOYMENT_ID,"
            		+ ":TECHNOLOGY_ID,"
            		+ ":MAS_CORE_SKILL_ID,"
            		+ ":STAFFTYPE_ID,"
            		+ ":LOCATION_ID,"
            		+ ":OFFICIAL_ID,"
            		+ ":ISMANAGER,"
            		+ ":AIM_EMP_ID"
            		+ ")"
            		,resultClass= Employee.class),
 

	@NamedNativeQuery(
            name = "searchIdEmptoAddress",
            //query = "select * from EMP_EMPLOYEE  ORDER BY createdTimeStamp LIMIT 1;", 
            query = "select * from EMP_EMPLOYEE  ORDER BY ID desc LIMIT 1;",
            resultClass = Employee.class)
  })



@Entity
@Table(name = "EMP_EMPLOYEE",uniqueConstraints = {@UniqueConstraint(columnNames = {"id"})})
//@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property="id")
public class Employee extends BaseEntity{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID")
	private Integer id;
	
	@Column(name = "EMPLOYEE_CODE",nullable = false)
	private String employeeCode;
	
	@Column(name = "NAME_THAI",nullable = false)
	private String nameThai;
	
	@Column(name = "SURNAME_THAI",nullable = true)
	private String surnameThai;
		
	@Column(name = "NICKNAME_THAI",nullable = true)
	private String nicknameThai;
	
	@Column(name = "NAME_ENG",nullable = false)
	private String nameEng;
	
	@Column(name = "SURNAME_ENG",nullable = true)
	private String surnameEng;
	
	@Column(name = "NICKNAME_ENG",nullable = true)
	private String nicknameEng;

	@Column(name = "EMAIL",nullable = false)
	private String email;
	
	@Column(name = "TEL_HOME",nullable = false)
	private Integer telHome;
	
	@Column(name = "TEL_MOBILE",nullable = false)
	private Integer telMobile;
	
	@Column(name = "TEL_FAX",nullable = true)
	private Integer telFax;
	
	@Column(name = "CONGENITAL_DISEASE",nullable = true)
	private String congenitalDisease;
	
	@Column(name = "HOSPITAL",nullable = true)
	private String hospital;
	
	@Column(name = "EMERGENCY_CONTACT",nullable = false)
	private String emergencyContact;
	
	@Column(name = "RELATIONSHIP_WITH_EMERGENCY_CONTACT",nullable = true)
	private String relationshipWithEmergencyContact;
	
	@Column(name = "EMERGENCY_CONTACT_ADDRESS",nullable = true)
	private String emergencyContactAddress;
	
	@Column(name = "EMERGENCY_CONTACT_PHONE_NUMBER",nullable = false)
	private String emergencyContactPhoneNumber;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-mm-yyyy")
	@Column(name = "DATEOFBIRTH",nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateOfBirth;
	
	@Column(name = "PLACEOFBIRTH",nullable = true)
	private String placeOfBirth;
	
	@Column(name = "AGE",nullable = true)
	private Integer age;
	
	@Column(name = "RELIGION",nullable = true)
	private String religion;
	
	@Column(name = "ID_CARD",nullable = false)
	private Integer idCard;
	
	@Column(name = "ISSUED_OFFICE",nullable = true)
	private String issuedOffice;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-mm-yyyy")
	@Column(name = "EXPIRY_DATE",nullable = true)
	@Temporal(TemporalType.TIMESTAMP)
	private Date expiryDate;
	
	@Column(name = "HEIGHT",nullable = true)
	private Integer height;
	
	@Column(name = "WEIGTH",nullable = true)
	private Integer weigth;
	
	@Column(name = "SEX",nullable = true)
	private String sex;

	@Column(name = "MARITAL_STATUS",nullable = true)
	private String maritalStatus;
	
	@Column(name = "NUMBER_OF_CHILDREN",nullable = true)
	private String numberOfChildren;
	
	@Column(name = "SPOUSE_NAME",nullable = true)
	private String spouseName;
	
	@Column(name = "MARRIAGE_CERTIFICATE_NO",nullable = true)
	private String marriageCertificateNo;
	
	@Column(name = "ISSUED_OFFICE2",nullable = true)
	private String issuedOffice2;
	
	@Column(name = "ADDRESS",nullable = true)
	private String address;
	
	@Column(name = "OCCUPATION",nullable = true)
	private String occupation;
	
	@Column(name = "KNOW_AUG_NEWSPAPER",nullable = true)
	private String knowAugNewspaper;
	
	@Column(name = "DESCRIPTION_NEWSPAPER",nullable = true)
	private String descriptionNewspaper;
	
	@Column(name = "KNOW_AUG_MAGAZINE",nullable = true)
	private String knowAugMagazine;
	
	@Column(name = "DESCRIPTION_MAGAZINE",nullable = true)
	private String descriptionMagazine;
	
	@Column(name = "KNOW_AUG_WEBSITE",nullable = true)
	private String knowAugWebsite;
	
	@Column(name = "DESCRIPTION_WEBSITE",nullable = true)
	private String descriptionWebsite;
	
	@Column(name = "KNOW_AUG_FRIEND",nullable = true)
	private String knowAugFriend;
	
	@Column(name = "DESCRIPTION_FRIEND",nullable = true)
	private String descriptionFriend;
	
	@Column(name = "KNOW_AUG_OTHER",nullable = true)
	private String knowAugOther;
	
	@Column(name = "DESCRIPTION_OTHER",nullable = true)
	private String descriptionOther;
	
	@Column(name = "KNOW_EMPLOYED_YES",nullable = true)
	private String knowEmployedYes;
	
	@Column(name = "DESCRIPTION_YES",nullable = true)
	private String descriptionYes;
	
	@Column(name = "KNOW_EMPLOYER_NO",nullable = true)
	private String knowEmployerNo;
	
	@Column(name = "MILITARY_SERVICE_YES",nullable = true)
	private String militaryServiceYes;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-mm-yyyy")
	@Column(name = "FROM_YEAR",nullable = true)
	@Temporal(TemporalType.TIMESTAMP)
	private Date fromYear;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-mm-yyyy")
	@Column(name = "TO_YEAR",nullable = true)
	@Temporal(TemporalType.TIMESTAMP)
	private Date toYear;
	
	@Column(name = "BRANCH_OF_SERVICE",nullable = true)
	private String branchOfService;
	
	@Column(name = "SERVICE_NO",nullable = true)
	private String serviceNo;
	
	@Column(name = "MILITARY_SERVICE_NO",nullable = true)
	private String militaryServiceNo;
	
	@Column(name = "REASONS_NO",nullable = true)
	private String reasonsNo;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-mm-yyyy")
	@Column(name = "DATE_TO_BE_DRAFTED",nullable = true)
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateToBeDrafted;
	
	@Column(name = "PREVIOUS_EMPLOYER_YES",nullable = true)
	private String previousEmployerYes;
	
	@Column(name = "PREVIOUS_EMPLOYER_NO",nullable = true)
	private String previousEmployerNo;
	
	@Column(name = "PREVIOUSEMP_REASONS_NO",nullable = true)
	private String previousEmpreasonsNo;
	
	@Column(name = "IMAGE",nullable = true)
	private String image;
	
	@Column(name = "ISMANAGER",nullable = true)
	private Integer isManager;
	
//------------------self relation-------------------
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="AIM_EMP_ID",referencedColumnName="id",nullable = true)
	private Employee aimempid;
	
	@OneToMany(mappedBy="aimempid", fetch=FetchType.EAGER,cascade=CascadeType.ALL,orphanRemoval=true)
//	@JsonIgnore
	private Set<Employee> staffs = new HashSet<Employee>();
	
	
	public Employee getAimempid() {
		return aimempid;
	}

	public void setAimempid(Employee aimempid) {
		this.aimempid = aimempid;
	}


	public Set<Employee> getStaffs() {
		return staffs;
	}

	public void setStaffs(Set<Employee> staffs) {
		this.staffs = staffs;
	}



	
//------------------end self relation-----------------
	



	@Column(name = "ADDRESS_ID",nullable = true)
	@OneToMany(mappedBy = "employee", fetch=FetchType.LAZY)

//	@JsonIgnore
	private List<Address> addresses = new ArrayList<Address>();

	 
	 @OneToOne(fetch=FetchType.LAZY)
	 @JoinColumn(name = "OFFICIAL_ID",nullable = true)
	 private Official official;
	 
	 
	 @OneToMany(mappedBy = "employee")
	 private Set<Education> educations = new HashSet<Education>();
	 
	 @OneToMany(mappedBy = "employee")
	 private Set<Allowances> allowances = new HashSet<Allowances>();
	 
	 @OneToMany(mappedBy = "employee")
	 private Set<History> histories = new HashSet<History>();
	 
	 @ManyToOne(fetch=FetchType.EAGER)
	 @JoinColumn(name= "MAS_CORE_SKILL_ID")

//	 @JsonIgnore
	 private MasCoreSkill masCoreSkill;
	 
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name= "EMPLOYMENT_ID")

    @JsonIgnore
    private MasEmployment masEmployment;
    
    @OneToMany(mappedBy = "employee", fetch=FetchType.LAZY)

//    @JsonIgnore
    private Set<Ability> abilities = new HashSet<Ability>();
    
    @OneToMany(mappedBy = "employee", fetch=FetchType.LAZY)
    private Set<Reference> references = new HashSet<Reference>();
    
   
    @OneToMany(mappedBy = "employee", fetch=FetchType.LAZY)
    private Set<Certification> certifications  = new HashSet<Certification>();
    
    @OneToMany(mappedBy = "employee", fetch=FetchType.LAZY)
    private Set<Leave> leaves  = new HashSet<Leave>();
    
    @OneToMany(mappedBy = "employee", fetch=FetchType.LAZY)
    private Set<Punish> punishs  = new HashSet<Punish>();
    
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name= "DIVISION_ID", referencedColumnName="id",nullable = false)

//    @JsonIgnore
    private MasDivision masDivision;
    
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name= "JOBLEVEL_ID", referencedColumnName="id",nullable = false)
//    @JsonIgnore
    private MasJoblevel masJoblevel;
    
    @OneToMany(mappedBy = "employee", fetch=FetchType.LAZY)

//    @JsonIgnore
    private Set<Experience> experiences = new HashSet<Experience>();
	    

    @ManyToOne(fetch=FetchType.EAGER) 
    @JoinColumn(name= "TECHNOLOGY_ID", referencedColumnName="id",nullable = true)
 //   @JsonIgnore
    private MasTechnology technology;
    
    
    @OneToMany(mappedBy = "employee", fetch = FetchType.LAZY, cascade=CascadeType.ALL,orphanRemoval=true)
    private Set<Family> families = new HashSet<Family>(); 
    
    
    @OneToMany(mappedBy = "employee", fetch = FetchType.LAZY)
    @JsonIgnore
    private Set<Reward> rewards  = new HashSet<Reward>();
    
    
    @OneToMany(mappedBy = "employee", fetch = FetchType.LAZY)
    @JsonIgnore
    private Set<Card> cards = new HashSet<Card>();
    
    
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name= "STAFFTYPE_ID")

 //   @JsonIgnore
    private MasStaffType masStaffType;


    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name= "LOCATION_ID")
    private MasLocation masLocation;
    
    @OneToMany(mappedBy = "employee", fetch = FetchType.LAZY)
    @JsonIgnore
    private Set<Probation> probations = new HashSet<Probation>();
   
    @Transient
    private String status;
    
    
   @Transient
   private Integer masCoreSkillId;
    
   
   @Transient
   private Integer technologyId;
   
   
   public Integer getIsManager() {
	return isManager;
}

public void setIsManager(Integer isManager) {
	this.isManager = isManager;
}




@OneToMany(mappedBy = "employee", fetch = FetchType.LAZY,cascade={CascadeType.PERSIST,CascadeType.MERGE})
   //@JsonBackReference
   private Set<SkillLanguage> skillLanguage = new HashSet<SkillLanguage>();
   
   
   
   @OneToMany(mappedBy = "employee")
   private Set<Site> site = new HashSet<Site>();
   
	@OneToOne(fetch=FetchType.LAZY,mappedBy="employee")
	private Login login;
   
 //-------------------------------------- getter setter --------------------------------------------------//

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


	public String getNameThai() {
		return nameThai;
	}


	public void setNameThai(String nameThai) {
		this.nameThai = nameThai;
	}


	public String getSurnameThai() {
		return surnameThai;
	}


	public void setSurnameThai(String surnameThai) {
		this.surnameThai = surnameThai;
	}


	public String getNicknameThai() {
		return nicknameThai;
	}


	public void setNicknameThai(String nicknameThai) {
		this.nicknameThai = nicknameThai;
	}


	public String getNameEng() {
		return nameEng;
	}


	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}


	public String getSurnameEng() {
		return surnameEng;
	}


	public void setSurnameEng(String surnameEng) {
		this.surnameEng = surnameEng;
	}


	public String getNicknameEng() {
		return nicknameEng;
	}


	public void setNicknameEng(String nicknameEng) {
		this.nicknameEng = nicknameEng;
	}

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCongenitalDisease() {
		return congenitalDisease;
	}

	public void setCongenitalDisease(String congenitalDisease) {
		this.congenitalDisease = congenitalDisease;
	}

	public String getHospital() {
		return hospital;
	}

	public void setHospital(String hospital) {
		this.hospital = hospital;
	}

	public Integer getTelHome() {
		return telHome;
	}


	public void setTelHome(Integer telHome) {
		this.telHome = telHome;
	}


	public Integer getTelMobile() {
		return telMobile;
	}


	public void setTelMobile(Integer telMobile) {
		this.telMobile = telMobile;
	}


	public Integer getTelFax() {
		return telFax;
	}


	public void setTelFax(Integer telFax) {
		this.telFax = telFax;
	}


	public String getEmergencyContact() {
		return emergencyContact;
	}


	public void setEmergencyContact(String emergencyContact) {
		this.emergencyContact = emergencyContact;
	}


	public String getRelationshipWithEmergencyContact() {
		return relationshipWithEmergencyContact;
	}


	public void setRelationshipWithEmergencyContact(
			String relationshipWithEmergencyContact) {
		this.relationshipWithEmergencyContact = relationshipWithEmergencyContact;
	}


	public String getEmergencyContactAddress() {
		return emergencyContactAddress;
	}


	public void setEmergencyContactAddress(String emergencyContactAddress) {
		this.emergencyContactAddress = emergencyContactAddress;
	}


	public String getEmergencyContactPhoneNumber() {
		return emergencyContactPhoneNumber;
	}


	public void setEmergencyContactPhoneNumber(String emergencyContactPhoneNumber) {
		this.emergencyContactPhoneNumber = emergencyContactPhoneNumber;
	}


	public Date getDateOfBirth() {
		return dateOfBirth;
	}


	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}


	public String getPlaceOfBirth() {
		return placeOfBirth;
	}


	public void setPlaceOfBirth(String placeOfBirth) {
		this.placeOfBirth = placeOfBirth;
	}


	public Integer getAge() {
		return age;
	}


	public void setAge(Integer age) {
		this.age = age;
	}


	public String getReligion() {
		return religion;
	}


	public void setReligion(String religion) {
		this.religion = religion;
	}


	public Integer getIdCard() {
		return idCard;

	}


	public void setIdCard(Integer idCard) {
		this.idCard = idCard;
	}


	public String getIssuedOffice() {
		return issuedOffice;
	}


	public void setIssuedOffice(String issuedOffice) {
		this.issuedOffice = issuedOffice;
	}


	public Date getExpiryDate() {
		return expiryDate;
	}


	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}


	public Integer getHeight() {
		return height;
	}


	public void setHeight(Integer height) {
		this.height = height;
	}


	public Integer getWeigth() {
		return weigth;
	}


	public void setWeigth(Integer weigth) {
		this.weigth = weigth;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getMaritalStatus() {
		return maritalStatus;
	}


	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}


	public String getNumberOfChildren() {
		return numberOfChildren;
	}


	public void setNumberOfChildren(String numberOfChildren) {
		this.numberOfChildren = numberOfChildren;
	}


	public String getSpouseName() {
		return spouseName;
	}


	public void setSpouseName(String spouseName) {
		this.spouseName = spouseName;
	}


	public String getMarriageCertificateNo() {
		return marriageCertificateNo;
	}


	public void setMarriageCertificateNo(String marriageCertificateNo) {
		this.marriageCertificateNo = marriageCertificateNo;
	}


	public String getIssuedOffice2() {
		return issuedOffice2;
	}


	public void setIssuedOffice2(String issuedOffice2) {
		this.issuedOffice2 = issuedOffice2;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getOccupation() {
		return occupation;
	}


	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}


	public String getKnowAugNewspaper() {
		return knowAugNewspaper;
	}


	public void setKnowAugNewspaper(String knowAugNewspaper) {
		this.knowAugNewspaper = knowAugNewspaper;
	}


	public String getDescriptionNewspaper() {
		return descriptionNewspaper;
	}


	public void setDescriptionNewspaper(String descriptionNewspaper) {
		this.descriptionNewspaper = descriptionNewspaper;
	}


	public String getKnowAugMagazine() {
		return knowAugMagazine;
	}


	public void setKnowAugMagazine(String knowAugMagazine) {
		this.knowAugMagazine = knowAugMagazine;
	}


	public String getDescriptionMagazine() {
		return descriptionMagazine;
	}


	public void setDescriptionMagazine(String descriptionMagazine) {
		this.descriptionMagazine = descriptionMagazine;
	}


	public String getKnowAugWebsite() {
		return knowAugWebsite;
	}


	public void setKnowAugWebsite(String knowAugWebsite) {
		this.knowAugWebsite = knowAugWebsite;
	}


	public String getDescriptionWebsite() {
		return descriptionWebsite;
	}


	public void setDescriptionWebsite(String descriptionWebsite) {
		this.descriptionWebsite = descriptionWebsite;
	}


	public String getKnowAugFriend() {
		return knowAugFriend;
	}


	public void setKnowAugFriend(String knowAugFriend) {
		this.knowAugFriend = knowAugFriend;
	}


	public String getDescriptionFriend() {
		return descriptionFriend;
	}


	public void setDescriptionFriend(String descriptionFriend) {
		this.descriptionFriend = descriptionFriend;
	}


	public String getKnowAugOther() {
		return knowAugOther;
	}


	public void setKnowAugOther(String knowAugOther) {
		this.knowAugOther = knowAugOther;
	}


	public String getDescriptionOther() {
		return descriptionOther;
	}


	public void setDescriptionOther(String descriptionOther) {
		this.descriptionOther = descriptionOther;
	}


	public String getKnowEmployedYes() {
		return knowEmployedYes;
	}


	public void setKnowEmployedYes(String knowEmployedYes) {
		this.knowEmployedYes = knowEmployedYes;
	}


	public String getDescriptionYes() {
		return descriptionYes;
	}


	public void setDescriptionYes(String descriptionYes) {
		this.descriptionYes = descriptionYes;
	}


	public String getKnowEmployerNo() {
		return knowEmployerNo;
	}


	public void setKnowEmployerNo(String knowEmployerNo) {
		this.knowEmployerNo = knowEmployerNo;
	}


	public String getMilitaryServiceYes() {
		return militaryServiceYes;
	}


	public void setMilitaryServiceYes(String militaryServiceYes) {
		this.militaryServiceYes = militaryServiceYes;
	}


	public Date getFromYear() {
		return fromYear;
	}


	public void setFromYear(Date fromYear) {
		this.fromYear = fromYear;
	}


	public Date getToYear() {
		return toYear;
	}


	public void setToYear(Date toYear) {
		this.toYear = toYear;
	}


	public String getBranchOfService() {
		return branchOfService;
	}


	public void setBranchOfService(String branchOfService) {
		this.branchOfService = branchOfService;
	}


	public String getMilitaryServiceNo() {
		return militaryServiceNo;
	}


	public void setMilitaryServiceNo(String militaryServiceNo) {
		this.militaryServiceNo = militaryServiceNo;
	}


	public String getReasonsNo() {
		return reasonsNo;
	}


	public void setReasonsNo(String reasonsNo) {
		this.reasonsNo = reasonsNo;
	}


	public Date getDateToBeDrafted() {
		return dateToBeDrafted;
	}


	public void setDateToBeDrafted(Date dateToBeDrafted) {
		this.dateToBeDrafted = dateToBeDrafted;
	}


	public String getPreviousEmployerYes() {
		return previousEmployerYes;
	}


	public void setPreviousEmployerYes(String previousEmployerYes) {
		this.previousEmployerYes = previousEmployerYes;
	}


	public String getPreviousEmployerNo() {
		return previousEmployerNo;
	}


	public void setPreviousEmployerNo(String previousEmployerNo) {
		this.previousEmployerNo = previousEmployerNo;
	}


	public String getPreviousEmpreasonsNo() {
		return previousEmpreasonsNo;
	}


	public void setPreviousEmpreasonsNo(String previousEmpreasonsNo) {
		this.previousEmpreasonsNo = previousEmpreasonsNo;
	}


	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	public Official getOfficial() {
		return official;
	}


	public void setOfficial(Official official) {
		this.official = official;
	}



	public String getServiceNo() {
		return serviceNo;
	}



	public void setServiceNo(String serviceNo) {
		this.serviceNo = serviceNo;
	}



	public Set<Education> getEducations() {
		return educations;
	}



	public void setEducations(Set<Education> educations) {
		this.educations = educations;
	}



	public MasCoreSkill getMasCoreSkill() {
		return masCoreSkill;
	}

	
	public void setMasCoreSkill(MasCoreSkill masCoreSkill) {
		this.masCoreSkill = masCoreSkill;
	}
	

	public MasEmployment getEmployment() {
		return masEmployment;
	}



	public void setEmployment(MasEmployment employment) {
		this.masEmployment = employment;
	}



	public Set<Ability> getAbilities() {
		return abilities;
	}



	public void setAbilities(Set<Ability> abilities) {
		this.abilities = abilities;
	}



	public Set<Reference> getReferences() {
		return references;
	}



	public void setReferences(Set<Reference> references) {
		this.references = references;
	}



	public MasDivision getMasDivision() {
		return masDivision;
	}



	public void setMasDivision(MasDivision masDivision) {
		this.masDivision = masDivision;
	}


	
	public Set<History> getHistories() {
		return histories;
	}



	public void setHistories(Set<History> histories) {
		this.histories = histories;
	}



	public Set<Experience> getExperiences() {
		return experiences;
	}



	public void setExperiences(Set<Experience> experiences) {
		this.experiences = experiences;
	}



	public Set<Family> getFamilies() {
		return families;
	}



	public void setFamilies(Set<Family> families) {
		this.families = families;
	}

	public MasEmployment getMasEmployment() {
		return masEmployment;
	}

	public void setMasEmployment(MasEmployment masEmployment) {
		this.masEmployment = masEmployment;
	}

	public MasJoblevel getMasJoblevel() {
		return masJoblevel;
	}

	public void setMasJoblevel(MasJoblevel masJoblevel) {
		this.masJoblevel = masJoblevel;
	}


	public MasTechnology getTechnology() {
		return technology;
	}

	public void setTechnology(MasTechnology technology) {
		this.technology = technology;
	}

	public MasLocation getMasLocation() {
		return masLocation;
	}

	public void setMasLocation(MasLocation masLocation) {
		this.masLocation = masLocation;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getMasCoreSkillId() {
		return masCoreSkillId;
	}

	public void setMasCoreSkillId(Integer masCoreSkillId) {
		this.masCoreSkillId = masCoreSkillId;
	}

	public Integer getTechnologyId() {
		return technologyId;
	}

	public void setTechnologyId(Integer technologyId) {
		this.technologyId = technologyId;
	}

	public MasStaffType getMasStaffType() {
		return masStaffType;
	}

	public void setMasStaffType(MasStaffType masStaffType) {
		this.masStaffType = masStaffType;
	}
	
	public Set<Probation> getProbations() {
		return probations;
	}

	public void setProbations(Set<Probation> probations) {
		this.probations = probations;
	}
	
	
	public Set<Punish> getPunishs() {
		return punishs;
	}

	public void setPunishs(Set<Punish> punishs) {
		this.punishs = punishs;
	}
	
	



	/*@Override
	public String toString() {
		return "Employee [id=" + id + ", employeeCode=" + employeeCode
				+ ", nameThai=" + nameThai + ", surnameThai=" + surnameThai
				+ ", nicknameThai=" + nicknameThai + ", nameEng=" + nameEng
				+ ", surnameEng=" + surnameEng + ", nicknameEng=" + nicknameEng
				+ ", telHome=" + telHome + ", telMobile=" + telMobile
				+ ", telFax=" + telFax + ", emergencyContact="
				+ emergencyContact + ", relationshipWithEmergencyContact="
				+ relationshipWithEmergencyContact
				+ ", emergencyContactAddress=" + emergencyContactAddress
				+ ", emergencyContactPhoneNumber="
				+ emergencyContactPhoneNumber + ", dateOfBirth=" + dateOfBirth
				+ ", placeOfBirth=" + placeOfBirth + ", age=" + age
				+ ", religion=" + religion + ", idCard=" + idCard
				+ ", issuedOffice=" + issuedOffice + ", expiryDate="
				+ expiryDate + ", height=" + height + ", weigth=" + weigth
				+ ", sex=" + sex + ", maritalStatus=" + maritalStatus
				+ ", numberOfChildren=" + numberOfChildren + ", spouseName="
				+ spouseName + ", marriageCertificateNo="
				+ marriageCertificateNo + ", issuedOffice2=" + issuedOffice2
				+ ", address=" + address + ", occupation=" + occupation
				+ ", knowAugNewspaper=" + knowAugNewspaper
				+ ", descriptionNewspaper=" + descriptionNewspaper
				+ ", knowAugMagazine=" + knowAugMagazine
				+ ", descriptionMagazine=" + descriptionMagazine
				+ ", knowAugWebsite=" + knowAugWebsite
				+ ", descriptionWebsite=" + descriptionWebsite
				+ ", knowAugFriend=" + knowAugFriend + ", descriptionFriend="
				+ descriptionFriend + ", knowAugOther=" + knowAugOther
				+ ", descriptionOther=" + descriptionOther
				+ ", knowEmployedYes=" + knowEmployedYes + ", descriptionYes="
				+ descriptionYes + ", knowEmployerNo=" + knowEmployerNo
				+ ", militaryServiceYes=" + militaryServiceYes + ", fromYear="
				+ fromYear + ", toYear=" + toYear + ", branchOfService="
				+ branchOfService + ", serviceNo=" + serviceNo
				+ ", militaryServiceNo=" + militaryServiceNo + ", reasonsNo="
				+ reasonsNo + ", dateToBeDrafted=" + dateToBeDrafted
				+ ", previousEmployerYes=" + previousEmployerYes
				+ ", previousEmployerNo=" + previousEmployerNo
				+ ", previousEmpreasonsNo=" + previousEmpreasonsNo
				+ ", aimempid=" + aimempid + ", staffs=" + staffs
				+ ", addresses=" + addresses + ", official=" + official
				+ ", educations=" + educations + ", histories=" + histories
				+ ", masCoreSkill=" + masCoreSkill + ", masEmployment="
				+ masEmployment + ", abilities=" + abilities + ", references="
				+ references + ", punishs=" + punishs + ", masDivision="
				+ masDivision + ", masJoblevel=" + masJoblevel
				+ ", experiences=" + experiences + ", technology=" + technology
				+ ", families=" + families + ", masStaffType=" + masStaffType
				+ ", masLocation=" + masLocation + ", probations=" + probations
				+ ", status=" + status + ", masCoreSkillId=" + masCoreSkillId
				+ ", technologyId=" + technologyId + "]";
	}*/


	public Set<Leave> getLeaves() {
		return leaves;
	}

	public void setLeaves(Set<Leave> leaves) {
		this.leaves = leaves;
	}

	public Set<Site> getSite() {
		return site;
	}

	public void setSite(Set<Site> site) {
		this.site = site;
	}



	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}


	
	public Set<SkillLanguage> getSkillLanguage() {
		return skillLanguage;
	}

	public void setSkillLanguage(Set<SkillLanguage> skillLanguage) {
		this.skillLanguage = skillLanguage;
	}
	

	public Set<Reward> getRewards() {
		return rewards;
	}

	public void setRewards(Set<Reward> rewards) {
		this.rewards = rewards;
	}
	
	public Set<Card> getAttendances() {
		return cards;
	}

	public void setAttendances(Set<Card> cards) {
		this.cards = cards;
	}

	public Set<Certification> getCertifications() {
		return certifications;
	}

	public void setCertifications(Set<Certification> certifications) {
		this.certifications = certifications;
	}
	
	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	public Integer getIsManager() {
		return isManager;
	}

	public void setIsManager(Integer isManager) {
		this.isManager = isManager;
	}

	
}