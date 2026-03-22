create database SchoolDB;

create table Students(
    student_id serial primary key ,
    name varchar(50) not null ,
    dob date not null
);

create table Courses (
    course_id serial primary key ,
    course_name varchar(100) unique not null ,
    credit int check ( credit > 0 )
);

create table Enrollments(
    enrollment_id serial primary key ,
    student_id int,
    foreign key (student_id) references Students(student_id),
    course_id int,
    foreign key (course_id) references Courses(course_id),
    grade varchar(1) check ( grade in ('A', 'B', 'C', 'D', 'F') )
)