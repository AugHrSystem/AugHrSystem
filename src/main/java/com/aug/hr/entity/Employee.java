/**
 *
 * @author natechanok
 * @date May 2, 2015
 */

package com.aug.hr.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "EMP_EMPLOYEE")
public class Employee extends BaseEntity{
	
	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;
	
	@Column(name = "EMPLOYEE_CODE",nullable = true)
	private String employeeCode;
	
	@Column(name = "NAME_THAI",nullable = false)
	private String nameThai;
	
	@Column(name = "SURNAME_THAI",nullable = true)
	private String surnameThai;
	
	@Column(name = "NICKNAME_THAI",nullable = true)
	private String nicknameThai;
	
	@Column(name = "NAME_ENG",nullable = true)
	private String nameEng;
	
	@Column(name = "SURNAM_ENG",nullable = true)
	private String surnameEng;
	
	@Column(name = "NICKNAME_ENG",nullable = true)
	private String nicknameEng;

	@Column(name = "TEL_HOME",nullable = true)
	private Integer telHome;
	
	@Column(name = "TEL_MOBILE",nullable = true)
	private Integer telMobile;
	
	@Column(name = "TEL_FAX",nullable = true)
	private Integer telFax;

	@Column(name = "EMERGENCY_CONTACT",nullable = true)
	private String emergencyContact;
	
	@Column(name = "RELATIONSHIP_WITH_EMERGENCY_CONTACT",nullable = true)
	private String relationshipWithEmergencyContact;
	
	@Column(name = "EMERGENCY_CONTACT_ADDRESS",nullable = true)
	private String emergencyContactAddress;
	
	@Column(name = "EMERGENCY_CONTACT_PHONE_NUMBER",nullable = true)
	private String emergencyContactPhoneNumber;
	
	@Column(name = "DATEOFBIRTH",nullable = true)
	private Date dateOfBirth;
	
	@Column(name = "PLACEOFBIRTH",nullable = true)
	private String placeOfBirth;
	
	@Column(name = "AGE",nullable = true)
	private Integer age;
	
	@Column(name = "RELIGION",nullable = true)
	private String religion;
	
	@Column(name = "ID_CARD",nullable = true)
	private Integer idCard;
	
	@Column(name = "ISSUED_OFFICE",nullable = true)
	private String issuedOffice;
	
	@Column(name = "EXPIRY_DATE",nullable = true)
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
	
	@Column(name = "FROM_YEAR",nullable = true)
	private Date fromYear;
	
	@Column(name = "TO_YEAR",nullable = true)
	private Date toYear;
	
	@Column(name = "BRANCH_OF_SERVICE",nullable = true)
	private String branchOfService;
	
	@Column(name = "SERVICE_NO",nullable = true)
	private String serviceNo;
	
	@Column(name = "MILITARY_SERVICE_NO",nullable = true)
	private String militaryServiceNo;
	
	@Column(name = "REASONS_NO",nullable = true)
	private String reasonsNo;
	
	@Column(name = "DATE_TO_BE_DRAFTED",nullable = true)
	private Date dateToBeDrafted;
	
	@Column(name = "PREVIOUS_EMPLOYER_YES",nullable = true)
	private String previousEmployerYes;
	
	@Column(name = "PREVIOUS_EMPLOYER_NO",nullable = true)
	private String previousEmployerNo;
	
	@Column(name = "PREVIOUSEMP_REASONS_NO",nullable = true)
	private String previousEmpreasonsNo;
	
	@Column(name = "ADDRESS_ID",nullable = true)
	@OneToMany(mappedBy = "employee", fetch=FetchType.EAGER)
	private Set<Address> addresses = new HashSet<Address>();

	 
	 @OneToOne(fetch=FetchType.LAZY)
	 @JoinColumn(name = "OFFICIAL_ID",nullable = true)
	 private Official official;
	 
	 
	 @OneToMany(mappedBy = "employee",fetch=FetchType.EAGER)
	 private Set<Education> educations = new HashSet<Education>();

	 @OneToMany(fetch = FetchType.EAGER, mappedBy = "employee", cascade=CascadeType.ALL, orphanRemoval=true)
	 private Set<MasCoreSkill> masCoreSkill = new HashSet<MasCoreSkill>();
		  
    @ManyToOne
    @JoinColumn(name= "EMPLOYMENT_ID")
    private MasEmployment masEmployment;
    
    @OneToMany(mappedBy = "employee", fetch=FetchType.EAGER)
    private Set<Ability> abilities = new HashSet<Ability>();
    
    @OneToMany(mappedBy = "employee", fetch=FetchType.EAGER)
    private Set<Reference> references = new HashSet<Reference>();
    
    @ManyToOne
    @JoinColumn(name= "DIVISION_ID")
    private MasDivision masDivision;
    
    @ManyToOne
    @JoinColumn(name= "JOBLEVEL_ID")
    private MasJoblevel masJoblevel;
    
    @OneToMany(mappedBy = "employee", fetch=FetchType.EAGER)
    private Set<Experience> experiences = new HashSet<Experience>();
	    
	 
 /* @OneToMany(mappedBy = "employee", fetch = FetchType.LAZY)
    private Set<TechnologyEmployee> technology = new HashSet<TechnologyEmployee>();
    
    @OneToMany(mappedBy = "employee", fetch = FetchType.LAZY, cascade=CascadeType.ALL,orphanRemoval=true)
    private Set<Family> families = new HashSet<Family>(); */

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


	public Set<Address> getAddresses() {
		return addresses;
	}


	public void setAddresses(Set<Address> addresses) {
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



	public Set<MasCoreSkill> getMasCoreSkill() {
		return masCoreSkill;
	}



	public void setMasCoreSkill(Set<MasCoreSkill> masCoreSkill) {
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



	public MasJoblevel getJoblevel() {
		return masJoblevel;
	}



	public void setJoblevel(MasJoblevel masJoblevel) {
		this.masJoblevel = masJoblevel;
	}



	public Set<Experience> getExperiences() {
		return experiences;
	}



	public void setExperiences(Set<Experience> experiences) {
		this.experiences = experiences;
	}


/*
	public Set<TechnologyEmployee> getTechnology() {
		return technology;
	}



	public void setTechnology(Set<TechnologyEmployee> technology) {
		this.technology = technology;
	}



	public Set<Family> getFamilies() {
		return families;
	}



	public void setFamilies(Set<Family> families) {
		this.families = families;
	}
	 
	 */
	 
	 
}