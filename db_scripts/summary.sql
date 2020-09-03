SELECT
  team_name,
  COUNT(*)
FROM
  doctor
GROUP BY
  team_name;

--get total team members of each team