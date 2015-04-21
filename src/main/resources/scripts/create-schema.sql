
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

    alter table EXPERIENCE 
        drop 
        foreign key FK17D0456AEFB7E9CD;

    drop table if exists CORESKILL;

    drop table if exists EDUCATION;

    drop table if exists EMPLOYEE;

    drop table if exists EXPERIENCE;

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

    alter table EXPERIENCE 
        add index FK17D0456AEFB7E9CD (EXPERIENCE_ID), 
        add constraint FK17D0456AEFB7E9CD 
        foreign key (EXPERIENCE_ID) 
        references EMPLOYEE (ID);
