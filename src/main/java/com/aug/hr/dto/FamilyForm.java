package com.aug.hr.dto;

import java.util.List;

import com.aug.hr.entity.Family;

public class FamilyForm {
	
	List<Family> family;

	public List<Family> getFamily() {
		return family;
	}

	public void setFamily(List<Family> family) {
		this.family = family;
	}
	

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FamilyForm [family=");
		builder.append(family);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	

}
