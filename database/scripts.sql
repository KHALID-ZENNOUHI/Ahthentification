CREATE DATABASE situation;

-- Role Table
CREATE TABLE Role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Sample Roles
INSERT INTO Role (name) VALUES
('Admin'),
('User'),
('Moderator');


-- User Table
CREATE TABLE User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    fullname VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL, -- appropriate length for hashed passwords
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES Role(id) ON DELETE CASCADE
    

);



-- Sample Users
INSERT INTO User (username,fullname ,password,role_id) VALUES
-- Hash for: 123456
('admin','Abelqoudouss Chabab','$2y$10$z5hvjVbnx11kyif3UNNtSe73DpyAvCpj5s6oNLJ8GAvPvygqa0AWa',1), 
('user1','Najat Elmakhloufi' ,'$2y$10$z5hvjVbnx11kyif3UNNtSe73DpyAvCpj5s6oNLJ8GAvPvygqa0AWa',2),
('user2', 'Anas Fihar','$2y$10$z5hvjVbnx11kyif3UNNtSe73DpyAvCpj5s6oNLJ8GAvPvygqa0AWa',2),
('user3', 'Ibtihal Roujane','$2y$10$z5hvjVbnx11kyif3UNNtSe73DpyAvCpj5s6oNLJ8GAvPvygqa0AWa',2),
('user4', 'Aymane Elgmiri','$2y$10$z5hvjVbnx11kyif3UNNtSe73DpyAvCpj5s6oNLJ8GAvPvygqa0AWa',2),
('user5', 'Zakaria Elhani','$2y$10$z5hvjVbnx11kyif3UNNtSe73DpyAvCpj5s6oNLJ8GAvPvygqa0AWa',2),
('user6', 'Ibtissam Lamtioui','$2y$10$z5hvjVbnx11kyif3UNNtSe73DpyAvCpj5s6oNLJ8GAvPvygqa0AWa',2),
('user7', 'Abdelouahab Elouafi','$2y$10$z5hvjVbnx11kyif3UNNtSe73DpyAvCpj5s6oNLJ8GAvPvygqa0AWa',2),
('user8', 'Mohammed Abdellatif','$2y$10$z5hvjVbnx11kyif3UNNtSe73DpyAvCpj5s6oNLJ8GAvPvygqa0AWa',2),
('user9', 'Mehdi Acherouaou','$2y$10$z5hvjVbnx11kyif3UNNtSe73DpyAvCpj5s6oNLJ8GAvPvygqa0AWa',2);



