
INSERT INTO DIVISION (NAME) VALUES ("CEO Office of CEO");
INSERT INTO DIVISION (NAME) VALUES ("F&A Finance & Administration");
INSERT INTO DIVISION (NAME) VALUES ("ITS Integrated Technology Services");
INSERT INTO DIVISION (NAME) VALUES ("MKT Marketing");
INSERT INTO DIVISION (NAME) VALUES ("MoH Ministry of Happiness");
INSERT INTO DIVISION (NAME) VALUES ("SAP SAP Services");
INSERT INTO DIVISION (NAME) VALUES ("TXM Transformation");






INSERT INTO MASTECHNOLOGY (NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES ('.Net','C',NOW(),0,true,1);
INSERT INTO MASTECHNOLOGY (NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES ('COBOL','C',NOW(),0,true,1);
INSERT INTO MASTECHNOLOGY (NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES ('Java','C',NOW(),0,true,1);
INSERT INTO MASTECHNOLOGY (NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES ('PHP','C',NOW(),0,true,1);
INSERT INTO MASTECHNOLOGY (NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES ('SAP','C',NOW(),0,true,1);





insert into SPECIALTY (name,code,isactive)

VALUES 
('ABAP','a',1),
('ASP.Net','a',1),
('Basis','a',1),
('BI','a',1),
('BPC - B','a',1),
('BPC - C','a',1),
('BW','a',1),
('C#','a',1),
('C++.Netframework','a',1),
('CO','a',1),
('CRM','a',1),
('CSS','a',1),
('Eclipse','a',1),
('FI','a',1),
('Hibernate','a',1),
('HTML','a',1),
('J2EE','a',1),
('Java Script','a',1),
('JBOSS','a',1),
('JQUERY SVN Respsoitry','a',1),
('JSF','a',1),
('MM','a',1),
('Mobility','a',1),
('MVC','a',1),
('Oracle','a',1),
('Oracle10g','a',1),
('Oracle9i','a',1),
('PI','a',1),
('PL/SQL','a',1),
('PM','a',1),
('PP','a',1),
('SD','a',1),
('Security','a',1),
('Spring','a',1),
('SRM','a',1),
('Symfony1,2','a',1),
('TR','a',1),
('VB.Net','a',1),
('Web App','a',1),
('Web Logic','a',1),
('WPF','a',1),
('Zend','a',1);

--INSERT JOBLEVEL

insert into joblevel(name,code,isactive) 
values('Account Execute','AE',1),
('Account Manager','AM',1),
('Business Division Director','BDD',1),
('Consultant','C',1),
('Manager','M',1),
('Managing Consultant','MC',1),
('Partner','P',1),
('Principal Consultant','PC',1),
('Professional','PF',1),
('Senior Account Manager','SAM',1),
('Senior Consultant','SC',1),
('Senior Manager','SM',1),
('Senior Professional','SP',1),
('Support Division Director','SDD',1);

