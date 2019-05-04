DROP DATABASE IF EXISTS travelmanager;
CREATE DATABASE travelmanager;

USE travelmanager;

DROP TABLE IF EXISTS currencies;
CREATE TABLE currencies (
  code VARCHAR(16) PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  ratio2rmb float
);

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  uid INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(128) NOT NULL,
  password VARCHAR(128) NOT NULL,
  email varchar(45) NOT NULL,
  age INTEGER DEFAULT NULL,
  sex VARCHAR(8) NOT NULL check(sex = 'male' OR sex = 'female')
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS activities CASCADE;
CREATE TABLE activities (
  aid INT PRIMARY KEY AUTO_INCREMENT,
  description VARCHAR(256) DEFAULT NULL,
  payer int REFERENCES users(uid),
  amount float DEFAULT 0,
  number_people int DEFAULT 1,
  amount_per_person float DEFAULT 0
);

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  tid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT NOT NULL REFERENCES users(uid),
  aid INT NOT NULL REFERENCES activities(aid),
  role CHAR(5) NOT NULL check(role = 'payer' OR role = 'payee')
);