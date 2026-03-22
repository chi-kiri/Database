create database LibraryDB;
create schema library;

create table library.books(
    book_id serial primary key ,
    title varchar(500) not null ,
    author varchar(100) not null unique ,
    public_year int not null ,
    available boolean default True
);

create table library.members(
    member_id serial primary key ,
    name varchar(50) not null ,
    email varchar(50) unique not null ,
    join_date date default current_date
)