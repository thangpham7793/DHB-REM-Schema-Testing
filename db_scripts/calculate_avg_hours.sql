DROP PROCEDURE IF EXISTS update_on_call_hours;

-- to be called AFTER INSERT/DELETE ON doctor
CREATE PROCEDURE update_on_call_hours(team_name VARCHAR(50)) BEGIN
UPDATE
  team,
  -- get total on-call hours of a team
  (
    SELECT
      on_call_hours total_hours
    FROM
      team t
    WHERE
      t.team_name = team_name
  ) t1,
  -- get number of team memebers of a team
  (
    SELECT
      COUNT(*) total_members
    FROM
      doctor d
    WHERE
      d.team_name = team_name
  ) t2
SET
  average_on_call_hours = t1.total_hours / t2.total_members,
  member_count = t2.total_members
WHERE
  team.team_name = team_name;

END;