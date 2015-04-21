/**
 *
 * @author natechanok
 * @date Apr 21, 2015
 */

package com.aug.hr.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Repository;


@Entity
@Table(name = "EMPLOYMENT")
@Repository
public class Employment extends BaseEntity implements Serializable{
	
	@Id
	@Column(name = "Id", length = 10)
	@GeneratedValue
	
	private Integer Id;
	
	@Column(name = "Name", nullable = false, length = 200)
	private String Name;

	
	@OneToMany(mappedBy = "employment", fetch = FetchType.LAZY, cascade=CascadeType.ALL,orphanRemoval=true)
	private Set<Employee> employees = new HashSet<Employee>();
	
	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}
	
	

}
