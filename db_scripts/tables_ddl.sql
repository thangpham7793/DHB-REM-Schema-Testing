-- DROP TABLE salary;
-- CREATE TABLE salary (
--   scale_name VARCHAR(10) PRIMARY KEY,
--   step_1 MEDIUMINT,
--   step_2 MEDIUMINT,
--   step_3 MEDIUMINT,
--   step_4 MEDIUMINT,
--   step_5 MEDIUMINT,
--   step_6 MEDIUMINT,
--   step_7 MEDIUMINT,
--   step_8 MEDIUMINT,
--   step_9 MEDIUMINT,
--   step_10 MEDIUMINT
-- );
DROP TABLE IF EXISTS doctor;

DROP TABLE IF EXISTS team;

CREATE TABLE IF NOT EXISTS team (
  team_name VARCHAR(50) PRIMARY KEY,
  on_call_hours INT,
  average_on_call_hours DECIMAL(7, 4),
  member_count SMALLINT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS doctor (
  id SMALLINT NOT NULL AUTO_INCREMENT,
  first_name TEXT,
  team_name VARCHAR(50),
  PRIMARY KEY(id),
  FOREIGN KEY (team_name) REFERENCES team(team_name) ON DELETE
  SET
    NULL
);