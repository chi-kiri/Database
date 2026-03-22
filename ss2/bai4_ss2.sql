create database ElearningDB;
create schema elearning;

create table elearning.students(
    student_id serial primary key ,
    first_name varchar(50) not null ,
    last_name varchar(50) not null ,
    email varchar(100) not null unique
);

create table elearning.instrutors(
    instructor_id serial primary key ,
    first_name varchar(50) not null ,
    last_name varchar(50) not null ,
    email varchar(100) not null unique
);

create table elearning.courses(
    course_id serial primary key ,
    course_name varchar(100) not null ,
    instructor_id int,
    foreign key (instructor_id) references elearning.instrutors(instructor_id)
);

create table elearning.enrollments(
    enrollment_id serial primary key ,
    student_id int,
    foreign key (student_id) references elearning.students(student_id),
    course_id int,
    foreign key (course_id) references elearning.courses(course_id),
    enroll_date date not null
);

create table elearning.assignments(
    assignment_id serial primary key ,
    course_id int,
    foreign key (course_id) references elearning.courses(course_id),
    title varchar(100) not null ,
    due_date date not null
);

create table elearning.submissions(
    submission_id serial primary key ,
    assignment_id int,
    foreign key (assignment_id) references elearning.assignments(assignment_id),
    student_id int,
    foreign key (student_id) references elearning.students(student_id),
    submission_date date not null,
    grade int check ( grade >= 0 and grade <= 100)
)