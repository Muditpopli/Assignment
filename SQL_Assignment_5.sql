CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);
ALTER TABLE products 
ADD CONSTRAINT pk_product PRIMARY KEY (product_id);
ALTER TABLE products 
MODIFY COLUMN price DECIMAL(10,2) DEFAULT 50.00;
SHOW TABLES;