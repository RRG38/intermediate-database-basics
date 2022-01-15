CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255)
)

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    price FLOAT
)

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_id FLOAT,
    product_id INT REFERENCES products(product_id)
)

INSERT INTO users
(username, email)
VALUES
('Ryan', 'ryan@email'),
('Elizabeth', 'elizabeth@email'),
('Kelsey', 'kelsey@email');

INSERT INTO products
(product_name, price)
VALUES
('ball', 2.99),
('hat', 18.99),
('shirt', 25.50);

INSERT INTO orders
(order_id, product_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(3, 3);

SELECT products.product_name, products.price FROM products
JOIN orders ON products.product_id = orders.product_id
WHERE orders.order_id = 1;

SELECT * FROM orders;

SELECT SUM(products.price) FROM products
JOIN orders ON products.product_id = orders.product_id
WHERE orders.order_id = 1;

ALTER TABLE users
ADD COLUMN order_id INT references orders(id);

UPDATE users
SET order_id = 1
WHERE user_id = 1;

UPDATE users
SET order_id = 2
WHERE user_id = 2;

UPDATE users
SET order_id = 3
WHERE user_id = 3;

ALTER TABLE orders
ADD COLUMN user_id INT references users(user_id);

UPDATE orders
SET user_id = 1
WHERE order_id = 1;

UPDATE orders
SET user_id = 2
WHERE order_id = 2;

UPDATE orders
SET user_id = 3
WHERE order_id = 3;


SELECT products.product_name FROM products
JOIN orders ON orders.product_id = products.product_id
JOIN users ON users.user_id = orders.user_id
WHERE users.user_id = 1;

SELECT orders.user_id, COUNT(*) FROM orders
GROUP BY user_id;