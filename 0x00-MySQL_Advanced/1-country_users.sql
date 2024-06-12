-- 0x00-MySQL_Advanced/2-country_users.sql
-- SQL script that creates a table users following these
CREATE TABLE IF NOT EXISTS users (
        id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
        email varchar(255) NOT NULL UNIQUE,
        name varchar(255),
        country ENUM('US', 'CO', 'TN' ) DEFAULT 'US' NOT NULL   
);