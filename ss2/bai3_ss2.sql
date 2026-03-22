create database SalesDB;
create schema Sales;

create table Sales.Customers(
    customer_id serial primary key ,
    first_name varchar(50) not null ,
    last_name varchar(50) not null ,
    email varchar(100) not null unique ,
    phone varchar(15)
);

create table Sales.Products(
    product_id serial primary key ,
    product_name varchar(100) not null ,
    price float not null check ( price > 0 ),
    stock_quantity int not null check ( stock_quantity > 0 )
);

create table Sales.Orders(
    order_id serial primary key ,
    customer_id int,
    foreign key (customer_id) references Sales.Customers(customer_id),
    order_date date not null
);

create table Sales.OrderItems(
    order_item_id serial primary key ,
    order_id int,
    foreign key (order_id) references Sales.Orders(order_id),
    product_id int,
    foreign key (product_id) references Sales.Products(product_id),
    quantity int not null check ( quantity >= 1 )
)