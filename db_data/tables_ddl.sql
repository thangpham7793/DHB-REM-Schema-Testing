DROP TABLE IF EXISTS doctor;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS availability_allowance;
DROP TABLE IF EXISTS salary;

CREATE TABLE IF NOT EXISTS salary (
  scale_name TEXT PRIMARY KEY,
  salary_step INT NOT NULL UNIQUE, 
  step_value INTEGER NOT NULL UNIQUE,
  annual_fte INTEGER NOT NULL,
  base_rate REAL NOT NULL --calculated by step_value/annual_fte
  --add check MAX MIN etc.
) WITHOUT ROWID;

CREATE TABLE IF NOT EXISTS availability_allowance ( --is this tied to a team or to a personal contract?
  region TEXT PRIMARY KEY, --each region has their own allowance scheme
  call_frequency INTEGER DEFAULT 0,
  response_immediacy INTEGER DEFAULT 0,
  work_attendance_immediacy INTEGER DEFAULT 0,
  availability INTEGER DEFAULT 0,
  flat_allowance_rate REAL, --like Dunedin
  point_based_allowance_rate REAL  --like Southland
-- ) WITHOUT ROWID;

CREATE TABLE IF NOT EXISTS team (
  team_id INTEGER PRIMARY KEY,
  on_call_hours REAL NOT NULL,
  on_call_hours_rate REAL NOT NULL, --is it the same for every member? is it compulsory? Or does it depend on other factors?
  region TEXT,
  FOREIGN KEY(region) REFERENCES availability_allowance(region) ON DELETE RESTRICT --a team must belong to a region
);

CREATE TABLE IF NOT EXISTS doctor (
  doctor_id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  specialisation TEXT NOT NULL,
  anniversary_date TEXT, --do we need to trigger this automatically on a daily basis?
  hours_per_week REAL NOT NULL, --is this set or does it change every week?
  team_role TEXT,
  team_id INTEGER, --a doctor may not be in a team so it's okay for this to be NULL
  scale_name TEXT NOT NULL,
  FOREIGN KEY(scale_name) REFERENCES salary(scale_name) 
    ON DELETE RESTRICT, --a doctor must have a pay scale  
  FOREIGN KEY(team_id) REFERENCES team(team_id)
    ON DELETE SET NULL
);

