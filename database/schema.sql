CREATE DATABASE IF NOT EXISTS findthing CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE findthing;
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(60) NOT NULL UNIQUE
);
CREATE TABLE items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  type ENUM('lost','found') NOT NULL,
  title VARCHAR(150) NOT NULL,
  description TEXT NOT NULL,
  category_id INT NOT NULL,
  place VARCHAR(200) NOT NULL,
  event_date DATE NOT NULL,
  status ENUM('active','returned','closed') NOT NULL DEFAULT 'active',
  author_id INT NOT NULL,
  contact_email VARCHAR(150) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  closed_at DATETIME NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);
CREATE TABLE responses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  item_id INT NOT NULL,
  topic VARCHAR(100) NOT NULL,
  message TEXT NOT NULL,
  sender_contact VARCHAR(150) NOT NULL,
  is_read TINYINT(1) NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);
INSERT INTO categories (name) VALUES ('Документы'),('Ключи'),('Электроника'),('Сумки и рюкзаки'),('Одежда'),('Животные'),('Другое');
