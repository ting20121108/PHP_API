-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-05-25 12:00:33
-- 伺服器版本： 10.4.18-MariaDB
-- PHP 版本： 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `life`
--

-- --------------------------------------------------------

--
-- 資料表結構 `food_kind_code`
--

CREATE TABLE `food_kind_code` (
  `type1` int(11) NOT NULL,
  `type_cn` varchar(10) CHARACTER SET utf8 NOT NULL,
  `member_no` int(5) DEFAULT NULL,
  `group_no` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `food_kind_code`
--

INSERT INTO `food_kind_code` (`type1`, `type_cn`, `member_no`, `group_no`) VALUES
(1, '五穀雜糧', 0, 0),
(2, '蔬菜', 0, 0),
(3, '水果', 0, 0),
(4, '肉', 0, 0),
(5, '海鮮', 0, 0),
(6, '蛋', 0, 0),
(7, '飲品', 0, 0),
(8, '調味料', 0, 0),
(9, '甜點', 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `food_type_code`
--

CREATE TABLE `food_type_code` (
  `food_no` int(11) NOT NULL,
  `member_no` int(5) NOT NULL,
  `group_no` int(5) NOT NULL,
  `type1` int(5) NOT NULL,
  `locate_no` int(5) NOT NULL,
  `exp_day` datetime NOT NULL,
  `alert_day` datetime NOT NULL,
  `zero_alert` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `group_code`
--

CREATE TABLE `group_code` (
  `group_no` int(4) NOT NULL,
  `group_cn` varchar(10) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `locate_code`
--

CREATE TABLE `locate_code` (
  `locate_no` int(11) NOT NULL,
  `locate_cn` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `member_no` int(5) NOT NULL,
  `group_no` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `member_info`
--

CREATE TABLE `member_info` (
  `member_no` int(11) NOT NULL,
  `group_no` int(5) NOT NULL,
  `member_nickname` varchar(10) CHARACTER SET utf8 NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 NOT NULL,
  `passwd` varchar(15) CHARACTER SET utf8 NOT NULL,
  `m_barcode` varchar(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '載具',
  `send_alert` datetime NOT NULL COMMENT '到期日推播',
  `send_hint` datetime NOT NULL COMMENT '提醒時間',
  `line_id` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `locate_code` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `member_info`
--

INSERT INTO `member_info` (`member_no`, `group_no`, `member_nickname`, `email`, `passwd`, `m_barcode`, `send_alert`, `send_hint`, `line_id`, `locate_code`) VALUES
(1, 1, 'Test', 'Test123@test.edu.tw', 'test123', NULL, '2021-05-12 13:10:56', '2021-05-12 13:10:56', NULL, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `refre_list`
--

CREATE TABLE `refre_list` (
  `refre_list_no` int(11) NOT NULL,
  `member_no` int(5) NOT NULL,
  `group_no` int(5) NOT NULL,
  `food_no` int(5) NOT NULL,
  `amout` int(5) NOT NULL DEFAULT 0,
  `unit_no` int(5) NOT NULL,
  `locate_no` int(5) NOT NULL,
  `exp_date` datetime NOT NULL,
  `alert_date` datetime NOT NULL,
  `ck_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `shopping_list`
--

CREATE TABLE `shopping_list` (
  `shopping_list_no` int(11) NOT NULL,
  `member_no` int(5) NOT NULL,
  `group_no` int(5) NOT NULL,
  `msg_receiver` enum('0','1') NOT NULL DEFAULT '0',
  `hint_datetime` datetime NOT NULL,
  `type1` int(5) NOT NULL,
  `food_no` int(5) NOT NULL,
  `amout` int(5) NOT NULL,
  `unit_no` int(11) NOT NULL,
  `check_box` enum('0','1') NOT NULL DEFAULT '0',
  `indo_user` enum('0','1') NOT NULL DEFAULT '0',
  `ck_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `unit_code`
--

CREATE TABLE `unit_code` (
  `unit_no` int(11) NOT NULL,
  `unit_cn` varchar(5) CHARACTER SET utf8 NOT NULL,
  `meber_no` int(11) DEFAULT NULL,
  `group_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `unit_code`
--

INSERT INTO `unit_code` (`unit_no`, `unit_cn`, `meber_no`, `group_no`) VALUES
(1, '包', 0, 0),
(2, '袋', 0, 0),
(3, '盒', 0, 0),
(4, '桶', 0, 0),
(5, '杯', 0, 0),
(6, '瓶', 0, 0),
(7, '罐', 0, 0),
(8, '個', 0, 0),
(9, '顆', 0, 0),
(10, '把', 0, 0),
(11, '片', 0, 0),
(12, '條', 0, 0),
(13, '根', 0, 0),
(14, '串', 0, 0);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `food_kind_code`
--
ALTER TABLE `food_kind_code`
  ADD PRIMARY KEY (`type1`);

--
-- 資料表索引 `food_type_code`
--
ALTER TABLE `food_type_code`
  ADD PRIMARY KEY (`food_no`);

--
-- 資料表索引 `locate_code`
--
ALTER TABLE `locate_code`
  ADD PRIMARY KEY (`locate_no`);

--
-- 資料表索引 `member_info`
--
ALTER TABLE `member_info`
  ADD PRIMARY KEY (`member_no`);

--
-- 資料表索引 `refre_list`
--
ALTER TABLE `refre_list`
  ADD PRIMARY KEY (`refre_list_no`);

--
-- 資料表索引 `shopping_list`
--
ALTER TABLE `shopping_list`
  ADD PRIMARY KEY (`shopping_list_no`);

--
-- 資料表索引 `unit_code`
--
ALTER TABLE `unit_code`
  ADD PRIMARY KEY (`unit_no`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `food_kind_code`
--
ALTER TABLE `food_kind_code`
  MODIFY `type1` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `food_type_code`
--
ALTER TABLE `food_type_code`
  MODIFY `food_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `locate_code`
--
ALTER TABLE `locate_code`
  MODIFY `locate_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member_info`
--
ALTER TABLE `member_info`
  MODIFY `member_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `refre_list`
--
ALTER TABLE `refre_list`
  MODIFY `refre_list_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `shopping_list`
--
ALTER TABLE `shopping_list`
  MODIFY `shopping_list_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `unit_code`
--
ALTER TABLE `unit_code`
  MODIFY `unit_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
