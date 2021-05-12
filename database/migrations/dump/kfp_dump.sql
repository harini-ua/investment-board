-- phpMyAdmin SQL Dump
-- version 4.9.6
-- https://www.phpmyadmin.net/
--
-- Host: bv6mw.myd.infomaniak.com
-- Generation Time: May 12, 2021 at 02:16 PM
-- Server version: 5.7.32-log
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bv6mw_kfp_web_app`
--
CREATE DATABASE IF NOT EXISTS `bv6mw_kfp_web_app` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bv6mw_kfp_web_app`;

-- --------------------------------------------------------

--
-- Table structure for table `wa_benchmark`
--

CREATE TABLE `wa_benchmark` (
  `benchmark_date` date NOT NULL,
  `indice` varchar(20) NOT NULL,
  `mtd_percentage` double NOT NULL,
  `ytd_percentage` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wa_benchmark`
--

INSERT INTO `wa_benchmark` (`benchmark_date`, `indice`, `mtd_percentage`, `ytd_percentage`) VALUES
('2020-12-31', 'Equity', 0.0521, -0.015),
('2020-12-31', 'Fixed Income', 0.0423, 0.0124),
('2020-12-31', 'Huge Fund', 0.0127, -0.005),
('2020-12-31', 'Balanced', 0.0472, -0.0013),
('2020-12-31', 'KFP Asset Allocation', 0.0368, -0.0552);

-- --------------------------------------------------------

--
-- Table structure for table `wa_currency`
--

CREATE TABLE `wa_currency` (
  `client_code` varchar(3) NOT NULL,
  `period_date` date NOT NULL,
  `valuation_currency` varchar(3) NOT NULL,
  `valuation_method` varchar(5) NOT NULL,
  `custodian` varchar(20) NOT NULL,
  `account` varchar(20) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `category` varchar(20) NOT NULL,
  `value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wa_currency`
--

INSERT INTO `wa_currency` (`client_code`, `period_date`, `valuation_currency`, `valuation_method`, `custodian`, `account`, `currency`, `category`, `value`) VALUES
('DUM', '2020-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'CHF', 'Cash', 144623.597342),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'CHF', 'Fx', 10000000),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'CHF', 'Investment', 331204.411765),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'EUR', 'Cash', 111559.211243),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'EUR', 'Investment', 1094992.587535),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'GBP', 'Cash', 37886.480008),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'JPY', 'Cash', 2131.514871),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'NOK', 'Cash', 21238.315721),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'SEK', 'Cash', 21335.112757),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'USD', 'Cash', 194099.575117),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'USD', 'Fx', -9090000),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'USD', 'Investment', 3790616.442266),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'EUR', 'Investment', 1319830.272989),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'GBP', 'Investment', 570723.58209),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'NOK', 'Investment', 278914.477612),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'USD', 'Investment', 6837128.549159),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'CHF', 'Cash', 150343.174638),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'EUR', 'Cash', 266502.560192),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'EUR', 'Investment', 930253.977497),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'GBP', 'Cash', 155828.739514),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'JPY', 'Cash', 1445.537368),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'NOK', 'Cash', 24161.019719),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'NOK', 'Investment', 112.016085),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'SEK', 'Cash', 16715.873189),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'USD', 'Cash', 244357.500817),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'USD', 'Investment', 6024619.053518),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'CHF', 'Cash', 144623.597342),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'CHF', 'Fx', 10000000),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'CHF', 'Investment', 336591.176471),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'EUR', 'Cash', 111260.649308),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'EUR', 'Investment', 1094840.078723),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'GBP', 'Cash', 37905.272905),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'JPY', 'Cash', 2096.295348),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'NOK', 'Cash', 21425.345898),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'SEK', 'Cash', 21616.897266),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'USD', 'Cash', 188996.186948),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'USD', 'Fx', -8851000),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'USD', 'Investment', 3802328.748275),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'EUR', 'Investment', 1338396.614543),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'GBP', 'Investment', 571006.679105),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'NOK', 'Investment', 281370.671642),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'USD', 'Investment', 6706564.527984),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'CHF', 'Cash', 150343.174638),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'EUR', 'Cash', 265789.328903),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'EUR', 'Investment', 947143.895605),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'GBP', 'Cash', 155906.035516),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'JPY', 'Cash', 1421.652413),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'NOK', 'Cash', 24373.787994),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'NOK', 'Investment', 109.235777),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'SEK', 'Cash', 16936.648872),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'USD', 'Cash', 237932.69964),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'USD', 'Investment', 6534976.384968),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'CHF', 'Cash', 144623.597342),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'CHF', 'Fx', 10000000),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'CHF', 'Investment', 331204.411765),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'EUR', 'Cash', 111559.211243),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'EUR', 'Investment', 1094992.587535),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'GBP', 'Cash', 37886.480008),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'JPY', 'Cash', 2131.514871),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'NOK', 'Cash', 21238.315721),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'SEK', 'Cash', 21335.112757),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'USD', 'Cash', 194099.575117),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'USD', 'Fx', -9090000),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'USD', 'Investment', 37906164.42266),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'EUR', 'Investment', 1319830.272989),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'GBP', 'Investment', 570723.58209),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'NOK', 'Investment', 278914.477612),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'USD', 'Investment', 68371285.49159),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'CHF', 'Cash', 150343.174638),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'EUR', 'Cash', 266502.560192),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'EUR', 'Investment', 930253.977497),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'GBP', 'Cash', 155828.739514),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'JPY', 'Cash', 1445.537368),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'NOK', 'Cash', 24161.019719),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'NOK', 'Investment', 112.016085),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'SEK', 'Cash', 16715.873189),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'USD', 'Cash', 244357.500817),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'USD', 'Investment', 60246190.53518),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'CHF', 'Cash', 144623.597342),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'CHF', 'Fx', 10000000),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'CHF', 'Investment', 336591.176471),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'EUR', 'Cash', 111260.649308),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'EUR', 'Investment', 1094840.078723),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'GBP', 'Cash', 37905.272905),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'JPY', 'Cash', 2096.295348),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'NOK', 'Cash', 21425.345898),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'SEK', 'Cash', 21616.897266),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'USD', 'Cash', 188996.186948),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'USD', 'Fx', -8851000),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'USD', 'Investment', 38023287.48275),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'EUR', 'Investment', 1338396.614543),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'GBP', 'Investment', 571006.679105),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'NOK', 'Investment', 281370.671642),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'USD', 'Investment', 67065645.27984),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'CHF', 'Cash', 150343.174638),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'EUR', 'Cash', 265789.328903),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'EUR', 'Investment', 947143.895605),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'GBP', 'Cash', 155906.035516),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'JPY', 'Cash', 1421.652413),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'NOK', 'Cash', 24373.787994),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'NOK', 'Investment', 109.235777),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'SEK', 'Cash', 16936.648872),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'USD', 'Cash', 237932.69964),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'USD', 'Investment', 65349763.84968001),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-02', 'CHF', 'Equity', 24000),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'BCG', '000-1346-0F', 'CHF', 'Cash', 36000);

-- --------------------------------------------------------

--
-- Table structure for table `wa_custodian`
--

CREATE TABLE `wa_custodian` (
  `client_code` varchar(3) NOT NULL,
  `period_date` date NOT NULL,
  `valuation_currency` varchar(3) NOT NULL,
  `valuation_method` varchar(5) NOT NULL,
  `account` varchar(20) NOT NULL,
  `custodian_name` varchar(20) NOT NULL,
  `kfp_asset_class` varchar(20) NOT NULL,
  `value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wa_custodian`
--

INSERT INTO `wa_custodian` (`client_code`, `period_date`, `valuation_currency`, `valuation_method`, `account`, `custodian_name`, `kfp_asset_class`, `value`) VALUES
('DUM', '2020-11-30', 'CHF', 'VALUE', '0240-123456-01', 'UBS', 'Bond', 1291842.6948),
('DUM', '2020-11-30', 'CHF', 'VALUE', '0240-123456-01', 'UBS', 'Cash', 532873.807059),
('DUM', '2020-11-30', 'CHF', 'VALUE', '0240-123456-01', 'UBS', 'Commodity', 865603.232913),
('DUM', '2020-11-30', 'CHF', 'VALUE', '0240-123456-01', 'UBS', 'Equity', 1182885.064091),
('DUM', '2020-11-30', 'CHF', 'VALUE', '0240-123456-01', 'UBS', 'Fx', 910000),
('DUM', '2020-11-30', 'CHF', 'VALUE', '0240-123456-01', 'UBS', 'Hedge Fund', 1876482.449762),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'DUM PE 00', 'Private Holding', 'Private Equity', 6739858.631198),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'DUM PE 00', 'Private Holding', 'Real Estate', 2266738.250652),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'S 0947-123456-01', 'Crédit Suisse', 'Bond', 1813843.3905),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'S 0947-123456-01', 'Crédit Suisse', 'Cash', 859354.405437),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'S 0947-123456-01', 'Crédit Suisse', 'Commodity', 1724938.846667),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'S 0947-123456-01', 'Crédit Suisse', 'Equity', 1666392.557163),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'S 0947-123456-01', 'Crédit Suisse', 'Hedge Fund', 1749810.25277),
('DUM', '2020-12-31', 'CHF', 'VALUE', '0240-123456-01', 'UBS', 'Bond', 1283828.23365),
('DUM', '2020-12-31', 'CHF', 'VALUE', '0240-123456-01', 'UBS', 'Cash', 527924.245015),
('DUM', '2020-12-31', 'CHF', 'VALUE', '0240-123456-01', 'UBS', 'Commodity', 880981.652854),
('DUM', '2020-12-31', 'CHF', 'VALUE', '0240-123456-01', 'UBS', 'Equity', 1197019.377015),
('DUM', '2020-12-31', 'CHF', 'VALUE', '0240-123456-01', 'UBS', 'Fx', 1149000),
('DUM', '2020-12-31', 'CHF', 'VALUE', '0240-123456-01', 'UBS', 'Hedge Fund', 1871930.73995),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'DUM PE 00', 'Private Holding', 'Private Equity', 6606464.898125),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'DUM PE 00', 'Private Holding', 'Real Estate', 2290873.595149),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'S 0947-123456-01', 'Crédit Suisse', 'Bond', 1804589.46),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'S 0947-123456-01', 'Crédit Suisse', 'Cash', 852703.327976),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'S 0947-123456-01', 'Crédit Suisse', 'Commodity', 1801511.024119),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'S 0947-123456-01', 'Crédit Suisse', 'Equity', 1676596.505956),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'S 0947-123456-01', 'Crédit Suisse', 'Hedge Fund', 2199532.526275),
('DUM', '2020-11-30', 'CHF', 'DELTA', '0240-123456-01', 'UBS', 'Bond', 1291842.6948),
('DUM', '2020-11-30', 'CHF', 'DELTA', '0240-123456-01', 'UBS', 'Cash', 532873.807059),
('DUM', '2020-11-30', 'CHF', 'DELTA', '0240-123456-01', 'UBS', 'Commodity', 86560323.29130001),
('DUM', '2020-11-30', 'CHF', 'DELTA', '0240-123456-01', 'UBS', 'Equity', 1182885.064091),
('DUM', '2020-11-30', 'CHF', 'DELTA', '0240-123456-01', 'UBS', 'Fx', 910000),
('DUM', '2020-11-30', 'CHF', 'DELTA', '0240-123456-01', 'UBS', 'Hedge Fund', 1876482.449762),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'DUM PE 00', 'Private Holding', 'Private Equity', 6739858.631198),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'DUM PE 00', 'Private Holding', 'Real Estate', 2266738.250652),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'S 0947-123456-01', 'Crédit Suisse', 'Bond', 1813843.3905),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'S 0947-123456-01', 'Crédit Suisse', 'Cash', 859354.405437),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'S 0947-123456-01', 'Crédit Suisse', 'Commodity', 172493884.6667),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'S 0947-123456-01', 'Crédit Suisse', 'Equity', 1666392.557163),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'S 0947-123456-01', 'Crédit Suisse', 'Hedge Fund', 1749810.25277),
('DUM', '2020-12-31', 'CHF', 'DELTA', '0240-123456-01', 'UBS', 'Bond', 1283828.23365),
('DUM', '2020-12-31', 'CHF', 'DELTA', '0240-123456-01', 'UBS', 'Cash', 527924.245015),
('DUM', '2020-12-31', 'CHF', 'DELTA', '0240-123456-01', 'UBS', 'Commodity', 88098165.2854),
('DUM', '2020-12-31', 'CHF', 'DELTA', '0240-123456-01', 'UBS', 'Equity', 1197019.377015),
('DUM', '2020-12-31', 'CHF', 'DELTA', '0240-123456-01', 'UBS', 'Fx', 1149000),
('DUM', '2020-12-31', 'CHF', 'DELTA', '0240-123456-01', 'UBS', 'Hedge Fund', 1871930.73995),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'DUM PE 00', 'Private Holding', 'Private Equity', 6606464.898125),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'DUM PE 00', 'Private Holding', 'Real Estate', 2290873.595149),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'S 0947-123456-01', 'Crédit Suisse', 'Bond', 1804589.46),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'S 0947-123456-01', 'Crédit Suisse', 'Cash', 852703.327976),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'S 0947-123456-01', 'Crédit Suisse', 'Commodity', 180151102.4119),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'S 0947-123456-01', 'Crédit Suisse', 'Equity', 1676596.505956),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'S 0947-123456-01', 'Crédit Suisse', 'Hedge Fund', 2199532.526275),
('DUM', '2020-12-31', 'CHF', 'VALUE', '0240-123456-02', 'UBS', 'Equity', 24000),
('', '0000-00-00', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wa_par_base_currency`
--

CREATE TABLE `wa_par_base_currency` (
  `base_currency` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wa_par_base_currency`
--

INSERT INTO `wa_par_base_currency` (`base_currency`) VALUES
('CHF');

-- --------------------------------------------------------

--
-- Table structure for table `wa_par_valuation_date`
--

CREATE TABLE `wa_par_valuation_date` (
  `valuation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wa_par_valuation_date`
--

INSERT INTO `wa_par_valuation_date` (`valuation_date`) VALUES
('2021-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `wa_par_valuation_method`
--

CREATE TABLE `wa_par_valuation_method` (
  `method` varchar(20) NOT NULL,
  `value` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wa_par_valuation_method`
--

INSERT INTO `wa_par_valuation_method` (`method`, `value`) VALUES
('Market value', 'VALUE'),
('Exposure delta', 'DELTA');

-- --------------------------------------------------------

--
-- Table structure for table `wa_portfolio`
--

CREATE TABLE `wa_portfolio` (
  `client_code` varchar(3) NOT NULL,
  `period_date` date NOT NULL,
  `valuation_currency` varchar(3) NOT NULL,
  `valuation_method` varchar(5) NOT NULL,
  `account` varchar(20) NOT NULL,
  `kfp_asset_class` varchar(20) NOT NULL,
  `mtd_value` double NOT NULL,
  `mtd_pl` double NOT NULL,
  `ytd_pl` double NOT NULL,
  `mtd_percentage` double NOT NULL,
  `ytd_percentage` double NOT NULL,
  `mtd_benchmark` double NOT NULL DEFAULT '0',
  `ytd_benchmark` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wa_portfolio`
--

INSERT INTO `wa_portfolio` (`client_code`, `period_date`, `valuation_currency`, `valuation_method`, `account`, `kfp_asset_class`, `mtd_value`, `mtd_pl`, `ytd_pl`, `mtd_percentage`, `ytd_percentage`, `mtd_benchmark`, `ytd_benchmark`) VALUES
('DUM', '2020-11-30', 'CHF', 'VALUE', '0240-123456-01', 'Bond', 1291842.6948, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'S 0947-123456-01', 'Bond', 1804589.46, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'VALUE', '0240-123456-01', 'Cash', 532873.807059, 1295.1010459, -3654.4609979, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'DUM PE 00', 'Private Equity', 6606464.898125, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'DUM PE 00', 'Real Estate', 2290873.595149, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'DUM PE 00', 'Real Estate', 2266738.250652, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'VALUE', '0240-123456-01', 'Hedge Fund', 1876482.449762, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'S 0947-123456-01', 'Cash', 852703.327976, -6651.0774595, -3286.7930875, -0.007739, -0.003824, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'S 0947-123456-01', 'Equity', 1666392.557163, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'VALUE', '0240-123456-01', 'Hedge Fund', 1871930.73995, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'VALUE', '0240-123456-01', 'Equity', 1197019.377015, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'S 0947-123456-01', 'Commodity', 1724938.846667, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'VALUE', '0240-123456-01', 'Fx', 910000, 38500, 277500, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'S 0947-123456-01', 'Hedge Fund', 2199532.526275, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'DUM PE 00', 'Private Equity', 6739858.631198, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'VALUE', '0240-123456-01', 'Equity', 1182885.064091, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'VALUE', '0240-123456-01', 'Commodity', 880981.652854, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'VALUE', '0240-123456-01', 'Commodity', 865603.232913, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'S 0947-123456-01', 'Commodity', 1801511.024119, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'VALUE', '0240-123456-01', 'Fx', 1149000, 239000, 277500, 0.262637, 0.304945, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'S 0947-123456-01', 'Bond', 1813843.3905, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'VALUE', '0240-123456-01', 'Bond', 1283828.23365, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'VALUE', '0240-123456-01', 'Cash', 527924.245015, -4949.5620438, -3654.4609979, -0.009288, -0.006858, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'S 0947-123456-01', 'Equity', 1676596.505956, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'S 0947-123456-01', 'Cash', 859354.405437, 3364.284372, -3286.7930875, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'VALUE', 'S 0947-123456-01', 'Hedge Fund', 1749810.25277, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'DELTA', '0240-123456-01', 'Bond', 1291842.6948, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'S 0947-123456-01', 'Bond', 1804589.46, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'DELTA', '0240-123456-01', 'Cash', 532873.807059, 1295.1010459, -3654.4609979, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'DUM PE 00', 'Private Equity', 6606464.898125, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'DUM PE 00', 'Real Estate', 2290873.595149, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'DUM PE 00', 'Real Estate', 2266738.250652, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'DELTA', '0240-123456-01', 'Hedge Fund', 1876482.449762, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'S 0947-123456-01', 'Cash', 852703.327976, -6651.0774595, -3286.7930875, -0.007739, -0.003824, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'S 0947-123456-01', 'Equity', 1666392.557163, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'DELTA', '0240-123456-01', 'Hedge Fund', 1871930.73995, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'DELTA', '0240-123456-01', 'Equity', 1197019.377015, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'S 0947-123456-01', 'Commodity', 17249388.46667, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'DELTA', '0240-123456-01', 'Fx', 910000, 38500, 277500, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'S 0947-123456-01', 'Hedge Fund', 2199532.526275, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'DUM PE 00', 'Private Equity', 6739858.631198, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'DELTA', '0240-123456-01', 'Equity', 1182885.064091, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'DELTA', '0240-123456-01', 'Commodity', 8809816.52854, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'DELTA', '0240-123456-01', 'Commodity', 8656032.329130001, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'S 0947-123456-01', 'Commodity', 18015110.24119, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'DELTA', '0240-123456-01', 'Fx', 1149000, 239000, 277500, 0.262637, 0.304945, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'S 0947-123456-01', 'Bond', 1813843.3905, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'DELTA', '0240-123456-01', 'Bond', 1283828.23365, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'DELTA', '0240-123456-01', 'Cash', 527924.245015, -4949.5620438, -3654.4609979, -0.009288, -0.006858, 0.0005, 0.0005),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'S 0947-123456-01', 'Equity', 1676596.505956, 0, 0, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'S 0947-123456-01', 'Cash', 859354.405437, 3364.284372, -3286.7930875, 0, 0, 0.0005, 0.0005),
('DUM', '2020-11-30', 'CHF', 'DELTA', 'S 0947-123456-01', 'Hedge Fund', 1749810.25277, 0, 0, 0, 0, 0.0005, 0.0005);

-- --------------------------------------------------------

--
-- Table structure for table `wa_position`
--

CREATE TABLE `wa_position` (
  `client_code` varchar(3) NOT NULL,
  `period_date` date NOT NULL,
  `valuation_currency` varchar(3) NOT NULL,
  `valuation_method` varchar(5) NOT NULL,
  `custodian` varchar(20) NOT NULL,
  `account` varchar(20) NOT NULL,
  `kfp_asset_class` varchar(20) NOT NULL,
  `instrument_name` varchar(100) NOT NULL,
  `quantity` double NOT NULL,
  `last_purchase` date DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `cost_price` double NOT NULL,
  `valuation_price` double NOT NULL,
  `cost_local` double NOT NULL,
  `valuation_local` double NOT NULL,
  `valuation_base` double NOT NULL,
  `mtd_pl` double NOT NULL,
  `ytd_pl` double NOT NULL,
  `mtd_return` double NOT NULL,
  `ytd_return` double NOT NULL,
  `sp_return` double NOT NULL,
  `interest` double NOT NULL,
  `dividend` double NOT NULL,
  `commission` double NOT NULL,
  `tax` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wa_position`
--

INSERT INTO `wa_position` (`client_code`, `period_date`, `valuation_currency`, `valuation_method`, `custodian`, `account`, `kfp_asset_class`, `instrument_name`, `quantity`, `last_purchase`, `currency`, `cost_price`, `valuation_price`, `cost_local`, `valuation_local`, `valuation_base`, `mtd_pl`, `ytd_pl`, `mtd_return`, `ytd_return`, `sp_return`, `interest`, `dividend`, `commission`, `tax`) VALUES
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Private Equity', 'TrueNoord [PRH]', 716417.9104, '2031-10-20', 'EUR', 1, 1.184507048, 776310.4478, 848602.0657, 919545.1984, 0, 0, 0, -0.095797, 0.184507, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'ISHARES US HEALTHCARE ETF [UBS]', 1579.963235, '2031-10-20', 'USD', 194.6355, 245.77, 272183.2385, 388307.5643, 343691.0252, 0, 0, 0.033602, 0.139248, 0.262719, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'UBISOFT Entertainment [CRS]', 1439.338235, '2031-10-20', 'EUR', 66.89, 78.84, 104046.9155, 113477.4265, 122635.0548, 0, 0, -0.011783, 0, 0.178651, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'European euro [CRS]', 245941.8237, NULL, 'EUR', 1, 1, 265789.3289, 245941.8237, 265789.3289, -713.2312888, 1229.709119, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Private Equity', 'General Atlantic Invt Partners I [PRH]', 2440298.507, '2031-10-20', 'USD', 1, 1, 2159908.209, 2440298.507, 2159908.209, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'Japanese yen [UBS]', 244580.0196, NULL, 'JPY', 1, 1, 2096.295348, 244580.0196, 2096.295348, -35.2195228, -40.4779932, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'TOTAL [UBS]', 1477.941176, '2031-10-20', 'EUR', 34.2362, 35.3, 54682.43625, 52171.32353, 56381.54934, 0, 0, -0.014655, -0.282521, 0.031072, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Pound sterling [CRS]', 128826.6696, NULL, 'GBP', 1, 1, 155906.0355, 128826.6696, 155906.0355, 77.2960017, 1571.685369, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Private Equity', 'Nerdwallet [PRH]', 1841417.91, '2031-10-20', 'USD', 2, 1, 3347697.761, 1841417.91, 1673848.881, 0, 0, 0, 0, -0.5, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'VISA INC [UBS]', 237.1323529, '2031-10-20', 'USD', 142.89, 210.35, 30800.4123, 49880.79044, 45341.63851, 0, 0, 0.157613, 0.119478, 0.472111, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'AB SICAV I-Eurozone Equity Portfolio A EUR [CRS]', 570.7720588, '2031-10-20', 'EUR', 108.82, 107.88, 67123.80667, 61574.88971, 66543.98331, 0, 0, 0.034423, -0.038589, -0.008639, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'Norwegian krone [UBS]', 207811.3084, NULL, 'NOK', 1, 1, 21425.3459, 207811.3084, 21425.3459, 187.0301776, 820.8546683, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'Xtrackers MSCI World Information Technology UCITS ETF 1C [UBS]', 2553.308824, '2031-10-20', 'USD', 30.19, 52.23, 68227.39658, 133359.3199, 118036.334, 0, 0, 0.058895, 0.438272, 0.730043, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'Xtrackers MSCI World Information Technology UCITS ETF 1C [UBS]', 2553.308824, '2031-10-20', 'USD', 30.19, 49.325, 70069.71358, 125941.9577, 114481.2396, 0, 0, 0.125586, 0.358276, 0.633819, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Private Equity', 'TrueNoord [PRH]', 716417.9104, '2031-10-20', 'EUR', 1, 1.213049572, 774232.8358, 869050.4382, 939182.8086, 0, 0, 0.024096, -0.074008, 0.213049, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fixed Income', 'Pareto Nordic Corporate Bond H - EUR [UBS]', 2500, '2031-10-20', 'EUR', 105.778, 110.43, 285785.7115, 276075, 298354.2525, 0, 0, 0.00868, 0.002951, 0.043978, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'APRILA BANK [CRS]', 146.1397059, '2031-10-20', 'NOK', 14.54, 7.5, 217.161849, 1096.047794, 112.016085, 0, 0, 0.071428, 0.034482, -0.484182, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'Unibail-Rodamco-Westfield SE [CRS]', 1607.536765, '2031-10-20', 'EUR', 58.5973, 64.58, 101799.0373, 103814.7243, 112192.5725, 0, 0, 0.085378, 0, 0.102098, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Real Estate', 'Kremmergaarden Invest AS [PRH]', 10.29850746, '2031-10-20', 'NOK', 530000, 265000, 562741.3433, 2729104.478, 281370.6716, 0, 0, 0, 0, -0.5, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'Novo Nordisk A/S [CRS]', 100000, '2031-10-20', 'EUR', 102.24, 102.95, 11049076.8, 102950, 111258.065, 0, 0, 0.008028, 0, 0.006944, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Commodity', 'SPDR Gold Shares [CRS]', 11475.81441, '2031-10-20', 'USD', 337.8764, 165.358416, 3524562.836, 1897622.494, 1724938.847, 0, 0, -0.063731, 0, -0.510595, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'Lumyna - Ramius Merger Arbitrage UCITS Fund [UBS]', 1943.933824, '2031-10-20', 'EUR', 105.76, 111.3, 222181.5898, 216359.8346, 233820.0732, 0, 0, 0.014492, 0.016809, 0.052382, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'AB SICAV I-Eurozone Equity Portfolio A EUR [CRS]', 570.7720588, '2031-10-20', 'EUR', 108.82, 104.29, 67303.92977, 59525.81802, 64502.1764, 0, 0, 0.181354, -0.070582, -0.041629, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fx', 'USD / CHF Purchase / Value date 08.01.2021 [UBS]', 10000000, NULL, 'CHF', 1, 1, 10000000, 10000000, 10000000, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'SWISS LIFE HLD [UBS]', 816.1764706, '2031-10-20', 'CHF', 387.03, 405.8, 315884.7794, 331204.4118, 331204.4118, 0, 0, 0.316677, -0.164677, 0.048497, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Absolute Return', 'Protea UCITS II-ECO Advisors ESG Absolute Return F EUR Acc [UBS]', 2109.224856, '2031-10-20', 'EUR', 104.14, 104.72, 237380.8089, 220878.0269, 238702.8837, 0, 0, -0.010396, 0.030404, 0.005569, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'Vontobel Fund Emerging Markets Debt B (USD) [CRS]', 5000, '2031-10-20', 'EUR', 106.5, 97.27, 577017, 486350, 527008.86, 0, 0, 0.050091, 0, -0.086667, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'United States dollar [UBS]', 213530.8857, NULL, 'USD', 1, 1, 188996.1869, 213530.8857, 188996.1869, -5103.388169, -5925.482079, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Real Estate', 'Belval [PRH]', 369402.9851, '2031-10-20', 'EUR', 1, 1, 399213.806, 369402.9851, 399213.806, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'AMAZON COM [CRS]', 477.0220588, '2031-10-20', 'USD', 1927.47, 3256.93, 813801.3959, 1553627.454, 1375115.66, 0, 0, 0.028058, 0, 0.689743, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Absolute Return', 'RAGING CAP OFF 1 B 35 USD UNR [CRS]', 2070.787956, '2031-10-20', 'USD', 1157.141387, 1200.0585, 2120871.706, 2485066.689, 2199532.526, 0, 0, 0.290954, -0.134735, 0.037088, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fixed Income', 'GRAY TELEVISIO [UBS]', 100000, '2031-10-20', 'USD', 105.53, 104.75, 9592677, 104750, 95217.75, 0, 0, 0.012077, 0, -0.007392, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Absolute Return', 'Protea UCITS II-ECO Advisors ESG Absolute Return F EUR Acc [UBS]', 2109.224856, '2031-10-20', 'EUR', 104.14, 105.82, 238017.8074, 223198.1742, 241857.5416, 0, 0, 0.001609, 0.041227, 0.016132, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Commodity', 'VanEck Vectors Gold Miners UCITS ETF [UBS]', 26024.18559, '2031-10-20', 'USD', 30.601, 38.247, 704863.6379, 995347.0262, 880981.6529, 0, 0, 0.045248, 0.230883, 0.249861, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'European euro [UBS]', 102952.3913, NULL, 'EUR', 1, 1, 111559.2112, 102952.3913, 111559.2112, 813.3238915, 514.7619566, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Absolute Return', 'KNIGHTHEAD OFFS B1 SUB-CL 2 $ [UBS]', 675.0480461, '2031-10-20', 'USD', 1122.446979, 2450.8643, 688754.4268, 1654451.157, 1503896.102, 0, 0, 0.084947, 0.11758, 1.183501, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'SPDR® S&P® U.S. Health Care Select Sector UCITS ETF (Acc) [UBS]', 2150.735294, '2031-10-20', 'USD', 25.81, 31.6567, 50459.02445, 68085.18199, 61889.43042, 0, 0, 0.078721, 0.087545, 0.226528, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'AMAZON COM [CRS]', 477.0220588, '2031-10-20', 'USD', 1927.47, 3168.04, 835776.1483, 1511224.963, 1373703.492, 0, 0, 0.043439, 0, 0.643626, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Private Equity', 'Strategic Value Global Opportunities [PRH]', 2121268.657, '2031-10-20', 'USD', 1, 1, 1877534.888, 2121268.657, 1877534.888, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Absolute Return', 'AKO GLOBAL UCITS -A2- USD 02.01.19 [UBS]', 857.6233184, '2031-10-20', 'USD', 125.468635, 167.691416, 97812.78784, 143816.0687, 130728.8064, 0, 0, 0, 0.092229, 0.33652, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Norwegian krone [CRS]', 236409.1949, NULL, 'NOK', 1, 1, 24161.01972, 236409.1949, 24161.01972, 721.0480444, 933.8163198, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'TOTAL [UBS]', 1477.941176, '2031-10-20', 'EUR', 34.2362, 35.825, 54829.17361, 52947.24265, 57373.63213, 0, 0, 0, -0.27185, 0.046407, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'Lumyna - Ramius Merger Arbitrage UCITS Fund [UBS]', 1943.933824, '2031-10-20', 'EUR', 105.76, 109.71, 222777.8021, 213268.9798, 231098.2665, 0, 0, 0.038428, 0.002283, 0.037348, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Swiss franc [CRS]', 150343.1746, NULL, 'CHF', 1, 1, 150343.1746, 150343.1746, 150343.1746, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'iShares $Corp Bd Interest Rate Hgd UCITS ETF USD(Dist) [CRS]', 125000, '2031-10-20', 'USD', 5.484, 5.526, 606736.05, 690750, 611382.825, 0, 0, 0.008522, 0.007217, 0.007658, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fixed Income', 'SOTHEBYS [UBS]', 250000, '2031-10-20', 'USD', 100.81, 99.625, 22306732.75, 249062.5, 220445.2188, 0, 0, 0.013994, -0.011167, -0.011755, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'UNIFIN [CRS]', 200000, '2031-10-20', 'USD', 82.940825, 98, 14682184.84, 196000, 173479.6, 0, 0, 0.053763, 0, 0.181565, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'Swiss franc [UBS]', 144623.5973, NULL, 'CHF', 1, 1, 144623.5973, 144623.5973, 144623.5973, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Absolute Return', 'RAGING CAP OFF 1 B 35 USD UNR [CRS]', 2070.787956, '2031-10-20', 'USD', 1157.141387, 929.59, 2178140.753, 1924983.776, 1749810.253, 0, 0, 0, -0.329748, -0.19665, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'Nuance Communications Inc [CRS]', 400000, '2031-10-20', 'USD', 106.499, 105.75, 38723036.4, 423000, 384507, 0, 0, 0.007142, 0, -0.007033, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'United States dollar [UBS]', 213530.8857, NULL, 'USD', 1, 1, 194099.5751, 213530.8857, 194099.5751, -822.09391, -5925.482079, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fixed Income', 'GRAY TELEVISIO [UBS]', 100000, '2031-10-20', 'USD', 105.53, 104.555, 9340460.3, 104555, 92541.6305, 0, 0, -0.001862, 0, -0.00924, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Swedish krona [CRS]', 157696.9169, NULL, 'SEK', 1, 1, 16715.87319, 157696.9169, 16715.87319, 244.4302212, 465.2059048, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fixed Income', 'GENERAL FINAN [UBS]', 250000, '2031-10-20', 'USD', 101.25407, 100.641, 23009987.41, 251602.5, 228706.6725, 0, 0, 0.002789, -0.003535, -0.006055, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'Pound sterling [UBS]', 31321.49472, NULL, 'GBP', 1, 1, 37886.48001, 31321.49472, 37886.48001, 363.3293387, 382.1222355, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'ISHARES US HEALTHCARE ETF [UBS]', 1579.963235, '2031-10-20', 'USD', 194.6355, 237.78, 279532.8933, 375683.6581, 341496.4452, 0, 0, 0.082491, 0.102211, 0.221668, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fixed Income', 'Pareto Nordic Corporate Bond H - EUR [UBS]', 2500, '2031-10-20', 'EUR', 105.778, 109.4797, 286552.602, 273699.25, 296580.5073, 0, 0, 0.014298, -0.00568, 0.034994, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Private Equity', 'Strategic Value Global Opportunities [PRH]', 2121268.657, '2031-10-20', 'USD', 1, 1, 1928233.209, 2121268.657, 1928233.209, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Real Estate', 'Mansford Opportunity Fund III [PRH]', 471828.3582, '2031-10-20', 'GBP', 1, 1, 570723.5821, 471828.3582, 570723.5821, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Private Equity', 'Nerdwallet [PRH]', 1841417.91, '2031-10-20', 'USD', 2, 1, 3259677.985, 1841417.91, 1629838.993, 0, 0, 0, 0, -0.5, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Swiss franc [CRS]', 150343.1746, NULL, 'CHF', 1, 1, 150343.1746, 150343.1746, 150343.1746, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Pound sterling [CRS]', 128826.6696, NULL, 'GBP', 1, 1, 155828.7395, 128826.6696, 155828.7395, 1494.389367, 1571.685369, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fixed Income', 'GENERAL FINAN [UBS]', 250000, '2031-10-20', 'USD', 101.25407, 100.774, 22404994.34, 251935, 222987.6685, 0, 0, 0.001321, -0.002218, -0.004742, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'Norwegian krone [UBS]', 207811.3084, NULL, 'NOK', 1, 1, 21238.31572, 207811.3084, 21238.31572, 633.8244907, 820.8546683, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Commodity', 'VanEck Vectors Gold Miners UCITS ETF [UBS]', 26024.18559, '2031-10-20', 'USD', 30.601, 36.5913, 723896.7878, 952258.7821, 865603.2329, 0, 0, -0.076933, 0.177599, 0.195755, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fixed Income', 'SOTHEBYS [UBS]', 250000, '2031-10-20', 'USD', 100.81, 98.25, 22909072.5, 245625, 223273.125, 0, 0, 0.02745, -0.024814, -0.025395, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'Swiss franc [UBS]', 144623.5973, NULL, 'CHF', 1, 1, 144623.5973, 144623.5973, 144623.5973, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'iShares $Corp Bd Interest Rate Hgd UCITS ETF USD(Dist) [CRS]', 125000, '2031-10-20', 'USD', 5.484, 5.4793, 623119.5, 684912.5, 622585.4625, 0, 0, 0.028126, -0.001295, -0.000858, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Real Estate', 'Belval [PRH]', 369402.9851, '2031-10-20', 'EUR', 1, 1, 400285.0746, 369402.9851, 400285.0746, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Commodity', 'SPDR Gold Shares [CRS]', 11475.81441, '2031-10-20', 'USD', 337.8764, 177.3622, 3431892.813, 2035375.691, 1801511.024, 0, 0, 0.072592, 0, -0.475068, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'United States dollar [CRS]', 268820.1329, NULL, 'USD', 1, 1, 244357.5008, 268820.1329, 244357.5008, -1034.957512, -7459.758688, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fx', 'USD / CHF Purchase / Value date 08.01.2021 [UBS]', -10000000, NULL, 'USD', 1, 1, -9090000, -10000000, -9090000, 38500, 277500, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'VISA INC [UBS]', 237.1323529, '2031-10-20', 'USD', 142.89, 218.73, 29990.58848, 51867.95956, 45908.33101, 0, 0, 0.039838, 0.164076, 0.530757, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fixed Income', 'PIMCO GIS Glo Invt Grd Crdt ECl USD Inc [UBS]', 20000, '2031-10-20', 'EUR', 12.25, 12.38, 264771.5, 247600, 267581.32, 0, 0, 0.000808, 0.011437, 0.010612, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Japanese yen [CRS]', 165867.7416, NULL, 'JPY', 1, 1, 1421.652413, 165867.7416, 1421.652413, -23.8849548, -27.4511112, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Real Estate', 'Kremmergaarden Invest AS [PRH]', 10.29850746, '2031-10-20', 'NOK', 530000, 265000, 557828.9552, 2729104.478, 278914.4776, 0, 0, 0, 0, -0.5, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'APRILA BANK [CRS]', 146.1397059, '2031-10-20', 'NOK', 14.54, 7.25, 219.074234, 1059.512868, 109.235777, 0, 0, -0.033334, 0, -0.501376, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'Novo Nordisk A/S [CRS]', 100000, '2031-10-20', 'EUR', 102.24, 102.13, 11078726.4, 102130, 110668.068, 0, 0, 0, 0, -0.001076, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Real Estate', 'Mansford Opportunity Fund III [PRH]', 471828.3582, '2031-10-20', 'GBP', 1, 1, 571006.6791, 471828.3582, 571006.6791, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'United States dollar [CRS]', 268820.1329, NULL, 'USD', 1, 1, 237932.6996, 268820.1329, 237932.6996, -6424.801177, -7459.758688, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'Pound sterling [UBS]', 31321.49472, NULL, 'GBP', 1, 1, 37905.27291, 31321.49472, 37905.27291, 18.7928968, 382.1222355, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Absolute Return', 'KNIGHTHEAD OFFS B1 SUB-CL 2 $ [UBS]', 675.0480461, '2031-10-20', 'USD', 1122.446979, 2516.4272, 670645.262, 1698709.265, 1503527.57, 0, 0, 0.02675, 0.147476, 1.241911, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fixed Income', 'UKREXIMBANK [UBS]', 200000, '2031-10-20', 'USD', 92.000672, 99, 16725722.17, 198000, 179982, 0, 0, 0, -0.001262, 0.076079, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'SWISS LIFE HLD [UBS]', 816.1764706, '2031-10-20', 'CHF', 387.03, 412.4, 315884.7794, 336591.1765, 336591.1765, 0, 0, 0.016264, -0.151091, 0.06555, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fixed Income', 'UKREXIMBANK [UBS]', 200000, '2031-10-20', 'USD', 92.000672, 102.767, 16285958.96, 205534, 181918.1434, 0, 0, 0.03805, 0.036741, 0.117024, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'European euro [CRS]', 245941.8237, NULL, 'EUR', 1, 1, 266502.5602, 245941.8237, 266502.5602, 1942.940408, 1229.709119, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Real Estate', 'MS Real Estate Offshore VII [PRH]', 17.63059701, '2031-10-20', 'USD', 63447, 66600, 990080.3734, 1174197.761, 1039282.438, 0, 0, 0, 0, 0.049695, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Norwegian krone [CRS]', 236409.1949, NULL, 'NOK', 1, 1, 24373.78799, 236409.1949, 24373.78799, 212.7682754, 933.8163198, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'Swedish krona [UBS]', 201274.6487, NULL, 'SEK', 1, 1, 21335.11276, 201274.6487, 21335.11276, 311.9757054, 593.7602135, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Private Equity', 'General Atlantic Invt Partners I [PRH]', 2440298.507, '2031-10-20', 'USD', 1, 1, 2218231.343, 2440298.507, 2218231.343, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fx', 'USD / CHF Purchase / Value date 08.01.2021 [UBS]', -10000000, NULL, 'USD', 1, 1, -8851000, -10000000, -8851000, 239000, 277500, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fx', 'USD / CHF Purchase / Value date 08.01.2021 [UBS]', 10000000, NULL, 'CHF', 1, 1, 10000000, 10000000, 10000000, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Japanese yen [CRS]', 165867.7416, NULL, 'JPY', 1, 1, 1445.537368, 165867.7416, 1445.537368, -3.5661564, -27.4511112, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Fixed Income', 'PIMCO GIS Glo Invt Grd Crdt ECl USD Inc [UBS]', 20000, '2031-10-20', 'EUR', 12.25, 12.37, 265482, 247400, 268082.64, 0, 0, 0.022314, 0.01062, 0.009795, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Absolute Return', 'AKO GLOBAL UCITS -A2- USD 02.01.19 [UBS]', 857.6233184, '2031-10-20', 'USD', 125.468635, 170.864568, 95241.03247, 146537.4378, 129700.2862, 0, 0, 0, 0.112897, 0.361811, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Equity', 'SPDR® S&P® U.S. Health Care Select Sector UCITS ETF (Acc) [UBS]', 2150.735294, '2031-10-20', 'USD', 25.81, 32.88, 49132.32403, 70716.17647, 62590.88779, 0, 0, 0.038642, 0.12957, 0.273924, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'Vontobel Fund Emerging Markets Debt B (USD) [CRS]', 5000, '2031-10-20', 'EUR', 106.5, 98.92, 575472.75, 494600, 534514.22, 0, 0, 0.016963, 0, -0.071174, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'Nuance Communications Inc [CRS]', 400000, '2031-10-20', 'USD', 106.499, 105.625, 37704905.96, 422500, 373954.75, 0, 0, -0.001183, 0, -0.008207, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'UNIFIN [CRS]', 200000, '2031-10-20', 'USD', 82.940825, 93, 15078641.99, 186000, 169074, 0, 0, 0.059829, 0, 0.121281, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'European euro [UBS]', 102952.3913, NULL, 'EUR', 1, 1, 111260.6493, 102952.3913, 111260.6493, -298.5619349, 514.7619566, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'Unibail-Rodamco-Westfield SE [CRS]', 1607.536765, '2031-10-20', 'EUR', 58.5973, 59.5, 102072.2095, 95648.4375, 103644.6469, 0, 0, 0, 0, 0.015405, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Swedish krona [CRS]', 157696.9169, NULL, 'SEK', 1, 1, 16936.64887, 157696.9169, 16936.64887, 220.7756836, 465.2059048, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'UBISOFT Entertainment [CRS]', 1439.338235, '2031-10-20', 'EUR', 66.89, 79.78, 104326.1197, 114830.4044, 124430.2262, 0, 0, 0.05334, 0, 0.192704, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'Private Holding', 'DUM PE 00', 'Real Estate', 'MS Real Estate Offshore VII [PRH]', 17.63059701, '2031-10-20', 'USD', 63447, 63447, 1016815.116, 1118608.489, 1016815.116, 0, 0, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'Japanese yen [UBS]', 244580.0196, NULL, 'JPY', 1, 1, 2131.514871, 244580.0196, 2131.514871, -5.2584704, -40.4779932, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-12-31', 'CHF', 'VALUE', 'UBS', '0240-123456-01', 'Cash', 'Swedish krona [UBS]', 201274.6487, NULL, 'SEK', 1, 1, 21616.89727, 201274.6487, 21616.89727, 281.7845081, 593.7602135, 0, 0, 0, 479.3518841, 479.3518841, 479.3518841, 479.3518841),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Private Equity', 'TrueNoord [PRH]', 716417.9104, '2031-10-20', 'EUR', 1, 1.184507048, 776310.4478, 848602.0657, 919545.1984, 0, 0, 0, -0.095797, 0.184507, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'ISHARES US HEALTHCARE ETF [UBS]', 1579.963235, '2031-10-20', 'USD', 194.6355, 245.77, 272183.2385, 388307.5643, 343691.0252, 0, 0, 0.033602, 0.139248, 0.262719, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'UBISOFT Entertainment [CRS]', 1439.338235, '2031-10-20', 'EUR', 66.89, 78.84, 104046.9155, 113477.4265, 122635.0548, 0, 0, -0.011783, 0, 0.178651, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'European euro [CRS]', 245941.8237, NULL, 'EUR', 1, 1, 265789.3289, 245941.8237, 265789.3289, -713.2312888, 1229.709119, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Private Equity', 'General Atlantic Invt Partners I [PRH]', 2440298.507, '2031-10-20', 'USD', 1, 1, 2159908.209, 2440298.507, 2159908.209, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'Japanese yen [UBS]', 244580.0196, NULL, 'JPY', 1, 1, 2096.295348, 244580.0196, 2096.295348, -35.2195228, -40.4779932, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'TOTAL [UBS]', 1477.941176, '2031-10-20', 'EUR', 34.2362, 35.3, 54682.43625, 52171.32353, 56381.54934, 0, 0, -0.014655, -0.282521, 0.031072, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Pound sterling [CRS]', 128826.6696, NULL, 'GBP', 1, 1, 155906.0355, 128826.6696, 155906.0355, 77.2960017, 1571.685369, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Private Equity', 'Nerdwallet [PRH]', 1841417.91, '2031-10-20', 'USD', 2, 1, 3347697.761, 1841417.91, 1673848.881, 0, 0, 0, 0, -0.5, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'VISA INC [UBS]', 237.1323529, '2031-10-20', 'USD', 142.89, 210.35, 30800.4123, 49880.79044, 45341.63851, 0, 0, 0.157613, 0.119478, 0.472111, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'AB SICAV I-Eurozone Equity Portfolio A EUR [CRS]', 570.7720588, '2031-10-20', 'EUR', 108.82, 107.88, 67123.80667, 61574.88971, 66543.98331, 0, 0, 0.034423, -0.038589, -0.008639, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'Norwegian krone [UBS]', 207811.3084, NULL, 'NOK', 1, 1, 21425.3459, 207811.3084, 21425.3459, 187.0301776, 820.8546683, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'Xtrackers MSCI World Information Technology UCITS ETF 1C [UBS]', 2553.308824, '2031-10-20', 'USD', 30.19, 52.23, 68227.39658, 133359.3199, 118036.334, 0, 0, 0.058895, 0.438272, 0.730043, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'Xtrackers MSCI World Information Technology UCITS ETF 1C [UBS]', 2553.308824, '2031-10-20', 'USD', 30.19, 49.325, 70069.71358, 125941.9577, 114481.2396, 0, 0, 0.125586, 0.358276, 0.633819, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Private Equity', 'TrueNoord [PRH]', 716417.9104, '2031-10-20', 'EUR', 1, 1.213049572, 774232.8358, 869050.4382, 939182.8086, 0, 0, 0.024096, -0.074008, 0.213049, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fixed Income', 'Pareto Nordic Corporate Bond H - EUR [UBS]', 2500, '2031-10-20', 'EUR', 105.778, 110.43, 285785.7115, 276075, 298354.2525, 0, 0, 0.00868, 0.002951, 0.043978, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'APRILA BANK [CRS]', 146.1397059, '2031-10-20', 'NOK', 14.54, 7.5, 217.161849, 1096.047794, 112.016085, 0, 0, 0.071428, 0.034482, -0.484182, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'Unibail-Rodamco-Westfield SE [CRS]', 1607.536765, '2031-10-20', 'EUR', 58.5973, 64.58, 101799.0373, 103814.7243, 112192.5725, 0, 0, 0.085378, 0, 0.102098, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Real Estate', 'Kremmergaarden Invest AS [PRH]', 10.29850746, '2031-10-20', 'NOK', 530000, 265000, 562741.3433, 2729104.478, 281370.6716, 0, 0, 0, 0, -0.5, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'Novo Nordisk A/S [CRS]', 100000, '2031-10-20', 'EUR', 102.24, 102.95, 11049076.8, 102950, 111258.065, 0, 0, 0.008028, 0, 0.006944, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Commodity', 'SPDR Gold Shares [CRS]', 11475.81441, '2031-10-20', 'USD', 337.8764, 165.358416, 3524562.836, 18976224.94, 17249388.47, 0, 0, -0.063731, 0, -0.510595, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'Lumyna - Ramius Merger Arbitrage UCITS Fund [UBS]', 1943.933824, '2031-10-20', 'EUR', 105.76, 111.3, 222181.5898, 216359.8346, 233820.0732, 0, 0, 0.014492, 0.016809, 0.052382, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'AB SICAV I-Eurozone Equity Portfolio A EUR [CRS]', 570.7720588, '2031-10-20', 'EUR', 108.82, 104.29, 67303.92977, 59525.81802, 64502.1764, 0, 0, 0.181354, -0.070582, -0.041629, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fx', 'USD / CHF Purchase / Value date 08.01.2021 [UBS]', 10000000, NULL, 'CHF', 1, 1, 10000000, 10000000, 10000000, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'SWISS LIFE HLD [UBS]', 816.1764706, '2031-10-20', 'CHF', 387.03, 405.8, 315884.7794, 331204.4118, 331204.4118, 0, 0, 0.316677, -0.164677, 0.048497, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Absolute Return', 'Protea UCITS II-ECO Advisors ESG Absolute Return F EUR Acc [UBS]', 2109.224856, '2031-10-20', 'EUR', 104.14, 104.72, 237380.8089, 220878.0269, 238702.8837, 0, 0, -0.010396, 0.030404, 0.005569, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'Vontobel Fund Emerging Markets Debt B (USD) [CRS]', 5000, '2031-10-20', 'EUR', 106.5, 97.27, 577017, 486350, 527008.86, 0, 0, 0.050091, 0, -0.086667, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'United States dollar [UBS]', 213530.8857, NULL, 'USD', 1, 1, 188996.1869, 213530.8857, 188996.1869, -5103.388169, -5925.482079, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Real Estate', 'Belval [PRH]', 369402.9851, '2031-10-20', 'EUR', 1, 1, 399213.806, 369402.9851, 399213.806, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'AMAZON COM [CRS]', 477.0220588, '2031-10-20', 'USD', 1927.47, 3256.93, 813801.3959, 1553627.454, 1375115.66, 0, 0, 0.028058, 0, 0.689743, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Absolute Return', 'RAGING CAP OFF 1 B 35 USD UNR [CRS]', 2070.787956, '2031-10-20', 'USD', 1157.141387, 1200.0585, 2120871.706, 2485066.689, 2199532.526, 0, 0, 0.290954, -0.134735, 0.037088, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fixed Income', 'GRAY TELEVISIO [UBS]', 100000, '2031-10-20', 'USD', 105.53, 104.75, 9592677, 104750, 95217.75, 0, 0, 0.012077, 0, -0.007392, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Absolute Return', 'Protea UCITS II-ECO Advisors ESG Absolute Return F EUR Acc [UBS]', 2109.224856, '2031-10-20', 'EUR', 104.14, 105.82, 238017.8074, 223198.1742, 241857.5416, 0, 0, 0.001609, 0.041227, 0.016132, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Commodity', 'VanEck Vectors Gold Miners UCITS ETF [UBS]', 26024.18559, '2031-10-20', 'USD', 30.601, 38.247, 704863.6379, 995347.0262, 880981.6529, 0, 0, 0.045248, 0.230883, 0.249861, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'European euro [UBS]', 102952.3913, NULL, 'EUR', 1, 1, 111559.2112, 102952.3913, 111559.2112, 813.3238915, 514.7619566, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Absolute Return', 'KNIGHTHEAD OFFS B1 SUB-CL 2 $ [UBS]', 675.0480461, '2031-10-20', 'USD', 1122.446979, 2450.8643, 688754.4268, 1654451.157, 1503896.102, 0, 0, 0.084947, 0.11758, 1.183501, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'SPDR® S&P® U.S. Health Care Select Sector UCITS ETF (Acc) [UBS]', 2150.735294, '2031-10-20', 'USD', 25.81, 31.6567, 50459.02445, 68085.18199, 61889.43042, 0, 0, 0.078721, 0.087545, 0.226528, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'AMAZON COM [CRS]', 477.0220588, '2031-10-20', 'USD', 1927.47, 3168.04, 835776.1483, 1511224.963, 1373703.492, 0, 0, 0.043439, 0, 0.643626, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Private Equity', 'Strategic Value Global Opportunities [PRH]', 2121268.657, '2031-10-20', 'USD', 1, 1, 1877534.888, 2121268.657, 1877534.888, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Absolute Return', 'AKO GLOBAL UCITS -A2- USD 02.01.19 [UBS]', 857.6233184, '2031-10-20', 'USD', 125.468635, 167.691416, 97812.78784, 143816.0687, 130728.8064, 0, 0, 0, 0.092229, 0.33652, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Norwegian krone [CRS]', 236409.1949, NULL, 'NOK', 1, 1, 24161.01972, 236409.1949, 24161.01972, 721.0480444, 933.8163198, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'TOTAL [UBS]', 1477.941176, '2031-10-20', 'EUR', 34.2362, 35.825, 54829.17361, 52947.24265, 57373.63213, 0, 0, 0, -0.27185, 0.046407, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'Lumyna - Ramius Merger Arbitrage UCITS Fund [UBS]', 1943.933824, '2031-10-20', 'EUR', 105.76, 109.71, 222777.8021, 213268.9798, 231098.2665, 0, 0, 0.038428, 0.002283, 0.037348, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Swiss franc [CRS]', 150343.1746, NULL, 'CHF', 1, 1, 150343.1746, 150343.1746, 150343.1746, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'iShares $Corp Bd Interest Rate Hgd UCITS ETF USD(Dist) [CRS]', 125000, '2031-10-20', 'USD', 5.484, 5.526, 606736.05, 690750, 611382.825, 0, 0, 0.008522, 0.007217, 0.007658, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fixed Income', 'SOTHEBYS [UBS]', 250000, '2031-10-20', 'USD', 100.81, 99.625, 22306732.75, 249062.5, 220445.2188, 0, 0, 0.013994, -0.011167, -0.011755, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'UNIFIN [CRS]', 200000, '2031-10-20', 'USD', 82.940825, 98, 14682184.84, 196000, 173479.6, 0, 0, 0.053763, 0, 0.181565, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'Swiss franc [UBS]', 144623.5973, NULL, 'CHF', 1, 1, 144623.5973, 144623.5973, 144623.5973, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Absolute Return', 'RAGING CAP OFF 1 B 35 USD UNR [CRS]', 2070.787956, '2031-10-20', 'USD', 1157.141387, 929.59, 2178140.753, 1924983.776, 1749810.253, 0, 0, 0, -0.329748, -0.19665, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'Nuance Communications Inc [CRS]', 400000, '2031-10-20', 'USD', 106.499, 105.75, 38723036.4, 423000, 384507, 0, 0, 0.007142, 0, -0.007033, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'United States dollar [UBS]', 213530.8857, NULL, 'USD', 1, 1, 194099.5751, 213530.8857, 194099.5751, -822.09391, -5925.482079, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fixed Income', 'GRAY TELEVISIO [UBS]', 100000, '2031-10-20', 'USD', 105.53, 104.555, 9340460.3, 104555, 92541.6305, 0, 0, -0.001862, 0, -0.00924, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Swedish krona [CRS]', 157696.9169, NULL, 'SEK', 1, 1, 16715.87319, 157696.9169, 16715.87319, 244.4302212, 465.2059048, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fixed Income', 'GENERAL FINAN [UBS]', 250000, '2031-10-20', 'USD', 101.25407, 100.641, 23009987.41, 251602.5, 228706.6725, 0, 0, 0.002789, -0.003535, -0.006055, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'Pound sterling [UBS]', 31321.49472, NULL, 'GBP', 1, 1, 37886.48001, 31321.49472, 37886.48001, 363.3293387, 382.1222355, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'ISHARES US HEALTHCARE ETF [UBS]', 1579.963235, '2031-10-20', 'USD', 194.6355, 237.78, 279532.8933, 375683.6581, 341496.4452, 0, 0, 0.082491, 0.102211, 0.221668, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fixed Income', 'Pareto Nordic Corporate Bond H - EUR [UBS]', 2500, '2031-10-20', 'EUR', 105.778, 109.4797, 286552.602, 273699.25, 296580.5073, 0, 0, 0.014298, -0.00568, 0.034994, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Private Equity', 'Strategic Value Global Opportunities [PRH]', 2121268.657, '2031-10-20', 'USD', 1, 1, 1928233.209, 2121268.657, 1928233.209, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Real Estate', 'Mansford Opportunity Fund III [PRH]', 471828.3582, '2031-10-20', 'GBP', 1, 1, 570723.5821, 471828.3582, 570723.5821, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Private Equity', 'Nerdwallet [PRH]', 1841417.91, '2031-10-20', 'USD', 2, 1, 3259677.985, 1841417.91, 1629838.993, 0, 0, 0, 0, -0.5, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Swiss franc [CRS]', 150343.1746, NULL, 'CHF', 1, 1, 150343.1746, 150343.1746, 150343.1746, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Pound sterling [CRS]', 128826.6696, NULL, 'GBP', 1, 1, 155828.7395, 128826.6696, 155828.7395, 1494.389367, 1571.685369, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fixed Income', 'GENERAL FINAN [UBS]', 250000, '2031-10-20', 'USD', 101.25407, 100.774, 22404994.34, 251935, 222987.6685, 0, 0, 0.001321, -0.002218, -0.004742, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'Norwegian krone [UBS]', 207811.3084, NULL, 'NOK', 1, 1, 21238.31572, 207811.3084, 21238.31572, 633.8244907, 820.8546683, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Commodity', 'VanEck Vectors Gold Miners UCITS ETF [UBS]', 26024.18559, '2031-10-20', 'USD', 30.601, 36.5913, 723896.7878, 952258.7821, 865603.2329, 0, 0, -0.076933, 0.177599, 0.195755, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fixed Income', 'SOTHEBYS [UBS]', 250000, '2031-10-20', 'USD', 100.81, 98.25, 22909072.5, 245625, 223273.125, 0, 0, 0.02745, -0.024814, -0.025395, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'Swiss franc [UBS]', 144623.5973, NULL, 'CHF', 1, 1, 144623.5973, 144623.5973, 144623.5973, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'iShares $Corp Bd Interest Rate Hgd UCITS ETF USD(Dist) [CRS]', 125000, '2031-10-20', 'USD', 5.484, 5.4793, 623119.5, 684912.5, 622585.4625, 0, 0, 0.028126, -0.001295, -0.000858, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Real Estate', 'Belval [PRH]', 369402.9851, '2031-10-20', 'EUR', 1, 1, 400285.0746, 369402.9851, 400285.0746, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Commodity', 'SPDR Gold Shares [CRS]', 11475.81441, '2031-10-20', 'USD', 337.8764, 177.3622, 3431892.813, 20353756.91, 18015110.24, 0, 0, 0.072592, 0, -0.475068, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'United States dollar [CRS]', 268820.1329, NULL, 'USD', 1, 1, 244357.5008, 268820.1329, 244357.5008, -1034.957512, -7459.758688, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fx', 'USD / CHF Purchase / Value date 08.01.2021 [UBS]', -10000000, NULL, 'USD', 1, 1, -9090000, -10000000, -9090000, 38500, 277500, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'VISA INC [UBS]', 237.1323529, '2031-10-20', 'USD', 142.89, 218.73, 29990.58848, 51867.95956, 45908.33101, 0, 0, 0.039838, 0.164076, 0.530757, 907.0582046, 907.0582046, 907.0582046, 907.0582046);
INSERT INTO `wa_position` (`client_code`, `period_date`, `valuation_currency`, `valuation_method`, `custodian`, `account`, `kfp_asset_class`, `instrument_name`, `quantity`, `last_purchase`, `currency`, `cost_price`, `valuation_price`, `cost_local`, `valuation_local`, `valuation_base`, `mtd_pl`, `ytd_pl`, `mtd_return`, `ytd_return`, `sp_return`, `interest`, `dividend`, `commission`, `tax`) VALUES
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fixed Income', 'PIMCO GIS Glo Invt Grd Crdt ECl USD Inc [UBS]', 20000, '2031-10-20', 'EUR', 12.25, 12.38, 264771.5, 247600, 267581.32, 0, 0, 0.000808, 0.011437, 0.010612, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Japanese yen [CRS]', 165867.7416, NULL, 'JPY', 1, 1, 1421.652413, 165867.7416, 1421.652413, -23.8849548, -27.4511112, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Real Estate', 'Kremmergaarden Invest AS [PRH]', 10.29850746, '2031-10-20', 'NOK', 530000, 265000, 557828.9552, 2729104.478, 278914.4776, 0, 0, 0, 0, -0.5, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'APRILA BANK [CRS]', 146.1397059, '2031-10-20', 'NOK', 14.54, 7.25, 219.074234, 1059.512868, 109.235777, 0, 0, -0.033334, 0, -0.501376, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'Novo Nordisk A/S [CRS]', 100000, '2031-10-20', 'EUR', 102.24, 102.13, 11078726.4, 102130, 110668.068, 0, 0, 0, 0, -0.001076, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Real Estate', 'Mansford Opportunity Fund III [PRH]', 471828.3582, '2031-10-20', 'GBP', 1, 1, 571006.6791, 471828.3582, 571006.6791, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'United States dollar [CRS]', 268820.1329, NULL, 'USD', 1, 1, 237932.6996, 268820.1329, 237932.6996, -6424.801177, -7459.758688, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'Pound sterling [UBS]', 31321.49472, NULL, 'GBP', 1, 1, 37905.27291, 31321.49472, 37905.27291, 18.7928968, 382.1222355, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Absolute Return', 'KNIGHTHEAD OFFS B1 SUB-CL 2 $ [UBS]', 675.0480461, '2031-10-20', 'USD', 1122.446979, 2516.4272, 670645.262, 1698709.265, 1503527.57, 0, 0, 0.02675, 0.147476, 1.241911, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fixed Income', 'UKREXIMBANK [UBS]', 200000, '2031-10-20', 'USD', 92.000672, 99, 16725722.17, 198000, 179982, 0, 0, 0, -0.001262, 0.076079, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'SWISS LIFE HLD [UBS]', 816.1764706, '2031-10-20', 'CHF', 387.03, 412.4, 315884.7794, 336591.1765, 336591.1765, 0, 0, 0.016264, -0.151091, 0.06555, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fixed Income', 'UKREXIMBANK [UBS]', 200000, '2031-10-20', 'USD', 92.000672, 102.767, 16285958.96, 205534, 181918.1434, 0, 0, 0.03805, 0.036741, 0.117024, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'European euro [CRS]', 245941.8237, NULL, 'EUR', 1, 1, 266502.5602, 245941.8237, 266502.5602, 1942.940408, 1229.709119, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Real Estate', 'MS Real Estate Offshore VII [PRH]', 17.63059701, '2031-10-20', 'USD', 63447, 66600, 990080.3734, 1174197.761, 1039282.438, 0, 0, 0, 0, 0.049695, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Norwegian krone [CRS]', 236409.1949, NULL, 'NOK', 1, 1, 24373.78799, 236409.1949, 24373.78799, 212.7682754, 933.8163198, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'Swedish krona [UBS]', 201274.6487, NULL, 'SEK', 1, 1, 21335.11276, 201274.6487, 21335.11276, 311.9757054, 593.7602135, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Private Equity', 'General Atlantic Invt Partners I [PRH]', 2440298.507, '2031-10-20', 'USD', 1, 1, 2218231.343, 2440298.507, 2218231.343, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fx', 'USD / CHF Purchase / Value date 08.01.2021 [UBS]', -10000000, NULL, 'USD', 1, 1, -8851000, -10000000, -8851000, 239000, 277500, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fx', 'USD / CHF Purchase / Value date 08.01.2021 [UBS]', 10000000, NULL, 'CHF', 1, 1, 10000000, 10000000, 10000000, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Japanese yen [CRS]', 165867.7416, NULL, 'JPY', 1, 1, 1445.537368, 165867.7416, 1445.537368, -3.5661564, -27.4511112, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Fixed Income', 'PIMCO GIS Glo Invt Grd Crdt ECl USD Inc [UBS]', 20000, '2031-10-20', 'EUR', 12.25, 12.37, 265482, 247400, 268082.64, 0, 0, 0.022314, 0.01062, 0.009795, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Absolute Return', 'AKO GLOBAL UCITS -A2- USD 02.01.19 [UBS]', 857.6233184, '2031-10-20', 'USD', 125.468635, 170.864568, 95241.03247, 146537.4378, 129700.2862, 0, 0, 0, 0.112897, 0.361811, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Equity', 'SPDR® S&P® U.S. Health Care Select Sector UCITS ETF (Acc) [UBS]', 2150.735294, '2031-10-20', 'USD', 25.81, 32.88, 49132.32403, 70716.17647, 62590.88779, 0, 0, 0.038642, 0.12957, 0.273924, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'Vontobel Fund Emerging Markets Debt B (USD) [CRS]', 5000, '2031-10-20', 'EUR', 106.5, 98.92, 575472.75, 494600, 534514.22, 0, 0, 0.016963, 0, -0.071174, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'Nuance Communications Inc [CRS]', 400000, '2031-10-20', 'USD', 106.499, 105.625, 37704905.96, 422500, 373954.75, 0, 0, -0.001183, 0, -0.008207, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Fixed Income', 'UNIFIN [CRS]', 200000, '2031-10-20', 'USD', 82.940825, 93, 15078641.99, 186000, 169074, 0, 0, 0.059829, 0, 0.121281, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'European euro [UBS]', 102952.3913, NULL, 'EUR', 1, 1, 111260.6493, 102952.3913, 111260.6493, -298.5619349, 514.7619566, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'Unibail-Rodamco-Westfield SE [CRS]', 1607.536765, '2031-10-20', 'EUR', 58.5973, 59.5, 102072.2095, 95648.4375, 103644.6469, 0, 0, 0, 0, 0.015405, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Cash', 'Swedish krona [CRS]', 157696.9169, NULL, 'SEK', 1, 1, 16936.64887, 157696.9169, 16936.64887, 220.7756836, 465.2059048, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Crédit Suisse', 'S 0947-123456-01', 'Equity', 'UBISOFT Entertainment [CRS]', 1439.338235, '2031-10-20', 'EUR', 66.89, 79.78, 104326.1197, 114830.4044, 124430.2262, 0, 0, 0.05334, 0, 0.192704, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'Private Holding', 'DUM PE 00', 'Real Estate', 'MS Real Estate Offshore VII [PRH]', 17.63059701, '2031-10-20', 'USD', 63447, 63447, 1016815.116, 1118608.489, 1016815.116, 0, 0, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-11-30', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'Japanese yen [UBS]', 244580.0196, NULL, 'JPY', 1, 1, 2131.514871, 244580.0196, 2131.514871, -5.2584704, -40.4779932, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046),
('DUM', '2019-12-31', 'CHF', 'DELTA', 'UBS', '0240-123456-01', 'Cash', 'Swedish krona [UBS]', 201274.6487, NULL, 'SEK', 1, 1, 21616.89727, 201274.6487, 21616.89727, 281.7845081, 593.7602135, 0, 0, 0, 907.0582046, 907.0582046, 907.0582046, 907.0582046);

-- --------------------------------------------------------

--
-- Table structure for table `wa_trade`
--

CREATE TABLE `wa_trade` (
    `client_code` varchar(3) DEFAULT NULL,
    `valuation_currency` varchar(3) DEFAULT NULL,
    `asset_class` varchar(14) DEFAULT NULL,
    `account` varchar(16) DEFAULT NULL,
    `date` varchar(10) DEFAULT NULL,
    `movement` varchar(8) DEFAULT NULL,
    `name` varchar(58) DEFAULT NULL,
    `quantity` decimal(17,10) DEFAULT NULL,
    `gross_price` decimal(16,10) DEFAULT NULL,
    `net_price` decimal(16,10) DEFAULT NULL,
    `cost_price` decimal(32,10) NOT NULL,
    `amount_local` varchar(25) DEFAULT NULL,
    `custodian` varchar(15) DEFAULT NULL,
    `isin` varchar(12) DEFAULT NULL,
    `issuer` varchar(36) DEFAULT NULL,
    `instrument` varchar(6) DEFAULT NULL,
    `ccy` varchar(3) DEFAULT NULL,
    `realized_local` decimal(32,10) NOT NULL DEFAULT '0.0000000000',
    `realized_base` decimal(11,10) DEFAULT NULL,
    `amount_base` varchar(17) DEFAULT NULL,
    `fx_rate` double DEFAULT NULL,
    `comission` double DEFAULT NULL,
    `tax` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wa_trade`
--

INSERT INTO `wa_trade` (`client_code`, `valuation_currency`, `asset_class`, `account`, `date`, `movement`, `name`, `quantity`, `gross_price`, `net_price`, `cost_price`, `amount_local`, `custodian`, `isin`, `issuer`, `instrument`, `ccy`, `realized_local`, `realized_base`, `amount_base`, `fx_rate`, `comission`, `tax`) VALUES
('DUM', 'CHF', 'Real Estate', 'DUM PE 00', '2020-10-31', 'PURCHASE', 'Mansford Opportunity Fund III', '605261.4179110000', '0.9600000000', '0.9600000000', '0.9600000000', '-581050.961195', 'Private Holding', 'KF0706000001', '', 'Fund', 'GBP', '0.0000000000', '0.0000000000', '-689358.860361748', 1.1864, 0, 0),
('DUM', 'CHF', 'Private Equity', 'DUM PE 00', '2020-10-31', 'PURCHASE', 'General Atlantic Invt Partners I', '2361720.8955230000', '0.9600000000', '0.9600000000', '0.9600000000', '-2267252.059702', 'Private Holding', 'KF0706000002', '', 'Fund', 'USD', '0.0000000000', '0.0000000000', '-2078389.96312882', 0.9167, 0, 0),
('DUM', 'CHF', 'Private Equity', 'DUM PE 00', '2020-10-31', 'PURCHASE', 'Strategic Value Global Opportunities', '2052963.8059700000', '0.9600000000', '0.9600000000', '0.9600000000', '-1970845.253731', 'Private Holding', 'KF0703000005', '', 'Equity', 'USD', '0.0000000000', '0.0000000000', '-1806673.84409521', 0.9167, 0, 0),
('DUM', 'CHF', 'Private Equity', 'DUM PE 00', '2020-10-31', 'PURCHASE', 'TrueNoord', '920902.9616670000', '1.1371267664', '1.1371267664', '1.1371267664', '-1047183.406969', 'Private Holding', 'KF0703000018', '', 'Equity', 'EUR', '0.0000000000', '0.0000000000', '-1118182.4419615', 1.0678, 0, 0),
('DUM', 'CHF', 'Real Estate', 'DUM PE 00', '2020-10-31', 'PURCHASE', 'Belval', '400876.1194030000', '0.9600000000', '0.9600000000', '0.9600000000', '-384841.074627', 'Private Holding', 'KF0703000021', '', 'Equity', 'EUR', '0.0000000000', '0.0000000000', '-410933.299486711', 1.0678, 0, 0),
('DUM', 'CHF', 'Real Estate', 'DUM PE 00', '2020-10-31', 'PURCHASE', 'MS Real Estate Offshore VII', '1082589.2954650000', '60909.1200000000', '60909.1200000000', '60909.1200000000', '-65939561308.193141', 'Private Holding', 'KF0906000001', '', 'Fund', 'USD', '0.0000000000', '0.0000000000', '-60446795851.2206', 0.9167, 0, 0),
('DUM', 'CHF', 'Real Estate', 'DUM PE 00', '2020-10-31', 'PURCHASE', 'Kremmergaarden Invest AS', '300747.3134330000', '254400.0000000000', '254400.0000000000', '254400.0000000000', '-76510116537.355200', 'Private Holding', 'KF0903000002', '', 'Equity', 'NOK', '0.0000000000', '0.0000000000', '-7352622199.23983', 0.0961, 0, 0),
('DUM', 'CHF', 'Private Equity', 'DUM PE 00', '2020-10-31', 'PURCHASE', 'Nerdwallet', '1782124.2537320000', '0.9600000000', '0.9600000000', '0.9600000000', '-1710839.283583', 'Private Holding', 'KF0703000030', 'Innovius Capital Sirius I, L.P.', 'SPV', 'USD', '0.0000000000', '0.0000000000', '-1568326.37126054', 0.9167, 0, 0),
('DUM', 'CHF', 'Hedge Fund', '0240-123456-01', '2020-10-31', 'PURCHASE', 'Protea UCITS II-ECO Advisors ESG Absolute Return F EUR Acc', '242214.6586930000', '101.5872000000', '101.5872000000', '101.5872000000', '-24605908.975578', 'UBS', 'LU2002381171', '', 'Fund', 'EUR', '0.0000000000', '0.0000000000', '-26274189.6041222', 1.0678, 0, 0),
('DUM', 'CHF', 'Hedge Fund', '0240-123456-01', '2020-10-31', 'PURCHASE', 'AKO GLOBAL UCITS -A2- USD 02.01.19', '139185.1912440000', '160.9837593600', '160.9837593600', '160.9837593600', '-22406555.333700', 'UBS', 'KF0106000003', '', 'Fund', 'USD', '0.0000000000', '0.0000000000', '-20540089.2744028', 0.9167, 0, 0),
('DUM', 'CHF', 'Hedge Fund', '0240-123456-01', '2020-10-31', 'PURCHASE', 'KNIGHTHEAD OFFS B1 SUB-CL 2 $', '1601177.8297750000', '2352.8297280000', '2352.8297280000', '2352.8297280000', '-3767298797.709144', 'UBS', 'XD0248258416', '', 'Fund', 'USD', '0.0000000000', '0.0000000000', '-3453482807.85997', 0.9167, 0, 0),
('DUM', 'CHF', 'Hedge Fund', 'S 0947-123456-01', '2020-10-31', 'PURCHASE', 'RAGING CAP OFF 1 B 35 USD UNR', '1862999.2988240000', '892.4064000000', '892.4064000000', '892.4064000000', '-1662552497.466050', 'Crédit Suisse', 'XD0556957062', '', 'Fund', 'USD', '0.0000000000', '0.0000000000', '-1524061874.42713', 0.9167, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2020-10-31', 'PURCHASE', 'SWISS LIFE HLD', '331204.4117650000', '389.5680000000', '389.5680000000', '389.5680000000', '-129026640.282468', 'UBS', 'CH0014852781', '', 'Equity', 'CHF', '0.0000000000', '0.0000000000', '-129026640.282468', 1, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2020-10-31', 'PURCHASE', 'TOTAL', '57458.3477210000', '34.3920000000', '34.3920000000', '34.3920000000', '-1976107.494821', 'UBS', 'FR0000120271', '', 'Equity', 'EUR', '0.0000000000', '0.0000000000', '-2110087.58296986', 1.0678, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2020-10-31', 'PURCHASE', 'Xtrackers MSCI World Information Technology UCITS ETF 1C', '121886.6266820000', '47.3520000000', '47.3520000000', '47.3520000000', '-5771575.546646', 'UBS', 'IE00BM67HT60', '', 'ETF', 'USD', '0.0000000000', '0.0000000000', '-5290803.30361039', 0.9167, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2020-10-31', 'PURCHASE', 'SPDR® S&P® U.S. Health Care Select Sector UCITS ETF (Acc)', '65892.8391250000', '30.3904320000', '30.3904320000', '30.3904320000', '-2002511.846715', 'UBS', 'IE00BWBXM617', '', 'ETF', 'USD', '0.0000000000', '0.0000000000', '-1835702.60988364', 0.9167, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2020-10-31', 'PURCHASE', 'Lumyna - Ramius Merger Arbitrage UCITS Fund', '231439.4968560000', '105.3216000000', '105.3216000000', '105.3216000000', '-24375578.112069', 'UBS', 'LU1438658517', '', 'Fund', 'EUR', '0.0000000000', '0.0000000000', '-26028242.3080673', 1.0678, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2020-10-31', 'PURCHASE', 'ISHARES US HEALTHCARE ETF', '363586.6442980000', '228.2688000000', '228.2688000000', '228.2688000000', '-82995486.989931', 'UBS', 'US4642877629', '', 'ETF', 'USD', '0.0000000000', '0.0000000000', '-76081962.9236697', 0.9167, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2020-10-31', 'PURCHASE', 'VISA INC', '48274.6289890000', '201.9360000000', '201.9360000000', '201.9360000000', '-9748385.479523', 'UBS', 'US92826C8394', '', 'Equity', 'USD', '0.0000000000', '0.0000000000', '-8936344.96907873', 0.9167, 0, 0),
('DUM', 'CHF', 'Equity', 'S 0947-123456-01', '2020-10-31', 'PURCHASE', 'APRILA BANK', '120.7844670000', '7.2000000000', '7.2000000000', '7.2000000000', '-869.648162', 'Crédit Suisse', 'NO0010816473', '', 'Equity', 'NOK', '0.0000000000', '0.0000000000', '-83.5731883682', 0.0961, 0, 0),
('DUM', 'CHF', 'Equity', 'S 0947-123456-01', '2020-10-31', 'PURCHASE', 'AB SICAV I-Eurozone Equity Portfolio A EUR', '64597.4177100000', '100.1184000000', '100.1184000000', '100.1184000000', '-6467390.105257', 'Crédit Suisse', 'LU1955076861', '', 'Fund', 'EUR', '0.0000000000', '0.0000000000', '-6905879.15439343', 1.0678, 0, 0),
('DUM', 'CHF', 'Equity', 'S 0947-123456-01', '2020-10-31', 'PURCHASE', 'AMAZON COM', '1462563.5194190000', '3041.3184000000', '3041.3184000000', '3041.3184000000', '-4448121342.777762', 'Crédit Suisse', 'US0231351067', '', 'Equity', 'USD', '0.0000000000', '0.0000000000', '-4077592834.92437', 0.9167, 0, 0),
('DUM', 'CHF', 'Equity', 'S 0947-123456-01', '2020-10-31', 'PURCHASE', 'UBISOFT Entertainment', '124613.9548680000', '76.5888000000', '76.5888000000', '76.5888000000', '-9544033.266594', 'Crédit Suisse', 'FR0000054470', '', 'Equity', 'EUR', '0.0000000000', '0.0000000000', '-10191118.7220691', 1.0678, 0, 0),
('DUM', 'CHF', 'Equity', 'S 0947-123456-01', '2020-10-31', 'PURCHASE', 'Unibail-Rodamco-Westfield SE', '103797.6843750000', '57.1200000000', '57.1200000000', '57.1200000000', '-5928923.731500', 'Crédit Suisse', 'FR0013326246', '', 'Equity', 'EUR', '0.0000000000', '0.0000000000', '-6330904.7604957', 1.0678, 0, 0),
('DUM', 'CHF', 'Bond', '0240-123456-01', '2020-10-31', 'PURCHASE', 'Pareto Nordic Corporate Bond H - EUR', '297018.4261000000', '105.1005120000', '105.1005120000', '105.1005120000', '-31216788.656544', 'UBS', 'LU1311575093', '', 'Fund', 'EUR', '0.0000000000', '0.0000000000', '-33333286.9274577', 1.0678, 0, 0),
('DUM', 'CHF', 'Bond', '0240-123456-01', '2020-10-31', 'PURCHASE', 'PIMCO GIS Glo Invt Grd Crdt ECl USD Inc', '268478.4800000000', '11.8752000000', '11.8752000000', '11.8752000000', '-3188235.645696', 'UBS', 'IE00B3D1YW09', '', 'Fund', 'EUR', '0.0000000000', '0.0000000000', '-3404398.02247419', 1.0678, 0, 0),
('DUM', 'CHF', 'Bond', '0240-123456-01', '2020-10-31', 'PURCHASE', 'GENERAL FINAN', '243500.8995000000', '96.6153600000', '96.6153600000', '96.6153600000', '-235259.270655', 'UBS', 'US37045XBR61', 'GENERAL MOTORS FINANCIAL COMPANY INC', 'Bond', 'USD', '0.0000000000', '0.0000000000', '-215662.173409438', 0.9167, 0, 0),
('DUM', 'CHF', 'Bond', '0240-123456-01', '2020-10-31', 'PURCHASE', 'SOTHEBYS', '237715.8750000000', '94.3200000000', '94.3200000000', '94.3200000000', '-224213.613300', 'UBS', 'USU83574AC43', 'SOTHEBY\'S', 'Bond', 'USD', '0.0000000000', '0.0000000000', '-205536.61931211', 0.9167, 0, 0),
('DUM', 'CHF', 'Bond', '0240-123456-01', '2020-10-31', 'PURCHASE', 'UKREXIMBANK', '191624.4000000000', '95.0400000000', '95.0400000000', '95.0400000000', '-182119.829760', 'UBS', 'XS1261825894', 'BIZ FINANCE PLC', 'Bond', 'USD', '0.0000000000', '0.0000000000', '-166949.247940992', 0.9167, 0, 0),
('DUM', 'CHF', 'Bond', '0240-123456-01', '2020-10-31', 'PURCHASE', 'GRAY TELEVISIO', '101377.0500000000', '100.5600000000', '100.5600000000', '100.5600000000', '-101944.761480', 'UBS', 'USU42511AE27', 'GRAY TELEVISION INC', 'Bond', 'USD', '0.0000000000', '0.0000000000', '-93452.762848716', 0.9167, 0, 0),
('DUM', 'CHF', 'Bond', 'S 0947-123456-01', '2020-10-31', 'PURCHASE', 'iShares $Corp Bd Interest Rate Hgd UCITS ETF USD(Dist)', '662858.3175000000', '5.2601280000', '5.2601280000', '5.2601280000', '-3486719.595915', 'Crédit Suisse', 'IE00BZ173W74', '', 'ETF', 'USD', '0.0000000000', '0.0000000000', '-3196275.85357528', 0.9167, 0, 0),
('DUM', 'CHF', 'Bond', 'S 0947-123456-01', '2020-10-31', 'PURCHASE', 'Vontobel Fund Emerging Markets Debt B (USD)', '527787.0200000000', '93.3792000000', '93.3792000000', '93.3792000000', '-49284329.697984', 'Crédit Suisse', 'LU1991126514', '', 'Fund', 'EUR', '0.0000000000', '0.0000000000', '-52625807.2515073', 1.0678, 0, 0),
('DUM', 'CHF', 'Bond', 'S 0947-123456-01', '2020-10-31', 'PURCHASE', 'UNIFIN', '180010.8000000000', '89.2800000000', '89.2800000000', '89.2800000000', '-160713.642240', 'Crédit Suisse', 'USP94461AB96', 'UNIFIN FINANCIERA SAB DE CV', 'Bond', 'USD', '0.0000000000', '0.0000000000', '-147326.195841408', 0.9167, 0, 0),
('DUM', 'CHF', 'Bond', 'S 0947-123456-01', '2020-10-31', 'PURCHASE', 'Nuance Communications Inc', '409379.4000000000', '101.5200000000', '101.5200000000', '101.5200000000', '-415601.966880', 'Crédit Suisse', 'US67020YAQ35', 'NUANCE COMMUNICATIONS INC', 'Bond', 'USD', '0.0000000000', '0.0000000000', '-380982.323038896', 0.9167, 0, 0),
('DUM', 'CHF', 'Bond', 'S 0947-123456-01', '2020-10-31', 'PURCHASE', 'Novo Nordisk A/S', '110831.4760000000', '98.0448000000', '98.0448000000', '98.0448000000', '-108664.498981', 'Crédit Suisse', 'XS1991114858', 'DOMETIC GROUP AB (PUBL)', 'Bond', 'EUR', '0.0000000000', '0.0000000000', '-116031.952011912', 1.0678, 0, 0),
('DUM', 'CHF', 'Commodity', '0240-123456-01', '2020-10-31', 'PURCHASE', 'VanEck Vectors Gold Miners UCITS ETF', '921596.0493000000', '35.1276480000', '35.1276480000', '35.1276480000', '-32373501.618001', 'UBS', 'IE00BQQP9F84', '', 'ETF', 'USD', '0.0000000000', '0.0000000000', '-29676788.9332215', 0.9167, 0, 0),
('DUM', 'CHF', 'Commodity', 'S 0947-123456-01', '2020-10-31', 'PURCHASE', 'SPDR Gold Shares', '1836519.0492900000', '158.7440793600', '158.7440793600', '158.7440793600', '-291536525.706644', 'Crédit Suisse', 'US78463V1070', '', 'ETF', 'USD', '0.0000000000', '0.0000000000', '-267251533.115281', 0.9167, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wa_wealth`
--

CREATE TABLE `wa_wealth` (
  `client_code` varchar(3) NOT NULL,
  `period_date` date NOT NULL,
  `valuation_currency` varchar(5) NOT NULL,
  `valuation_method` varchar(5) NOT NULL,
  `category` varchar(20) NOT NULL,
  `mtd_value` double NOT NULL,
  `mtd_pl` double NOT NULL,
  `ytd_pl` double NOT NULL,
  `mtd_percentage` double NOT NULL,
  `ytd_percentage` double NOT NULL,
  `mtd_benchmark` double NOT NULL,
  `ytd_benchmark` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wa_wealth`
--

INSERT INTO `wa_wealth` (`client_code`, `period_date`, `valuation_currency`, `valuation_method`, `category`, `mtd_value`, `mtd_pl`, `ytd_pl`, `mtd_percentage`, `ytd_percentage`, `mtd_benchmark`, `ytd_benchmark`) VALUES
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Portfolio Assets', 22304198.828067, 425133.4468767, 850266.8937534, 0.0190606912247269, 0.0381213824494537, 0.0521, 0.0521),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Category A', 20821134, 149811, -2013957, 0.0072, -0.0551, 0.0521, 0.0521),
('DUM', '2020-12-31', 'CHF', 'VALUE', 'Category B', 4187355, 116185, -457289, 0.0306, -0.094, 0.0521, 0.0521),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Portfolio Assets', 223041988.28067002, 425133.4468767, 850266.8937534, 0.0190606912247269, 0.0381213824494537, 0.0521, 0.0521),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Category A', 208211340, 149811, -2013957, 0.0072, -0.0551, 0.0521, 0.0521),
('DUM', '2020-12-31', 'CHF', 'DELTA', 'Category B', 41873550, 116185, -457289, 0.0306, -0.094, 0.0521, 0.0521);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;