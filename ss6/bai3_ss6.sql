create table Customer(
    id serial primary key ,
    name varchar(100) ,
    email varchar(100) ,
    phone varchar(20) ,
    points int
);

-- 1.
insert into Customer (name, email, phone, points)
values ('Nguyễn Văn An', 'an.nguyen@gmail.com', '0901234567', 120),
       ('Trần Thị Bình', 'binh.tran@gmail.com', '0912345678', 200),
       ('Lê Minh Cường', 'cuong.le@gmail.com', '0923456789', 150),
       ('Phạm Thu Dung', 'dung.pham@gmail.com', '0934567890', 180),
       ('Hoàng Văn Em', NULL, '0945678901', 90), -- không có email
       ('Vũ Thị Hoa', 'hoa.vu@gmail.com', '0956789012', 220),
       ('Đỗ Anh Khoa', 'khoa.do@gmail.com', '0967890123', 160);

-- 2.
select distinct Customer.name from Customer;

-- 3.
select * from Customer where email is null ;

-- 4.
select * from Customer order by points desc offset 1 limit 3;

-- 5.
select * from Customer order by name desc