
    alter table ABILITY 
        drop 
        foreign key FKE33D410A264515AF;

    alter table ABILITY 
        drop 
        foreign key FKE33D410A893C27EE;

    alter table CORESKILL 
        drop 
        foreign key FK489815F2C3FB1C25;

    alter table EDUCATION 
        drop 
        foreign key FK94C37788264515AF;

    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AEA2AFAF69;

    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AE920FAD89;

    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AED9671A9;

    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AE56F7F72B;

    alter table EXPERIENCE 
        drop 
        foreign key FK17D0456AEFB7E9CD;

    alter table REFERENCE 
        drop 
        foreign key FK6EF34F2B264515AF;

    drop table if exists ABILITY;

    drop table if exists CORESKILL;

    drop table if exists DIVISION;

    drop table if exists EDUCATION;

    drop table if exists EMPLOYEE;

    drop table if exists EMPLOYMENT;

    drop table if exists EXPERIENCE;

    drop table if exists JOBLEVEL;

    drop table if exists REFERENCE;

    drop table if exists SPECIALTY;

    create table ABILITY (
        ID integer not null auto_increment unique,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        RANK integer,
        EMP_ID bigint,
        SPEC_ID integer,
        primary key (ID)
    );

    create table CORESKILL (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255),
        ISACTIVE bit,
        NAME varchar(255),
        CORESKILL_ID bigint,
        primary key (ID)
    );

    create table DIVISION (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255) not null,
        NAME varchar(255) not null,
        primary key (ID)
    );

    create table EDUCATION (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        DEGREE varchar(255) not null,
        FACULTY varchar(255) not null,
        GPA double precision not null,
        MAJOR varchar(255) not null,
        UNIVERSITY varchar(255) not null,
        EMP_ID bigint,
        primary key (ID)
    );

    create table EMPLOYEE (
        ID bigint not null auto_increment,
        AGE integer not null,
        CODE varchar(10) not null,
        DOB date not null,
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
        CORESKILL_ID integer,
        DIVISION_ID integer,
        EMPLOYMENT_ID integer,
        JOBLEVEL_ID integer,
        primary key (ID)
    );

    create table EMPLOYMENT (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        NAME varchar(200) not null,
        CODE varchar(255),
        ISACTIVE bit,
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
        EXPERIENCE_ID bigint,
        primary key (ID)
    );

    create table JOBLEVEL (
        ID integer not null auto_increment unique,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        NAME varchar(50) not null,
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

    create table SPECIALTY (
        SPEC_ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        NAME varchar(255) not null,
        primary key (SPEC_ID)
    );

    alter table ABILITY 
        add index FKE33D410A264515AF (EMP_ID), 
        add constraint FKE33D410A264515AF 
        foreign key (EMP_ID) 
        references EMPLOYEE (ID);

    alter table ABILITY 
        add index FKE33D410A893C27EE (SPEC_ID), 
        add constraint FKE33D410A893C27EE 
        foreign key (SPEC_ID) 
        references SPECIALTY (SPEC_ID);

    alter table CORESKILL 
        add index FK489815F2C3FB1C25 (CORESKILL_ID), 
        add constraint FK489815F2C3FB1C25 
        foreign key (CORESKILL_ID) 
        references EMPLOYEE (ID);

    alter table EDUCATION 
        add index FK94C37788264515AF (EMP_ID), 
        add constraint FK94C37788264515AF 
        foreign key (EMP_ID) 
        references EMPLOYEE (ID);

    alter table EMPLOYEE 
        add index FK75C8D6AEA2AFAF69 (JOBLEVEL_ID), 
        add constraint FK75C8D6AEA2AFAF69 
        foreign key (JOBLEVEL_ID) 
        references JOBLEVEL (ID);

    alter table EMPLOYEE 
        add index FK75C8D6AE920FAD89 (EMPLOYMENT_ID), 
        add constraint FK75C8D6AE920FAD89 
        foreign key (EMPLOYMENT_ID) 
        references EMPLOYMENT (ID);

    alter table EMPLOYEE 
        add index FK75C8D6AED9671A9 (DIVISION_ID), 
        add constraint FK75C8D6AED9671A9 
        foreign key (DIVISION_ID) 
        references DIVISION (ID);

    alter table EMPLOYEE 
        add index FK75C8D6AE56F7F72B (CORESKILL_ID), 
        add constraint FK75C8D6AE56F7F72B 
        foreign key (CORESKILL_ID) 
        references CORESKILL (ID);

    alter table EXPERIENCE 
        add index FK17D0456AEFB7E9CD (EXPERIENCE_ID), 
        add constraint FK17D0456AEFB7E9CD 
        foreign key (EXPERIENCE_ID) 
        references EMPLOYEE (ID);

    alter table REFERENCE 
        add index FK6EF34F2B264515AF (EMP_ID), 
        add constraint FK6EF34F2B264515AF 
        foreign key (EMP_ID) 
        references EMPLOYEE (ID);
