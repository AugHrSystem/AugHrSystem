/**
 *
 * @author Pranrajit
 * @date 30 เม.ย. 2558
 */
package com.aug.hr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.aug.hr.entity.MasSpecialty;
import com.aug.hr.services.MasSpecialtyService;

public class MasSpecialtyController {
	
	@Autowired
	private MasSpecialtyService masSpecialtyService;
	@ModelAttribute
	MasSpecialty setuuForm(){
		return new MasSpecialty();
	}

}
