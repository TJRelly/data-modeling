-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INT REFERENCES countries(id)
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT REFERENCES airlines(id),
  from_city_id INT REFERENCES cities(id),
  to_city_id INT REFERENCES cities(id),
  passenger_id INT REFERENCES passengers(id)
);

INSERT INTO passengers (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');

INSERT INTO airlines (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO countries (name)
VALUES
  ('United States'),
  ('Japan'),
  ('France'),
  ('United Kingdom'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO cities (name, country_id)
VALUES
  ('Washington DC', 1),
  ('Tokyo', 2),
  ('Los Angeles', 1),
  ('Seattle', 1),
  ('Paris', 3),
  ('Dubai', 6),
  ('New York', 1),
  ('Cedar Rapids', 1),
  ('Charlotte', 1),
  ('Mexico City', 1),
  ('Casablanca', 5),
  ('Beijing', 7),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Sao Paolo', 8),
  ('Santiago', 9);

-- Each passenger's flight details
INSERT INTO flights
  (seat, departure, arrival, airline_id, from_city_id, to_city_id, passenger_id)
VALUES
  ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 4, 1),
  ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 3, 2),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 12, 3),
  ('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 10, 1),
  ('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 11, 5),
  ('18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 13, 6),
  ('9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 8, 7),
  ('1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 14, 8),
  ('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 8, 15, 9),
  ('10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 16, 16, 10);
