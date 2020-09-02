DROP TABLE IF EXISTS salary;

CREATE TABLE IF NOT EXISTS salary (scale_name VARCHAR(10) PRIMARY KEY);

INSERT INTO
  salary (scale_name)
VALUES
  ('SME');