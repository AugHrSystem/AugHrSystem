
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

    alter table EMP_SKILLLANGUAGE 
        drop 
        foreign key FKDFDC2D322F738989;

    alter table EMP_SKILLLANGUAGE 
        drop 
        foreign key FKDFDC2D32AA332609;

    alter table LOGIN 
        drop 
        foreign key FK453F749264515AF;

    drop table if exists EMP_ABILITY;

    drop table if exists EMP_ADDRESS;

    drop table if exists EMP_EDUCATION;

    drop table if exists EMP_EMPLOYEE;

    drop table if exists EMP_EMPLOYEEFAMILY;

    drop table if exists EMP_EXPERIENCE;

    drop table if exists EMP_HISTORY;

    drop table if exists EMP_OFFICIAL;

    drop table if exists EMP_PROBATION;

    drop table if exists EMP_PUNISH;

    drop table if exists EMP_REFERENCE;

    drop table if exists EMP_REWARD;

    drop table if exists EMP_SKILLLANGUAGE;

    drop table if exists LOGIN;

    drop table if exists MAS_ADDRESSTYPE;

    drop table if exists MAS_CORESKILL;

    drop table if exists MAS_DEGREETYPE;

    drop table if exists MAS_DIVISION;

    drop table if exists MAS_EMPLOYMENT;

    drop table if exists MAS_JOBLEVEL;

    drop table if exists MAS_LOCATION;

    drop table if exists MAS_PROVINCE;

    drop table if exists MAS_RELATIONTYPE;

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
        ZIPCODE varchar(255),
        ADDRESSTYPE_ID integer,
        EMPLOYEE_ID integer,
        PROVINCE_ID integer,
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
        EXPIRY_DATE datetime,
        FACULTY varchar(255) not null,
        GPA double precision not null,
        MAJOR varchar(255) not null,
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
        DATEOFBIRTH datetime not null,
        DATE_TO_BE_DRAFTED datetime,
        DESCRIPTION_FRIEND varchar(255),
        DESCRIPTION_MAGAZINE varchar(255),
        DESCRIPTION_NEWSPAPER varchar(255),
        DESCRIPTION_OTHER varchar(255),
        DESCRIPTION_WEBSITE varchar(255),
        DESCRIPTION_YES varchar(255),
        EMERGENCY_CONTACT varchar(255) not null,
        EMERGENCY_CONTACT_ADDRESS varchar(255),
        EMERGENCY_CONTACT_PHONE_NUMBER varchar(255) not null,
        EMPLOYEE_CODE varchar(255) not null,
        EXPIRY_DATE datetime,
        FROM_YEAR datetime,
        HEIGHT integer,
        ID_CARD integer not null,
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
        primary key (ID)
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
        name varchar(255),
        OCCUPATION varchar(255),
        POSITION varchar(255),
        relationName varchar(255),
        status varchar(255),
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
        ADJUSTMENT_TIME integer,
        DATE_OF_ADJUSTMENT datetime,
        OLD_SALARY double precision,
        POSITION varchar(255),
        REASON_OF_ADJUSTMENT varchar(255),
        SALARY double precision,
        EMPLOYEE_ID integer not null,
        primary key (ID)
    );

    create table EMP_OFFICIAL (
        ID integer not null auto_increment,
        DATE datetime,
        POSITION_APPLIED_FOR varchar(255),
        SALARY_EXPECTED double precision,
        primary key (ID)
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
        DATE datetime,
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
        EMPLOYEE_ID integer,
        primary key (ID)
    );

    create table EMP_REWARD (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        DETAILREWARD varchar(255),
        ISACTIVE bit,
        NAME varchar(255) not null,
        YEAR varchar(255) not null,
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
        LISTENINGSKILL varchar(255) not null,
        READINGSKILL varchar(255) not null,
        SPEAKINGSKILL varchar(255) not null,
        UDERSTANDINDSKILL varchar(255) not null,
        EMPLOYEE_ID integer not null,
        MASSKILLLANGUAGE_ID integer not null,
        primary key (ID)
    );

    create table LOGIN (
        ID integer not null auto_increment,
        AUDITFLAG varchar(1) not null,
        CODE varchar(10) not null,
        CREATEDBY integer not null,
        CREATEDTIMESTAMP datetime not null,
        ISACTIVE bit not null,
        UPDATEDBY integer,
        UPDATEDTIMESTAMP datetime,
        PASSWORD varchar(13) not null,
        USERNAME varchar(255) not null,
        EMP_ID integer,
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
        NAME varchar(255) not null,
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
        NAME varchar(255) not null,
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

    create table MAS_SKILLLANGUAGE (
        ID integer not null auto_increment,
        AUDITFLAG varchar(1) not null,
        CODE varchar(10) not null,
        CREATEDBY integer not null,
        CREATEDTIMESTAMP datetime not null,
        ISACTIVE bit not null,
        UPDATEDBY integer,
        UPDATEDTIMESTAMP datetime,
        SKILLLANGUAGE varchar(255),
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

    alter table EMP_EDUCATION 
        add index FK5D3BCCB1E915F90A (DEGREETYPE_ID), 
        add constraint FK5D3BCCB1E915F90A 
        foreign key (DEGREETYPE_ID) 
        references MAS_DEGREETYPE (ID);

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

    alter table LOGIN 
        add index FK453F749264515AF (EMP_ID), 
        add constraint FK453F749264515AF 
        foreign key (EMP_ID) 
        references EMP_EMPLOYEE (ID);
