/**
 *
 * @author natechanok
 * @date Apr 29, 2015
 */

package com.aug.hr.services.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.aug.hr.dao.EmployeeDao;
import com.aug.hr.entity.Address;
import com.aug.hr.entity.Employee;
import com.aug.hr.entity.MasAddressType;
import com.aug.hr.entity.MasLocation;
import com.aug.hr.entity.MasProvince;
import com.aug.hr.entity.Official;
import com.aug.hr.entity.dto.AddressDto;
import com.aug.hr.entity.dto.AllEmployeeDto;
import com.aug.hr.entity.dto.EmployeeCodeDto;
import com.aug.hr.entity.dto.OfficialDto;
import com.aug.hr.services.AddressService;
import com.aug.hr.services.EmployeeService;
import com.aug.hr.services.MasAddressTypeService;
import com.aug.hr.services.MasLocationService;
import com.aug.hr.services.MasProvinceService;
import com.aug.hr.services.OfficialService;

@Service("employeeService")
@Transactional
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
		// TODO Auto-generated method stub
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
	@Transactional
	public void saveEmpAndWithRelateTable(AllEmployeeDto allEmployeeDto) {
		// TODO Auto-generated method stub
		
		MasLocation location = masLocationService.findByLocationCode(allEmployeeDto.getMasLocation());
		
		OfficialDto officialDto = new OfficialDto();
		//Date dateOffi = new Date("12/05/2015");
		Calendar cal = Calendar.getInstance();
		officialDto.setOfficialDate(allEmployeeDto.getOfficialDate());
		officialDto.setStartWorkDate(allEmployeeDto.getStartWorkDate());
		officialDto.setEndWorkDate(allEmployeeDto.getEndWorkDate());
		officialDto.setPositionAppliedFor(allEmployeeDto.getPositionAppliedFor());
		officialDto.setSalaryExpected(allEmployeeDto.getSalaryExpected());
	
		afficialService.saveOfficialByNameQuery(officialDto);		
		
		Official official1 = afficialService.searhEmpIdtoOfficial();
		System.out.println(official1.getId());
	
		allEmployeeDto.setOfficialId(official1.getId());
		allEmployeeDto.setMasLocationId(location.getId());
		
		
		employeeDao.saveByNameQuery(allEmployeeDto);
		
		
		Employee emp = employeeDao.searhEmpIdtoAddress();
		
		System.out.println("empId: "+emp.getId());
    
		for(AddressDto addressDto:allEmployeeDto.getAddressList()){
			
			addressDto.setEmployeeId(emp.getId());
			addressService.saveAddressByNameQuery(addressDto);
			
		}
		
	}

	

	@Override
	public AllEmployeeDto findEmployeeByEmployeeIdWithSetToDto(Integer id) {
		
		Employee employee = employeeDao.find(id);
		
		AllEmployeeDto allEmployeeDto = new AllEmployeeDto();
		allEmployeeDto.setId(employee.getId());
		allEmployeeDto.setStatusemp(employee.getStatusemp()); 
		allEmployeeDto.setIsManager(employee.getIsManager()); 
		
		if(employee.getOfficial()!=null){
	        allEmployeeDto.setOfficialDate(employee.getOfficial().getOfficialDate()); 
	        allEmployeeDto.setStartWorkDate(employee.getOfficial().getStartWorkDate());
	        allEmployeeDto.setEndWorkDate(employee.getOfficial().getEndWorkDate());
	    	allEmployeeDto.setPositionAppliedFor(employee.getOfficial().getPositionAppliedFor());
			allEmployeeDto.setSalaryExpected(employee.getOfficial().getSalaryExpected());
			allEmployeeDto.setOfficialId(employee.getOfficial().getId());
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
        allEmployeeDto.setEmergencyContactAddress(allEmployeeDto.getEmergencyContactAddress());
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
        allEmployeeDto.setIssuedOffice2(employee.getIssuedOffice());
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
        allEmployeeDto.setKnowEmployedYes(employee.getKnowEmployedYes());
        allEmployeeDto.setDescriptionYes(employee.getDescriptionYes());
        allEmployeeDto.setKnowEmployerNo(employee.getKnowEmployerNo());
        allEmployeeDto.setMilitaryServiceYes(employee.getMilitaryServiceYes());
        allEmployeeDto.setFromYear(employee.getFromYear());
        allEmployeeDto.setToYear(employee.getToYear());
        allEmployeeDto.setBranchOfService(employee.getBranchOfService());
        allEmployeeDto.setServiceNo(employee.getServiceNo());
        allEmployeeDto.setMilitaryServiceNo(employee.getMilitaryServiceNo());
        allEmployeeDto.setReasonsNo(employee.getReasonsNo());
        allEmployeeDto.setDateToBeDrafted(employee.getDateToBeDrafted());
        allEmployeeDto.setPreviousEmployerYes(employee.getPreviousEmployerYes());
        allEmployeeDto.setPreviousEmployerNo(employee.getPreviousEmployerNo());
        allEmployeeDto.setPreviousEmpreasonsNo(employee.getPreviousEmployerNo());
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
        }


        List<AddressDto> addressDtoList = new ArrayList<AddressDto>();
		

		allEmployeeDto.setMasLocationId(employee.getMasLocation().getId());
		
		
		for(Address address:employee.getAddresses()){
			if(address!=null){
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
		}
		
		
		allEmployeeDto.setAddressList(addressDtoList);

		//allEmployeeDto.setProbationDate(); 
		
		
		return allEmployeeDto;

	}


}
