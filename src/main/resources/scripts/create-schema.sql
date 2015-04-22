
    alter table CORESKILL 
        drop 
        foreign key FK489815F2C3FB1C25;

    alter table EDUCATION 
        drop 
        foreign key FK94C37788264515AF;

    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AE9137778B;

    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AECFD0D4C9;

    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AE56F7F72B;

    alter table EMPLOYEEFAMILY 
        drop 
        foreign key FKE4F7EB92264515AF;

    alter table EXPERIENCE 
        drop 
        foreign key FK17D0456AEFB7E9CD;

    alter table LOGIN 
        drop 
        foreign key FK453F749264515AF;

    alter table TECHNOLOGYEMPLOYEE 
        drop 
        foreign key FKF5CE7BBA264515AF;

    alter table TECHNOLOGYEMPLOYEE 
        drop 
        foreign key FKF5CE7BBAE5BED341;

    drop table if exists CORESKILL;

    drop table if exists EDUCATION;

    drop table if exists EMPLOYEE;

    drop table if exists EMPLOYEEFAMILY;

    drop table if exists EXPERIENCE;

    drop table if exists LOGIN;

    drop table if exists MASTECHNOLOGY;

    drop table if exists TECHNOLOGYEMPLOYEE;

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
        NAME varchar(255),
        CORESKILL_ID integer,
        EDUCATION_ID integer,
        EXPERIENCE_ID integer,
        primary key (ID)
    );

    create table EMPLOYEEFAMILY (
        ID integer not null auto_increment,
        auditFlag varchar(1) not null,
        createdBy integer not null,
        createdTimeStamp datetime not null,
        updatedBy integer,
        updatedTimeStamp datetime,
        ADDRESS varchar(255) not null,
        AGE integer not null,
        FIRSTNAME varchar(50) not null,
        GENDER varchar(10) not null,
        LASTNAME varchar(50) not null,
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
        EXPERIENCE_ID bigint,
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

    create table TECHNOLOGYEMPLOYEE (
        ID integer not null auto_increment,
        auditFlag varchar(1) not null,
        createdBy integer not null,
        createdTimeStamp datetime not null,
        updatedBy integer,
        updatedTimeStamp datetime,
        EMP_ID bigint not null,
        MASTECH_ID integer not null,
        primary key (ID)
    );

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
        add index FK75C8D6AE9137778B (EDUCATION_ID), 
        add constraint FK75C8D6AE9137778B 
        foreign key (EDUCATION_ID) 
        references EDUCATION (ID);

    alter table EMPLOYEE 
        add index FK75C8D6AECFD0D4C9 (EXPERIENCE_ID), 
        add constraint FK75C8D6AECFD0D4C9 
        foreign key (EXPERIENCE_ID) 
        references EXPERIENCE (ID);

    alter table EMPLOYEE 
        add index FK75C8D6AE56F7F72B (CORESKILL_ID), 
        add constraint FK75C8D6AE56F7F72B 
        foreign key (CORESKILL_ID) 
        references CORESKILL (ID);

    alter table EMPLOYEEFAMILY 
        add index FKE4F7EB92264515AF (EMP_ID), 
        add constraint FKE4F7EB92264515AF 
        foreign key (EMP_ID) 
        references EMPLOYEE (ID);

    alter table EXPERIENCE 
        add index FK17D0456AEFB7E9CD (EXPERIENCE_ID), 
        add constraint FK17D0456AEFB7E9CD 
        foreign key (EXPERIENCE_ID) 
        references EMPLOYEE (ID);

    alter table LOGIN 
        add index FK453F749264515AF (EMP_ID), 
        add constraint FK453F749264515AF 
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
