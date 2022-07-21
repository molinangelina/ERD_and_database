-- DDL: DATA DEFINITION LANGUAGE
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(50),
    rewards_member BOOLEAN
);

CREATE TABLE movies(
    movies_id SERIAL PRIMARY KEY,
    genre VARCHAR(50),
    movie_name VARCHAR(50),
    rating VARCHAR(10),
    duration VARCHAR(50)
);

CREATE TABLE concession(
    concession_id SERIAL PRIMARY KEY,
    prod_name VARCHAR(50),
    price NUMERIC(5,2)
);

CREATE TABLE tickets(
    ticket_id SERIAL PRIMARY KEY,
    movies_id INTEGER,
    price NUMERIC(5,2),
    FOREIGN KEY (movies_id) REFERENCES movies (movies_id)
);

CREATE TABLE customers_order(
    customers_order_id SERIAL PRIMARY KEY,
    concession_id INTEGER,
    customer_id INTEGER,
    prod_name VARCHAR(50),
    quantity INTEGER,
    FOREIGN KEY (concession_id) REFERENCES concession (concession_id),
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

CREATE TABLE customers_ticket(
    customers_ticket_id SERIAL PRIMARY KEY,
    ticket_id INTEGER,
    customer_id INTEGER,
    seat_number VARCHAR(50),
    purchase_time VARCHAR(50),
    FOREIGN KEY (ticket_id) REFERENCES tickets (ticket_id),
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);