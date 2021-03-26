CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE products (
  product_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  price INTEGER,
  order_id INTEGER
);

CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  product_id INTEGER REFERENCES products(product_id)
);