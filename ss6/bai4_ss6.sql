create table OrderInfo(
    id serial primary key ,
    customer_id int ,
    order_date date ,
    total numeric(10, 2),
    status varchar(20)
);

-- 1.
insert into OrderInfo (customer_id, order_date, total, status)
values (1, '2024-01-10', 2500000, 'Completed'),
       (2, '2024-02-15', 1800000, 'Pending'),
       (3, '2024-03-05', 3200000, 'Completed'),
       (4, '2024-03-20', 1500000, 'Cancelled'),
       (5, '2024-04-01', 2750000, 'Completed');

-- 2.
select * from OrderInfo where total > 500000 ;

-- 3.
select * from OrderInfo where order_date between '2024-10-01' and '2024-10-31' ;

-- 4.
select * from OrderInfo where status <> 'Completed' ;

-- 5.
select * from OrderInfo order by order_date desc limit 2