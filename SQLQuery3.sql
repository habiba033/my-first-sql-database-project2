CREATE SCHEMA sales;
CREATE SCHEMA production;

CREATE TABLE production.categories(
category_id SERIAL PRIMARY KEY,
category_name VARCHAR(25) NOT NULL
);
CREATE TABLE production.brands(
brand_id SERIAL PRIMARY KEY,
brand_name VARCHAR(25) NOT NULL
);
CREATE TABLE production.products(
product_id serial PRIMARY KEY,
product_name VARCHAR(25) NOT NULL,
brand_id int NOT NULL,
category_id int NOT NULL,
model_year VARCHAR(5) NOT NULL,
list_price DECIMAL(10,2),
foreign key (brand_id) REFERENCES production.brands(brand_id) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (category_id) REFERENCES production.categories(category_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE sales.customers(
customer_id SERIAL PRIMARY KEY,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
phone VARCHAR(25) NOT NULL,
email VARCHAR(255) NOT NULL,
street VARCHAR(255) NOT NULL,
city VARCHAR(255) NOT NULL,
statte VARCHAR(255) NOT NULL,
zip_code VARCHAR(5) NOT NULL
);
CREATE TABLE sales.stores(
store_id SERIAL PRIMARY KEY ,
store_name VARCHAR(25) NOT NULL,
phone VARCHAR(25) NOT NULL,
email VARCHAR(255) NOT NULL,
street VARCHAR(255) NOT NULL,
city VARCHAR(255) NOT NULL,
statte VARCHAR(255) NOT NULL,
zip_code VARCHAR(5) NOT NULL
);
CREATE TABLE sales.staffs(
staff_id SERIAL PRIMARY KEY , 
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
phone VARCHAR(25) NOT NULL,
email VARCHAR(255) NOT NULL,
active VARCHAR(25) NOT NULL,
store_id int,
manager_id int,
foreign key (store_id) REFERENCES sales.stores(store_id) ON DELETE CASCADE ON UPDATE CASCADE ,
foreign key (manager_id) REFERENCES sales.staffs(staff_id)  ON DELETE CASCADE ON UPDATE CASCADE
);

create table sales.orders(
order_id serial primary key,
customer_id int not null,
order_status varchar(25) not null,
order_date varchar(25) not null,
required_data varchar(255) not null,
shipped_date varchar(255),
store_id int not null,
staff_id int not null,
foreign key (staff_id) references sales.staffs(staff_id) on delete cascade on update cascade,
foreign key (store_id) references sales.stores(store_id) on delete cascade on update cascade,
foreign key (customer_id) references sales.customers (customer_id) on delete cascade on update cascade
);
create table sales.order_items(
order_id int,
item_id int,
product_id int not null,
quantity int not null,
list_price decimal(10,2),
discount decimal(10,2) ,
primary key (order_id , item_id),
foreign key (order_id) references sales.orders(order_id) on delete cascade on update cascade,
foreign key (product_id) references production.products(product_id) on delete cascade on update cascade
);

CREATE TABLE production.stocks(
store_id int,
product_id int,
quantity int not null,
primary key(store_id,product_id),
foreign key (store_id) REFERENCES sales.stores (store_id) on delete cascade on update cascade,
foreign key (product_id) REFERENCES production.products (product_id) on delete cascade on update cascade
);
