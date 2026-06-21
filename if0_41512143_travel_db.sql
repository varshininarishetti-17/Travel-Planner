-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql208.infinityfree.com
-- Generation Time: Apr 10, 2026 at 10:59 AM
-- Server version: 11.4.10-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_41512143_travel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `category_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `travel_date` date DEFAULT NULL,
  `num_people` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `package_id`, `travel_date`, `num_people`, `status`, `created_at`) VALUES
(14, 4, 5, '2026-04-17', 1, 'Cancelled', '2026-04-02 02:42:59'),
(10, 3, 5, '2026-04-02', 1, 'Confirmed', '2026-04-01 14:22:29'),
(11, 5, 5, '2026-04-02', 1, 'Confirmed', '2026-04-01 15:36:26'),
(12, 5, 5, '2026-04-02', 1, 'Cancelled', '2026-04-01 15:36:49'),
(13, 7, 5, '2026-04-16', 1, 'Cancelled', '2026-04-01 18:05:34'),
(17, 3, 3, '2026-04-19', 2, 'Confirmed', '2026-04-09 16:57:25');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `destination`
--

CREATE TABLE `destination` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `destination`
--

INSERT INTO `destination` (`id`, `name`, `description`, `image`, `created_at`) VALUES
(1, 'Santorini, Greece', 'Famous for its stunning sunsets, white-washed buildings, and turquoise waters of the Aegean Sea.', 'santorini.jpg', '2026-03-31 17:05:59'),
(2, 'Kyoto, Japan', 'Experience the heart of traditional Japan with beautiful temples, zen gardens, and cherry blossoms.', 'kyoto.jpg', '2026-03-31 17:05:59'),
(3, 'Bali, Indonesia', 'A tropical paradise known for its volcanic mountains, iconic rice paddies, and coral reefs.', 'bali.jpg', '2026-03-31 17:05:59'),
(4, 'Paris, France', 'The City of Light offers world-class art, gastronomy, and the iconic Eiffel Tower.', 'paris.jpg', '2026-03-31 17:05:59'),
(5, 'Swiss Alps, Switzerland', 'A dream destination for hikers and skiers, featuring snow-capped peaks and crystal-clear lakes.', 'swiss-alps.jpg', '2026-03-31 17:05:59'),
(6, 'Amalfi Coast, Italy', 'A 50-kilometer stretch of coastline with sheer cliffs and a rugged shoreline dotted with pastel-colored fishing villages.', 'amalfi.jpg', '2026-03-31 17:05:59');

-- --------------------------------------------------------

--
-- Table structure for table `destination_ratings`
--

CREATE TABLE `destination_ratings` (
  `id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `rating` int(1) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `destination_id`, `name`, `price`, `duration`, `description`, `image`, `created_at`) VALUES
(1, 1, 'Honeymoon Sunset Special', '2500.00', '5 Days / 4 Nights', 'Enjoy a private villa with a caldera view, daily breakfast, and a sunset cruise.', 'greece_pack.jpg', '2026-03-31 17:08:38'),
(2, 1, 'Aegean Adventure', '1200.00', '3 Days / 2 Nights', 'Explore the volcanic beaches and local wineries of Santorini.', 'greece_adventure.jpg', '2026-03-31 17:08:38'),
(3, 2, 'Zen Temple Tour', '1800.00', '7 Days / 6 Nights', 'A deep dive into Kyoto culture: tea ceremonies, temple visits, and luxury Ryokan stay.', 'japan_zen.jpg', '2026-03-31 17:08:38'),
(4, 3, 'Bali Beach & Jungle', '950.00', '6 Days / 5 Nights', '3 nights in Ubud jungles and 2 nights in Seminyak beach resorts.', 'bali_combo.jpg', '2026-03-31 17:08:38'),
(5, 4, 'Parisian Romance', '3200.00', '4 Days / 3 Nights', 'Includes a dinner at the Eiffel Tower and a private tour of the Louvre.', 'paris_love.jpg', '2026-03-31 17:08:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `role` varchar(20) DEFAULT 'user'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `role`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$/WE4nytUI4uwzNF8l96TVetEnr7eLqhRyuS9jEalYFh1rI2PUZ5x2', '2026-03-31 16:56:37', 'admin'),
(2, 'aa', 'aa@gmail.com', '$2y$10$JIqfLo28RJ946sidr2.Mge7944qYwh.zWsVHTKrwoxv0qlPW0VE4G', '2026-03-31 18:42:07', 'user'),
(3, 'poshala meenal', 'meenal@gmail.com', '$2y$10$ROqJ/0HqF99XhUqVmUEPTu12GSxsWy75Em3zw8T9VFWhxETyYAALe', '2026-04-01 14:20:27', 'user'),
(4, 'Varshini Narishetti', 'varshininarishetti@gmail.com', '$2y$10$l6jKpvxAS51xWGf4NKUvR.DkxJGjq7tDn/AjSgIwrDAzkLe6kGtqi', '2026-04-01 15:29:11', 'user'),
(6, 'sathwik', 'sathwik@gmail.com', '$2y$10$tSOW8yuYm3lgxCAeVV.yOOWyKqBaTJDiB.iM7..9IdQrcVPH8b7fi', '2026-04-01 17:49:05', 'user'),
(7, 'sathwik', 'sathwik1@gmail.com', '$2y$10$PjwawpAUegT1SFB2xd1eD.V5TI2eSGCw7j.5ks06qS6auK7j8M/Wm', '2026-04-01 18:04:41', 'user'),
(8, 'Varshini', 'varshini@gmail.com', '$2y$10$cBfiWQJqjwRfUrVPLIczH.d.rWCViiWNcoeg39ClYbRgZ7VnHXy.m', '2026-04-02 01:10:08', 'user'),
(9, 'sathwik reddy', 'sathwik2@gmail.com', '$2y$10$yly5rcmKytpfwFADn8fg2OA0MvXiddda2Di6ijtY2v1C7jBjXrmNm', '2026-04-06 05:23:34', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `destination_ratings`
--
ALTER TABLE `destination_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `destination`
--
ALTER TABLE `destination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `destination_ratings`
--
ALTER TABLE `destination_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
