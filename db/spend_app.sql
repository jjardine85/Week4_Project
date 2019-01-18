DROP TABLE merchants;
DROP TABLE purchases;
DROP TABLE users;

CREATE TABLE users (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  budget INT8
);

CREATE TABLE purchases (
  id SERIAL8 PRIMARY KEY,
  amount INT2,
  merchant VARCHAR(255),
  date INT8,
  time INT8,
  type VARCHAR(255),
  user_id INT8 REFERENCES users(id)
);

CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  purchase_id INT8 REFERENCES purchases(id)
);
