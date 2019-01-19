DROP TABLE purchases;
DROP TABLE merchants;
DROP TABLE users;


CREATE TABLE users (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  budget INT8
);

CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL
);

CREATE TABLE purchases (
  id SERIAL8 PRIMARY KEY,
  amount INT2 NOT NULL,
  merchant VARCHAR(255),
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  date_picked DATE,
  time_picked TIME,
  type VARCHAR(255),
  user_id INT8 REFERENCES users(id) ON DELETE CASCADE
);
