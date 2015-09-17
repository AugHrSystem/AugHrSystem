package com.aug.hr.entity.editor;

import java.beans.PropertyEditorSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.aug.hr.entity.SkillLanguage;
import com.aug.hr.services.SkillLanguageService;

@Component
public class LanguageEditor extends PropertyEditorSupport{
	
	@Autowired
	private SkillLanguageService skillLanguageSkillService;
	
	@Override
	public void setAsText(String text) {
		this.setValue(null);
		if (!"".equals(text)) {
			SkillLanguage rs = skillLanguageSkillService.find(Integer.valueOf(text));
			this.setValue(rs);
		}

	}

	@Override
	public String getAsText() {
		String tx = "";
		SkillLanguage rs = (SkillLanguage) this.getValue();
		if (rs != null) {
			tx = Integer.toString(rs.getId());
		}
		return tx;
	}

}
