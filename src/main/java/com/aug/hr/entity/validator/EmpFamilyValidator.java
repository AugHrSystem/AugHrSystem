/**
 * 
 * @author apiva kim
 * @date   Jan 12, 2015
 *
 *
 */


package com.aug.hr.entity.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.aug.hr.entity.EmpFamily;
import com.aug.hr.services.EmpFamilyService;
import com.mysql.jdbc.StringUtils;


@Component
public class EmpFamilyValidator  implements Validator{

	@Autowired
	private EmpFamilyService service;
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
	    return EmpFamily.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
    	// TODO Auto-generated method stub
		
		
		EmpFamily rs = (EmpFamily)target;
		
		
		if (rs.getEmpFamilyFirstName()==null){
			errors.rejectValue("empFamilyFirstName", "empFamily.required.firstname");
		}if(rs.getEmpFamilyLastName() == null){
			errors.rejectValue( "empFamilyLastName","empFamily.required.lastname");		
		}if(rs.getEmpFamilyGender()==null){
			errors.rejectValue( "empFamilyGender","empFamily.required.gender");				
		}if(rs.getEmpFamilyAge()==null){
			errors.rejectValue( "empFamilyAge","empFamily.required.age");				
		}if(rs.getEmpFamilyMobile()==null){
			errors.rejectValue( "empFamilyMobile","empFamily.required.mobile");				
		}if(rs.getEmpFamilyAddress()==null){
			errors.rejectValue( "empFamilyAddress","empFamily.required.address");				
		}if(rs.getEmpFamilyRelation()==null){
			errors.rejectValue( "empFamilyRelation","empFamily.required.relation");				
		}/*if(rs.getEmpFamilyRelation()==null){
			errors.rejectValue( "employee","empFamily.required.employee");				
		}*/
	}
	

}
