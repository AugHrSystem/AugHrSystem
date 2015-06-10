/**
 *
 * @author Preeyaporn
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.hr.entity.Certification;
import com.aug.hr.entity.dto.CertificationDto;
import com.aug.hr.services.CertificationService;

@Controller
public class CertificationController {

	@Autowired
	private CertificationService certificationService;
	
	@RequestMapping(value = "/certification/{id}", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String init(ModelMap model,
			@PathVariable Integer id, 
			@ModelAttribute CertificationDto certificationDto) {
		
		certificationDto.setEmployeeId(id);
		model.addAttribute("id", certificationDto.getEmployeeId());
		return "/certification/certification";
	}
	
	@RequestMapping(value ="/certification/listAll/{id}", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<CertificationDto> listAll(@PathVariable("id") Integer id){
		
		return (List<CertificationDto>) certificationService.searchCertification(id);
	}
	
	
	@RequestMapping(value = "/certification/add", method = RequestMethod.POST)
	public @ResponseBody CertificationDto addCertification(@RequestBody CertificationDto certificationDto) {
		Certification certification = new Certification();
		certificationService.create(certification.fromCertificationDto(certification,certificationDto));
		return certificationDto;
	}

	@RequestMapping(value = "/certification/update", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody CertificationDto updateCertification(@RequestBody CertificationDto certificationDto) {
		Certification certification = certificationService.findById(certificationDto.getId());
		certificationService.update(certification.fromCertificationDto(certification,certificationDto));
		return certification.toCertificationDto();
	}
	
	@RequestMapping(value = "/certification/findById", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody CertificationDto findById(@RequestParam Integer certificationid) {
		Certification certification = certificationService.findById(certificationid);
		return certification.toCertificationDto();
	}
	
	@RequestMapping(value = "/certification/delete", method = RequestMethod.POST)
	public @ResponseBody String deleteCertification(@RequestParam Integer certificationid) {
		certificationService.deleteById(certificationid);
		return "{success:true}";
	}

	@ModelAttribute("certification")
	Certification setupForm() {
		return new Certification();
	}
}
