create database personal_finance;
use personal_finance;
-- drop database personal_finance;

create table user_system (
    id int auto_increment,
    name varchar(100),
    email varchar(120),
    password varchar(255),
    currency varchar(10),
    created_at datetime,
    updated_at datetime,
    status varchar(20),
    last_login datetime,
    constraint user_system_pk primary key(id)
);

create table category(
    id int auto_increment ,
    name varchar(100),
    type varchar(50),
    description text,
    color varchar(20),
    icon varchar(50),
    created_at datetime,
    updated_at datetime,
    status varchar(20),
    constraint category_pk primary key(id) 
);

create table account(
    id int auto_increment,
    user_id int,
    name varchar(100),
    type varchar(50),
    balance decimal(10,2),
    currency varchar(10),
    created_at datetime,
    updated_at datetime,
    status varchar(20),
    description text,
    constraint account_pk primary key(id),
    constraint account_user_system_fk foreign key (user_id) references user_system(id)

    
);

create table transaction(
    id int auto_increment,
    category_id int not null,
    type varchar(50),
    amount decimal(10,2),
    description text,
    transaction_date date,
    created_at datetime,
    updated_at datetime,
    status varchar(20),
    reference varchar(100),
    constraint transaction_pk primary key(id),
    constraint transaction_category_fk foreign key (category_id) references category(id)
);

create table budget(
    id int auto_increment,
    user_id int not null,
    category_id int not null,
    limit_amount decimal(10,2),
    month int,
    year int,
    created_at datetime,
    updated_at datetime,
    status varchar(20),
    alert_threshold decimal(10,2),
    constraint budget_pk primary key(id),
    constraint budget_user_system_fk foreign key (user_id) references user_system(id),
    constraint budget_category_fk foreign key (category_id) references category(id)
);

create table notification(
    id int auto_increment,
    message varchar(255),
    type varchar(50),
    is_read boolean default false,
    created_at datetime,
    status VARCHAR(20),
    constraint notification_pk primary key(id)
);
