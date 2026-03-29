create table Orders (
    id serial primary key ,
    customer_id int ,
    order_date date ,
    total_amount numeric(10, 2)
);

insert into Orders (customer_id, order_date, total_amount)
values (1, '2024-01-05', 1200000),
       (2, '2024-01-12', 2500000),
       (3, '2024-02-03', 1800000),
       (1, '2024-02-20', 3200000),
       (4, '2024-03-15', 900000),
       (5, '2024-03-28', 2100000),
       (2, '2024-04-10', 2750000);

-- 1.
select sum(Orders.total_amount) as total_revenue,
       count(*) as total_orders,
       avg(Orders.total_amount) as average_order_value
from Orders;

-- 2.
select extract(year from order_date) as year ,
       sum(Orders.total_amount) as revenue
from Orders group by extract(year from order_date);

-- 3.
select extract(year from Orders.order_date) as year,
       sum(Orders.total_amount) as revenue
from Orders group by extract(year from Orders.order_date)
having sum(Orders.total_amount) > 50000000;

-- 4.
select * from Orders order by total_amount desc limit 5
