create table books(
    id serial primary key ,
    title varchar(200) not null ,
    author varchar(150) not null ,
    category varchar(50) not null ,
    public_year int check ( public_year > 0 ) not null,
    price numeric(10,2) check ( price > 0 ),
    stock int check ( stock >= 0 )
);

drop table books;

insert into books values (1, 'Lập trình C cơ bản', 'Nguyễn Văn Nam', 'CNTT', 2018, 95000, 20),
       (2, 'Học SQL qua ví dụ', 'Trần Thị Hạnh', 'CSDL', 2020, 125000, 12),
       (3, 'Lập trình C cơ bản', 'Nguyễn Văn Nam', 'CNTT', 2018, 95000, 20),
       (4, 'Phân tích dữ liệu với Python', 'Lê Quốc Bảo', 'CNTT', 2022, 180000, NULL),
       (5, 'Quản trị cơ sở dữ liệu', 'Nguyễn Thị Minh', 'CSDL', 2021, 150000, 5),
       (6, 'Học máy cho người mới bắt đầu', 'Nguyễn Văn Nam', 'AI', 2023, 220000, 8),
       (7, 'Khoa học dữ liệu cơ bản', 'Nguyễn Văn Nam', 'AI', 2023, 220000, NULL);

-- 2. Cập nhật giá
update books
set price = price * 1.1
where books.public_year <= 2021 and books.price < 200000;

-- 3. Xử lý lỗi nhập
update books set stock = 0 where stock is null ;
select * from books;

-- 4. Tìm kiếm tự do
select * from books where category in ('CNTT', 'AI') and price between 100000 and 250000 order by price desc , title asc ;

-- 5. Tìm kiếm tự do
select * from books where title ilike '%học%';

-- 6. Thống kê chuyên mục
select distinct category from books where public_year > 2020;

-- 7. Phân trang kết quả
select * from books limit 2 offset 1;