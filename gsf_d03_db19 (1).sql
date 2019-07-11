-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2019 年 7 月 11 日 09:29
-- サーバのバージョン： 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gsf_d03_db19`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `php02_table`
--

CREATE TABLE `php02_table` (
  `id` int(12) NOT NULL,
  `task` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `image` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `indate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `php02_table`
--

INSERT INTO `php02_table` (`id`, `task`, `deadline`, `comment`, `image`, `indate`) VALUES
(10, 'aiueo', '2019-07-13', 'aaaa', 'upload/20190706073853d41d8cd98f00b204e9800998ecf8427e.jpg', '2019-07-06 16:38:53'),
(11, 'aiueo', '2019-07-20', 'aaaaa', 'upload/20190706074038d41d8cd98f00b204e9800998ecf8427e.jpg', '2019-07-06 16:40:38'),
(12, 'aaaa', '2019-07-13', 'aaaaa', NULL, '2019-07-06 17:47:22'),
(13, 'アイウエオ', '2019-07-10', 'あああああ', 'upload/20190709080308d41d8cd98f00b204e9800998ecf8427e.jpg', '2019-07-09 17:03:08'),
(14, 'test', '2019-07-09', 'test1', 'upload/20190709080407d41d8cd98f00b204e9800998ecf8427e.jpg', '2019-07-09 17:04:07'),
(15, 'test2', '2019-07-21', 'test2', 'upload/20190709080506d41d8cd98f00b204e9800998ecf8427e.jpg', '2019-07-09 17:05:06'),
(16, '課題', '2019-07-11', 'できないよーーーー', 'upload/20190710095621d41d8cd98f00b204e9800998ecf8427e.jpg', '2019-07-10 18:56:21'),
(17, 'PHP', '2019-07-12', 'qqqqq', 'upload/20190711064200d41d8cd98f00b204e9800998ecf8427e.jpg', '2019-07-11 15:42:00'),
(18, 'JS', '2019-07-11', '思い出す', 'upload/20190711083230d41d8cd98f00b204e9800998ecf8427e.jpg', '2019-07-11 17:32:30');

-- --------------------------------------------------------

--
-- テーブルの構造 `user_table`
--

CREATE TABLE `user_table` (
  `id` int(12) NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lid` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `lpw` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `kanri_flg` int(1) NOT NULL,
  `life_flg` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `user_table`
--

INSERT INTO `user_table` (`id`, `username`, `lid`, `lpw`, `kanri_flg`, `life_flg`) VALUES
(1, 'ちえ', '11111', '1111111', 1, 1),
(3, 'ちえ', '11111', '1111111', 1, 1),
(4, 'アイウ', '3333333', '3333333', 1, 0),
(5, 'ちえ', '11111', '1111111', 0, 1),
(7, '藤原', '11', '222', 0, 0),
(8, 'ちえ', '111', '111', 1, 0),
(9, 'ちえ', 'a', 'a', 0, 0),
(10, 'chie', 'b', 'b', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `php02_table`
--
ALTER TABLE `php02_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `php02_table`
--
ALTER TABLE `php02_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
