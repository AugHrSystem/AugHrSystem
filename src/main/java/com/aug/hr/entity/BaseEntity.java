package com.aug.hr.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@MappedSuperclass
public abstract class BaseEntity {

	
	private String auditFlag;
	private Date createdTimeStamp;
	private Integer createdBy;
	private Date updatedTimeStamp;
	private Integer updatedBy;

	
	@Column(name = "auditFlag", nullable = false, length = 1)
	public String getAuditFlag() {
		return auditFlag;
	}

	public void setAuditFlag(String auditFlag) {
		this.auditFlag = auditFlag;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createdTimeStamp", nullable = false)
	public Date getCreatedTimeStamp() {
		return createdTimeStamp;
	}

	public void setCreatedTimeStamp(Date createdTimeStamp) {
		this.createdTimeStamp = createdTimeStamp;
	}

	@Column(name = "createdBy", nullable = false, length = 10)
	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getUpdatedTimeStamp() {
		return updatedTimeStamp;
	}

	public void setUpdatedTimeStamp(Date updatedTimeStamp) {
		this.updatedTimeStamp = updatedTimeStamp;
	}

	@Column(name = "updatedBy", nullable = true, length = 10)
	public Integer getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(Integer updatedBy) {
		this.updatedBy = updatedBy;
	}

	public BaseEntity() {

	}


  
}
