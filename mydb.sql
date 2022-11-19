CREATE DATABASE IF NOT EXISTS Shop;

USE shop;

CREATE TABLE IF NOT EXISTS CATEGORIES (
category_id int auto_increment,
category_name varchar(255),
category_description varchar(255),
PRIMARY KEY (category_id)
);
--sdfsdfsdfsdfsdf
CREATE TABLE IF NOT EXISTS Product_categories (
product_id int not null,
category_id int not null,
FOREIGN KEY (product_id) REFERENCES  products (product_id),
FOREIGN KEY (category_id) REFERENCES categories (category_id),
PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS Products (
product_id int not null auto_increment,
product_name varchar(255) not null,
product_description varchar(255) not null,
product_price varchar(255) not null,
product_status varchar(255) not null,
PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS Shopping_cart_items (
user_id int not null,
product_id int not null,
product_options varchar(256),
quantity int,
FOREIGN KEY (user_id) REFERENCES  users (user_id),
FOREIGN KEY (product_id) REFERENCES products (product_id),
primary key (product_options)
);

CREATE TABLE IF NOT EXISTS Users (
user_id int not null auto_increment,
user_role varchar(256) not null,
user_name varchar(256) not null,
user_email varchar(256) not null,
user_password varchar(256) not null,
primary key (user_id)
);

CREATE TABLE IF NOT EXISTS Orders (
order_id int not null auto_increment,
user_id int not null REFERENCES users (user_id),
user_name varchar(256) REFERENCES users (user_name),
user_email varchar(255) REFERENCES users (user_email),
FOREIGN KEY (user_id) REFERENCES  users (user_id),
primary key (order_id)
);

CREATE TABLE IF NOT EXISTS Order_totals (
total_id int not null auto_increment,
order_id int not null,
total_name varchar(256),
total_amount int not null,
FOREIGN KEY (order_id) REFERENCES  orders (order_id),
primary key (total_id)
);

CREATE TABLE IF NOT EXISTS Order_products (
item_id int not null auto_increment,
order_id int not null,
item_name varchar(256),
item_price varchar(256),
item_quantity int not null,
FOREIGN KEY (order_id) REFERENCES  orders (order_id),
primary key (item_id)
);

CREATE TABLE IF NOT EXISTS Order_product_options (
item_option_id int not null auto_increment,
item_id int not null,
option_group varchar(256),
option_value int not null,
FOREIGN KEY (item_id) REFERENCES  order_products (item_id),
primary key (item_option_id)
);