/**
 *
 * @author natechanok
 * @date May 24, 2015
 */

package com.aug.hr.entity.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;


@NamedNativeQueries({
	@NamedNativeQuery(
			name="searchAddress",
			//query="select address.ID,mas_addresstype.NAME,address.ADDRESS1,address.ADDRESS2,mas_province.NAME,address.ZIPCODE,address.EMPLOYEE_ID,emp.EMPLOYEE_CODE from EMP_ADDRESS as address,EMP_EMPLOYEE as employee,MAS_ADDRESSTYPE as mas_addresstype,MAS_PROVINCE vince as mas_pro  where address.EMPLOYEE_ID=:empId and address.EMPLOYEE_ID = emp.ID and mas_addresstype.ID = address.addresstype.id and mas_province.ID = address.PROVINCE_ID",
			query="select address.ID,address.ADDRESSTYPE_ID,mas_addresstype.ADDRESSTYPENAME,address.ADDRESS1,address.ADDRESS2,address.PROVINCE_ID,mas_province.PROVINCENAME,address.ZIPCODE,address.EMPLOYEE_ID "
					+ "from EMP_ADDRESS as address join EMP_EMPLOYEE as employee on address.EMPLOYEE_ID = employee.ID"
					+ "join MAS_ADDRESSTYPE as mas_addresstype on mas_addresstype.ID = address.ADDRESSTYPE_ID"
					+ "join MAS_PROVINCE  as mas_province on mas_province.ID = address.PROVINCE_ID"
					+ "where address.EMPLOYEE_ID=:empId",
			resultClass = AddressDto.class)

})

//@Entity
public class AddressDto {
	
	@Column(name="ID")
	@Id
	private Integer id;
	
	@Column(name="ADDRESSTYPE_ID")
	private Integer addressTypeId;
	
	
	@Column(name = "ADDRESSTYPENAME")
	private String masaddresstypeName;
	
	@Column(name="ADDRESS1")
	private String address1;
	
	@Column(name="ADDRESS2")
	private String address2;
	
	@Column(name = "PROVINCE_ID")
	private String masprovinceId;
	
	@Column(name = "PROVINCENAME")
	private String masprovinceName;
	
	@Column(name="ZIPCODE")
	private String zipcode;
	
	@Column(name ="EMPLOYEE_ID")
	private String employeeId;	
	
	
	private String Status;


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getAddressTypeId() {
		return addressTypeId;
	}


	public void setAddressTypeId(Integer addressTypeId) {
		this.addressTypeId = addressTypeId;
	}


	public String getMasaddresstypeName() {
		return masaddresstypeName;
	}


	public void setMasaddresstypeName(String masaddresstypeName) {
		this.masaddresstypeName = masaddresstypeName;
	}


	public String getAddress1() {
		return address1;
	}


	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getMasprovinceId() {
		return masprovinceId;
	}


	public void setMasprovinceId(String masprovinceId) {
		this.masprovinceId = masprovinceId;
	}


	public String getMasprovinceName() {
		return masprovinceName;
	}


	public void setMasprovinceName(String masprovinceName) {
		this.masprovinceName = masprovinceName;
	}


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}


	public String getEmployeeId() {
		return employeeId;
	}


	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}


	public String getStatus() {
		return Status;
	}


	public void setStatus(String status) {
		Status = status;
	}


	@Override
	public String toString() {
		return "AddressDto [id=" + id + ", addressTypeId=" + addressTypeId
				+ ", masaddresstypeName=" + masaddresstypeName + ", address1="
				+ address1 + ", address2=" + address2 + ", masprovinceId="
				+ masprovinceId + ", masprovinceName=" + masprovinceName
				+ ", zipcode=" + zipcode + ", employeeId=" + employeeId
				+ ", Status=" + Status + "]";
	}
	
	
}
