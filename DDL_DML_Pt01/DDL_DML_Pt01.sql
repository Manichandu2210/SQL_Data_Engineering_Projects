-- duckdb jobs_mart.duckdb;

select * from information_schema.tables where table_catalog = 'jobs_mart'; 
CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.preffered_roles (
    role_ID INTEGER,
    role_name VARCHAR
);

DROP TABLE IF EXISTS main.preffered_roles;