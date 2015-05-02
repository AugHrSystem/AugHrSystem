package com.aug.hr.entity.editor;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.aug.hr.entity.Reference;
import com.aug.hr.services.ReferenceService;



@Component
public class ReferenceEditor extends PropertyEditorSupport{
	
	@Autowired
	private ReferenceService referenceService;
	
	
	@Override
	public void setAsText(String text) {
		this.setValue(null);
		if (!"".equals(text)) {
			Reference rs = referenceService.findById(Integer.valueOf(text));
			this.setValue(rs);
		}

	}
	
	@Override
	public String getAsText() {
		String tx = "";
		Reference rs = (Reference) this.getValue();
		if (rs != null) {
			tx = Integer.toString(rs.getId());
		}
		return tx;
	}

}
