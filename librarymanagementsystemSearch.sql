-- CREATE Database `librarymanagementsystem`;
use `librarymanagementsystem`;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2023 at 06:38 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librarymanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternative`
--

CREATE TABLE `alternative` (
  `AID` int(11) NOT NULL,
  `ITID` varchar(100) NOT NULL,
  `SID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bid` int(11) NOT NULL,
  `itid` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `keywords` longtext DEFAULT NULL,
  `edition` varchar(100) DEFAULT NULL,
  `pageno` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bid`, `itid`, `title`, `author`, `publisher`, `thumbnail`, `description`, `category`, `keywords`, `edition`, `pageno`, `stock`, `location`) VALUES
(1, 'I01', 'new', 'new', 'new', 'new.png', 'new new new', 'Java', 'java,prog', 'new', 300, 4, 'aB'),
(2, 'I02', 'hello', 'hello', 'hello', 'hello.jpg', 'hello', 'c++', 'c++,c', 'new', 45, 4, 'fg'),
(4, 'I03', 'hello', 'hello', 'hello', 'hello.jpg', 'hello', 'c++', 'c++,c,new\r\n', 'new', 45, 4, 'fg'),
(5, 'I04', 'Maza', 'new', 'hu', 'http://localhost:8080/books', 'wow', 'Bengali', 'huiii', '3', 34, 34, 'DF'),
(6, 'I04', 'Maza', 'new', 'hu', 'http://localhost:8080/books', 'wow', 'Bengali', 'huiii', '3', 34, 34, 'DF'),
(7, 'I0909', 'er', 'we', 'we', '273459962_1636113900055442_7228868579176044961_n.jpg', 'we', 'we', 'we', '3', 3, 3, '3');

-- --------------------------------------------------------

--
-- Table structure for table `connector`
--

CREATE TABLE `connector` (
  `itid` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `connector`
--

INSERT INTO `connector` (`itid`, `type`) VALUES
('I01', 'books'),
('i02', 'book'),
('I03', 'book'),
('I04', 'book'),
('I05', 'journal'),
('I05908', 'theses'),
('I06', 'magazine'),
('I08', 'journal'),
('I09', 'journal'),
('I0909', 'book'),
('I10', 'journal'),
('I876', 'theses'),
('I8978', 'theses'),
('I960', 'book');

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `jid` int(11) NOT NULL,
  `itid` varchar(100) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `editor` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `keywords` longtext DEFAULT NULL,
  `startyear` int(11) DEFAULT NULL,
  `endyear` int(11) DEFAULT NULL,
  `pageno` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`jid`, `itid`, `title`, `publisher`, `editor`, `description`, `thumbnail`, `category`, `keywords`, `startyear`, `endyear`, `pageno`, `stock`) VALUES
(1, 'I05', 'great', 'me', 'vh', 'kuch vi', NULL, 'option1', 'c++', NULL, NULL, NULL, 3),
(2, 'I08', 'New', 'New', 'New', 'df', NULL, 'option2', 'Java', NULL, NULL, NULL, 3),
(3, 'I09', 'Something', 'ke dkhe', 'wow', 'jio', NULL, 'option3', 'Java,Prog', NULL, NULL, NULL, 1),
(4, 'I10', '1', '1', '1', '1', NULL, 'option1', '1', 2003, 2023, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `magazines`
--

CREATE TABLE `magazines` (
  `mid` int(11) NOT NULL,
  `itid` varchar(100) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `issuedate` date DEFAULT NULL,
  `issuenumber` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `frequency` varchar(100) DEFAULT NULL,
  `keywords` longtext DEFAULT NULL,
  `specialissue` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `magazines`
--

INSERT INTO `magazines` (`mid`, `itid`, `title`, `publisher`, `issuedate`, `issuenumber`, `description`, `thumbnail`, `frequency`, `keywords`, `specialissue`, `category`, `stock`) VALUES
(1, 'I06', 'Anandamela', 'ABP', '2022-03-13', '34', '45', NULL, '4', 'c++', 'no', 'option2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `softcopy`
--

CREATE TABLE `softcopy` (
  `sid` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `keywords` longtext DEFAULT NULL,
  `pageno` int(11) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `softcopy`
--

INSERT INTO `softcopy` (`sid`, `title`, `owner`, `publisher`, `description`, `thumbnail`, `category`, `keywords`, `pageno`, `filename`) VALUES
('I765', 'NewPDF', 'hj', 'Bhuj', 'ok', NULL, 'option2', 'c++,java,moja', 34, 'Web based Scalable School Management System.pdf'),
('I980', 'Great', 'Me', 'no one', 'wow', NULL, 'option1', 'head', 67, 'Resume_Updated_2.0.pdf'),
('Moja', 'moja', 'moja', 'moja', 'moja', 'Untitled design.png', 'option2', 'moja', 2, 'Noor web_organized_compressed.pdf'),
('S01', 'C++', 'T Java', 'U java', 'YUO', NULL, 'option2', 'C++,K++', 10, 'College Projects.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `theses`
--

CREATE TABLE `theses` (
  `tid` int(11) NOT NULL,
  `itid` varchar(100) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `researcher` varchar(100) NOT NULL,
  `guides` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `keywords` longtext DEFAULT NULL,
  `completeddate` date DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `abstract` text DEFAULT NULL,
  `pageno` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `theses`
--

INSERT INTO `theses` (`tid`, `itid`, `title`, `researcher`, `guides`, `description`, `thumbnail`, `category`, `keywords`, `completeddate`, `place`, `abstract`, `pageno`, `stock`) VALUES
(1, 'I8978', 'Maja', 'New', 'Wow', 'Wow', NULL, 'option2', 'you', NULL, 'kolkata', NULL, NULL, 34),
(2, 'I05908', '23', '23', '23', '23', 'noor kata (1).png', 'option1', '23', NULL, '23', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_file`
--

CREATE TABLE `user_file` (
  `username` varchar(255) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_file`
--

INSERT INTO `user_file` (`username`, `filename`, `password`) VALUES
('23', '310613089_1808343909499106_4207799568814070961_n.jpg', '32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternative`
--
ALTER TABLE `alternative`
  ADD PRIMARY KEY (`AID`),
  ADD KEY `ITID` (`ITID`),
  ADD KEY `SID` (`SID`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `itid` (`itid`);

--
-- Indexes for table `connector`
--
ALTER TABLE `connector`
  ADD PRIMARY KEY (`itid`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`jid`),
  ADD KEY `itid` (`itid`);

--
-- Indexes for table `magazines`
--
ALTER TABLE `magazines`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `itid` (`itid`);

--
-- Indexes for table `softcopy`
--
ALTER TABLE `softcopy`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `theses`
--
ALTER TABLE `theses`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `itid` (`itid`);

--
-- Indexes for table `user_file`
--
ALTER TABLE `user_file`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternative`
--
ALTER TABLE `alternative`
  MODIFY `AID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `jid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `magazines`
--
ALTER TABLE `magazines`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `theses`
--
ALTER TABLE `theses`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alternative`
--
ALTER TABLE `alternative`
  ADD CONSTRAINT `alternative_ibfk_1` FOREIGN KEY (`ITID`) REFERENCES `connector` (`itid`),
  ADD CONSTRAINT `alternative_ibfk_2` FOREIGN KEY (`SID`) REFERENCES `softcopy` (`sid`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`itid`) REFERENCES `connector` (`itid`);

--
-- Constraints for table `journals`
--
ALTER TABLE `journals`
  ADD CONSTRAINT `journals_ibfk_1` FOREIGN KEY (`itid`) REFERENCES `connector` (`itid`);

--
-- Constraints for table `magazines`
--
ALTER TABLE `magazines`
  ADD CONSTRAINT `magazines_ibfk_1` FOREIGN KEY (`itid`) REFERENCES `connector` (`itid`);

--
-- Constraints for table `theses`
--
ALTER TABLE `theses`
  ADD CONSTRAINT `theses_ibfk_1` FOREIGN KEY (`itid`) REFERENCES `connector` (`itid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
