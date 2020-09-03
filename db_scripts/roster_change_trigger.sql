CREATE TRIGGER after_delete_doctor
AFTER
  DELETE ON doctor FOR EACH ROW CALL update_on_call_hours(OLD.team_name);

CREATE TRIGGER after_insert_doctor
AFTER
INSERT
  ON doctor FOR EACH ROW CALL update_on_call_hours(NEW.team_name);