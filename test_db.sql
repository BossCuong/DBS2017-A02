-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2017 at 04:06 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `mob_no` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



CREATE TABLE IF NOT EXISTS `company` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `detail` text NOT NULL,
  `srcImg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

INSERT INTO company (id, name, detail, srcImg)
VALUES (1, 'LG', 'mo ta','image/LG.png');
INSERT INTO company (id, name, detail, srcImg)
VALUES (2, 'FPT', 'mo ta','image/FPT.png');
INSERT INTO company (id, name, detail, srcImg)
VALUES (3, 'MOSO', 'mo ta','image/MOSO.png');
INSERT INTO company (id, name, detail, srcImg)
VALUES (4, 'KMS', 'mo ta','image/KMS.png');



CREATE TABLE IF NOT EXISTS `job` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `noidung` text NOT NULL,
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

INSERT INTO job (id, noidung)
VALUES (1, 'daylanoidung');
INSERT INTO job (id, noidung)
VALUES (2, 'day la noi dung');
INSERT INTO job (id, noidung)
VALUES (3, 'day la noi dung');
INSERT INTO job (id, noidung)
VALUES (4, 'day la noi dung');
INSERT INTO job (id, noidung)
VALUES (5, 'day la noi dung');
INSERT INTO job (id, noidung)
VALUES (6, 'day la noi dung');
