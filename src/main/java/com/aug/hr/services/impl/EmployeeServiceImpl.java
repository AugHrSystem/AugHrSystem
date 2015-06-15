/**
 *
 * @author natechanok
 * @date Apr 29, 2015
 */

package com.aug.hr.services.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
	public void saveEmpAndWithRelateTable(AllEmployeeDto allEmployeeDto) {
		// TODO Auto-generated method stub
	
	
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
	
	

	@Override
	public Employee createEmployeeAndReturnId(AllEmployeeDto allEmployeeDto) {
		// TODO Auto-generated method stub
		
		
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
		employee.setEmployeeCode(allEmployeeDto.getEmployeeCode()); 
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
		employee.setKnowEmployedYes(allEmployeeDto.getKnowEmployedYes());
		employee.setDescriptionYes(allEmployeeDto.getDescriptionYes());
		employee.setKnowEmployerNo(allEmployeeDto.getKnowEmployerNo());
		employee.setMilitaryServiceYes(allEmployeeDto.getMilitaryServiceYes());
		employee.setFromYear(allEmployeeDto.getFromYear());
		employee.setToYear(allEmployeeDto.getToYear());
		employee.setBranchOfService(allEmployeeDto.getBranchOfService());
		employee.setMilitaryServiceNo(allEmployeeDto.getMilitaryServiceNo());
		employee.setReasonsNo(allEmployeeDto.getReasonsNo());
		employee.setDateToBeDrafted(allEmployeeDto.getDateToBeDrafted()); 
		employee.setPreviousEmployerYes(allEmployeeDto.getPreviousEmployerYes());
		employee.setPreviousEmployerNo(allEmployeeDto.getPreviousEmployerNo());
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
		
		if(allEmployeeDto.getMasLocationId()!=null){
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

		employee.setImage(allEmployeeDto.getImage()); 
		employee.setIsManager(allEmployeeDto.getIsManager());
		
		if(allEmployeeDto.getId()!=null){
			Employee aim = employeeDao.find(allEmployeeDto.getAimempid());
			if(aim.getId()!=null){
				employee.setAimempid(aim);
			}
		}
		
		employeeDao.create(employee);
		
		
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


}
