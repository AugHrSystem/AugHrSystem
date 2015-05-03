
    alter table ABILITY 
        drop 
        foreign key FKE33D410A264515AF;

    alter table ABILITY 
        drop 
        foreign key FKE33D410ACEC2720D;

    alter table ADDRESS 
        drop 
        foreign key FKE66327D4264515AF;

    alter table ADDRESS 
        drop 
        foreign key FKE66327D4A94034CA;

    alter table ADDRESS 
        drop 
        foreign key FKE66327D44B00FABD;

    alter table EDUCATION 
        drop 
        foreign key FK94C37788264515AF;

    alter table EDUCATION 
        drop 
        foreign key FK94C37788B3968484;

    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AEA2AFAF69;

    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AEFD52A74A;

    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AE391EE7AA;

    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AE78EF579B;

    alter table EMPLOYEEFAMILY 
        drop 
        foreign key FKE4F7EB92264515AF;

    alter table EXPERIENCE 
        drop 
        foreign key FK17D0456AAA332609;

    alter table LOGIN 
        drop 
        foreign key FK453F749264515AF;

    alter table MASCORESKILL 
        drop 
        foreign key FK9AE7E393AA332609;

    alter table REFERENCE 
        drop 
        foreign key FK6EF34F2B264515AF;

    alter table TECHNOLOGYEMPLOYEE 
        drop 
        foreign key FKF5CE7BBA264515AF;

    alter table TECHNOLOGYEMPLOYEE 
        drop 
        foreign key FKF5CE7BBAE5BED341;

    drop table if exists ABILITY;

    drop table if exists ADDRESS;

    drop table if exists EDUCATION;

    drop table if exists EMPLOYEE;

    drop table if exists EMPLOYEEFAMILY;

    drop table if exists EXPERIENCE;

    drop table if exists JOBLEVEL;

    drop table if exists LOGIN;

    drop table if exists MASADDRESSTYPE;

    drop table if exists MASCORESKILL;

    drop table if exists MASDEGREETYPE;

    drop table if exists MASDIVISION;

    drop table if exists MASEMPLOYMENT;

    drop table if exists MASPROVINCE;

    drop table if exists MASSPECIALTY;

    drop table if exists MASTECHNOLOGY;

    drop table if exists REFERENCE;

    drop table if exists TECHNOLOGYEMPLOYEE;

    create table ABILITY (
        ID integer not null auto_increment unique,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        RANK integer not null,
        EMP_ID bigint,
        SPEC_ID integer,
        primary key (ID)
    );

    create table ADDRESS (
        ID integer not null auto_increment,
        ADDRESS1 varchar(255),
        ADDRESS2 varchar(255),
        ZIPCODE varchar(255),
        ADDTYPE_ID integer,
        EMP_ID bigint,
        PROVINCE_ID integer,
        primary key (ID)
    );

    create table EDUCATION (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        FACULTY varchar(255) not null,
        GPA double precision not null,
        MAJOR varchar(255) not null,
        UNIVERSITY varchar(255) not null,
        EMP_ID bigint,
        DEGREE_ID integer,
        primary key (ID)
    );

    create table EMPLOYEE (
        ID bigint not null auto_increment,
        AGE integer not null,
        CODE varchar(10) not null,
        DOB datetime not null,
        GENDER varchar(255) not null,
        HEIGH integer not null,
        IDCARD integer not null,
        MILITARY varchar(255) not null,
        NAME varchar(255),
        PLACEDOB varchar(50) not null,
        QUALIFICATION varchar(255) not null,
        RELIGION varchar(20) not null,
        SALARY float not null,
        STATUS varchar(255) not null,
        TEL varchar(10) not null,
        WEIGTH integer not null,
        EMPLOYMENT_ID integer,
        JOBLEVEL_ID integer,
        DIVISION_ID integer,
        TECHNOLOGY_ID integer,
        primary key (ID)
    );

    create table EMPLOYEEFAMILY (
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
        RELATION varchar(40) not null,
        EMP_ID bigint not null,
        primary key (ID)
    );

    create table EXPERIENCE (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        ADDRESS varchar(255),
        BUSINESS varchar(255),
        COMPANY_NAME varchar(255),
        DATE_FROM datetime,
        DATE_TO datetime,
        DESCRIPTION varchar(255),
        POSITION varchar(255),
        SUPERVISOR varchar(255),
        EMPLOYEE_ID bigint,
        primary key (ID)
    );

    create table JOBLEVEL (
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
        EMP_ID bigint,
        primary key (ID)
    );

    create table MASADDRESSTYPE (
        ID integer not null auto_increment,
        CODE varchar(255) not null,
        ISACTIVE varchar(255) not null,
        NAME varchar(255) not null,
        primary key (ID)
    );

    create table MASCORESKILL (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255),
        ISACTIVE bit,
        NAME varchar(255) not null,
        EMPLOYEE_ID bigint,
        primary key (ID)
    );

    create table MASDEGREETYPE (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255) not null,
        ISACTIVE varchar(255) not null,
        NAME varchar(200) not null,
        primary key (ID)
    );

    create table MASDIVISION (
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

    create table MASEMPLOYMENT (
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

    create table MASPROVINCE (
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

    create table MASSPECIALTY (
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

    create table MASTECHNOLOGY (
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

    create table REFERENCE (
        REF_ID integer not null auto_increment,
        ADDRESS varchar(255) not null,
        NAME varchar(255) not null,
        OCCUPATION varchar(255) not null,
        TEL varchar(255) not null,
        EMP_ID bigint,
        primary key (REF_ID)
    );

    create table TECHNOLOGYEMPLOYEE (
        ID integer not null auto_increment,
        AUDITFLAG varchar(1) not null,
        CREATEDBY integer not null,
        CREATEDTIMESTAMP datetime not null,
        UPDATEDBY integer,
        UPDATEDTIMESTAMP datetime,
        EMP_ID bigint not null,
        MASTECH_ID integer not null,
        primary key (ID)
    );

    alter table ABILITY 
        add index FKE33D410A264515AF (EMP_ID), 
        add constraint FKE33D410A264515AF 
        foreign key (EMP_ID) 
        references EMPLOYEE (ID);

    alter table ABILITY 
        add index FKE33D410ACEC2720D (SPEC_ID), 
        add constraint FKE33D410ACEC2720D 
        foreign key (SPEC_ID) 
        references MASSPECIALTY (SPEC_ID);

    alter table ADDRESS 
        add index FKE66327D4264515AF (EMP_ID), 
        add constraint FKE66327D4264515AF 
        foreign key (EMP_ID) 
        references EMPLOYEE (ID);

    alter table ADDRESS 
        add index FKE66327D4A94034CA (PROVINCE_ID), 
        add constraint FKE66327D4A94034CA 
        foreign key (PROVINCE_ID) 
        references MASPROVINCE (ID);

    alter table ADDRESS 
        add index FKE66327D44B00FABD (ADDTYPE_ID), 
        add constraint FKE66327D44B00FABD 
        foreign key (ADDTYPE_ID) 
        references MASADDRESSTYPE (ID);

    alter table EDUCATION 
        add index FK94C37788264515AF (EMP_ID), 
        add constraint FK94C37788264515AF 
        foreign key (EMP_ID) 
        references EMPLOYEE (ID);

    alter table EDUCATION 
        add index FK94C37788B3968484 (DEGREE_ID), 
        add constraint FK94C37788B3968484 
        foreign key (DEGREE_ID) 
        references MASDEGREETYPE (ID);

    alter table EMPLOYEE 
        add index FK75C8D6AEA2AFAF69 (JOBLEVEL_ID), 
        add constraint FK75C8D6AEA2AFAF69 
        foreign key (JOBLEVEL_ID) 
        references JOBLEVEL (ID);

    alter table EMPLOYEE 
        add index FK75C8D6AEFD52A74A (EMPLOYMENT_ID), 
        add constraint FK75C8D6AEFD52A74A 
        foreign key (EMPLOYMENT_ID) 
        references MASEMPLOYMENT (ID);

    alter table EMPLOYEE 
        add index FK75C8D6AE391EE7AA (DIVISION_ID), 
        add constraint FK75C8D6AE391EE7AA 
        foreign key (DIVISION_ID) 
        references MASDIVISION (ID);

    alter table EMPLOYEE 
        add index FK75C8D6AE78EF579B (TECHNOLOGY_ID), 
        add constraint FK75C8D6AE78EF579B 
        foreign key (TECHNOLOGY_ID) 
        references TECHNOLOGYEMPLOYEE (ID);

    alter table EMPLOYEEFAMILY 
        add index FKE4F7EB92264515AF (EMP_ID), 
        add constraint FKE4F7EB92264515AF 
        foreign key (EMP_ID) 
        references EMPLOYEE (ID);

    alter table EXPERIENCE 
        add index FK17D0456AAA332609 (EMPLOYEE_ID), 
        add constraint FK17D0456AAA332609 
        foreign key (EMPLOYEE_ID) 
        references EMPLOYEE (ID);

    alter table LOGIN 
        add index FK453F749264515AF (EMP_ID), 
        add constraint FK453F749264515AF 
        foreign key (EMP_ID) 
        references EMPLOYEE (ID);

    alter table MASCORESKILL 
        add index FK9AE7E393AA332609 (EMPLOYEE_ID), 
        add constraint FK9AE7E393AA332609 
        foreign key (EMPLOYEE_ID) 
        references EMPLOYEE (ID);

    alter table REFERENCE 
        add index FK6EF34F2B264515AF (EMP_ID), 
        add constraint FK6EF34F2B264515AF 
        foreign key (EMP_ID) 
        references EMPLOYEE (ID);

    alter table TECHNOLOGYEMPLOYEE 
        add index FKF5CE7BBA264515AF (EMP_ID), 
        add constraint FKF5CE7BBA264515AF 
        foreign key (EMP_ID) 
        references EMPLOYEE (ID);

    alter table TECHNOLOGYEMPLOYEE 
        add index FKF5CE7BBAE5BED341 (MASTECH_ID), 
        add constraint FKF5CE7BBAE5BED341 
        foreign key (MASTECH_ID) 
        references MASTECHNOLOGY (ID);
