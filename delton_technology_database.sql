-- Delton Technology Solutions
-- MySQL database schema for website enquiries and quote requests
-- Import in GoDaddy cPanel -> phpMyAdmin

CREATE DATABASE IF NOT EXISTS delton_technology
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE delton_technology;

CREATE TABLE IF NOT EXISTS enquiries (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    company_name VARCHAR(200),
    mobile VARCHAR(30) NOT NULL,
    email VARCHAR(190),
    service_required VARCHAR(150),
    message TEXT,
    source VARCHAR(50) DEFAULT 'website',
    status ENUM('New','Contacted','In Progress','Converted','Closed') DEFAULT 'New',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_status (status),
    INDEX idx_mobile (mobile),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS quote_requests (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    company_name VARCHAR(200),
    mobile VARCHAR(30) NOT NULL,
    email VARCHAR(190),
    requirement_type VARCHAR(150),
    quantity INT UNSIGNED,
    budget VARCHAR(100),
    message TEXT,
    status ENUM('New','Contacted','Quoted','Converted','Closed') DEFAULT 'New',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_status (status),
    INDEX idx_mobile (mobile),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS rental_requests (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    company_name VARCHAR(200),
    mobile VARCHAR(30) NOT NULL,
    email VARCHAR(190),
    laptop_model VARCHAR(150),
    quantity INT UNSIGNED DEFAULT 1,
    rental_period VARCHAR(100),
    start_date DATE,
    requirement TEXT,
    status ENUM('New','Contacted','Quoted','Confirmed','Closed') DEFAULT 'New',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_status (status),
    INDEX idx_mobile (mobile),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS admin_users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(190) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('Admin','Staff') DEFAULT 'Staff',
    status ENUM('Active','Inactive') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_admin_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
