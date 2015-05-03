/**
 *
 * @author natechanok
 * @date Apr 22, 2015
 */

package com.aug.hr.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "ADDRESS")
public class Address extends BaseEntity{
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	private Integer id;
	
	@Column(name="ADDRESS1")
	private String address1;
	
	@Column(name="ADDRESS2")
	private String address2;
	
	@Column(name="ZIPCODE")
	private String zipcode;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	
	
	
	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}



	@ManyToOne
    @JoinColumn(name= "EMP_ID")
    private Employee employee;
	
	
	@ManyToOne
    @JoinColumn(name= "ADDTYPE_ID")
    private MasAddressType addressType;
	
	@ManyToOne
    @JoinColumn(name= "PROVINCE_ID")
    private MasProvince province;

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public MasAddressType getAddressType() {
		return addressType;
	}

	public void setAddressType(MasAddressType addressType) {
		this.addressType = addressType;
	}

	public MasProvince getProvince() {
		return province;
	}

	public void setProvince(MasProvince province) {
		this.province = province;
	}

	
	
	
	

}


