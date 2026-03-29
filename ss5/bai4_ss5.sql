create schema shop;

create table shop.customers(
    customer_id serial primary key ,
    customer_name varchar(100) ,
    city varchar(50)
);

create table shop.orders(
    order_id serial primary key ,
    customer_id int references shop.customers(customer_id),
    order_date date,
    total_amount numeric(10, 2)
);

create table shop.order_item (
    item_id serial primary key ,
    order_id int references shop.orders(order_id),
    product_name varchar(100),
    quantity int,
    price numeric(10,2)
);

insert into shop.customers (customer_name, city)
values ('Nguyễn Văn A', 'Hà Nội'),
       ('Trần Thị B', 'Hồ Chí Minh'),
       ('Lê Văn C', 'Đà Nẵng');

insert into shop.orders (customer_id, order_date, total_amount)
values (1, '2026-03-20', 500000),
       (2, '2026-03-21', 1200000),
       (1, '2026-03-22', 300000),
       (3, '2026-03-23', 800000);

insert into shop.order_item (order_id, product_name, quantity, price)
values (1, 'Laptop', 1, 500000),
       (2, 'Điện thoại', 2, 600000),
       (3, 'Chuột', 2, 150000),
       (4, 'Bàn phím', 1, 800000),
       (2, 'Tai nghe', 1, 200000);

-- 1.
select c.customer_name as "Tên khách",
       o.order_date as "Ngày đặt hàng",
       o.total_amount as "Tổng tiền"
from shop.customers c join shop.orders o on c.customer_id = o.customer_id;

-- 2.
select sum(total_amount) as "Tổng doanh thu",
       avg(total_amount) as "Trung bình giá trị đơn hàng" ,
       max(total_amount) as "Đơn hàng lớn nhất" ,
       min(total_amount) as "Đơn hàng nhỏ nhất" ,
       count(*) as "Số lượng đơn hàng"
from shop.orders ;

-- 3.
select c.city, sum(o.total_amount) as total_revenue
from shop.customers c join shop.orders o on c.customer_id = o.customer_id
group by c.city having sum(total_amount) > 10000;

-- 4.
select c.customer_name, o.order_date, oi.product_name, oi.quantity, oi.price
from shop.customers c join shop.orders o on c.customer_id = o.customer_id
    join shop.order_item oi on o.order_id = oi.order_id;

-- 5.
select c.customer_id, c.customer_name
from shop.customers c join shop.orders o on c.customer_id = o.customer_id
group by c.customer_id
having sum(o.total_amount) = (select max(total_spent)
                              from (
                                  select sum(total_amount) as "total_spent"
                                  from shop.orders
                                  group by c.customer_id
                                   ));