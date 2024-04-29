-- from the terminal run:
-- psql < medical_center.psql
DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE
  medical_center (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    location TEXT NOT NULL,
    phone_number VARCHAR(12) NOT NULL UNIQUE
  );

INSERT INTO
  medical_center (name, location, phone_number)
VALUES
  ('Diamond Medical', 'New York', '816-555-1234'),
  ('Ruby Medical', 'California', '816-555-5678'),
  ('Emerald Medical', 'New Jersey', '816-555-9012');

CREATE TABLE
  doctor (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    medical_center_id INTEGER REFERENCES medical_center
  );

INSERT INTO
  doctor (name, medical_center_id)
VALUES
  ('Dr. Diamond', 1),
  ('Dr. Ruby', 2),
  ('Dr. Emerald', 3);

CREATE TABLE
  patient (id SERIAL PRIMARY KEY, name TEXT NOT NULL);

INSERT INTO
  patient (name)
VALUES
  ('Mr. Smith'),
  ('Ms. Doe'),
  ('Mr. Anderson');

CREATE TABLE
  disease (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
  );

INSERT INTO
  disease (name, description)
VALUES
  ('yellowitis', 'makes you yellow'),
  ('greenitis', 'makes you green'),
  ('reditis', 'makes you red');

CREATE TABLE
  visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL REFERENCES doctor,
    patient_id INTEGER NOT NULL REFERENCES patient,
    disease_id INTEGER NOT NULL REFERENCES disease
  );

INSERT INTO
  visits (doctor_id, patient_id, disease_id)
VALUES
  (1, 1, 1),
  (1, 2, 1),
  (2, 2, 2),
  (2, 3, 2),
  (3, 1, 3),
  (3, 3, 3);