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
FOREIGN KEY (Emp_Id) REFERENCES Emp_Employee(Emp_Id) 
);

