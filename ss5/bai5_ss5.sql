create schema Students_enroll;

create table Students_enroll.students(
    student_id serial primary key ,
    full_name varchar(100) ,
    major varchar(50)
);

create table Students_enroll.courses(
    course_id serial primary key ,
    course_name varchar(100) ,
    credit int
);

create table Students_enroll.enrollments(
    student_id int references Students_enroll.students(student_id),
    course_id int references Students_enroll.courses(course_id),
    score numeric(5,2)
);

insert into Students_enroll.students (student_id, full_name, major)
values (001, 'A', 'CNTT'),
       (002, 'B', 'CNTT'),
       (003, 'C', 'KHMT'),
       (004, 'D', 'KHMT'),
       (005, 'E', 'KT'),
       (006, 'F', 'KT');

insert into Students_enroll.courses(course_id, course_name, credit)
values (101, 'G', 1),
       (102, 'H', 3),
       (103, 'I', 2),
       (104,'J', 3),
       (105, 'K', 2);

insert into Students_enroll.enrollments (student_id, course_id, score)
values (001, 101, 6),
       (001, 105, 8),
       (002, 102, 7),
       (002, 103, 8),
       (003, 101, 8),
       (003, 104, 5),
       (004, 102, 9),
       (004, 105, 9.5),
       (005, 103, 7),
       (005, 104, 5),
       (006, 105, 8),
       (006, 101, 7);

-- 1.
select s.full_name as "Tên sinh viên", c.course_name as "Môn học", e.score as "Điểm"
from Students_enroll.students s join students_enroll.enrollments e on s.student_id = e.student_id
    join Students_enroll.courses c on e.course_id = c.course_id;

-- 2.
select e.student_id, avg(e.score) as "avg_score", min(e.score) as "min_score", max(e.score) as "max_score"
from Students_enroll.enrollments e
group by e.student_id;

-- 3.
select
    from Students_enroll.students s join students_enroll.enrollments e on s.student_id = e.student_id
group by s.major
having avg(e.score) > 7.5;

-- 4.
select s.student_id, s.full_name, c.course_name , c.credit, e.score
from Students_enroll.students s
         join students_enroll.enrollments e on s.student_id = e.student_id
         join students_enroll.courses c on e.course_id = c.course_id;

-- 5.
select s.student_id, s.full_name, avg(e.score) as "Điểm trung bình"
 from Students_enroll.students s join students_enroll.enrollments e on s.student_id = e.student_id
group by s.student_id
having avg(e.score) >
       (select avg(e.score) from Students_enroll.enrollments e);
