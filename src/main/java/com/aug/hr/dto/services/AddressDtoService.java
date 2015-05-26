/**
 *
 * @author natechanok
 * @date May 24, 2015
 */

package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.hr.dao.AddressDao;
import com.aug.hr.entity.dto.AddressDto;


@Service("addressDtoService")
@Transactional
public class AddressDtoService {
	@Autowired private AddressDao addressDao;
	
	public List<AddressDto> searchAddress(Integer id){
		return addressDao.searchAddress(id);
	}

}
