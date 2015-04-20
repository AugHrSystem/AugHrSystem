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
PRIMARY KEY (Emp_Exp_Id),
FOREIGN KEY (Emp_Id) REFERENCES emp_employee(Emp_Id) 
);

/*Employee*/
CREATE TABLE hris_system.emp_employee 
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
  
PRIMARY KEY (Emp_Id))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

