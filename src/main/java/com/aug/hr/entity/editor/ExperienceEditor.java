package com.aug.hr.entity.editor;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;

import com.aug.hr.entity.Experience;
import com.aug.hr.services.ExperienceService;

public class ExperienceEditor extends PropertyEditorSupport {

	@Autowired private ExperienceService experienceService;
	
	public void setAsText(String text) {
		this.setValue(null);
		if (!"".equals(text)) {
			Experience rs = experienceService.find(Integer.valueOf(text));
			this.setValue(rs);
		}

	}

	public String getAsText() {
		String tx = "";
		Experience rs = (Experience) this.getValue();
		if (rs != null) {
			tx = Integer.toString(rs.getId());
		}
		return tx;
	}
}
