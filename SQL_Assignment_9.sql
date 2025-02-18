-- Step 1: Drop tables if they already exist
DROP TABLE IF EXISTS Order_Details;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- Step 2: Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

-- Step 3: Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Step 4: Create Order_Details Table
CREATE TABLE Order_Details (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Step 5: Insert Data into Customers Table
INSERT INTO Customers (customer_id, customer_name) VALUES
(1, 'Alice'),
(2, 'Bob');

-- Step 6: Insert Data into Orders Table
INSERT INTO Orders (order_id, order_date, customer_id) VALUES
(1, '2024-01-02', 1),
(2, '2024-01-05', 2);

-- Step 7: Insert Data into Order_Details Table
INSERT INTO Order_Details (order_id, product_id, quantity) VALUES
(1, 101, 2),
(1, 102, 1),
(2, 101, 3);

-- Step 8: Final Query to Get Required Output
SELECT o.order_id, c.customer_name, SUM(od.quantity) AS total_quantity
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_Details od ON o.order_id = od.order_id
GROUP BY o.order_id, c.customer_name;
