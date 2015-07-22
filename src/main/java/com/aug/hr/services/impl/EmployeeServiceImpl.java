/**
 *
 * @author natechanok
 * @date Apr 29, 2015
 */

package com.aug.hr.services.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.swing.JOptionPane;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.InvalidTransactionException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.TransactionManager;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Hibernate;
import org.hibernate.JDBCException;
import org.hibernate.Transaction;
import org.hibernate.util.JDBCExceptionReporter;
import org.omg.CORBA.portable.ApplicationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.exception.CustomException;
import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.Address;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasAddressType;
import com.aug.hr.entity.MasCoreSkill;
import com.aug.hr.entity.MasDivision;
import com.aug.hr.entity.MasEmployment;
import com.aug.hr.entity.MasJoblevel;
import com.aug.hr.entity.MasLocation;
import com.aug.hr.entity.MasProvince;
import com.aug.hr.entity.MasStaffType;
import com.aug.hr.entity.MasTechnology;
import com.aug.hr.entity.Official;
import com.aug.hr.entity.dto.AddressDto;
import com.aug.hr.entity.dto.AllEmployeeDto;
import com.aug.hr.services.AddressService;
import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.MasAddressTypeService;
import com.aug.hr.services.MasCoreSkillService;
import com.aug.hr.services.MasDivisionService;
import com.aug.hr.services.MasEmploymentService;
import com.aug.hr.services.MasJoblevelService;
import com.aug.hr.services.MasLocationService;
import com.aug.hr.services.MasProvinceService;
import com.aug.hr.services.MasStaffTypeService;
import com.aug.hr.services.OfficialService;
import com.aug.hr.services.masTechnologyService;
import com.aug.hr.services.utils.UploadService;

@Service("employeeService")
@Transactional(rollbackFor=Exception.class)
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao employeeDao;
	@Autowired 
	private MasAddressTypeService masAddressTypeService;
	@Autowired 
	private MasProvinceService masProvinceService;
	@Autowired 
	private AddressService addressService;
	@Autowired
	private OfficialService afficialService;
	@Autowired
	private MasLocationService masLocationService;
	@Autowired
	private MasCoreSkillService masCoreSkillService;
	@Autowired
	private MasEmploymentService masEmploymentService;
	@Autowired
	private MasDivisionService masDevisionService;
	@Autowired
	private MasJoblevelService masJoblevelService;
	@Autowired
	private masTechnologyService masTechnologyService;
	@Autowired
	private MasStaffTypeService masStaffTypeService;
	@Autowired
	private UploadService uploadService;
	
	
	@Override
	public void create(Employee employee) {
		employeeDao.create(employee);
		
	}

	@Override
	public void update(Employee employee) {
		employeeDao.update(employee);
		
	}

	@Override
	public void delete(Employee employee) {
		employeeDao.delete(employee);
		
	}


	@Override
	public List<Employee> findAll() {
		return employeeDao.findAll();
	}

	

	@Override
	public Employee findById(Integer Id) {
		return employeeDao.find(Id);
	}

	@Override
	public Employee deleteById(Integer id) {
		return employeeDao.deleteById(id);
	}

	@Override
	public List<Employee> findByCriteria(Employee employee) {
		return employeeDao.findByCriteria(employee);
	}

	@Override
	@Transactional
	public void createEmployeeAndAddress(Employee employee) {
		employeeDao.create(employee);
		for(Address address:employee.getAddresses()){
			address.setEmployee(employee);
			MasProvince masProvince = masProvinceService.find(address.getProvinceId());
			address.setProvince(masProvince);
			MasAddressType masAddressType = masAddressTypeService.findById(address.getAddressTypeId());
			address.setAddressType(masAddressType);
			addressService.create(address);
		}
		
	}

	@Override
	public void saveByNameQuery(AllEmployeeDto allEmployeeDto) {
		
		employeeDao.saveByNameQuery(allEmployeeDto);
	}

	@Override
	public Employee searhEmpIdtoAddress() {
		
		return employeeDao.searhEmpIdtoAddress();
	}

	@Override
	public void saveEmpAndWithRelateTable(AllEmployeeDto allEmployeeDto) {
	
		/*MasLocation location = masLocationService.findByLocationCode(allEmployeeDto.getMasLocation());
		
		OfficialDto officialDto = new OfficialDto();
		//Date dateOffi = new Date("12/05/2015");
		Calendar cal = Calendar.getInstance();
		officialDto.setOfficialDate(allEmployeeDto.getOfficialDate());
		officialDto.setStartWorkDate(allEmployeeDto.getStartWorkDate());
		officialDto.setEndWorkDate(allEmployeeDto.getEndWorkDate());
		officialDto.setPositionAppliedFor(allEmployeeDto.getPositionAppliedFor());
		officialDto.setSalaryExpected(allEmployeeDto.getSalaryExpected());
		officialDto.setProbationDate(allEmployeeDto.getProbationDate());
	
		afficialService.saveOfficialByNameQuery(officialDto);		
		
		Official official1 = afficialService.searhEmpIdtoOfficial();
		System.out.println(official1.getId());
	
		allEmployeeDto.setOfficialId(official1.getId());
		allEmployeeDto.setMasLocationId(location.getId());
		
		
		employeeDao.saveByNameQuery(allEmployeeDto);
		
		
		Employee emp = employeeDao.searhEmpIdtoAddress();
		
		System.out.println("empId: "+emp.getId());*/
		
		
		if(allEmployeeDto.getAddressList()!=null){
			for(AddressDto addressDto:allEmployeeDto.getAddressList()){
				if(addressDto.getId()!=null){
					//addressDto.setEmployeeId(emp.getId());
					//addressService.saveAddressByNameQuery(addressDto);
				    System.out.println(addressDto);
				}
				
			}
		}
  }

	

	@Override
	public AllEmployeeDto findEmployeeByEmployeeIdWithSetToDto(Integer id) {
		
		Employee employee = employeeDao.find(id);
		Hibernate.initialize(employee.getOfficial());
		
		//System.out.println(employee.getOfficial().getId());
		
		AllEmployeeDto allEmployeeDto = new AllEmployeeDto();
		allEmployeeDto.setId(employee.getId());
		allEmployeeDto.setStatusemp(employee.getStatusemp()); 
		allEmployeeDto.setIsManager(employee.getIsManager()); 
		
		if(employee.getOfficial()!=null){
			System.out.println("Official: "+employee.getOfficial().getPositionAppliedFor());
	        allEmployeeDto.setOfficialDate(employee.getOfficial().getOfficialDate()); 
	        allEmployeeDto.setStartWorkDate(employee.getOfficial().getStartWorkDate());
	        allEmployeeDto.setEndWorkDate(employee.getOfficial().getEndWorkDate());
	    	allEmployeeDto.setPositionAppliedFor(employee.getOfficial().getPositionAppliedFor());
			allEmployeeDto.setSalaryExpected(employee.getOfficial().getSalaryExpected());
			allEmployeeDto.setOfficialId(employee.getOfficial().getId());
			allEmployeeDto.setProbationDate(employee.getOfficial().getProbationDate()); 

		}
		
        allEmployeeDto.setEmployeeCode(employee.getEmployeeCode());
        allEmployeeDto.setNameThai(employee.getNameThai());
        allEmployeeDto.setSurnameThai(employee.getSurnameThai());
        allEmployeeDto.setNicknameThai(employee.getNicknameThai());
        allEmployeeDto.setNameEng(employee.getNameEng());
        allEmployeeDto.setSurnameEng(employee.getSurnameEng());
        allEmployeeDto.setNicknameEng(employee.getNicknameEng());
        allEmployeeDto.setEmail(employee.getEmail());
        allEmployeeDto.setTelHome(employee.getTelHome());
        allEmployeeDto.setTelMobile(employee.getTelMobile()); 
        allEmployeeDto.setTelFax(employee.getTelFax()); 
        allEmployeeDto.setCongenitalDisease(employee.getCongenitalDisease());
        allEmployeeDto.setHospital(employee.getHospital());
        allEmployeeDto.setEmergencyContact(employee.getEmergencyContact());
        allEmployeeDto.setRelationshipWithEmergencyContact(employee.getRelationshipWithEmergencyContact());
        allEmployeeDto.setEmergencyContactAddress(employee.getEmergencyContactAddress());
        allEmployeeDto.setEmergencyContactPhoneNumber(employee.getEmergencyContactPhoneNumber());
        allEmployeeDto.setDateOfBirth(employee.getDateOfBirth());
        allEmployeeDto.setPlaceOfBirth(employee.getPlaceOfBirth());
        allEmployeeDto.setAge(employee.getAge());
        allEmployeeDto.setReligion(employee.getReligion());
        allEmployeeDto.setIdCard(employee.getIdCard());
        allEmployeeDto.setIssuedOffice(employee.getIssuedOffice());
        allEmployeeDto.setExpiryDate(employee.getExpiryDate());
        allEmployeeDto.setHeight(employee.getHeight());
        allEmployeeDto.setWeigth(employee.getWeigth());
        allEmployeeDto.setSex(employee.getSex());
        allEmployeeDto.setMaritalStatus(employee.getMaritalStatus());
        allEmployeeDto.setNumberOfChildren(employee.getNumberOfChildren());
        allEmployeeDto.setSpouseName(employee.getSpouseName());
        allEmployeeDto.setMarriageCertificateNo(employee.getMarriageCertificateNo());
        allEmployeeDto.setIssuedOffice2(employee.getIssuedOffice2());
        allEmployeeDto.setAddress(employee.getAddress());
        allEmployeeDto.setOccupation(employee.getOccupation());
        allEmployeeDto.setKnowAugNewspaper(employee.getKnowAugNewspaper());
        allEmployeeDto.setDescriptionNewspaper(employee.getDescriptionNewspaper());
        allEmployeeDto.setKnowAugMagazine(employee.getKnowAugMagazine()); 
        allEmployeeDto.setDescriptionMagazine(employee.getDescriptionMagazine());
        allEmployeeDto.setKnowAugWebsite(employee.getKnowAugWebsite());
        allEmployeeDto.setDescriptionWebsite(employee.getDescriptionWebsite());
        allEmployeeDto.setKnowAugFriend(employee.getKnowAugFriend()); 
        allEmployeeDto.setDescriptionFriend(employee.getDescriptionFriend());
        allEmployeeDto.setKnowAugOther(employee.getKnowAugOther());
        allEmployeeDto.setDescriptionOther(employee.getDescriptionOther());
        allEmployeeDto.setKnowEmployed(employee.getKnowEmployed());
        allEmployeeDto.setDescriptionYes(employee.getDescriptionYes());
        /*allEmployeeDto.setKnowEmployerNo(employee.getKnowEmployerNo());*/
        allEmployeeDto.setMilitaryService(employee.getMilitaryService());
        allEmployeeDto.setFromYear(employee.getFromYear());
        allEmployeeDto.setToYear(employee.getToYear());
        allEmployeeDto.setBranchOfService(employee.getBranchOfService());
        allEmployeeDto.setServiceNo(employee.getServiceNo());
        allEmployeeDto.setReasonsNo(employee.getReasonsNo());
        allEmployeeDto.setDateToBeDrafted(employee.getDateToBeDrafted());
        allEmployeeDto.setPreviousEmployer(employee.getPreviousEmployer());
        allEmployeeDto.setPreviousEmpreasonsNo(employee.getPreviousEmpreasonsNo());
        allEmployeeDto.setImage(employee.getImage());
        
        if(employee.getAimempid()!=null){
        	allEmployeeDto.setAimempid(employee.getAimempid().getId());
        }
        
        if(employee.getMasCoreSkill()!=null){
        	allEmployeeDto.setMasCoreSkill(employee.getMasCoreSkill().getId());
        }
        
        if(employee.getMasEmployment()!=null){
        	allEmployeeDto.setMasEmployment(employee.getMasEmployment().getId());
        }
        
        if(employee.getMasDivision()!=null){
        	allEmployeeDto.setMasDivision(employee.getMasDivision().getId());
        }
        
        if(employee.getMasJoblevel()!=null){
        	allEmployeeDto.setMasJoblevel(employee.getMasJoblevel().getId());
        }
        
        if(employee.getTechnology()!=null){
        	allEmployeeDto.setTechnology(employee.getTechnology().getId());
        }
        
        if(employee.getMasStaffType()!=null){
        	allEmployeeDto.setMasStaffType(employee.getMasStaffType().getId());
        }
        
        if(employee.getMasLocation()!=null){
        	allEmployeeDto.setMasLocation(employee.getMasLocation().getCode());
        	allEmployeeDto.setMasLocationId(employee.getMasLocation().getId());
        }


        List<AddressDto> addressDtoList = new ArrayList<AddressDto>();
		
		
	  if(employee.getAddresses()!=null){
		for(Address address:employee.getAddresses()){		
				AddressDto addressDto = new AddressDto();
				addressDto.setId(address.getId());
				addressDto.setAddress1(address.getAddress1());
				addressDto.setAddress2(address.getAddress2());
				if(address.getAddressType()!=null){
					addressDto.setAddressTypeId(address.getAddressType().getId());
					addressDto.setMasaddresstypeName(address.getAddressType().getName());
				}
				addressDto.setEmployeeId(employee.getId());
				
				if(address.getProvince()!=null){
				addressDto.setMasprovinceId(address.getProvince().getId());
				addressDto.setMasprovinceName(address.getProvince().getName());
				}
				
				addressDto.setZipcode(address.getZipcode());
				
				addressDtoList.add(addressDto);
		}
		
		
		allEmployeeDto.setAddressList(addressDtoList);
		
	  }
		
		return allEmployeeDto;

	}
	
	
	public AllEmployeeDto findEmpInitEdit(Integer id) {
		
		Employee employee=employeeDao.find(id);		
		AllEmployeeDto allEmpDto = new AllEmployeeDto();
		List<AddressDto> addressDtoList = new ArrayList<AddressDto>();
		for(Address addrerss:employee.getAddresses()){
		//allEmpDto.setAddressList();
			AddressDto addressDto = new AddressDto();
			addressDto.setAddress1(addrerss.getAddress1());
			addressDto.setAddress2(addrerss.getAddress2());
			addressDto.setAddressTypeId(addrerss.getAddressType().getId());
			addressDto.setId(addrerss.getId());
			addressDto.setZipcode(addrerss.getZipcode());
			addressDto.setMasaddresstypeName(addrerss.getAddressType().getName());
			addressDto.setStatus("unmodified");
			addressDtoList.add(addressDto);
		}
		allEmpDto.setId(employee.getId());
		allEmpDto.setAddress(employee.getAddress());
		allEmpDto.setEmployeeCode(employee.getEmployeeCode());
		allEmpDto.setNameThai(employee.getNameThai());
		allEmpDto.setSurnameThai(employee.getSurnameThai());
		allEmpDto.setNicknameThai(employee.getNicknameThai());
		allEmpDto.setNameEng(employee.getNameEng());
		
		allEmpDto.setSurnameEng(employee.getSurnameEng());
		allEmpDto.setNicknameEng(employee.getNicknameEng());
		allEmpDto.setEmail(employee.getEmail());
		allEmpDto.setTelHome(employee.getTelHome());
		allEmpDto.setTelMobile(employee.getTelMobile());
		allEmpDto.setTelFax(employee.getTelFax());
		
		allEmpDto.setCongenitalDisease(employee.getCongenitalDisease());
		allEmpDto.setHospital(employee.getHospital());
		allEmpDto.setEmergencyContact(employee.getEmergencyContact());
		allEmpDto.setRelationshipWithEmergencyContact(employee.getRelationshipWithEmergencyContact());
		allEmpDto.setEmergencyContactAddress(employee.getEmergencyContactAddress());
		allEmpDto.setEmergencyContactPhoneNumber(employee.getEmergencyContactPhoneNumber());
		allEmpDto.setDateOfBirth(employee.getDateOfBirth());
		allEmpDto.setPlaceOfBirth(employee.getPlaceOfBirth());
		
		allEmpDto.setAge(employee.getAge());
		allEmpDto.setReligion(employee.getReligion());
		allEmpDto.setIdCard(employee.getIdCard());
		allEmpDto.setIssuedOffice(employee.getIssuedOffice());
		allEmpDto.setExpiryDate(employee.getExpiryDate());
		allEmpDto.setHeight(employee.getHeight());
		allEmpDto.setWeigth(employee.getWeigth());
		allEmpDto.setSex(employee.getSex());
		
		allEmpDto.setMaritalStatus(employee.getMaritalStatus());
		allEmpDto.setIssuedOffice2(employee.getIssuedOffice2());
		allEmpDto.setAddress(employee.getAddress());
		allEmpDto.setOccupation(employee.getOccupation());
		allEmpDto.setKnowAugNewspaper(employee.getKnowAugNewspaper());
		allEmpDto.setDescriptionNewspaper(employee.getDescriptionNewspaper());
		allEmpDto.setKnowAugMagazine(employee.getKnowAugMagazine());
		allEmpDto.setDescriptionMagazine(employee.getDescriptionMagazine());
		
		allEmpDto.setKnowAugWebsite(employee.getKnowAugWebsite());
		allEmpDto.setDescriptionWebsite(employee.getDescriptionWebsite());
		allEmpDto.setKnowAugFriend(employee.getKnowAugFriend());
		allEmpDto.setDescriptionFriend(employee.getDescriptionFriend());
		allEmpDto.setKnowAugOther(employee.getKnowAugOther());
		allEmpDto.setDescriptionOther(employee.getDescriptionOther());
		allEmpDto.setKnowEmployed(employee.getKnowEmployed());
		
		allEmpDto.setMilitaryService(employee.getMilitaryService());
		allEmpDto.setFromYear(employee.getFromYear());
		allEmpDto.setToYear(employee.getToYear());
		allEmpDto.setBranchOfService(employee.getBranchOfService());
		allEmpDto.setServiceNo(employee.getServiceNo());
		allEmpDto.setReasonsNo(employee.getReasonsNo());
		
		allEmpDto.setDateToBeDrafted(employee.getDateToBeDrafted());
		allEmpDto.setPreviousEmployer(employee.getPreviousEmployer());
		allEmpDto.setPreviousEmpreasonsNo(employee.getPreviousEmpreasonsNo());
		allEmpDto.setImage(employee.getImage());
		allEmpDto.setStatusemp(employee.getStatusemp());
		
		allEmpDto.setIsManager(employee.getIsManager());
		if(employee.getAimempid()!=null){
			allEmpDto.setAimempid(employee.getAimempid().getId());
		}
		allEmpDto.setOfficialId(employee.getOfficial().getId());
		allEmpDto.setMasCoreSkill(employee.getMasCoreSkill().getId());
		allEmpDto.setMasEmployment(employee.getMasEmployment().getId());
		allEmpDto.setMasJoblevel(employee.getMasJoblevel().getId());
		allEmpDto.setMasDivision(employee.getMasDivision().getId());
		allEmpDto.setTechnology(employee.getTechnology().getId());
		allEmpDto.setMasStaffType(employee.getMasStaffType().getId());
		allEmpDto.setMasLocation(employee.getMasLocation().getCode());
		
		return allEmpDto;
		
	}
	

	@Override
	@Transactional
	public Employee createEmployeeAndReturnId(AllEmployeeDto allEmployeeDto,String employeeCode) throws JDBCException,CustomException{
		
		
		//List<AllEmployeeDto> allEDtos = new ArrayList<AllEmployeeDto>();
		
		//Save Official 
		Official official = new Official();
		official.setAuditFlag("C");
		official.setCreatedBy(0);
		official.setCreatedTimeStamp(Calendar.getInstance().getTime());
		official.setStartWorkDate(allEmployeeDto.getStartWorkDate());
		official.setEndWorkDate(allEmployeeDto.getEndWorkDate());
		official.setPositionAppliedFor(allEmployeeDto.getPositionAppliedFor());
		official.setProbationDate(allEmployeeDto.getProbationDate());
		official.setOfficialDate(allEmployeeDto.getOfficialDate());
		official.setSalaryExpected(allEmployeeDto.getSalaryExpected());
		
		afficialService.create(official);
		
		
		//Save Employee
		Employee employee = new Employee();
		

		employee.setEmployeeCode(employeeCode); 
		employee.setNameThai(allEmployeeDto.getNameThai());
		employee.setSurnameThai(allEmployeeDto.getSurnameThai());
		employee.setNicknameThai(allEmployeeDto.getNicknameThai());
		employee.setNameEng(allEmployeeDto.getNameEng());
		employee.setSurnameEng(allEmployeeDto.getSurnameEng()); 
		employee.setNicknameEng(allEmployeeDto.getNicknameEng()); 
		employee.setEmail(allEmployeeDto.getEmail());
		employee.setCongenitalDisease(allEmployeeDto.getCongenitalDisease());
		employee.setHospital(allEmployeeDto.getHospital());
		employee.setTelHome(allEmployeeDto.getTelHome());
		employee.setTelMobile(allEmployeeDto.getTelMobile());
		employee.setTelFax(allEmployeeDto.getTelFax());
		employee.setEmergencyContact(allEmployeeDto.getEmergencyContact());
		employee.setRelationshipWithEmergencyContact(allEmployeeDto.getRelationshipWithEmergencyContact());
		employee.setEmergencyContactAddress(allEmployeeDto.getEmergencyContactAddress());
		employee.setEmergencyContactPhoneNumber(allEmployeeDto.getEmergencyContactPhoneNumber());
		employee.setDateOfBirth(allEmployeeDto.getDateOfBirth());
		employee.setPlaceOfBirth(allEmployeeDto.getPlaceOfBirth());
		employee.setAge(allEmployeeDto.getAge());
		employee.setReligion(allEmployeeDto.getReligion());
		employee.setIdCard(allEmployeeDto.getIdCard());
		employee.setIssuedOffice(allEmployeeDto.getIssuedOffice());
		employee.setIssuedOffice2(allEmployeeDto.getIssuedOffice2()); 
		employee.setExpiryDate(allEmployeeDto.getExpiryDate());
		employee.setHeight(allEmployeeDto.getHeight());
		employee.setWeigth(allEmployeeDto.getHeight());
		employee.setSex(allEmployeeDto.getSex());
		employee.setMaritalStatus(allEmployeeDto.getMaritalStatus());
		employee.setNumberOfChildren(allEmployeeDto.getNumberOfChildren()); 
		employee.setSpouseName(allEmployeeDto.getSpouseName()); 
		employee.setMarriageCertificateNo(allEmployeeDto.getMarriageCertificateNo());
		employee.setAddress(allEmployeeDto.getAddress()); 
		employee.setOccupation(allEmployeeDto.getOccupation());
		employee.setKnowAugNewspaper(allEmployeeDto.getKnowAugNewspaper());
		employee.setDescriptionNewspaper(allEmployeeDto.getDescriptionNewspaper());
		employee.setKnowAugMagazine(allEmployeeDto.getKnowAugMagazine());
		employee.setDescriptionMagazine(allEmployeeDto.getDescriptionMagazine());
		employee.setKnowAugWebsite(allEmployeeDto.getKnowAugWebsite());
		employee.setDescriptionWebsite(allEmployeeDto.getDescriptionWebsite());
		employee.setKnowAugFriend(allEmployeeDto.getKnowAugFriend()); 
		employee.setDescriptionFriend(allEmployeeDto.getKnowAugFriend());
		employee.setKnowAugOther(allEmployeeDto.getKnowAugOther()); 
		employee.setDescriptionOther(allEmployeeDto.getDescriptionOther()); 
		employee.setKnowEmployed(allEmployeeDto.getKnowEmployed());
		employee.setDescriptionYes(allEmployeeDto.getDescriptionYes());
		/*employee.setKnowEmployerNo(allEmployeeDto.getKnowEmployerNo());*/
		employee.setMilitaryService(allEmployeeDto.getMilitaryService());
		employee.setFromYear(allEmployeeDto.getFromYear());
		employee.setToYear(allEmployeeDto.getToYear());
		employee.setBranchOfService(allEmployeeDto.getBranchOfService());
		employee.setReasonsNo(allEmployeeDto.getReasonsNo());
		employee.setDateToBeDrafted(allEmployeeDto.getDateToBeDrafted()); 
		employee.setPreviousEmployer(allEmployeeDto.getPreviousEmployer());
		employee.setPreviousEmpreasonsNo(allEmployeeDto.getPreviousEmpreasonsNo());			
		employee.setServiceNo(allEmployeeDto.getServiceNo());		
		
		if(allEmployeeDto.getMasCoreSkill()!=null){
			MasCoreSkill masCoreSkill =  masCoreSkillService.find(allEmployeeDto.getMasCoreSkill());
			if(masCoreSkill.getId()!=null){
				employee.setMasCoreSkill(masCoreSkill);
			}
		}
		
		
		if(allEmployeeDto.getMasEmployment()!=null){
			MasEmployment masEmployment = masEmploymentService.findById(allEmployeeDto.getMasEmployment());
			if(masEmployment.getId()!=null){
				employee.setMasEmployment(masEmployment);
			}
		}
		
		if(allEmployeeDto.getMasDivision()!=null){
			MasDivision masDevision = masDevisionService.findById(allEmployeeDto.getMasDivision());
			if(masDevision.getId()!=null){
				employee.setMasDivision(masDevision);
			}
		}

		if(allEmployeeDto.getMasJoblevel()!=null){
			MasJoblevel masJoblevel = masJoblevelService.find(allEmployeeDto.getMasJoblevel());
			if(masJoblevel.getId()!=null){			
				employee.setMasJoblevel(masJoblevel);						
			}
		}
		
		
		if(allEmployeeDto.getTechnology()!=null){
			MasTechnology masTechnology = masTechnologyService.find(allEmployeeDto.getTechnology());
			if(masTechnology.getId()!=null){
				employee.setTechnology(masTechnology);
			}
		}
		
		if(allEmployeeDto.getMasLocation()!=null||allEmployeeDto.getMasLocation().isEmpty()==false){
			MasLocation masLocation = masLocationService.findByLocationCode(allEmployeeDto.getMasLocation());
			System.out.println("id location: "+masLocation.getId());
			if(masLocation.getId()!=null){
				employee.setMasLocation(masLocation); 
			}
		}
		
		employee.setStatusemp(allEmployeeDto.getStatusemp());
		
		if(allEmployeeDto.getMasStaffType()!=null){
			MasStaffType masStaffType = masStaffTypeService.find(allEmployeeDto.getMasStaffType());
			if(masStaffType.getId()!=null){
				employee.setMasStaffType(masStaffType);
			}
		}

		employee.setImage(allEmployeeDto.getImage()); 
		employee.setIsManager(allEmployeeDto.getIsManager());
		
		if(allEmployeeDto.getAimempid()!=null){
			Employee aim = employeeDao.find(allEmployeeDto.getAimempid());
			if(aim.getId()!=null){
				employee.setAimempid(aim);
			}
		}
		
		employee.setOfficial(official);
		employee.setAuditFlag("C");
		employee.setCreatedBy(0);
		employee.setCreatedTimeStamp(Calendar.getInstance().getTime());
		
		
		try{
			
			employeeDao.create(employee);
		
			
		}catch(JDBCException jdbce){
			
			
			System.out.println("state: "+jdbce.getSQLState());
			if(jdbce.getSQLState().equals("23000")&& jdbce.getErrorCode()==1062){
				
				
				System.out.println("SQLState: "+jdbce.getSQLState());
				throw jdbce;
											
			}
			
			
		}
		
		
		
		//Update CreatedBy Official
		official.setCreatedBy(employee.getId());
		afficialService.update(official);
				
		
		//Save Address
		if(allEmployeeDto.getAddressList()!=null){
			
			for(AddressDto addressDto:allEmployeeDto.getAddressList()){
				if(addressDto.getId()!=null){
					
					Address address = new Address();
					address.setAddress1(addressDto.getAddress1());
					address.setAddress2(addressDto.getAddress2());
					
					MasProvince masProvince = masProvinceService.find(addressDto.getMasprovinceId());
					if(masProvince.getId()!=null){
						address.setProvince(masProvince);
					}
					
					MasAddressType masAddressType = masAddressTypeService.findById(addressDto.getAddressTypeId());
					if(masProvince.getId()!=null){
						address.setAddressType(masAddressType);
					}
					
					address.setZipcode(addressDto.getZipcode());
					address.setEmployee(employee);
					address.setAuditFlag("C");
					address.setCreatedBy(employee.getId());
					address.setCreatedTimeStamp(Calendar.getInstance().getTime());
					
					List<Address> addressList = new ArrayList<Address>();
					addressList.add(address);
					employee.setAddresses(addressList);
					addressService.create(address);

				}
			}
		}
		
		return employee;
	}

	@Override
	public Employee updateEmployeeAndReturnId(AllEmployeeDto allEmployeeDto,String employeeCode) throws DataIntegrityViolationException {
		// TODO Auto-generated method stub
		
		Employee employee = employeeDao.find(allEmployeeDto.getId());
		Hibernate.initialize(employee.getOfficial());
		
		//update official if id is null but id not null it change to save
		
		if(employee.getOfficial()==null){
			Official official = new Official();
			official.setAuditFlag("C");
			official.setCreatedBy(0);
			official.setCreatedTimeStamp(Calendar.getInstance().getTime());
			official.setStartWorkDate(allEmployeeDto.getStartWorkDate());
			official.setEndWorkDate(allEmployeeDto.getEndWorkDate());
			official.setPositionAppliedFor(allEmployeeDto.getPositionAppliedFor());
			official.setProbationDate(allEmployeeDto.getProbationDate());
			official.setOfficialDate(allEmployeeDto.getOfficialDate());
			official.setSalaryExpected(allEmployeeDto.getSalaryExpected());
			
			afficialService.create(official);
			
			employee.setOfficial(official);
			
		}else if(employee.getOfficial()!=null){
			
			  if(employee.getOfficial().getId()!=null){
				Official official1 = afficialService.findById(employee.getOfficial().getId());
				System.out.println("official id: "+employee.getOfficial().getId());
				
				official1.setOfficialDate(allEmployeeDto.getOfficialDate());
				official1.setStartWorkDate(allEmployeeDto.getStartWorkDate());
				official1.setEndWorkDate(allEmployeeDto.getEndWorkDate());
				official1.setSalaryExpected(allEmployeeDto.getSalaryExpected());
				official1.setPositionAppliedFor(allEmployeeDto.getPositionAppliedFor());
				official1.setProbationDate(allEmployeeDto.getProbationDate());
				official1.setAuditFlag("U");
				official1.setUpdatedBy(allEmployeeDto.getId());
				official1.setUpdatedTimeStamp(Calendar.getInstance().getTime());			
				afficialService.update(official1);
			  }
			
			}
		
		
		
		
		//update employee
		
		employee.setEmployeeCode(employeeCode); 
		employee.setNameThai(allEmployeeDto.getNameThai());
		employee.setSurnameThai(allEmployeeDto.getSurnameThai());
		employee.setNicknameThai(allEmployeeDto.getNicknameThai());
		employee.setNameEng(allEmployeeDto.getNameEng());
		employee.setSurnameEng(allEmployeeDto.getSurnameEng()); 
		employee.setNicknameEng(allEmployeeDto.getNicknameEng()); 
		employee.setEmail(allEmployeeDto.getEmail());
		employee.setCongenitalDisease(allEmployeeDto.getCongenitalDisease());
		employee.setHospital(allEmployeeDto.getHospital());
		employee.setTelHome(allEmployeeDto.getTelHome());
		employee.setTelMobile(allEmployeeDto.getTelMobile());
		employee.setTelFax(allEmployeeDto.getTelFax());
		employee.setEmergencyContact(allEmployeeDto.getEmergencyContact());
		employee.setRelationshipWithEmergencyContact(allEmployeeDto.getRelationshipWithEmergencyContact());
		employee.setEmergencyContactAddress(allEmployeeDto.getEmergencyContactAddress());
		employee.setEmergencyContactPhoneNumber(allEmployeeDto.getEmergencyContactPhoneNumber());
		employee.setDateOfBirth(allEmployeeDto.getDateOfBirth());
		employee.setPlaceOfBirth(allEmployeeDto.getPlaceOfBirth());
		employee.setAge(allEmployeeDto.getAge());
		employee.setReligion(allEmployeeDto.getReligion());
		employee.setIdCard(allEmployeeDto.getIdCard());
		employee.setIssuedOffice(allEmployeeDto.getIssuedOffice());
		employee.setIssuedOffice2(allEmployeeDto.getIssuedOffice2()); 
		employee.setExpiryDate(allEmployeeDto.getExpiryDate());
		employee.setHeight(allEmployeeDto.getHeight());
		employee.setWeigth(allEmployeeDto.getHeight());
		employee.setSex(allEmployeeDto.getSex());
		employee.setMaritalStatus(allEmployeeDto.getMaritalStatus());
		employee.setNumberOfChildren(allEmployeeDto.getNumberOfChildren()); 
		employee.setSpouseName(allEmployeeDto.getSpouseName()); 
		employee.setMarriageCertificateNo(allEmployeeDto.getMarriageCertificateNo());
		employee.setAddress(allEmployeeDto.getAddress()); 
		employee.setOccupation(allEmployeeDto.getOccupation());
		employee.setKnowAugNewspaper(allEmployeeDto.getKnowAugNewspaper());
		employee.setDescriptionNewspaper(allEmployeeDto.getDescriptionNewspaper());
		employee.setKnowAugMagazine(allEmployeeDto.getKnowAugMagazine());
		employee.setDescriptionMagazine(allEmployeeDto.getDescriptionMagazine());
		employee.setKnowAugWebsite(allEmployeeDto.getKnowAugWebsite());
		employee.setDescriptionWebsite(allEmployeeDto.getDescriptionWebsite());
		employee.setKnowAugFriend(allEmployeeDto.getKnowAugFriend()); 
		employee.setDescriptionFriend(allEmployeeDto.getKnowAugFriend());
		employee.setKnowAugOther(allEmployeeDto.getKnowAugOther()); 
		employee.setDescriptionOther(allEmployeeDto.getDescriptionOther()); 
		employee.setKnowEmployed(allEmployeeDto.getKnowEmployed());
		employee.setDescriptionYes(allEmployeeDto.getDescriptionYes());
		/*employee.setKnowEmployerNo(allEmployeeDto.getKnowEmployerNo());*/
		employee.setMilitaryService(allEmployeeDto.getMilitaryService());
		employee.setFromYear(allEmployeeDto.getFromYear());
		employee.setToYear(allEmployeeDto.getToYear());
		employee.setBranchOfService(allEmployeeDto.getBranchOfService());
		employee.setReasonsNo(allEmployeeDto.getReasonsNo());
		employee.setDateToBeDrafted(allEmployeeDto.getDateToBeDrafted()); 
		employee.setPreviousEmployer(allEmployeeDto.getPreviousEmployer());
		employee.setPreviousEmpreasonsNo(allEmployeeDto.getPreviousEmpreasonsNo());			
		employee.setServiceNo(allEmployeeDto.getServiceNo());		
		
		if(allEmployeeDto.getMasCoreSkill()!=null){
			MasCoreSkill masCoreSkill =  masCoreSkillService.find(allEmployeeDto.getMasCoreSkill());
			if(masCoreSkill.getId()!=null){
				employee.setMasCoreSkill(masCoreSkill);
			}
		}
		
		
		if(allEmployeeDto.getMasEmployment()!=null){
			MasEmployment masEmployment = masEmploymentService.findById(allEmployeeDto.getMasEmployment());
			if(masEmployment.getId()!=null){
				employee.setMasEmployment(masEmployment);
			}
		}
		
		if(allEmployeeDto.getMasDivision()!=null){
			MasDivision masDevision = masDevisionService.findById(allEmployeeDto.getMasDivision());
			if(masDevision.getId()!=null){
				employee.setMasDivision(masDevision);
			}
		}

		if(allEmployeeDto.getMasJoblevel()!=null){
			MasJoblevel masJoblevel = masJoblevelService.find(allEmployeeDto.getMasJoblevel());
			if(masJoblevel.getId()!=null){			
				employee.setMasJoblevel(masJoblevel);						
			}
		}
		
		
		if(allEmployeeDto.getTechnology()!=null){
			MasTechnology masTechnology = masTechnologyService.find(allEmployeeDto.getTechnology());
			if(masTechnology.getId()!=null){
				employee.setTechnology(masTechnology);
			}
		}
		
		if(allEmployeeDto.getMasLocation()!=null||allEmployeeDto.getMasLocation().isEmpty()==false){
			MasLocation masLocation = masLocationService.findByLocationCode(allEmployeeDto.getMasLocation());
			if(masLocation.getId()!=null){
				employee.setMasLocation(masLocation); 
			}
		}
		
		employee.setStatusemp(allEmployeeDto.getStatusemp());
		
		if(allEmployeeDto.getMasStaffType()!=null){
			MasStaffType masStaffType = masStaffTypeService.find(allEmployeeDto.getMasStaffType());
			if(masStaffType.getId()!=null){
				employee.setMasStaffType(masStaffType);
			}
		}

		
		
		
		
		
		
		
		
		
		if(allEmployeeDto.getFileupload().getOriginalFilename()==null){
			
			if(employee.getImage()==null||employee.getImage().equals("")){
				
					employee.setImage(null);
				
			}else if(employee.getImage()!=null||employee.getImage().equals("")==false){
				
					employee.setImage(employee.getImage());
				
			}
			
		}else if(allEmployeeDto.getFileupload().getOriginalFilename()!=null){
					
					System.out.println("img name: "+allEmployeeDto.getImage());
					System.out.println("original file name: "+allEmployeeDto.getFileupload().getOriginalFilename());
					String[] result =  StringUtils.split(allEmployeeDto.getFileupload().getOriginalFilename(),'.');	
				
									
					if(result.length==2){
						
						
						if(employee.getImage()==null){
							
							
							   
							 //upload file
								try {
									uploadService.uploadImage("EMPLOYEE",allEmployeeDto.getEmployeeCode()+"."+result[1], allEmployeeDto.getFileupload());
									employee.setImage(allEmployeeDto.getEmployeeCode()+"."+result[1]);
								
								} catch (RuntimeException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							
								
							
						}else if(employee.getImage()!=null){
							
	
						//delete file upload

						   try {
								uploadService .deleteImage("EMPLOYEE", employee.getImage());
							} catch (RuntimeException e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							} catch (IOException e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							}
									
						  
						   
						 //upload file
							try {
								uploadService.uploadImage("EMPLOYEE",allEmployeeDto.getEmployeeCode()+"."+result[1], allEmployeeDto.getFileupload());
								//allEmployeeDto.setImage(allEmployeeDto.getEmployeeCode()+"."+result[1]);
								employee.setImage(allEmployeeDto.getEmployeeCode()+"."+result[1]);
							
							} catch (RuntimeException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
				
						}
						
				
				
					}
					
					
			
			
		}
		
		
		
		
		employee.setIsManager(allEmployeeDto.getIsManager());
		
		if(allEmployeeDto.getAimempid()!=null){
			Employee aim = employeeDao.find(allEmployeeDto.getAimempid());
			if(aim.getId()!=null){
				employee.setAimempid(aim);
			}
		}
		
		employee.setAuditFlag("U");
		employee.setUpdatedBy(employee.getId());
		employee.setUpdatedTimeStamp(Calendar.getInstance().getTime());
				
		
		try{
			
			employeeDao.update(employee);
		
		}catch(DataIntegrityViolationException jdbce){
			
			
			   System.out.println("massge exception: "+jdbce.getMessage());
			   if(jdbce.getMessage()!=null){
								
				//System.out.println("SQLState: "+jdbce.getSQLState());
				throw jdbce;
											
			   }			
		}
		
		
		
		
		
		
		//update Address
				
		
			if(allEmployeeDto.getAddressList()!=null){
		
		     System.out.println(allEmployeeDto.getAddressList().get(0));
					
					for(AddressDto addressDto:allEmployeeDto.getAddressList()){
						
						
						
						if(addressDto.getId()!=null){
							
							System.out.println("address delete: "+addressDto.getStatus());
							
							if(addressDto.getStatus().equals("add")&&addressDto.getId()==0){
							
									Address address = new Address();		
									address.setAddress1(addressDto.getAddress1());
									address.setAddress2(addressDto.getAddress2());
									
									MasProvince masProvince = masProvinceService.find(addressDto.getMasprovinceId());
									if(masProvince.getId()!=null){
										address.setProvince(masProvince);
									}
									
									MasAddressType masAddressType = masAddressTypeService.findById(addressDto.getAddressTypeId());
									if(masProvince.getId()!=null){
										address.setAddressType(masAddressType);
									}
									
									address.setZipcode(addressDto.getZipcode());
									address.setEmployee(employee);
									address.setAuditFlag("C");
									address.setCreatedBy(employee.getId());
									address.setCreatedTimeStamp(Calendar.getInstance().getTime());
									
									List<Address> addressList = new ArrayList<Address>();
									addressList.add(address);
									employee.setAddresses(addressList);
									addressService.create(address);
							
							}else if(addressDto.getStatus().equals("edit")){
								
								
								   System.out.println("address edit: "+addressDto.getStatus());

								
									Address address = new Address();
									address = addressService.find(addressDto.getId());
									address.setAddress1(addressDto.getAddress1());
									address.setAddress2(addressDto.getAddress2());
									
									MasProvince masProvince = masProvinceService.find(addressDto.getMasprovinceId());
									if(masProvince.getId()!=null){
										address.setProvince(masProvince);
									}
									
									MasAddressType masAddressType = masAddressTypeService.findById(addressDto.getAddressTypeId());
									if(masProvince.getId()!=null){
										address.setAddressType(masAddressType);
									}
									
									address.setZipcode(addressDto.getZipcode());
									address.setEmployee(employee);
									address.setAuditFlag("U");
									address.setUpdatedBy(employee.getId());
									address.setUpdatedTimeStamp(Calendar.getInstance().getTime());
									
									List<Address> addressList = new ArrayList<Address>();
									addressList.add(address);
									employee.setAddresses(addressList);
									addressService.update(address);
								
								
							}else if(addressDto.getStatus().equals("delete")){
								
									
									System.out.println("delete#1: "+addressDto.getStatus());
									Address address = new Address();
									address = addressService.find(addressDto.getId());
									addressService.delete(address);
								
							}

						}
					}
		
		
	}
		return employee;
  }

	@Override
	public void deleteEmployeeByHibernate(Employee employee) {
		// TODO Auto-generated method stub
		
		
		employeeDao.delete(employee);
		
	}

	
	@Override
	public Employee findAndinitializeOfficial(Integer id) {
		// TODO Auto-generated method stub
		Employee employee = employeeDao.find(id);
		Hibernate.initialize(employee.getOfficial());
		Hibernate.initialize(employee.getAddresses());
		Hibernate.initialize(employee.getLeaves());
		return employee;
	}

	
	@Override
	public List<Employee> findAimRelateWithEmployee(Integer id) {
		// TODO Auto-generated method stub
		return employeeDao.findAimRelateWithEmployee(id);
	}

	
	@Override	
	public Employee findOfficial(Integer id) {
		// TODO Auto-generated method stub
		return employeeDao.findOfficial(id);
	}


	public Employee findEmployeeCode(Integer locationId) {
		// TODO Auto-generated method stub
		return employeeDao.findEmployeeCode(locationId);
	}
	
	

	@Override
	@Transactional
	public String generateEmployeeCode(AllEmployeeDto allEmployeeDto){
		
		   Employee employeeForCode = new Employee();
		   String empCode = null;
		   System.out.print("masloc# "+allEmployeeDto.getMasLocation());
		
		   if(masLocationService.findByLocationCode(allEmployeeDto.getMasLocation())==null){
			   
			   System.out.println("----null location id-----");
		   }
		   else if(masLocationService.findByLocationCode(allEmployeeDto.getMasLocation())!=null){
			   MasLocation masLocation = masLocationService.findByLocationCode(allEmployeeDto.getMasLocation());
			   System.out.println("id: "+masLocation.getId());
			   employeeForCode = employeeDao.findEmployeeCode(masLocation.getId());
			   		   
			   
			   if(employeeForCode==null){
				   
				   empCode = allEmployeeDto.getMasLocation()+"10"+"001";
				   System.out.println("empCode: "+empCode);
				   
				   
			   }else if(employeeForCode!=null){
				   
				   			    		   
				    		   StringBuilder myNumbers = new StringBuilder();
				    		    for (int i = 0; i < employeeForCode.getEmployeeCode().length(); i++) {
				    		        if (Character.isDigit(employeeForCode.getEmployeeCode().charAt(i))) {
				    		            myNumbers.append(employeeForCode.getEmployeeCode().charAt(i));
				    		            System.out.println(employeeForCode.getEmployeeCode().charAt(i) + " is a digit.");
				    		        } else {
				    		            System.out.println(employeeForCode.getEmployeeCode().charAt(i) + " not a digit.");
				    		        }
				    		    }
				    		    System.out.println("Your numbers: " + myNumbers.toString());
				    		    int employeeCodePlusOne = Integer.parseInt(myNumbers.toString())+1;
				    		    empCode = allEmployeeDto.getMasLocation()+Integer.toString(employeeCodePlusOne);
				    		    System.out.println("empCode: "+empCode);
				    		   
				    	   }
				   
			   }
		   
		return empCode;
				
	}

}
