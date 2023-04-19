-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2023 at 10:41 AM
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
(1, 'I01', 'new', 'new', 'new', 'new.png', 'new new new', 'Java', 'java,prog', 'new', 300, 4, 'aB'),
(2, 'I02', 'hello', 'hello', 'hello', 'hello.jpg', 'hello', 'c++', 'c++,c', 'new', 45, 4, 'fg'),
(4, 'I03', 'hello', 'hello', 'hello', 'hello.jpg', 'hello', 'c++', 'c++,c,new\r\n', 'new', 45, 4, 'fg'),
(5, 'I04', 'Maza', 'new', 'hu', 'http://localhost:8080/books', 'wow', 'Bengali', 'huiii', '3', 34, 34, 'DF'),
(7, 'I0909', 'er', 'we', 'we', '273459962_1636113900055442_7228868579176044961_n.jpg', 'we', 'we', 'we', '3', 3, 3, '3');

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
('I960', 'book'),
('ty', 'journal');

-- --------------------------------------------------------

--
-- Table structure for table `fine`
--

CREATE TABLE `fine` (
  `FID` int(11) NOT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `Finedate` date DEFAULT NULL,
  `Amount` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(4, 'I10', '1', '1', '1', '1', NULL, 'option1', '1', 2003, 2023, 1, 1),
(5, 'ty', 'tyu', 'ty', 'ht', 'bg', 'Untitled design.png', 'option2', 'fb', 335, 456, 4, 4);

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
  `Approved` varchar(100) DEFAULT NULL
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
(4, 'new4', '1234', 'noor kata (1).png', NULL, NULL, 'male', '2023-03-29', '07003512645', 'sinchannandy54@gmail.com', 'student', 'unpaid', '', 'pending'),
(5, 'new5', '1234', 'White and Black Modern Twitter Header.png', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'unpaid', '', 'rejected'),
(6, 'new6', '1234', 'Untitled design.png', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'unpaid', '', 'approved'),
(7, 'new6', '1234', 'Untitled design.png', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'unpaid', '', 'rejected'),
(8, 'new7', '123', 'Untitled design.png', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'paid', 'b679', 'approved'),
(9, '10min', '45', 'IMG-20220311-WA0006-02.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'unpaid', '', 'approved'),
(10, '10min', '89', 'IMG-20220311-WA0006-02.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'joh53506@zslsz.com', 'student', 'unpaid', '', 'pending'),
(11, '10min2', '56', 'IMG-20220311-WA0006-02.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'joh53506@zslsz.com', 'student', 'unpaid', '', 'approved'),
(12, 'ayush', 'rt', 'IMG-20220311-WA0006-02.jpeg', 'Ayush', 'Singh', 'male', '2023-04-04', '07003512645', 'hiayushsingh.co.in@gmail.com', 'student', 'unpaid', '', 'rejected'),
(13, 'new8', '34', 'White and Black Modern Twitter Header.png', 'Sinchan', 'Nandy', 'male', '2023-03-29', '07003512645', 'hjk@hjl.com', 'regular', 'unpaid', '', 'approved'),
(14, 'er', 'er', '', 'Sinchan', 'Nandy', 'male', NULL, '07003512645', 'sinchannandy54@gmail.com', 'teacher', 'unpaid', '', 'pending'),
(15, 'er3', 'er', '', 'Sinchan', 'Nandy', 'male', NULL, '07003512645', 'sinchannandy54@gmail.com', 'teacher', 'unpaid', '', 'pending'),
(16, 'er2', '2', 'Untitled design.png', 'Sinchan', 'Nandy', 'male', NULL, '07003512645', 'sinchannandy54@gmail.com', 'regular', 'unpaid', '', 'pending'),
(17, 'sinchan@2002', '2002', 'noor kata (1).png', 'Sinchan', 'Nandy', 'male', '2023-04-17', '07003512645', 'sinchannandy54@gmail.com', 'regular', 'unpaid', '', 'approved'),
(18, 'new2', '2', '', 'Sinchan', 'Nandy', 'male', NULL, '07003512645', 'sinchannandy54@gmail.com', 'regular', 'unpaid', '', 'rejected'),
(19, 'fhj1080', 'mazaaya', '20210401_124518-01.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-18', '07003512645', 'sinchannandy54@gmail.com', 'researcher', 'paid', 'uffaladaitaka', 'pending');

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
  `MEMBERSHIP` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USERNAME`, `PASSWORD`, `PROFILEPICTURE`, `FIRSTNAME`, `LASTNAME`, `GENDER`, `DOB`, `PHONE`, `EMAIL`, `CATEGORY`, `MEMBERSHIP`) VALUES
('10min', '45', 'IMG-20220311-WA0006-02.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'active'),
('10min2', '56', 'IMG-20220311-WA0006-02.jpeg', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'joh53506@zslsz.com', 'student', 'active'),
('new6', '1234', 'Untitled design.png', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'active'),
('new7', '123', 'Untitled design.png', 'Sinchan', 'Nandy', 'male', '2023-04-04', '07003512645', 'sinchannandy54@gmail.com', 'student', 'active'),
('new8', '34', 'White and Black Modern Twitter Header.png', 'Sinchan', 'Nandy', 'male', '2023-03-29', '07003512645', 'hjk@hjl.com', 'regular', 'active'),
('sinchan@2002', '2002', 'noor kata (1).png', 'Sinchan', 'Nandy', 'male', '2023-04-17', '07003512645', 'sinchannandy54@gmail.com', 'regular', 'active');

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
  MODIFY `AID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `BRID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fine`
--
ALTER TABLE `fine`
  MODIFY `FID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `jid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `RSID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
