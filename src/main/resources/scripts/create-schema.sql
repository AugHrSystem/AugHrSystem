
    alter table EMP_ABILITY 
        drop 
        foreign key FK60EACC73FC43B9EA;

    alter table EMP_ABILITY 
        drop 
        foreign key FK60EACC73AA332609;

    alter table EMP_ADDRESS 
        drop 
        foreign key FK6410B33DA94034CA;

    alter table EMP_ADDRESS 
        drop 
        foreign key FK6410B33DF1CF040A;

    alter table EMP_ADDRESS 
        drop 
        foreign key FK6410B33DAA332609;

    alter table EMP_ALLOWANCES 
        drop 
        foreign key FK139CA752AA332609;

    alter table EMP_CARD 
        drop 
        foreign key FK76CEC847AA332609;

    alter table EMP_CERTIFICATION 
        drop 
        foreign key FKFDB0543AA332609;

    alter table EMP_EDUCATION 
        drop 
        foreign key FK5D3BCCB1E915F90A;

    alter table EMP_EDUCATION 
        drop 
        foreign key FK5D3BCCB1AA332609;

    alter table EMP_EMPLOYEE 
        drop 
        foreign key FKADCCB865CE38256A;

    alter table EMP_EMPLOYEE 
        drop 
        foreign key FKADCCB865FD52A74A;

    alter table EMP_EMPLOYEE 
        drop 
        foreign key FKADCCB865391EE7AA;

    alter table EMP_EMPLOYEE 
        drop 
        foreign key FKADCCB865EA582AAA;

    alter table EMP_EMPLOYEE 
        drop 
        foreign key FKADCCB8652349934A;

    alter table EMP_EMPLOYEE 
        drop 
        foreign key FKADCCB865BFC260E9;

    alter table EMP_EMPLOYEE 
        drop 
        foreign key FKADCCB865627A91E9;

    alter table EMP_EMPLOYEE 
        drop 
        foreign key FKADCCB865124D6A6B;

    alter table EMP_EMPLOYEE 
        drop 
        foreign key FKADCCB865D7B8C88A;

    alter table EMP_EMPLOYEEFAMILY 
        drop 
        foreign key FKF9636809A63767E5;

    alter table EMP_EMPLOYEEFAMILY 
        drop 
        foreign key FKF9636809AA332609;

    alter table EMP_EXPERIENCE 
        drop 
        foreign key FK5E629561AA332609;

    alter table EMP_HISTORY 
        drop 
        foreign key FKDFB8FBDDAA332609;

    alter table EMP_LEAVE 
        drop 
        foreign key FK638AA840BC0B552A;

    alter table EMP_LEAVE 
        drop 
        foreign key FK638AA840AA332609;

    alter table EMP_LOGIN 
        drop 
        foreign key FK638F48F2B716EF0A;

    alter table EMP_LOGIN 
        drop 
        foreign key FK638F48F2C19617CA;

    alter table EMP_LOGIN 
        drop 
        foreign key FK638F48F2AA332609;

    alter table EMP_PROBATION 
        drop 
        foreign key FK2B62C9C9AA332609;

    alter table EMP_PUNISH 
        drop 
        foreign key FK1584F44CAA332609;

    alter table EMP_REFERENCE 
        drop 
        foreign key FK376BA454AA332609;

    alter table EMP_REWARD 
        drop 
        foreign key FK181126A6AA332609;

    alter table EMP_SITE 
        drop 
        foreign key FK76D62C7EAA332609;

    alter table EMP_SKILLLANGUAGE 
        drop 
        foreign key FKDFDC2D322F738989;

    alter table EMP_SKILLLANGUAGE 
        drop 
        foreign key FKDFDC2D32AA332609;

    drop table if exists EMP_ABILITY;

    drop table if exists EMP_ADDRESS;

    drop table if exists EMP_ALLOWANCES;

    drop table if exists EMP_CARD;

    drop table if exists EMP_CERTIFICATION;

    drop table if exists EMP_EDUCATION;

    drop table if exists EMP_EMPLOYEE;

    drop table if exists EMP_EMPLOYEEFAMILY;

    drop table if exists EMP_EXPERIENCE;

    drop table if exists EMP_HISTORY;

    drop table if exists EMP_LEAVE;

    drop table if exists EMP_LOGIN;

    drop table if exists EMP_OFFICIAL;

    drop table if exists EMP_PROBATION;

    drop table if exists EMP_PUNISH;

    drop table if exists EMP_REFERENCE;

    drop table if exists EMP_REWARD;

    drop table if exists EMP_SITE;

    drop table if exists EMP_SKILLLANGUAGE;

    drop table if exists MAS_ADDRESSTYPE;

    drop table if exists MAS_CORESKILL;

    drop table if exists MAS_DEGREETYPE;

    drop table if exists MAS_DIVISION;

    drop table if exists MAS_EMPLOYMENT;

    drop table if exists MAS_JOBLEVEL;

    drop table if exists MAS_LEAVETYPE;

    drop table if exists MAS_LOCATION;

    drop table if exists MAS_PROVINCE;

    drop table if exists MAS_RELATIONTYPE;

    drop table if exists MAS_ROLE;

    drop table if exists MAS_SKILLLANGUAGE;

    drop table if exists MAS_SPECIALTY;

    drop table if exists MAS_STAFFTYPE;

    drop table if exists MAS_TECHNOLOGY;

    create table EMP_ABILITY (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        RANK integer not null,
        EMPLOYEE_ID integer not null,
        SPECIALTY_ID integer not null,
        primary key (ID)
    );

    create table EMP_ADDRESS (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        ADDRESS1 varchar(255),
        ADDRESS2 varchar(255),
        ZIPCODE integer,
        ADDRESSTYPE_ID integer,
        EMPLOYEE_ID integer,
        PROVINCE_ID integer,
        primary key (ID),
        unique (ADDRESS1, ADDRESS2)
    );

    create table EMP_ALLOWANCES (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        ALLOWANCES_TYPE varchar(255) not null,
        AMOUNT_ALLOWANCES varchar(255) not null,
        EMPLOYEE_ID integer not null,
        primary key (ID)
    );

    create table EMP_CARD (
        ID integer not null auto_increment,
        CARDNO varchar(255) not null,
        END_DATE datetime,
        REMARK varchar(255) not null,
        START_DATE datetime,
        STATUS varchar(255) not null,
        EMPLOYEE_ID integer not null,
        primary key (ID)
    );

    create table EMP_CERTIFICATION (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CERTIFICATION_FROM varchar(255) not null,
        NAME varchar(255) not null,
        YEAR varchar(255) not null,
        EMPLOYEE_ID integer not null,
        primary key (ID)
    );

    create table EMP_EDUCATION (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CERTIFICATE varchar(255) not null,
        DESCRIPTION varchar(255) not null,
        FACULTY varchar(255) not null,
        GPA double precision not null,
        GRADUATED_DATE datetime not null,
        MAJOR varchar(255) not null,
        START_DATE datetime not null,
        UNIVERSITY varchar(255) not null,
        EMPLOYEE_ID integer not null,
        DEGREETYPE_ID integer not null,
        primary key (ID)
    );

    create table EMP_EMPLOYEE (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        ADDRESS varchar(255),
        AGE integer,
        BRANCH_OF_SERVICE varchar(255),
        CONGENITAL_DISEASE varchar(255),
        DATEOFBIRTH datetime not null,
        DATE_TO_BE_DRAFTED datetime,
        DESCRIPTION_FRIEND varchar(255),
        DESCRIPTION_MAGAZINE varchar(255),
        DESCRIPTION_NEWSPAPER varchar(255),
        DESCRIPTION_OTHER varchar(255),
        DESCRIPTION_WEBSITE varchar(255),
        DESCRIPTION_YES varchar(255),
        EMAIL varchar(255) not null,
        EMERGENCY_CONTACT varchar(255) not null,
        EMERGENCY_CONTACT_ADDRESS varchar(255),
        EMERGENCY_CONTACT_PHONE_NUMBER varchar(255) not null,
        EMPLOYEE_CODE varchar(255) not null,
        EXPIRY_DATE datetime,
        FROM_YEAR datetime,
        HEIGHT integer,
        HOSPITAL varchar(255),
        ID_CARD integer not null,
        IMAGE varchar(255),
        ISMANAGER integer,
        ISSUED_OFFICE varchar(255),
        ISSUED_OFFICE2 varchar(255),
        KNOW_AUG_FRIEND varchar(255),
        KNOW_AUG_MAGAZINE varchar(255),
        KNOW_AUG_NEWSPAPER varchar(255),
        KNOW_AUG_OTHER varchar(255),
        KNOW_AUG_WEBSITE varchar(255),
        KNOW_EMPLOYED_YES varchar(255),
        KNOW_EMPLOYER_NO varchar(255),
        MARITAL_STATUS varchar(255),
        MARRIAGE_CERTIFICATE_NO varchar(255),
        MILITARY_SERVICE_NO varchar(255),
        MILITARY_SERVICE_YES varchar(255),
        NAME_ENG varchar(255) not null,
        NAME_THAI varchar(255) not null,
        NICKNAME_ENG varchar(255),
        NICKNAME_THAI varchar(255),
        NUMBER_OF_CHILDREN varchar(255),
        OCCUPATION varchar(255),
        PLACEOFBIRTH varchar(255),
        PREVIOUS_EMPLOYER_NO varchar(255),
        PREVIOUS_EMPLOYER_YES varchar(255),
        PREVIOUSEMP_REASONS_NO varchar(255),
        REASONS_NO varchar(255),
        RELATIONSHIP_WITH_EMERGENCY_CONTACT varchar(255),
        RELIGION varchar(255),
        SERVICE_NO varchar(255),
        SEX varchar(255),
        SPOUSE_NAME varchar(255),
        SURNAME_ENG varchar(255),
        SURNAME_THAI varchar(255),
        TEL_FAX integer,
        TEL_HOME integer not null,
        TEL_MOBILE integer not null,
        TO_YEAR datetime,
        WEIGTH integer,
        AIM_EMP_ID integer,
        MAS_CORE_SKILL_ID integer,
        DIVISION_ID integer not null,
        EMPLOYMENT_ID integer,
        JOBLEVEL_ID integer not null,
        LOCATION_ID integer,
        STAFFTYPE_ID integer,
        OFFICIAL_ID integer,
        TECHNOLOGY_ID integer,
        primary key (ID),
        unique (ID)
    );

    create table EMP_EMPLOYEEFAMILY (
        ID integer not null auto_increment,
        AUDITFLAG varchar(1) not null,
        CREATEDBY integer not null,
        CREATEDTIMESTAMP datetime not null,
        UPDATEDBY integer,
        UPDATEDTIMESTAMP datetime,
        ADDRESS varchar(255) not null,
        AGE integer not null,
        FIRSTNAME varchar(50) not null,
        GENDER varchar(10) not null,
        LASTNAME varchar(50) not null,
        TEL varchar(10) not null,
        OCCUPATION varchar(255),
        POSITION varchar(255),
        EMPLOYEE_ID integer not null,
        MASRELATION_ID integer not null,
        primary key (ID)
    );

    create table EMP_EXPERIENCE (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        ADDRESS varchar(255),
        TYPE_OF_BUSINESS varchar(255),
        COMPANY_NAME varchar(255),
        DATE_FROM datetime,
        DATE_TO datetime,
        POSITION varchar(255),
        REASON_OF_REGISNATION varchar(255),
        REFERENCE varchar(255),
        RESPONSIBILITY varchar(255),
        SALARY integer,
        EMPLOYEE_ID integer not null,
        primary key (ID)
    );

    create table EMP_HISTORY (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        ADJUSTMENT_TIME integer not null,
        DATE_OF_ADJUSTMENT datetime not null,
        OLD_SALARY double precision not null,
        POSITION varchar(255) not null,
        REASON_OF_ADJUSTMENT varchar(255) not null,
        SALARY double precision not null,
        EMPLOYEE_ID integer not null,
        primary key (ID)
    );

    create table EMP_LEAVE (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        DATE_FROM datetime,
        DATE_TO datetime,
        TIME_FROM datetime,
        TIME_TO datetime,
        EMPLOYEE_ID integer not null,
        LEAVETYPE_ID integer not null,
        primary key (ID)
    );

    create table EMP_LOGIN (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        PASSWORD varchar(13) not null,
        USERNAME varchar(255) not null,
        EMPLOYEE_ID integer not null,
        MAS_LOCATION_ID integer,
        ROLE_ID integer,
        primary key (ID),
        unique (ID)
    );

    create table EMP_OFFICIAL (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        POSITION_APPLIED_FOR varchar(255),
        SALARY_EXPECTED double precision,
        START_DATE datetime,
        primary key (ID),
        unique (ID)
    );

    create table EMP_PROBATION (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        DATE_FROM datetime,
        DATE_TO datetime,
        STATUS varchar(255),
        EMPLOYEE_ID integer not null,
        primary key (ID)
    );

    create table EMP_PUNISH (
        ID integer not null auto_increment,
        DATEPUNISH datetime,
        DESCRIPTION varchar(255),
        EMPLOYEE_ID integer,
        primary key (ID)
    );

    create table EMP_REFERENCE (
        ID integer not null auto_increment,
        ADDRESS varchar(255) not null,
        NAME varchar(255) not null,
        OCCUPATION varchar(255) not null,
        TEL varchar(255) not null,
        EMPLOYEE_ID integer not null,
        primary key (ID)
    );

    create table EMP_REWARD (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        ISACTIVE bit,
        REASON varchar(255),
        TYPE_REWARD varchar(255) not null,
        YEAR varchar(255) not null,
        EMPLOYEE_ID integer not null,
        primary key (ID)
    );

    create table EMP_SITE (
        ID integer not null auto_increment,
        AUDITFLAG varchar(1) not null,
        CREATEDBY integer not null,
        CREATEDTIMESTAMP datetime not null,
        UPDATEDBY integer,
        UPDATEDTIMESTAMP datetime,
        ENDDATE datetime not null,
        PROJECTNAME varchar(255) not null,
        PROJECTOWNER varchar(255) not null,
        PROJECTOWNERCONTACT varchar(255) not null,
        STARTDATE datetime not null,
        EMPLOYEE_ID integer not null,
        primary key (ID)
    );

    create table EMP_SKILLLANGUAGE (
        ID integer not null auto_increment,
        AUDITFLAG varchar(1) not null,
        CREATEDBY integer not null,
        CREATEDTIMESTAMP datetime not null,
        UPDATEDBY integer,
        UPDATEDTIMESTAMP datetime,
        READINGSKILL varchar(255) not null,
        SPEAKINGSKILL varchar(255) not null,
        UNDERSTANDINDSKILL varchar(255) not null,
        WRITINGSKILL varchar(255) not null,
        EMPLOYEE_ID integer not null,
        MASSKILLLANGUAGE_ID integer not null unique,
        primary key (ID)
    );

    create table MAS_ADDRESSTYPE (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255) not null,
        ISACTIVE varchar(255) not null,
        ADDRESSTYPENAME varchar(255) not null,
        primary key (ID)
    );

    create table MAS_CORESKILL (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255),
        ISACTIVE bit,
        NAME varchar(255) not null,
        primary key (ID)
    );

    create table MAS_DEGREETYPE (
        DEGREETYPE_ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255) not null,
        ISACTIVE bit not null,
        NAME varchar(200) not null,
        primary key (DEGREETYPE_ID)
    );

    create table MAS_DIVISION (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255) not null,
        ISACTIVE bit not null,
        NAME varchar(255) not null,
        primary key (ID)
    );

    create table MAS_EMPLOYMENT (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255) not null,
        ISACTIVE bit not null,
        NAME varchar(200) not null,
        primary key (ID)
    );

    create table MAS_JOBLEVEL (
        ID integer not null auto_increment unique,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255),
        ISACTIVE bit,
        NAME varchar(50) not null,
        primary key (ID)
    );

    create table MAS_LEAVETYPE (
        LEAVETYPE_ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255) not null,
        ISACTIVE bit not null,
        NAME varchar(255) not null,
        primary key (LEAVETYPE_ID)
    );

    create table MAS_LOCATION (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255) not null,
        ISACTIVE bit not null,
        NAME varchar(200) not null,
        primary key (ID)
    );

    create table MAS_PROVINCE (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255) not null,
        ISACTIVE bit not null,
        PROVINCENAME varchar(255) not null,
        primary key (ID)
    );

    create table MAS_RELATIONTYPE (
        ID integer not null auto_increment,
        AUDITFLAG varchar(1) not null,
        CODE varchar(10) not null,
        CREATEDBY integer not null,
        CREATEDTIMESTAMP datetime not null,
        ISACTIVE bit not null,
        UPDATEDBY integer,
        UPDATEDTIMESTAMP datetime,
        RELATIONTYPE varchar(255) not null,
        primary key (ID)
    );

    create table MAS_ROLE (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        code varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        isActive bit,
        updatedBy integer,
        updatedTimeStamp datetime,
        TYPE varchar(255) not null,
        primary key (ID)
    );

    create table MAS_SKILLLANGUAGE (
        ID integer not null auto_increment,
        AUDITFLAG varchar(1) not null,
        CODE varchar(10) not null,
        CREATEDBY integer not null,
        CREATEDTIMESTAMP datetime not null,
        ISACTIVE bit not null,
        UPDATEDBY integer,
        UPDATEDTIMESTAMP datetime,
        SKILL_LANGUAGE varchar(255),
        primary key (ID)
    );

    create table MAS_SPECIALTY (
        SPEC_ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255) not null,
        ISACTIVE bit,
        NAME varchar(255) not null,
        primary key (SPEC_ID)
    );

    create table MAS_STAFFTYPE (
        ID integer not null auto_increment,
        AUDITFLAG varchar(1) not null,
        CREATEDBY integer not null,
        CREATEDTIMESTAMP datetime not null,
        UPDATEDBY integer,
        UPDATEDTIMESTAMP datetime,
        CODE varchar(255),
        ISACTIVE bit not null,
        STAFFTYPENAME varchar(255) not null,
        primary key (ID)
    );

    create table MAS_TECHNOLOGY (
        ID integer not null auto_increment,
        AUDITFLAG varchar(1) not null,
        CODE varchar(10) not null,
        CREATEDBY integer not null,
        CREATEDTIMESTAMP datetime not null,
        ISACTIVE bit not null,
        UPDATEDBY integer,
        UPDATEDTIMESTAMP datetime,
        NAME varchar(255) not null,
        primary key (ID)
    );

    alter table EMP_ABILITY 
        add index FK60EACC73FC43B9EA (SPECIALTY_ID), 
        add constraint FK60EACC73FC43B9EA 
        foreign key (SPECIALTY_ID) 
        references MAS_SPECIALTY (SPEC_ID);

    alter table EMP_ABILITY 
        add index FK60EACC73AA332609 (EMPLOYEE_ID), 
        add constraint FK60EACC73AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_ADDRESS 
        add index FK6410B33DA94034CA (PROVINCE_ID), 
        add constraint FK6410B33DA94034CA 
        foreign key (PROVINCE_ID) 
        references MAS_PROVINCE (ID);

    alter table EMP_ADDRESS 
        add index FK6410B33DF1CF040A (ADDRESSTYPE_ID), 
        add constraint FK6410B33DF1CF040A 
        foreign key (ADDRESSTYPE_ID) 
        references MAS_ADDRESSTYPE (ID);

    alter table EMP_ADDRESS 
        add index FK6410B33DAA332609 (EMPLOYEE_ID), 
        add constraint FK6410B33DAA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_ALLOWANCES 
        add index FK139CA752AA332609 (EMPLOYEE_ID), 
        add constraint FK139CA752AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_CARD 
        add index FK76CEC847AA332609 (EMPLOYEE_ID), 
        add constraint FK76CEC847AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_CERTIFICATION 
        add index FKFDB0543AA332609 (EMPLOYEE_ID), 
        add constraint FKFDB0543AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_EDUCATION 
        add index FK5D3BCCB1E915F90A (DEGREETYPE_ID), 
        add constraint FK5D3BCCB1E915F90A 
        foreign key (DEGREETYPE_ID) 
        references MAS_DEGREETYPE (DEGREETYPE_ID);

    alter table EMP_EDUCATION 
        add index FK5D3BCCB1AA332609 (EMPLOYEE_ID), 
        add constraint FK5D3BCCB1AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_EMPLOYEE 
        add index FKADCCB865CE38256A (JOBLEVEL_ID), 
        add constraint FKADCCB865CE38256A 
        foreign key (JOBLEVEL_ID) 
        references MAS_JOBLEVEL (ID);

    alter table EMP_EMPLOYEE 
        add index FKADCCB865FD52A74A (EMPLOYMENT_ID), 
        add constraint FKADCCB865FD52A74A 
        foreign key (EMPLOYMENT_ID) 
        references MAS_EMPLOYMENT (ID);

    alter table EMP_EMPLOYEE 
        add index FKADCCB865391EE7AA (DIVISION_ID), 
        add constraint FKADCCB865391EE7AA 
        foreign key (DIVISION_ID) 
        references MAS_DIVISION (ID);

    alter table EMP_EMPLOYEE 
        add index FKADCCB865EA582AAA (LOCATION_ID), 
        add constraint FKADCCB865EA582AAA 
        foreign key (LOCATION_ID) 
        references MAS_LOCATION (ID);

    alter table EMP_EMPLOYEE 
        add index FKADCCB8652349934A (TECHNOLOGY_ID), 
        add constraint FKADCCB8652349934A 
        foreign key (TECHNOLOGY_ID) 
        references MAS_TECHNOLOGY (ID);

    alter table EMP_EMPLOYEE 
        add index FKADCCB865BFC260E9 (OFFICIAL_ID), 
        add constraint FKADCCB865BFC260E9 
        foreign key (OFFICIAL_ID) 
        references EMP_OFFICIAL (ID);

    alter table EMP_EMPLOYEE 
        add index FKADCCB865627A91E9 (AIM_EMP_ID), 
        add constraint FKADCCB865627A91E9 
        foreign key (AIM_EMP_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_EMPLOYEE 
        add index FKADCCB865124D6A6B (MAS_CORE_SKILL_ID), 
        add constraint FKADCCB865124D6A6B 
        foreign key (MAS_CORE_SKILL_ID) 
        references MAS_CORESKILL (ID);

    alter table EMP_EMPLOYEE 
        add index FKADCCB865D7B8C88A (STAFFTYPE_ID), 
        add constraint FKADCCB865D7B8C88A 
        foreign key (STAFFTYPE_ID) 
        references MAS_STAFFTYPE (ID);

    alter table EMP_EMPLOYEEFAMILY 
        add index FKF9636809A63767E5 (MASRELATION_ID), 
        add constraint FKF9636809A63767E5 
        foreign key (MASRELATION_ID) 
        references MAS_RELATIONTYPE (ID);

    alter table EMP_EMPLOYEEFAMILY 
        add index FKF9636809AA332609 (EMPLOYEE_ID), 
        add constraint FKF9636809AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_EXPERIENCE 
        add index FK5E629561AA332609 (EMPLOYEE_ID), 
        add constraint FK5E629561AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_HISTORY 
        add index FKDFB8FBDDAA332609 (EMPLOYEE_ID), 
        add constraint FKDFB8FBDDAA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_LEAVE 
        add index FK638AA840BC0B552A (LEAVETYPE_ID), 
        add constraint FK638AA840BC0B552A 
        foreign key (LEAVETYPE_ID) 
        references MAS_LEAVETYPE (LEAVETYPE_ID);

    alter table EMP_LEAVE 
        add index FK638AA840AA332609 (EMPLOYEE_ID), 
        add constraint FK638AA840AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_LOGIN 
        add index FK638F48F2B716EF0A (ROLE_ID), 
        add constraint FK638F48F2B716EF0A 
        foreign key (ROLE_ID) 
        references MAS_ROLE (ID);

    alter table EMP_LOGIN 
        add index FK638F48F2C19617CA (MAS_LOCATION_ID), 
        add constraint FK638F48F2C19617CA 
        foreign key (MAS_LOCATION_ID) 
        references MAS_LOCATION (ID);

    alter table EMP_LOGIN 
        add index FK638F48F2AA332609 (EMPLOYEE_ID), 
        add constraint FK638F48F2AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_PROBATION 
        add index FK2B62C9C9AA332609 (EMPLOYEE_ID), 
        add constraint FK2B62C9C9AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_PUNISH 
        add index FK1584F44CAA332609 (EMPLOYEE_ID), 
        add constraint FK1584F44CAA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_REFERENCE 
        add index FK376BA454AA332609 (EMPLOYEE_ID), 
        add constraint FK376BA454AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_REWARD 
        add index FK181126A6AA332609 (EMPLOYEE_ID), 
        add constraint FK181126A6AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_SITE 
        add index FK76D62C7EAA332609 (EMPLOYEE_ID), 
        add constraint FK76D62C7EAA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);

    alter table EMP_SKILLLANGUAGE 
        add index FKDFDC2D322F738989 (MASSKILLLANGUAGE_ID), 
        add constraint FKDFDC2D322F738989 
        foreign key (MASSKILLLANGUAGE_ID) 
        references MAS_SKILLLANGUAGE (ID);

    alter table EMP_SKILLLANGUAGE 
        add index FKDFDC2D32AA332609 (EMPLOYEE_ID), 
        add constraint FKDFDC2D32AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMP_EMPLOYEE (ID);
