-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 30, 2025 at 06:41 AM
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
-- Database: `ipl_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `match`
--

CREATE TABLE `match` (
  `match_id` int(11) NOT NULL,
  `team1_id` int(11) DEFAULT NULL,
  `team2_id` int(11) DEFAULT NULL,
  `match_date` date DEFAULT NULL,
  `stadium_id` int(11) DEFAULT NULL,
  `winning_team_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `match`
--

INSERT INTO `match` (`match_id`, `team1_id`, `team2_id`, `match_date`, `stadium_id`, `winning_team_id`, `created_by`) VALUES
(1, 1, 2, '2025-04-01', 1, 1, 1),
(2, 3, 4, '2025-04-02', 3, 4, 1),
(3, 5, 6, '2025-04-03', 5, 6, 1),
(4, 7, 8, '2025-04-05', 8, 7, 1),
(5, 9, 10, '2025-04-06', 9, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `player_id` int(11) NOT NULL,
  `player_name` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `runs_scored` int(11) DEFAULT 0,
  `wickets_taken` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`player_id`, `player_name`, `role`, `age`, `team_id`, `runs_scored`, `wickets_taken`) VALUES
(1, 'MS Dhoni', 'Wicketkeeper', 43, 1, 38, 0),
(2, 'Ravindra Jadeja', 'Bowler', 36, 1, 12, 2),
(3, 'Rohit Sharma', 'Batsman', 36, 2, 49, 0),
(4, 'Jasprit Bumrah', 'Bowler', 30, 2, 0, 4),
(5, 'Virat Kohli', 'Batsman', 35, 3, 102, 0),
(6, 'Josh Hazlewood', 'Bowler', 34, 3, 5, 5),
(7, 'Ajinkya Rahane', 'Batsman', 36, 4, 28, 0),
(8, 'Sunil Narine ', 'Bowler', 36, 4, 57, 2),
(9, 'Nicholas Pooran', 'Batsman', 29, 5, 76, 0),
(10, 'Shardul Thakur', 'Bowler', 33, 5, 0, 1),
(11, 'KL Rahul', 'Batsman', 33, 6, 38, 0),
(12, 'Axar Patel', 'Bowler', 30, 6, 26, 4),
(13, 'Shubman Gill', 'Batsman', 24, 7, 65, 0),
(14, 'Rashid Khan', 'Bowler', 26, 7, 20, 6),
(15, 'Shreyas Iyer', 'Batsman', 30, 8, 55, 0),
(16, 'Arshdeep Singh', 'Bowler', 25, 8, 0, 3),
(17, 'Pat Cummins', 'Bowler', 31, 9, 28, 4),
(18, 'Abhishek Sharma', 'Batsman', 23, 9, 101, 0),
(19, 'Yashasvi Jaiswal', 'Batsman', 22, 10, 81, 0),
(20, 'Jofra Archer', 'Bowler', 30, 10, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pointstable`
--

CREATE TABLE `pointstable` (
  `points_id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `matches_played` int(11) DEFAULT NULL,
  `wins` int(11) DEFAULT NULL,
  `losses` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pointstable`
--

INSERT INTO `pointstable` (`points_id`, `team_id`, `matches_played`, `wins`, `losses`, `points`) VALUES
(1, 1, 1, 1, 0, 2),
(2, 2, 1, 0, 1, 0),
(3, 3, 1, 0, 1, 0),
(4, 4, 1, 1, 0, 2),
(5, 5, 1, 0, 1, 0),
(6, 6, 1, 1, 0, 2),
(7, 7, 1, 1, 0, 2),
(8, 8, 1, 0, 1, 0),
(9, 9, 1, 1, 0, 2),
(10, 10, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `score_id` int(11) NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `runs` int(11) DEFAULT NULL,
  `wickets` int(11) DEFAULT NULL,
  `overs` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`score_id`, `match_id`, `team_id`, `runs`, `wickets`, `overs`) VALUES
(1, 1, 1, 180, 6, 20),
(2, 1, 2, 150, 8, 20),
(3, 2, 3, 145, 9, 19.5),
(4, 2, 4, 148, 7, 19.2),
(5, 3, 5, 155, 7, 20),
(6, 3, 6, 160, 5, 19.4),
(7, 4, 7, 170, 8, 20),
(8, 4, 8, 165, 7, 20),
(9, 5, 9, 175, 6, 19.5),
(10, 5, 10, 160, 8, 20);

-- --------------------------------------------------------

--
-- Table structure for table `stadium`
--

CREATE TABLE `stadium` (
  `stadium_id` int(11) NOT NULL,
  `stadium_name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stadium`
--

INSERT INTO `stadium` (`stadium_id`, `stadium_name`, `city`, `capacity`) VALUES
(1, 'MA Chidambaram Stadium', 'Chennai', 50000),
(2, 'Wankhede Stadium', 'Mumbai', 33000),
(3, 'M Chinnaswamy Stadium', 'Bengaluru', 40000),
(4, 'Eden Gardens', 'Kolkata', 66000),
(5, 'Ekana Stadium', 'Lucknow', 50000),
(6, 'Arun Jaitley Stadium', 'Delhi', 41000),
(7, 'Narendra Modi Stadium', 'Ahmedabad', 110000),
(8, 'Punjab Cricket Association IS Bindra Stadium', 'Mohali', 26000),
(9, 'Rajiv Gandhi International Cricket Stadium', 'Hyderabad', 55000),
(10, 'Sawai Mansingh Stadium', 'Jaipur', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(100) DEFAULT NULL,
  `coach` varchar(100) DEFAULT NULL,
  `home_city` varchar(100) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_id`, `team_name`, `coach`, `home_city`, `manager_id`) VALUES
(1, 'Chennai Super Kings', 'Stephen Fleming', 'Chennai', 2),
(2, 'Mumbai Indians', 'Mahela Jayawardene', 'Mumbai', 3),
(3, 'Royal Challengers Bangalore', 'Andy Flower', 'Bengaluru', NULL),
(4, 'Kolkata Knight Riders', 'Chandrakant Pandit', 'Kolkata', NULL),
(5, 'Lucknow Super Giants', 'Justin Langer', 'Lucknow', NULL),
(6, 'Delhi Capitals', 'Hemang Badani', 'Delhi', NULL),
(7, 'Gujarat Titans', 'Ashish Nehra', 'Ahmedabad', NULL),
(8, 'Punjab Kings', 'Ricky Ponting', 'Mohali', NULL),
(9, 'Sunrisers Hyderabad', 'Daniel Vettori', 'Hyderabad', NULL),
(10, 'Rajasthan Royals', 'Rahul Dravid', 'Jaipur', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Shambhav', 'admin123', 'admin', 'shambhavchhetri@gmail.com', '2025-04-28 13:37:37', '2025-04-28 13:37:37'),
(2, 'Saksham', 'pass123', 'manager', 'mgr1@gmail.com', '2025-04-28 13:37:37', '2025-04-28 13:37:37'),
(3, 'Anshuman', 'pass123', 'manager', 'mgr2@gmail.com', '2025-04-28 13:37:37', '2025-04-28 13:37:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `match`
--
ALTER TABLE `match`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `team1_id` (`team1_id`),
  ADD KEY `team2_id` (`team2_id`),
  ADD KEY `stadium_id` (`stadium_id`),
  ADD KEY `winning_team_id` (`winning_team_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `pointstable`
--
ALTER TABLE `pointstable`
  ADD PRIMARY KEY (`points_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`score_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `stadium`
--
ALTER TABLE `stadium`
  ADD PRIMARY KEY (`stadium_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `match`
--
ALTER TABLE `match`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pointstable`
--
ALTER TABLE `pointstable`
  MODIFY `points_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stadium`
--
ALTER TABLE `stadium`
  MODIFY `stadium_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `match_ibfk_1` FOREIGN KEY (`team1_id`) REFERENCES `team` (`team_id`),
  ADD CONSTRAINT `match_ibfk_2` FOREIGN KEY (`team2_id`) REFERENCES `team` (`team_id`),
  ADD CONSTRAINT `match_ibfk_3` FOREIGN KEY (`stadium_id`) REFERENCES `stadium` (`stadium_id`),
  ADD CONSTRAINT `match_ibfk_4` FOREIGN KEY (`winning_team_id`) REFERENCES `team` (`team_id`),
  ADD CONSTRAINT `match_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`);

--
-- Constraints for table `pointstable`
--
ALTER TABLE `pointstable`
  ADD CONSTRAINT `pointstable_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`);

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `match` (`match_id`),
  ADD CONSTRAINT `score_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`);

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
