create table Product(
    id serial primary key ,
    name varchar(100) ,
    category varchar(50) ,
    price numeric (10, 2) ,
    stock int
);

-- 1.
insert into Product (name, category, price, stock)
values ('Laptop Dell Inspiron', 'Laptop', 15000000, 10),
       ('iPhone 13', 'Smartphone', 18000000, 15),
       ('Samsung Galaxy S22', 'Smartphone', 17000000, 12),
       ('Tai nghe Sony WH-1000XM4', 'Accessory', 7000000, 20),
       ('Chuột Logitech G Pro', 'Accessory', 1500000, 25);

-- 2.
select * from Product;

-- 3.
select * from Product order by price desc limit 3;

-- 4.
select * from Product where category = 'Điện tử' and price < 10000000;

-- 5.
select * from Product order by stock asc