create table customers (
    customer_id int primary key,
    customer_name varchar(100),
    city varchar(100)
);

create table orders (
    order_id int primary key,
    customer_id int,
    order_date date,
    total_price int,
    foreign key (customer_id) references customers(customer_id)
);

create table order_items (
    item_id int primary key,
    order_id int,
    product_id int,
    quantity int,
    price int,
    foreign key (order_id) references orders(order_id)
);

insert into customers (customer_id, customer_name, city)
values (1, 'Nguyễn Văn A', 'Hà Nội'),
       (2, 'Trần Thị B', 'Đà Nẵng'),
       (3, 'Lê Văn C', 'Hồ Chí Minh'),
       (4, 'Phạm Thị D', 'Hà Nội');


insert into orders (order_id, customer_id, order_date, total_price)
values (101, 1, '2024-12-20', 3000),
       (102, 2, '2025-01-05', 1500),
       (103, 1, '2025-02-10', 2500),
       (104, 3, '2025-02-15', 4000),
       (105, 4, '2025-03-01', 800);

insert into order_items (item_id, order_id, product_id, quantity, price)
values (1, 101, 1, 2, 1500),
       (2, 102, 2, 1, 1500),
       (3, 103, 3, 5, 500),
       (4, 104, 2, 4, 1000);

-- 1.
select c.customer_id,
       c.customer_name,
       sum(o.total_price) as total_revenue,
       count(o.order_id) as order_count
from customers c join orders o on c.customer_id = o.customer_id
group by c.customer_id
having sum(o.total_price) > 2000;

-- 2.
select c.customer_id, c.customer_name, sum(o.total_amount) as total_revenue
from customers c join shop.orders o on c.customer_id = o.customer_id
group by c.customer_id
having sum(o.total_amount) > (select avg(customer_revenue)
                              from (select sum(total_price) as customer_revenue from orders group by customer_id));

-- 3.
select c.city, sum(o.total_price) as total_revenue
from customers c join orders o on c.customer_id = o.customer_id
group by c.city
having sum(o.total_price) = (select max(city_revenue)
                             from (select sum(o2.total_price) as city_revenue
                                   from customers c2 join orders o2 on c2.customer_id = o2.customer_id
                                   group by c2.city)
                            );

-- 4.
select c.customer_name, c.city, sum(oi.quantity) as total_products, sum(oi.quantity * oi.price) as total_spent
from customers c inner join orders o on c.customer_id = o.customer_id
    inner join order_items oi on o.order_id = oi.order_id
group by c.customer_name, c.city;