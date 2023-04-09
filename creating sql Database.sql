--- create orders table for the resturant_database

CREATE TABLE orders (
   row_id int NOT NULL,
   order_id varchar(50) NOT NULL,
   item_id varchar(50) NOT NULL,
   quantity int NOT NULL,
   cust_first_name varchar(100) NOT NULL,
   cust_last_name varchar(100) NOT NULL,
   delivery boolean NOT NULL,
   delivery_address varchar(140) NOT NULL, 
   delivery_city varchar(35) NOT NULL,
   delivery_zipcode varchar(40) NOT NULL,
  PRIMARY KEY (row_id)
); 

-- drop customer name inorder to join customer table
ALTER TABLE orders
DROP COLUMN cust_first_name,
DROP COLUMN cust_last_name;

-- add customer id column into the order table
ALTER TABLE orders
ADD COLUMN cust_id int NOT NULL;

-- creating a customrer table 
CREATE TABLE customers (
    cust_id int  NOT NULL ,
    cust_first_name varchar(50)  NOT NULL ,
    cust_last_name varchar(50)  NOT NULL ,
    PRIMARY KEY (cust_id)
);

-- join the foreign key 
ALTER TABLE customers 
ADD CONSTRAINT fk_customers_cust_id 
FOREIGN KEY (cust_id) REFERENCES orders (cust_id);



-- creating the address table
CREATE TABLE address (
    add_id int  NOT NULL ,
    delivery_address1 varchar(140)  NOT NULL ,
    delivery_city varchar(35)  NOT NULL ,
    delivery_zipcode varchar(40)  NOT NULL ,
    PRIMARY KEY (add_id
    )
);

-- changes in orders tables again, add delivery id and delete delevey adress, city, zip code

-- drop customer name from order table
ALTER TABLE orders
DROP COLUMN delivery_address, 
DROP COLUMN delivery_city,
DROP COLUMN delivery_zipcode; 


-- add customer id column into the order table
ALTER TABLE orders
ADD COLUMN add_id int NOT NULL;

-- Specify the relationship between these two table the foreign key order table to address table 
ALTER TABLE address 
ADD CONSTRAINT fk_address_add_id 
FOREIGN KEY (add_id) REFERENCES orders(add_id);





