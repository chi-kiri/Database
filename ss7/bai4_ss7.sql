create table customer (
    customer_id serial primary key,
    full_name varchar(100),
    region varchar(50)
);

create table orders (
    order_id serial primary key,
    customer_id int references customer(customer_id),
    total_amount decimal(10,2),
    order_date date,
    status varchar(20)
);

create table product (
    product_id serial primary key,
    name varchar(100),
    price decimal(10,2),
    category varchar(50)
);

create table order_detail (
    order_id int references orders(order_id),
    product_id int references product(product_id),
    quantity int
);

insert into customer (full_name, region)
values ('nguyen van a', 'ha noi'),
       ('tran thi b', 'ho chi minh'),
       ('le van c', 'da nang'),
       ('pham thi d', 'can tho'),
       ('hoang van e', 'hai phong');

insert into product (name, price, category)
values ('laptop dell', 15000000, 'electronics'),
       ('iphone 13', 20000000, 'electronics'),
       ('ban phim co', 1500000, 'accessories'),
       ('chuot logitech', 500000, 'accessories'),
       ('man hinh samsung', 4000000, 'electronics');

insert into orders (customer_id, total_amount, order_date, status)
values (1, 15500000, '2024-01-10', 'completed'),
       (2, 20000000, '2024-02-15', 'completed'),
       (3, 4500000, '2024-03-20', 'pending'),
       (1, 500000, '2024-03-25', 'completed'),
       (4, 4000000, '2024-04-01', 'cancelled'),
       (5, 1500000, '2024-04-05', 'completed');

insert into order_detail (order_id, product_id, quantity)
values (1, 1, 1),
       (1, 3, 1),
       (2, 2, 1),
       (3, 5, 1),
       (4, 4, 1),
       (5, 5, 1),
       (6, 3, 1);

-- 1.
create view v_revenue_by_region as
select c.region, sum(o.total_amount) as total_revenue
from customer c
         join orders o on c.customer_id = o.customer_id
group by c.region;
-- a.
select *
from v_revenue_by_region
order by total_revenue desc
limit 3;

-- 2.
create view v_revenue_above_avg as
select *
from v_revenue_by_region
where total_revenue > (
    select avg(total_revenue)
    from v_revenue_by_region
);
