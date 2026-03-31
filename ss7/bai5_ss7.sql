create table customers(
    customer_id serial primary key ,
    full_name varchar(100) ,
    email varchar(100) unique ,
    city varchar(50)
);

create table products(
    product_id serial primary key ,
    product_name varchar(100) ,
    category text[] ,
    price numeric(10,2)
);

create table orders(
    order_id serial primary key ,
    customer_id int references customers(customer_id) ,
    product_id int references products(product_id) ,
    order_date date ,
    quantity int
);


-- 1.
insert into customers (full_name, email, city)
values ('Nguyen Van A', 'a.nguyen@gmail.com', 'Ha Noi'),
       ('Tran Thi B', 'b.tran@gmail.com', 'Hai Phong'),
       ('Le Van C', 'c.le@gmail.com', 'Da Nang'),
       ('Pham Thi D', 'd.pham@gmail.com', 'Ho Chi Minh'),
       ('Hoang Van E', 'e.hoang@gmail.com', 'Can Tho');

insert into products (product_name, category, price)
values ('Laptop Dell XPS', ARRAY['electronics', 'laptop'], 25000000),
       ('iPhone 15', ARRAY['electronics', 'phone'], 22000000),
       ('Samsung TV', ARRAY['electronics', 'tv'], 15000000),
       ('AirPods Pro', ARRAY['electronics', 'audio'], 5000000),
       ('Gaming Mouse', ARRAY['electronics', 'accessory'], 800000);

insert into orders (customer_id, product_id, order_date, quantity)
values (1, 1, '2026-03-01', 1),
       (2, 2, '2026-03-02', 2),
       (3, 3, '2026-03-03', 1),
       (4, 4, '2026-03-04', 3),
       (5, 5, '2026-03-05', 2),
       (1, 2, '2026-03-06', 1),
       (2, 3, '2026-03-07', 1),
       (3, 4, '2026-03-08', 2),
       (4, 5, '2026-03-09', 1),
       (5, 1, '2026-03-10', 1);

-- 2.
create index idx_email on customers(email);
create index idx_city on customers using hash (email);
create index idx_category on products using gin (category);
create index idx_price on products using gist (price);

-- 3.
-- a.
explain analyze
select *
from customers
where email = 'a.nguyen@gmail.com';

-- b.
explain analyze
select *
from products
where category @> array['electronics'];

-- c.
explain analyze
select *
from products
where price between 500000 and 1000000;

-- 4.
create index idx_order_date on orders(order_date);
cluster orders using idx_order_date;

-- 5.
-- a.
create view top_3_customers as
select
    c.full_name,
    sum(o.quantity) as total_quantity
from orders o join customers c on o.customer_id = c.customer_id
group by c.full_name
order by total_quantity desc
limit 3;
select * from top_3_customers;

-- b.
create view revenue_per_product as
select
    p.product_name,
    sum(o.quantity * p.price) as total_revenue
from orders o join products p on p.product_id = o.product_id
group by p.product_name;
select * from revenue_per_product;

-- 6.
-- a.
create view v_customer_city as
select customer_id, full_name, city from customers
with check option;

-- b.
select *
from customers
where customer_id = 1;
