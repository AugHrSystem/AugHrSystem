
    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AE9137778B;

    alter table Education 
        drop 
        foreign key FK661D8788264515AF;

    drop table if exists EMPLOYEE;

    drop table if exists Education;

    create table EMPLOYEE (
        ID bigint not null auto_increment,
        NAME varchar(255),
        EDUCATION_ID integer,
        primary key (ID)
    );

    create table Education (
        ID integer not null auto_increment,
        auditFlag varchar(255),
        createdBy integer,
        createdTimeStamp datetime,
        updatedBy integer,
        updatedTimeStamp datetime,
        DEGREE varchar(255) not null,
        FACULTY varchar(255) not null,
        GPA varchar(255) not null,
        MAJOR varchar(255) not null,
        UNIVERSITY varchar(255) not null,
        EMP_ID bigint,
        primary key (ID)
    );

    alter table EMPLOYEE 
        add index FK75C8D6AE9137778B (EDUCATION_ID), 
        add constraint FK75C8D6AE9137778B 
        foreign key (EDUCATION_ID) 
        references Education (ID);

    alter table Education 
        add index FK661D8788264515AF (EMP_ID), 
        add constraint FK661D8788264515AF 
        foreign key (EMP_ID) 
        references EMPLOYEE (ID);
