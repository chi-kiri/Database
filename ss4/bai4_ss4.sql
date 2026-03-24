create table products(
    id serial primary key ,
    name varchar(100) ,
    category varchar(100) ,
    price numeric(10, 2) ,
    stock int ,
    manufacturer varchar(50)
);

insert into products (name, category, price, stock, manufacturer)
values ('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
       ('Chuột Logitech M90', 'Phụ kiện', 150000, 50, 'Logitech'),
       ('Bàn phím cơ Razer', 'Phụ kiện', 2200000, 0, 'Razer'),
       ('Macbook Air M2', 'Laptop', 32000000, 7, 'Apple'),
       ('iPhone 14 Pro Max', 'Điện thoại', 35000000, 15, 'Apple'),
       ('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
       ('Tai nghe AirPods 3', 'Phụ kiện', 4500000, Null, 'Apple');

-- 1. Chèn dữ liệu mới
insert into products (name, category, price, stock, manufacturer)
values ('Chuột không dây Logitech M170', 'Phụ kiện', 300000, 20, 'Logitech');

-- 2. Cập nhật dữ liệu
update products set price = price*1.1 where products.manufacturer = 'Apple';

-- 3. Xóa dữ liệu
delete from products where stock = 0;

-- 4. Lọc theo điều kiện
select * from products where products.price between 1000000 and 30000000;

-- 5. Lọc giá trị NULL
select * from products where products.stock is null ;

-- 6. Loại bỏ trùng
select distinct p.manufacturer from products p;

-- 7. Sắp xếp dữ liệu
select * from products p order by price desc, name asc ;

-- 8. Tìm kiếm (LIKE và ILIKE)
select * from products p where p.category ilike '%laptop%';

-- 9. Giới hạn kết quả
select * from products p order by p.price desc limit 2;