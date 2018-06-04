-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Ago 22, 2015 alle 10:18
-- Versione del server: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `feedgator`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;
--
-- Struttura della tabella `rss`
--

CREATE TABLE IF NOT EXISTS `rss` (
  `rss_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(512) NOT NULL,
  PRIMARY KEY (`rss_id`),
  UNIQUE KEY `address` (`address`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;
--
-- Struttura della tabella `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(512) NOT NULL,
  `password` varchar(128) NOT NULL,
  `cookie` varchar(128) DEFAULT NULL,
  `last_login` timestamp NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;
--
-- Struttura della tabella `user_category`
--

CREATE TABLE IF NOT EXISTS `user_category` (
  `user_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`user_category_id`),
  UNIQUE KEY `user_category_id` (`user_id`,`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Struttura della tabella `user_category_rss`
--

CREATE TABLE IF NOT EXISTS `user_category_rss` (
  `user_category_rss_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_rss_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`user_category_rss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;
--
-- Struttura della tabella `user_rss`
--

CREATE TABLE IF NOT EXISTS `user_rss` (
  `user_rss_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rss_id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  PRIMARY KEY (`user_rss_id`),
  UNIQUE KEY `user_rss_id` (`user_id`,`rss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
