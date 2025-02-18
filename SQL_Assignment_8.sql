DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    amount INT
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

INSERT INTO Sales (sale_id, product_id, amount) VALUES
(1, 101, 500),
(2, 102, 300),
(3, 101, 700);

INSERT INTO Products (product_id, product_name) VALUES
(101, 'Laptop'),
(102, 'Phone');
