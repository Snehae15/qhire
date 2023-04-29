-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2023 at 01:00 PM
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
-- Database: `qhire`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `about_id` int(11) NOT NULL,
  `about` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`about_id`, `about`) VALUES
(1, 'positive thinking '),
(2, 'nice');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `edu_id` int(11) NOT NULL,
  `centername` varchar(50) NOT NULL,
  `degree` varchar(80) NOT NULL,
  `field` varchar(100) NOT NULL,
  `startdate` varchar(30) NOT NULL,
  `enddate` varchar(30) NOT NULL,
  `grade` varchar(30) NOT NULL,
  `activity` varchar(80) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `innovative_idea`
--

CREATE TABLE `innovative_idea` (
  `idea_id` int(11) NOT NULL,
  `idea_name` varchar(100) NOT NULL,
  `idea_detals` varchar(1000) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interview`
--

CREATE TABLE `interview` (
  `interview_id` int(11) NOT NULL,
  `interview_name` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `result` varchar(30) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interview_result`
--

CREATE TABLE `interview_result` (
  `intresult_id` int(11) NOT NULL,
  `mark_obtained` varchar(50) NOT NULL,
  `question_no` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `job_id` int(11) NOT NULL,
  `jobname` varchar(30) NOT NULL,
  `shift_schedule` varchar(30) NOT NULL,
  `benefits` varchar(100) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `experience` varchar(30) NOT NULL,
  `jobtype` varchar(50) NOT NULL,
  `jobdescription` varchar(100) NOT NULL,
  `skills` varchar(50) NOT NULL,
  `vacancy` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `news` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `noti_name` varchar(200) NOT NULL,
  `job` varchar(100) NOT NULL,
  `date` varchar(50) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `postname` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `uploadfile` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `postname`, `description`, `uploadfile`) VALUES
(1, 'gu', 'hu', 'upload'),
(2, 'hi', 'bjj', '/data/user/0/com.example.qhire/cache/scaled_202304'),
(3, 'hi', 'bjj', '/data/user/0/com.example.qhire/cache/scaled_202304'),
(4, 'gh', 'tyu', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(5, 'gh', 'tyu', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(6, 'jjjkhj', 'zictuhhib', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(7, 'jjjkhj', 'zictuhhib', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(8, 'be', 'be positive ', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(9, 'bo', 'noogd', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(10, 'bo', 'noogd', '/data/user/0/com.example.qhire/cache/scaled_IMG-20');

-- --------------------------------------------------------

--
-- Table structure for table `practice`
--

CREATE TABLE `practice` (
  `practice_id` int(11) NOT NULL,
  `question` varchar(100) NOT NULL,
  `answer` varchar(50) NOT NULL,
  `option_a` varchar(50) NOT NULL,
  `option_b` varchar(50) NOT NULL,
  `option_c` varchar(50) NOT NULL,
  `option_d` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reg_company`
--

CREATE TABLE `reg_company` (
  `comp_id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_descrip` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `certificate_upload` varchar(100) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reg_company`
--

INSERT INTO `reg_company` (`comp_id`, `company_name`, `company_descrip`, `type`, `contact_info`, `username`, `password`, `email`, `certificate_upload`, `status`) VALUES
(1, 'hghc', 'hffgfdgfd', 'hgfhfd', 'hfdgfd', '', '', '', 'chfcgfcgf', 'Rejected'),
(3, 'softroniccs', 'software company', '2 tyre', 'softronics@gmail.com', 'softronics', 'soft@123', 'softronics@gmail.com', 'uploaded', 'Accept');

-- --------------------------------------------------------

--
-- Table structure for table `reg_emp`
--

CREATE TABLE `reg_emp` (
  `emp_id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `ep_status` varchar(30) NOT NULL,
  `upload_resume` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reg_emp`
--

INSERT INTO `reg_emp` (`emp_id`, `name`, `dob`, `phone_no`, `gender`, `address`, `qualification`, `username`, `password`, `email`, `ep_status`, `upload_resume`, `status`) VALUES
(1, 'qsd', 'sfhjl', '0', '', '', '', 'asd', 'asd', 'chhfd@gmail.com ', '', 'fhj', 'Rejected'),
(2, '[Sneha]', '[15/10/200', '0', '[female]', '[tirur]', '[mca]', '[snehae]', '[sneha@123]', '[snehae15@gmail.com]', '[unemployed]', '[uploaded]', ''),
(3, 'sneha', '15/10/2000', '2147483647', 'Female', 'Tirur', 'MCA', 'snehae', 'sneha@123', 'snehae15@gmail.com', 'unemployed', 'uploaded ', ''),
(4, '', '', '0', '', '', '', '', '', '', '', '', ''),
(7, 'sreya', '01/11/2005', '2147483647', 'female', 'tirur', '12', 'sreyae01', '', 'srea@gmail.com', 'unemployed', 'uploaded', ''),
(10, 'sreya', '01/11/2005', '2147483647', 'female', 'tirur', '12', 'sreyae01', '', 'sreya@gmail.com', 'unemployed', 'uploaded', ''),
(12, 'sreya', '01/11/2005', '2147483647', 'female', 'tirur', '12', 'sreyae03', 'sreya@1235', 'sreyaa@gmail.com', 'unemployed', 'uploaded', ''),
(13, 'gohpi', 'itd86f', '0', '', 'pig8pg', 'iycouhp8', 'qwer', 'qwer', 'hijo', '', 'coupug9', ''),
(14, 'ladhi', '124689', 'i86644', '', 'tyui', 'qwer', 'cghj', 'qwe', 'wryu', '', 'dty', ''),
(16, 'qw', '356', '3579', 'Female', 'cbj', 'ert', 'qwerty', 'qwertyu', 'xh', '', 'cgu', ''),
(18, 'vava', '2004-11-01', '6282737441', 'Female', 'tirur ', '12', 'sreyae', 'sreya@2005', 'sreyas@gmail.com', 'UnEmployed', 'uploaded ', '');

-- --------------------------------------------------------

--
-- Table structure for table `reg_student`
--

CREATE TABLE `reg_student` (
  `std_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `phone_no` int(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `resume` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reg_student`
--

INSERT INTO `reg_student` (`std_id`, `name`, `dob`, `phone_no`, `gender`, `address`, `qualification`, `username`, `password`, `email`, `resume`, `status`) VALUES
(1, 'sreya', '01/11/2005', 62827, 'female', 'tirur', '12', 'sreyas', 'reya@2005', 'sreyae@gmail.com', '', 'Accept');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`edu_id`);

--
-- Indexes for table `interview`
--
ALTER TABLE `interview`
  ADD PRIMARY KEY (`interview_id`);

--
-- Indexes for table `interview_result`
--
ALTER TABLE `interview_result`
  ADD PRIMARY KEY (`intresult_id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `practice`
--
ALTER TABLE `practice`
  ADD PRIMARY KEY (`practice_id`);

--
-- Indexes for table `reg_company`
--
ALTER TABLE `reg_company`
  ADD PRIMARY KEY (`comp_id`),
  ADD UNIQUE KEY `company_name` (`company_name`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `reg_emp`
--
ALTER TABLE `reg_emp`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `reg_student`
--
ALTER TABLE `reg_student`
  ADD PRIMARY KEY (`std_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `about_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `edu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interview`
--
ALTER TABLE `interview`
  MODIFY `interview_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interview_result`
--
ALTER TABLE `interview_result`
  MODIFY `intresult_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `practice`
--
ALTER TABLE `practice`
  MODIFY `practice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reg_company`
--
ALTER TABLE `reg_company`
  MODIFY `comp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reg_emp`
--
ALTER TABLE `reg_emp`
  MODIFY `emp_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `reg_student`
--
ALTER TABLE `reg_student`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
