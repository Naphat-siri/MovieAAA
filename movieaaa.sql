-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2024 at 05:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movieaaa`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`adminMovie`@`localhost` PROCEDURE `RegisterUser` (IN `p_FirstName` VARCHAR(255), IN `p_LastName` VARCHAR(255), IN `p_Email` VARCHAR(255), IN `p_Password` VARCHAR(255), IN `p_UserPicture` VARCHAR(255))  BEGIN
    DECLARE roleValue TINYINT DEFAULT 2; 
    IF p_UserPicture IS NOT NULL AND TRIM(p_UserPicture) != '' THEN
        INSERT INTO user (FirstName, LastName, Email, Password, UserPicture, Role) 
        VALUES (p_FirstName, p_LastName, p_Email, p_Password, p_UserPicture, roleValue);
    ELSE
        INSERT INTO user (FirstName, LastName, Email, Password, Role) 
        VALUES (p_FirstName, p_LastName, p_Email, p_Password, roleValue);
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUserProfile` (IN `p_userID` INT, IN `p_FirstName` VARCHAR(255), IN `p_LastName` VARCHAR(255), IN `p_Email` VARCHAR(255), IN `p_Password` VARCHAR(255), IN `p_UserPicture` VARCHAR(255))  BEGIN
    IF p_UserPicture IS NOT NULL AND TRIM(p_UserPicture) != '' THEN
        UPDATE user
        SET FirstName = p_FirstName,
            LastName = p_LastName,
            Email = p_Email,
            Password = p_Password,
            UserPicture = p_UserPicture
        WHERE userID = p_userID;
    ELSE
        UPDATE user
        SET FirstName = p_FirstName,
            LastName = p_LastName,
            Email = p_Email,
            Password = p_Password
        WHERE userID = p_userID;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `belongto`
--

CREATE TABLE `belongto` (
  `MovieID` int(11) NOT NULL,
  `GenreID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `GenreID` int(11) NOT NULL,
  `GenreType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`GenreID`, `GenreType`) VALUES
(1, 'Action'),
(2, 'Horror'),
(3, 'Adventure'),
(4, 'Drama');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `MovieID` int(11) NOT NULL,
  `MovieName` varchar(20) NOT NULL,
  `GenreID` int(11) NOT NULL,
  `MoviePoster` varchar(255) NOT NULL,
  `MovieDesc` varchar(1000) NOT NULL,
  `MovieLength` int(5) NOT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `TotalViews` int(11) DEFAULT 0,
  `MovieFile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`MovieID`, `MovieName`, `GenreID`, `MoviePoster`, `MovieDesc`, `MovieLength`, `ReleaseDate`, `TotalViews`, `MovieFile`) VALUES
(7, 'The meg', 1, 'meg.jpg', 'ghost', 120, '0000-00-00', 5, 'The Meg Official Trailer #1 (2018) Jason Statham, Ruby Rose Megalodon Shark Movie HD.mp4'),
(8, 'Megan', 2, 'megan.jpg', 'ghost AI', 150, '2566-10-29', 2, 'M3GAN - official trailer.mp4'),
(9, 'Do not look up', 1, 'dontlookup.jpg', 'look down', 160, '2566-11-05', 1, 'dontlook.mp4'),
(10, 'Troll', 4, 'troll.jpg', 'phee', 180, '2566-10-31', 0, 'TROLL _ Official Trailer _ Netflix.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `PaymentDate` date NOT NULL,
  `userID` int(11) NOT NULL,
  `CardHolderName` varchar(50) NOT NULL,
  `CreditCardnum` int(16) NOT NULL,
  `expiryDate` date NOT NULL,
  `CVV` int(3) NOT NULL,
  `CardType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `SubID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `PaymentID` int(11) NOT NULL,
  `StartDate` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`SubID`, `userID`, `PaymentID`, `StartDate`, `DueDate`, `Price`) VALUES
(10, 49, 31, '2023-11-23', '2023-12-23', 259);

--
-- Triggers `subscription`
--
DELIMITER $$
CREATE TRIGGER `prevent_subscrip` BEFORE UPDATE ON `subscription` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'edits are not allowed';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(256) NOT NULL,
  `UserPicture` varchar(255) DEFAULT NULL,
  `Role` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `FirstName`, `LastName`, `Email`, `Password`, `UserPicture`, `Role`) VALUES
(1, 'admin1', 'admin', 'admin', 'fb001dfcffd1c899f3297871406242f097aecf1a5342ccf3ebcd116146188e4b', 'test_admin.jfif', 1),
(50, 'test', 'asd', 'test', '36f028580bb02cc8272a9a020f4200e346e276ae664e45ee80745574e2f5ab80', 'download.png', 2),
(51, 'OLIUYTREWQ', ',mnhgfds', 'ijhgfd', '6bf4b01a8284fc3261e99be9d478a4eab1d9d2cc4ae1fae85cae2ea0e766b337', 'download.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `usermoviehistory`
--

CREATE TABLE `usermoviehistory` (
  `HistoryID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `MovieID` int(11) NOT NULL,
  `ViewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `usermoviehistory`
--

INSERT INTO `usermoviehistory` (`HistoryID`, `UserID`, `MovieID`, `ViewDate`) VALUES
(4, 1, 7, '2023-11-23 03:21:39'),
(5, 1, 9, '2023-11-23 03:22:10'),
(6, NULL, 8, '2023-11-23 03:26:57'),
(7, NULL, 8, '2023-11-23 03:52:41');

--
-- Triggers `usermoviehistory`
--
DELIMITER $$
CREATE TRIGGER `prevent_userhistory` BEFORE UPDATE ON `usermoviehistory` FOR EACH ROW BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'edits are not allowed';
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `belongto`
--
ALTER TABLE `belongto`
  ADD PRIMARY KEY (`MovieID`,`GenreID`),
  ADD KEY `GenreID` (`GenreID`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`GenreID`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`MovieID`),
  ADD KEY `GenreID` (`GenreID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`SubID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `usermoviehistory`
--
ALTER TABLE `usermoviehistory`
  ADD PRIMARY KEY (`HistoryID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `MovieID` (`MovieID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `GenreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `MovieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `SubID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `usermoviehistory`
--
ALTER TABLE `usermoviehistory`
  MODIFY `HistoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `belongto`
--
ALTER TABLE `belongto`
  ADD CONSTRAINT `belongto_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`),
  ADD CONSTRAINT `belongto_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `genre` (`GenreID`);

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`GenreID`) REFERENCES `genre` (`GenreID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usermoviehistory`
--
ALTER TABLE `usermoviehistory`
  ADD CONSTRAINT `usermoviehistory_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`userID`) ON DELETE SET NULL,
  ADD CONSTRAINT `usermoviehistory_ibfk_2` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
