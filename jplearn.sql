-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 04:35 AM
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
-- Database: `jplearn`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `createdAt` date NOT NULL DEFAULT current_timestamp(),
  `updatedAt` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `student_id`, `teacher_id`, `description`, `start_time`, `end_time`, `createdAt`, `updatedAt`) VALUES
(1, 6, NULL, '', NULL, NULL, '2023-12-06', '2023-12-06'),
(2, 6, 24, 'an important appointment for orientation', NULL, NULL, '2023-12-06', '2023-12-06'),
(3, 6, 24, 'an important appointment for orientation', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2023-12-06', '2023-12-06'),
(4, 6, 24, 'an important appointment for orientation', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2023-12-06', '2023-12-06'),
(5, 6, 24, 'an important appointment for orientation', '2024-11-30 07:00:00', '2024-12-01 07:00:00', '2023-12-06', '2023-12-06'),
(6, 6, 24, 'an important appointment for orientation', '2024-11-30 07:00:00', '2024-12-01 07:00:00', '2023-12-06', '2023-12-06'),
(7, 6, 24, 'an important appointment for orientation', '2024-11-30 07:00:00', '2024-12-01 07:00:00', '2023-12-06', '2023-12-06');

-- --------------------------------------------------------

--
-- Table structure for table `bookmark_courses`
--

CREATE TABLE `bookmark_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `message_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` float DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `comment` text NOT NULL,
  `rating_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `detail_infor` varchar(255) DEFAULT NULL,
  `study_goal` varchar(50) DEFAULT NULL,
  `jp_level` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

CREATE TABLE `student_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `attendance_status` varchar(50) DEFAULT NULL,
  `attendance_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `detail_infor` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `jp_level` varchar(25) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `detail_infor`, `experience`, `jp_level`, `createdAt`, `updatedAt`) VALUES
(0, 7, 'nihongo ga omoshiroi desu', '0 năm', 'N1', '2023-12-06', '2023-12-06'),
(1, 8, 'nihongo ga omoshiroi desu', '1 năm', 'N1', '2023-12-06', '2023-12-06'),
(2, 9, 'nihongo ga omoshiroi desu', '2 năm', 'N1', '2023-12-06', '2023-12-06'),
(3, 10, 'nihongo ga jozu desu', '3 năm', 'N2', '2023-12-06', '2023-12-06'),
(4, 11, 'nihongo ga jozu desu', '4 năm', 'N2', '2023-12-06', '2023-12-06'),
(5, 12, 'nihongo ga omoshiroi desu', '5 năm', 'N1', '2023-12-06', '2023-12-06'),
(6, 13, 'nihongo ga jozu desu', '6 năm', 'N2', '2023-12-06', '2023-12-06'),
(7, 14, 'nihongo ga omoshiroi desu', '7 năm', 'N2', '2023-12-06', '2023-12-06'),
(8, 15, 'nihongo ga omoshiroi desu', '8 năm', 'N2', '2023-12-06', '2023-12-06'),
(9, 16, 'nihongo ga omoshiroi desu', '9 năm', 'N2', '2023-12-06', '2023-12-06'),
(10, 17, 'nihongo ga omoshiroi desu', '10 năm', 'N2', '2023-12-06', '2023-12-06'),
(11, 18, 'nihongo ga jozu desu', '11 năm', 'N2', '2023-12-06', '2023-12-06'),
(12, 19, 'nihongo ga omoshiroi desu', '12 năm', 'N1', '2023-12-06', '2023-12-06'),
(13, 20, 'nihongo ga jozu desu', '13 năm', 'N2', '2023-12-06', '2023-12-06'),
(14, 21, 'nihongo ga jozu desu', '14 năm', 'N2', '2023-12-06', '2023-12-06'),
(15, 22, 'nihongo ga omoshiroi desu', '15 năm', 'N2', '2023-12-06', '2023-12-06'),
(16, 23, 'nihongo ga omoshiroi desu', '16 năm', 'N2', '2023-12-06', '2023-12-06'),
(17, 24, 'nihongo ga jozu desu', '17 năm', 'N2', '2023-12-06', '2023-12-06'),
(18, 25, 'nihongo ga omoshiroi desu', '18 năm', 'N2', '2023-12-06', '2023-12-06'),
(19, 26, 'nihongo ga omoshiroi desu', '19 năm', 'N2', '2023-12-06', '2023-12-06'),
(20, 27, 'nihongo ga jozu desu', '20 năm', 'N2', '2023-12-06', '2023-12-06'),
(21, 28, 'nihongo ga jozu desu', '21 năm', 'N2', '2023-12-06', '2023-12-06'),
(22, 29, 'nihongo ga omoshiroi desu', '22 năm', 'N2', '2023-12-06', '2023-12-06'),
(23, 30, 'nihongo ga omoshiroi desu', '23 năm', 'N2', '2023-12-06', '2023-12-06'),
(24, 31, 'nihongo ga jozu desu', '24 năm', 'N2', '2023-12-06', '2023-12-06'),
(25, 32, 'nihongo ga jozu desu', '25 năm', 'N2', '2023-12-06', '2023-12-06'),
(26, 33, 'nihongo ga omoshiroi desu', '26 năm', 'N2', '2023-12-06', '2023-12-06'),
(27, 34, 'nihongo ga jozu desu', '27 năm', 'N2', '2023-12-06', '2023-12-06'),
(28, 35, 'nihongo ga omoshiroi desu', '28 năm', 'N1', '2023-12-06', '2023-12-06'),
(29, 36, 'nihongo ga jozu desu', '29 năm', 'N2', '2023-12-06', '2023-12-06'),
(30, 37, 'nihongo ga jozu desu', '30 năm', 'N1', '2023-12-06', '2023-12-06'),
(31, 38, 'nihongo ga jozu desu', '31 năm', 'N2', '2023-12-06', '2023-12-06'),
(32, 39, 'nihongo ga omoshiroi desu', '32 năm', 'N1', '2023-12-06', '2023-12-06'),
(33, 40, 'nihongo ga omoshiroi desu', '33 năm', 'N2', '2023-12-06', '2023-12-06'),
(34, 41, 'nihongo ga jozu desu', '34 năm', 'N2', '2023-12-06', '2023-12-06'),
(35, 42, 'nihongo ga omoshiroi desu', '35 năm', 'N2', '2023-12-06', '2023-12-06'),
(36, 43, 'nihongo ga jozu desu', '36 năm', 'N1', '2023-12-06', '2023-12-06'),
(37, 44, 'nihongo ga omoshiroi desu', '37 năm', 'N2', '2023-12-06', '2023-12-06'),
(38, 45, 'nihongo ga omoshiroi desu', '38 năm', 'N1', '2023-12-06', '2023-12-06'),
(39, 46, 'nihongo ga omoshiroi desu', '39 năm', 'N1', '2023-12-06', '2023-12-06'),
(40, 47, 'nihongo ga omoshiroi desu', '40 năm', 'N1', '2023-12-06', '2023-12-06'),
(41, 48, 'nihongo ga jozu desu', '41 năm', 'N2', '2023-12-06', '2023-12-06'),
(42, 49, 'nihongo ga omoshiroi desu', '42 năm', 'N2', '2023-12-06', '2023-12-06'),
(43, 50, 'nihongo ga jozu desu', '43 năm', 'N1', '2023-12-06', '2023-12-06'),
(44, 51, 'nihongo ga omoshiroi desu', '44 năm', 'N2', '2023-12-06', '2023-12-06'),
(45, 52, 'nihongo ga jozu desu', '45 năm', 'N2', '2023-12-06', '2023-12-06'),
(46, 53, 'nihongo ga omoshiroi desu', '46 năm', 'N2', '2023-12-06', '2023-12-06'),
(47, 54, 'nihongo ga jozu desu', '47 năm', 'N1', '2023-12-06', '2023-12-06'),
(48, 55, 'nihongo ga omoshiroi desu', '48 năm', 'N2', '2023-12-06', '2023-12-06'),
(49, 56, 'nihongo ga jozu desu', '49 năm', 'N2', '2023-12-06', '2023-12-06'),
(50, 57, 'nihongo ga jozu desu', '50 năm', 'N2', '2023-12-06', '2023-12-06'),
(51, 58, 'nihongo ga jozu desu', '51 năm', 'N1', '2023-12-06', '2023-12-06'),
(52, 59, 'nihongo ga omoshiroi desu', '52 năm', 'N2', '2023-12-06', '2023-12-06'),
(53, 60, 'nihongo ga omoshiroi desu', '53 năm', 'N1', '2023-12-06', '2023-12-06'),
(54, 61, 'nihongo ga omoshiroi desu', '54 năm', 'N2', '2023-12-06', '2023-12-06'),
(55, 62, 'nihongo ga omoshiroi desu', '55 năm', 'N2', '2023-12-06', '2023-12-06'),
(56, 63, 'nihongo ga jozu desu', '56 năm', 'N2', '2023-12-06', '2023-12-06'),
(57, 64, 'nihongo ga jozu desu', '57 năm', 'N1', '2023-12-06', '2023-12-06'),
(58, 65, 'nihongo ga jozu desu', '58 năm', 'N1', '2023-12-06', '2023-12-06'),
(59, 66, 'nihongo ga jozu desu', '59 năm', 'N2', '2023-12-06', '2023-12-06'),
(60, 67, 'nihongo ga jozu desu', '60 năm', 'N2', '2023-12-06', '2023-12-06'),
(61, 68, 'nihongo ga jozu desu', '61 năm', 'N1', '2023-12-06', '2023-12-06'),
(62, 69, 'nihongo ga jozu desu', '62 năm', 'N1', '2023-12-06', '2023-12-06'),
(63, 70, 'nihongo ga jozu desu', '63 năm', 'N1', '2023-12-06', '2023-12-06'),
(64, 71, 'nihongo ga jozu desu', '64 năm', 'N2', '2023-12-06', '2023-12-06'),
(65, 72, 'nihongo ga jozu desu', '65 năm', 'N1', '2023-12-06', '2023-12-06'),
(66, 73, 'nihongo ga jozu desu', '66 năm', 'N1', '2023-12-06', '2023-12-06'),
(67, 74, 'nihongo ga omoshiroi desu', '67 năm', 'N1', '2023-12-06', '2023-12-06'),
(68, 75, 'nihongo ga omoshiroi desu', '68 năm', 'N1', '2023-12-06', '2023-12-06'),
(69, 76, 'nihongo ga omoshiroi desu', '69 năm', 'N2', '2023-12-06', '2023-12-06'),
(70, 77, 'nihongo ga omoshiroi desu', '70 năm', 'N1', '2023-12-06', '2023-12-06'),
(71, 78, 'nihongo ga omoshiroi desu', '71 năm', 'N2', '2023-12-06', '2023-12-06'),
(72, 79, 'nihongo ga omoshiroi desu', '72 năm', 'N2', '2023-12-06', '2023-12-06'),
(73, 80, 'nihongo ga omoshiroi desu', '73 năm', 'N1', '2023-12-06', '2023-12-06'),
(74, 81, 'nihongo ga omoshiroi desu', '74 năm', 'N1', '2023-12-06', '2023-12-06'),
(75, 82, 'nihongo ga omoshiroi desu', '75 năm', 'N2', '2023-12-06', '2023-12-06'),
(76, 83, 'nihongo ga omoshiroi desu', '76 năm', 'N1', '2023-12-06', '2023-12-06'),
(77, 84, 'nihongo ga omoshiroi desu', '77 năm', 'N2', '2023-12-06', '2023-12-06'),
(78, 85, 'nihongo ga omoshiroi desu', '78 năm', 'N2', '2023-12-06', '2023-12-06'),
(79, 86, 'nihongo ga jozu desu', '79 năm', 'N2', '2023-12-06', '2023-12-06'),
(80, 87, 'nihongo ga omoshiroi desu', '80 năm', 'N2', '2023-12-06', '2023-12-06'),
(81, 88, 'nihongo ga omoshiroi desu', '81 năm', 'N2', '2023-12-06', '2023-12-06'),
(82, 89, 'nihongo ga omoshiroi desu', '82 năm', 'N2', '2023-12-06', '2023-12-06'),
(83, 90, 'nihongo ga jozu desu', '83 năm', 'N2', '2023-12-06', '2023-12-06'),
(84, 91, 'nihongo ga omoshiroi desu', '84 năm', 'N2', '2023-12-06', '2023-12-06'),
(85, 92, 'nihongo ga omoshiroi desu', '85 năm', 'N2', '2023-12-06', '2023-12-06'),
(86, 93, 'nihongo ga jozu desu', '86 năm', 'N1', '2023-12-06', '2023-12-06'),
(87, 94, 'nihongo ga omoshiroi desu', '87 năm', 'N2', '2023-12-06', '2023-12-06'),
(88, 95, 'nihongo ga jozu desu', '88 năm', 'N2', '2023-12-06', '2023-12-06'),
(89, 96, 'nihongo ga jozu desu', '89 năm', 'N2', '2023-12-06', '2023-12-06'),
(90, 97, 'nihongo ga jozu desu', '90 năm', 'N2', '2023-12-06', '2023-12-06'),
(91, 98, 'nihongo ga omoshiroi desu', '91 năm', 'N2', '2023-12-06', '2023-12-06'),
(92, 99, 'nihongo ga jozu desu', '92 năm', 'N2', '2023-12-06', '2023-12-06'),
(93, 100, 'nihongo ga omoshiroi desu', '93 năm', 'N1', '2023-12-06', '2023-12-06'),
(94, 101, 'nihongo ga jozu desu', '94 năm', 'N2', '2023-12-06', '2023-12-06'),
(95, 102, 'nihongo ga omoshiroi desu', '95 năm', 'N1', '2023-12-06', '2023-12-06'),
(96, 103, 'nihongo ga omoshiroi desu', '96 năm', 'N1', '2023-12-06', '2023-12-06'),
(97, 104, 'nihongo ga jozu desu', '97 năm', 'N1', '2023-12-06', '2023-12-06'),
(98, 105, 'nihongo ga jozu desu', '98 năm', 'N2', '2023-12-06', '2023-12-06'),
(99, 106, 'nihongo ga omoshiroi desu', '99 năm', 'N1', '2023-12-06', '2023-12-06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `password` varchar(300) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `gender` tinyint(3) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `role` varchar(25) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nick_name`, `mail`, `password`, `avatar`, `gender`, `first_name`, `last_name`, `dob`, `role`, `status`, `createdAt`, `updatedAt`) VALUES
(6, '', 'darknessclmm@gmail.com', '2c91440bfacd977e1a27d76d53e199521669b68a06c6e6e07edd17a952f978ff', NULL, NULL, 'trần', 'hào', NULL, NULL, NULL, '2023-11-22', 2023),
(7, 'teacher0', 'teacher0@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '0', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(8, 'teacher1', 'teacher1@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '1', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(9, 'teacher2', 'teacher2@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '2', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(10, 'teacher3', 'teacher3@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '3', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(11, 'teacher4', 'teacher4@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '4', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(12, 'teacher5', 'teacher5@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '5', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(13, 'teacher6', 'teacher6@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '6', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(14, 'teacher7', 'teacher7@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '7', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(15, 'teacher8', 'teacher8@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '8', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(16, 'teacher9', 'teacher9@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '9', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(17, 'teacher10', 'teacher10@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '10', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(18, 'teacher11', 'teacher11@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '11', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(19, 'teacher12', 'teacher12@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '12', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(20, 'teacher13', 'teacher13@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '13', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(21, 'teacher14', 'teacher14@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '14', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(22, 'teacher15', 'teacher15@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '15', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(23, 'teacher16', 'teacher16@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '16', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(24, 'teacher17', 'teacher17@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '17', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(25, 'teacher18', 'teacher18@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '18', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(26, 'teacher19', 'teacher19@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '19', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(27, 'teacher20', 'teacher20@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '20', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(28, 'teacher21', 'teacher21@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '21', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(29, 'teacher22', 'teacher22@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '22', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(30, 'teacher23', 'teacher23@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '23', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(31, 'teacher24', 'teacher24@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '24', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(32, 'teacher25', 'teacher25@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '25', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(33, 'teacher26', 'teacher26@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '26', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(34, 'teacher27', 'teacher27@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '27', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(35, 'teacher28', 'teacher28@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '28', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(36, 'teacher29', 'teacher29@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '29', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(37, 'teacher30', 'teacher30@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '30', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(38, 'teacher31', 'teacher31@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '31', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(39, 'teacher32', 'teacher32@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '32', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(40, 'teacher33', 'teacher33@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '33', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(41, 'teacher34', 'teacher34@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '34', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(42, 'teacher35', 'teacher35@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '35', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(43, 'teacher36', 'teacher36@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '36', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(44, 'teacher37', 'teacher37@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '37', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(45, 'teacher38', 'teacher38@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '38', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(46, 'teacher39', 'teacher39@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '39', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(47, 'teacher40', 'teacher40@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '40', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(48, 'teacher41', 'teacher41@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '41', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(49, 'teacher42', 'teacher42@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '42', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(50, 'teacher43', 'teacher43@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '43', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(51, 'teacher44', 'teacher44@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '44', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(52, 'teacher45', 'teacher45@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '45', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(53, 'teacher46', 'teacher46@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '46', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(54, 'teacher47', 'teacher47@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '47', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(55, 'teacher48', 'teacher48@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '48', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(56, 'teacher49', 'teacher49@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '49', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(57, 'teacher50', 'teacher50@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '50', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(58, 'teacher51', 'teacher51@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '51', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(59, 'teacher52', 'teacher52@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '52', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(60, 'teacher53', 'teacher53@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '53', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(61, 'teacher54', 'teacher54@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '54', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(62, 'teacher55', 'teacher55@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '55', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(63, 'teacher56', 'teacher56@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '56', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(64, 'teacher57', 'teacher57@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '57', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(65, 'teacher58', 'teacher58@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '58', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(66, 'teacher59', 'teacher59@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '59', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(67, 'teacher60', 'teacher60@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '60', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(68, 'teacher61', 'teacher61@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '61', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(69, 'teacher62', 'teacher62@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '62', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(70, 'teacher63', 'teacher63@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '63', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(71, 'teacher64', 'teacher64@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '64', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(72, 'teacher65', 'teacher65@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '65', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(73, 'teacher66', 'teacher66@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '66', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(74, 'teacher67', 'teacher67@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '67', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(75, 'teacher68', 'teacher68@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '68', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(76, 'teacher69', 'teacher69@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '69', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(77, 'teacher70', 'teacher70@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '70', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(78, 'teacher71', 'teacher71@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '71', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(79, 'teacher72', 'teacher72@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '72', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(80, 'teacher73', 'teacher73@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '73', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(81, 'teacher74', 'teacher74@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '74', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(82, 'teacher75', 'teacher75@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '75', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(83, 'teacher76', 'teacher76@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '76', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(84, 'teacher77', 'teacher77@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '77', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(85, 'teacher78', 'teacher78@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '78', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(86, 'teacher79', 'teacher79@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '79', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(87, 'teacher80', 'teacher80@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '80', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(88, 'teacher81', 'teacher81@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '81', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(89, 'teacher82', 'teacher82@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '82', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(90, 'teacher83', 'teacher83@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '83', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(91, 'teacher84', 'teacher84@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '84', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(92, 'teacher85', 'teacher85@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '85', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(93, 'teacher86', 'teacher86@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '86', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(94, 'teacher87', 'teacher87@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '87', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(95, 'teacher88', 'teacher88@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '88', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(96, 'teacher89', 'teacher89@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '89', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(97, 'teacher90', 'teacher90@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '90', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(98, 'teacher91', 'teacher91@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '91', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(99, 'teacher92', 'teacher92@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '92', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(100, 'teacher93', 'teacher93@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '93', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(101, 'teacher94', 'teacher94@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '94', '2023-12-06', 'teacher', 0, '2023-12-06', 2023),
(102, 'teacher95', 'teacher95@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 1, 'teacher', '95', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(103, 'teacher96', 'teacher96@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '96', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(104, 'teacher97', 'teacher97@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '97', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(105, 'teacher98', 'teacher98@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '98', '2023-12-06', 'teacher', 1, '2023-12-06', 2023),
(106, 'teacher99', 'teacher99@example.com', '', 'https://lawnet.vn/uploads/image/2020/10/08/Giao-vien-tieu-hoc-trung-hoc-can-phai-lam-gi-khi-chua-co-bang-dai-hoc(1).jpg', 0, 'teacher', '99', '2023-12-06', 'teacher', 1, '2023-12-06', 2023);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `bookmark_courses`
--
ALTER TABLE `bookmark_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bookmark_courses`
--
ALTER TABLE `bookmark_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_courses`
--
ALTER TABLE `student_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
