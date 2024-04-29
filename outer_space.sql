-- Run this script from the terminal using: psql < outer_space.sql

-- Drop the database if it exists
DROP DATABASE IF EXISTS outer_space;

-- Create a new database named outer_space
CREATE DATABASE outer_space;

-- Connect to the newly created database
\c outer_space

-- Create a table to store information about central bodies
CREATE TABLE central_bodies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Create a table to store information about galaxies
CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Create a table to store information about planets
CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER NOT NULL REFERENCES central_bodies(id),
  galaxy INTEGER NOT NULL REFERENCES galaxies(id)
);

-- Create a table to store information about moons
CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Create a table to establish the many-to-many relationship between planets and moons
CREATE TABLE planets_moons
(
  planet_id INTEGER NOT NULL REFERENCES planets(id),
  moon_id INTEGER NOT NULL REFERENCES moons(id),
  PRIMARY KEY (planet_id, moon_id)
);

-- Insert data into the central_bodies table
INSERT INTO central_bodies (name) VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

-- Insert data into the galaxies table
INSERT INTO galaxies (name) VALUES ('Milky Way');

-- Insert data into the planets table
INSERT INTO planets (name, orbital_period_in_years, orbits_around, galaxy) VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);

-- Insert data into the moons table
INSERT INTO moons (name) VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('Proteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');

-- Insert data into the planets_moons table
INSERT INTO planets_moons (planet_id, moon_id) VALUES
  (1, 1), -- Earth's moon
  (2, 2), -- Mars' moon Phobos
  (2, 3), -- Mars' moon Deimos
  (4, 4), -- Neptune's moon Naiad
  (4, 5), -- Neptune's moon Thalassa
  (4, 6), -- Neptune's moon Despina
  (4, 7), -- Neptune's moon Galatea
  (4, 8), -- Neptune's moon Larissa
  (4, 9), -- Neptune's moon S/2004 N 1
  (4, 10), -- Neptune's moon Proteus
  (4, 11), -- Neptune's moon Triton
  (4, 12), -- Neptune's moon Nereid
  (4, 13), -- Neptune's moon Halimede
  (4, 14), -- Neptune's moon Sao
  (4, 15), -- Neptune's moon Laomedeia
  (4, 16); -- Neptune's moon Psamathe
