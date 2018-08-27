-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 27, 2018 at 04:40 PM
-- Server version: 5.7.23-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `media`
--

-- --------------------------------------------------------

--
-- Table structure for table `m_bp_friends`
--

CREATE TABLE `m_bp_friends` (
  `id` bigint(200) NOT NULL,
  `initiator_user_id` bigint(200) NOT NULL,
  `friend_user_id` bigint(200) NOT NULL,
  `is_confirmed` tinyint(1) DEFAULT '0',
  `is_limited` tinyint(1) DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_bp_messages_messages`
--

CREATE TABLE `m_bp_messages_messages` (
  `id` bigint(20) NOT NULL,
  `thread_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_date` date NOT NULL,
  `sent_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_bp_messages_recipients`
--

CREATE TABLE `m_bp_messages_recipients` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `thread_id` bigint(20) NOT NULL,
  `unread_count` int(10) NOT NULL DEFAULT '0',
  `sender_only` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `m_comments`
--

CREATE TABLE `m_comments` (
  `id` bigint(200) NOT NULL,
  `post_id` bigint(200) NOT NULL,
  `user_id` bigint(200) NOT NULL,
  `comment` text NOT NULL,
  `comment_attachement` varchar(200) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_comments`
--

INSERT INTO `m_comments` (`id`, `post_id`, `user_id`, `comment`, `comment_attachement`, `time`) VALUES
(1, 1, 1, 'ddd', '0', '2018-07-28 05:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `m_groups`
--

CREATE TABLE `m_groups` (
  `id` bigint(20) NOT NULL,
  `group_name` text NOT NULL,
  `group_admin_id` bigint(200) NOT NULL,
  `group_mode` int(100) NOT NULL DEFAULT '0',
  `group_profile` text,
  `group_cover` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_group_members`
--

CREATE TABLE `m_group_members` (
  `id` bigint(200) NOT NULL,
  `group_id` bigint(200) NOT NULL,
  `user_id` bigint(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_hashtags`
--

CREATE TABLE `m_hashtags` (
  `id` bigint(20) NOT NULL,
  `hashtag` varchar(200) NOT NULL,
  `creator_id` bigint(200) NOT NULL,
  `count` int(200) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_likes`
--

CREATE TABLE `m_likes` (
  `id` bigint(200) NOT NULL,
  `post_id` bigint(200) NOT NULL,
  `user_id` bigint(200) NOT NULL,
  `count` bigint(200) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_likes`
--

INSERT INTO `m_likes` (`id`, `post_id`, `user_id`, `count`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_post`
--

CREATE TABLE `m_post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_content` varchar(2000) NOT NULL,
  `post_attachement` varchar(2000) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_likes` int(255) DEFAULT '0',
  `post_comments_count` bigint(200) NOT NULL DEFAULT '0',
  `bg_color` varchar(50) NOT NULL DEFAULT 'white'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_post`
--

INSERT INTO `m_post` (`id`, `user_id`, `post_content`, `post_attachement`, `time`, `post_likes`, `post_comments_count`, `bg_color`) VALUES
(1, 1, 'ddddddddd', 'suresh_media_2018-07-28 10:54:22.076939imac-2x.png', '2018-07-28 10:54:22', 1, 1, 'white'),
(2, 1, '', 'suresh_media_2018-07-28 11:07:07.812997C__Data_Users_DefApps_AppData_INTERNETEXPLORER_Temp_Saved_Images_imagesL7RUI476.jpg', '2018-07-28 11:07:07', 0, 0, 'white');

-- --------------------------------------------------------

--
-- Table structure for table `m_sessions`
--

CREATE TABLE `m_sessions` (
  `id` bigint(200) NOT NULL,
  `user_id` bigint(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `profile_pic` varchar(200) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_signups`
--

CREATE TABLE `m_signups` (
  `signup_id` bigint(20) NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_signups`
--

INSERT INTO `m_signups` (`signup_id`, `user_login`, `user_pass`, `user_email`, `registered`, `activated`, `active`, `activation_key`) VALUES
(1, 'suresh', '}|o}r', 'sureshiknow@gmail.com', '2018-07-28 10:53:25', '2018-07-28 10:53:25', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `m_users`
--

CREATE TABLE `m_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` bigint(200) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `cover_pic` text COLLATE utf8mb4_unicode_ci,
  `theme` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'skin-blue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_users`
--

INSERT INTO `m_users` (`ID`, `user_login`, `user_pass`, `user_email`, `display_name`, `phone`, `dob`, `gender`, `photo`, `cover_pic`, `theme`) VALUES
(1, 'suresh', '}|o}r', 'sureshiknow@gmail.com', 'SurEzh', 8940900902, '2015-07-01', 'Male', 'alphabets/s.jpg', NULL, 'skin-blue');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_bp_friends`
--
ALTER TABLE `m_bp_friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `initiator_user_id` (`initiator_user_id`),
  ADD KEY `friend_user_id` (`friend_user_id`);

--
-- Indexes for table `m_bp_messages_messages`
--
ALTER TABLE `m_bp_messages_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Indexes for table `m_bp_messages_recipients`
--
ALTER TABLE `m_bp_messages_recipients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `sender_only` (`sender_only`),
  ADD KEY `unread_count` (`unread_count`);

--
-- Indexes for table `m_comments`
--
ALTER TABLE `m_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_groups`
--
ALTER TABLE `m_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_group_members`
--
ALTER TABLE `m_group_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_hashtags`
--
ALTER TABLE `m_hashtags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_likes`
--
ALTER TABLE `m_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_post`
--
ALTER TABLE `m_post`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `m_sessions`
--
ALTER TABLE `m_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_signups`
--
ALTER TABLE `m_signups`
  ADD PRIMARY KEY (`signup_id`),
  ADD KEY `activation_key` (`activation_key`),
  ADD KEY `user_email` (`user_email`),
  ADD KEY `user_login_email` (`user_login`,`user_email`);

--
-- Indexes for table `m_users`
--
ALTER TABLE `m_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_bp_friends`
--
ALTER TABLE `m_bp_friends`
  MODIFY `id` bigint(200) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_bp_messages_messages`
--
ALTER TABLE `m_bp_messages_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_bp_messages_recipients`
--
ALTER TABLE `m_bp_messages_recipients`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_comments`
--
ALTER TABLE `m_comments`
  MODIFY `id` bigint(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_groups`
--
ALTER TABLE `m_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_group_members`
--
ALTER TABLE `m_group_members`
  MODIFY `id` bigint(200) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_hashtags`
--
ALTER TABLE `m_hashtags`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_likes`
--
ALTER TABLE `m_likes`
  MODIFY `id` bigint(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_post`
--
ALTER TABLE `m_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_sessions`
--
ALTER TABLE `m_sessions`
  MODIFY `id` bigint(200) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_signups`
--
ALTER TABLE `m_signups`
  MODIFY `signup_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_users`
--
ALTER TABLE `m_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
