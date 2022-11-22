create schema system;
use system;

create table customer(
    customer_id int not null,
    customer_name varchar(100),
    city varchar(100),

    primary key(customer_id)

);

create table `order`(
    order_id int not null,
    order_date datetime,
    customer_id int not null,

    primary key(order_id)

);

create table order_item(
    order_id int not null,
    item_id int not null,
    quantity int,

    primary key(order_id,item_id)
);

create table item(
    item_id int not null,
    unit_price decimal(10,2),

    primary key(item_id)

);

create table shipment(
    order_id int not null,
    warehouse_id int not null,
    ship_date datetime,

    primary key(order_id,warehouse_id)

);

create table warehouse(
    warehouse_id int not null,
    warehouse_city varchar(100),

    primary key(warehouse_id)
);

ALTER TABLE `order` ADD FOREIGN KEY (customer_id)
REFERENCES customer(customer_id);

ALTER TABLE order_item ADD FOREIGN KEY (order_id)
REFERENCES `order`(order_id);

ALTER TABLE order_item ADD FOREIGN KEY (item_id)
REFERENCES item(item_id);

ALTER TABLE shipment ADD FOREIGN KEY (order_id)
REFERENCES `order`(order_id);

ALTER TABLE shipment ADD FOREIGN KEY (warehouse_id)
REFERENCES warehouse(warehouse_id);

