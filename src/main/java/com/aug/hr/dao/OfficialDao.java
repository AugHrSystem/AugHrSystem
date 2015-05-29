/**
 *
 * @author natechanok
 * @date Apr 30, 2015
 */

package com.aug.hr.dao;

import java.util.List;

import com.aug.hr.entity.Official;
import com.aug.hr.entity.dto.OfficialDto;

public interface OfficialDao extends GenericDao<Official,Integer>{

	List<Official> findByCriteria(Official official);
	
	public Official deleteById(Integer id);
	public List<OfficialDto> searchOfficial();
	public void saveOfficialByNameQuery(OfficialDto officialDto);
	public Official searhEmpIdtoOfficial();

}
