-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist



CREATE TABLE
    regions (id SERIAL PRIMARY KEY, name TEXT UNIQUE NOT NULL);

CREATE TABLE
    users (
        id SERIAL PRIMARY KEY,
        user_name TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL UNIQUE,
        preferred_region_id INTEGER REFERENCES regions NOT NULL
    );

CREATE TABLE
    categories (id SERIAL PRIMARY KEY, name TEXT UNIQUE NOT NULL);

CREATE TABLE
    posts (
        id SERIAL PRIMARY KEY,
        title TEXT NOT NULL,
        text TEXT NOT NULL,
        user_id INTEGER REFERENCES users ON DELETE SET NULL,
        location TEXT,
        region_id INTEGER REFERENCES regions NOT NULL,
        category_id INTEGER REFERENCES categories NOT NULL
    );

INSERT INTO
    categories (name)
VALUES
    ('Religion'),
    ('Sports'),
    ('Entertainment');

INSERT INTO
    regions (name)
VALUES
    ('North America'),
    ('Africa'),
    ('Asia');

INSERT INTO
    users (user_name, password, preferred_region_id)
VALUES
    ('Diamond', '816-555-1234', 1),
    ('Ruby', '816-555-5678', 2),
    ('Emerald', '816-555-5679', 3);

INSERT INTO
    posts (
        title,
        text,
        user_id,
        location,
        region_id,
        category_id
    )
VALUES
    (
        'Diamonds',
        'Shiny Stones',
        1,
        'Cali',
        1,
        1
    ),
    (
        'Rubies',
        'Shiny Ruby Stones',
        2,
        'NJ',
        2,
        2
    ),
    (
        'Emeralds',
        'Shiny Stones',
        1,
        'NY',
        3,
        1
    );