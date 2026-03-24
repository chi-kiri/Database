create table students(
    id serial primary key ,
    full_name varchar(50),
    gender varchar(10),
    birth_year int,
    major varchar(20),
    gpa float
);

insert into students (full_name, gender, birth_year, major, gpa)
values ('Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
       ('Trần Thị Bích Ngọc', 'Nữ', 2001, 'Kinh tế', 3.2),
       ('Lê Quốc Cường', 'Nam', 2003, 'CNTT', 2.7),
       ('Phạm Minh Anh', 'Nữ', 2000, 'Luật', 3.9),
       ('Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
       ('Lưu Đức Tài', '2004', 2004, 'Cơ khí', Null),
       ('Võ Thị Thu Hằng', 'Nữ', 2001, 'CNTT', 3.0);

-- 1. Chèn dữ liệu mới
insert into students (full_name, gender, birth_year, major, gpa)
values ('Phan Hoàng Nam', 'Nam', 2003, 'CNTT', 3.8);

-- 2. Cập nhật dữ liệu
update students set gpa = 3.4 where full_name = 'Lê Quốc Cường';

-- 3. Xóa dữ liệu
delete from students where gpa is null ;

-- 4. Truy vấn cơ bản
select * from students where major = 'CNTT' and gpa >= 3.0 limit 3;

-- 5. Loại bỏ trùng lặp
select distinct students.major from students;

-- 6. Sắp xếp
select * from students where major = 'CNTT' order by gpa desc , full_name asc ;

-- 7. Tìm kiếm
select * from students where students.full_name like 'Nguyễn%';

-- 8. Khoảng giá trị
select * from students where birth_year between 2001 and 2003;