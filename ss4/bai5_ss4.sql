create table employees (
    id serial primary key ,
    full_name varchar(100),
    department varchar(50),
    position varchar(50),
    salary numeric(10, 2),
    bonus numeric(10, 2),
    join_year int
);

insert into employees (id, full_name, department, position, salary, bonus, join_year)
values (1, 'Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
       (2, 'Trần Thị Mai', 'HR', 'Recruiter', 12000000, NULL, 2020),
       (3, 'Lê Quốc Trung', 'IT', 'Tester', 15000000, 800000, 2023),
       (4, 'Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
       (5, 'Phạm Ngọc Hân', 'Finance', 'Accountant', 14000000, NULL, 2019),
       (6, 'Bùi Thị Lan', 'HR', 'HR Manager', 20000000, 3000000, 2018),
       (7, 'Đặng Hữu Tài', 'IT', 'Developer', 17000000, NULL, 2022);

-- 2.
update employees set salary = salary *1.1 where employees.department = 'IT' and employees.salary < 18000000;
UPDATE employees SET bonus = 500000 WHERE bonus IS NULL;

-- 3.
select * from employees e where e.department in ('IT', 'HR') and e.join_year > 2020 and (e.salary + e.bonus) > 15000000;
select * from employees e order by (e.salary + e.bonus) desc;

-- 4.
select * from employees e where e.full_name like 'Nguyễn%' or e.full_name like '%Hân';

-- 5.
select distinct e.department from  employees e where e.bonus is not null;

-- 6.
select * from employees e where e.join_year between 2019 and 2022;