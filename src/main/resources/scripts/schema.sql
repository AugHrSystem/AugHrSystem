/* Core Skill Table*/
create table Mas_CoreSkill (
Mas_Core_Id int(5) not null auto_increment, 
Mas_Core_Name varchar (50) not null, 
Mas_Core_Code varchar (20), 
Mas_Core_isActive boolean not null default '0', 
PRIMARY KEY (Mas_Core_Id)
);

/* History or Experience Table*/
create table Emp_Experience (
Emp_Exp_Id int(5) not null auto_increment, 
Emp_Exp_CompanyName varchar (50) not null, 
Emp_Exp_DateForm date, 
Emp_Exp_DateTo date,
Emp_Exp_Address varchar (200),
Emp_Exp_Business varchar (50) not null,
Emp_Exp_Position varchar (50) not null,
Emp_Exp_Supervisor varchar (100),
Emp_Exp_Description varchar (200),
Emp_Id int(5) NOT NULL, 
PRIMARY KEY (Emp_Exp_Id),
FOREIGN KEY (Emp_Id) REFERENCES emp_employee(Emp_Id) 
);

/* Ability */
CREATE TABLE emp_abiility (
`Emp_Abi_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Emp_Abi_id`));
ALTER TABLE `hris_system`.`emp_abiility` 
DROP FOREIGN KEY `Mas_Spe_Id`;
ALTER TABLE `hris_system`.`emp_abiility` 
ADD COLUMN `Mas_Spe_Id` INT NULL AFTER `Emp_Abi_id`,
ADD INDEX `Mas_Spe_Id_idx` (`Mas_Spe_Id` ASC);
ALTER TABLE `hris_system`.`emp_abiility` 
ADD CONSTRAINT `Mas_Spe_Id`
  FOREIGN KEY (`Mas_Spe_Id`)
  REFERENCES `hris_system`.`specialty` (`spi_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

/*Employee*/
CREATE TABLE emp_employee 
(
Emp_Id INT(5) NOT NULL,
  
Emp_Name VARCHAR(15) NOT NULL,
  
Emp_Address VARCHAR(50) NOT NULL,
 
Emp_Tel VARCHAR(10) NOT NULL,
 
Emp_Salary FLOAT(10) NOT NULL,
  
Emp_DOB DATE NOT NULL,
  
Emp_Age INT(2) NOT NULL,
  
Emp_Religion VARCHAR(15) NOT NULL,
  
Emp_PlaceDOB VARCHAR(15) NOT NULL,
  
Emp_IdCard VARCHAR(13) NOT NULL,
  
Emp_Heigh VARCHAR(15) NOT NULL,
  
Emp_Weigth VARCHAR(15) NOT NULL,
  
Emp_Gender CHAR(1) NOT NULL,
  
Emp_Status VARCHAR(15) NOT NULL,
  
Emp_Military VARCHAR(15) NULL,
  
Emp_Qualificationl VARCHAR(15) NULL,
  
Emp_Code VARCHAR(10) NOT NULL,
  
PRIMARY KEY (Emp_Id));

/*Education*/
CREATE TABLE `emp_education` (
  `Emp_Ed_Id` int(11) NOT NULL auto_increment,
  `Emp_Ed_University` varchar(100) NOT NULL,
  `Emp_Ed_Date` date NOT NULL,
  `Emp_Ed_GPA` char(4) NOT NULL,
  `Emp_Ed_Faculty` varchar(45) NOT NULL,
  `Emp_Ed_Major` varchar(45) NOT NULL,
  `Emp_Ed_Degree` varchar(45) NOT NULL,
  `Emp_Id` INT(5) NOT NULL,
  PRIMARY KEY (`Emp_Ed_Id`),
  FOREIGN KEY (Emp_Id) REFERENCES Emp_Employee(Emp_Id) 
);

/*Division*/
CREATE TABLE `mas_division` (
  `Mas_Div_Id` int(11) NOT NULL auto_increment,
  `Mas_Div_Name` varchar(45) NOT NULL,
  `Mas_Div_Code` varchar(45) NOT NULL,
  PRIMARY KEY (`Mas_Div_Id`)
);



CREATE TABLE `Reference` (
  `ref_id` int(11) NOT NULL auto_increment,
  `ref_name` varchar(45) NOT NULL,
  `ref_address` varchar(200) NOT NULL,
  `ref_tel` varchar(10) NOT NULL,
  `ref_occupation` varchar(45) NOT NULL,
  PRIMARY KEY (`ref_id`)
) ;


CREATE TABLE `Specialty` (
  `spi_id` int(11) NOT NULL auto_increment,
  `spi_name` varchar(45) NOT NULL,
  `spi_code` varchar(45) NOT NULL,
  PRIMARY KEY (`spi_id`)
);

/*Mas_Employment*/
CREATE TABLE `mas_employment` (
  `Mas_Em_TypeId` int(11) NOT NULL AUTO_INCREMENT,
  `Mas_TypeName` varchar(45) NOT NULL,
  PRIMARY KEY (`Mas_Em_TypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Mas_Joblevel*/
CREATE TABLE `mas_joblevel` (
`Mas_Job_Id` int(11) NOT NULL AUTO_INCREMENT,
`Mas_Job_Name` varchar(45) NOT NULL,
PRIMARY KEY (`Mas_Job_Id`)
);
