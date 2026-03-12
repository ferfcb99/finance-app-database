create database personal_finance;
use personal_finance;
drop database personal_finance;

create table user_system (
    id int auto_increment primary key,
    name varchar(100),
    email varchar(120),
    password varchar(255),
    currency varchar(10),
    created_at datetime,
    updated_at datetime,
    status varchar(20),
    last_login datetime
);

create table category(
    id int auto_increment primary key,
    name varchar(100),
    type varchar(50),
    description text,
    color varchar(20),
    icon varchar(50),
    created_at datetime,
    updated_at datetime,
    status varchar(20)
);

create table account(
    id int auto_increment primary key,
    user_id int,
    name varchar(100),
    type varchar(50),
    balance decimal(10,2),
    currency varchar(10),
    created_at datetime,
    updated_at datetime,
    status varchar(20),
    description text,
    
    foreign key (user_id) references user_system(id)
);

create table transaction(
    id int auto_increment primary key,
    category_id int not null,
    type varchar(50),
    amount decimal(10,2),
    description text,
    transaction_date date,
    created_at datetime,
    updated_at datetime,
    status varchar(20),
    reference varchar(100),

    foreign key (category_id) references category(id)
);

create table budget(
    id int auto_increment primary key,
    user_id int not null,
    category_id int not null,
    limit_amount decimal(10,2),
    month int,
    year int,
    created_at datetime,
    updated_at datetime,
    status varchar(20),
    alert_threshold decimal(10,2),

    foreign key (user_id) references user_system(id),
    foreign key (category_id) references category(id)
);

create table notification(
    id int auto_increment primary key,
    message varchar(255),
    type varchar(50),
    is_read boolean default false,
    created_at datetime,
    status VARCHAR(20)
);


