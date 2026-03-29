create table Course(
    id serial primary key ,
    title varchar(100) ,
    instructor varchar(50) ,
    price numeric(10 ,2) ,
    duration int
);

-- 1.
insert into Course (title, instructor, price, duration)
values ('Python Cơ Bản', 'Nguyễn Văn A', 500000, 30),
       ('SQL Cho Người Mới', 'Trần Thị B', 400000, 25),
       ('Machine Learning Cơ Bản', 'Lê Minh C', 1200000, 45),
       ('Deep Learning Nâng Cao', 'Phạm Thu D', 1500000, 60),
       ('Lập Trình Web với Django', 'Hoàng Văn E', 900000, 40),
       ('Phân Tích Dữ Liệu với Pandas', 'Vũ Thị F', 800000, 35);

-- 2.
update Course set price = price*1.15 where duration > 30;

-- 3.
delete from Course where title ilike '%demo%';

-- 4.
select * from Course where title ilike '%sql%';

-- 5.
select * from Course where Course.price between 500000 and 2000000 order by Course.price desc limit 3;