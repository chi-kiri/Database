create schema sales;

create table sales.Products(
    product_id serial primary key ,
    product_name varchar(50) not null unique ,
    price numeric(10,2) not null ,
    stock_quantity int not null check ( stock_quantity > 0 )
);

create table sales.Oders(
    order_id serial primary key ,
    order_date date default current_date,
    member_id int,
    foreign key (member_id) references sales.Products(product_id)
);

create table sales.OrderDetails(
    order_detail_id serial primary key ,
    order_id int,
    foreign key (order_id) references sales.Oders(order_id),
    product_id int,
    foreign key (product_id) references sales.Products(product_id),
    quantity int not null
)