-- Step 1: Select the correct database
USE employee_db;

-- Step 2: Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

-- Step 3: Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Step 4: Create Orders Table (Fixing the missing orders issue)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- Step 5: Create Products Table (Ensuring order_id can be NULL)
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    order_id INT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE SET NULL
);

-- Step 6: Insert Data into Customers Table
INSERT INTO customers (customer_id, customer_name) VALUES
(101, 'John Doe'),
(102, 'Jane Smith');

-- Step 7: Insert Data into Orders Table (Fixing the missing orders issue)
INSERT INTO orders (order_id, order_date, customer_id) VALUES
(1, '2024-01-01', 101),
(2, '2024-01-03', 102);

-- Step 8: Insert Data into Products Table
INSERT INTO products (product_id, product_name, order_id) VALUES
(1, 'Laptop', 1),
(2, 'Phone', NULL); -- Phone is not linked to any order

-- Step 9: Fetch Data ensuring all products are listed, even those without orders
SELECT 
    COALESCE(orders.order_id, 'No Order') AS order_id,
    COALESCE(customers.customer_name, 'No Customer') AS customer_name,
    products.product_name
FROM products
LEFT JOIN orders ON products.order_id = orders.order_id
LEFT JOIN customers ON orders.customer_id = customers.customer_id;
SELECT 
    COALESCE(o.order_id, 'No Order') AS order_id,
    COALESCE(c.customer_name, 'No Customer') AS customer_name,
    p.product_name
FROM products p
LEFT JOIN orders o ON p.order_id = o.order_id
LEFT JOIN customers c ON o.customer_id = c.customer_id;
