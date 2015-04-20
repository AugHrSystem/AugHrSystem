/* Insert master data into Core Skill table*/
insert into Mas_CoreSkill(Mas_Core_Name,Mas_Core_Code,Mas_Core_isActive) values
('Administration','CoreSK_AD',1),
('Application Analyst','CoreSK_AA',1),
('Business Analyst','CoreSK_BA',1),
('Business Development','CoreSK_BD',1),
('Data Base Administrator','CoreSK_DBA',1),
('Finance','CoreSK_FN',1),
('Happiness','CoreSK_HP',1),
('ITS','CoreSK_ITS',1),
('Marketing','CoreSK_MKT',1),
('Ministry of Happiness','CoreSK_MHP',1),
('Programmer','CoreSK_PG',1),
('Project Coordinator','CoreSK_PC',1),
('Project Manager','CoreSK_PM',1),
('Recruitment','CoreSK_RC',1),
('SAP','CoreSK_SAP',1),
('Software Tester','CoreSK_ST',1),
('Solution Architect','CoreSK_SR',1),
('System Analyst','CoreSK_SA',1),
('Transformation','CoreSK_TS',1);

/*Insert master joblevel*/
insert into mas_joblevel(Mas_Job_Name) 

values('Account Execute'),

('Account Manager'),

('Business Division Director'),

('Consultant'),

('Manager'),

('Managing Consultant'),

('Partner'),

('Principal Consultant'),

('Professional'),

('Senior Account Manager'),

('Senior Consultant'),

('Senior Manager'),

('Senior Professional'),

('Support Division Director');

/* Insert Division */
insert into mas_division(Mas_Div_Name,Mas_Div_Code) values
('CEO Office of CEO','CEO'),
('F&A Finance & Administration','FA'),
('ITS Integrated Technology Services','ITS'),
('MKT Marketing','MKT'),
('MoH Ministry of Happiness','MoH'),
('SAP SAP Services','SAP'),
('TXM Transformation','TXM');

/* specialty  */
insert into specialty (spi_name,spi_code) 
value 

('ABAP','code'),
('ASP.Net','code'),
('Basis','code'),
('BI','code'),
('BPC - B','code'),
('BPC - C','code'),
('BW','code'),
('C#','code'),
('C++.Net framework','code'),
('CO','code'),
('CRM','code'),
('CSS','code'),
('Eclipse','code'),
('FI','code'),
('Hibernate','code'),
('HTML','code'),
('J2EE','code'),
('Java Script','code'),
('JBOSS','code'),
('JQUERY SVN Respsoitry','code'),
('JSF','code'),
('MM','code'),
('Mobility','code'),
('MVC','code'),
('Oracle','code'),
('Oracle10g','code'),
('Oracle9i','code'),
('PI','code'),
('PL/SQL','code'),
('PM','code'),
('PP','code'),
('SD','code'),
('Security','code'),
('Spring','code'),
('SRM','code'),
('Symfony1,2','code'),
('TR','code'),
('VB.Net','code'),
('Web App','code'),
('Web Logic','code'),
('WPF','code'),
('Zend','code');