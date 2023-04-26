DROP DATABASE librarymanagementsystem;
CREATE DATABASE librarymanagementsystem;
use librarymanagementsystem;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2023 at 03:56 PM
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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `alternative`
--

CREATE TABLE `alternative` (
  `AID` int(11) NOT NULL,
  `ITID` varchar(100) NOT NULL,
  `SID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alternative`
--

INSERT INTO `alternative` (`AID`, `ITID`, `SID`) VALUES
(1, 'I03', 'Moja'),
(2, 'I03', 'I765'),
(3, 'I8978', 'Moja');

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
(1, 'I01', 'new', 'new', 'new', 'Untitled design.png', 'new new new', 'Java', 'java,prog', 'new', 300, 2, 'aB'),
(2, 'I02', 'hello', 'hello', 'hello', 'Texturelabs_Pattern_129S.png', 'hello', 'c++', 'c++,c', 'new', 45, 4, 'fg'),
(4, 'I03', 'hello', 'hello', 'hello', 'Untitled design.png', 'hello', 'c++,java', 'c++,c,new\r\n', 'new', 45, -2, 'fg'),
(5, 'I04', 'Maza', 'new', 'hu', 'crew-neck-t-shirt-mockup-of-a-man-smiling-at-a-studio-28953 (1).png', 'wow', 'Bengali', 'huiii', '3', 34, 34, 'DF'),
(7, 'I0909', 'er', 'we', 'we', '273459962_1636113900055442_7228868579176044961_n.jpg', 'we', 'we', 'we', '3', 3, 3, '3'),
(8, 'I9789', 'My Book', 'me', 'ami re', 'Screenshot 2023-03-08 220519.png', 'nei kichu', 'khub valo', 'valo re', '4', 45, 0, '45'),
(9, 'I87987', 'My new Book', 'wow', 'wow2', 'Screenshot (15).png', 'nwi', 'vag', 'er', '4', 4, 4, '4');

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `BRID` int(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `ITID` varchar(100) DEFAULT NULL,
  `BORROWDATE` date DEFAULT NULL,
  `RETURNDATE` date DEFAULT NULL,
  `STATUS` varchar(100) DEFAULT NULL,
  `APPROVED` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`BRID`, `USERNAME`, `ITID`, `BORROWDATE`, `RETURNDATE`, `STATUS`, `APPROVED`) VALUES
(1, 'test', 'I01', '2023-04-24', '2023-05-09', 'returned', 'rejected'),
(3, 'test', 'I01', '2023-04-24', '2023-05-09', 'return rejected', 'rejected'),
(4, 'test', 'I01', '2023-04-24', '2023-05-09', 'notreturned', 'rejected'),
(5, 'test', 'I02', '2023-04-24', '2023-05-09', 'return rejected', 'approved');

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
('I01', 'book'),
('i02', 'book'),
('I03', 'book'),
('I04', 'book'),
('I05', 'journal'),
('I05908', 'theses'),
('I06', 'magazine'),
('I08', 'journal'),
('I09', 'journal'),
('I0909', 'book'),
('I098979', 'journal'),
('I10', 'journal'),
('I420', 'theses'),
('I876', 'theses'),
('I876545', 'theses'),
('I87987', 'book'),
('I8978', 'theses'),
('I960', 'book'),
('I9789', 'book'),
('ty', 'journal');

-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

CREATE TABLE `downloads` (
  `did` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `sid` varchar(100) DEFAULT NULL,
  `downloaddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `downloads`
--

INSERT INTO `downloads` (`did`, `username`, `sid`, `downloaddate`) VALUES
(1, 'test', 'Moja', '2023-04-25'),
(2, 'test', 'I980', '2023-04-25');

-- --------------------------------------------------------

--
-- Table structure for table `fine`
--

CREATE TABLE `fine` (
  `FID` int(11) NOT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `Finedate` date DEFAULT NULL,
  `Amount` varchar(100) DEFAULT NULL,
  `PAID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fine`
--

INSERT INTO `fine` (`FID`, `Username`, `Finedate`, `Amount`, `PAID`) VALUES
(1, 'new8', '2023-04-19', '100', 'true'),
(3, 'new8', '2023-04-23', '50', 'false'),
(4, 'new8', '2023-04-24', '50', 'false');

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
(1, 'I05', 'great', 'me', 'vh', 'kuch vi', 'Untitled design.png', 'option1', 'c++', NULL, NULL, NULL, 3),
(2, 'I08', 'New', 'New', 'New', 'df', 'istockphoto-942526180-170667a.jpg', 'option2', 'Java', NULL, NULL, NULL, 3),
(3, 'I09', 'Something', 'ke dkhe', 'wow', 'jio', 'LMSTABLEUPDATED3.0.png', 'option3', 'Java,Prog', NULL, NULL, NULL, 1),
(4, 'I10', '1', '1', '1', '1', 'LMSTABLEUPDATED3.0.png', 'option1', '1', 2003, 2023, 1, 1),
(5, 'ty', 'tyu', 'ty', 'ht', 'bg', 'mockup-of-an-11-oz-coffee-mug-from-three-different-angles-27883 (22).png', 'option2', 'fb3', 335, 456, 4, 4),
(9, 'I098979', 'something', 'why', 'why not', 'why not why', 'LMSTABLEUPDATED3.0.png', 'everything', 'great', 67, 2023, 4, 1);

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
(1, 'I06', 'Anandamela', 'ABP', '2022-03-13', '341', '45', 'White and Black Modern Twitter Header.png', '4', 'c++', 'no', 'option2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `MSID` int(11) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `CONTENT` longtext DEFAULT NULL,
  `STATUS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PID` int(11) NOT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `paydate` date DEFAULT NULL,
  `Amount` varchar(100) DEFAULT NULL,
  `TRANSACTION` varchar(100) DEFAULT NULL,
  `Approved` varchar(100) DEFAULT NULL,
  `paid` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `RSID` int(11) NOT NULL,
  `USERNAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `PROFILEPICTURE` varchar(100) DEFAULT NULL,
  `FIRSTNAME` varchar(100) DEFAULT NULL,
  `LASTNAME` varchar(100) DEFAULT NULL,
  `GENDER` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `CATEGORY` varchar(100) DEFAULT NULL,
  `PAID` varchar(100) DEFAULT NULL,
  `TRANSACTION` varchar(100) DEFAULT NULL,
  `APPROVED` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`RSID`, `USERNAME`, `PASSWORD`, `PROFILEPICTURE`, `FIRSTNAME`, `LASTNAME`, `GENDER`, `DOB`, `PHONE`, `EMAIL`, `CATEGORY`, `PAID`, `TRANSACTION`, `APPROVED`) VALUES
(2, 'new2', 'new', 'new.png', 'new', 'new', 'male', '2023-03-02', '90', 'hjk', 'St', 'paid', 'bhjk', 'rejected'),
(3, 'new3', 'new', 'new.png', 'new', 'new', 'male', '2023-03-02', '90', 'hjk', 'St', 'paid', 'bhjk', 'approved'),
(4, 'new4', '1234', 'noor kata (1).png', NULL, NULL, 'male', '2023-03-29', '07003512645', 'sinchannandy54@gmail.com', 'student', 'unpaid', '', 'approved'),
(5, 'new5', '1234', 'White and Black Modern Twitter Header.png', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'unpaid', '', 'rejected'),
(6, 'new6', '1234', 'Untitled design.png', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'unpaid', '', 'approved'),
(7, 'new6', '1234', 'Untitled design.png', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'unpaid', '', 'rejected'),
(8, 'new7', '123', 'Untitled design.png', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'paid', 'b679', 'approved'),
(9, '10min', '45', 'IMG-20220311-WA0006-02.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'unpaid', '', 'approved'),
(10, '10min', '89', 'IMG-20220311-WA0006-02.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'joh53506@zslsz.com', 'student', 'unpaid', '', 'approved'),
(11, '10min2', '56', 'IMG-20220311-WA0006-02.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'joh53506@zslsz.com', 'student', 'unpaid', '', 'approved'),
(12, 'ayush', 'rt', 'IMG-20220311-WA0006-02.jpeg', 'Ayush', 'Singh', 'male', '2023-04-04', '07003512645', 'hiayushsingh.co.in@gmail.com', 'student', 'unpaid', '', 'rejected'),
(13, 'new8', '34', 'White and Black Modern Twitter Header.png', 'Sinchan', 'Nandy', 'male', '2023-03-29', '07003512645', 'hjk@hjl.com', 'regular', 'unpaid', '', 'approved'),
(14, 'er', 'er', '', 'Sinchan', 'Nandy', 'male', NULL, '07003512645', 'sinchannandy54@gmail.com', 'teacher', 'unpaid', '', 'pending'),
(15, 'er3', 'er', '', 'Sinchan', 'Nandy', 'male', NULL, '07003512645', 'sinchannandy54@gmail.com', 'teacher', 'unpaid', '', 'pending'),
(16, 'er2', '2', 'Untitled design.png', 'Sinchan', 'Nandy', 'male', NULL, '07003512645', 'sinchannandy54@gmail.com', 'regular', 'unpaid', '', 'approved'),
(17, 'sinchan@2002', '2002', 'noor kata (1).png', 'Sinchan', 'Nandy', 'male', '2023-04-17', '07003512645', 'sinchannandy54@gmail.com', 'regular', 'unpaid', '', 'approved'),
(18, 'new2', '2', '', 'Sinchan', 'Nandy', 'male', NULL, '07003512645', 'sinchannandy54@gmail.com', 'regular', 'unpaid', '', 'rejected'),
(19, 'fhj1080', 'mazaaya', '20210401_124518-01.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-18', '07003512645', 'sinchannandy54@gmail.com', 'researcher', 'paid', 'uffaladaitaka', 'approved'),
(20, 'user', 'user', '2.png', 'Sinchan', 'Nandy', 'male', '2023-04-19', '07003512645', 'sinchannandy54@gmail.com', 'regular', 'paid', 'you', 'approved'),
(21, 'Ahana@baccha', 'Soumenamar', NULL, 'Ahana', 'Manna', 'female', '2023-04-20', '07003512645', 'ahanamanna1234@gmail.com', 'teacher', 'paid', 'IloveSoumen', 'rejected'),
(22, 'ronithlovesria', '1234', 'WhatsApp Image 2023-01-16 at 12.25.35.jpg', 'Ronith', 'Goon', 'male', '2023-04-20', '07003512645', 'ronith.goon@gmail.com', 'teacher', 'unpaid', '', 'rejected'),
(23, 'test', 'test', 'res.jpg', 'Sinchan', 'Nandy', 'male', '2002-03-27', '7003512645', 'sinchannandy54@gmail.com', 'student', 'unpaid', '', 'approved'),
(24, 'user@user', 'user', '20220507_152724-01.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-24', '07003512645', 'sinchannandy54@gmail.com', 'regular', 'unpaid', '', 'approved'),
(25, 'myself', 'myself', 'res.jpg', 'Sinchan', 'Nandy', 'male', '2023-04-24', '07003512645', 'sinchannandy54@gmail.com', 'regular', 'unpaid', '', 'approved');

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
('hello', 'hii', 'yu', 'yiu', 'yui', 'LMSTABLEUPDATED3.0.png', 'option1', 'hrf', 5, 'module 3&4.pdf'),
('I765', 'NewPDF223', 'hj', 'Bhuj', 'ok', '20230219155816_IMG_1105.JPG', 'option1', 'c++,java,moja', 343, 'export-4_16_2023, 10_17_14 PM.pdf'),
('I980', 'Great', 'Me', 'no one', 'wow', 'Screenshot (31).png', 'option1', 'head', 67, 'Resume_Updated_2.0.pdf'),
('Moja', 'moja', 'moja', 'moja', 'moja', 'Untitled design.png', 'option2', 'moja', 2, 'Noor web_organized_compressed.pdf'),
('S01', 'C++', 'T Java', 'U java', 'YUO', 'Screenshot 2023-03-01 222844.png', 'option2', 'C++,K++', 10, 'College Projects.pdf');

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
(1, 'I8978', 'Maja', 'New', 'Wow', 'Wow', 'IMG-20230406-WA0018.jpg', 'option2', 'you', '2023-09-08', 'kolkata', NULL, NULL, 34),
(2, 'I05908', '23', '23', '23', '23', 'noor kata (1).png', 'option1', '23', NULL, '23', NULL, NULL, 3),
(3, 'I420', 'Research on Baccha', 'Kaka', 'Kaka2', 'Baccha 3', 'WhatsApp Image 2023-01-16 at 12.25.35.jpg', 'Nirlojjo', '1 kg', '2023-01-01', 'Ke jane', 'Gere', 420, 45);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USERNAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `PROFILEPICTURE` varchar(100) DEFAULT NULL,
  `FIRSTNAME` varchar(100) DEFAULT NULL,
  `LASTNAME` varchar(100) DEFAULT NULL,
  `GENDER` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `CATEGORY` varchar(100) DEFAULT NULL,
  `MEMBERSHIP` varchar(100) DEFAULT NULL,
  `MEMBERSHIPEXPIRE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USERNAME`, `PASSWORD`, `PROFILEPICTURE`, `FIRSTNAME`, `LASTNAME`, `GENDER`, `DOB`, `PHONE`, `EMAIL`, `CATEGORY`, `MEMBERSHIP`, `MEMBERSHIPEXPIRE`) VALUES
('10min', '89', 'IMG-20220311-WA0006-02.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'joh53506@zslsz.com', 'student', 'active', NULL),
('10min2', '56', 'IMG-20220311-WA0006-02.jpeg', 'Sinchan', 'Nandy', 'male', '2022-04-01', '07003512645', 'joh53506@zslsz.com', 'student', 'active', NULL),
('er2', '2', 'Untitled design.png', 'Sinchan', 'Nandy', 'male', NULL, '07003512645', 'sinchannandy54@gmail.com', 'regular', 'active', '2024-04-24'),
('fhj1080', 'mazaaya', '20210401_124518-01.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-18', '07003512645', 'sinchannandy54@gmail.com', 'researcher', 'active', '2024-04-24'),
('myself', 'myself', 'res.jpg', 'Sinchan', 'Nandy', 'male', '2023-04-24', '07003512645', 'sinchannandy54@gmail.com', 'regular', 'active', '2024-04-24'),
('new4', '1234', 'noor kata (1).png', NULL, NULL, 'male', '2023-03-29', '07003512645', 'sinchannandy54@gmail.com', 'student', 'active', '2024-04-24'),
('new6', '1234', 'Untitled design.png', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'active', NULL),
('new7', '123', 'Untitled design.png', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'active', NULL),
('new8', '34', 'White and Black Modern Twitter Header.png', 'Sinchan', 'Nandy', 'male', '2023-03-29', '07003512645', 'hjk@hjl.com', 'regular', 'active', NULL),
('sinchan@2002', '2002', 'noor kata (1).png', 'Sinchan', 'Nandy', 'male', '2023-04-17', '07003512645', 'sinchannandy54@gmail.com', 'regular', 'inactive', '2023-04-15'),
('test', 'test', 'res.jpg', 'Sinchan', 'Nandy', 'male', '2002-03-27', '7003512645', 'sinchannandy54@gmail.com', 'student', 'active', '2024-04-21'),
('user', 'user', '2.png', 'Sinchan', 'Nandy', 'male', '2023-04-19', '07003512645', 'sinchannandy54@gmail.com', 'regular', 'active', NULL),
('user@user', 'user', '20220507_152724-01.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-24', '07003512645', 'sinchannandy54@gmail.com', 'regular', 'active', '2024-04-24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

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
  ADD UNIQUE KEY `itid` (`itid`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`BRID`),
  ADD KEY `USERNAME` (`USERNAME`),
  ADD KEY `ITID` (`ITID`);

--
-- Indexes for table `connector`
--
ALTER TABLE `connector`
  ADD PRIMARY KEY (`itid`);

--
-- Indexes for table `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`did`),
  ADD KEY `username` (`username`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `fine`
--
ALTER TABLE `fine`
  ADD PRIMARY KEY (`FID`),
  ADD KEY `fk_user` (`Username`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`jid`),
  ADD UNIQUE KEY `itid` (`itid`);

--
-- Indexes for table `magazines`
--
ALTER TABLE `magazines`
  ADD PRIMARY KEY (`mid`),
  ADD UNIQUE KEY `itid` (`itid`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`MSID`),
  ADD KEY `USERNAME` (`USERNAME`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `Username` (`Username`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`RSID`);

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
  ADD UNIQUE KEY `itid` (`itid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USERNAME`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternative`
--
ALTER TABLE `alternative`
  MODIFY `AID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `BRID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `downloads`
--
ALTER TABLE `downloads`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fine`
--
ALTER TABLE `fine`
  MODIFY `FID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `jid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `magazines`
--
ALTER TABLE `magazines`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `MSID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `RSID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `theses`
--
ALTER TABLE `theses`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alternative`
--
ALTER TABLE `alternative`
  ADD CONSTRAINT `alternative_ibfk_3` FOREIGN KEY (`ITID`) REFERENCES `connector` (`itid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alternative_ibfk_4` FOREIGN KEY (`SID`) REFERENCES `softcopy` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`itid`) REFERENCES `connector` (`itid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`USERNAME`) REFERENCES `users` (`USERNAME`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`ITID`) REFERENCES `connector` (`itid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloads`
--
ALTER TABLE `downloads`
  ADD CONSTRAINT `downloads_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`USERNAME`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `downloads_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `softcopy` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fine`
--
ALTER TABLE `fine`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`Username`) REFERENCES `users` (`USERNAME`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `journals`
--
ALTER TABLE `journals`
  ADD CONSTRAINT `journals_ibfk_1` FOREIGN KEY (`itid`) REFERENCES `connector` (`itid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `magazines`
--
ALTER TABLE `magazines`
  ADD CONSTRAINT `magazines_ibfk_1` FOREIGN KEY (`itid`) REFERENCES `connector` (`itid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`USERNAME`) REFERENCES `users` (`USERNAME`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `users` (`USERNAME`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theses`
--
ALTER TABLE `theses`
  ADD CONSTRAINT `theses_ibfk_1` FOREIGN KEY (`itid`) REFERENCES `connector` (`itid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

