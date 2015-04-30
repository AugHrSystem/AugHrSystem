/**
 *
 * @author natechanok
 * @date Apr 30, 2015
 */

package com.aug.hr.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "OFFICIAL")
public class Official {
	 @Id
	    @GeneratedValue
	    @Column(name = "ID")
	    private Long id;

	    @Column(name = "NAME")
	    private String name;
	    
	    
	    

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
	    
	    
	    

}
