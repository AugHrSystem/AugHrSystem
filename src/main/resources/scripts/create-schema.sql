
    alter table EMPLOYEE 
        drop 
        foreign key FK75C8D6AE8A823EE9;

    drop table if exists EDUCATION;

    drop table if exists EMPLOYEE;

    create table EDUCATION (
        ID bigint not null auto_increment,
        UNIVERSITY varchar(255),
        primary key (ID)
    );

    create table EMPLOYEE (
        ID bigint not null auto_increment,
        NAME varchar(255),
        EDUCATION_ID bigint,
        primary key (ID)
    );

    alter table EMPLOYEE 
        add index FK75C8D6AE8A823EE9 (EDUCATION_ID), 
        add constraint FK75C8D6AE8A823EE9 
        foreign key (EDUCATION_ID) 
        references EDUCATION (ID);
