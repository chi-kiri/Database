create table Employee(
    id serial primary key ,
    full_name varchar(100) ,
    department varchar(50) ,
    salary numeric(10, 2),
    hire_date date
);

-- 1.
insert into Employee (full_name, department, salary, hire_date)
values ('Nguyễn Văn An', 'IT', 15000000, '2022-03-15'),
       ('Trần Thị Bình', 'HR', 12000000, '2021-07-10'),
       ('Lê Minh Cường', 'Finance', 18000000, '2020-11-25'),
       ('Phạm Thu Dung', 'Marketing', 14000000, '2023-01-05'),
       ('Hoàng Văn Em', 'IT', 16000000, '2022-09-18'),
       ('Vũ Thị Hoa', 'Sales', 13000000, '2021-05-30');

-- 2.
update Employee set salary = salary*1.1 where department = 'IT';

-- 3.
delete from Employee where salary < 6000000;

-- 4.
select * from Employee where full_name ilike '%an%';

-- 5.
select * from Employee where hire_date between '2023-01-01' and '2023-12-31'