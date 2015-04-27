/**
 *
 * @author natechanok
 * @date Apr 22, 2015
 */

package com.aug.hr.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="ADDRESSTYPE")
public class MasAddressType {
	
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	private Integer id;
	
	@Column(name="NAME",nullable = false)
	private String name;
	
	@Column(name="ISACTIVE", nullable = false)
	private String isactive;
	
	@Column(name="CODE",nullable = false)
	private String code;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIsactive() {
		return isactive;
	}

	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	 @OneToMany(mappedBy = "addressType")
	 private Set<Address> addresses = new HashSet<Address>();
	
	
	

}
