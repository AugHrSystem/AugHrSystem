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

import com.aug.hr.entity.Family;
import com.aug.hr.services.FamilyService;




@Component
public class FamilyEditor extends PropertyEditorSupport{

	@Autowired
	private FamilyService empFamilyService;
	
	@Override
	public void setAsText(String text) {
		this.setValue(null);
		if (!"".equals(text)) {
			Family rs = empFamilyService.find(Integer.valueOf(text));
			this.setValue(rs);
		}

	}

	@Override
	public String getAsText() {
		String tx = "";
		Family rs = (Family) this.getValue();
		if (rs != null) {
			tx = Integer.toString(rs.getId());
		}
		return tx;
	}
}
