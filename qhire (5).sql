-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2023 at 01:07 PM
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
  `log_id` int(11) NOT NULL,
  `about` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`about_id`, `log_id`, `about`) VALUES
(1, 0, 'good night '),
(2, 0, 'qwerty'),
(3, 0, 'ty'),
(4, 0, 'ghjfh'),
(5, 3, 'addg'),
(6, 3, 'hello');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ad_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ad_id`, `username`, `password`, `type`) VALUES
(0, 'admin', 'admin@123', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `content` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `log_id`, `name`, `link`, `content`) VALUES
(1, 0, 'gj', 'https://youtu.be/xHy5gjk9oPM', 'sdfg');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `edu_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `centername` varchar(50) NOT NULL,
  `degree` varchar(80) NOT NULL,
  `field` varchar(100) NOT NULL,
  `startdate` varchar(30) NOT NULL,
  `enddate` varchar(30) NOT NULL,
  `grade` varchar(30) NOT NULL,
  `activity` varchar(80) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`edu_id`, `log_id`, `centername`, `degree`, `field`, `startdate`, `enddate`, `grade`, `activity`, `description`) VALUES
(1, 0, 'awh', 'mca', 'computer application', '12/10/2021', '21/10/2023', 'd', 'good', 'nice student'),
(3, 0, 'Gghss ', '12', '', '', '', 'a', 'fgfhu', 'chj'),
(4, 26, 'Awh engineering college ', 'mca', '', '', '', 'th', 'xh', ' hjkfrt'),
(5, 0, 'dfg', 'dgh', '', '', '', 'vhj', 'ccv', 'vhj'),
(6, 3, 'tu', 'gj', 'fhj', '', '', 'hg', 'chu', 'vnn');

-- --------------------------------------------------------

--
-- Table structure for table `innovative_idea`
--

CREATE TABLE `innovative_idea` (
  `idea_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `detals` varchar(1000) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interview`
--

CREATE TABLE `interview` (
  `interview_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `interview_name` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `date` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interview`
--

INSERT INTO `interview` (`interview_id`, `log_id`, `interview_name`, `link`, `date`, `time`, `status`) VALUES
(1, 0, 0, '', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `interview_preparation`
--

CREATE TABLE `interview_preparation` (
  `pre_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interview_preparation`
--

INSERT INTO `interview_preparation` (`pre_id`, `log_id`, `link`) VALUES
(1, 0, 'https://youtu.be/U70MUq9C88w'),
(2, 0, 'sdfghjk');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `job_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
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
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `log_id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`log_id`, `email`, `password`, `type`) VALUES
(1, 'snehae15@gmail.com', 'sneha@123', 'student'),
(2, 'arya@gmail.com', 'arya@123', 'student'),
(3, 'manu@gmail.com', 'manu@123', 'student');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `news` varchar(1000) NOT NULL,
  `content` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `log_id`, `news`, `content`) VALUES
(29, 0, 'Chatgpt', 'Launched '),
(30, 0, '', ''),
(31, 0, 'dall e2', 'dall e2 proposed');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
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
  `log_id` int(11) NOT NULL,
  `postname` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `uploadfile` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `log_id`, `postname`, `description`, `uploadfile`) VALUES
(1, 0, 'gu', 'hu', 'upload'),
(2, 0, 'hi', 'bjj', '/data/user/0/com.example.qhire/cache/scaled_202304'),
(3, 0, 'hi', 'bjj', '/data/user/0/com.example.qhire/cache/scaled_202304'),
(4, 0, 'gh', 'tyu', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(5, 0, 'gh', 'tyu', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(6, 0, 'jjjkhj', 'zictuhhib', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(7, 0, 'jjjkhj', 'zictuhhib', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(8, 0, 'be', 'be positive ', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(9, 0, 'bo', 'noogd', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(10, 0, 'bo', 'noogd', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(11, 0, 'nptel', 'certificate ', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(12, 26, 'nptel', 'certificate ', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(13, 0, 'new', 'new image', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(14, 0, 'vh', 'fg', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(15, 0, 'ghh', 'ghjj', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(16, 0, 'ghh', 'ghjj', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(17, 3, 'tty', 'chui', '/data/user/0/com.example.qhire/cache/scaled_IMG-20'),
(18, 3, 'fg', 'h', '/data/user/0/com.example.qhire/cache/scaled_IMG-20');

-- --------------------------------------------------------

--
-- Table structure for table `practice`
--

CREATE TABLE `practice` (
  `practice_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
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
  `log_id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_descrip` varchar(100) NOT NULL,
  `c_type` varchar(50) NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `certificate_upload` varchar(100) NOT NULL,
  `status` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reg_company`
--

INSERT INTO `reg_company` (`comp_id`, `log_id`, `company_name`, `company_descrip`, `c_type`, `contact_info`, `username`, `password`, `email`, `certificate_upload`, `status`, `type`) VALUES
(1, 0, 'hghc', 'hffgfdgfd', 'hgfhfd', 'hfdgfd', '', '', '', 'chfcgfcgf', 'Rejected', ''),
(3, 0, 'softroniccs', 'software company', '2 tyre', 'softronics@gmail.com', 'softronics', 'soft@123', 'softronics@gmail.com', 'uploaded', 'Accept', '');

-- --------------------------------------------------------

--
-- Table structure for table `reg_emp`
--

CREATE TABLE `reg_emp` (
  `emp_id` int(10) NOT NULL,
  `log_id` int(11) NOT NULL,
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
  `status` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reg_emp`
--

INSERT INTO `reg_emp` (`emp_id`, `log_id`, `name`, `dob`, `phone_no`, `gender`, `address`, `qualification`, `username`, `password`, `email`, `ep_status`, `upload_resume`, `status`, `type`) VALUES
(23, 0, 'Vismaya ', '1995-04-04', '48764345', 'Female', 'Kozhikkode ', 'pg', 'vismaya', 'vismaya@123', 'vismaya@gmail.com', 'Employed', 'no', '', 'employee'),
(24, 0, 'Sneha ', '2000-10-15', '7558086628 ', 'Female', 'Edathottil ', 'mca', 'snehe', 'sneha@123', 'snehae15@gmail.com', 'UnEmployed', 'no', '', 'employee'),
(25, 25, 'manu', '2023-04-28', '674668908', 'Male', 'kairali', 'mca', 'manu', 'manu@2000', 'manu@gmail.com', 'UnEmployed', 'nothing ', '', 'employee'),
(26, 26, 'ladhi', '2023-04-15', '6466806899', 'Female', 'Manjeri ', 'mca', 'ladhi', 'ladhi@123', 'ladhi@gmail.com', 'UnEmployed', 'no', '', 'employee');

-- --------------------------------------------------------

--
-- Table structure for table `reg_student`
--

CREATE TABLE `reg_student` (
  `std_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
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
  `status` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reg_student`
--

INSERT INTO `reg_student` (`std_id`, `log_id`, `name`, `dob`, `phone_no`, `gender`, `address`, `qualification`, `username`, `password`, `email`, `resume`, `status`, `type`) VALUES
(1, 44, 'sneha', '2023-04-29', 2147483647, 'Female', 'Tirur ', 'mca', 'snehae', 'sneha@123', 'snehae15@gmail.com', 'no', '', 'student'),
(2, 2, 'arya', '2023-04-29', 876432246, 'Female', 'Malappuram ', 'mca', 'arya', 'arya@123', 'arya@gmail.com', 'no', '', 'student'),
(3, 3, 'Manu', '2000-05-11', 2147483647, 'Male', 'Kozhikkode ', 'Mca', 'Manu Krishna ', 'manu@123', 'manu@gmail.com', 'no', 'Pending', 'student');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skill_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `skill` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`skill_id`, `log_id`, `skill`) VALUES
(1, 0, ''),
(2, 0, ''),
(3, 0, 'communication'),
(4, 0, 'team work '),
(5, 0, 'communication '),
(6, 0, 'team work '),
(7, 0, 'communication skills ');

-- --------------------------------------------------------

--
-- Table structure for table `skill_assessment`
--

CREATE TABLE `skill_assessment` (
  `skillass_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `skill_assessment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill_assessment`
--

INSERT INTO `skill_assessment` (`skillass_id`, `log_id`, `skill_assessment`) VALUES
(1, 0, 'communication'),
(2, 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`edu_id`);

--
-- Indexes for table `innovative_idea`
--
ALTER TABLE `innovative_idea`
  ADD PRIMARY KEY (`idea_id`);

--
-- Indexes for table `interview`
--
ALTER TABLE `interview`
  ADD PRIMARY KEY (`interview_id`);

--
-- Indexes for table `interview_preparation`
--
ALTER TABLE `interview_preparation`
  ADD PRIMARY KEY (`pre_id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

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
  ADD PRIMARY KEY (`std_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `skill_assessment`
--
ALTER TABLE `skill_assessment`
  ADD PRIMARY KEY (`skillass_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `about_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `edu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `innovative_idea`
--
ALTER TABLE `innovative_idea`
  MODIFY `idea_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interview`
--
ALTER TABLE `interview`
  MODIFY `interview_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `interview_preparation`
--
ALTER TABLE `interview_preparation`
  MODIFY `pre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  MODIFY `emp_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `reg_student`
--
ALTER TABLE `reg_student`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `skill_assessment`
--
ALTER TABLE `skill_assessment`
  MODIFY `skillass_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
