-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2023 at 10:28 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`about_id`, `log_id`, `about`) VALUES
(1, 3, 'Very smart');

-- --------------------------------------------------------

--
-- Table structure for table `alumini_talk`
--

CREATE TABLE `alumini_talk` (
  `alumini_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `time` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alumini_talk`
--

INSERT INTO `alumini_talk` (`alumini_id`, `log_id`, `name`, `time`, `date`, `link`) VALUES
(1, 0, 'MOCK INTERVIEW Saturday, May 6 · 11:30am – 12:30pm Time zone: Asia/Kolkata Google Meet joining info ', '11:30', '2013-05-09', 'https://meet.google.com/xvj-sahc-hsx'),
(2, 0, 'confidence booster', '12:30', '2023-05-10', 'https://meet.google.com/xvj-sahc-hsx'),
(3, 0, 'gesture  position', '10:30', '2023-05-12', 'https://meet.google.com/ixa-mgtk-chv');

-- --------------------------------------------------------

--
-- Table structure for table `applied_job`
--

CREATE TABLE `applied_job` (
  `appjob_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applied_job`
--

INSERT INTO `applied_job` (`appjob_id`, `log_id`, `job_id`, `status`) VALUES
(1, 0, 0, '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `log_id`, `name`, `link`, `content`) VALUES
(1, 0, 'php', 'https://youtu.be/xHy5gjk9oPM', 'php tutorial'),
(2, 0, 'c language tutorial ', 'https://youtu.be/irqbmMNs2Bo', 'c language tutorial with notes');

-- --------------------------------------------------------

--
-- Table structure for table `description`
--

CREATE TABLE `description` (
  `des_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `description`
--

INSERT INTO `description` (`des_id`, `description`) VALUES
(1, 'growing company'),
(2, 'upcoming community ');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`edu_id`, `log_id`, `centername`, `degree`, `field`, `startdate`, `enddate`, `grade`, `activity`, `description`) VALUES
(1, 0, 'awh', 'Mca', 'computer application', '12/10/2021', '21/10/2023', 'd', 'singing', 'nice student'),
(7, 3, 'Awh engineering college ', 'Mca', 'Computer Application ', '22/02/2020', '20/02/2023', '45', 'Drawing ', 'iam passionate student'),
(8, 3, 'Gandhi scool', 'Bca', 'computer Applications', '10/10/2016', '20/05/2019', '74', 'dancing ', 'website and apicau');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `link` varchar(100) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`exam_id`, `name`, `link`, `description`) VALUES
(1, 'VERBEAL', 'https://forms.gle/TDvjwk1WzzYxofeK9', '');

-- --------------------------------------------------------

--
-- Table structure for table `gd`
--

CREATE TABLE `gd` (
  `gd_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gd`
--

INSERT INTO `gd` (`gd_id`, `name`, `link`) VALUES
(1, 'face time', 'https://meet.google.com/owz-ptav-axp\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `innovative_idea`
--

CREATE TABLE `innovative_idea` (
  `idea_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(1000) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `innovative_idea`
--

INSERT INTO `innovative_idea` (`idea_id`, `log_id`, `name`, `details`, `image`) VALUES
(1, 3, 'cafit', 'cafit', '1269168538.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE `interest` (
  `interest_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `interest` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `interview`
--

CREATE TABLE `interview` (
  `interview_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `interview_name` varchar(30) NOT NULL,
  `link` varchar(100) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(30) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `interview`
--

INSERT INTO `interview` (`interview_id`, `log_id`, `interview_name`, `link`, `date`, `time`, `status`) VALUES
(1, 0, '0', '', '0', '0', '');

-- --------------------------------------------------------

--
-- Table structure for table `interview_preparation`
--

CREATE TABLE `interview_preparation` (
  `pre_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `content` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `interview_preparation`
--

INSERT INTO `interview_preparation` (`pre_id`, `log_id`, `name`, `content`, `link`) VALUES
(4, 0, 'how to answer tell me about your self', ' well expalined how to answer tell me about your self', 'https://youtu.be/EzGH3hZuJVk'),
(5, 0, 'communication ', 'improve communication', 'https://meet.google.com/ixa-mgtk-chv');

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
  `jobdescription` longtext NOT NULL,
  `skills` varchar(50) NOT NULL,
  `vacancy` varchar(15) NOT NULL,
  `salary` int(10) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`job_id`, `log_id`, `jobname`, `shift_schedule`, `benefits`, `qualification`, `experience`, `jobtype`, `jobdescription`, `skills`, `vacancy`, `salary`, `status`) VALUES
(1, 0, 'Graphic Designer Internship', 'night', 'medical leave applicable', 'Higher Secondary(12th Pass) (Preferred)', '0', 'Internship', 'We are hiring graphic designer intern to join our team interested candidates can apply  No experienc', 'photo shop', '10', 12000, ''),
(5, 0, 'software engineer ', 'night', 'all specification available', 'btech/mca', '0-5', 'fresher', 'need a passionate developer', 'Flutter, PHP', '30', 30000, ''),
(6, 0, 'software engineer ', 'morning ', 'all specification available', 'btech/mca', '0-5', 'Full time', 'FEEL FREE TO WORK ', 'Flutter, PHP', '30', 30000, ''),
(7, 0, 'accountant', 'morning', 'all benafits including medical leave', 'bcom', '0', 'temporary ', 'jioj', 'tally', '6', 20000, ''),
(8, 0, 'software engineer fresher', 'mornig', 'medical leave', 'bachelors degree', 'fresher', 'full time', 'we are looking for a fresher passionate software engineer', 'basic c and c++', '10', 15000, '');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `log_id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`log_id`, `email`, `password`, `type`) VALUES
(1, 'snehae15@gmail.com', 'sneha@123', 'student'),
(2, 'arya@gmail.com', 'arya@123', 'student'),
(3, 'manu@gmail.com', 'manu@123', 'student'),
(4, 'sneha@gmail.com', 'sneha@123', 'employee'),
(5, 'sneha@gmail.com', 'sneha@123', 'employee'),
(6, 'sneha@gmail.com', 'sneha@123', 'employee'),
(7, 'sneha@gmail.com', 'sneha@123', 'employee'),
(8, 'snehae@gmail.com', 'sneha@123', 'employee'),
(9, 'ladhi@gmail.com', 'ladhi@123', 'employee'),
(10, 'company@gmail.com', 'company@123', 'company'),
(11, 'qhire@gmail.com', 'qhire@123', 'qhire'),
(12, 'admin@gmail.com', 'admin@123', 'admin'),
(13, 'aa', '123', 'student'),
(14, 'hilal@gmail.com', 'hilal9@123', 'employee'),
(15, 'softronics@gmail.com', 'soft@123', 'company'),
(20, 'mjbrother@123', 'brothers@123', 'company'),
(21, 'sreya@gmail.com', 'sreya@123', 'student'),
(22, 'newland@gmail.com', 'newland@123', 'company');

-- --------------------------------------------------------

--
-- Table structure for table `mock_interview`
--

CREATE TABLE `mock_interview` (
  `mockinte_id` int(11) NOT NULL,
  `link` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mock_test`
--

CREATE TABLE `mock_test` (
  `mocktest_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `news` varchar(1000) NOT NULL,
  `content` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `log_id`, `news`, `content`) VALUES
(1, 0, 'State govt. is implementing projects to tap emerging IT tech: CM\r\n', 'The State government is implementing projects which are aimed at tapping the possibilities of emergi'),
(3, 0, 'ChatGPT Is Already Obsolete', 'Last week, at Google’s annual conference dedicated to new products and technologies, the company ann'),
(4, 0, 'new version of openai', 'OpenAI has announced GPT4, the latest version of its large language model that powers key applicatio'),
(5, 0, 'new version of openai', 'OpenAI has announced GPT4, the latest version of its large language model that powers key applications like ChatGPT and the new Bing. The San Francisco-based research company says GPT-4 is more sophisticated than the previous version and has been trained on more data, making it also expensive to run.');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `log_id`, `postname`, `description`, `uploadfile`) VALUES
(3, 9, ' cs csncs', 'ngxmhdmhd', '915372901.jpg'),
(4, 3, 'limenzy', 'welcome to limenzy ', '1835038987.webp'),
(6, 0, 'eco friendly ', 'not harmful to the environment. \"I use only eco-fr', 'eco.jpg'),
(7, 0, 'job activities ', 'work is important but you need free time', 'download.jpg');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reg_company`
--

INSERT INTO `reg_company` (`comp_id`, `log_id`, `company_name`, `company_descrip`, `c_type`, `contact_info`, `username`, `password`, `email`, `certificate_upload`, `status`, `type`) VALUES
(3, 0, 'Softronics', 'software company', '2 tyre', 'softronics@gmail.com', 'softronics', 'soft@123', 'softronics@gmail.com', 'uploaded', 'Accept', ''),
(6, 0, 'MJ BRO', 'coorparative company', '2 tyre', 'mjbrothers 7854123690', 'mj@gmail.com', 'mj@12345', 'mj@gmail.com', 'Free Instagram Story Template.jpg', 'Accept', ''),
(12, 0, 'mj brothers', 'hardware compay', '2 tyre', '8976543234', 'MJ BROTHERS', 'brothers@123', 'mjbrother@123', 'images.jpg', 'Accept', 'company'),
(13, 0, 'new land', 'growing company', '2 tyre', '7811121245', 'New land', 'newland@123', 'newland@gmail.com', 'images.png', 'verifed', 'company');

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
  `type` varchar(30) NOT NULL,
  `payment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reg_emp`
--

INSERT INTO `reg_emp` (`emp_id`, `log_id`, `name`, `dob`, `phone_no`, `gender`, `address`, `qualification`, `username`, `password`, `email`, `ep_status`, `upload_resume`, `status`, `type`, `payment`) VALUES
(27, 0, 'Sneha E', '2000-10-15', '7558086628 ', 'Female', 'tirur ', 'mca', 'Sneha E ', 'sneha@123', 'sneha@gmail.com', '', '', 'Accept', '', 0),
(29, 8, 'Sneha E', '2000-10-15', '7558086628 ', 'Female', 'tirur ', 'mca', 'Sneha E ', 'sneha@123', 'snehae@gmail.com', '', '', 'Verify', 'employee', 0),
(30, 9, 'ladhi', '2023-05-02', '755809559807', 'Female', 'Malappuram ', 'Mca', 'Ladheedha ', 'ladhi@123', 'ladhi@gmail.com', 'Unemployed', 'no', 'Verify', 'employee', 0),
(31, 14, 'Muhammad Hilal ', '2000-06-05', '4578825865', 'Male', 'Kozhikkode ', 'Mca ', 'Hilal ', 'hilal@123', 'hilal@gmail.com', 'Unemployed', '', 'Pending', 'employee', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reg_student`
--

INSERT INTO `reg_student` (`std_id`, `log_id`, `name`, `dob`, `phone_no`, `gender`, `address`, `qualification`, `username`, `password`, `email`, `resume`, `status`, `type`) VALUES
(1, 44, 'sneha', '2023-04-29', 2147483647, 'Female', 'Tirur ', 'mca', 'snehae', 'sneha@123', 'snehae15@gmail.com', 'no', 'Accept', 'student'),
(2, 2, 'arya', '2023-04-29', 876432246, 'Female', 'Malappuram ', 'mca', 'arya', 'arya@123', 'arya@gmail.com', 'no', 'Rejected', 'student'),
(3, 3, 'Manu', '2000-05-11', 2147483647, 'Male', 'Kozhikkode ', 'Mca', 'Manu Krishna ', 'manu@123', 'manu@gmail.com', 'no', 'Pending', 'student'),
(5, 21, 'sreya', '2000-05-11', 2147483647, 'Female', 'Tirur ', '12', 'Sreya', 'sreya@123', 'sreya@gmail.com', '', 'Pending', 'student');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skill_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `skill` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`skill_id`, `log_id`, `skill`) VALUES
(3, 3, 'communication '),
(4, 3, 'passionate to wrk');

-- --------------------------------------------------------

--
-- Table structure for table `skill_assessment`
--

CREATE TABLE `skill_assessment` (
  `skillass_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` longtext NOT NULL,
  `content` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `skill_assessment`
--

INSERT INTO `skill_assessment` (`skillass_id`, `log_id`, `name`, `link`, `content`) VALUES
(4, 0, 'verbal ability', 'https://quilgo.com/t/ek1DDyWXZiq5nMLC', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `alumini_talk`
--
ALTER TABLE `alumini_talk`
  ADD PRIMARY KEY (`alumini_id`);

--
-- Indexes for table `applied_job`
--
ALTER TABLE `applied_job`
  ADD PRIMARY KEY (`appjob_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `description`
--
ALTER TABLE `description`
  ADD PRIMARY KEY (`des_id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`edu_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `gd`
--
ALTER TABLE `gd`
  ADD PRIMARY KEY (`gd_id`);

--
-- Indexes for table `innovative_idea`
--
ALTER TABLE `innovative_idea`
  ADD PRIMARY KEY (`idea_id`);

--
-- Indexes for table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`interest_id`);

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
-- Indexes for table `mock_test`
--
ALTER TABLE `mock_test`
  ADD PRIMARY KEY (`mocktest_id`);

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
  MODIFY `about_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `alumini_talk`
--
ALTER TABLE `alumini_talk`
  MODIFY `alumini_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `applied_job`
--
ALTER TABLE `applied_job`
  MODIFY `appjob_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `description`
--
ALTER TABLE `description`
  MODIFY `des_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `edu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gd`
--
ALTER TABLE `gd`
  MODIFY `gd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `innovative_idea`
--
ALTER TABLE `innovative_idea`
  MODIFY `idea_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `interest`
--
ALTER TABLE `interest`
  MODIFY `interest_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interview`
--
ALTER TABLE `interview`
  MODIFY `interview_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `interview_preparation`
--
ALTER TABLE `interview_preparation`
  MODIFY `pre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `mock_test`
--
ALTER TABLE `mock_test`
  MODIFY `mocktest_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `practice`
--
ALTER TABLE `practice`
  MODIFY `practice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reg_company`
--
ALTER TABLE `reg_company`
  MODIFY `comp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `reg_emp`
--
ALTER TABLE `reg_emp`
  MODIFY `emp_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `reg_student`
--
ALTER TABLE `reg_student`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `skill_assessment`
--
ALTER TABLE `skill_assessment`
  MODIFY `skillass_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
