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

