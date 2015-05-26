--MASDIVISION
--INSERT INTO MAS_DIVISION (NAME,CODE,ISACTIVE) VALUES ('CEO Office of CEO','01',1);
INSERT INTO MAS_DIVISION (NAME,CODE,ISACTIVE) VALUES ('F&A Finance & Administration','02',1);
INSERT INTO MAS_DIVISION (NAME,CODE,ISACTIVE) VALUES ('MKT Marketing','04',1);
INSERT INTO MAS_DIVISION (NAME,CODE,ISACTIVE) VALUES ('MoH Ministry of Happiness','05',1);
INSERT INTO MAS_DIVISION (NAME,CODE,ISACTIVE) VALUES ('SAP SAP Services','06',1);
INSERT INTO MAS_DIVISION (NAME,CODE,ISACTIVE) VALUES ('TXM Transformation','07',1);


--MASTECHNOLOGY
INSERT INTO MAS_TECHNOLOGY (ID,NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES (1,'.Net','C',NOW(),0,true,1);
INSERT INTO MAS_TECHNOLOGY (ID,NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES (2,'COBOL','C',NOW(),0,true,1);
INSERT INTO MAS_TECHNOLOGY (ID,NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES (3,'Java','C',NOW(),0,true,1);
INSERT INTO MAS_TECHNOLOGY (ID,NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES (4,'PHP','C',NOW(),0,true,1);
INSERT INTO MAS_TECHNOLOGY (ID,NAME,auditFlag,createdTimeStamp,createdBy,ISACTIVE,CODE) VALUES (5,'SAP','C',NOW(),0,true,1);


--MASSPECIALTY
insert into MAS_SPECIALTY (name,code,isactive)
VALUES 
('ABAP','01',1),
('ASP.Net','02',1),
('Basis','03',1),
('BI','04',1),
('BPC - B','05',1),
('BPC - C','06',1),
('BW','07',1),
('C#','08',1),
('C++.Netframework','09',1),
('CO','10',1),
('CRM','11',1),
('CSS','12',1),
('Eclipse','13',1),
('FI','14',1),
('Hibernate','15',1),
('HTML','16',1),
('J2EE','17',1),
('Java Script','18',1),
('JBOSS','19',1),
('JQUERY SVN Respsoitry','20',1),
('JSF','21',1),
('MM','22',1),
('Mobility','23',1),
('MVC','24',1),
('Oracle','25',1),
('Oracle10g','26',1),
('Oracle9i','27',1),
('PI','28',1),
('PL/SQL','29',1),
('PM','30',1),
('PP','31',1),
('SD','32',1),
('Security','33',1),
('Spring','34',1),
('SRM','35',1),
('Symfony1,2','36',1),
('TR','37',1),
('VB.Net','38',1),
('Web App','39',1),
('Web Logic','40',1),
('WPF','41',1),
('Zend','42',1);


--JOBLEVEL
insert into MAS_JOBLEVEL(name,code,isactive) 
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

--ADDRESS
INSERT INTO EMP_ADDRESS(ADDRESS1,ADDRESS2,ZIPCODE) VALUES ('200 MOO.6','BANGKOK','10800'),
('100 MOO.1','CHAINGMAI','10700'),
('50 MOO.5','CHAINGRAI','10500'),
('2/3 MOO.1','SAMUTPAKARN','10600');

--MASADDRESSTYPE
INSERT INTO MAS_ADDRESSTYPE(ADDRESSTYPENAME,CODE,ISACTIVE) VALUES ('Present address','P01',1),('Permanent address','M02',1),
('Permanent address','M02',1);


--MASDEGREETYPE
insert into MAS_DEGREETYPE (name,code,isactive)
VALUES
('Bachelor','a',1),
('Masters','a',1),
('Ph.D.','a',1);


--MASEMPLOYMENT
INSERT INTO MAS_EMPLOYMENT(NAME,CODE,ISACTIVE) VALUES ('Permanent','A01',1);
INSERT INTO MAS_EMPLOYMENT(NAME,CODE,ISACTIVE) VALUES ('Contract','A01',1);

--MASPROVINCE
insert into MAS_PROVINCE (PROVINCENAME,CODE,ISACTIVE)
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

--MasCoreSkill
INSERT INTO MAS_CORESKILL (NAME,CODE,ISACTIVE) VALUES 
('Administration','AD',b'1'),
('Application Analyst','AA',b'1'),
('Business Analyst','BA',b'1'),
('Business Development','BD',b'1'),
('Data Base Administrator','DBA',b'1'),
('Finance','FI',b'1'),
('Happiness','HP',b'1'),
('ITS','ITS',b'1'),
('Marketing','MK',b'1'),
('Ministry of Happiness','MHP',b'1'),
('Programmer','PG',b'1'),
('Project Coordinator','PC',b'1'),
('Project Manager','PM',b'1'),
('Recruitment','RC',b'1'),
('SAP','SAP',b'1'),
('Software Tester','ST',b'1'),
('Solution Architect','SR',b'1'),
('System Analyst','SA',b'1'),
('Transformation','TR',b'1');




--ADDEMPLOYEE
INSERT INTO EMP_EMPLOYEE (EMPLOYEE_CODE,NAME_THAI,NAME_ENG,TEL_HOME,TEL_MOBILE,EMERGENCY_CONTACT,
EMERGENCY_CONTACT_PHONE_NUMBER,DATEOFBIRTH,ID_CARD,DIVISION_ID,JOBLEVEL_ID,TECHNOLOGY_ID,EMAIL) VALUES
('TH2009188','Bill','Bill',0811111111,0822222222,'Mom',191,'1991-01-01',12345678,1,1,1,'bill@gmail.com'),
('TH2009189','Parn','Parn',0800000000,0899999999,'Dad',191,'1992-02-02',12345678,2,2,1,'parn@gmail.com');



--Ability
insert into EMP_ABILITY (RANK,SPECIALTY_ID,EMPLOYEE_ID)
values
(10,2,1),
(1,5,1),
(2,6,1),
(4,8,1);


--EDUCATION
INSERT INTO EMP_EDUCATION (UNIVERSITY,GPA,FACULTY,MAJOR,DEGREETYPE_ID,CERTIFICATE,DESCRIPTION,EMPLOYEE_ID) VALUES 
('Silpakorn',4.00,'SCIENCE','IT',1,'JAVA','JAVA',2);

--MASELOCATION
INSERT INTO MAS_LOCATION(NAME,CODE,ISACTIVE) VALUES ('Thailand','TH',1),
 ('Singapore','SG',1),
 ('Indonesia','ID',1),
 ('Jakarta','JK',1);
 

 --EXPERIENCE
INSERT INTO EMP_EXPERIENCE(COMPANY_NAME,EMPLOYEE_ID)
VALUES('Augmentis',2);


--REFERENCE
INSERT INTO EMP_REFERENCE(NAME,ADDRESS,TEL,OCCUPATION,EMPLOYEE_ID)
VALUES('Mean','bangkok',0812345675,'sale',2);


--REWARD
INSERT INTO EMP_REWARD(TYPE_REWARD,YEAR,EMPLOYEE_ID)
VALUES('nobel','1991',2);


--ABILITY
INSERT INTO  EMP_ABILITY (RANK,SPECIALTY_ID,EMPLOYEE_ID)
VALUES
(10,7,2),
(1,5,2),
(2,6,2),
(4,8,2);


 
--HISTORY
INSERT INTO EMP_HISTORY (POSITION,SALARY,OLD_SALARY,REASON_OF_ADJUSTMENT,ADJUSTMENT_TIME,EMPLOYEE_ID) 
VALUES 
('CEO',45000.00,4000.00,'one',4,2);


INSERT INTO MAS_STAFFTYPE(
 AUDITFLAG,
 CREATEDBY,
 CREATEDTIMESTAMP,
 CODE,
 ISACTIVE,
 STAFFTYPENAME)
values
('C',0,NOW(),'01A',true,'Billable'), 
('C',0,NOW(),'02A',true,'Back office');



INSERT INTO MAS_RELATIONTYPE(
 AUDITFLAG,
 CODE,
 CREATEDBY,
 CREATEDTIMESTAMP,
 ISACTIVE,
 RELATIONTYPE
) values
('C','01',0,NOW(),true,'SON'),
('C','2',0,NOW(),true,'DAUGTHER');



INSERT INTO EMP_EMPLOYEEFAMILY(
 AUDITFLAG,
 CREATEDBY,
 CREATEDTIMESTAMP,
 ADDRESS,
 AGE,
 FIRSTNAME,
 GENDER,
 LASTNAME,
 TEL,
 EMPLOYEE_ID,
 MASRELATION_ID
) values
('C',0,NOW(),'7/7 m.8 nongsamwong nongsua pathumtani 12170',24,'apiva','Female','kimkatanom','0890851022',1,1);

--PROBATION
INSERT INTO EMP_PROBATION (DATE_FROM, DATE_TO, STATUS, EMPLOYEE_ID) VALUES
('2014-01-01','2014-03-01','Not Pass',1),
('2014-01-01','2014-03-01','Pass',2);

--MASLEAVETYPE
INSERT INTO MAS_LEAVETYPE (NAME,CODE,ISACTIVE) VALUES
('Annual Holiday Leave','L01',true),
('Maternity Leave','L02',true),
('Personal Leave','L03',true),
('Sick Leave','L04',true),
('Urgent Leave','L05',true),
('Other','L06',true);
