create table departments (
    dept_id serial primary key ,
    dept_name varchar(100)
);

create table employees (
    emp_id serial primary key ,
    emp_name varchar(100),
    dept_id int references departments(dept_id),
    salery numeric(10,2),
    hire_date date
);

create table projects (
    project_id serial primary key ,
    project_name varchar(100),
    dept_id int references departments(dept_id)
);

insert into departments (dept_id, dept_name)
values (1, 'IT'),
       (2, 'HR'),
       (3,'BA'),
       (4, 'AI'),
       (5, 'AC');

insert into employees (emp_id, emp_name, dept_id, salery, hire_date)
values (001, 'A', 1, 10000000, '2020-04-21'),
       (013, 'B', 3, 15000000, '2018-03-19'),
       (202, 'C', 2, 9000000, '2022-09-18'),
       (108, 'D', 1, 8000000, '2022-09-30'),
       (305, 'E', 4, 13000000, '2022-01-21'),
       (205, 'F', 5, 7000000, '2021-05-11'),
       (003, 'G', 5, 9000000, '2020-04-14'),
       (314, 'L', 2, 8000000, '2023-06-27'),
       (476, 'M', 3, 5000000, '2025-12-20'),
       (214, 'N', 4, 6000000, '2025-07-13');

insert into projects (project_id, project_name, dept_id)
values (006, 'Project I', 1),
       (007, 'Project J', 3),
       (008, 'Project K', 4);

-- 1.
select e.emp_name, e.dept_id, e.salery from employees e;

-- 2.
select sum(e.salery) as "total_salery", avg(e.salery) as "average_salery", max(e.salery) as "max_salery", min(e.salery) as "min_salery", count(*) as "total_empl"
from employees e;

-- 3.
select e.dept_id, avg(e.salery) as "avg_sal"
from employees e
group by e.dept_id
having avg(e.salery) > 15000000;

-- 4.
select p.project_name, d.dept_name, e.emp_id, e.emp_name
    from projects p join departments d on p.dept_id = d.dept_id
join employees e on d.dept_id = e.dept_id;

-- 5.
select e.*
from employees e
where (e.dept_id, e.salery) in
    (select e.dept_id, max(e.salery)
    from employees e
    group by e.dept_id)

