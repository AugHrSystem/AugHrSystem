
    alter table EDUCATION 
        drop 
        foreign key FK94C37788264515AF;

    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AEA93422D5;

    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AE9137778B;

    drop table if exists EDUCATION;

    drop table if exists EMPLOYEE;

    drop table if exists coreSkill;

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
        coreSkill integer,
        EDUCATION_ID integer,
        primary key (ID)
    );

    create table coreSkill (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        CODE varchar(255),
        isActive bit,
        NAME varchar(255),
        primary key (ID)
    );

    alter table EDUCATION 
        add index FK94C37788264515AF (EMP_ID), 
        add constraint FK94C37788264515AF 
        foreign key (EMP_ID) 
        references EMPLOYEE (ID);

    alter table EMPLOYEE 
        add index FK75C8D6AEA93422D5 (coreSkill), 
        add constraint FK75C8D6AEA93422D5 
        foreign key (coreSkill) 
        references coreSkill (ID);

    alter table EMPLOYEE 
        add index FK75C8D6AE9137778B (EDUCATION_ID), 
        add constraint FK75C8D6AE9137778B 
        foreign key (EDUCATION_ID) 
        references EDUCATION (ID);
