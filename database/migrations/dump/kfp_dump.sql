-- phpMyAdmin SQL Dump
-- version 4.9.6
-- https://www.phpmyadmin.net/
--
-- Хост: bv6mw.myd.infomaniak.com
-- Время создания: Мар 04 2021 г., 14:26
-- Версия сервера: 5.7.32-log
-- Версия PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bv6mw_kfp_web_app`
--

-- --------------------------------------------------------

--
-- Структура таблицы `wa_benchmark`
--

CREATE TABLE `wa_benchmark` (
  `benchmark_date` date NOT NULL,
  `indice` varchar(20) NOT NULL,
  `mtd_percentage` double NOT NULL,
  `ytd_percentage` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wa_benchmark`
--

INSERT INTO `wa_benchmark` (`benchmark_date`, `indice`, `mtd_percentage`, `ytd_percentage`) VALUES
('2020-12-31', 'Equity', 0.0521, -0.015),
('2020-12-31', 'Fixed Income', 0.0423, 0.0124),
('2020-12-31', 'Huge Fund', 0.0127, -0.005),
('2020-12-31', 'Balanced', 0.0472, -0.0013),
('2020-12-31', 'KFP Asset Allocation', 0.0368, -0.0552);

-- --------------------------------------------------------

--
-- Структура таблицы `wa_currency`
--

DROP TABLE IF EXISTS `wa_currency`;
CREATE TABLE `wa_currency` (
  `client_code` varchar(3) NOT NULL,
  `period_date` date NOT NULL,
  `valuation_currency` varchar(3) NOT NULL,
  `valuation_method` varchar(5) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `category` varchar(20) NOT NULL,
  `value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wa_currency`
--

INSERT INTO `wa_currency` (`client_code`, `period_date`, `valuation_currency`, `valuation_method`, `currency`, `category`, `value`) VALUES
('DUM', '2020-12-31', 'EUR', 'VALUE', 'CHF', 'Cash', 272667.284),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'EUR', 'Cash', 348894.2151),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'GBP', 'Cash', 179173.7662),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'JPY', 'Cash', 3253.208955),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'NOK', 'Cash', 42378.63602),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'SEK', 'Cash', 35645.87646),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'USD', 'Cash', 394804.3087),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'CHF', 'Fx', 9244000),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'USD', 'Fx', -8185000),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'CHF', 'Investment', 311144.8835),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'EUR', 'Investment', 3107506.275),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'GBP', 'Investment', 527881.5672),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'NOK', 'Investment', 260457.6447),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'USD', 'Investment', 15761391.16);

DROP PROCEDURE IF EXISTS `fn_get_currency`;
CREATE PROCEDURE `fn_get_currency`(
    IN clientCode VARCHAR(20),
    IN periodDate DATE,
    IN valuationCurrency VARCHAR(20),
    IN valuationMethod VARCHAR(20)
)
BEGIN
    SELECT currency, category, value
    FROM wa_currency
    WHERE client_code = clientCode
      AND valuation_currency = valuationCurrency
      AND period_date = periodDate
      AND valuation_method = valuationMethod
    ;
END;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_custodian`
--

DROP TABLE IF EXISTS `wa_custodian`;
CREATE TABLE `wa_custodian` (
  `client_code` varchar(3) NOT NULL,
  `period_date` date NOT NULL,
  `valuation_currency` varchar(3) NOT NULL,
  `valuation_method` varchar(5) NOT NULL,
  `custodian_name` varchar(20) NOT NULL,
  `kfp_asset_class` varchar(20) NOT NULL,
  `value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wa_custodian`
--

INSERT INTO `wa_custodian` (`client_code`, `period_date`, `valuation_currency`, `valuation_method`, `custodian_name`, `kfp_asset_class`, `value`) VALUES
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Crédit Suisse', 'Bond', 1669171.125),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'UBS', 'Bond', 1187549.30025),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Crédit Suisse', 'Cash', 788607.019828),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'UBS', 'Cash', 488210.275627),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Crédit Suisse', 'Commodity', 1665955.003097),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'UBS', 'Commodity', 814691.540912),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Crédit Suisse', 'Equity', 1550612.189105),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'UBS', 'Equity', 1106995.50167),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'UBS', 'Fx', 1059000),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Crédit Suisse', 'Hedge Fund', 2034027.0848),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'UBS', 'Hedge Fund', 1731212.452802),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Private Holding', 'Private Equity', 6089445.348036),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Private Holding', 'Real Estate', 2118721.98694);

DROP PROCEDURE IF EXISTS `fn_get_custodian`;
CREATE PROCEDURE `fn_get_custodian`(
    IN clientCode VARCHAR(20),
    IN periodDate DATE,
    IN valuationCurrency VARCHAR(20),
    IN valuationMethod VARCHAR(20)
)
BEGIN
    SELECT custodian_name, kfp_asset_class, value
    FROM wa_custodian
    WHERE client_code = clientCode
      AND valuation_currency = valuationCurrency
      AND period_date = periodDate
      AND valuation_method = valuationMethod
    ;
END;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_par_base_currency`
--

CREATE TABLE `wa_par_base_currency` (
    `base_currency` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wa_par_base_currency`
--

INSERT INTO `wa_par_base_currency` (`base_currency`) VALUES
('EUR');

-- --------------------------------------------------------

--
-- Структура таблицы `wa_par_valuation_date`
--

CREATE TABLE `wa_par_valuation_date` (
    `valuation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wa_par_valuation_date`
--

INSERT INTO `wa_par_valuation_date` (`valuation_date`) VALUES
('2021-12-31');

-- --------------------------------------------------------

--
-- Структура таблицы `wa_par_valuation_method`
--

CREATE TABLE `wa_par_valuation_method` (
    `valuation_method` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wa_par_valuation_method`
--

INSERT INTO `wa_par_valuation_method` (`valuation_method`) VALUES
('Market value'),
('Exposure delta');

-- --------------------------------------------------------

--
-- Структура таблицы `wa_portfolio`
--

CREATE TABLE `wa_portfolio` (
  `client_code` varchar(3) NOT NULL,
  `period_date` date NOT NULL,
  `valuation_currency` varchar(3) NOT NULL,
  `valuation_method` varchar(5) NOT NULL,
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
-- Дамп данных таблицы `wa_portfolio`
--

INSERT INTO `wa_portfolio` (`client_code`, `period_date`, `valuation_currency`, `valuation_method`, `kfp_asset_class`, `mtd_value`, `mtd_pl`, `ytd_pl`, `mtd_percentage`, `ytd_percentage`, `mtd_benchmark`, `ytd_benchmark`) VALUES
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Bond', 2856720.42525, -17268.39165, -34536.7833, -0.006044, -0.012056, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Cash', 1276817.295455, -11600.6395033, -23201.2790066, -0.009085, -0.018068, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Commodity', 2480646.544009, 91950.597393, 183901.194786, 0.037067, 0.076994, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Equity', 2657607.690775, 24338.261717, 48676.523434, 0.009157, 0.018526, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Fx', 1059000, 23900, 47800, 0.0225684608120869, 0.0451369216241738, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Hedge Fund', 3765239.537602, 445170.563693, 890341.127386, 0.118231, 0.266277, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Private Equity', 6089445.348036, -155492.28927, -310984.57854, -0.025534, -0.050038, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Real Estate', 2118721.98694, 24135.344497, 48270.688994, 0.011391, 0.023086, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wa_position`
--

DROP TABLE IF EXISTS `wa_position`;
CREATE TABLE `wa_position` (
  `client_code` varchar(3) NOT NULL,
  `period_date` date NOT NULL,
  `valuation_currency` varchar(3) NOT NULL,
  `valuation_method` varchar(5) NOT NULL,
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
  `sp_return` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wa_position`
--

INSERT INTO `wa_position` (`client_code`, `period_date`, `valuation_currency`, `valuation_method`, `instrument_name`, `quantity`, `last_purchase`, `currency`, `cost_price`, `valuation_price`, `cost_local`, `valuation_local`, `valuation_base`, `mtd_pl`, `ytd_pl`, `mtd_return`, `ytd_return`, `sp_return`) VALUES
('DUM', '2020-12-31', 'EUR', 'VALUE', 'SWISS FRANC [UBS]', 144623.597341758, '2020-11-30', 'CHF', 1, 1, 144623.597342, 144623.597342, 144623.597342, 0, 0, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'EUROPEAN EURO [UBS]', 102952.391328031, '2020-11-30', 'EUR', 1, 1, 102952.391328, 102952.391328, 111260.649308, -298.5619349, -597.1238698, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'UNITED STATES DOLLAR [UBS]', 213530.885717398, '2020-11-30', 'USD', 1, 1, 213530.885717, 213530.885717, 188996.186948, -5103.3881686, -10206.7763372, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'NORWEGIAN KRONE [UBS]', 207811.308421397, '2020-11-30', 'NOK', 1, 1, 207811.308421, 207811.308421, 21425.345898, 187.0301776, 374.0603552, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'SWEDISH KRONA [UBS]', 201274.648654538, '2020-11-30', 'SEK', 1, 1, 201274.648655, 201274.648655, 21616.897266, 281.7845081, 563.5690162, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'POUND STERLING [UBS]', 31321.4947162, '2020-11-30', 'GBP', 1, 1, 31321.494716, 31321.494716, 37905.272905, 18.7928968, 37.5857936, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'JAPANESE YEN [UBS]', 244580.019609979, '2020-11-30', 'JPY', 1, 1, 244580.01961, 244580.01961, 2096.295348, -35.2195228, -70.4390456, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'SWISS FRANC [CRS]', 150343.17463776, '2020-11-30', 'CHF', 1, 1, 150343.174638, 150343.174638, 150343.174638, 0, 0, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'EUROPEAN EURO [CRS]', 245941.823728075, '2020-11-30', 'EUR', 1, 1, 245941.823728, 245941.823728, 265789.328903, -713.2312888, -1426.4625776, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'UNITED STATES DOLLAR [CRS]', 268820.132912082, '2020-11-30', 'USD', 1, 1, 268820.132912, 268820.132912, 237932.69964, -6424.8011766, -12849.6023532, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'NORWEGIAN KRONE [CRS]', 236409.194901405, '2020-11-30', 'NOK', 1, 1, 236409.194901, 236409.194901, 24373.787994, 212.7682754, 425.5365508, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'SWEDISH KRONA [CRS]', 157696.916875477, '2020-11-30', 'SEK', 1, 1, 157696.916875, 157696.916875, 16936.648872, 220.7756836, 441.5513672, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'POUND STERLING [CRS]', 128826.669571849, '2020-11-30', 'GBP', 1, 1, 128826.669572, 128826.669572, 155906.035516, 77.2960017, 154.5920034, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'JAPANESE YEN [CRS]', 165867.741584051, '2020-11-30', 'JPY', 1, 1, 165867.741584, 165867.741584, 1421.652413, -23.8849548, -47.7699096, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'MANSFORD OPPORTUNITY FUND III [PRH]', 471828.358209, '2020-11-30', 'GBP', 1, 1, 471828.358209, 471828.358209, 571006.679105, 283.097015, 566.19403, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'GENERAL ATLANTIC INVT PARTNERS I [PRH]', 2440298.5074627, '2020-11-30', 'USD', 1, 1, 2440298.507463, 2440298.507463, 2159908.208956, -58323.134328, -116646.268656, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'STRATEGIC VALUE GLOBAL OPPORTUNITIES [PRH]', 2121268.6567164, '2020-11-30', 'USD', 1, 1, 2121268.656716, 2121268.656716, 1877534.888059, -50698.320896, -101396.641792, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'TRUENOORD [PRH]', 716417.9104478, '2020-11-30', 'EUR', 1, 1.1845070483, 716417.910448, 848602.064454, 917084.251055, -2460.945987, -4921.891974, 0, -0.095797, 0.184507),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'BELVAL [PRH]', 369402.985075, '2020-11-30', 'EUR', 1, 1, 369402.985075, 369402.985075, 399213.805971, -1071.268656, -2142.537312, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'MS REAL ESTATE OFFSHORE VII [PRH]', 17.6305970149, '2020-11-30', 'USD', 63447, 66600, 1118608.488804, 1174197.761192, 1039282.438431, 22467.322108, 44934.644216, 0.049695, 0.049695, 0.049695),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'KREMMERGAARDEN INVEST AS [PRH]', 10.2985074627, '2020-11-30', 'NOK', 530000, 265000, 5458208.955231, 2729104.477616, 281370.671642, 2456.19403, 4912.38806, 0, 0, -0.5),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'NERDWALLET [PRH]', 1841417.9104478, '2020-11-30', 'USD', 2, 1, 3682835.820896, 1841417.910448, 1629838.992538, -44009.888059, -88019.776118, 0, 0, -0.5),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'PROTEA UCITS II-ECO ADVISORS ESG ABSOLUTE RETURN F EUR ACC [UBS]', 2109.2248558616, '2020-11-30', 'EUR', 104.14, 104.72, 219654.676489, 220878.026906, 238702.883677, -3154.657937, -6309.315874, -0.010396, 0.030404, 0.005569),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'AKO GLOBAL UCITS -A2- USD 02.01.19 [UBS]', 857.6233183857, '2020-11-30', 'USD', 125.468635, 170.864568, 107604.827102, 146537.437803, 129700.286199, -1028.520208, -2057.040416, 0.018922, 0.112897, 0.361811),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'KNIGHTHEAD OFFS B1 SUB-CL 2 $ [UBS]', 675.0480461243, '2020-11-30', 'USD', 1122.446979, 2516.4272, 757705.640052, 1698709.264574, 1503527.570074, -368.531667, -737.063334, 0.02675, 0.147476, 1.241911),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'RAGING CAP OFF 1 B 35 USD UNR [CRS]', 2070.7879564382, '2020-11-30', 'USD', 1157.141387, 1200.0585, 2396194.448096, 2485066.688821, 2199532.526275, 449722.273505, 899444.54701, 0.290954, -0.134735, 0.037088),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'SWISS LIFE HLD [UBS]', 816.1764705882, '2020-11-30', 'CHF', 387.03, 412.4, 315884.779412, 336591.176471, 336591.176471, 5386.764706, 10773.529412, 0.016264, -0.151091, 0.06555),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'TOTAL [UBS]', 1477.9411764706, '2020-11-30', 'EUR', 34.2362, 35.3, 50599.089706, 52171.323529, 56381.549338, -992.082794, -1984.165588, -0.014655, -0.282521, 0.031072),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'XTRACKERS MSCI WORLD INFORMATION TECHNOLOGY UCITS ETF 1C [UBS]', 2553.3088235294, '2020-11-30', 'USD', 30.19, 52.23, 77084.393382, 133359.319853, 118036.334002, 3555.094434, 7110.188868, 0.058895, 0.438272, 0.730043),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'SPDR® S&P® U.S. HEALTH CARE SELECT SECTOR UCITS ETF (ACC) [UBS]', 2150.7352941177, '2020-11-30', 'USD', 25.81, 32.88, 55510.477941, 70716.176471, 62590.887794, 701.45737, 1402.91474, 0.038642, 0.12957, 0.273924),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'LUMYNA - RAMIUS MERGER ARBITRAGE UCITS FUND [UBS]', 1943.9338235294, '2020-11-30', 'EUR', 105.76, 111.3, 205590.441176, 216359.834559, 233820.073208, 2721.806719, 5443.613438, 0.014492, 0.016809, 0.052382),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'ISHARES US HEALTHCARE ETF [UBS]', 1579.9632352941, '2020-11-30', 'USD', 194.6355, 245.77, 307516.934283, 388307.564338, 343691.025196, 2194.579994, 4389.159988, 0.033602, 0.139248, 0.262719),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'VISA INC [UBS]', 237.1323529412, '2020-11-30', 'USD', 142.89, 218.73, 33883.841912, 51867.959559, 45908.331006, 566.692495, 1133.38499, 0.039838, 0.164076, 0.530757),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'APRILA BANK [CRS]', 146.1397058824, '2020-11-30', 'NOK', 14.54, 7.25, 2124.871324, 1059.512868, 109.235777, -2.780308, -5.560616, -0.033334, 0, -0.501376),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'AB SICAV I-EUROZONE EQUITY PORTFOLIO A EUR [CRS]', 570.7720588235, '2020-11-30', 'EUR', 108.82, 107.88, 62111.415441, 61574.889706, 66543.983305, 2041.806904, 4083.613808, 0.034423, -0.038589, -0.008639),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'AMAZON COM [CRS]', 477.0220588235, '2020-11-30', 'USD', 1927.47, 3256.93, 919445.707721, 1553627.454044, 1375115.659574, 1412.167993, 2824.335986, 0.028058, 0.763467, 0.689743),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'UBISOFT ENTERTAINMENT [CRS]', 1439.3382352941, '2020-11-30', 'EUR', 66.89, 78.84, 96277.334559, 113477.426471, 122635.054787, -1795.171434, -3590.342868, -0.011783, -0.011783, 0.178651),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'UNIBAIL-RODAMCO-WESTFIELD SE [CRS]', 1607.5367647059, '2020-11-30', 'EUR', 58.5973, 64.58, 94197.314063, 103814.724265, 112192.572513, 8547.925638, 17095.851276, 0.085378, 0.085378, 0.102098),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'PARETO NORDIC CORPORATE BOND H - EUR [UBS]', 2500, '2020-11-30', 'EUR', 105.778, 110.43, 264445, 276075, 298354.2525, 1773.7452, 3547.4904, 0.00868, 0.002951, 0.043978),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'PIMCO GIS GLO INVT GRD CRDT ECL USD INC [UBS]', 20000, '2020-11-30', 'EUR', 12.25, 12.38, 245000, 247600, 267581.32, -501.32, -1002.64, 0.000808, 0.011437, 0.010612),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'GENERAL FINAN [UBS]', 250000, '2020-11-30', 'USD', 101.25407, 100.774, 25313517.5, 251935, 222987.6685, -5719.004, -11438.008, 0.001321, -0.002218, -0.004742),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'SOTHEBYS [UBS]', 250000, '2020-11-30', 'USD', 100.81, 99.625, 25202500, 249062.5, 220445.21875, -2827.90625, -5655.8125, 0.013994, -0.011167, -0.011755),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'UKREXIMBANK [UBS]', 200000, '2020-11-30', 'USD', 92.000672, 102.767, 18400134.4, 205534, 181918.1434, 1936.1434, 3872.2868, 0.03805, 0.036741, 0.117024),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'GRAY TELEVISIO [UBS]', 100000, '2020-11-30', 'USD', 105.53, 104.555, 10553000, 104555, 92541.6305, -2676.1195, -5352.239, -0.001862, -0.01326, -0.00924),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'ISHARES $CORP BD INTEREST RATE HGD UCITS ETF USD(DIST) [CRS]', 125000, '2020-11-30', 'USD', 5.484, 5.526, 685500, 690750, 611382.825, -11202.6375, -22405.275, 0.008522, 0.007217, 0.007658),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'VONTOBEL FUND EMERGING MARKETS DEBT B (USD) [CRS]', 5000, '2020-11-30', 'EUR', 106.5, 98.92, 532500, 494600, 534514.22, 7505.36, 15010.72, 0.016963, -0.059339, -0.071174),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'UNIFIN [CRS]', 200000, '2020-11-30', 'USD', 82.940825, 98, 16588165, 196000, 173479.6, 4405.6, 8811.2, 0.053763, -0.059953, 0.181565),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'NUANCE COMMUNICATIONS INC [CRS]', 400000, '2020-11-30', 'USD', 106.499, 105.625, 42599600, 422500, 373954.75, -10552.25, -21104.5, -0.001183, -0.001183, -0.008207),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'NOVO NORDISK A/S [CRS]', 100000, '2020-11-30', 'EUR', 102.24, 102.95, 10224000, 102950, 111258.065, 589.997, 1179.994, 0.008028, 0.008028, 0.006944),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'VANECK VECTORS GOLD MINERS UCITS ETF [UBS]', 26024.185587364, '2020-11-30', 'USD', 30.601, 38.247, 796366.103159, 995347.02616, 880981.652854, 15378.419941, 30756.839882, 0.045248, 0.230883, 0.249861),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'SPDR GOLD SHARES [CRS]', 11475.814412636, '2020-11-30', 'USD', 337.8764, 177.3622, 3877406.86081, 2035375.691017, 1801511.024119, 76572.177452, 153144.354904, 0.072592, 0.243505, -0.475068),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'USD / CHF PURCHASE / VALUE DATE 08.01.2021 [UBS]', -10000000, '2020-11-30', 'USD', 1, 1, -10000000, -10000000, -8851000, 239000, 478000, 0, 0, 0),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'USD / CHF PURCHASE / VALUE DATE 08.01.2021 [UBS]', 10000000, '2020-11-30', 'CHF', 1, 1, 10000000, 10000000, 10000000, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wa_trade`
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
    `amount_local` varchar(25) DEFAULT NULL,
    `custodian` varchar(15) DEFAULT NULL,
    `isin` varchar(12) DEFAULT NULL,
    `issuer` varchar(36) DEFAULT NULL,
    `instrument` varchar(6) DEFAULT NULL,
    `ccy` varchar(3) DEFAULT NULL,
    `realized_base` decimal(11,10) DEFAULT NULL,
    `amount_base` varchar(17) DEFAULT NULL,
    `fx_rate` double DEFAULT NULL,
    `comission` double DEFAULT NULL,
    `tax` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wa_trade`
--

INSERT INTO `wa_trade` (`client_code`, `valuation_currency`, `asset_class`, `account`, `date`, `movement`, `name`, `quantity`, `gross_price`, `net_price`, `amount_local`, `custodian`, `isin`, `issuer`, `instrument`, `ccy`, `realized_base`, `amount_base`, `fx_rate`, `comission`, `tax`) VALUES
('DUM', 'CHF', 'Real Estate', 'DUM PE 00', '2021-10-31', 'PURCHASE', 'Mansford Opportunity Fund III', '605261.4179110000', '0.9600000000', '0.9600000000', '-581050.961195', 'Private Holding', 'KF0706000001', '', 'Fund', 'GBP', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Private Equity', 'DUM PE 00', '2021-10-31', 'PURCHASE', 'General Atlantic Invt Partners I', '2361720.8955230000', '0.9600000000', '0.9600000000', '-2267252.059702', 'Private Holding', 'KF0706000002', '', 'Fund', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Private Equity', 'DUM PE 00', '2021-10-31', 'PURCHASE', 'Strategic Value Global Opportunities', '2052963.8059700000', '0.9600000000', '0.9600000000', '-1970845.253731', 'Private Holding', 'KF0703000005', '', 'Equity', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Private Equity', 'DUM PE 00', '2021-10-31', 'PURCHASE', 'TrueNoord', '920902.9616670000', '1.1371267664', '1.1371267664', '-1047183.406969', 'Private Holding', 'KF0703000018', '', 'Equity', 'EUR', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Real Estate', 'DUM PE 00', '2021-10-31', 'PURCHASE', 'Belval', '400876.1194030000', '0.9600000000', '0.9600000000', '-384841.074627', 'Private Holding', 'KF0703000021', '', 'Equity', 'EUR', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Real Estate', 'DUM PE 00', '2021-10-31', 'PURCHASE', 'MS Real Estate Offshore VII', '1082589.2954650000', '60909.1200000000', '60909.1200000000', '-65939561308.193141', 'Private Holding', 'KF0906000001', '', 'Fund', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Real Estate', 'DUM PE 00', '2021-10-31', 'PURCHASE', 'Kremmergaarden Invest AS', '300747.3134330000', '254400.0000000000', '254400.0000000000', '-76510116537.355200', 'Private Holding', 'KF0903000002', '', 'Equity', 'NOK', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Private Equity', 'DUM PE 00', '2021-10-31', 'PURCHASE', 'Nerdwallet', '1782124.2537320000', '0.9600000000', '0.9600000000', '-1710839.283583', 'Private Holding', 'KF0703000030', 'Innovius Capital Sirius I, L.P.', 'SPV', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Hedge Fund', '0240-123456-01', '2021-10-31', 'PURCHASE', 'Protea UCITS II-ECO Advisors ESG Absolute Return F EUR Acc', '242214.6586930000', '101.5872000000', '101.5872000000', '-24605908.975578', 'UBS', 'LU2002381171', '', 'Fund', 'EUR', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Hedge Fund', '0240-123456-01', '2021-10-31', 'PURCHASE', 'AKO GLOBAL UCITS -A2- USD 02.01.19', '139185.1912440000', '160.9837593600', '160.9837593600', '-22406555.333700', 'UBS', 'KF0106000003', '', 'Fund', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Hedge Fund', '0240-123456-01', '2021-10-31', 'PURCHASE', 'KNIGHTHEAD OFFS B1 SUB-CL 2 $', '1601177.8297750000', '2352.8297280000', '2352.8297280000', '-3767298797.709144', 'UBS', 'XD0248258416', '', 'Fund', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Hedge Fund', 'S 0947-123456-01', '2021-10-31', 'PURCHASE', 'RAGING CAP OFF 1 B 35 USD UNR', '1862999.2988240000', '892.4064000000', '892.4064000000', '-1662552497.466050', 'Crédit Suisse', 'XD0556957062', '', 'Fund', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2021-10-31', 'PURCHASE', 'SWISS LIFE HLD', '331204.4117650000', '389.5680000000', '389.5680000000', '-129026640.282468', 'UBS', 'CH0014852781', '', 'Equity', 'CHF', '0.0000000000', '-129026640.282468', 1, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2021-10-31', 'PURCHASE', 'TOTAL', '57458.3477210000', '34.3920000000', '34.3920000000', '-1976107.494821', 'UBS', 'FR0000120271', '', 'Equity', 'EUR', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2021-10-31', 'PURCHASE', 'Xtrackers MSCI World Information Technology UCITS ETF 1C', '121886.6266820000', '47.3520000000', '47.3520000000', '-5771575.546646', 'UBS', 'IE00BM67HT60', '', 'ETF', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2021-10-31', 'PURCHASE', 'SPDR® S&P® U.S. Health Care Select Sector UCITS ETF (Acc)', '65892.8391250000', '30.3904320000', '30.3904320000', '-2002511.846715', 'UBS', 'IE00BWBXM617', '', 'ETF', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2021-10-31', 'PURCHASE', 'Lumyna - Ramius Merger Arbitrage UCITS Fund', '231439.4968560000', '105.3216000000', '105.3216000000', '-24375578.112069', 'UBS', 'LU1438658517', '', 'Fund', 'EUR', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2021-10-31', 'PURCHASE', 'ISHARES US HEALTHCARE ETF', '363586.6442980000', '228.2688000000', '228.2688000000', '-82995486.989931', 'UBS', 'US4642877629', '', 'ETF', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Equity', '0240-123456-01', '2021-10-31', 'PURCHASE', 'VISA INC', '48274.6289890000', '201.9360000000', '201.9360000000', '-9748385.479523', 'UBS', 'US92826C8394', '', 'Equity', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Equity', 'S 0947-123456-01', '2021-10-31', 'PURCHASE', 'APRILA BANK', '120.7844670000', '7.2000000000', '7.2000000000', '-869.648162', 'Crédit Suisse', 'NO0010816473', '', 'Equity', 'NOK', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Equity', 'S 0947-123456-01', '2021-10-31', 'PURCHASE', 'AB SICAV I-Eurozone Equity Portfolio A EUR', '64597.4177100000', '100.1184000000', '100.1184000000', '-6467390.105257', 'Crédit Suisse', 'LU1955076861', '', 'Fund', 'EUR', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Equity', 'S 0947-123456-01', '2021-10-31', 'PURCHASE', 'AMAZON COM', '1462563.5194190000', '3041.3184000000', '3041.3184000000', '-4448121342.777762', 'Crédit Suisse', 'US0231351067', '', 'Equity', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Equity', 'S 0947-123456-01', '2021-10-31', 'PURCHASE', 'UBISOFT Entertainment', '124613.9548680000', '76.5888000000', '76.5888000000', '-9544033.266594', 'Crédit Suisse', 'FR0000054470', '', 'Equity', 'EUR', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Equity', 'S 0947-123456-01', '2021-10-31', 'PURCHASE', 'Unibail-Rodamco-Westfield SE', '103797.6843750000', '57.1200000000', '57.1200000000', '-5928923.731500', 'Crédit Suisse', 'FR0013326246', '', 'Equity', 'EUR', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Bond', '0240-123456-01', '2021-10-31', 'PURCHASE', 'Pareto Nordic Corporate Bond H - EUR', '297018.4261000000', '105.1005120000', '105.1005120000', '-31216788.656544', 'UBS', 'LU1311575093', '', 'Fund', 'EUR', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Bond', '0240-123456-01', '2021-10-31', 'PURCHASE', 'PIMCO GIS Glo Invt Grd Crdt ECl USD Inc', '268478.4800000000', '11.8752000000', '11.8752000000', '-3188235.645696', 'UBS', 'IE00B3D1YW09', '', 'Fund', 'EUR', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Bond', '0240-123456-01', '2021-10-31', 'PURCHASE', 'GENERAL FINAN', '243500.8995000000', '96.6153600000', '96.6153600000', '-235259.270655', 'UBS', 'US37045XBR61', 'GENERAL MOTORS FINANCIAL COMPANY INC', 'Bond', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Bond', '0240-123456-01', '2021-10-31', 'PURCHASE', 'SOTHEBYS', '237715.8750000000', '94.3200000000', '94.3200000000', '-224213.613300', 'UBS', 'USU83574AC43', 'SOTHEBY\'S', 'Bond', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Bond', '0240-123456-01', '2021-10-31', 'PURCHASE', 'UKREXIMBANK', '191624.4000000000', '95.0400000000', '95.0400000000', '-182119.829760', 'UBS', 'XS1261825894', 'BIZ FINANCE PLC', 'Bond', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Bond', '0240-123456-01', '2021-10-31', 'PURCHASE', 'GRAY TELEVISIO', '101377.0500000000', '100.5600000000', '100.5600000000', '-101944.761480', 'UBS', 'USU42511AE27', 'GRAY TELEVISION INC', 'Bond', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Bond', 'S 0947-123456-01', '2021-10-31', 'PURCHASE', 'iShares $Corp Bd Interest Rate Hgd UCITS ETF USD(Dist)', '662858.3175000000', '5.2601280000', '5.2601280000', '-3486719.595915', 'Crédit Suisse', 'IE00BZ173W74', '', 'ETF', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Bond', 'S 0947-123456-01', '2021-10-31', 'PURCHASE', 'Vontobel Fund Emerging Markets Debt B (USD)', '527787.0200000000', '93.3792000000', '93.3792000000', '-49284329.697984', 'Crédit Suisse', 'LU1991126514', '', 'Fund', 'EUR', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Bond', 'S 0947-123456-01', '2021-10-31', 'PURCHASE', 'UNIFIN', '180010.8000000000', '89.2800000000', '89.2800000000', '-160713.642240', 'Crédit Suisse', 'USP94461AB96', 'UNIFIN FINANCIERA SAB DE CV', 'Bond', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Bond', 'S 0947-123456-01', '2021-10-31', 'PURCHASE', 'Nuance Communications Inc', '409379.4000000000', '101.5200000000', '101.5200000000', '-415601.966880', 'Crédit Suisse', 'US67020YAQ35', 'NUANCE COMMUNICATIONS INC', 'Bond', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Bond', 'S 0947-123456-01', '2021-10-31', 'PURCHASE', 'Novo Nordisk A/S', '110831.4760000000', '98.0448000000', '98.0448000000', '-108664.498981', 'Crédit Suisse', 'XS1991114858', 'DOMETIC GROUP AB (PUBL)', 'Bond', 'EUR', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Commodity', '0240-123456-01', '2021-10-31', 'PURCHASE', 'VanEck Vectors Gold Miners UCITS ETF', '921596.0493000000', '35.1276480000', '35.1276480000', '-32373501.618001', 'UBS', 'IE00BQQP9F84', '', 'ETF', 'USD', '0.0000000000', '', 1, 0, 0),
('DUM', 'CHF', 'Commodity', 'S 0947-123456-01', '2021-10-31', 'PURCHASE', 'SPDR Gold Shares', '1836519.0492900000', '158.7440793600', '158.7440793600', '-291536525.706644', 'Crédit Suisse', 'US78463V1070', '', 'ETF', 'USD', '0.0000000000', '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wa_wealth`
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
-- Дамп данных таблицы `wa_wealth`
--

INSERT INTO `wa_wealth` (`client_code`, `period_date`, `valuation_currency`, `valuation_method`, `category`, `mtd_value`, `mtd_pl`, `ytd_pl`, `mtd_percentage`, `ytd_percentage`, `mtd_benchmark`, `ytd_benchmark`) VALUES
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Portfolio Assets', 22304198.828067, 425133.4468767, 850266.8937534, 0.0190606912247269, 0.0381213824494537, 0.0521, 0.0521),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Category A', 20821134, 149811, -2013957, 0.0072, -0.0551, 0.0521, 0.0521),
('DUM', '2020-12-31', 'EUR', 'VALUE', 'Category B', 4187355, 116185, -457289, 0.0306, -0.094, 0.0521, 0.0521);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
