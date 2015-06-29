/**
 *
 * @author Preeyaporn
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.dto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;





import com.aug.hr.dao.LeaveDao;
import com.aug.hr.entity.dto.LeaveDto;
import com.aug.hr.entity.dto.ReportLeaveDto;


@Service("leaveDtoService")
@Transactional
public class LeaveDtoService {
	
	@Autowired private LeaveDao leaveDao;
	
	public List<LeaveDto> searchLeave(Integer id){
		return leaveDao.searchLeave(id);
	}





	/*public List<ReportLeaveDto> reportLeave(String nameEng){
		return leaveDao.reportLeave(nameEng);
	}
	*/
	
}
