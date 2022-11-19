CREATE DATABASE IF NOT EXISTS ECommerce;

USE ECommerce;

CREATE TABLE IF NOT EXISTS Categories (
category_id int auto_increment,
category_name varchar(255),
category_description varchar(255),
PRIMARY KEY (category_id)
);

CREATE TABLE IF NOT EXISTS ProductCategories (
product_id int not null,
category_id int not null,
FOREIGN KEY (product_id) REFERENCES  Products(product_id),
FOREIGN KEY (category_id) REFERENCES Categories(category_id),
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

CREATE TABLE IF NOT EXISTS ShoppingCartItems (
user_id int not null,
product_id int not null,
product_options varchar(255),
quantity int,
FOREIGN KEY (user_id) REFERENCES  Users(user_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id),
primary key (product_options)
);

CREATE TABLE IF NOT EXISTS Users (
user_id int not null auto_increment,
user_role varchar(255) not null,
user_name varchar(255) not null,
user_email varchar(255) not null,
user_password varchar(255) not null,
primary key (user_id)
);

CREATE TABLE IF NOT EXISTS Orders (
order_id int not null auto_increment,
user_id int not null REFERENCES Users(user_id),
user_name varchar(255) REFERENCES Users(user_name),
user_email varchar(255) REFERENCES Users(user_email),
FOREIGN KEY (user_id) REFERENCES  Users(user_id),
primary key (order_id)
);

CREATE TABLE IF NOT EXISTS OrderTotals (
total_id int not null auto_increment,
order_id int not null,
total_name varchar(255),
total_amount int not null,
FOREIGN KEY (order_id) REFERENCES  Orders(order_id),
primary key (total_id)
);

CREATE TABLE IF NOT EXISTS OrderProducts (
item_id int not null auto_increment,
order_id int not null,
item_name varchar(255),
item_price varchar(255),
item_quantity int not null,
FOREIGN KEY (order_id) REFERENCES  Orders(order_id),
primary key (item_id)
);

CREATE TABLE IF NOT EXISTS OrderProductOptions (
item_option_id int not null auto_increment,
item_id int not null,
option_group varchar(255),
option_value int not null,
FOREIGN KEY (item_id) REFERENCES  OrderProducts(item_id),
primary key (item_option_id)
);
