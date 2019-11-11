DROP TABLE stock;
DROP TABLE products;
DROP TABLE suppliers;
DROP TABLE categories;

CREATE TABLE categories (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE suppliers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  contact_name VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(255)
);

CREATE TABLE products (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  category_id INT8 REFERENCES categories(id)
);

CREATE TABLE stock (
  id SERIAL8 PRIMARY KEY,
  product_id INT8 REFERENCES products(id),
  supplier_id INT8 REFERENCES suppliers(id),
  stock_quantity INT,
  buying_cost DECIMAL(10,2),
  selling_price DECIMAL(10,2)
);
