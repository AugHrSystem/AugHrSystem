/**
 *
 * @author Pranrajit
 * @date 25 พ.ค. 2558
 */
package com.aug.hr.dao;

import java.util.List;






import com.aug.hr.entity.Leave;
import com.aug.hr.entity.dto.LeaveDto;
import com.aug.hr.entity.dto.ReportLeaveDto;





public interface LeaveDao extends GenericDao<Leave, Integer>{

	
	
   public List<Leave> findByCriteria(Leave leave);
	
	public Leave deleteById(Integer id);

	public List<LeaveDto> searchLeave(Integer id);
	
	public List<Leave> findLeaveType(Integer idLeave,Integer idEmp);

	public List<ReportLeaveDto> reportLeave(String nameEng);
}
