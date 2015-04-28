/**
 * 
 * @author apiva kim
 * @date   Jan 12, 2015
 *
 *
 */


package com.aug.hr.entity.editor;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.aug.hr.entity.EmpFamily;
import com.aug.hr.services.EmpFamilyService;




@Component
public class EmpFamilyEditor extends PropertyEditorSupport{

	@Autowired
	private EmpFamilyService empFamilyService;
	
	@Override
	public void setAsText(String text) {
		this.setValue(null);
		if (!"".equals(text)) {
			EmpFamily rs = empFamilyService.find(Integer.valueOf(text));
			this.setValue(rs);
		}

	}

	@Override
	public String getAsText() {
		String tx = "";
		EmpFamily rs = (EmpFamily) this.getValue();
		if (rs != null) {
			tx = Integer.toString(rs.getEmpFamilyId());
		}
		return tx;
	}
}
