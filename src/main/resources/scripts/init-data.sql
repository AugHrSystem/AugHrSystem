--DIVISION
INSERT INTO DIVISION (NAME) VALUES ("CEO Office of CEO");
INSERT INTO DIVISION (NAME) VALUES ("F&A Finance & Administration");
INSERT INTO DIVISION (NAME) VALUES ("ITS Integrated Technology Services");
INSERT INTO DIVISION (NAME) VALUES ("MKT Marketing");
INSERT INTO DIVISION (NAME) VALUES ("MoH Ministry of Happiness");
INSERT INTO DIVISION (NAME) VALUES ("SAP SAP Services");
INSERT INTO DIVISION (NAME) VALUES ("TXM Transformation");


--MASTECHNOLOGY
INSERT INTO MASTECHNOLOGY (NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES ('.Net','C',NOW(),0,true,1);
INSERT INTO MASTECHNOLOGY (NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES ('COBOL','C',NOW(),0,true,1);
INSERT INTO MASTECHNOLOGY (NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES ('Java','C',NOW(),0,true,1);
INSERT INTO MASTECHNOLOGY (NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES ('PHP','C',NOW(),0,true,1);
INSERT INTO MASTECHNOLOGY (NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES ('SAP','C',NOW(),0,true,1);


--SPECIALTY
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


--JOBLEVEL
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




--ADDRESSTYPE
INSERT INTO addresstype(NAME,CODE,ISACTIVE) VALUES ('Present address','P01',1),('Permanent address','M02',1);


--DEGREETYPE
insert into DEGREETYPE (name,code,isactive)
VALUES
('Bachelor','a',1),
('Masters','a',1),
('Ph.D.','a',1);


--EMPLOYMENT
INSERT INTO EMPLOYMENT(NAME,CODE,ISACTIVE) VALUES ('PERMANENT','A01',1),('CONTRACT','B02',1);


--PROVINCE
insert into PROVINCE (name,code,isactive)
VALUES
('Bangkok','a',1),
('Chiang Rai','a',1),
('Chiang Mai','a',1),
('Nan','a',1),
('Phayao','a',1),
('Phrae','a',1),
('Mae Hong Son','a',1),
('Lampang','a',1),
('Lamphun','a',1),
('Uttaradit','a',1),
('Kalasin','a',1),
('Khon Kaen','a',1),
('Chaiyaphum','a',1),
('Nakhon Phanom','a',1),
('Nakhon Ratchasima','a',1),
('Bueng Kan','a',1),
('Buri Ram','a',1),
('Maha Sarakham','a',1),
('Mukdahan','a',1),
('Yasothon','a',1),
('Roi Et','a',1),
('Loei','a',1),
('Si Sa Ket','a',1),
('Sakon Nakhon','a',1),
('Surin','a',1),
('Nong Khai','a',1),
('Nong Bua Lam Phu','a',1),
('Amnat Charoen','a',1),
('Udon Thani','a',1),
('Ubon Ratchathani','a',1),
('Kamphaeng Phet','a',1),
('Chai Nat','a',1),
('Nakhon Nayok','a',1),
('Nakhon Pathom','a',1),
('Nakhon Sawan','a',1),
('Nonthaburi','a',1),
('Pathum Thani','a',1),
('Phra Nakhon Si Ayutthaya','a',1),
('Phichit','a',1),
('Phitsanulok','a',1),
('Phetchabun','a',1),
('Lop Buri','a',1),
('Samut Prakan','a',1),
('Samut Songkhram','a',1),
('Samut Sakhon','a',1),
('Sing Buri','a',1),
('Sukhothai','a',1),
('Suphan Buri','a',1),
('Saraburi','a',1),
('Ang Thong','a',1),
('Uthai Thani','a',1),
('Chanthaburi','a',1),
('Chachoengsao','a',1),
('Chon Buri','a',1),
('Trat','a',1),
('Prachin Buri','a',1),
('Rayong','a',1),
('Sa Kaeo','a',1),
('Kanchanaburi','a',1),
('Tak','a',1),
('Prachuap Khiri Khan','a',1),
('Phetchaburi','a',1),
('Ratchaburi','a',1),
('Krabi','a',1),
('Chumphon','a',1),
('Trang','a',1),
('Nakhon Si Thammarat','a',1),
('Narathiwat','a',1),
('Pattani','a',1),
('Phangnga','a',1),
('Phatthalung','a',1),
('Phuket','a',1),
('Yala','a',1),
('Ranong','a',1),
('Songkhla','a',1),
('Satun','a',1),
('Surat Thani','a',1);


--CORESKII
insert into CORESKII (name,code,isactive)
VALUES
('Administration','C001',1),
('Application Analyst','C002',1),
('Business Analyst','C003',1),
('Business Development','C004',1),
('Data Base Administrator','C005',1),
('Finance','C006',1),
('Happiness','C007',1),
('ITS','C008',1),
('Marketing','C009',1),
('Ministry of Happiness','C010',1),
('Programmer','C011',1);
('Project Coordinator','C012',1),
('Project Manager','C013',1),
('Recruitment','C014',1);
('Lamphun','C015',1),
('Uttaradit','C016',1),
('Kalasin','C017',1);
('Project Coordinator','C018',1),
('Project Manager','C019',1),
('SAP','C020',1);
('Software Tester','C021',1),
('Solution Architect','C022',1),
('System Analyst','C023',1)
('Transformation','C024',1);

