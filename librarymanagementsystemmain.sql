DROP DATABASE librarymanagementsystem;
CREATE DATABASE librarymanagementsystem;
use librarymanagementsystem;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2023 at 09:28 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
('admin', 'admin');

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
(1, 'I01', 'S01'),
(2, 'I01', 'S02'),
(3, 'I12', 'S04'),
(4, 'I12', 's05'),
(5, 'I13', 'S05'),
(6, 'I13', 'S06');

-- --------------------------------------------------------

--
-- Table structure for table `bookdonations`
--

CREATE TABLE `bookdonations` (
  `bdnid` int(11) NOT NULL,
  `donorname` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(500) DEFAULT NULL,
  `publisher` varchar(500) DEFAULT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `keywords` longtext DEFAULT NULL,
  `edition` varchar(100) DEFAULT NULL,
  `pageno` int(11) DEFAULT NULL,
  `donationdate` date DEFAULT NULL,
  `approved` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bid` int(11) NOT NULL,
  `itid` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(500) NOT NULL,
  `publisher` varchar(500) NOT NULL,
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
(1, 'I01', 'Programming with Raspberry PI', 'Simon Monk', 'McGraw Hill TAB', '20230507_125020_649_B1.jpg', 'Learn to create inventive programs and fun games on your powerful Raspberry Pi―with no programming experience required. This practical book has been revised to fully cover the new Raspberry Pi 2, including upgrades to the Raspbian operating system. Discover how to configure hardware and software, write Python scripts, create user-friendly GUIs, and control external electronics. DIY projects include a hangman game, RGB LED controller, digital clock, and RasPiRobot complete with an ultrasonic rangefinder.', 'Programming', 'Raspberry Pi, GPIO (General Purpose Input/Output), Linux operating system, Remote access and control', '2', 208, 22, '1-S, 2-R'),
(2, 'I02', 'Advanced Python Programming', 'Sakis Kasampalis Quan Nguyen Dr Gabriele Lanaro Dr. Gabriele Lanaro ', 'Ingram short title', '20230507_125051_374_B2.jpg', 'This Learning Path shows you how to leverage the power of both native and third-party Python libraries for building robust and responsive applications. You will learn about profilers and reactive programming, concurrency and parallelism, as well as tools for making your apps quick and efficient. You will discover how to write code for parallel architectures using TensorFlow and Theano, and use a cluster of computers for large-scale computations using technologies such as Dask and PySpark. With the knowledge of how Python design patterns work, you will be able to clone objects, secure interfaces, dynamically choose algorithms, and accomplish much more in high performance computing. By the end of this Learning Path, you will have the skills and confidence to build engaging models that quickly offer efficient solutions to your problems.\r\n\r\nThis Learning Path includes content from the following Packt products:\r\n\r\nPython High Performance - Second Edition by Gabriele Lanaro\r\nMastering Concurrency in Python by Quan Nguyen\r\nMastering Python Design Patterns by Sakis Kasampalis\r\nWhat you will learn\r\nUse NumPy and pandas to import and manipulate datasets\r\nAchieve native performance with Cython and Numba\r\nWrite asynchronous code using asyncio and RxPy\r\nDesign highly scalable programs with application scaffolding\r\nExplore abstract methods to maintain data consistency\r\nClone objects using the prototype pattern\r\nUse the adapter pattern to make incompatible interfaces compatible\r\nEmploy the strategy pattern to dynamically choose an algorithm\r\nWho this book is for\r\nThis Learning Path is specially designed for Python developers who want to build high-performance applications and learn about single core and multi-core programming, distributed concurrency, and Python design patterns. Some experience with Python programming language will help you get the most out of this Learning Path.', 'Programming', 'Python, Advance Python, Programming, Dask, PySpark', '1st', 672, 1, '2-S, 4-R'),
(3, 'I03', 'Advances in Computer, Information, and Systems Sciences, and Engineering', 'Khaled Elleithy, Tarek Sobh, Ausif Mahmood, Magued Iskander, Mohammad A. Karim', 'Springer', '20230507_125157_772_B3.jpg', 'The conference proceedings of:\r\n\r\nInternational Conference on Industrial Electronics, Technology & Automation (IETA 05)\r\nInternational Conference on Telecommunications and Networking (TeNe 05)\r\nInternational Conference on Engineering Education, Instructional Technology, Assessment, and E-learning (EIAE 05)\r\ninclude a set of rigorously reviewed world-class manuscripts addressing and detailing state-of-the-art research projects in the areas of: Industrial Electronics, Technology and Automation, Telecommunications, Networking, Engineering Education, Instructional Technology and e-Learning.\r\n\r\nThe three conferences, (IETA 05, TENE 05 and EIAE 05) were part of the International Joint Conference on Computer, Information, and System Sciences, and Engineering (CISSE 2005).\r\n\r\nCISSE 2005, the World\'s first Engineering/Computing and Systems Research E-Conference was the first high-caliber Research Conference in the world to be completely conducted online in real-time via the internet.\r\n\r\nCISSE received 255 research paper submissions and the final program included 140 accepted papers, from more than 45 countries. The whole concept and format of CISSE 2005 was very exciting and ground-breaking. The powerpoint presentations, final paper manuscripts and time schedule for live presentations over the web had been available for 3 weeks prior to the start of the conference for all registrants, so they could pick and choose the presentations they want to attend and think about questions that they might want to ask. The live audio presentations were also recorded and are part of the permanent CISSE archive, which includes all power point presentations, papers and recorded presentations.\r\n\r\nAll aspects of the conference were managed on-line; not only the reviewing, submissions and registration processes; but also the actual conference. Conference participants - authors, presenters and attendees - only needed an internet connection and sound available on their computers in order to be able to contribute and participate in this international ground-breaking conference. The on-line structure of this high-quality event allowed academic professionals and industry participants to contribute work and attend world-class technical presentations based on rigorously refereed submissions, live, without the need for investing significant travel funds or time out of the office. Suffice to say that CISSE received submissions from more than 50 countries, for whose researchers, this opportunity presented a much more affordable, dynamic and well-planned event to attend and submit their work to, versus a classic, on-the-ground conference.\r\n\r\nThe CISSE conference audio room provided superb audio even over low speed internet connections, the ability to display PowerPoint presentations, and cross-platform compatibility (the conferencing software runs on Windows, Mac, and any other operating system that supports Java). In addition, the conferencing system allowed for an unlimited number of participants, which in turn granted CISSE the opportunity to allow all participants to attend all presentations, as opposed to limiting the number of available seats for each session.\r\n\r\nThe implemented conferencing technology, starting with the submission & review system and ending with the online conferencing capability, allowed CISSE to conduct a very high quality, fulfilling event for all participants.', 'Engineering', 'High-Performance Computing, Software Engineering, Information Retrieval, Database Systems', '2006', 12078, 10, '1-S, 4-R'),
(4, 'I04', 'Advances in Business, Management and Entrepreneurship', 'Ratih Hurriyati, Benny Tjahjono, Ade Gafar Abdullah, Sulastri, Lisnawati', ' CRC Press', '20230507_125216_959_B4.jpg', 'The GCBME Book Series aims to promote the quality and methodical reach of the Global Conference on Business Management & Entrepreneurship, which is intended as a high-quality scientific contribution to the science of business management and entrepreneurship. The Contributions are expected to be the main reference articles on the topic of each book and have been subject to a strict peer review process conducted by experts in the fields. The conference provided opportunities for the delegates to exchange new ideas and implementation of experiences, to establish business or research connections and to find Global Partners for future collaboration.\r\n\r\nThe conference and resulting volume in the book series is expected to be held and appear annually. The year 2019 theme of book and conference is \"Transforming Sustainable Business In The Era Of Society 5.0\". The ultimate goal of GCBME is to provide a medium forum for educators, researchers, scholars, managers, graduate students and professional business persons from the diverse cultural backgrounds, to present and discuss their research, knowledge and innovation within the fields of business, management and entrepreneurship. The GCBME conferences cover major thematic groups, yet opens to other relevant topics: Organizational Behavior, Innovation, Marketing Management, Financial Management and Accounting, Strategic Management, Entrepreneurship and Green Business.', 'Business', 'Artificial Intelligence (AI), Natural Language Processing (NLP), Internet of Things (IoT)', '1st', 748, 35, '3-S, 5-R'),
(5, 'I05', 'J.A.I.: JAVA ADVANCED IMAGING', 'Manisha Sharma', 'Kindle', '20230507_125232_199_B5.jpg', 'Java Advanced Imaging (J.A.I.) is a technical programming application based on Java Technology.\r\nJava API allows the programmers to develop different internet based applications and filters. The book illustrates an introduction to java applets and J.A.I. technology tools that implement classes and methods for achieving image synthesis based results. This book also includes required source code, screen layouts as well as algorithm for the practical implementation and demonstration.', 'Java', 'programming, java, Advance Java, OOPS (Object Oriented Programming System)', '1st', 55, 14, '3-S, 2-R'),
(6, 'I06', 'Sri Ramcharitmanas', 'Goswami Tulshidas', 'Gita Press Gorakhpur', '20230507_125243_527_B6.jpg', 'Ramcharitramanas is an epic poem composed by the Indian poet-saint Tulsidas in the 16th century. It is a retelling of the Hindu epic, Ramayana, which tells the story of Lord Rama, an incarnation of Lord Vishnu, and his battle against the demon king Ravana to rescue his wife Sita.\r\n\r\nThe Ramcharitramanas is written in Awadhi, a dialect of Hindi, and is divided into seven books, each consisting of several chapters. The first book, Balakanda, tells the story of Rama\'s childhood and his marriage to Sita. The second book, Ayodhyakanda, describes the events leading up to Rama\'s exile to the forest. The third book, Aranyakanda, describes Rama\'s life in the forest and his encounters with various sages and demons. The fourth book, Kishkindhakanda, tells the story of Rama\'s meeting with Hanuman and his battle against the demon king Vali. The fifth book, Sundarakanda, describes the events leading up to the discovery of Sita\'s whereabouts. The sixth book, Lankakanda, describes the battle between Rama and Ravana, and the seventh book, Uttarakanda, tells the story of Rama\'s return to Ayodhya and his coronation as king.\r\n\r\nRamcharitramanas is considered to be one of the most important works of Hindi literature and has had a profound impact on the devotional traditions of Hinduism. It is often recited in temples and homes during religious ceremonies and festivals, and has been adapted into numerous plays, films, and musical compositions.', 'Devotional', 'Ramcharitmanas, ramayana, shri ram katha', '2nd', 1780, 34, '2-S, 5-R');

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
('I01', 'magazine'),
('i02', 'book'),
('I03', 'book'),
('I04', 'book'),
('I05', 'book'),
('I06', 'book'),
('I07', 'magazine'),
('I08', 'magazine'),
('I09', 'magazine'),
('I10', 'magazine'),
('I11', 'magazine'),
('I12', 'theses'),
('I13', 'theses'),
('I14', 'theses'),
('I15', 'theses'),
('I16', 'theses'),
('I17', 'journal'),
('I18', 'journal'),
('I19', 'journal');

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

-- --------------------------------------------------------

--
-- Table structure for table `journaldonations`
--

CREATE TABLE `journaldonations` (
  `jdnid` int(11) NOT NULL,
  `donorname` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `publisher` varchar(500) DEFAULT NULL,
  `editor` varchar(500) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `keywords` longtext DEFAULT NULL,
  `startyear` int(11) DEFAULT NULL,
  `endyear` int(11) DEFAULT NULL,
  `pageno` int(11) DEFAULT NULL,
  `donationdate` date DEFAULT NULL,
  `approved` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `jid` int(11) NOT NULL,
  `itid` varchar(100) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `publisher` varchar(500) NOT NULL,
  `editor` varchar(500) DEFAULT NULL,
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
(1, 'I17', 'Nature', 'Springer Nature', 'Magdalena Skipper', ' Nature is a multidisciplinary scientific journal that publishes original research articles, reviews, and news articles on a wide range of topics in the natural sciences, including biology, chemistry, physics, earth sciences, and astronomy. The journal also publishes commentary and opinion pieces on scientific policy and research funding.', '20230507_125301_812_J1.jpg', 'Natural Sciences', 'Science, research, biology, chemistry, physics, earth sciences, astronomy, scientific policy, research funding', 1869, 0, 120, 2),
(2, 'I18', 'Journal of the American Medical Association (JAMA)', 'American Medical Association', 'Howard Bauchner', 'The Journal of the American Medical Association (JAMA) is a peer-reviewed medical journal that publishes original research articles, reviews, editorials, and clinical practice guidelines on a wide range of medical topics, including clinical medicine, public health, and biomedical research. The journal also features opinion pieces, essays, and commentaries on contemporary issues in medicine.', '20230507_125316_384_J2.jpg', 'Medicine and Healthcare', 'Medical research, clinical medicine, public health, biomedical research, clinical practice guidelines, contemporary issues in medicine', 1883, 0, 100, 10),
(3, 'I19', 'Science', 'American Association for the Advancement of Science (AAAS)', 'Holden Thorp', 'Science is a weekly peer-reviewed scientific journal that publishes original research articles, reviews, and news articles on all areas of science, including life sciences, physical sciences, social sciences, and computer science. The journal also features commentary and analysis on scientific policy and research funding, as well as book reviews and opinion pieces.', '20230507_125330_662_J3.jpg', 'Natural Sciences', 'Scientific research, life sciences, physical sciences, social sciences, computer science, scientific policy, research funding, book reviews, opinion pieces', 1880, 0, 180, 43);

-- --------------------------------------------------------

--
-- Table structure for table `magazinedonations`
--

CREATE TABLE `magazinedonations` (
  `mdnid` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `donorname` varchar(100) DEFAULT NULL,
  `publisher` varchar(500) DEFAULT NULL,
  `issuedate` date DEFAULT NULL,
  `issuenumber` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `frequency` varchar(100) DEFAULT NULL,
  `keywords` longtext DEFAULT NULL,
  `specialissue` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `donationdate` date DEFAULT NULL,
  `approved` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `magazines`
--

CREATE TABLE `magazines` (
  `mid` int(11) NOT NULL,
  `itid` varchar(100) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `publisher` varchar(500) NOT NULL,
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
(1, 'I07', 'TELL ME WHY', 'MANORAMA', '2022-09-01', '189', 'June 2022', '20230507_125448_009_M1.jpg', 'MONTHLY', 'June 2022, Tell Me Why, Children', 'APJ ABDUL KALAM TRIBUTE', 'EDUCATIONAL', 1),
(2, 'I08', 'TELL ME WHY', 'MANORAMA', '2022-09-01', '192', 'The latest special edition of \"Tell Me Why\" magazine is a must-read for any young adventurer or nature lover! In this issue, the focus is on some of the most breathtaking and awe-inspiring natural wonders on the planet: national parks. From the rugged peaks of Yosemite to the sprawling plains of the Serengeti, this magazine takes young readers on a journey through some of the most incredible landscapes on earth. Through vivid descriptions, stunning photography, and fascinating stories, this special edition of \"Tell Me Why\" brings the magic of these world-famous national parks to life. Whether your child is a seasoned nature enthusiast or just starting to explore the great outdoors, this magazine is the perfect guide to some of the most remarkable places on earth. So join us on this thrilling adventure, and discover the beauty and wonder of our planet', '20230507_125507_150_M2.jpg', 'MONTHLY', 'Tell Me Why magazine, National Parks, Special edition, Young adventurer, Nature lover, Breathtaking, Awe-inspiring, Natural wonders, Yosemite, Serengeti, Landscapes, Vivid descriptions, Stunning photography, Fascinating stories, World-famous, Magic, Great outdoors, Nature enthusiast, Remarkable places, Beauty, Wonder', 'WORLD FAMOUS NATIONAL PARKS', 'EDUCATIONAL', 1),
(3, 'I09', 'ANANDAMELA', 'ABP GROUPS', '2020-09-20', '432', 'The latest special edition of \"Anandamela\" magazine is a thought-provoking and informative publication that explores the most significant historical mistakes made by civilizations and individuals over time. Through engaging articles, captivating illustrations, and insightful analysis, this edition sheds light on some of the most critical errors in human history that have shaped the world as we know it today. From political blunders to military miscalculations, readers will gain a deeper understanding of how mistakes in history have had a lasting impact on society, culture, and global events. This edition of \"Anandamela\" is perfect for young readers who are curious about history and the lessons we can learn from it. It encourages critical thinking and fosters a greater appreciation for the complexities of the past. Whether your child is a history buff or just starting to explore the subject, this special edition is sure to captivate their imagination and inspire a lifelong love of learning.', '20230507_125521_458_M3.jpg', 'FORTNIGHTLY', ' Anandamela magazine, Special edition, Historical mistakes, Thought-provoking, Informative, Civilizations, Individuals, Engaging articles, Captivating illustrations, Insightful analysis, Political blunders, Military miscalculations, Lasting impact, Society, Culture, Global events, Critical thinking, History buff, Lessons, Past, Imagination, Lifelong learning', 'N/A', 'EDUCATIONAL', 2),
(4, 'I10', 'KISHORE BHARATI SHARADIYA 1427', 'PATRA BHARATI', '2020-08-01', '143', 'The Kishore Bharati Sharadiya 1427 Bengali Year is a special edition magazine that celebrates the festive spirit of Durga Puja and the arrival of autumn in Bengal. This annual publication is eagerly awaited by readers, as it brings together a wealth of entertaining and informative content for young adults. The 2020 edition of Kishore Bharati Sharadiya is packed with engaging features, including gripping stories, fascinating interviews, thought-provoking articles, and much more. It also features stunning artwork, colorful illustrations, and eye-catching designs that capture the essence of the season. This edition is perfect for young Bengali readers who are looking to immerse themselves in the rich culture and tradition of their homeland. It provides a unique opportunity to explore the cultural heritage of Bengal and learn about the customs and traditions associated with Durga Puja. With its rich content and vibrant presentation, the Kishore Bharati Sharadiya 1427 Bengali Year edition is sure to captivate and entertain readers of all ages.', '20230507_125539_415_M4.jpg', 'YEARLY', 'Kishore Bharati Sharadiya, 1427 Bengali Year, Durga Puja, Festive spirit, Autumn, Bengal, Annual publication, Young adults, Gripping stories, Fascinating interviews, Thought-provoking articles, Stunning artwork, Colorful illustrations, Eye-catching designs, Cultural heritage, Customs, Traditions, Rich content, Vibrant presentation, Entertaining, Captivating', 'N/A', 'CHILDREN', 2),
(5, 'I11', 'SUKTARA AUGUST 2018', 'DEV SAHITYA KUTIR', '2018-08-01', '7', 'The August 2018 edition of Suktara magazine is a must-read for Bengali literature enthusiasts. This monthly publication is known for its rich literary content and engaging storytelling, and the August 2018 edition is no exception. It features a diverse range of articles, including thought-provoking essays, captivating short stories, and insightful interviews with notable figures in Bengali literature. In addition to its literary content, Suktara also includes sections on lifestyle, culture, and current events, providing readers with a well-rounded and informative reading experience. The magazine', '20230507_125553_669_M5.jpg', 'MONTHLY', 'Suktara magazine, Bengali literature, August 2018, Monthly publication, Literary content, Storytelling, Essays, Short stories, Interviews, Notable figures, Lifestyle, Culture, Current events, Informative, High-quality design, Artwork, Visually stunning, Captivating, Thought-provoking.', 'N/A', 'CHILDREN', 3);

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
(1, 'user', '$2a$10$WjIn2G0Blds9zEWnaLcLte6J3hIfHjJ0FOft7RZIh6b4aA7StRuVu', '20230507_123027_049_user.jpg', 'John', 'Doe', 'male', '1995-08-16', '6291872399', 'hisumitsingh.co.in@gmail.com', 'student', 'unpaid', '', 'approved');

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
('S01', 'Chokher Bali', 'Rabindranath Tagore', 'Biswa Bharati Prakashani', '\"Chokher Bali\" is a novel by the famous Bengali author Rabindranath Tagore. The story revolves around four main characters - Binodini, Mahendra, Asha, and Bihari - and their complex relationships with one another. Binodini, a young widow, comes to live with Mahendra and his mother after her husband', '20230507_124636_257_S1.png', 'Drama', 'Chokher Bali, Rabindranath Tagore, Bengali literature, novel, love triangle, widow, societal expectations, jealousy, betrayal, desire, Indian culture, Kolkata, relationships, Indian women, gender roles, infidelity, family dynamics, tradition, modernity, social norms, moral conflicts.', 202, '20230507_124636_250_S1.pdf'),
('S02', 'Feluda Samagra', 'Satyajit Ray', 'Ananda Publishers', '\"Feluda Samagra\" is a collection of detective stories featuring the fictional character Feluda, a private investigator from Kolkata, India. The stories were written by the renowned Bengali filmmaker and author Satyajit Ray, who created Feluda in 1965. Feluda, whose real name is Pradosh C. Mitter, is accompanied by his cousin Topshe and his friend Lalmohan Ganguly, also known as Jatayu, as they solve various mysteries and crimes.  The stories in \"Feluda Samagra\" are set in different locations across India and sometimes abroad. The collection includes 35 stories and two novels, each showcasing Feluda', '20230507_124701_634_S2.jpg', 'Detective', 'Feluda, Pradosh C. Mitter, Satyajit Ray, private investigator, detective, mystery, crime, Kolkata, India, Jatayu, Topshe, deductive reasoning, espionage, theft, murder, Indian culture, Indian history, Bengali literature, classic, beloved, entertainment.', 710, '20230507_124701_537_S2.pdf'),
('S03', 'Atomic Habits (Bengali)', 'James Clear', 'New York Times', '\"Atomic Habits\" is a self-help book that provides a practical guide to improving one', '20230507_124724_937_S3.png', 'Self-Help', 'Atomic Habits, James Clear, self-help, personal growth, professional growth, habits, behavior, incremental change, core values, positive habits, obstacle, procrastination, distraction, process, celebration, real-world examples, practical exercises, evidence-based approach.', 176, '20230507_124724_909_S3.pdf'),
('S04', 'A Christmas Carol', 'Charles Dickens', 'Chapman & Hall', '\"A Christmas Carol\" is a novella by Charles Dickens that tells the story of a bitter old miser named Ebenezer Scrooge, who is visited by the ghosts of Christmas past, present, and future. The story takes place on Christmas Eve in mid-19th century London, England.  The first part of the story establishes Scrooge', '20230507_124751_990_S4.jpg', 'Fiction', 'A Christmas Carol, Charles Dickens, novella, Christmas, London, Ebenezer Scrooge, ghosts, redemption, compassion, kindness, generosity, community, social commentary, poverty, wealth inequality, holiday classic.', 65, '20230507_124751_977_S4.pdf'),
('S05', 'Complete Reference Of Java', 'Herbert Schildt', 'Mc Graw Hill', '\"The Complete Reference Of Java\" is a comprehensive guide to the Java programming language written by Herbert Schildt. The book covers all the essential concepts of Java programming, from the basics of the language syntax to advanced topics such as multithreading, network programming, and GUI development.  The book is organized into three parts. Part I provides an introduction to Java programming, including an overview of the language', '20230507_124845_573_S5.jpg', 'Programming', 'Java programming language, Herbert Schildt, syntax, multithreading, network programming, GUI development, data types, operators, control statements, arrays, classes, objects, inheritance, interfaces, packages, exception handling, Collections framework, I/O streams, JavaBeans, component architecture, review questions, exercises.', 32, '20230507_124845_569_S5.pdf'),
('S06', 'Programming with RaspBerryPI', 'Simon Monk', 'McGraw Hill', '\"Programming with Raspberry Pi\" is a guidebook that provides an introduction to programming with the Raspberry Pi, a small and affordable computer that is widely used for DIY projects, prototyping, and learning programming. The book covers the basics of programming with Python, which is one of the most popular programming languages used with the Raspberry Pi.  The book is organized into three parts. Part I provides an introduction to the Raspberry Pi, including how to set up the hardware and software. It also covers the basics of programming with Python, including data types, variables, operators, and control statements.  Part II covers more advanced topics in programming with the Raspberry Pi, such as functions, modules, object-oriented programming, and file handling. This section also covers how to interface with the Raspberry Pi', '20230507_124947_678_S6.jpg', 'Hardware', 'Raspberry Pi, programming, Python, hardware, software, data types, variables, operators, control statements, functions, modules, object-oriented programming, file handling, GPIO, home automation, robotics, projects, review questions, exercises.', 219, '20230507_124947_482_S6.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `softcopydonations`
--

CREATE TABLE `softcopydonations` (
  `sdnid` int(11) NOT NULL,
  `donorname` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `keywords` longtext DEFAULT NULL,
  `pageno` int(11) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `donationdate` date DEFAULT NULL,
  `approved` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theses`
--

CREATE TABLE `theses` (
  `tid` int(11) NOT NULL,
  `itid` varchar(100) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `researcher` varchar(500) NOT NULL,
  `guides` varchar(500) NOT NULL,
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
(1, 'I12', 'A Novel Approach for Alzheimers Disease Diagnosis Using Soft Computing Techniques', 'Sarita', 'Mukherjee,Saurabh', 'The thesis aims to propose a novel approach for the diagnosis of Alzheimer', '20230507_123502_064_T1.png', 'Medical', 'Computer Science Computer Science Interdisciplinary Applications Engineering and Technology Soft computing', '2021-01-01', 'Banasthali', 'newline', 50, 5),
(2, 'I13', 'Isolation, Identification and Characterization of Chlorella Strain as a Potential Biofuel Source', ' Wahi Nitin', 'A K Bhatia and Seema Bhadauria', 'The thesis in Life Sciences, Microbiology, Biotechnology, and Applied Microbiology can cover a broad range of topics related to the study of microorganisms and their applications in various fields. Some possible thesis descriptions in this area could include:  1. Development of a new antimicrobial agent: This thesis could focus on the discovery, development, and characterization of a new antimicrobial agent to combat bacterial infections. The research may involve screening of natural products or synthesis of new compounds, testing their efficacy against various bacterial strains, and investigating their mode of action.  2. Bioremediation of contaminated environments: This thesis could investigate the use of microorganisms for the cleanup of contaminated environments, such as soil or water. The research may involve identifying suitable microorganisms, optimizing their growth conditions, and evaluating their effectiveness in removing pollutants.  3. Production of biofuels: This thesis could focus on the use of microorganisms to produce biofuels, such as ethanol or biodiesel. The research may involve optimizing the fermentation process, investigating different substrates for microbial growth, and assessing the economic feasibility of the process.  4. Industrial applications of microorganisms: This thesis could investigate the use of microorganisms in various industrial applications, such as food and beverage production, pharmaceuticals, or bioplastics. The research may involve optimizing the microbial growth conditions, developing novel microbial strains, and evaluating the scalability of the process.  Overall, a thesis in Life Sciences, Microbiology, Biotechnology, and Applied Microbiology can contribute to the understanding and application of microorganisms in various fields and may have significant implications for human health, environmental sustainability, and industrial innovation.', '20230507_123615_970_T2.png', 'Applied Microbiology', ' Life Sciences,Microbiology,Biotechnology and Applied Microbiology', '2018-01-01', 'Mathura', 'newline', 86, 4),
(3, 'I14', 'Medical astrology in sanskrit literature with special reference to Ayurveda', 'Neelakandan, E S', 'Potty, Vishnu V S', 'The thesis aims to explore the concept of medical astrology in Sanskrit literature with a special reference to Ayurveda. Ayurveda is a traditional system of medicine that originated in India, and medical astrology is an essential component of this system. The thesis will investigate the role of astrology in Ayurveda, its theoretical foundations, and its practical applications in diagnosing and treating various diseases.  The thesis will start with a literature review of Sanskrit texts related to medical astrology and Ayurveda, followed by an analysis of the key concepts and principles underlying this system. The thesis will also investigate the astrological factors that influence human health, including the influence of planets, constellations, and lunar phases.  The practical applications of medical astrology in Ayurveda will be examined, including the use of astrological charts to diagnose diseases, predict their course and outcome, and recommend appropriate treatments. The thesis will also investigate the role of astrological remedies, such as gemstones, mantras, and rituals, in the treatment of various diseases.  The thesis will conclude with a critical evaluation of the role of medical astrology in Ayurveda and its relevance in contemporary medical practice. The potential limitations, ethical considerations, and future directions of medical astrology in Ayurveda will also be discussed.  Overall, the thesis will provide a comprehensive understanding of the concept of medical astrology in Sanskrit literature, its theoretical foundations, and practical applications in Ayurveda. It will contribute to the knowledge and appreciation of the traditional systems of medicine and their relevance in contemporary healthcare.', '20230507_123820_640_T3.jpeg', 'Medical astrology and Ayurveda', 'Astrology, Ayurveda, Medicine, literature', '2003-02-01', 'Kanchipuram', 'none', 75, 2),
(4, 'I15', 'Black holes branes and strings aspects of quintessence in cosmology and origin of dark energy', 'Pandey, Kumar Priyabrat', 'Kar, Supriya K.', 'The thesis focuses on exploring the aspects of quintessence in cosmology and the origin of dark energy, particularly in the context of black holes, branes, and strings. Quintessence is a theoretical form of energy that has been proposed to explain the accelerated expansion of the universe. The thesis aims to investigate the role of quintessence in cosmology and its connection to dark energy.  The thesis will start with a literature review of the relevant theoretical frameworks, including black holes, branes, and strings, as well as the properties of dark energy and quintessence. The thesis will then develop a theoretical model of quintessence that can be used to study its effects on the universe', '20230507_123907_627_T4.png', 'Cosmology and Dark energy', 'Black holes (Astronomy) Compact objects (Astronomy) Kerr black holes Physical Sciences Physics Physics Atomic Molecular and Chemical Sagittarius A* (Astronomy) Stars', '2014-01-01', 'New Delhi', 'Available newline', 69, 1),
(5, 'I16', ' Research On Generalisation Of Paranormal Operators', 'D. Sumathi', 'Dr. S. Panayappan', 'The thesis aims to investigate the concept of generalization of paranormal operators in mathematics. Paranormal operators are a class of linear operators that are defined on a Hilbert space. They have unique properties that make them useful in various areas of mathematics and physics, including quantum mechanics and functional analysis. The thesis will explore the concept of generalization of paranormal operators and its applications in mathematics.  The thesis will begin with a literature review of the existing research on paranormal operators and their properties. The thesis will then introduce the concept of generalization of paranormal operators and its theoretical foundations. This will include investigating the different types of generalization that can be applied to paranormal operators, such as weak, strong, and ultra-strong generalization.  The thesis will also investigate the applications of generalization of paranormal operators in mathematics. This will include analyzing the properties of generalized paranormal operators and their relationship with other classes of linear operators. The thesis will also explore the potential applications of generalized paranormal operators in various areas of mathematics, including functional analysis, operator theory, and quantum mechanics.  The thesis will conclude with a critical evaluation of the concept of generalization of paranormal operators and its potential for future research in mathematics. The limitations and challenges associated with this concept will also be discussed.  Overall, the thesis will provide a comprehensive understanding of the concept of generalization of paranormal operators and its applications in mathematics. It will contribute to the knowledge and appreciation of the fundamental concepts in functional analysis, operator theory, and quantum mechanics, and their potential for solving complex mathematical problems.', '20230507_124015_757_T5.png', 'Functional analysis and Quantum mechanics', 'paranormal operators, Hilbert space, linear operators, generalization, weak generalization, strong generalization, ultra-strong generalization, functional analysis, operator theory, quantum mechanics, mathematics', '2013-06-17', 'Coimbatore', 'newline', 40, 8);

-- --------------------------------------------------------

--
-- Table structure for table `thesesdonations`
--

CREATE TABLE `thesesdonations` (
  `TDNID` int(11) NOT NULL,
  `DONORNAME` varchar(100) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `RESEARCHER` varchar(500) DEFAULT NULL,
  `GUIDES` varchar(500) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `THUMBNAIL` varchar(200) DEFAULT NULL,
  `CATEGORY` varchar(100) DEFAULT NULL,
  `KEYWORDS` longtext DEFAULT NULL,
  `COMPLETEDDATE` date DEFAULT NULL,
  `PLACE` varchar(100) DEFAULT NULL,
  `ABSTRACT` text DEFAULT NULL,
  `PAGENO` int(11) DEFAULT NULL,
  `DONATIONDATE` date DEFAULT NULL,
  `APPROVED` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
('user', '$2a$10$WjIn2G0Blds9zEWnaLcLte6J3hIfHjJ0FOft7RZIh6b4aA7StRuVu', '20230507_123027_049_user.jpg', 'John', 'Doe', 'male', '1995-08-16', '6291872399', 'hisumitsingh.co.in@gmail.com', 'student', 'active', '2024-05-07');

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
-- Indexes for table `bookdonations`
--
ALTER TABLE `bookdonations`
  ADD PRIMARY KEY (`bdnid`);

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
-- Indexes for table `journaldonations`
--
ALTER TABLE `journaldonations`
  ADD PRIMARY KEY (`jdnid`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`jid`),
  ADD UNIQUE KEY `itid` (`itid`);

--
-- Indexes for table `magazinedonations`
--
ALTER TABLE `magazinedonations`
  ADD PRIMARY KEY (`mdnid`);

--
-- Indexes for table `magazines`
--
ALTER TABLE `magazines`
  ADD PRIMARY KEY (`mid`),
  ADD UNIQUE KEY `itid` (`itid`);

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
-- Indexes for table `softcopydonations`
--
ALTER TABLE `softcopydonations`
  ADD PRIMARY KEY (`sdnid`);

--
-- Indexes for table `theses`
--
ALTER TABLE `theses`
  ADD PRIMARY KEY (`tid`),
  ADD UNIQUE KEY `itid` (`itid`);

--
-- Indexes for table `thesesdonations`
--
ALTER TABLE `thesesdonations`
  ADD PRIMARY KEY (`TDNID`);

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
  MODIFY `AID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookdonations`
--
ALTER TABLE `bookdonations`
  MODIFY `bdnid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `BRID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `downloads`
--
ALTER TABLE `downloads`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fine`
--
ALTER TABLE `fine`
  MODIFY `FID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journaldonations`
--
ALTER TABLE `journaldonations`
  MODIFY `jdnid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `jid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `magazinedonations`
--
ALTER TABLE `magazinedonations`
  MODIFY `mdnid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `magazines`
--
ALTER TABLE `magazines`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `RSID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `softcopydonations`
--
ALTER TABLE `softcopydonations`
  MODIFY `sdnid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theses`
--
ALTER TABLE `theses`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `thesesdonations`
--
ALTER TABLE `thesesdonations`
  MODIFY `TDNID` int(11) NOT NULL AUTO_INCREMENT;

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
