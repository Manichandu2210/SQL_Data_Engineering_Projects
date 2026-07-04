-- duckdb jobs_mart.duckdb

CREATE SCHEMA IF NOT EXISTS staging;

DROP TABLE IF EXISTS staging.preffered_roles;

CREATE TABLE IF NOT EXISTS staging.preffered_roles (
    role_ID INTEGER PRIMARY KEY,
    role_name VARCHAR
);

INSERT INTO staging.preffered_roles (role_ID, role_name)
VALUES
    (1, 'Data engineering'),
    (2, 'Data Analyst'),
    (3, 'Data scientist'),
    (4, 'Data Architect');

SELECT * FROM staging.preffered_roles;

-- Add column only if it doesn't exist
ALTER TABLE staging.preffered_roles
ADD COLUMN IF NOT EXISTS preffered_role BOOLEAN;

-- Update role name
UPDATE staging.preffered_roles
SET role_name = 'Data Engineering'
WHERE role_name LIKE 'Engineering%';

-- Populate boolean column
UPDATE staging.preffered_roles
SET preffered_role = TRUE
WHERE role_name NOT LIKE 'D%en%'
  AND role_name NOT LIKE 'D%sc%';

UPDATE staging.preffered_roles
SET preffered_role = FALSE
WHERE role_name  LIKE 'D%en%'   
  OR role_name  LIKE 'D%sc%';

SELECT * FROM staging.preffered_roles;