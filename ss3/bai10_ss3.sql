create database CompanyDB;
create schema company

create table company.Departments(
    department_id serial primary key ,
    department_name varchar(50) not null unique
);

create table company.Employees(
    emp_id serial primary key ,
    name varchar(50) not null ,
    dob date not null ,
    department_id int,
    foreign key (department_id) references company.Departments(department_id)
);

create table company.Projects(
    project_id serial primary key ,
    project_name varchar(100) unique not null ,
    start_date date not null ,
    end_date date not null
);

create table company.EmployeeProjects(
    emp_id int,
    project_id int,
    foreign key (emp_id) references company.Employees(emp_id),
    foreign key (project_id) references company.Projects(project_id)
)