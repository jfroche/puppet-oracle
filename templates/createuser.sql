create user <%= name %>
identified by <%= password %>
default tablespace <%= user_tablespace %>;
GRANT CREATE SESSION to <%= name %>;
GRANT CREATE DATABASE LINK to <%= name %>;
GRANT CREATE MATERIALIZED VIEW to <%= name %>;
GRANT CREATE ANY INDEX to <%= name %>;
GRANT CREATE TABLE to <%= name %>;
GRANT CREATE VIEW to <%= name %>;
GRANT CREATE PROCEDURE to <%= name %>;
GRANT UNLIMITED TABLESPACE TO <%= name %>;
