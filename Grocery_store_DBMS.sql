create TABLE users(
 user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('customer', 'admin') DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
INSERT INTO users (name, email, password, role) VALUES
('Admin User', 'admin@grocery.com', 'admin123', 'admin'),
('Ravi Kumar', 'ravi@gmail.com', 'ravi123', 'customer'),
('Priya Sharma', 'priya@gmail.com', 'priya123', 'customer'),
('Amit Patel', 'amit@gmail.com', 'amit123', 'customer'),
('Neha Singh', 'neha@gmail.com', 'neha123', 'customer'),
('Arjun Reddy', 'arjun@gmail.com', 'arjun123', 'customer'),
('Kiran Das', 'kiran@gmail.com', 'kiran123', 'customer'),
('Sneha Roy', 'sneha@gmail.com', 'sneha123', 'customer'),
('Vikram Joshi', 'vikram@gmail.com', 'vikram123', 'customer'),
('Anita Nair', 'anita@gmail.com', 'anita123', 'customer');

INSERT INTO products (name, category, price, stock) VALUES
('Milk 1L', 'Dairy', 40.00, 50),
('Bread', 'Bakery', 30.00, 40),
('Rice 5kg', 'Grains', 250.00, 30),
('Wheat Flour 5kg', 'Grains', 200.00, 25),
('Sugar 1kg', 'Grocery', 45.00, 60),
('Salt 1kg', 'Grocery', 20.00, 80),
('Eggs 12pcs', 'Poultry', 70.00, 35),
('Apples 1kg', 'Fruits', 120.00, 20),
('Bananas 1 dozen', 'Fruits', 50.00, 25),
('Tomatoes 1kg', 'Vegetables', 60.00, 30),
('Onions 1kg', 'Vegetables', 55.00, 30),
('Chicken 1kg', 'Meat', 180.00, 15),
('Soap', 'Personal Care', 25.00, 100),
('Shampoo 200ml', 'Personal Care', 90.00, 40),
('Detergent 1kg', 'Household', 110.00, 35);

INSERT INTO orders (user_id, total_amount) VALUES
(2, 120.00), -- Ravi
(3, 250.00), -- Priya
(4, 180.00), -- Amit
(5, 300.00), -- Neha
(6, 90.00),  -- Arjun
(7, 400.00), -- Kiran
(8, 60.00),  -- Sneha
(9, 350.00), -- Vikram
(10, 200.00); -- Anita

-- Order 1 (Ravi)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 80.00),   -- 2 Milk
(1, 2, 1, 30.00),   -- 1 Bread
(1, 5, 1, 45.00);   -- 1 Sugar

-- Order 2 (Priya)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(2, 3, 1, 250.00);  -- 1 Rice 5kg

-- Order 3 (Amit)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(3, 7, 2, 140.00),  -- 2 Eggs trays
(3, 2, 1, 30.00),   -- 1 Bread
(3, 6, 1, 20.00);   -- 1 Salt

-- Order 4 (Neha)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(4, 8, 2, 240.00),  -- 2 kg Apples
(4, 9, 1, 50.00),   -- 1 dozen Bananas
(4, 10, 1, 60.00);  -- 1 kg Tomatoes

-- Order 5 (Arjun)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(5, 14, 1, 90.00);  -- 1 Shampoo

-- Order 6 (Kiran)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(6, 4, 2, 400.00);  -- 2 Wheat Flour

-- Order 7 (Sneha)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(7, 13, 2, 50.00),  -- 2 Soaps
(7, 2, 1, 30.00);   -- 1 Bread

-- Order 8 (Vikram)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(8, 12, 1, 180.00), -- 1 kg Chicken
(8, 3, 1, 250.00);  -- 1 Rice 5kg

-- Order 9 (Anita)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(9, 11, 2, 110.00), -- 2 kg Onions
(9, 10, 1, 60.00),  -- 1 kg Tomatoes
(9, 6, 1, 20.00);   -- 1 Salt
INSERT INTO users (name, email, password, role)
VALUES ('Rahul Mehta', 'rahul@gmail.com', 'rahul123', 'customer');
UPDATE users SET email = 'ravi_new@gmail.com' WHERE user_id = 2;
DELETE FROM users WHERE user_id = 10; -- Deletes Anita
SELECT user_id, name, email, role, created_at FROM users;
INSERT INTO products (name, category, price, stock)
VALUES ('Butter 500g', 'Dairy', 120.00, 25);
UPDATE products SET stock = stock + 10 WHERE product_id = 1; -- Add 10 Milk
DELETE FROM products WHERE product_id = 15; -- Deletes Detergent
SELECT * FROM products ORDER BY category, name;
INSERT INTO orders (user_id, total_amount) VALUES (3, 180.00);
UPDATE orders SET total_amount = 200.00 WHERE order_id = 3;
DELETE FROM orders WHERE order_id = 7; -- Sneha's order
SELECT o.order_id, u.name, o.order_date, o.total_amount
FROM orders o
JOIN users u ON o.user_id = u.user_id;
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (2, 5, 2, 90.00); -- 2 Sugar in Priya's order
UPDATE order_items SET quantity = 3, price = 135.00
WHERE order_item_id = 2;
DELETE FROM order_items WHERE order_item_id = 5;
SELECT oi.order_id, p.name, oi.quantity, oi.price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

SELECT name, stock 
FROM products 
WHERE stock < 10;

SELECT u.name, o.order_id, o.total_amount, o.order_date
FROM orders o
JOIN users u ON o.user_id = u.user_id
WHERE u.name = 'Priya Sharma';

SELECT DATE(order_date) AS order_day, SUM(total_amount) AS daily_sales
FROM orders
GROUP BY DATE(order_date)
ORDER BY order_day DESC;

SELECT p.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC
LIMIT 3;

SELECT u.name, SUM(o.total_amount) AS total_spent
FROM orders o
JOIN users u ON o.user_id = u.user_id
GROUP BY u.user_id
ORDER BY total_spent DESC;
