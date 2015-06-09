package com.aug.hr.services;

import java.util.Collection;
import java.util.Map;

import javax.sql.DataSource;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsMultiFormatView;


@Service("reportService")
public class ReportService {
	private final static Logger logger = Logger.getLogger(ReportService.class);
	@Autowired private ApplicationContext appContext;
    @Autowired private DataSource dataSource;
    
    public ModelAndView getReport(Collection<?> beanCollection , String reportName,String reportType,Map<String,Object> parameterMap) {
    	logger.info("Generate Report("+reportType+") ");
//        Map<String,Object> parameterMap = new HashMap<String,Object>();
        JRDataSource JRdataSource = new JRBeanCollectionDataSource(beanCollection);
        parameterMap.put("datasource", JRdataSource);
        parameterMap.put("format", reportType);
        JasperReportsMultiFormatView view = new JasperReportsMultiFormatView();
        view.setJdbcDataSource(dataSource);
        view.setUrl("classpath:reports/"+reportName+".jasper");
        view.setApplicationContext(appContext);
        
        return new ModelAndView(view, parameterMap);
    }
}
