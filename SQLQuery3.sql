create schema sales;
create schema production;

create table production.categories(
category_id int identity(1,1) primary key,
caategory_name varchar(255) not null
);

create table production.brands(
brand_id int identity(1,1) primary key,
brand_name varchar(255) not null
);

create table production.products(
product_id int identity(1,1) primary key,
product_name varchar(255) not null,
brand_id int not null,
category_id int not null,
model_year smallint not null,
list_price decimal(10,2)
foreign key(category_id) REFERENCES production.categories (category_id) on delete cascade on update cascade,
foreign key(brand_id) REFERENCES production.brands (brand_id) on delete cascade on update cascade
);