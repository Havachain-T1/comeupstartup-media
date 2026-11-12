-- SANITISED DEVELOPMENT SEED - NOT PRODUCTION DATA.
-- Vendor demo content (NewsLooks/ThemeLooks). Credentials and personal data were
-- replaced by tools/sanitise-seed.py. Every seeded user's password is: password
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 04, 2024 at 12:24 PM
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
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_activity_log`
--

CREATE TABLE `admin_login_activity_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `login_at` timestamp NULL DEFAULT NULL,
  `logout_at` timestamp NULL DEFAULT NULL,
  `ip` text DEFAULT NULL,
  `os` text DEFAULT NULL,
  `browser` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_share_options`
--

CREATE TABLE `blog_share_options` (
  `id` int(11) NOT NULL,
  `network` varchar(150) NOT NULL,
  `network_name` varchar(150) NOT NULL,
  `icon` text DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog_share_options`
--

INSERT INTO `blog_share_options` (`id`, `network`, `network_name`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'facebook', 'Facebook', '<i class=\"fa fa-facebook\"></i>', 1, '2021-06-22 04:08:48', '2023-05-24 05:44:06'),
(2, 'linkedin', 'LinkedIn', '<i class=\"fa fa-linkedin\"></i>', 1, '2021-06-22 05:02:37', '2023-05-24 05:44:20'),
(3, 'digg', 'Digg', '<i class=\"fa fa-digg\"></i>', 1, '2021-06-22 05:02:37', '2023-05-24 05:44:25'),
(4, 'pinterest', 'Pinterest', '<i class=\"fa fa-pinterest\"></i>', 1, '2021-06-22 05:05:56', '2021-06-22 05:05:56'),
(5, 'twitter', 'Twitter', '<i class=\"fa fa-twitter\"></i>', 1, '2021-06-22 05:05:56', '2021-06-22 05:05:56'),
(6, 'gmail', 'Gmail', '<i class=\"fa fa-google\"></i>', 1, '2021-06-22 05:05:56', '2021-06-22 05:05:56'),
(7, 'whatsapp', 'Whatsapp', '<i class=\"fa fa-whatsapp\"></i>', 1, '2021-06-22 05:05:56', '2021-06-22 05:05:56'),
(8, 'reddit', 'Reddit', '<i class=\"fa fa-reddit\"></i>', 1, '2021-06-22 05:05:56', '2021-06-22 05:05:56'),
(9, 'telegramMe', 'Telegram', '<i class=\"fa fa-telegram\"></i>', 1, '2021-06-22 05:05:56', '2023-01-05 03:29:16'),
(10, 'email', 'Email', '<i class=\"fa fa-envelope\"></i>', 1, '2021-06-23 05:48:32', '2023-01-05 03:29:22'),
(11, 'tumblr', 'Tumblr', '<i class=\"fa fa-tumblr\"></i>', 1, '2021-06-23 05:49:07', '2023-01-05 03:29:29'),
(12, 'vk', 'VKontakte', '<i class=\"fa fa-vk\"></i>', 1, '2021-06-23 05:49:07', '2023-01-05 03:29:29');

-- --------------------------------------------------------

--
-- Table structure for table `custom_ads`
--

CREATE TABLE `custom_ads` (
  `id` int(11) NOT NULL,
  `type` varchar(250) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `content` text DEFAULT NULL,
  `size` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'Core\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `open_ai_settings`
--

CREATE TABLE `open_ai_settings` (
  `id` int(11) NOT NULL,
  `api_key` text DEFAULT NULL,
  `default_model` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `open_ai_settings`
--

INSERT INTO `open_ai_settings` (`id`, `api_key`, `default_model`) VALUES
(1, NULL, 'text-davinci-003');

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_sections`
--

CREATE TABLE `page_builder_sections` (
  `id` int(11) NOT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `theme_id` int(11) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_builder_sections`
--

INSERT INTO `page_builder_sections` (`id`, `page_id`, `theme_id`, `ordering`, `status`, `created_at`, `updated_at`) VALUES
(172, 30, 22, 1, 1, '2023-10-30 11:56:20', '2023-10-30 11:56:37'),
(173, 30, 22, 6, 1, '2023-10-30 11:56:24', '2023-12-26 12:11:10'),
(179, 30, 22, 2, 1, '2023-11-09 05:16:07', '2023-11-09 05:16:16'),
(180, 30, 22, 3, 1, '2023-11-09 06:27:59', '2023-11-09 06:28:08'),
(187, 30, 22, 4, 1, '2023-11-28 05:23:42', '2023-12-26 12:11:10'),
(189, 30, 22, 5, 1, '2023-12-09 10:18:30', '2023-12-26 12:11:10'),
(190, 34, 22, 1, 1, '2023-12-09 17:16:43', '2023-12-09 17:16:43'),
(191, 34, 22, 2, 1, '2023-12-09 17:16:45', '2023-12-09 17:16:45'),
(192, 34, 22, 6, 1, '2023-12-09 17:16:47', '2023-12-09 17:57:03'),
(193, 34, 22, 3, 1, '2023-12-09 17:39:16', '2023-12-09 17:39:27'),
(194, 34, 22, 4, 1, '2023-12-09 17:42:05', '2023-12-09 17:42:08'),
(195, 34, 22, 5, 1, '2023-12-09 17:56:59', '2023-12-09 17:57:03'),
(196, 35, 22, 1, 1, '2023-12-10 10:46:29', '2023-12-10 10:46:29'),
(197, 35, 22, 7, 1, '2023-12-10 10:46:31', '2023-12-10 11:52:04'),
(198, 36, 22, 1, 1, '2023-12-10 11:02:36', '2023-12-10 11:02:36'),
(199, 36, 22, 5, 1, '2023-12-10 11:02:40', '2023-12-10 12:44:05'),
(200, 37, 22, 1, 1, '2023-12-10 11:11:47', '2023-12-10 14:53:48'),
(201, 37, 22, 8, 1, '2023-12-10 11:11:49', '2023-12-10 15:11:39'),
(202, 35, 22, 2, 1, '2023-12-10 11:43:11', '2023-12-10 11:43:14'),
(203, 35, 22, 3, 1, '2023-12-10 11:44:55', '2023-12-10 11:45:00'),
(204, 35, 22, 4, 1, '2023-12-10 11:46:23', '2023-12-10 11:46:32'),
(205, 35, 22, 5, 1, '2023-12-10 11:48:44', '2023-12-10 11:48:47'),
(206, 35, 22, 6, 1, '2023-12-10 11:52:00', '2023-12-10 11:52:04'),
(207, 36, 22, 2, 1, '2023-12-10 12:32:54', '2023-12-10 12:32:57'),
(208, 36, 22, 4, 1, '2023-12-10 12:32:54', '2023-12-10 12:44:05'),
(209, 36, 22, 3, 1, '2023-12-10 12:44:02', '2023-12-10 12:44:05'),
(210, 37, 22, 2, 1, '2023-12-10 14:32:59', '2023-12-10 14:53:50'),
(211, 37, 22, 3, 1, '2023-12-10 14:33:02', '2023-12-10 14:53:50'),
(212, 37, 22, 4, 1, '2023-12-10 14:57:49', '2023-12-10 14:57:52'),
(213, 37, 22, 5, 1, '2023-12-10 15:04:44', '2023-12-10 15:04:47'),
(214, 37, 22, 6, 1, '2023-12-10 15:08:27', '2023-12-10 15:08:32'),
(215, 37, 22, 7, 1, '2023-12-10 15:11:35', '2023-12-10 15:11:39');

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_sections_layout_widget_properties`
--

CREATE TABLE `page_builder_sections_layout_widget_properties` (
  `id` int(11) NOT NULL,
  `layout_has_widget_id` int(11) DEFAULT NULL,
  `properties` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_builder_sections_layout_widget_properties`
--

INSERT INTO `page_builder_sections_layout_widget_properties` (`id`, `layout_has_widget_id`, `properties`) VALUES
(235, 355, '{\"header_variation\":\"header-2\",\"page\":\"30\"}'),
(236, 357, '{\"footer_variation\":\"footer-1\",\"page\":\"30\"}'),
(241, 362, '{\"title_t_\":null,\"type\":\"feature\",\"category\":\"274\",\"post_advance_style\":\"advance_layout_1\",\"count\":\"4\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"30\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(254, 376, '{\"title_t_\":\"World News\",\"type\":\"category\",\"category\":\"289\",\"post_advance_style\":\"advance_layout_4\",\"count\":\"5\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(255, 377, '{\"title_t_\":\"Technology\",\"type\":\"category\",\"category\":\"288\",\"post_advance_style\":\"advance_layout_3\",\"count\":\"5\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(256, 379, '{\"ads_image\":\"1150\",\"ads_url\":\"\\/\",\"google_adsense\":null,\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(257, 380, '{\"title_t_\":\"Stay Connected\",\"background_color\":\"#F7F8FA\",\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":\"50\",\"padding_right\":\"20\",\"padding_bottom\":\"50\",\"padding_left\":\"20\",\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(258, 381, '{\"title_t_\":\"GET NEWSLETTER\",\"short_desc_t_\":\"Subscribe to our newsletter to get the latest news and exclusive updates.\",\"email_placeholder_t_\":\"Enter Email\",\"btn_text_t_\":\"Subscribe\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(265, 389, '{\"title_t_\":\"Readers Opinion\",\"type\":\"most_comment\",\"category\":\"274\",\"count\":\"4\",\"background_color\":\"#F7F8FA\",\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":\"50\",\"padding_right\":\"20\",\"padding_bottom\":\"30\",\"padding_left\":\"20\",\"margin_top\":\"0\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(266, 390, '{\"title_t_\":\"Fashion\",\"type\":\"category\",\"category\":\"274\",\"post_advance_style\":\"advance_layout_8\",\"count\":\"6\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(268, 392, '{\"ads_image\":\"1149\",\"ads_url\":null,\"google_adsense\":null,\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(269, 393, '{\"title_t_\":\"Videos\",\"playlist_title_t_\":\"Playlist\",\"type\":\"most_comment\",\"category\":\"274\",\"count\":\"5\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(270, 395, '{\"title_t_\":\"Vote For Champion\",\"vote_id\":\"1\",\"background_color\":\"#F7F8FA\",\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":\"20\",\"padding_bottom\":\"50\",\"padding_left\":\"20\",\"margin_top\":\"0\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(271, 394, '{\"title_t_\":\"Top News\",\"type\":\"most_view\",\"category\":\"274\",\"post_advance_style\":\"advance_layout_6\",\"count\":\"7\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"30\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(274, 398, '{\"title_t_\":\"Entertainment\",\"type\":\"recent\",\"category\":\"274\",\"post_style\":\"s_four\",\"post_column_lg\":\"col-lg-4\",\"post_column_md\":\"col-sm-4\",\"post_column_sm\":\"col-12\",\"count\":\"3\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(276, 400, '{\"header_variation\":\"header-2\",\"page\":\"34\"}'),
(277, 401, '{\"footer_variation\":\"footer-2\",\"page\":\"34\"}'),
(278, 402, '{\"type\":\"feature\",\"category\":\"274\",\"count\":\"6\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"34\"}'),
(279, 403, '{\"title_t_\":\"Popular News\",\"type\":\"most_view\",\"category\":\"274\",\"post_advance_style\":\"advance_layout_2\",\"count\":\"7\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"34\"}'),
(280, 404, '{\"title_t_\":\"Entertainment\",\"type\":\"category\",\"category\":\"295\",\"post_style\":\"s_one\",\"post_column_lg\":\"col-lg-12\",\"post_column_md\":\"col-sm-12\",\"post_column_sm\":\"col-12\",\"count\":\"5\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"34\"}'),
(281, 405, '{\"title_t_\":\"Follow US\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"34\"}'),
(282, 406, '{\"title_t_\":\"Technology\",\"type\":\"category\",\"category\":\"288\",\"post_advance_style\":\"advance_layout_3\",\"count\":\"5\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"50\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"34\"}'),
(283, 407, '{\"ads_image\":\"1154\",\"ads_url\":\"\\/\",\"google_adsense\":null,\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"50\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"34\"}'),
(284, 408, '{\"title_t_\":\"Latest News\",\"type\":\"recent\",\"category\":\"274\",\"post_style\":\"s_four\",\"post_column_lg\":\"col-lg-3\",\"post_column_md\":\"col-sm-4\",\"post_column_sm\":\"col-12\",\"count\":\"8\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"34\"}'),
(285, 409, '{\"header_variation\":\"header-3\",\"page\":\"35\"}'),
(286, 410, '{\"footer_variation\":\"footer-1\",\"page\":\"35\"}'),
(287, 411, '{\"header_variation\":\"header-4\",\"page\":\"36\"}'),
(288, 412, '{\"footer_variation\":\"footer-2\",\"page\":\"36\"}'),
(289, 413, '{\"header_variation\":\"header-5\",\"page\":\"37\"}'),
(290, 414, '{\"footer_variation\":\"footer-1\",\"page\":\"37\"}'),
(291, 415, '{\"title_t_\":null,\"type\":\"feature\",\"category\":\"274\",\"post_advance_style\":\"advance_layout_7\",\"count\":\"5\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}'),
(292, 416, '{\"widget_image\":\"1155\",\"link\":\"custom_url\",\"link_url\":\"\\/\",\"new_window\":\"0\",\"alignment\":\"center\",\"width_c_\":null,\"max_width_c_\":null,\"height_c_\":null,\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}'),
(293, 417, '{\"title_t_\":\"Hot Topics\",\"type\":\"most_view\",\"category\":\"274\",\"post_style\":\"s_four\",\"post_column_lg\":\"col-lg-3\",\"post_column_md\":\"col-sm-6\",\"post_column_sm\":\"col-12\",\"count\":\"4\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}'),
(294, 418, '{\"title_t_\":\"What\'s New\",\"type\":\"recent\",\"category\":\"274\",\"post_advance_style\":\"advance_layout_5\",\"count\":\"5\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}'),
(295, 419, '{\"title_t_\":\"Life Style\",\"type\":\"category\",\"category\":\"291\",\"post_style\":\"s_one\",\"post_column_lg\":\"col-lg-12\",\"post_column_md\":\"col-sm-12\",\"post_column_sm\":\"col-12\",\"count\":\"6\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}'),
(296, 420, '{\"title_t_\":\"Follow US\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}'),
(297, 421, '{\"title_t_\":\"GET NEWSLETTER\",\"short_desc_t_\":\"Subscribe to our newsletter to get the latest news and exclusive updates.\",\"email_placeholder_t_\":\"Enter Email\",\"btn_text_t_\":\"Subscriber\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"55\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}'),
(298, 422, '{\"title_t_\":\"Popular News\",\"type\":\"popular\",\"category\":\"274\",\"count\":\"3\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"55\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}'),
(299, 423, '{\"ads_image\":\"1152\",\"ads_url\":\"\\/\",\"google_adsense\":null,\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"55\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}'),
(301, 425, '{\"title_t_\":null,\"type\":\"category\",\"category\":\"288\",\"post_advance_style\":\"advance_layout_9\",\"count\":\"3\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"36\"}'),
(302, 426, '{\"title_t_\":\"Recent News\",\"type\":\"recent\",\"category\":\"294\",\"post_advance_style\":\"advance_layout_8\",\"count\":\"6\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"36\"}'),
(303, 427, '{\"title_t_\":\"Politics\",\"type\":\"category\",\"category\":\"290\",\"count\":\"4\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"36\"}'),
(304, 428, '{\"title_t_\":\"World News\",\"type\":\"category\",\"category\":\"289\",\"post_style\":\"s_two\",\"post_column_lg\":\"col-lg-6\",\"post_column_md\":\"col-sm-6\",\"post_column_sm\":\"col-12\",\"count\":\"4\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"36\"}'),
(305, 429, '{\"title_t_\":\"Top Categories\",\"number_of_category\":\"6\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"50\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"36\"}'),
(306, 430, '{\"title_t_\":\"Top Tags\",\"tag_count\":\"15\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"50\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"36\"}'),
(307, 431, '{\"title_t_\":\"Latest Comments\",\"count\":\"4\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"45\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"36\"}'),
(308, 432, '{\"title_t_\":\"Entertainment\",\"playlist_title_t_\":\"Video\",\"type\":\"category\",\"category\":\"295\",\"count\":\"6\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"36\"}'),
(309, 434, '{\"title_t_\":\"Latest News\",\"type\":\"recent\",\"category\":\"274\",\"post_advance_style\":\"advance_layout_5\",\"count\":\"5\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}'),
(310, 436, '{\"widget_image\":\"1155\",\"link\":\"custom_url\",\"link_url\":\"\\/\",\"new_window\":\"0\",\"alignment\":\"center\",\"width_c_\":null,\"max_width_c_\":null,\"height_c_\":null,\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}'),
(311, 437, '{\"title_t_\":\"Top News Of 2023\",\"type\":\"most_view\",\"category\":\"274\",\"post_advance_style\":\"advance_layout_6\",\"count\":\"7\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}'),
(312, 438, '{\"title_t_\":\"Follow US\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}'),
(313, 439, '{\"title_t_\":\"Categories\",\"number_of_category\":\"6\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"45\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}'),
(314, 440, '{\"ads_image\":\"1156\",\"ads_url\":\"\\/\",\"google_adsense\":null,\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"45\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}'),
(315, 441, '{\"title_t_\":null,\"playlist_title_t_\":\"Video List\",\"type\":\"category\",\"category\":\"290\",\"count\":\"6\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}'),
(316, 442, '{\"title_t_\":\"Top Viewed News\",\"type\":\"most_view\",\"category\":\"274\",\"post_style\":\"s_four\",\"post_column_lg\":\"col-lg-4\",\"post_column_md\":\"col-sm-6\",\"post_column_sm\":\"col-12\",\"count\":\"6\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}'),
(317, 445, '{\"title_t_\":\"Sports\",\"type\":\"category\",\"category\":\"294\",\"count\":\"5\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}'),
(318, 446, '{\"title_t_\":\"World News\",\"type\":\"category\",\"category\":\"289\",\"post_style\":\"s_one\",\"post_column_lg\":\"col-lg-12\",\"post_column_md\":\"col-sm-12\",\"post_column_sm\":\"col-12\",\"count\":\"2\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}'),
(319, 453, '{\"ads_image\":\"1152\",\"ads_url\":\"#\",\"new_window\":\"1\",\"google_adsense\":null,\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}'),
(321, 455, '{\"ads_image\":\"1151\",\"ads_url\":\"\\/\",\"google_adsense\":null,\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}');

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_sections_properties`
--

CREATE TABLE `page_builder_sections_properties` (
  `id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `properties` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_builder_sections_properties`
--

INSERT INTO `page_builder_sections_properties` (`id`, `section_id`, `properties`, `created_at`, `updated_at`) VALUES
(111, 172, '{\"container\":\"container-fluid\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":\"0\",\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}', '2023-10-30 11:56:54', '2023-12-26 13:25:17'),
(112, 173, '{\"container\":\"container-fluid\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"30\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}', '2023-10-30 11:57:03', '2023-12-26 13:24:47'),
(114, 180, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}', '2023-11-09 06:30:39', '2023-12-09 12:05:57'),
(116, 187, '{\"background_color\":\"#F7F8FA\",\"background_image\":\"1157\",\"background_size\":\"cover\",\"background_position\":\"bottom\",\"background_repeat\":\"no-repeat\",\"padding_top\":\"50\",\"padding_right\":null,\"padding_bottom\":\"60\",\"padding_left\":null,\"margin_top\":\"50\",\"margin_right\":null,\"margin_bottom\":\"60\",\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}', '2023-11-28 05:24:29', '2023-12-28 05:58:01'),
(118, 189, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"50\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}', '2023-12-09 10:19:19', '2023-12-21 17:25:24'),
(119, 191, '{\"container\":\"container\",\"background_color\":null,\"background_image\":\"1157\",\"background_size\":\"cover\",\"background_position\":\"center\",\"background_repeat\":\"no-repeat\",\"padding_top\":\"70\",\"padding_right\":null,\"padding_bottom\":\"40\",\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"34\"}', '2023-12-09 17:17:38', '2023-12-28 05:56:41'),
(120, 192, '{\"container\":\"container-fluid\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"34\"}', '2023-12-09 17:20:30', '2023-12-09 17:20:30'),
(121, 190, '{\"container\":\"container-fluid\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"34\"}', '2023-12-09 17:20:33', '2023-12-09 17:20:33'),
(122, 193, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"34\"}', '2023-12-09 17:39:37', '2023-12-09 17:39:37'),
(123, 194, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"30\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"34\"}', '2023-12-09 17:46:53', '2023-12-09 17:46:53'),
(124, 195, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"30\",\"margin_right\":null,\"margin_bottom\":\"60\",\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"34\"}', '2023-12-09 17:57:19', '2023-12-09 18:01:09'),
(125, 196, '{\"container\":\"container-fluid\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}', '2023-12-10 10:47:00', '2023-12-10 10:47:00'),
(126, 197, '{\"container\":\"container-fluid\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}', '2023-12-10 10:47:11', '2023-12-10 10:47:11'),
(127, 198, '{\"container\":\"container-fluid\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"36\"}', '2023-12-10 11:02:52', '2023-12-10 11:02:52'),
(128, 199, '{\"container\":\"container-fluid\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"36\"}', '2023-12-10 11:03:00', '2023-12-10 11:03:00'),
(129, 200, '{\"container\":\"container-fluid\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}', '2023-12-10 11:11:57', '2023-12-10 11:11:57'),
(130, 201, '{\"container\":\"container-fluid\",\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}', '2023-12-10 11:12:05', '2023-12-10 11:12:05'),
(131, 202, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}', '2023-12-10 11:44:10', '2023-12-10 11:44:10'),
(132, 203, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}', '2023-12-10 11:45:16', '2023-12-10 11:45:16'),
(133, 204, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}', '2023-12-10 11:46:37', '2023-12-10 11:46:37'),
(134, 205, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"30\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}', '2023-12-10 11:48:58', '2023-12-10 11:51:06'),
(135, 206, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":\"30\",\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"35\"}', '2023-12-10 11:52:13', '2023-12-10 12:10:56'),
(136, 208, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"30\",\"margin_right\":null,\"margin_bottom\":\"60\",\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"36\"}', '2023-12-10 12:42:49', '2023-12-10 13:01:02'),
(137, 209, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"36\"}', '2023-12-10 12:44:19', '2023-12-10 12:44:19'),
(138, 210, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}', '2023-12-10 14:54:19', '2023-12-10 14:54:19'),
(139, 212, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}', '2023-12-10 15:02:07', '2023-12-10 15:02:07'),
(140, 213, '{\"container\":\"container\",\"background_color\":null,\"background_image\":\"1157\",\"background_size\":\"cover\",\"background_position\":\"center\",\"background_repeat\":\"no-repeat\",\"padding_top\":\"60\",\"padding_right\":null,\"padding_bottom\":\"60\",\"padding_left\":null,\"margin_top\":\"30\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}', '2023-12-10 15:05:43', '2023-12-28 05:52:32'),
(141, 214, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"60\",\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}', '2023-12-10 15:08:48', '2023-12-10 15:08:48'),
(142, 215, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":null,\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":\"30\",\"margin_right\":null,\"margin_bottom\":\"30\",\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"37\"}', '2023-12-10 15:12:05', '2023-12-10 15:14:41'),
(143, 179, '{\"background_color\":null,\"background_image\":null,\"background_size\":null,\"background_position\":null,\"background_repeat\":null,\"padding_top\":\"10\",\"padding_right\":null,\"padding_bottom\":null,\"padding_left\":null,\"margin_top\":null,\"margin_right\":null,\"margin_bottom\":null,\"margin_left\":null,\"tab_padding_top\":null,\"tab_padding_right\":null,\"tab_padding_bottom\":null,\"tab_padding_left\":null,\"tab_margin_top\":null,\"tab_margin_right\":null,\"tab_margin_bottom\":null,\"tab_margin_left\":null,\"mobile_padding_top\":null,\"mobile_padding_right\":null,\"mobile_padding_bottom\":null,\"mobile_padding_left\":null,\"mobile_margin_top\":null,\"mobile_margin_right\":null,\"mobile_margin_bottom\":null,\"mobile_margin_left\":null,\"page\":\"30\"}', '2023-12-26 13:25:35', '2023-12-26 13:26:05');

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_section_layouts`
--

CREATE TABLE `page_builder_section_layouts` (
  `id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `col_index` int(3) DEFAULT NULL,
  `col_value` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_builder_section_layouts`
--

INSERT INTO `page_builder_section_layouts` (`id`, `section_id`, `col_index`, `col_value`) VALUES
(313, 172, 1, 12),
(314, 173, 1, 12),
(324, 179, 1, 12),
(325, 180, 1, 4),
(326, 180, 2, 4),
(327, 180, 3, 4),
(336, 187, 1, 12),
(339, 189, 1, 8),
(340, 189, 2, 4),
(341, 190, 1, 12),
(342, 191, 1, 12),
(343, 192, 1, 12),
(344, 193, 1, 12),
(345, 194, 1, 8),
(346, 194, 2, 4),
(347, 195, 1, 12),
(348, 196, 1, 12),
(349, 197, 1, 12),
(350, 198, 1, 12),
(351, 199, 1, 12),
(352, 200, 1, 12),
(353, 201, 1, 12),
(354, 202, 1, 12),
(355, 203, 1, 12),
(356, 204, 1, 12),
(357, 205, 1, 12),
(358, 206, 1, 8),
(359, 206, 2, 4),
(360, 207, 1, 12),
(361, 208, 1, 12),
(362, 209, 1, 8),
(363, 209, 2, 4),
(364, 210, 1, 12),
(365, 211, 1, 12),
(366, 212, 1, 8),
(367, 212, 2, 4),
(368, 213, 1, 12),
(369, 214, 1, 12),
(370, 215, 1, 8),
(371, 215, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_section_layout_widgets`
--

CREATE TABLE `page_builder_section_layout_widgets` (
  `id` int(11) NOT NULL,
  `section_layout_id` int(11) DEFAULT NULL,
  `page_widget_id` int(11) DEFAULT NULL,
  `serial` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_builder_section_layout_widgets`
--

INSERT INTO `page_builder_section_layout_widgets` (`id`, `section_layout_id`, `page_widget_id`, `serial`) VALUES
(355, 313, 48, 1),
(357, 314, 49, 1),
(362, 324, 47, 1),
(376, 325, 47, 1),
(377, 326, 47, 1),
(379, 327, 23, 1),
(380, 327, 29, 2),
(381, 327, 27, 3),
(389, 340, 42, 2),
(390, 339, 47, 1),
(392, 339, 23, 2),
(393, 336, 45, 1),
(394, 339, 47, 4),
(395, 340, 33, 3),
(398, 339, 46, 3),
(400, 341, 48, 1),
(401, 343, 49, 1),
(402, 342, 44, 1),
(403, 344, 47, 1),
(404, 345, 46, 1),
(405, 346, 29, 1),
(406, 346, 47, 2),
(407, 346, 23, 3),
(408, 347, 46, 1),
(409, 348, 48, 1),
(410, 349, 49, 1),
(411, 350, 48, 1),
(412, 351, 49, 1),
(413, 352, 48, 1),
(414, 353, 49, 1),
(415, 354, 47, 1),
(416, 355, 21, 1),
(417, 356, 46, 1),
(418, 357, 47, 1),
(419, 358, 46, 1),
(420, 359, 29, 1),
(421, 359, 27, 2),
(422, 359, 42, 3),
(423, 359, 23, 4),
(425, 360, 47, 1),
(426, 362, 47, 1),
(427, 363, 42, 1),
(428, 362, 46, 2),
(429, 363, 25, 2),
(430, 363, 26, 3),
(431, 363, 34, 4),
(432, 361, 45, 1),
(434, 364, 47, 1),
(436, 365, 21, 1),
(437, 366, 47, 1),
(438, 367, 29, 1),
(439, 367, 25, 2),
(440, 367, 23, 3),
(441, 368, 45, 1),
(442, 369, 46, 1),
(445, 371, 42, 1),
(446, 370, 46, 1),
(453, 340, 23, 4),
(455, 340, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_widgets`
--

CREATE TABLE `page_builder_widgets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `theme_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_builder_widgets`
--

INSERT INTO `page_builder_widgets` (`id`, `name`, `full_name`, `theme_id`) VALUES
(19, 'heading_tag', 'Heading Tag', 22),
(20, 'text_editor', 'Text Editor', 22),
(21, 'image', 'Image', 22),
(22, 'button', 'Button', 22),
(23, 'ads', 'Ads', 22),
(24, 'author', 'Author', 22),
(25, 'category', 'Category', 22),
(26, 'tag', 'Tag', 22),
(27, 'newsletter', 'Newsletter', 22),
(28, 'contact', 'Contact', 22),
(29, 'social', 'Social', 22),
(30, 'search', 'Search', 22),
(33, 'voting', 'Voting', 22),
(34, 'recent_comments', 'Recent Comments', 22),
(35, 'address', 'Address', 22),
(36, 'menu_links', 'Menu Links', 22),
(37, 'gallery_post', 'Gallery Post', 22),
(42, 'post_list', 'Post List', 22),
(43, 'post_tab', 'Post Tab', 22),
(44, 'slider_post', 'Slider Post', 22),
(45, 'video_post', 'Video Post', 22),
(46, 'post_layout', 'Post Layout', 22),
(47, 'post_advance_layout', 'Post Advance Layout', 22),
(48, 'header', 'Header', 22),
(49, 'footer', 'Footer', 22),
(50, 'post_filter', 'Post Filter', 22);

-- --------------------------------------------------------

--
-- Table structure for table `page_builder_widget_translations`
--

CREATE TABLE `page_builder_widget_translations` (
  `id` int(11) NOT NULL,
  `lang` varchar(150) DEFAULT NULL,
  `layout_widget_properties_id` int(11) DEFAULT NULL,
  `properties` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_builder_widget_translations`
--

INSERT INTO `page_builder_widget_translations` (`id`, `lang`, `layout_widget_properties_id`, `properties`) VALUES
(11, 'sa', 254, '{\"title_t_\":\"\\u0627\\u062e\\u0628\\u0627\\u0631 \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645\"}'),
(12, 'sa', 255, '{\"title_t_\":\"\\u062a\\u0643\\u0646\\u0648\\u0644\\u0648\\u062c\\u064a\\u0627\"}'),
(13, 'sa', 257, '{\"title_t_\":\"\\u0627\\u0628\\u0642 \\u0639\\u0644\\u0649 \\u0627\\u062a\\u0635\\u0627\\u0644\"}'),
(14, 'sa', 258, '{\"title_t_\":\"\\u0627\\u062d\\u0635\\u0644 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0646\\u0634\\u0631\\u0629 \\u0627\\u0644\\u0625\\u062e\\u0628\\u0627\\u0631\\u064a\\u0629\",\"short_desc_t_\":\"\\u0627\\u0634\\u062a\\u0631\\u0643 \\u0641\\u064a \\u0627\\u0644\\u0646\\u0634\\u0631\\u0629 \\u0627\\u0644\\u0625\\u062e\\u0628\\u0627\\u0631\\u064a\\u0629 \\u0644\\u062f\\u064a\\u0646\\u0627 \\u0644\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0622\\u062e\\u0631 \\u0627\\u0644\\u0623\\u062e\\u0628\\u0627\\u0631 \\u0648\\u0627\\u0644\\u062a\\u062d\\u062f\\u064a\\u062b\\u0627\\u062a \\u0627\\u0644\\u062d\\u0635\\u0631\\u064a\\u0629.\",\"email_placeholder_t_\":\"\\u0623\\u062f\\u062e\\u0644 \\u0627\\u0644\\u0628\\u0631\\u064a\\u062f \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\",\"btn_text_t_\":\"\\u064a\\u0634\\u062a\\u0631\\u0643\"}'),
(15, 'sa', 269, '{\"title_t_\":\"\\u0623\\u0634\\u0631\\u0637\\u0629 \\u0641\\u064a\\u062f\\u064a\\u0648\",\"playlist_title_t_\":\"\\u0642\\u0627\\u0626\\u0645\\u0629 \\u0627\\u0644\\u062a\\u0634\\u063a\\u064a\\u0644\"}'),
(16, 'sa', 266, '{\"title_t_\":\"\\u0645\\u0648\\u0636\\u0629\"}'),
(17, 'sa', 274, '{\"title_t_\":\"\\u062a\\u0631\\u0641\\u064a\\u0647\"}'),
(18, 'sa', 271, '{\"title_t_\":\"\\u0627\\u0644\\u0627\\u062e\\u0628\\u0627\\u0631 \\u0627\\u0644\\u0645\\u0647\\u0645\\u0647\"}'),
(19, 'sa', 265, '{\"title_t_\":\"\\u0631\\u0623\\u064a \\u0627\\u0644\\u0642\\u0631\\u0627\\u0621\"}'),
(20, 'sa', 270, '{\"title_t_\":\"\\u0627\\u0644\\u062a\\u0635\\u0648\\u064a\\u062a \\u0644\\u0644\\u0628\\u0637\\u0644\"}');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--


-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` int(11) NOT NULL DEFAULT 0,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `module_id`, `guard_name`, `created_at`, `updated_at`) VALUES
(3, 'Create Role', 1, 'web', '2022-06-01 03:36:18', '2022-06-01 03:36:18'),
(4, 'Edit Role', 1, 'web', '2022-06-01 03:36:26', '2022-06-01 03:36:26'),
(5, 'Delete Role', 1, 'web', '2022-06-01 03:36:28', '2022-06-01 03:41:47'),
(10, 'Show Role', 1, 'web', '2023-01-15 00:09:02', '2023-01-15 00:41:11'),
(11, 'Create User', 2, 'web', '2023-01-15 00:09:31', '2023-01-15 00:09:31'),
(12, 'Edit User', 2, 'web', '2023-01-15 00:09:47', '2023-01-15 00:09:47'),
(13, 'Delete User', 2, 'web', '2023-01-15 00:09:55', '2023-01-15 00:09:55'),
(14, 'Show User', 2, 'web', '2023-01-15 00:10:03', '2023-01-15 00:10:03'),
(15, 'Show Permission', 3, 'web', '2023-01-15 00:41:27', '2023-01-15 00:41:35'),
(17, 'Manage Menus', 8, 'web', '2023-01-17 05:18:11', '2023-01-17 05:18:11'),
(18, 'Manage Media', 5, 'web', '2023-01-15 02:09:20', '2023-01-15 02:09:20'),
(20, 'Manage Themes', 9, 'web', '2023-01-17 05:21:51', '2023-01-17 05:21:51'),
(25, 'Create Blog', 19, 'web', '2023-01-17 22:04:30', '2023-01-17 22:04:30'),
(26, 'Show Blog', 19, 'web', '2023-01-17 22:05:43', '2023-01-17 22:05:43'),
(27, 'Edit Blog', 19, 'web', '2023-01-17 22:06:31', '2023-01-17 22:06:31'),
(28, 'Delete Blog', 19, 'web', '2023-01-17 22:06:46', '2023-01-17 22:06:46'),
(29, 'Manage Category', 20, 'web', '2023-01-17 22:07:25', '2023-01-17 22:07:25'),
(30, 'Manage Tag', 21, 'web', '2023-01-17 22:07:44', '2023-01-17 22:07:44'),
(31, 'Manage Comment', 22, 'web', '2023-01-17 22:08:21', '2023-01-17 22:08:21'),
(32, 'Create Page', 23, 'web', '2023-01-17 22:16:45', '2023-01-17 22:16:45'),
(33, 'Show Page', 23, 'web', '2023-01-17 22:17:26', '2023-01-17 22:17:26'),
(34, 'Edit Page', 23, 'web', '2023-01-17 22:17:44', '2023-01-17 22:17:44'),
(35, 'Delete Page', 23, 'web', '2023-01-17 22:18:03', '2023-01-17 22:18:03'),
(36, 'Manage Widget', 24, 'web', '2023-01-19 05:46:41', '2023-01-19 05:46:41'),
(41, 'Manage Dashboard', 28, 'web', '2023-01-25 22:53:11', '2023-01-25 22:53:11'),
(46, 'Manage General Settings', 33, 'web', '2023-01-25 23:53:23', '2023-01-25 23:53:23'),
(47, 'Manage Email Settings', 34, 'web', '2023-01-25 23:54:26', '2023-01-25 23:54:26'),
(48, 'Manage Email Templates', 35, 'web', '2023-01-25 23:55:17', '2023-01-25 23:55:17'),
(49, 'Manage Language', 36, 'web', '2023-01-25 23:56:03', '2023-01-25 23:56:03'),
(50, 'Manage Media Settings', 37, 'web', '2023-01-25 23:56:31', '2023-01-25 23:56:31'),
(51, 'Manage Seo Settings', 38, 'web', '2023-01-25 23:57:09', '2023-01-25 23:57:09'),
(72, 'Manage Login activity', 57, 'web', '2023-01-27 23:33:54', '2023-01-27 23:33:54'),
(104, 'Manage Theme General settings', 29, 'web', '2023-01-25 23:53:23', '2023-01-25 23:53:23'),
(105, 'Manage Plugins', 84, 'web', NULL, NULL),
(106, 'Manage Page Builder', 85, 'web', NULL, NULL),
(107, 'Manage Voting', 86, 'web', NULL, NULL),
(108, 'Manage Members', 87, 'web', NULL, NULL),
(109, 'Manage Ad', 88, 'web', NULL, NULL),
(110, 'Create Ad', 88, 'web', NULL, NULL),
(111, 'Delete Ad', 88, 'web', NULL, NULL),
(112, 'Edit Ad', 88, 'web', NULL, NULL),
(113, 'Show Ad', 88, 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_module`
--

CREATE TABLE `permission_module` (
  `id` int(11) NOT NULL,
  `parent_module` varchar(510) DEFAULT NULL,
  `module_name` varchar(150) DEFAULT NULL,
  `module_type` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permission_module`
--

INSERT INTO `permission_module` (`id`, `parent_module`, `module_name`, `module_type`, `location`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Users', 'Role', 'base', NULL, 20, '2023-01-15 09:41:37', '2023-01-29 04:29:56'),
(2, 'Users', 'User', 'base', NULL, 20, '2023-01-15 09:41:43', '2023-01-29 04:29:58'),
(3, 'Users', 'Permission', 'base', NULL, 20, '2023-01-15 09:41:50', '2023-01-29 04:30:00'),
(5, 'Media', 'Media', 'base', NULL, 2, '2023-01-15 09:42:20', '2023-01-29 04:24:38'),
(8, 'Appearences', 'Menus', 'base', NULL, 15, '2023-01-17 05:18:11', '2023-01-29 04:28:34'),
(9, 'Appearences', 'Themes', 'base', NULL, 15, '2023-01-17 05:21:51', '2023-01-29 04:28:37'),
(19, 'Blogs', 'Blog', 'base', NULL, 3, '2023-01-17 22:04:30', '2023-01-29 04:24:46'),
(20, 'Blogs', 'Category', 'base', NULL, 3, '2023-01-17 22:07:25', '2023-01-29 04:24:48'),
(21, 'Blogs', 'Tag', 'base', NULL, 3, '2023-01-17 22:07:44', '2023-01-29 04:24:49'),
(22, 'Blogs', 'Comment', 'base', NULL, 3, '2023-01-17 22:08:21', '2023-01-29 04:24:50'),
(23, 'Pages', 'Page', 'base', NULL, 4, '2023-01-17 22:16:45', '2023-01-29 04:24:59'),
(24, 'Theme Options', 'Widget', 'theme', 'newslooks', 16, '2023-01-19 05:46:41', '2023-11-23 08:44:42'),
(28, 'Dashboard', 'Dashboard', 'base', NULL, 1, '2023-01-25 22:53:11', '2023-01-29 04:24:07'),
(29, 'Theme Options', 'Theme General settings', 'theme', 'newslooks', 17, '2023-01-25 23:26:36', '2023-11-23 08:44:46'),
(33, 'Settings', 'General settings', 'base', NULL, 19, '2023-01-25 23:53:23', '2023-01-29 04:29:34'),
(34, 'Settings', 'Email Settings', 'base', NULL, 19, '2023-01-25 23:54:26', '2023-01-29 04:29:36'),
(35, 'Settings', 'Email Templates', 'base', NULL, 19, '2023-01-25 23:55:17', '2023-01-29 04:29:38'),
(36, 'Settings', 'Language', 'base', NULL, 19, '2023-01-25 23:56:03', '2023-01-29 04:29:40'),
(37, 'Settings', 'Media Settings', 'base', NULL, 19, '2023-01-25 23:56:31', '2023-01-29 04:29:43'),
(38, 'Settings', 'SEO Settings', 'base', NULL, 19, '2023-01-25 23:57:09', '2023-01-29 04:29:45'),
(57, 'Activity Logs', 'Login activity', 'base', NULL, 21, '2023-01-27 23:33:54', '2023-01-29 04:30:10'),
(84, 'Plugins', 'Plugins', 'base', NULL, 18, '2023-07-10 08:36:44', NULL),
(85, 'Page Builder', 'Page Builder', 'plugin', 'newslooks-pagebuilder', 5, '2023-07-10 08:43:15', '2023-11-23 08:35:00'),
(86, 'Voting', 'Voting', 'theme', 'newslooks', 18, '2023-01-25 23:26:36', '2023-11-23 08:44:46'),
(87, 'Members', 'Members', 'theme', 'newslooks', 18, '2023-01-25 23:26:36', '2023-11-23 09:33:02'),
(88, 'Ad Manager', 'Ad', 'base', NULL, 5, '2024-12-04 11:24:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reading_list`
--

CREATE TABLE `reading_list` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `blog_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reading_list`
--

INSERT INTO `reading_list` (`id`, `user_id`, `blog_id`) VALUES
(13, 8, 169),
(14, 8, 167),
(15, 8, 177),
(19, 8, 178),
(21, 11, 177),
(23, 11, 199);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2022-06-06 02:07:19', '2023-01-30 05:36:19'),
(3, 'Manager', 'web', '2023-02-13 20:42:51', '2023-02-13 20:42:51'),
(4, 'Demo Admin', 'web', '2023-02-16 21:23:22', '2023-02-16 21:23:22');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(3, 3),
(3, 4),
(4, 3),
(4, 4),
(5, 3),
(5, 4),
(10, 3),
(10, 4),
(11, 3),
(11, 4),
(12, 3),
(12, 4),
(13, 3),
(13, 4),
(14, 3),
(14, 4),
(15, 3),
(15, 4),
(17, 3),
(17, 4),
(18, 3),
(18, 4),
(20, 3),
(20, 4),
(25, 3),
(25, 4),
(26, 3),
(26, 4),
(27, 3),
(27, 4),
(28, 3),
(28, 4),
(29, 3),
(29, 4),
(30, 3),
(30, 4),
(31, 3),
(31, 4),
(32, 3),
(32, 4),
(33, 3),
(33, 4),
(34, 3),
(34, 4),
(35, 3),
(35, 4),
(36, 3),
(36, 4),
(41, 3),
(41, 4),
(46, 3),
(46, 4),
(47, 3),
(47, 4),
(48, 3),
(48, 4),
(49, 3),
(49, 4),
(50, 3),
(50, 4),
(51, 3),
(51, 4),
(72, 3),
(72, 4),
(104, 3),
(104, 4);

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `offset` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diff_from_gtm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tl_blogs`
--

CREATE TABLE `tl_blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reading_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_sticky` smallint(2) DEFAULT NULL,
  `blog_password` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` bigint(20) NOT NULL DEFAULT 0,
  `publish_at` datetime DEFAULT NULL,
  `is_featured` smallint(6) DEFAULT NULL,
  `is_publish` smallint(6) DEFAULT NULL,
  `breaking_news` int(11) NOT NULL DEFAULT 0,
  `formate` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'standard',
  `gallery_images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio_file_type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file',
  `audio_file` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_link` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tl_blogs`
--

INSERT INTO `tl_blogs` (`id`, `name`, `permalink`, `user_id`, `image`, `short_description`, `reading_time`, `content`, `visibility`, `is_sticky`, `blog_password`, `views`, `publish_at`, `is_featured`, `is_publish`, `breaking_news`, `formate`, `gallery_images`, `audio_file_type`, `audio_file`, `video_link`, `meta_title`, `meta_description`, `meta_image`, `created_at`, `updated_at`) VALUES
(157, 'UN climate talks go big on ending fossil fuels', 'un-climate-talks-go-big-on-ending-fossil-fuels', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 76, '2023-02-07 17:44:10', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'UN climate talks go big on ending fossil fuels', 'UN climate talks go big on ending fossil fuels', '1148', '2023-02-07 22:44:10', '2023-12-27 15:16:14'),
(158, 'Bologna\'s leaning tower sealed off over fears it could collapse', 'bologna-s-leaning-tower-sealed-off-over-fears-it-could-collapse', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 86, '2023-02-07 18:17:51', NULL, 1, 0, 'audio', NULL, 'file', NULL, NULL, 'Bologna\'s leaning tower sealed off over fears it could collapse', 'Bologna\'s leaning tower sealed off over fears it could collapse', '1148', '2023-02-07 23:17:51', '2023-12-28 06:18:32'),
(160, 'Japan asks US to stop flying Osprey military aircrafts after deadly crash', 'japan-asks-us-to-stop-flying-osprey-military-aircrafts-after-deadly-crash', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'password', 0, 'eyJpdiI6IjQ0YnpaN254eTFCV0I5dHRWNWI4Y1E9PSIsInZhbHVlIjoiRmEzMTV4U2lwZzc3am1QUUhrNS9MZz09IiwibWFjIjoiZWZmZDY0YzU0MGYzM2E5ZjI4YTliMGE4NTM1MTY2ZDk4YmU5NGI4ZGIzN2VlYjhjZjg0YjY1OTJlMmI1OTIyOCIsInRhZyI6IiJ9', 68, '2023-02-08 10:49:49', 1, 1, 0, 'gallery', '1094,1095,1096', 'file', NULL, NULL, 'Japan asks US to stop flying Osprey military aircrafts after deadly crash', 'Japan asks US to stop flying Osprey military aircrafts after deadly crash', '1148', '2023-02-08 15:49:49', '2023-12-15 13:12:06'),
(161, 'Birmingham Parks lauded in winning Chelsea Flower Show display', 'birmingham-parks-lauded-in-winning-chelsea-flower-show-display', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 60, '2023-02-08 11:08:56', NULL, 1, 0, 'audio', NULL, 'file', NULL, NULL, 'Birmingham Parks lauded in winning Chelsea Flower Show display', 'Birmingham Parks lauded in winning Chelsea Flower Show display', '1148', '2023-02-08 16:08:56', '2023-12-05 16:44:42'),
(162, 'Coalbrookdale museum hosts \'Fashion Through The Ages\' catwalk', 'coalbrookdale-museum-hosts--fashion-through-the-ages--catwalk', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 32, '2023-02-08 11:15:16', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Coalbrookdale museum hosts \'Fashion Through The Ages\' catwalk', 'Coalbrookdale museum hosts \'Fashion Through The Ages\' catwalk', '1148', '2023-02-08 16:15:16', '2023-12-03 15:40:13'),
(163, 'Best Places To Visit in The World', 'best-places-to-visit-in-the-world', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 114, '2023-02-08 11:57:01', NULL, 1, 1, 'standard', NULL, 'file', NULL, NULL, 'Best Places To Visit in The World', 'Best Places To Visit in The World', '1148', '2023-02-08 16:57:01', '2023-12-28 06:22:11'),
(165, 'Best Food To Buy in Online Stores.', 'best-food-to-buy-in-online-stores-', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 36, '2023-02-08 12:38:16', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Best Food To Buy in Online Stores.', 'Best Food To Buy in Online Stores.', '1148', '2023-02-08 17:38:16', '2023-12-06 14:49:02'),
(166, 'Child Cancer Brain Survivor & Later Health Researches Cancers Campaign', 'child-cancer-brain-survivor---later-health-researches-cancers-campaign', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 142, '2023-02-08 12:41:33', NULL, 1, 0, 'gallery', '1081,1079,1078', 'file', NULL, NULL, 'Child Cancer Brain Survivor & Later Health Researches Cancers Campaign', 'Child Cancer Brain Survivor & Later Health Researches Cancers Campaign', '1148', '2023-02-08 17:41:33', '2023-12-28 05:42:27'),
(167, 'Russians likely targeted Khmelnytsky nuclear plant - Zelensky', 'russians-likely-targeted-khmelnytsky-nuclear-plant-zelensky', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 39, '2023-02-08 12:45:54', 1, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Russians likely targeted Khmelnytsky nuclear plant - Zelensky', 'Russians likely targeted Khmelnytsky nuclear plant - Zelensky', '1148', '2023-02-08 17:45:54', '2023-12-12 23:03:00'),
(169, 'Philippines earthquake: Pregnant woman killed by Mindanao quake', 'philippines-earthquake-pregnant-woman-killed-by-mindanao-quake', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'password', 0, 'eyJpdiI6IiszU3hHMzZCcE5XbkRlYXFtODJNK0E9PSIsInZhbHVlIjoiaHR3T20xY1ZaQi9NOXdYd2FFN3Vpdz09IiwibWFjIjoiZTg5ZjZiOGYwOWMxNjU2M2JjY2EzNThjOTRiZWJiMDk2NDhiMTM4M2E3YTFhZjZhZjIyNzQ2MDJjNDY0ZmEzYyIsInRhZyI6IiJ9', 487, '2023-02-08 12:49:59', NULL, 1, 0, 'video', NULL, 'file', NULL, NULL, 'Philippines earthquake: Pregnant woman killed by Mindanao quake', 'Philippines earthquake: Pregnant woman killed by Mindanao quake', '1148', '2023-02-08 17:49:59', '2023-12-14 17:55:26'),
(177, 'Could X go bankrupt under Elon Musk?', 'could-x-go-bankrupt-under-elon-musk-', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 51, '2023-04-08 15:00:12', 1, 1, 1, 'audio', NULL, 'file', NULL, NULL, 'Could X go bankrupt under Elon Musk?', 'Could X go bankrupt under Elon Musk?', '1148', '2023-04-08 09:00:12', '2023-12-28 05:25:40'),
(178, 'The One Thing I Do When Fashion Come Over', 'the-one-thing-i-do-when-fashion-come-over', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 142, '2023-04-08 15:03:39', NULL, 1, 1, 'video', NULL, 'file', NULL, NULL, 'The One Thing I Do When Fashion Come Over', 'The One Thing I Do When Fashion Come Over', '1148', '2023-04-08 09:03:39', '2023-12-27 12:49:00'),
(179, 'Israel-Gaza war: Residents of Khan Younis say Israeli strikes heaviest since start of war', 'israel-gaza-war-residents-of-khan-younis-say-israeli-strikes-heaviest-since-start-of-war', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 196, '2023-04-08 15:06:20', 1, 1, 1, 'audio', NULL, 'file', NULL, NULL, 'Israel-Gaza war: Residents of Khan Younis say Israeli strikes heaviest since start of war', 'Israel-Gaza war: Residents of Khan Younis say Israeli strikes heaviest since start of war', '1148', '2023-04-08 09:06:20', '2023-12-27 18:10:34'),
(187, 'Georgia run-off election: Ready to switch off from politics?', 'georgia-run-off-election-ready-to-switch-off-from-politics-', 1, '1148', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 1, '2023-12-05 10:44:55', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Georgia run-off election: Ready to switch off from politics?', 'Georgia run-off election: Ready to switch off from politics?', '1148', '2023-12-05 10:44:55', '2023-12-05 16:18:09'),
(188, 'Welsh Politics: Plans to increase Send membership to 96 members approaching', 'welsh-politics-plans-to-increase-send-membership-to-96-members-approaching', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 4, '2023-12-05 10:48:20', NULL, 1, 0, 'video', NULL, 'file', NULL, NULL, 'Wales politics: Plans to increase Senedd to 96 members move closer', 'Wales politics: Plans to increase Senedd to 96 members move closer', '1148', '2023-12-05 10:48:20', '2023-12-24 12:46:52');
INSERT INTO `tl_blogs` (`id`, `name`, `permalink`, `user_id`, `image`, `short_description`, `reading_time`, `content`, `visibility`, `is_sticky`, `blog_password`, `views`, `publish_at`, `is_featured`, `is_publish`, `breaking_news`, `formate`, `gallery_images`, `audio_file_type`, `audio_file`, `video_link`, `meta_title`, `meta_description`, `meta_image`, `created_at`, `updated_at`) VALUES
(189, 'Portugal is focusing on post-pandemic politics ahead of the election', 'portugal-is-focusing-on-post-pandemic-politics-ahead-of-the-election', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 3, '2023-12-05 10:51:24', NULL, 1, 0, 'audio', NULL, 'file', NULL, NULL, 'Portugal focuses on post-pandemic politics ahead of poll', 'Portugal focuses on post-pandemic politics ahead of poll', '1148', '2023-12-05 10:51:24', '2023-12-24 12:45:17'),
(190, 'The number of Republicans decreased to four in the last presidential debate', 'the-number-of-republicans-decreased-to-four-in-the-last-presidential-debate', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 2, '2023-12-05 10:57:33', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Republican field shrinks to four for final presidential debate', 'Republican field shrinks to four for final presidential debate', '1148', '2023-12-05 10:57:33', '2023-12-27 18:13:20'),
(191, 'Images of child abuse are being created by artificial intelligence, a charity says', 'images-of-child-abuse-are-being-created-by-artificial-intelligence-a-charity-says', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 1, '2023-12-05 11:05:10', NULL, 1, 0, 'audio', NULL, 'file', NULL, NULL, 'Children making AI-generated child abuse images, says charity', 'Children making AI-generated child abuse images, says charity', '1148', '2023-12-05 11:05:10', '2023-12-24 12:41:35'),
(192, 'Why is the weather in games becoming more realistic?', 'why-is-the-weather-in-games-becoming-more-realistic-', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 2, '2023-12-05 11:07:45', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Why weather in games is getting more realistic', 'Why weather in games is getting more realistic', '1148', '2023-12-05 11:07:45', '2023-12-24 12:39:51'),
(193, 'Will Tesla\'s cybertruck recover from its shattering start?', 'will-tesla-s-cybertruck-recover-from-its-shattering-start-', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 1, '2023-12-05 11:11:21', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Will Tesla\'s cybertruck recover from its shattering start?', 'Will Tesla\'s cybertruck recover from its shattering start?', '1148', '2023-12-05 11:11:21', '2023-12-27 14:17:02'),
(194, 'Can New York Indie Retail make a comeback?', 'can-new-york-indie-retail-make-a-comeback-', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 0, '2023-12-05 12:36:08', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Could New York Indie Retail Make a Comeback?', 'Could New York Indie Retail Make a Comeback?', '1148', '2023-12-05 12:36:08', '2023-12-24 12:37:28'),
(195, 'Designer Karl Lagerfeld is this year\'s topic - here are his most iconic moments', 'designer-karl-lagerfeld-is-this-year-s-topic-here-are-his-most-iconic-moments', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 2, '2023-12-05 12:47:46', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Designer Karl Lagerfeld is this year\'s theme – here are his most iconic moments', 'Designer Karl Lagerfeld is this year\'s theme – here are his most iconic moments', '1148', '2023-12-05 12:47:46', '2023-12-28 05:34:54'),
(196, 'What does the \'perfect man\' look like now?', 'what-does-the--perfect-man--look-like-now-', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 1, '2023-12-05 12:50:54', NULL, 1, 0, 'video', NULL, 'file', NULL, NULL, 'What does the \'perfect man\' look like now?', 'What does the \'perfect man\' look like now?', '1148', '2023-12-05 12:50:54', '2023-12-24 12:31:54'),
(197, 'What inspired the ‘master’ of fashion?', 'what-inspired-the--master--of-fashion-', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 0, '2023-12-05 12:54:05', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'What inspired the ‘master’ of fashion?', 'What inspired the ‘master’ of fashion?', '1148', '2023-12-05 12:54:05', '2023-12-24 12:30:45'),
(198, 'Bangladesh v New Zealand: Taijul\'s 10-wicket haul helps hosts to victory', 'bangladesh-v-new-zealand-taijul-s-10-wicket-haul-helps-hosts-to-victory', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 2, '2023-12-05 14:36:57', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Bangladesh v New Zealand: Taijul\'s 10-wicket haul helps hosts to victory', 'Bangladesh v New Zealand: Taijul\'s 10-wicket haul helps hosts to victory', '1148', '2023-12-05 14:36:57', '2023-12-27 15:34:05'),
(199, 'David Warner: Why Australia\'s man of many personas can bow out an ODI great', 'david-warner-why-australia-s-man-of-many-personas-can-bow-out-an-odi-great', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 86, '2023-12-05 14:39:17', 1, 1, 0, 'video', NULL, 'file', NULL, NULL, 'David Warner: Why Australia\'s man of many personas can bow out an ODI great', 'David Warner: Why Australia\'s man of many personas can bow out an ODI great', '1148', '2023-12-05 14:39:17', '2023-12-28 05:23:51'),
(200, 'Mikel Arteta wants Arsenal & England goalkeeper to stay', 'mikel-arteta-wants-arsenal---england-goalkeeper-to-stay', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 3, '2023-12-05 14:41:15', NULL, 1, 0, 'audio', NULL, 'file', NULL, NULL, 'Mikel Arteta wants Arsenal & England goalkeeper to stay', 'Mikel Arteta wants Arsenal & England goalkeeper to stay', '1148', '2023-12-05 14:41:15', '2023-12-06 14:51:11'),
(201, 'Jonny Otto: Wolves defender unavailable following \'training ground incident\'', 'jonny-otto-wolves-defender-unavailable-following--training-ground-incident-', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 3, '2023-12-05 14:42:49', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Jonny Otto: Wolves defender unavailable following \'training ground incident\'', 'Jonny Otto: Wolves defender unavailable following \'training ground incident\'', '1148', '2023-12-05 14:42:49', '2023-12-05 16:39:20'),
(202, 'Davis Cup final 2023: Italy beat Australia to win first title for 47 years', 'davis-cup-final-2023-italy-beat-australia-to-win-first-title-for-47-years', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 0, '2023-12-05 14:44:38', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Davis Cup final 2023: Italy beat Australia to win first title for 47 years', 'Davis Cup final 2023: Italy beat Australia to win first title for 47 years', '1148', '2023-12-05 14:44:38', '2023-12-05 14:45:09'),
(203, 'Shane MacGowan: U2 and Paul Weller lead tributes to Pogues singer', 'shane-macgowan-u2-and-paul-weller-lead-tributes-to-pogues-singer', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 28, '2023-12-05 14:58:52', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Shane MacGowan: U2 and Paul Weller lead tributes to Pogues singer', 'Shane MacGowan: U2 and Paul Weller lead tributes to Pogues singer', '1148', '2023-12-05 14:58:52', '2023-12-28 06:18:47');
INSERT INTO `tl_blogs` (`id`, `name`, `permalink`, `user_id`, `image`, `short_description`, `reading_time`, `content`, `visibility`, `is_sticky`, `blog_password`, `views`, `publish_at`, `is_featured`, `is_publish`, `breaking_news`, `formate`, `gallery_images`, `audio_file_type`, `audio_file`, `video_link`, `meta_title`, `meta_description`, `meta_image`, `created_at`, `updated_at`) VALUES
(204, 'Taylor Swift is the UK\'s most-streamed artist of 2023', 'taylor-swift-is-the-uk-s-most-streamed-artist-of-2023', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 16, '2023-12-05 15:01:51', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Taylor Swift is the UK\'s most-streamed artist of 2023', 'Taylor Swift is the UK\'s most-streamed artist of 2023', '1148', '2023-12-05 15:01:51', '2023-12-27 17:36:32'),
(205, 'Wonka Timothee Chalamet Says People Didn\'t Want Him To Mess Up Role', 'wonka-timothee-chalamet-says-people-didn-t-want-him-to-mess-up-role', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 5, '2023-12-05 15:04:07', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Wonka: Timothée Chalamet says people didn\'t want him to \'mess up\' role', 'Wonka: Timothée Chalamet says people didn\'t want him to \'mess up\' role', '1148', '2023-12-05 15:04:07', '2023-12-28 05:25:20'),
(206, 'Squid Game The Challenge: Players Want Compensation Over Injuries', 'squid-game-the-challenge-players-want-compensation-over-injuries', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 5, '2023-12-05 15:07:22', NULL, 1, 0, 'audio', NULL, 'file', NULL, NULL, 'Squid Game The Challenge: Players want compensation over injuries', 'Squid Game The Challenge: Players want compensation over injuries', '1148', '2023-12-05 15:07:22', '2023-12-28 06:19:07'),
(207, 'Hunger Games: Stars hit red carpet for world premiere of latest instalment', 'hunger-games-stars-hit-red-carpet-for-world-premiere-of-latest-instalment', 1, '1148', 'She travelling accepting men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', '2 min read', '<p>\r\n        She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief\r\n        arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode\r\n        neglected. To discovered insensible collecting your unpleasant but invitation.<br></p>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much too her time. Led young gay would now state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. By an\r\n        outlived insisted procured improved am.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            The Best Neighborhoods In Nyc: Where To Stay On</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image1703744079637433839.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037440991599523967.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\"><img src=\"/public/uploaded/blog/content/blog_content_image17037441191194711707.png\" style=\"list-style: none; margin-bottom: 30px;\"><br></div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        We diminution preference thoroughly if. Joy deal pain view much her time. Led young gay would now off state.\r\n        Pronounce we attention admitting on assurance of suspicion conveying. That his west quit had met till. Say out\r\n        plate you share.</p><blockquote>\r\n            For me, running is both exercise and a metaphor. Running day after day, piling up each level I elevate\r\n            myself.<br><cite>Haruki\r\n            Murakami</cite></blockquote><p>\r\n        Acceptance middletons me if discretion boisterous into travelling an. She prosperous to continuing entreaties\r\n        companions unreserved you boisterous. Middleton sportsmen sir now cordially asking additions for. You ten\r\n        occasional saw everything but conviction. Daughter returned quitting few are day advanced branched.</p>', 'public', 0, NULL, 21, '2023-12-05 15:10:57', NULL, 1, 0, 'standard', NULL, 'file', NULL, NULL, 'Hunger Games: Stars hit red carpet for world premiere of latest instalment', 'Hunger Games: Stars hit red carpet for world premiere of latest instalment', '1148', '2023-12-05 15:10:57', '2023-12-28 06:28:08');

-- --------------------------------------------------------

--
-- Table structure for table `tl_blogs_categories`
--

CREATE TABLE `tl_blogs_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tl_blogs_categories`
--

INSERT INTO `tl_blogs_categories` (`id`, `blog_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1156, 177, 288, NULL, NULL),
(1157, 169, 289, NULL, NULL),
(1160, 167, 290, NULL, NULL),
(1161, 167, 289, NULL, NULL),
(1162, 166, 292, NULL, NULL),
(1163, 166, 291, NULL, NULL),
(1164, 165, 292, NULL, NULL),
(1165, 165, 291, NULL, NULL),
(1166, 165, 288, NULL, NULL),
(1170, 163, 292, NULL, NULL),
(1171, 163, 291, NULL, NULL),
(1172, 163, 280, NULL, NULL),
(1176, 161, 291, NULL, NULL),
(1177, 161, 279, NULL, NULL),
(1178, 178, 291, NULL, NULL),
(1179, 178, 274, NULL, NULL),
(1181, 162, 291, NULL, NULL),
(1182, 162, 274, NULL, NULL),
(1183, 157, 289, NULL, NULL),
(1184, 158, 289, NULL, NULL),
(1187, 187, 290, NULL, NULL),
(1188, 187, 289, NULL, NULL),
(1201, 198, 294, NULL, NULL),
(1202, 199, 294, NULL, NULL),
(1204, 200, 294, NULL, NULL),
(1206, 201, 294, NULL, NULL),
(1208, 202, 294, NULL, NULL),
(1209, 203, 295, NULL, NULL),
(1221, 160, 289, NULL, NULL),
(1222, 179, 289, NULL, NULL),
(1227, 204, 295, NULL, NULL),
(1228, 205, 295, NULL, NULL),
(1229, 206, 295, NULL, NULL),
(1241, 197, 274, NULL, NULL),
(1242, 196, 291, NULL, NULL),
(1243, 196, 274, NULL, NULL),
(1244, 195, 274, NULL, NULL),
(1245, 194, 274, NULL, NULL),
(1247, 193, 288, NULL, NULL),
(1248, 192, 288, NULL, NULL),
(1249, 191, 288, NULL, NULL),
(1251, 190, 290, NULL, NULL),
(1252, 189, 290, NULL, NULL),
(1253, 188, 290, NULL, NULL),
(1257, 207, 285, '2023-12-28 06:17:27', '2023-12-28 06:17:27');

-- --------------------------------------------------------

--
-- Table structure for table `tl_blogs_tags`
--

CREATE TABLE `tl_blogs_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tl_blogs_tags`
--

INSERT INTO `tl_blogs_tags` (`id`, `blog_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(228, 177, 109, NULL, NULL),
(229, 177, 107, NULL, NULL),
(230, 169, 116, NULL, NULL),
(231, 167, 120, NULL, NULL),
(232, 167, 119, NULL, NULL),
(233, 167, 118, NULL, NULL),
(234, 167, 117, NULL, NULL),
(235, 166, 124, NULL, NULL),
(236, 166, 123, NULL, NULL),
(237, 166, 122, NULL, NULL),
(238, 166, 121, NULL, NULL),
(239, 165, 125, NULL, NULL),
(240, 165, 121, NULL, NULL),
(241, 165, 104, NULL, NULL),
(242, 165, 103, NULL, NULL),
(247, 163, 127, NULL, NULL),
(248, 163, 126, NULL, NULL),
(254, 161, 124, NULL, NULL),
(255, 161, 121, NULL, NULL),
(256, 161, 105, NULL, NULL),
(261, 162, 128, NULL, NULL),
(262, 162, 127, NULL, NULL),
(263, 162, 126, NULL, NULL),
(264, 157, 127, NULL, NULL),
(265, 157, 125, NULL, NULL),
(266, 157, 117, NULL, NULL),
(267, 158, 127, NULL, NULL),
(268, 158, 121, NULL, NULL),
(269, 158, 117, NULL, NULL),
(275, 187, 127, NULL, NULL),
(276, 187, 117, NULL, NULL),
(302, 198, 132, NULL, NULL),
(303, 198, 130, NULL, NULL),
(304, 199, 133, NULL, NULL),
(305, 199, 132, NULL, NULL),
(306, 200, 133, NULL, NULL),
(307, 200, 132, NULL, NULL),
(308, 200, 131, NULL, NULL),
(309, 201, 133, NULL, NULL),
(310, 201, 132, NULL, NULL),
(311, 201, 131, NULL, NULL),
(312, 202, 133, NULL, NULL),
(313, 202, 132, NULL, NULL),
(314, 202, 131, NULL, NULL),
(315, 202, 130, NULL, NULL),
(316, 203, 135, NULL, NULL),
(317, 203, 134, NULL, NULL),
(340, 160, 127, NULL, NULL),
(341, 160, 125, NULL, NULL),
(342, 160, 121, NULL, NULL),
(343, 160, 118, NULL, NULL),
(344, 179, 106, NULL, NULL),
(355, 204, 135, NULL, NULL),
(356, 204, 134, NULL, NULL),
(357, 205, 135, NULL, NULL),
(358, 205, 134, NULL, NULL),
(359, 206, 136, NULL, NULL),
(360, 206, 135, NULL, NULL),
(361, 206, 134, NULL, NULL),
(387, 197, 128, NULL, NULL),
(388, 197, 126, NULL, NULL),
(389, 197, 110, NULL, NULL),
(390, 197, 104, NULL, NULL),
(391, 196, 128, NULL, NULL),
(392, 195, 128, NULL, NULL),
(393, 195, 126, NULL, NULL),
(394, 194, 128, NULL, NULL),
(395, 194, 127, NULL, NULL),
(396, 194, 126, NULL, NULL),
(399, 193, 127, NULL, NULL),
(400, 193, 125, NULL, NULL),
(401, 192, 129, NULL, NULL),
(402, 192, 127, NULL, NULL),
(403, 192, 125, NULL, NULL),
(404, 191, 127, NULL, NULL),
(405, 191, 125, NULL, NULL),
(406, 191, 122, NULL, NULL),
(408, 190, 117, NULL, NULL),
(409, 189, 127, NULL, NULL),
(410, 189, 125, NULL, NULL),
(411, 189, 117, NULL, NULL),
(412, 188, 125, NULL, NULL),
(413, 188, 118, NULL, NULL),
(414, 188, 117, NULL, NULL),
(421, 207, 137, NULL, NULL),
(422, 207, 134, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tl_blog_categories`
--

CREATE TABLE `tl_blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `permalink` text DEFAULT NULL,
  `parent` bigint(20) UNSIGNED DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `meta_title` varchar(50) DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `is_featured` int(3) DEFAULT NULL,
  `is_publish` int(3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_blog_categories`
--

INSERT INTO `tl_blog_categories` (`id`, `name`, `permalink`, `parent`, `banner`, `icon`, `meta_title`, `meta_image`, `meta_description`, `is_featured`, `is_publish`, `created_at`, `updated_at`) VALUES
(274, 'Fashion', 'fashion', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-02-07 22:43:59', '2023-02-07 22:43:59'),
(279, 'Flower', 'flower', NULL, NULL, NULL, 'Flower', '810', 'Flower is very nice', NULL, 1, '2023-02-08 16:10:05', '2023-08-23 04:50:27'),
(280, 'Travel', 'travel', 291, NULL, NULL, 'Travel', NULL, 'Travel', NULL, 1, '2023-02-08 16:34:16', '2023-12-03 15:46:10'),
(285, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-03-27 03:44:07', '2023-03-27 03:44:07'),
(288, 'Technology', 'technology', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-12-03 14:54:48', '2023-12-03 14:54:48'),
(289, 'World News', 'world-news', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-12-03 14:58:11', '2023-12-03 14:58:11'),
(290, 'Politics', 'politics', NULL, NULL, NULL, 'Politics', NULL, 'Politics', NULL, 1, '2023-12-03 15:00:58', '2023-12-24 14:47:16'),
(291, 'Life Style', 'life-style', NULL, NULL, NULL, 'Life Style', NULL, 'Life Style', NULL, 1, '2023-12-03 15:09:34', '2023-12-24 14:44:07'),
(292, 'Health and Foods', 'health-and-foods', NULL, NULL, NULL, 'Health and Foods', NULL, 'Health and Foods', NULL, 1, '2023-12-03 15:10:09', '2023-12-24 14:43:41'),
(293, 'Business and Finance', 'business-and-finance', NULL, NULL, NULL, 'Business and Finance', NULL, 'Business and Finance', NULL, 1, '2023-12-03 15:20:23', '2023-12-24 14:43:15'),
(294, 'Sports', 'sports', NULL, NULL, NULL, 'رياضات', NULL, 'رياضات', NULL, 1, '2023-12-03 15:20:42', '2023-12-24 14:42:51'),
(295, 'Entertainment', 'entertainment', NULL, NULL, NULL, 'Entertainment', NULL, 'Entertainment', NULL, 1, '2023-12-03 15:20:56', '2023-12-24 14:42:26');

-- --------------------------------------------------------

--
-- Table structure for table `tl_blog_category_translations`
--

CREATE TABLE `tl_blog_category_translations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lang` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tl_blog_category_translations`
--

INSERT INTO `tl_blog_category_translations` (`id`, `name`, `category_id`, `lang`, `created_at`, `updated_at`) VALUES
(2, 'موضة', 274, 'sa', '2023-02-11 20:49:33', '2023-02-11 20:49:33'),
(11, 'ورد', 279, 'sa', '2023-02-11 20:52:31', '2023-02-11 20:52:31'),
(14, 'يسافر', 280, 'sa', '2023-02-11 20:54:10', '2023-02-11 20:54:10'),
(17, 'ترفيه', 295, 'sa', '2023-12-24 14:42:05', '2023-12-24 14:42:05'),
(18, 'رياضات', 294, 'sa', '2023-12-24 14:42:43', '2023-12-24 14:42:43'),
(19, 'الأعمال التجارية والمالية', 293, 'sa', '2023-12-24 14:43:06', '2023-12-24 14:43:06'),
(20, 'الصحة والأغذية', 292, 'sa', '2023-12-24 14:43:29', '2023-12-24 14:43:29'),
(21, 'نمط الحياة', 291, 'sa', '2023-12-24 14:43:59', '2023-12-24 14:43:59'),
(22, 'سياسة', 290, 'sa', '2023-12-24 14:44:22', '2023-12-24 14:44:22'),
(23, 'اخبار العالم', 289, 'sa', '2023-12-24 14:47:34', '2023-12-24 14:47:34'),
(24, 'تكنولوجيا', 288, 'sa', '2023-12-24 14:47:45', '2023-12-24 14:47:45');

-- --------------------------------------------------------

--
-- Table structure for table `tl_blog_comments`
--

CREATE TABLE `tl_blog_comments` (
  `id` bigint(20) NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  `user_id` int(6) DEFAULT NULL,
  `user_ip_address` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(150) DEFAULT NULL,
  `user_website` varchar(255) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `status` tinyint(3) DEFAULT 2,
  `previous_status` tinyint(3) DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_blog_comments`
--

INSERT INTO `tl_blog_comments` (`id`, `blog_id`, `user_type`, `user_id`, `user_ip_address`, `user_name`, `user_email`, `user_website`, `comment`, `parent`, `status`, `previous_status`, `comment_date`, `created_at`, `updated_at`) VALUES
(5, 169, 'admin', 1, '192.0.2.2', 'Wade Wilson', 'admin@example.com', 'https://oktasker.com', 'test', NULL, 1, NULL, '2023-03-01 11:16:59', '2023-03-01 16:16:59', '2023-03-01 16:16:59'),
(6, 169, 'admin', 1, '192.0.2.3', 'Wade Wilson', 'admin@example.com', 'https://oktasker.com', 'test2', NULL, 1, NULL, '2023-03-01 11:24:37', '2023-03-01 16:24:37', '2023-03-01 16:24:37'),
(7, 169, 'admin', 1, '192.0.2.4', 'Wade Wilson', 'admin@example.com', 'https://oktasker.com', 'test 3', NULL, 1, NULL, '2023-03-01 11:30:09', '2023-03-01 16:30:09', '2023-03-01 16:30:09'),
(8, 169, 'admin', 1, '192.0.2.5', 'Wade Wilson', 'admin@example.com', 'https://oktasker.com', 'test 4', NULL, 1, NULL, '2023-03-01 11:32:22', '2023-03-01 16:32:22', '2023-03-01 16:32:22'),
(9, 169, 'admin', 1, '192.0.2.6', 'Wade Wilson', 'admin@example.com', 'https://oktasker.com', 'test 5', NULL, 1, NULL, '2023-03-01 11:35:19', '2023-03-01 16:35:19', '2023-03-01 16:35:19'),
(10, 169, 'admin', 1, '192.0.2.7', 'Wade Wilson', 'admin@example.com', 'https://oktasker.com', 'test 6', NULL, 1, NULL, '2023-03-01 11:37:05', '2023-03-01 16:37:05', '2023-03-01 16:37:05'),
(11, 169, 'admin', 1, '192.0.2.8', 'Wade Wilson', 'admin@example.com', 'https://oktasker.com', 'test 7', NULL, 1, NULL, '2023-03-01 11:48:49', '2023-03-01 16:48:49', '2023-03-01 16:48:49'),
(12, 169, 'admin', 1, '192.0.2.9', 'Wade Wilson', 'admin@example.com', 'https://oktasker.com', 'test8', NULL, 1, NULL, '2023-03-01 11:55:44', '2023-03-01 16:55:44', '2023-03-01 16:55:44'),
(13, 169, 'admin', 1, '192.0.2.10', 'Wade Wilson', 'admin@example.com', 'https://oktasker.com', 'test9', NULL, 1, NULL, '2023-03-01 11:57:38', '2023-03-01 16:57:38', '2023-03-01 16:57:38'),
(14, 169, 'admin', 1, '192.0.2.11', 'Wade Wilson', 'admin@example.com', 'https://oktasker.com', 'test 9', NULL, 1, NULL, '2023-03-01 12:03:11', '2023-03-01 17:03:11', '2023-03-01 17:03:11'),
(15, 169, 'admin', 1, '192.0.2.12', 'Wade Wilson', 'admin@example.com', 'https://oktasker.com', 'test 10', NULL, 1, NULL, '2023-03-01 12:05:06', '2023-03-01 17:05:06', '2023-03-01 17:05:06'),
(16, 169, 'admin', 1, '192.0.2.13', 'Wade Wilson', 'admin@example.com', 'https://oktasker.com', 'test 9', NULL, 1, NULL, '2023-03-01 12:21:49', '2023-03-01 17:21:49', '2023-03-01 17:21:49'),
(54, 169, 'user', 8, '192.0.2.14', 'Habib', 'Habib', 'Habib', 'New Comments', NULL, 4, NULL, '2023-11-14 16:44:24', '2023-11-14 10:44:24', '2023-11-14 10:44:24'),
(55, 169, 'user', 8, '192.0.2.15', 'Habib', 'Habib', 'Habib', 'Again Comment', NULL, 1, NULL, '2023-11-14 16:47:32', '2023-11-14 10:47:32', '2023-11-14 10:47:32'),
(56, 169, 'anonymous', NULL, '192.0.2.16', 'Anonymous', '', '', 'New Comments From Anomoly', NULL, 1, NULL, '2023-11-14 17:45:07', '2023-11-14 11:45:07', '2023-11-14 11:45:07'),
(57, 169, 'admin', 1, '192.0.2.17', 'Wade Wilson', 'Wade Wilson', 'Wade Wilson', 'Hello Email', NULL, 1, NULL, '2023-11-14 18:00:16', '2023-11-14 12:00:16', '2023-11-14 12:00:16'),
(58, 158, 'user', 8, '192.0.2.18', 'Habib', 'Habib', 'Habib', 'Hello Comments', NULL, 3, NULL, '2023-11-15 10:46:56', '2023-11-15 04:46:56', '2023-11-15 04:46:56'),
(59, 160, 'user', 8, '192.0.2.19', 'Habib', 'Habib', 'Habib', 'New Comments 2 \r\nFor a slightly more opinionated version of the video reviews above half of the Island worlds designed to power up everything', NULL, 1, NULL, '2023-11-15 10:47:21', '2023-11-15 04:47:21', '2023-11-15 04:47:21'),
(60, 162, 'user', 8, '192.0.2.20', 'Habib', 'Habib', 'Habib', 'She travelling acceptance men unpleasant her especially to entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many in ham high seen this. Few preferred continual led incommode neglected. To discovered insensible collecting your unpleasant but invitation.', NULL, 2, NULL, '2023-11-15 10:47:37', '2023-11-15 04:47:37', '2023-11-15 04:47:37'),
(61, 169, 'user', 8, '192.0.2.21', 'Habib', 'Habib', 'Habib', 'Nice Comment', 57, 1, NULL, '2023-11-15 11:11:18', '2023-11-15 05:11:18', '2023-11-15 05:11:18'),
(62, 169, 'user', 8, '192.0.2.22', 'Habib', 'Habib', 'Habib', ' Nice Comment 2', 57, 2, NULL, '2023-11-15 11:11:18', '2023-11-15 05:11:18', '2023-11-15 05:11:18'),
(63, 169, 'admin', 1, '192.0.2.23', 'Wade Wilson', 'admin@example.com', '', 'New Testing', NULL, 1, NULL, '2023-03-01 11:32:22', '2023-03-01 16:32:22', '2023-03-01 16:32:22'),
(64, 160, 'user', 8, '192.0.2.24', 'Habib', 'Habib', 'Habib', 'New Guys', NULL, 1, NULL, '2023-11-15 15:41:32', '2023-11-15 09:41:32', '2023-11-15 09:41:32'),
(65, 160, 'user', 8, '192.0.2.25', 'Habib', 'Habib', 'Habib', 'hii', NULL, 1, NULL, '2023-11-15 15:42:15', '2023-11-15 09:42:15', '2023-11-15 09:42:15'),
(66, 169, 'user', 8, '192.0.2.26', 'Habib', 'Habib', 'Habib', 'Woprking', NULL, 1, NULL, '2023-11-15 15:45:41', '2023-11-15 09:45:41', '2023-11-15 09:45:41'),
(67, 160, 'user', 8, '192.0.2.27', 'Habib', 'Habib', 'Habib', 'Nice blog', NULL, 1, NULL, '2023-11-15 15:46:59', '2023-11-15 09:46:59', '2023-11-15 09:46:59'),
(68, 177, 'user', 11, '192.0.2.28', 'Rohan', 'Rohan', 'Rohan', 'Nice Blog ANIKI', NULL, 1, NULL, '2023-11-18 10:26:20', '2023-11-18 04:26:20', '2023-11-18 04:26:20'),
(69, 179, 'anonymous', NULL, '192.0.2.29', 'Anonymous', '', '', 'Nice blog', NULL, 1, NULL, '2023-12-02 17:21:40', '2023-12-02 17:21:40', '2023-12-02 17:21:40'),
(70, 199, 'user', 11, '192.0.2.30', 'Rohan', 'rohan@example.test', 'https://newslooks.themelooks.us', 'Nice Article Brother', NULL, 1, NULL, '2023-12-11 11:11:18', '2023-12-11 11:11:18', '2023-12-11 11:14:22'),
(71, 199, 'admin', 1, '192.0.2.31', 'Wade Wilson', 'admin@example.com', 'https://newslooks.themelooks.us', 'Thank You', 70, 1, NULL, '2023-12-11 11:14:37', '2023-12-11 11:14:37', '2023-12-11 11:14:37');

-- --------------------------------------------------------

--
-- Table structure for table `tl_blog_tags`
--

CREATE TABLE `tl_blog_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `permalink` text DEFAULT NULL,
  `meta_title` varchar(50) DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `is_publish` int(3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_blog_tags`
--

INSERT INTO `tl_blog_tags` (`id`, `name`, `permalink`, `meta_title`, `meta_image`, `meta_description`, `is_publish`, `created_at`, `updated_at`) VALUES
(103, 'food', 'food', NULL, NULL, NULL, 1, '2023-02-08 21:25:44', '2023-02-08 21:25:44'),
(104, 'online stores', 'online-stores', NULL, NULL, NULL, 1, '2023-02-08 21:25:52', '2023-02-08 21:25:52'),
(105, 'flower', 'flower', 'flower', '908', 'flower', 1, '2023-02-08 21:30:21', '2023-04-03 08:22:19'),
(106, 'vegetables', 'vegetables', NULL, NULL, NULL, 1, '2023-02-08 21:31:11', '2023-02-08 21:31:11'),
(107, 'google', 'google', 'google', '1084', 'google', 1, '2023-02-08 21:32:03', '2023-11-27 04:57:06'),
(108, 'e-commerce', 'e-commerce', NULL, NULL, NULL, 1, '2023-02-08 21:32:26', '2023-02-08 21:32:26'),
(109, 'youtube', 'youtube', NULL, NULL, NULL, 1, '2023-02-08 21:32:34', '2023-02-08 21:32:34'),
(110, 't-shirt', 't-shirt', NULL, NULL, NULL, 1, '2023-02-08 21:33:06', '2023-03-27 22:15:31'),
(116, 'earthquake', 'earthquake', '', NULL, '', 1, '2023-12-03 14:57:35', '2023-12-24 15:44:15'),
(117, 'politics', 'politics', NULL, NULL, NULL, 1, '2023-12-03 15:01:31', '2023-12-03 15:01:31'),
(118, 'war', 'war', NULL, NULL, NULL, 1, '2023-12-03 15:01:35', '2023-12-03 15:01:35'),
(119, 'russia', 'russia', NULL, NULL, NULL, 1, '2023-12-03 15:02:22', '2023-12-03 15:02:22'),
(120, 'ukrain', 'ukrain', NULL, NULL, NULL, 1, '2023-12-03 15:02:36', '2023-12-03 15:02:36'),
(121, 'health', 'health', NULL, NULL, NULL, 1, '2023-12-03 15:08:44', '2023-12-03 15:08:44'),
(122, 'child', 'child', NULL, NULL, NULL, 1, '2023-12-03 15:08:49', '2023-12-03 15:08:49'),
(123, 'cancers', 'cancers', NULL, NULL, NULL, 1, '2023-12-03 15:08:56', '2023-12-03 15:08:56'),
(124, 'foods', 'foods', NULL, NULL, NULL, 1, '2023-12-03 15:09:05', '2023-12-03 15:09:05'),
(125, 'technology', 'technology', NULL, NULL, NULL, 1, '2023-12-03 15:12:35', '2023-12-03 15:12:35'),
(126, 'life style', 'life-style', NULL, NULL, NULL, 1, '2023-12-03 15:14:50', '2023-12-03 15:14:50'),
(127, 'world', 'world', NULL, NULL, NULL, 1, '2023-12-03 15:14:57', '2023-12-03 15:14:57'),
(128, 'fashion', 'fashion', '', NULL, '', 1, '2023-12-03 15:40:08', '2023-12-24 14:55:08'),
(129, 'gaming', 'gaming', '', NULL, '', 1, '2023-12-05 11:06:55', '2023-12-24 14:54:43'),
(130, 'cricket', 'cricket', NULL, NULL, NULL, 1, '2023-12-05 14:36:17', '2023-12-05 14:36:17'),
(131, 'Football', 'football', '', NULL, '', 1, '2023-12-05 14:36:23', '2023-12-24 14:53:18'),
(132, 'sports', 'sports', NULL, NULL, NULL, 1, '2023-12-05 14:36:27', '2023-12-05 14:36:27'),
(133, 'Athletics', 'athletics', '', NULL, '', 1, '2023-12-05 14:39:05', '2023-12-24 14:52:41'),
(134, 'entertainment', 'entertainment', '', NULL, '', 1, '2023-12-05 14:57:31', '2023-12-24 15:37:55'),
(135, 'music', 'music', '', NULL, '', 1, '2023-12-05 14:57:35', '2023-12-24 14:52:04'),
(136, 'series', 'series', '', NULL, '', 1, '2023-12-05 15:06:19', '2023-12-24 14:50:13'),
(137, 'movie', 'movie', NULL, NULL, NULL, 1, '2023-12-05 15:10:48', '2023-12-05 15:10:48');

-- --------------------------------------------------------

--
-- Table structure for table `tl_blog_tag_translations`
--

CREATE TABLE `tl_blog_tag_translations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lang` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tl_blog_tag_translations`
--

INSERT INTO `tl_blog_tag_translations` (`id`, `name`, `tag_id`, `lang`, `created_at`, `updated_at`) VALUES
(14, 'طعام', 103, 'sa', '2023-02-11 21:07:31', '2023-02-11 21:07:31'),
(15, 'محلات نشطة', 104, 'sa', '2023-02-11 21:07:42', '2023-02-11 21:07:45'),
(18, 'ورد', 105, 'sa', '2023-02-11 21:08:47', '2023-02-11 21:08:47'),
(19, 'خضروات', 106, 'sa', '2023-02-11 21:09:07', '2023-02-11 21:09:07'),
(22, 'جوجل', 107, 'sa', '2023-02-11 21:09:40', '2023-02-11 21:09:40'),
(23, 'التجارة الإلكترونية', 108, 'sa', '2023-02-11 21:09:53', '2023-02-11 21:09:53'),
(25, 'ইউটিউব', 109, 'bd', '2023-02-11 21:10:14', '2023-02-11 21:10:14'),
(26, 'موقع', 109, 'sa', '2023-02-11 21:10:28', '2023-02-11 21:10:28'),
(27, 'تي شيرت', 110, 'sa', '2023-02-11 21:10:40', '2023-02-11 21:10:40'),
(29, 'فيلم', 137, 'sa', '2023-12-24 14:49:18', '2023-12-24 14:49:18'),
(30, 'مسلسل', 136, 'sa', '2023-12-24 14:50:30', '2023-12-24 14:50:30'),
(31, 'موسيقى', 135, 'sa', '2023-12-24 14:52:19', '2023-12-24 14:52:19'),
(32, 'ألعاب القوى', 133, 'sa', '2023-12-24 14:52:25', '2023-12-24 14:52:25'),
(33, 'كرة القدم', 131, 'sa', '2023-12-24 14:52:58', '2023-12-24 14:52:58'),
(34, 'رياضات', 132, 'sa', '2023-12-24 14:53:35', '2023-12-24 14:53:35'),
(35, 'كريكيت', 130, 'sa', '2023-12-24 14:54:06', '2023-12-24 14:54:06'),
(36, 'الألعاب', 129, 'sa', '2023-12-24 14:54:32', '2023-12-24 14:54:32'),
(37, 'موضة', 128, 'sa', '2023-12-24 14:55:24', '2023-12-24 14:55:24'),
(38, 'ترفيه', 134, 'sa', '2023-12-24 15:37:38', '2023-12-24 15:37:38'),
(39, 'عالم', 127, 'sa', '2023-12-24 15:40:04', '2023-12-24 15:40:04'),
(40, 'نمط الحياة', 126, 'sa', '2023-12-24 15:40:15', '2023-12-24 15:40:15'),
(41, 'تكنولوجيا', 125, 'sa', '2023-12-24 15:40:27', '2023-12-24 15:40:27'),
(42, 'الأطعمة', 124, 'sa', '2023-12-24 15:40:39', '2023-12-24 15:40:39'),
(43, 'السرطان', 123, 'sa', '2023-12-24 15:41:03', '2023-12-24 15:41:03'),
(44, 'طفل', 122, 'sa', '2023-12-24 15:41:16', '2023-12-24 15:41:16'),
(45, 'صحة', 121, 'sa', '2023-12-24 15:41:28', '2023-12-24 15:41:28'),
(46, 'أوكرانيا', 120, 'sa', '2023-12-24 15:41:49', '2023-12-24 15:41:49'),
(47, 'روسيا', 119, 'sa', '2023-12-24 15:42:01', '2023-12-24 15:42:01'),
(48, 'حرب', 118, 'sa', '2023-12-24 15:42:11', '2023-12-24 15:42:11'),
(49, 'سياسة', 117, 'sa', '2023-12-24 15:43:55', '2023-12-24 15:43:55'),
(50, 'هزة أرضية', 116, 'sa', '2023-12-24 15:44:24', '2023-12-24 15:44:24');

-- --------------------------------------------------------

--
-- Table structure for table `tl_blog_translations`
--

CREATE TABLE `tl_blog_translations` (
  `id` bigint(20) NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(150) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_blog_translations`
--

INSERT INTO `tl_blog_translations` (`id`, `blog_id`, `lang`, `name`, `short_description`, `content`, `created_at`, `updated_at`) VALUES
(2, 157, 'sa', 'القمصان التي يحتاجها كل رجل في خزانة ملابسه', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-02-11 20:07:08', '2023-12-24 14:37:36'),
(3, 158, 'sa', 'يوتيوب للتجارة الإلكترونية', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-02-11 20:09:11', '2023-12-24 14:37:56'),
(6, 160, 'sa', 'اليابان تطلب من الولايات المتحدة وقف تحليق طائرات عسكرية من طراز أوسبري بعد تحطمها المميت', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-02-11 20:11:43', '2023-12-24 14:38:22'),
(7, 161, 'sa', 'إغلاق برج بولونيا المائل خوفا من انهياره', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-02-11 20:12:20', '2023-12-24 14:38:44'),
(10, 162, 'sa', 'يستضيف متحف كولبروكديل منصة عرض \"الموضة عبر العصور\".', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-02-11 20:14:09', '2023-12-24 13:01:28'),
(11, 163, 'sa', 'أفضل الأماكن للزيارة في العالم', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-02-11 20:14:43', '2023-12-24 12:59:43'),
(14, 165, 'sa', 'أفضل طعام للشراء في المتاجر عبر الإنترنت.', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-02-11 20:18:09', '2023-12-24 12:59:07'),
(15, 166, 'sa', 'حملة سرطان الأطفال والناجين من سرطان الدماغ والأبحاث الصحية اللاحقة حول السرطان', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-02-11 20:25:34', '2023-12-24 12:57:13'),
(17, 167, 'sa', 'من المرجح أن الروس استهدفوا محطة خميلنيتسكي النووية – زيلينسكي', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-02-11 20:39:59', '2023-12-24 12:56:17'),
(21, 169, 'sa', 'زلزال الفلبين: مقتل امرأة حامل بسبب زلزال مينداناو', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-02-11 20:47:04', '2023-12-24 12:55:49'),
(24, 177, 'sa', 'شيء مضحك يحدث في العلاقات', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-04-08 09:01:48', '2023-12-24 12:55:22'),
(26, 178, 'sa', 'الشيء الوحيد الذي أفعله عندما تأتي الموضة', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-04-08 09:05:06', '2023-12-24 12:55:00'),
(28, 179, 'sa', 'الحرب بين إسرائيل وغزة: سكان خان يونس يقولون إن الضربات الإسرائيلية هي الأعنف منذ بداية الحرب', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-04-08 09:07:23', '2023-12-24 12:53:33'),
(29, 207, 'sa', 'العاب الجوع النجوم يصلون إلى السجادة الحمراء للعرض العالمي الأول لأحدث أقساطهم', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 11:54:49', '2023-12-24 11:54:49'),
(30, 198, 'sa', 'بنجلاديش ضد نيوزيلندا: مسافة تايجول ذات 10 ويكيت تساعد المضيفين على تحقيق النصر', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:18:03', '2023-12-24 12:18:03'),
(31, 199, 'sa', 'ديفيد وارنر: لماذا يمكن للرجل الأسترالي من العديد من الشخصيات أن يخرج من مباراة ODI الرائعة', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:18:22', '2023-12-24 12:18:22'),
(32, 200, 'sa', 'يريد ميكيل أرتيتا بقاء حارس مرمى أرسنال وإنجلترا', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:18:39', '2023-12-24 12:18:39');
INSERT INTO `tl_blog_translations` (`id`, `blog_id`, `lang`, `name`, `short_description`, `content`, `created_at`, `updated_at`) VALUES
(33, 201, 'sa', 'جوني أوتو: مدافع وولفرهامبتون غير متوفر بعد \"حادثة أرض التدريب\"', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:18:56', '2023-12-24 12:18:56'),
(34, 202, 'sa', 'نهائي كأس ديفيز 2023: إيطاليا تهزم أستراليا لتفوز بأول لقب لها منذ 47 عامًا', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:19:11', '2023-12-24 12:19:11'),
(35, 203, 'sa', 'شين ماكجوان: U2 وبول ويلر يشيدان بمغني Pogues', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:19:25', '2023-12-24 12:19:25'),
(36, 204, 'sa', 'تايلور سويفت هي الفنانة الأكثر بثًا في المملكة المتحدة لعام 2023', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:19:41', '2023-12-24 12:19:41'),
(37, 205, 'sa', 'يقول ونكا تيموثي شالاميت إن الناس لا يريدون منه أن يفسد الدور', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:19:57', '2023-12-24 12:19:57'),
(38, 206, 'sa', 'لعبة الحبار التحدي: اللاعبون يريدون التعويض عن الإصابات', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:20:12', '2023-12-24 12:20:12'),
(39, 197, 'sa', 'ما الذي ألهم \"سيد\" الموضة؟', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:29:48', '2023-12-24 12:29:48'),
(40, 196, 'sa', 'كيف يبدو \"الرجل المثالي\" الآن؟', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:31:01', '2023-12-24 12:31:01'),
(41, 195, 'sa', 'المصمم كارل لاغرفيلد هو موضوع هذا العام - إليكم لحظاته الأكثر شهرة', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:32:11', '2023-12-24 12:32:11'),
(42, 194, 'sa', 'هل يمكن لشركة New York Indie Retail أن تعود من جديد؟', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:36:34', '2023-12-24 12:36:34'),
(43, 193, 'sa', 'هل ستتعافى شاحنة تسلا الإلكترونية من بدايتها المحطمة؟', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:38:01', '2023-12-24 12:38:01'),
(44, 192, 'sa', 'لماذا أصبح الطقس في الألعاب أكثر واقعية؟', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:39:12', '2023-12-24 12:39:12'),
(45, 191, 'sa', 'تقول مؤسسة خيرية إن صور إساءة معاملة الأطفال يتم إنشاؤها بواسطة الذكاء الاصطناعي', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:40:59', '2023-12-24 12:40:59'),
(46, 190, 'sa', 'وانخفض عدد الجمهوريين إلى أربعة في المناظرة الرئاسية الأخيرة', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:42:11', '2023-12-24 12:42:11'),
(47, 189, 'sa', 'تركز البرتغال على سياسات ما بعد الوباء قبل الانتخابات', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:44:37', '2023-12-24 12:44:37'),
(48, 188, 'sa', 'سياسة ويلز: خطط زيادة عدد أعضاء Senedd إلى 96 عضوًا تقترب', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:45:52', '2023-12-24 12:45:52'),
(49, 187, 'sa', 'انتخابات الإعادة في جورجيا: هل أنت مستعد للابتعاد عن السياسة؟', 'إنها تسافر وتقبل الرجال غير السارين لها وخاصة قانون التوسلات. القانون للأمام ولكن نهاية أي نشأ رئيس نشأ. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. قليل من الناس يفضلون إهمال المساكن المستمرة التي يتم إهمالها. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.', '<p>\r\n        إنها تسافر بقبول الرجال غير سارة لها خاصة بالنسبة لقانون التوسلات. القانون للأمام ولكن نهاية أي تنشأ رئيس\r\n        نشأت. قديمها يقول تعلم هذه كبيرة. فرحة مولعة بالكثيرين في هام هاي رأوا هذا. عدد قليل من الناس يفضلون القيادة المستمرة في المنزل\r\n        مهمل. لاكتشاف غير معقول جمع دعوتك غير سارة ولكن.<br></p>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. فرحة التعامل مع الألم عرض الكثير من وقتها. سيصرح الآن بقيادة شاب مثلي الجنس.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. بواسطة\r\n        أصر عاشت على شراء تحسين صباحا.\r\n    </p>\r\n\r\n    <div>\r\n        <h3>\r\n            أفضل الأحياء في مدينة نيويورك: أين تقيم</h3>\r\n        <div class=\"row\" style=\"list-style: none;\">\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849227743775408.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-6\" style=\"list-style: none; width: 380px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image1675849244526219432.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n            <div class=\"col-md-12\" style=\"list-style: none; width: 760px;\">\r\n                <img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image16758502992121276318.jpg\" alt=\"\" class=\"img-fluid\" style=\"list-style: none; margin-bottom: 30px;\">\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p>\r\n        نحن نقلل من التفضيل تمامًا إذا. متعة التعامل مع الألم عرض الكثير من وقتها. بقيادة شاب مثلي الجنس سيكون الآن خارج الولاية.\r\n        نطق اهتمامنا بالاعتراف بتأكيد نقل الشك. أن استقالته الغربية قد اجتمعت حتى. نقول بصوت\r\n        لوحة تشاركها.</p><blockquote>\r\n            بالنسبة لي، الجري هو تمرين واستعارة في نفس الوقت. أركض يومًا بعد يوم، وأتراكم في كل مستوى أرفعه\r\n            نفسي.<br><cite>هاروكي موراكامي</cite></blockquote><p>\r\n        القبول ميدلتون لي إذا كانت السلطة التقديرية صاخبة في السفر. لقد نجحت في التوسلات المستمرة\r\n        الصحابة دون تحفظ لك صاخبة. رياضيو ميدلتون يطلبون الآن بكل ود إضافات. أنت عشرة\r\n        في بعض الأحيان رأى كل شيء ما عدا الإدانة. عادت ابنة الإقلاع عن التدخين قليلة وهي متقدمة في اليوم المتفرعة.</p>', '2023-12-24 12:51:29', '2023-12-24 12:51:29');

-- --------------------------------------------------------

--
-- Table structure for table `tl_email_templates`
--

CREATE TABLE `tl_email_templates` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `details` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `module_name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_email_templates`
--

INSERT INTO `tl_email_templates` (`id`, `name`, `details`, `created_at`, `updated_at`, `module_name`) VALUES
(1, 'Blog Comment', 'Blog Comment Email Template', '2022-05-19 04:58:29', '2023-01-03 04:02:48', 'admin_panel'),
(2, 'Reset Admin Password', 'Reset Admin Password Email Template', '2022-12-28 11:02:22', '2023-04-05 04:09:50', 'admin_panel');

-- --------------------------------------------------------

--
-- Table structure for table `tl_email_template_properties`
--

CREATE TABLE `tl_email_template_properties` (
  `id` int(11) NOT NULL,
  `email_type` int(11) NOT NULL DEFAULT 0,
  `subject` text NOT NULL,
  `body` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_email_template_properties`
--

INSERT INTO `tl_email_template_properties` (`id`, `email_type`, `subject`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 'Blog Comment', '<table style=\"@import url(https://fonts.googleapis.com/css?family=Rubik:300,400,500,700|Open+Sans:300,400,600,700); font-family: \'Open Sans\', sans-serif;\" bgcolor=\"#f2f3f8\" width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\">\n        <tbody><tr>\n            <td>\n   <table cellspacing=\"0\" cellpadding=\"0\" align=\"center\" border=\"0\" width=\"95%\" style=\"background-color: #f2f3f8; max-width:670px;  margin:0 auto;\">\n                    <tbody><tr>\n                        <td style=\"height:80px;\"> </td>\n                    </tr>\n                    <tr>\n                        <td style=\"text-align:center;background-color:#0a0818;padding:20px;width:95%\">\n                            <a title=\"logo\" href=\"_site_link_\">\n                            <img alt=\"logo\" title=\"logo\" src=\"_system_logo_url_\" width=\"180\">\n                          </a>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                            <table width=\"100%\" style=\"max-width:670px;background:#fff; border-radius:3px; text-align:center;-webkit-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);-moz-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);box-shadow:0 6px 18px 0 rgba(0,0,0,.06);\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" border=\"0\">\n                                <tbody><tr>\n                                    <td style=\"height:40px;\"> </td>\n                                </tr>\n                                <tr>\n                                    <td style=\"padding:0 35px;\">\n                                        <h1 style=\"color:#1e1e2d; font-weight:500; margin:0;font-size:25px;font-family:\'Rubik\',sans-serif; text-align: center;\">_comment_status_</h1>\n                                        <span style=\"display:inline-block; vertical-align:middle; margin:29px 0 26px; border-bottom:1px solid #cecece; width:100px;\"></span>\n                                        <p style=\"color:#455056; font-size:15px;line-height:24px; margin:0; text-align: center;\">\n                                            A new Comment post on <a style=\"color:#455056; text-decoration:none !important;\" href=\"_blog_link_\">\n                          <strong>_blog_name_ </strong>\n                        </a> by <strong>_author_name_ </strong>\n                                        </p>\n                                        <p style=\"color:#455056; font-size:15px;font-style:italic; line-height:24px; margin:10px 0px;text-align: center;\"> “_main_comment_” </p>\n                                        <a style=\"background:#f6492c;text-decoration:none !important; font-weight:500; margin-top:35px; color:#fff;text-transform:uppercase; font-size:14px;padding:10px 24px;display:inline-block;border-radius:5px;\" href=\"_comment_link_\">\n                                        View Comment\n                                        </a>\n                                    </td>\n                                </tr>\n                                <tr>\n                                    <td style=\"height:40px;\"> </td>\n                                </tr>\n                            </tbody></table>\n                        </td>\n                         \n                            </tr><tr>\n                                <td style=\"text-align: center;text-align:center;background-color:#0a0818;padding:18px;width:95%\">\n                                    <a style=\"line-height:18px; margin:0 0 0; text-align: center;color:#dbe5eb; text-decoration:none !important;font-size:14px\" href=\"_site_link_\"> \n                                    _footer_text_\n                                     </a>\n                                </td>\n                            </tr>\n                         \n                        <tr>\n                            <td style=\"height:80px;\"> </td>\n                        </tr>\n                </tbody></table>\n            </td>\n            </tr>\n    </tbody></table>', '2022-12-28 11:04:02', '2023-12-14 17:43:37'),
(2, 2, 'Reset Admin Password', '<table style=\"@import url(https://fonts.googleapis.com/css?family=Rubik:300,400,500,700|Open+Sans:300,400,600,700); font-family: \'Open Sans\', sans-serif;\" bgcolor=\"#f2f3f8\" width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\">\n        <tbody><tr>\n            <td>\n   <table cellspacing=\"0\" cellpadding=\"0\" align=\"center\" border=\"0\" width=\"95%\" style=\"background-color: #f2f3f8; max-width:670px;  margin:0 auto;\">\n                    <tbody><tr>\n                        <td style=\"height:80px;\"> </td>\n                    </tr>\n                    <tr>\n                        <td style=\"text-align:center;background-color:#0a0818;padding:10px;width:95%\">\n                            <a title=\"logo\" href=\"_site_link_\">\n                            <img alt=\"logo\" title=\"logo\" src=\"_system_logo_url_\" width=\"180\">\n                          </a>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td>\n                            <table style=\"max-width:670px;background:#fff; border-radius:3px; text-align:center;-webkit-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);-moz-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);box-shadow:0 6px 18px 0 rgba(0,0,0,.06);\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" border=\"0\">\n                                <tbody><tr>\n                                    <td style=\"height:40px;\"> </td>\n                                </tr>\n                                <tr>\n                                    <td style=\"padding:0 35px;\">\n                                        <h1 style=\"color:#1e1e2d; font-weight:500; margin:0;font-size:25px;font-family:\'Rubik\',sans-serif;\">You have requested to reset your password</h1>\n                                        <span style=\"display:inline-block; vertical-align:middle; margin:29px 0 26px; border-bottom:1px solid #cecece; width:100px;\"></span>\n                                        <p style=\"color:#455056; font-size:15px;line-height:24px; margin:0;\">\n                                          We cannot simply send you your old password. A unique link to reset your password has been generated for you. To reset your password, click the following link and follow the instructions. \n                                        </p>\n                                        <a style=\"background:#f64a29;text-decoration:none !important; font-weight:500; margin-top:35px; color:#fff;text-transform:uppercase; font-size:14px;padding:10px 24px;display:inline-block;border-radius:5px;\" href=\"_reset_password_link_\">\n                                        Reset Password\n                                        </a>\n                                    </td>\n                                </tr>\n                                <tr>\n                                    <td style=\"height:40px;\"> </td>\n                                </tr>\n                            </tbody></table>\n                        </td>\n                         \n                            </tr><tr>\n                                <td style=\"text-align: center;text-align:center;background-color:#0a0818;padding:18px;width:95%\">\n                                    <a style=\"line-height:18px; margin:0 0 0; text-align: center;color:#dbe5eb; text-decoration:none !important;font-size:14px\" href=\"_site_link_\"> \n                                    _footer_text_\n                                     </a>\n                                </td>\n                            </tr>\n                         \n                        <tr>\n                            <td style=\"height:80px;\"> </td>\n                        </tr>\n                </tbody></table>\n            </td>\n            </tr>\n    </tbody></table>', '2023-01-02 04:11:38', '2023-12-14 17:44:40');

-- --------------------------------------------------------

--
-- Table structure for table `tl_email_template_variable`
--

CREATE TABLE `tl_email_template_variable` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `details` varchar(150) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_email_template_variable`
--

INSERT INTO `tl_email_template_variable` (`id`, `name`, `details`, `template_id`, `created_at`, `updated_at`) VALUES
(1, '_reset_password_link_', 'Reset Password Link', 2, '2023-01-02 06:26:04', '2023-01-02 06:26:04'),
(3, '_blog_link_', 'Blog link', 1, '2023-01-02 06:35:54', '2023-01-02 06:35:54'),
(4, '_blog_name_', 'Blog name', 1, '2023-01-02 06:35:59', '2023-01-02 06:35:59'),
(5, '_comment_status_', 'Comment status', 1, '2023-01-02 06:36:04', '2023-01-02 06:36:04'),
(6, '_author_name_', 'Author Name', 1, '2023-01-02 06:36:10', '2023-01-02 06:36:10'),
(7, '_main_comment_', 'Main content', 1, '2023-01-02 06:36:14', '2023-01-02 06:36:14'),
(9, '_comment_link_', 'Comment Link', 1, '2023-01-02 06:36:23', '2023-01-02 06:36:23');

-- --------------------------------------------------------

--
-- Table structure for table `tl_general_settings`
--

CREATE TABLE `tl_general_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_general_settings`
--

INSERT INTO `tl_general_settings` (`id`, `name`, `created_at`, `updated_at`) VALUES
(274, 'placeholder_image', '2023-01-24 22:50:54', '2023-01-24 22:50:54'),
(275, 'maximum_chunk_size', '2023-01-24 22:50:54', '2023-01-24 22:50:54'),
(276, 'site_title', '2023-01-24 22:50:57', '2023-01-24 22:50:57'),
(277, 'site_meta_title', '2023-01-24 22:50:57', '2023-01-24 22:50:57'),
(278, 'site_meta_description', '2023-01-24 22:50:57', '2023-01-24 22:50:57'),
(279, 'site_meta_keywords', '2023-01-24 22:50:57', '2023-01-24 22:50:57'),
(280, 'site_meta_image', '2023-01-24 22:50:57', '2023-01-24 22:50:57'),
(281, 'default_language', '2023-01-24 22:50:57', '2023-01-24 22:50:57'),
(282, 'system_name', '2023-01-24 22:51:24', '2023-01-24 22:51:24'),
(286, 'default_timezone', '2023-01-24 22:51:24', '2023-01-24 22:51:24'),
(287, 'date_format', '2023-01-24 22:51:24', '2023-01-24 22:51:24'),
(288, 'decimal_number_limit', '2023-01-24 22:51:24', '2023-01-24 22:51:24'),
(291, 'default_currency', '2023-01-24 22:51:24', '2023-01-24 22:51:24'),
(292, 'copyright_text', '2023-01-24 22:51:24', '2023-01-24 22:51:24'),
(305, 'google_client_id', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(306, 'google_client_secret', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(307, 'facebook_app_id', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(308, 'facebook_app_secret', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(309, 'twitter_client_id', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(310, 'twitter_client_secret', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(311, 'chunk_size_upload_status', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(312, 'watermark_status', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(313, 'watermark_image', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(314, 'watermark_image_position', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(315, 'water_marking_image_size', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(316, 'water_marking_image_opacity', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(317, 'water_marking_image_position_x', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(318, 'water_marking_image_position_y', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(319, 'large_thumb_image_width', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(320, 'large_thumb_image_height', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(321, 'medium_thumb_image_width', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(322, 'medium_thumb_image_height', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(323, 'small_thumb_image_width', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(324, 'small_thumb_image_height', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(325, 'default_comment_status', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(326, 'require_name_email', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(327, 'comment_registration', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(328, 'close_comments_for_old_blogs', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(329, 'thread_comments', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(330, 'page_comments', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(331, 'comments_notify_email', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(332, 'comments_moderation_notify_email', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(333, 'comment_moderation', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(334, 'comment_previously_approved', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(335, 'show_avatars', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(336, 'close_comments_days_old', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(337, 'thread_comments_level', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(338, 'comments_per_page', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(339, 'comment_order', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(340, 'comment_max_links', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(341, 'comment_moderation_keys', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(342, 'comment_disallowed_keys', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(343, 'avatar_default', '2023-01-24 22:51:25', '2023-01-24 22:51:25'),
(344, 'admin_logo', '2023-01-25 00:09:30', '2023-01-25 00:09:30'),
(345, 'admin_mobile_logo', '2023-01-25 00:09:30', '2023-01-25 00:09:30'),
(346, 'admin_dark_logo', '2023-01-25 00:09:30', '2023-01-25 00:09:30'),
(347, 'admin_dark_mobile_logo', '2023-01-25 00:09:30', '2023-01-25 00:09:30'),
(348, 'black_background_logo', '2023-02-04 20:36:34', '2023-02-04 20:36:34'),
(349, 'white_background_logo', '2023-02-04 20:36:34', '2023-02-04 20:36:34'),
(350, 'favicon', '2023-02-04 20:36:34', '2023-02-04 20:36:34'),
(351, 'black_mobile_background_logo', '2023-02-04 20:36:34', '2023-02-04 20:36:34'),
(352, 'white_mobile_background_logo', '2023-02-04 20:36:34', '2023-02-04 20:36:34'),
(353, 'sticky_mobile_background_logo', '2023-02-04 20:36:34', '2023-02-04 20:36:34'),
(354, 'sticky_background_logo', '2023-02-04 20:36:34', '2023-02-04 20:36:34'),
(355, 'sticky_black_mobile_background_logo', '2023-02-04 20:36:34', '2023-02-04 20:36:34'),
(356, 'sticky_black_background_logo', '2023-02-04 20:36:34', '2023-02-04 20:36:34'),
(357, 'site_moto', '2023-03-02 21:24:10', '2023-03-02 21:24:10'),
(358, 'site_motto', '2023-03-20 00:42:26', '2023-03-20 00:42:26'),
(359, 'system_version', '2023-07-12 12:13:05', '2023-07-12 12:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `tl_general_settings_has_values`
--

CREATE TABLE `tl_general_settings_has_values` (
  `id` int(11) NOT NULL,
  `settings_id` int(11) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_general_settings_has_values`
--

INSERT INTO `tl_general_settings_has_values` (`id`, `settings_id`, `value`, `created_at`, `updated_at`) VALUES
(1366, 288, '2', '2023-01-29 12:37:16', '2023-01-29 12:37:16'),
(1619, 276, '', '2023-02-08 21:57:26', '2023-12-12 16:33:58'),
(1620, 277, 'Newslooks', '2023-02-08 21:57:26', '2023-12-12 16:33:58'),
(1621, 278, 'We are the most popular news portal in the world. Here we publish all kinds of the latest news.', '2023-02-08 21:57:26', '2023-12-12 16:43:12'),
(1622, 279, 'blog, ads, comment, banner', '2023-02-08 21:57:26', '2023-04-30 06:01:49'),
(1623, 280, '', '2023-02-08 21:57:26', '2023-12-28 08:53:34'),
(2078, 313, '552', '2023-04-30 08:56:20', '2023-04-30 08:56:20'),
(2079, 314, 'center', '2023-04-30 08:56:20', '2023-04-30 08:56:20'),
(2080, 316, '50', '2023-04-30 08:56:20', '2023-04-30 08:56:20'),
(2400, 359, '1.2.7', '2023-08-22 05:38:17', '2023-08-22 05:38:17'),
(2502, 274, '1051', '2023-09-14 09:08:30', '2023-09-14 09:08:30'),
(2503, 319, '700', '2023-09-14 09:08:30', '2023-09-14 09:08:30'),
(2504, 320, '700', '2023-09-14 09:08:30', '2023-09-14 09:08:30'),
(2505, 321, '350', '2023-09-14 09:08:30', '2023-09-14 09:08:30'),
(2506, 322, '480', '2023-09-14 09:08:30', '2023-09-14 09:08:30'),
(2507, 323, '250', '2023-09-14 09:08:30', '2023-09-14 09:08:30'),
(2508, 324, '250', '2023-09-14 09:08:30', '2023-09-14 09:08:30'),
(2513, 348, '1050', '2023-09-17 06:28:49', '2023-09-17 06:28:49'),
(2514, 351, '1050', '2023-09-17 06:28:49', '2023-09-17 06:28:49'),
(2515, 354, '1066', '2023-09-17 06:28:49', '2023-09-17 06:28:49'),
(2516, 353, '1066', '2023-09-17 06:28:49', '2023-09-17 06:28:49'),
(2517, 356, '1050', '2023-09-17 06:28:49', '2023-09-17 06:28:49'),
(2518, 355, '1050', '2023-09-17 06:28:49', '2023-09-17 06:28:49'),
(2748, 325, '1', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2749, 326, '0', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2750, 327, '0', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2751, 328, '0', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2752, 329, '0', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2753, 330, '1', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2754, 331, '1', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2755, 332, '0', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2756, 333, '0', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2757, 334, '0', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2758, 335, '1', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2759, 336, '1', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2760, 337, '2', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2761, 338, '5', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2762, 339, '1', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2763, 340, '1', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2764, 341, 'alert(\'XSS!\')', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2765, 342, 'alert(\'XSS!\')', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2766, 343, 'monsterid', '2023-11-14 12:00:00', '2023-11-14 12:00:00'),
(2803, 282, 'Newslooks', '2023-12-12 06:16:10', '2023-12-12 06:16:10'),
(2804, 357, 'Multipurpose Newspaper Website', '2023-12-12 06:16:10', '2023-12-12 06:16:10'),
(2805, 349, '1137', '2023-12-12 06:16:10', '2023-12-12 06:16:10'),
(2806, 352, '1137', '2023-12-12 06:16:10', '2023-12-12 06:16:10'),
(2807, 344, '1138', '2023-12-12 06:16:10', '2023-12-12 06:16:10'),
(2808, 345, '1138', '2023-12-12 06:16:10', '2023-12-12 06:16:10'),
(2809, 346, '1138', '2023-12-12 06:16:10', '2023-12-12 06:16:10'),
(2810, 347, '1138', '2023-12-12 06:16:10', '2023-12-12 06:16:10'),
(2811, 350, '1097', '2023-12-12 06:16:10', '2023-12-12 06:16:10'),
(2812, 281, '1', '2023-12-12 06:16:10', '2023-12-12 06:16:10'),
(2813, 286, 'Asia/Dhaka', '2023-12-12 06:16:10', '2023-12-12 06:16:10'),
(2814, 292, 'Newslooks Copyright @2024. Themelooks', '2023-12-12 06:16:10', '2023-12-12 06:16:10');

-- --------------------------------------------------------

--
-- Table structure for table `tl_languages`
--

CREATE TABLE `tl_languages` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `native_name` varchar(50) NOT NULL DEFAULT '',
  `code` varchar(50) NOT NULL DEFAULT '0',
  `flag` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `is_rtl` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_languages`
--

INSERT INTO `tl_languages` (`id`, `name`, `native_name`, `code`, `flag`, `status`, `is_rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'English', 'en', NULL, 1, 2, '2022-05-30 09:53:37', '2022-07-26 04:17:44'),
(19, 'Arabic', 'عربي', 'sa', NULL, 1, 1, '2023-02-05 20:50:23', '2023-04-02 10:08:58');

-- --------------------------------------------------------

--
-- Table structure for table `tl_media_type`
--

CREATE TABLE `tl_media_type` (
  `id` int(11) NOT NULL,
  `name` varchar(510) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_media_type`
--

INSERT INTO `tl_media_type` (`id`, `name`) VALUES
(1, 'Stuffs'),
(2, 'Products'),
(3, 'System'),
(4, 'Media Settings');

-- --------------------------------------------------------

--
-- Table structure for table `tl_menus`
--

CREATE TABLE `tl_menus` (
  `id` int(11) NOT NULL,
  `menu_group_id` int(11) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `menu_type_id` int(11) DEFAULT NULL,
  `menu_type` varchar(150) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `title` varchar(150) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `target` int(11) DEFAULT 1,
  `icon` text DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `content` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_menus`
--

INSERT INTO `tl_menus` (`id`, `menu_group_id`, `index`, `parent_id`, `post_id`, `category_id`, `page_id`, `menu_type_id`, `menu_type`, `level`, `title`, `url`, `target`, `icon`, `location`, `content`, `created_at`, `updated_at`) VALUES
(451, 21, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Payment Method', '#', 1, ' ', NULL, NULL, '2023-01-29 05:13:21', '2023-01-29 05:13:21'),
(452, 21, 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 'How to Shop', '#', 1, ' ', NULL, NULL, '2023-01-29 05:13:28', '2023-01-29 05:13:28'),
(453, 21, 3, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Terms And Conditions', '#', 1, ' ', NULL, NULL, '2023-01-29 05:13:37', '2023-01-29 05:13:37'),
(454, 21, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Privacy Policy', '#', 1, ' ', NULL, NULL, '2023-01-29 05:13:44', '2023-01-29 05:13:44'),
(455, 21, 5, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Returns', '#', 1, ' ', NULL, NULL, '2023-01-29 05:13:50', '2023-01-29 05:13:50'),
(456, 22, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 'My Account', '#', 1, ' ', NULL, NULL, '2023-01-29 05:14:03', '2023-01-29 05:14:03'),
(457, 22, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Order Tracking', '#', 1, ' ', NULL, NULL, '2023-01-29 05:14:09', '2023-01-29 05:14:09'),
(458, 22, 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Contact Us', '#', 1, ' ', NULL, NULL, '2023-01-29 05:14:15', '2023-01-29 05:14:15'),
(459, 22, 3, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Customer Services', '#', 1, ' ', NULL, NULL, '2023-01-29 05:14:21', '2023-01-29 05:14:21'),
(460, 22, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, 'FAQs', '#', 1, ' ', NULL, NULL, '2023-01-29 05:14:27', '2023-01-29 05:14:27'),
(461, 22, 5, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Help Desk', '#', 1, ' ', NULL, NULL, '2023-01-29 05:14:33', '2023-01-29 05:14:33'),
(464, 24, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Trending Offers', '/collection/15?collection=trending-offers', 1, ' ', NULL, NULL, '2023-01-29 05:49:16', '2023-02-26 22:56:32'),
(465, 24, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Top Fashion', '/collection/16?collection=top-picks-on-clothing', 1, ' ', NULL, NULL, '2023-01-29 05:49:26', '2023-02-26 22:57:09'),
(466, 24, 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Adidas Cap', '/products/black-adidas-cotton-cap-for-men-cap', 1, ' ', NULL, NULL, '2023-01-29 05:49:35', '2023-02-26 22:57:54'),
(467, 25, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Home', '/', 1, ' ', NULL, NULL, '2023-01-29 05:51:03', '2023-02-05 17:52:43'),
(468, 25, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 'All Products', '/products', 1, ' ', NULL, NULL, '2023-01-29 05:51:12', '2023-03-01 14:59:49'),
(474, 25, 6, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Compare', '#', 1, ' ', NULL, NULL, '2023-01-29 05:52:10', '2023-02-26 21:44:03'),
(475, 25, 2, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Flash Sale', '/deals/flash-deals', 1, NULL, NULL, NULL, '2023-02-26 21:41:04', '2023-02-26 21:42:27'),
(476, 25, 3, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Blogs', '/blog', 1, NULL, NULL, NULL, '2023-02-26 21:41:31', '2023-02-26 21:42:27'),
(477, 25, 4, 0, NULL, NULL, NULL, NULL, NULL, 1, 'All Categories', '/categories', 1, NULL, NULL, NULL, '2023-02-26 21:42:17', '2023-02-26 21:42:27'),
(478, 25, 5, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Men\'s Fashion', '/products/category/mens-fashion', 1, NULL, NULL, NULL, '2023-02-26 21:44:00', '2023-02-27 19:53:31'),
(486, 23, 0, 0, NULL, NULL, NULL, 161, 'post', 1, 'Fruits and Vegetables', '/blog/12-fruits-and-vegetables-to-buy-organic-in-2023', 1, NULL, NULL, NULL, '2023-02-27 20:04:02', '2023-02-28 06:16:19'),
(487, 23, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Electronic Device', '/products/category/electronic-devices', 1, NULL, NULL, NULL, '2023-02-27 20:05:57', '2023-02-27 20:05:57'),
(494, 22, 6, 461, NULL, NULL, NULL, 281, 'category', 2, 'Shop', '/blog/category/shop', 1, NULL, NULL, NULL, '2023-03-22 00:19:24', '2023-03-22 00:19:27'),
(495, 22, 7, 494, NULL, NULL, NULL, 280, 'category', 3, 'Travel', '/blog/category/travel', 1, NULL, NULL, NULL, '2023-03-22 00:19:24', '2023-03-22 00:19:29'),
(496, 22, 8, 495, NULL, NULL, NULL, 279, 'category', 4, 'Flower', '/blog/category/flower', 1, NULL, NULL, NULL, '2023-03-22 00:19:24', '2023-03-22 00:19:30'),
(502, 27, 0, 0, NULL, NULL, NULL, 281, 'category', 1, 'Shop', '/blog/category/shop', 1, NULL, NULL, NULL, '2023-05-09 10:33:03', '2023-05-09 10:33:03'),
(503, 27, 1, 0, NULL, NULL, NULL, 181, 'post', 1, 'New Blog is Here', '/blog/new-blog-is-here', 1, NULL, NULL, NULL, '2023-05-09 10:33:06', '2023-05-09 10:33:06'),
(504, 27, 2, 0, NULL, NULL, NULL, 9, 'page', 1, 'About', '/page/about', 1, NULL, NULL, NULL, '2023-05-09 10:33:09', '2023-05-09 10:33:09'),
(505, 27, 3, 504, NULL, NULL, NULL, 110, 'tag', 2, 't-shirt', '/blog/tag/t-shirt', 1, NULL, NULL, NULL, '2023-05-09 10:33:12', '2023-06-01 10:34:57'),
(506, 27, 4, 505, NULL, NULL, NULL, NULL, NULL, 3, 'Hello How are you doing', 'base path', 1, NULL, NULL, NULL, '2023-05-09 10:33:35', '2023-06-01 10:34:58'),
(509, 29, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 'alert(\'XSS!\')', 'alert(\'XSS!\')', 1, NULL, NULL, NULL, '2023-05-28 10:16:12', '2023-05-28 10:16:12'),
(510, 30, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 'alert(\'XSS!\')', 'alert(\'XSS!\')', 1, NULL, NULL, NULL, '2023-05-29 08:04:54', '2023-05-29 08:04:54'),
(511, 28, 0, 0, NULL, NULL, NULL, 286, 'category', 1, 'alert(\'XSS!\')', 'alert(\'XSS!\')', 1, NULL, NULL, NULL, '2023-05-29 08:05:24', '2023-05-29 08:05:48'),
(512, 28, 1, 0, NULL, NULL, NULL, 182, 'post', 1, 'Rakib', '/blog/rakib', 1, NULL, NULL, NULL, '2023-05-29 08:06:09', '2023-05-29 08:06:09'),
(513, 28, 2, 0, NULL, NULL, NULL, 181, 'post', 1, 'alert(0)', '/blog/new-blog-is-here', 1, NULL, NULL, NULL, '2023-05-29 08:06:09', '2023-05-29 08:06:32'),
(514, 28, 3, 0, NULL, NULL, NULL, 179, 'post', 1, 'alert(\'XSS!\')', '/blog/summer-adventure-essentials-from-backcountry', 1, NULL, NULL, NULL, '2023-05-29 08:06:09', '2023-05-29 08:06:16'),
(560, 32, 2, 0, NULL, NULL, NULL, 281, 'category', 1, 'Shop', '/blog/category/shop', 1, NULL, NULL, NULL, '2023-11-01 10:34:05', '2023-11-01 10:34:05'),
(565, 26, 7, 0, NULL, NULL, NULL, 295, 'category', 1, 'Entertainment', '/category/entertainment', 1, NULL, NULL, NULL, '2023-12-05 17:50:03', '2023-12-10 17:08:45'),
(566, 26, 8, 0, NULL, NULL, NULL, 294, 'category', 1, 'Sports', '/category/sports', 1, NULL, NULL, NULL, '2023-12-05 17:50:03', '2023-12-10 17:08:45'),
(567, 26, 9, 0, NULL, NULL, NULL, 290, 'category', 1, 'Politics', '/category/politics', 1, NULL, NULL, NULL, '2023-12-05 17:50:03', '2023-12-10 17:08:45'),
(568, 26, 10, 0, NULL, NULL, NULL, 289, 'category', 1, 'World News', '/category/world-news', 1, NULL, NULL, NULL, '2023-12-05 17:50:03', '2023-12-10 17:08:45'),
(571, 31, 0, 0, NULL, NULL, NULL, 9, 'page', 1, 'About', '/page/about', 1, NULL, NULL, NULL, '2023-12-06 11:37:09', '2023-12-06 11:37:09'),
(572, 31, 1, 0, NULL, NULL, NULL, 32, 'page', 1, 'Help Line', '/page/help-line', 1, NULL, NULL, NULL, '2023-12-06 11:37:16', '2023-12-06 11:37:16'),
(573, 31, 2, 0, NULL, NULL, NULL, 31, 'page', 1, 'Advertisement', '/page/advertisement', 1, NULL, NULL, NULL, '2023-12-06 11:37:16', '2023-12-06 11:37:16'),
(574, 31, 3, 0, NULL, NULL, NULL, 1, 'page', 1, 'Privacy Policy', '/page/privacy-policy', 1, NULL, NULL, NULL, '2023-12-06 11:37:16', '2023-12-06 11:37:16'),
(575, 33, 0, 0, NULL, NULL, NULL, 33, 'page', 1, 'Terms & Conditions', '/page/terms-&-conditions', 1, NULL, NULL, NULL, '2023-12-06 11:38:27', '2023-12-06 11:38:27'),
(576, 33, 1, 0, NULL, NULL, NULL, 32, 'page', 1, 'Help Line', '/page/help-line', 1, NULL, NULL, NULL, '2023-12-06 11:38:27', '2023-12-06 11:38:27'),
(577, 33, 2, 0, NULL, NULL, NULL, 31, 'page', 1, 'Advertisement', '/page/advertisement', 1, NULL, NULL, NULL, '2023-12-06 11:38:27', '2023-12-06 11:38:27'),
(578, 33, 3, 0, NULL, NULL, NULL, 1, 'page', 1, 'Privacy Policy', '/page/privacy-policy', 1, NULL, NULL, NULL, '2023-12-06 11:38:27', '2023-12-06 11:38:27'),
(579, 33, 4, 0, NULL, NULL, NULL, 295, 'category', 1, 'Entertainment', '/category/entertainment', 1, NULL, NULL, NULL, '2023-12-06 11:38:35', '2023-12-06 11:59:38'),
(580, 33, 6, 0, NULL, NULL, NULL, 288, 'category', 1, 'Technology', '/category/technology', 1, NULL, NULL, NULL, '2023-12-06 11:38:41', '2023-12-06 11:59:12'),
(581, 33, 5, 0, NULL, NULL, NULL, 294, 'category', 1, 'Sports', '/category/sports', 1, NULL, NULL, NULL, '2023-12-06 11:38:59', '2023-12-06 11:59:25'),
(586, 26, 6, 0, NULL, NULL, NULL, NULL, NULL, 1, 'All News', '/posts', 1, NULL, NULL, NULL, '2023-12-10 11:07:54', '2023-12-10 17:08:45'),
(587, 26, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Home 1', '/', 1, NULL, NULL, NULL, '2023-12-10 17:07:24', '2023-12-26 05:58:19'),
(589, 33, 7, 0, NULL, NULL, NULL, 293, 'category', 1, 'Business and Finance', '/category/business-and-finance', 1, NULL, NULL, NULL, '2023-12-26 12:09:42', '2023-12-26 12:09:42'),
(590, 33, 8, 0, NULL, NULL, NULL, 292, 'category', 1, 'Health and Foods', '/category/health-and-foods', 1, NULL, NULL, NULL, '2023-12-26 12:09:42', '2023-12-26 12:09:42'),
(591, 33, 9, 0, NULL, NULL, NULL, 291, 'category', 1, 'Life Style', '/category/life-style', 1, NULL, NULL, NULL, '2023-12-26 12:09:42', '2023-12-26 12:09:42'),
(592, 33, 10, 0, NULL, NULL, NULL, 290, 'category', 1, 'Politics', '/category/politics', 1, NULL, NULL, NULL, '2023-12-26 12:09:42', '2023-12-26 12:09:42'),
(593, 33, 11, 0, NULL, NULL, NULL, 289, 'category', 1, 'World News', '/category/world-news', 1, NULL, NULL, NULL, '2023-12-26 12:09:42', '2023-12-26 12:09:42'),
(594, 33, 12, 0, NULL, NULL, NULL, 280, 'category', 1, 'Travel', '/category/travel', 1, NULL, NULL, NULL, '2023-12-26 12:09:42', '2023-12-26 12:09:42'),
(595, 33, 13, 0, NULL, NULL, NULL, 279, 'category', 1, 'Flower', '/category/flower', 1, NULL, NULL, NULL, '2023-12-26 12:09:42', '2023-12-26 12:09:42'),
(596, 33, 14, 0, NULL, NULL, NULL, 274, 'category', 1, 'Fashion', '/category/fashion', 1, NULL, NULL, NULL, '2023-12-26 12:09:42', '2023-12-26 12:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `tl_menu_groups`
--

CREATE TABLE `tl_menu_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_menu_groups`
--

INSERT INTO `tl_menu_groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(26, 'Header Menu', '2023-03-21 23:53:13', '2023-03-21 23:53:13'),
(31, 'Menu Top', '2023-09-24 11:11:45', '2023-09-24 11:11:45'),
(32, 'New Test', '2023-11-01 10:32:10', '2023-11-01 10:32:10'),
(33, 'Footer Links', '2023-12-06 11:38:00', '2023-12-06 11:38:00');

-- --------------------------------------------------------

--
-- Table structure for table `tl_menu_groups_translations`
--

CREATE TABLE `tl_menu_groups_translations` (
  `id` int(11) NOT NULL,
  `menu_group_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_menu_groups_translations`
--

INSERT INTO `tl_menu_groups_translations` (`id`, `menu_group_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(8, 21, 'Our Policies', 'en', '2023-01-29 05:13:03', '2023-01-29 05:13:03'),
(9, 24, 'Header Top Left Menus', 'en', '2023-01-29 05:49:46', '2023-01-29 05:49:46'),
(10, 23, 'Header Top Right Menus', 'en', '2023-01-29 05:49:55', '2023-01-29 05:49:55'),
(11, 25, 'Header Middle Menus', 'en', '2023-01-29 05:52:15', '2023-01-29 05:52:15'),
(12, 26, 'Header Menu', 'en', '2023-09-24 11:09:10', '2023-12-26 11:59:11'),
(13, 31, 'Menu Top', 'en', '2023-09-24 11:57:21', '2023-09-24 11:57:21'),
(14, 33, 'Footer Links', 'en', '2023-12-26 12:09:45', '2023-12-26 12:09:45');

-- --------------------------------------------------------

--
-- Table structure for table `tl_menu_group_has_positon`
--

CREATE TABLE `tl_menu_group_has_positon` (
  `id` int(11) NOT NULL,
  `menu_group_id` int(11) DEFAULT NULL,
  `menu_position_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_menu_group_has_positon`
--

INSERT INTO `tl_menu_group_has_positon` (`id`, `menu_group_id`, `menu_position_id`, `created_at`, `updated_at`) VALUES
(110, 24, 3, '2023-01-29 11:49:46', NULL),
(111, 23, 2, '2023-01-29 11:49:55', NULL),
(114, 22, 1, '2023-03-18 04:30:37', NULL),
(118, 27, 5, '2023-05-09 10:33:42', NULL),
(124, 31, 7, '2023-09-24 11:57:21', NULL),
(126, 26, 8, '2023-12-26 05:59:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tl_menu_items`
--

CREATE TABLE `tl_menu_items` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `template` varchar(150) DEFAULT NULL,
  `plugin_location` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_menu_items`
--

INSERT INTO `tl_menu_items` (`id`, `name`, `template`, `plugin_location`) VALUES
(1, 'Product Categories', 'plugin/tlecommercecore::menu.include.product_category_menu_item', 'tlecommercecore');

-- --------------------------------------------------------

--
-- Table structure for table `tl_menu_positions`
--

CREATE TABLE `tl_menu_positions` (
  `id` int(11) NOT NULL,
  `position` varchar(150) DEFAULT NULL,
  `theme_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_menu_positions`
--

INSERT INTO `tl_menu_positions` (`id`, `position`, `theme_id`, `created_at`, `updated_at`) VALUES
(7, 'Header Top Menu', 22, '2023-09-24 11:08:38', '2023-09-24 11:08:38'),
(8, 'Header Main Menu', 22, '2023-09-24 11:08:38', '2023-09-24 11:08:38'),
(9, 'Header Menu', 23, '2023-12-11 16:18:21', '2023-12-11 16:18:21');

-- --------------------------------------------------------

--
-- Table structure for table `tl_menu_translations`
--

CREATE TABLE `tl_menu_translations` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `lang` varchar(150) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_menu_translations`
--

INSERT INTO `tl_menu_translations` (`id`, `menu_id`, `lang`, `name`, `created_at`, `updated_at`) VALUES
(92, 538, 'en', 'Home', '2023-12-02 09:17:15', '2023-12-05 17:35:02'),
(94, 561, 'en', 'Home 2', '2023-12-05 17:49:13', '2023-12-05 17:49:13'),
(95, 565, 'en', 'Entertainment', '2023-12-06 11:56:01', '2023-12-06 11:56:01'),
(96, 566, 'en', 'Sports', '2023-12-06 11:56:20', '2023-12-06 11:56:20'),
(97, 567, 'en', 'Politics', '2023-12-06 11:56:33', '2023-12-06 11:56:33'),
(98, 568, 'en', 'World News', '2023-12-06 11:56:50', '2023-12-06 11:56:50'),
(99, 569, 'en', 'Technology', '2023-12-06 11:57:08', '2023-12-06 11:57:08'),
(100, 570, 'en', 'Fashion', '2023-12-06 11:57:23', '2023-12-06 11:57:23'),
(101, 580, 'en', 'Technology', '2023-12-06 11:59:12', '2023-12-06 11:59:12'),
(102, 581, 'en', 'Sports', '2023-12-06 11:59:25', '2023-12-06 11:59:25'),
(103, 579, 'en', 'Entertainment', '2023-12-06 11:59:38', '2023-12-06 11:59:38'),
(104, 562, 'en', 'Home 3', '2023-12-10 10:45:30', '2023-12-10 10:45:30'),
(105, 563, 'en', 'Home 4', '2023-12-10 10:45:45', '2023-12-10 10:45:45'),
(106, 564, 'en', 'Home 5', '2023-12-10 10:45:59', '2023-12-10 10:45:59'),
(107, 571, 'sa', 'عن', '2023-12-24 16:22:03', '2023-12-24 16:22:03'),
(108, 572, 'sa', 'خط المساعدة', '2023-12-24 16:22:14', '2023-12-24 16:22:14'),
(109, 573, 'sa', 'إعلان', '2023-12-24 16:22:25', '2023-12-24 16:22:25'),
(110, 574, 'sa', 'سياسة الخصوصية', '2023-12-24 16:22:38', '2023-12-24 16:22:38'),
(111, 568, 'sa', 'اخبار العالم', '2023-12-24 16:22:53', '2023-12-24 16:22:53'),
(112, 567, 'sa', 'سياسة', '2023-12-24 16:23:03', '2023-12-24 16:23:03'),
(113, 566, 'sa', 'رياضات', '2023-12-24 16:23:22', '2023-12-24 16:23:22'),
(114, 565, 'sa', 'ترفيه', '2023-12-24 16:23:39', '2023-12-24 16:23:39'),
(115, 586, 'sa', 'جميع الأخبار', '2023-12-24 16:23:49', '2023-12-24 16:23:49'),
(116, 564, 'sa', 'بيت 5', '2023-12-24 16:24:04', '2023-12-24 16:24:04'),
(117, 563, 'sa', 'بيت 4', '2023-12-24 16:24:09', '2023-12-24 16:24:09'),
(118, 562, 'sa', 'بيت 3', '2023-12-24 16:24:15', '2023-12-24 16:24:15'),
(119, 588, 'sa', 'بيت 2', '2023-12-24 16:24:21', '2023-12-24 16:24:21'),
(120, 587, 'sa', 'بيت 1', '2023-12-24 16:24:25', '2023-12-24 16:24:25'),
(121, 538, 'sa', 'بيت', '2023-12-24 16:24:30', '2023-12-24 16:24:30'),
(122, 575, 'sa', 'البنود و الظروف', '2023-12-24 16:25:20', '2023-12-24 16:25:20'),
(123, 576, 'sa', 'خط المساعدة', '2023-12-24 16:25:31', '2023-12-24 16:25:31'),
(124, 577, 'sa', 'إعلان', '2023-12-24 16:25:41', '2023-12-24 16:25:41'),
(125, 578, 'sa', 'سياسة الخصوصية', '2023-12-24 16:25:51', '2023-12-24 16:25:51'),
(126, 579, 'sa', 'ترفيه', '2023-12-24 16:26:08', '2023-12-24 16:26:08'),
(127, 581, 'sa', 'رياضات', '2023-12-24 16:26:20', '2023-12-24 16:26:20'),
(128, 580, 'sa', 'تكنولوجيا', '2023-12-24 16:26:38', '2023-12-24 16:26:38'),
(129, 587, 'en', 'Home', '2023-12-26 11:59:25', '2023-12-26 11:59:25'),
(130, 589, 'sa', 'الأعمال التجارية والمالية', '2023-12-27 10:05:02', '2023-12-27 10:05:02'),
(131, 590, 'sa', 'الصحة والأغذية', '2023-12-27 10:05:13', '2023-12-27 10:05:13'),
(132, 591, 'sa', 'نمط الحياة', '2023-12-27 10:05:24', '2023-12-27 10:05:24'),
(133, 592, 'sa', 'سياسة', '2023-12-27 10:05:33', '2023-12-27 10:05:33'),
(134, 593, 'sa', 'اخبار العالم', '2023-12-27 10:05:41', '2023-12-27 10:05:41'),
(135, 594, 'sa', 'يسافر', '2023-12-27 10:05:52', '2023-12-27 10:05:52'),
(136, 595, 'sa', 'ورد', '2023-12-27 10:06:02', '2023-12-27 10:06:02'),
(137, 596, 'sa', 'موضة', '2023-12-27 10:06:13', '2023-12-27 10:06:13');

-- --------------------------------------------------------

--
-- Table structure for table `tl_pages`
--

CREATE TABLE `tl_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `permalink` text DEFAULT NULL,
  `page_image` text DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `visibility` varchar(255) DEFAULT NULL,
  `page_password` longtext DEFAULT NULL,
  `publish_at` datetime DEFAULT NULL,
  `parent` bigint(20) UNSIGNED DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` text DEFAULT NULL,
  `page_template` bigint(20) DEFAULT NULL,
  `page_type` varchar(255) NOT NULL DEFAULT 'default',
  `is_home` tinyint(1) NOT NULL DEFAULT 0,
  `publish_status` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_pages`
--

INSERT INTO `tl_pages` (`id`, `title`, `permalink`, `page_image`, `user_id`, `content`, `visibility`, `page_password`, `publish_at`, `parent`, `meta_title`, `meta_description`, `meta_image`, `page_template`, `page_type`, `is_home`, `publish_status`, `created_at`, `updated_at`) VALUES
(1, 'Privacy Policy', 'privacy-policy', NULL, 1, '<h2 style=\"margin-bottom:14px;\">Introduction:</h2>\r\n<p>we comprehend that security online is\r\n    vital to clients of our website, particularly while leading a business. this assertion oversees our protection\r\n    arrangements regarding those users of the site (guests) who visit without executing business and visitors who\r\n    register to execute business on the site and utilize the different administrations presented by this application\r\n    (collectively, services) (authorized customers).</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Personally Identifiable Information</h2>\r\n<p>refers to any information that\r\n    identifies or can be used to identify, contact, or locate the person to whom such information relates,\r\n    including, however not limited to, name, address, phone number, fax number, email address, financial profiles,\r\n    social security number, and credit card information. actually, recognizable information does exclude information\r\n    that is collected anonymously (that is, without identification of the individual user) or demographic\r\n    information not associated with a recognized person.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What Personally Identifiable Information is collected?</h2>\r\n\r\n<p>we might collect primary user profile\r\n    information from all of our visitors. we collect the following extra information from our authorized customers:\r\n    the names, addresses, phone numbers, and email addresses of authorized customers, the nature and size of the\r\n    business, and the nature and size of the advertisement stock that the authorized customer intends to buy or\r\n    sell.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What organizations are collecting the information?</h2>\r\n\r\n<p>notwithstanding our immediate\r\n    assortment of information, our third-party service vendors (such as credit card companies, clearinghouses, and\r\n    banks) who may provide such types of services as credit, insurance, and escrow services may collect this\r\n    information from our visitors and authorized customers. we don\'t control how these third parties use such\r\n    information, but we do ask them to disclose how they use personal information provided to them by visitors and\r\n    authorized customers. a portion of these third parties may be mediators that act solely as links in the\r\n    distribution chain and do not store, retain, or use the information given to them.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does the Site use Personally Identifiable Information?</h2>\r\n\r\n<p>we use privately identifiable\r\n    information to customize the site, make appropriate service offerings, and fulfill buying and selling\r\n    recommendations on the site. we may email visitors and authorized customers about research or purchase and\r\n    selling opportunities on the site or information related to the topic matter of the site. we may also use\r\n    personally identifiable information to contact visitors and authorized customers in response to specific\r\n    inquiries or to provide requested information.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">With whom may the information may be shared?</h2>\r\n\r\n<p>personally identifiable information\r\n    about authorized customers might be imparted to other authorized customers who wish to evaluate potential\r\n    transactions with other authorized customers. we might share aggregated information about our visitors,\r\n    including the demographics of our visitors and authorized customers, with our affiliated agencies and\r\n    third-party vendors. we additionally offer the opportunity to \"opt-out\" of getting information or being\r\n    contacted by us or by any agency acting on our behalf.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How is Personally Identifiable Information stored?</h2>\r\n\r\n<p>personally identifiable information\r\n    collected by this app is safely stored and is not accessible to third parties or employees of this app except\r\n    for use as shown previously.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What options are available to Visitors regarding the exhibition, use, and dissemination of the information?</h2>\r\n\r\n<p>visitors and authorized customers\r\n    might quit getting spontaneous information from or being contacted by us and/or our vendors and affiliated\r\n    agencies by replying to emails as instructed, or by contacting us.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Are Cookies Used on the Site?</h2>\r\n\r\n<p>cookies are used for various reasons.\r\n    we use cookies to acquire information about the preferences of our visitors and the services they select. we\r\n    also use cookies for security purposes to safeguard our authorized customers. for instance, if an authorized\r\n    customer is signed on and the site is unused, the system may automatically log the authorized customer off.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does This APP use login information?</h2>\r\n\r\n<p>this app uses login information,\r\n    including, but not limited to, ip addresses, isps, and browser types, to analyze trends, administer the site,\r\n    track a user’s movement and use, and accumulate broad demographic information.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What partners or service providers have access to Personally Recognizable Information from Visitors and/or\r\n    Authorized Customers on the Site?</h2>\r\n\r\n<p>this app has entered into and will\r\n    continue to enter into partnerships and other affiliations with a number of vendors. such vendors may have\r\n    access to certain personally identifiable information on a need-to-know basis for evaluating authorized\r\n    customers for service eligibility. our privacy policy does not cover their collection or use of this\r\n    information. disclosure of personally identifiable information to comply with the law. we will reveal personally\r\n    identifiable information in order to comply with a court order or subpoena or request from a law enforcement\r\n    agency to release information. we will also uncover personally identifiable information when reasonably\r\n    necessary to protect the safeguard of our visitors and authorized customers.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does the Site keep Personally Identifiable Information secure?</h2>\r\n\r\n<p>our representatives are all acquainted\r\n    with our security policy and practices. the personally identifiable information of our visitors and authorized\r\n    customers is only accessible to a predetermined number of qualified employees who are given a password in order\r\n    to achieve access to the information. we review our security systems and processes on cycles consistently.\r\n    sensitive information, for example, credit card numbers or social security numbers, is protected by encryption\r\n    protocols, in place to protect information sent over the internet. while we take commercially reasonable\r\n    measures to maintain a secure site, electronic communications and databases are subject to errors, tampering,\r\n    and break-ins, and we cannot guarantee or warrant that such events won\'t take place and we will not be liable to\r\n    visitors or authorized customers for any such occurrences.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How can Visitors correct any inaccuracies in Personally Identifiable Information?</h2>\r\n\r\n<p>visitors and authorized customers may\r\n    messaging us to update personally identifiable information about them or to correct any inaccuracies by emailing\r\n    us here. </p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Can a Visitor delete or deactivate Personally Identifiable Information collected by the Site?</h2>\r\n\r\n<p>we provide visitors and authorized\r\n    customers with a mechanism to erase/deactivate personally identifiable information from the site’s database by\r\n    contacting . nonetheless, because of backups and records of deletions, it may be impossible to delete a\r\n    visitor’s entry without retaining some residual information. a person who requests to have personally\r\n    identifiable information deactivated will have this information functionally deleted, and we won\'t sell,\r\n    transfer, or use personally identifiable information relating to that individual in any way moving forward.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What happens if the Privacy Policy Changes?</h2>\r\n\r\n<p>we will tell our visitors and authorized customers know\r\n    about changes to our privacy policy by posting such changes on the site. nonetheless, assuming that we are\r\n    changing our privacy policy in a manner that might cause disclosure of personally identifiable information that\r\n    a visitor or authorized customer has previously requested not be disclosed, we will contact such visitor or\r\n    authorized customer to permit such visitor or authorized customer to prevent such exposure.</p>', 'public', NULL, '2023-03-21 05:50:18', NULL, '', '', NULL, NULL, 'default', 0, 1, '2023-03-20 23:50:18', '2023-12-27 15:50:39'),
(9, 'About', 'about', NULL, 1, '<h2 style=\"margin-bottom:14px;\">Introduction:</h2>\r\n<p>we comprehend that security online is\r\n    vital to clients of our website, particularly while leading a business. this assertion oversees our protection\r\n    arrangements regarding those users of the site (guests) who visit without executing business and visitors who\r\n    register to execute business on the site and utilize the different administrations presented by this application\r\n    (collectively, services) (authorized customers).</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Personally Identifiable Information</h2>\r\n<p>refers to any information that\r\n    identifies or can be used to identify, contact, or locate the person to whom such information relates,\r\n    including, however not limited to, name, address, phone number, fax number, email address, financial profiles,\r\n    social security number, and credit card information. actually, recognizable information does exclude information\r\n    that is collected anonymously (that is, without identification of the individual user) or demographic\r\n    information not associated with a recognized person.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What Personally Identifiable Information is collected?</h2>\r\n\r\n<p>we might collect primary user profile\r\n    information from all of our visitors. we collect the following extra information from our authorized customers:\r\n    the names, addresses, phone numbers, and email addresses of authorized customers, the nature and size of the\r\n    business, and the nature and size of the advertisement stock that the authorized customer intends to buy or\r\n    sell.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What organizations are collecting the information?</h2>\r\n\r\n<p>notwithstanding our immediate\r\n    assortment of information, our third-party service vendors (such as credit card companies, clearinghouses, and\r\n    banks) who may provide such types of services as credit, insurance, and escrow services may collect this\r\n    information from our visitors and authorized customers. we don\'t control how these third parties use such\r\n    information, but we do ask them to disclose how they use personal information provided to them by visitors and\r\n    authorized customers. a portion of these third parties may be mediators that act solely as links in the\r\n    distribution chain and do not store, retain, or use the information given to them.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does the Site use Personally Identifiable Information?</h2>\r\n\r\n<p>we use privately identifiable\r\n    information to customize the site, make appropriate service offerings, and fulfill buying and selling\r\n    recommendations on the site. we may email visitors and authorized customers about research or purchase and\r\n    selling opportunities on the site or information related to the topic matter of the site. we may also use\r\n    personally identifiable information to contact visitors and authorized customers in response to specific\r\n    inquiries or to provide requested information.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">With whom may the information may be shared?</h2>\r\n\r\n<p>personally identifiable information\r\n    about authorized customers might be imparted to other authorized customers who wish to evaluate potential\r\n    transactions with other authorized customers. we might share aggregated information about our visitors,\r\n    including the demographics of our visitors and authorized customers, with our affiliated agencies and\r\n    third-party vendors. we additionally offer the opportunity to \"opt-out\" of getting information or being\r\n    contacted by us or by any agency acting on our behalf.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How is Personally Identifiable Information stored?</h2>\r\n\r\n<p>personally identifiable information\r\n    collected by this app is safely stored and is not accessible to third parties or employees of this app except\r\n    for use as shown previously.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What options are available to Visitors regarding the exhibition, use, and dissemination of the information?</h2>\r\n\r\n<p>visitors and authorized customers\r\n    might quit getting spontaneous information from or being contacted by us and/or our vendors and affiliated\r\n    agencies by replying to emails as instructed, or by contacting us.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Are Cookies Used on the Site?</h2>\r\n\r\n<p>cookies are used for various reasons.\r\n    we use cookies to acquire information about the preferences of our visitors and the services they select. we\r\n    also use cookies for security purposes to safeguard our authorized customers. for instance, if an authorized\r\n    customer is signed on and the site is unused, the system may automatically log the authorized customer off.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does This APP use login information?</h2>\r\n\r\n<p>this app uses login information,\r\n    including, but not limited to, ip addresses, isps, and browser types, to analyze trends, administer the site,\r\n    track a user’s movement and use, and accumulate broad demographic information.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What partners or service providers have access to Personally Recognizable Information from Visitors and/or\r\n    Authorized Customers on the Site?</h2>\r\n\r\n<p>this app has entered into and will\r\n    continue to enter into partnerships and other affiliations with a number of vendors. such vendors may have\r\n    access to certain personally identifiable information on a need-to-know basis for evaluating authorized\r\n    customers for service eligibility. our privacy policy does not cover their collection or use of this\r\n    information. disclosure of personally identifiable information to comply with the law. we will reveal personally\r\n    identifiable information in order to comply with a court order or subpoena or request from a law enforcement\r\n    agency to release information. we will also uncover personally identifiable information when reasonably\r\n    necessary to protect the safeguard of our visitors and authorized customers.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does the Site keep Personally Identifiable Information secure?</h2>\r\n\r\n<p>our representatives are all acquainted\r\n    with our security policy and practices. the personally identifiable information of our visitors and authorized\r\n    customers is only accessible to a predetermined number of qualified employees who are given a password in order\r\n    to achieve access to the information. we review our security systems and processes on cycles consistently.\r\n    sensitive information, for example, credit card numbers or social security numbers, is protected by encryption\r\n    protocols, in place to protect information sent over the internet. while we take commercially reasonable\r\n    measures to maintain a secure site, electronic communications and databases are subject to errors, tampering,\r\n    and break-ins, and we cannot guarantee or warrant that such events won\'t take place and we will not be liable to\r\n    visitors or authorized customers for any such occurrences.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How can Visitors correct any inaccuracies in Personally Identifiable Information?</h2>\r\n\r\n<p>visitors and authorized customers may\r\n    messaging us to update personally identifiable information about them or to correct any inaccuracies by emailing\r\n    us here. </p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Can a Visitor delete or deactivate Personally Identifiable Information collected by the Site?</h2>\r\n\r\n<p>we provide visitors and authorized\r\n    customers with a mechanism to erase/deactivate personally identifiable information from the site’s database by\r\n    contacting . nonetheless, because of backups and records of deletions, it may be impossible to delete a\r\n    visitor’s entry without retaining some residual information. a person who requests to have personally\r\n    identifiable information deactivated will have this information functionally deleted, and we won\'t sell,\r\n    transfer, or use personally identifiable information relating to that individual in any way moving forward.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What happens if the Privacy Policy Changes?</h2>\r\n\r\n<p>we will tell our visitors and authorized customers know\r\n    about changes to our privacy policy by posting such changes on the site. nonetheless, assuming that we are\r\n    changing our privacy policy in a manner that might cause disclosure of personally identifiable information that\r\n    a visitor or authorized customer has previously requested not be disclosed, we will contact such visitor or\r\n    authorized customer to permit such visitor or authorized customer to prevent such exposure.</p>', 'public', NULL, '2023-06-17 10:30:25', NULL, '', '', NULL, NULL, 'default', 0, 1, '2023-05-02 04:30:25', '2023-12-27 15:49:23'),
(30, 'Home 1', 'home-1', NULL, 1, '', 'public', NULL, '2023-07-16 12:12:30', NULL, '', '', NULL, NULL, 'builder', 1, 1, '2023-07-16 06:12:30', '2023-12-14 17:53:03'),
(31, 'Advertisement', 'advertisement', NULL, 1, '<h2 style=\"margin-bottom:14px;\">Introduction:</h2>\r\n<p>we comprehend that security online is\r\n    vital to clients of our website, particularly while leading a business. this assertion oversees our protection\r\n    arrangements regarding those users of the site (guests) who visit without executing business and visitors who\r\n    register to execute business on the site and utilize the different administrations presented by this application\r\n    (collectively, services) (authorized customers).</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Personally Identifiable Information</h2>\r\n<p>refers to any information that\r\n    identifies or can be used to identify, contact, or locate the person to whom such information relates,\r\n    including, however not limited to, name, address, phone number, fax number, email address, financial profiles,\r\n    social security number, and credit card information. actually, recognizable information does exclude information\r\n    that is collected anonymously (that is, without identification of the individual user) or demographic\r\n    information not associated with a recognized person.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What Personally Identifiable Information is collected?</h2>\r\n\r\n<p>we might collect primary user profile\r\n    information from all of our visitors. we collect the following extra information from our authorized customers:\r\n    the names, addresses, phone numbers, and email addresses of authorized customers, the nature and size of the\r\n    business, and the nature and size of the advertisement stock that the authorized customer intends to buy or\r\n    sell.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What organizations are collecting the information?</h2>\r\n\r\n<p>notwithstanding our immediate\r\n    assortment of information, our third-party service vendors (such as credit card companies, clearinghouses, and\r\n    banks) who may provide such types of services as credit, insurance, and escrow services may collect this\r\n    information from our visitors and authorized customers. we don\'t control how these third parties use such\r\n    information, but we do ask them to disclose how they use personal information provided to them by visitors and\r\n    authorized customers. a portion of these third parties may be mediators that act solely as links in the\r\n    distribution chain and do not store, retain, or use the information given to them.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does the Site use Personally Identifiable Information?</h2>\r\n\r\n<p>we use privately identifiable\r\n    information to customize the site, make appropriate service offerings, and fulfill buying and selling\r\n    recommendations on the site. we may email visitors and authorized customers about research or purchase and\r\n    selling opportunities on the site or information related to the topic matter of the site. we may also use\r\n    personally identifiable information to contact visitors and authorized customers in response to specific\r\n    inquiries or to provide requested information.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">With whom may the information may be shared?</h2>\r\n\r\n<p>personally identifiable information\r\n    about authorized customers might be imparted to other authorized customers who wish to evaluate potential\r\n    transactions with other authorized customers. we might share aggregated information about our visitors,\r\n    including the demographics of our visitors and authorized customers, with our affiliated agencies and\r\n    third-party vendors. we additionally offer the opportunity to \"opt-out\" of getting information or being\r\n    contacted by us or by any agency acting on our behalf.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How is Personally Identifiable Information stored?</h2>\r\n\r\n<p>personally identifiable information\r\n    collected by this app is safely stored and is not accessible to third parties or employees of this app except\r\n    for use as shown previously.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What options are available to Visitors regarding the exhibition, use, and dissemination of the information?</h2>\r\n\r\n<p>visitors and authorized customers\r\n    might quit getting spontaneous information from or being contacted by us and/or our vendors and affiliated\r\n    agencies by replying to emails as instructed, or by contacting us.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Are Cookies Used on the Site?</h2>\r\n\r\n<p>cookies are used for various reasons.\r\n    we use cookies to acquire information about the preferences of our visitors and the services they select. we\r\n    also use cookies for security purposes to safeguard our authorized customers. for instance, if an authorized\r\n    customer is signed on and the site is unused, the system may automatically log the authorized customer off.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does This APP use login information?</h2>\r\n\r\n<p>this app uses login information,\r\n    including, but not limited to, ip addresses, isps, and browser types, to analyze trends, administer the site,\r\n    track a user’s movement and use, and accumulate broad demographic information.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What partners or service providers have access to Personally Recognizable Information from Visitors and/or\r\n    Authorized Customers on the Site?</h2>\r\n\r\n<p>this app has entered into and will\r\n    continue to enter into partnerships and other affiliations with a number of vendors. such vendors may have\r\n    access to certain personally identifiable information on a need-to-know basis for evaluating authorized\r\n    customers for service eligibility. our privacy policy does not cover their collection or use of this\r\n    information. disclosure of personally identifiable information to comply with the law. we will reveal personally\r\n    identifiable information in order to comply with a court order or subpoena or request from a law enforcement\r\n    agency to release information. we will also uncover personally identifiable information when reasonably\r\n    necessary to protect the safeguard of our visitors and authorized customers.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does the Site keep Personally Identifiable Information secure?</h2>\r\n\r\n<p>our representatives are all acquainted\r\n    with our security policy and practices. the personally identifiable information of our visitors and authorized\r\n    customers is only accessible to a predetermined number of qualified employees who are given a password in order\r\n    to achieve access to the information. we review our security systems and processes on cycles consistently.\r\n    sensitive information, for example, credit card numbers or social security numbers, is protected by encryption\r\n    protocols, in place to protect information sent over the internet. while we take commercially reasonable\r\n    measures to maintain a secure site, electronic communications and databases are subject to errors, tampering,\r\n    and break-ins, and we cannot guarantee or warrant that such events won\'t take place and we will not be liable to\r\n    visitors or authorized customers for any such occurrences.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How can Visitors correct any inaccuracies in Personally Identifiable Information?</h2>\r\n\r\n<p>visitors and authorized customers may\r\n    messaging us to update personally identifiable information about them or to correct any inaccuracies by emailing\r\n    us here. </p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Can a Visitor delete or deactivate Personally Identifiable Information collected by the Site?</h2>\r\n\r\n<p>we provide visitors and authorized\r\n    customers with a mechanism to erase/deactivate personally identifiable information from the site’s database by\r\n    contacting . nonetheless, because of backups and records of deletions, it may be impossible to delete a\r\n    visitor’s entry without retaining some residual information. a person who requests to have personally\r\n    identifiable information deactivated will have this information functionally deleted, and we won\'t sell,\r\n    transfer, or use personally identifiable information relating to that individual in any way moving forward.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What happens if the Privacy Policy Changes?</h2>\r\n\r\n<p>we will tell our visitors and authorized customers know\r\n    about changes to our privacy policy by posting such changes on the site. nonetheless, assuming that we are\r\n    changing our privacy policy in a manner that might cause disclosure of personally identifiable information that\r\n    a visitor or authorized customer has previously requested not be disclosed, we will contact such visitor or\r\n    authorized customer to permit such visitor or authorized customer to prevent such exposure.</p>', 'public', NULL, '2023-12-05 18:02:08', NULL, 'Advertisement', 'Advertisement', NULL, NULL, 'default', 0, 1, '2023-12-05 18:02:08', '2023-12-27 15:50:33'),
(32, 'Help Line', 'help-line', NULL, 1, '<h2 style=\"margin-bottom:14px;\">Introduction:</h2>\r\n<p>we comprehend that security online is\r\n    vital to clients of our website, particularly while leading a business. this assertion oversees our protection\r\n    arrangements regarding those users of the site (guests) who visit without executing business and visitors who\r\n    register to execute business on the site and utilize the different administrations presented by this application\r\n    (collectively, services) (authorized customers).</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Personally Identifiable Information</h2>\r\n<p>refers to any information that\r\n    identifies or can be used to identify, contact, or locate the person to whom such information relates,\r\n    including, however not limited to, name, address, phone number, fax number, email address, financial profiles,\r\n    social security number, and credit card information. actually, recognizable information does exclude information\r\n    that is collected anonymously (that is, without identification of the individual user) or demographic\r\n    information not associated with a recognized person.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What Personally Identifiable Information is collected?</h2>\r\n\r\n<p>we might collect primary user profile\r\n    information from all of our visitors. we collect the following extra information from our authorized customers:\r\n    the names, addresses, phone numbers, and email addresses of authorized customers, the nature and size of the\r\n    business, and the nature and size of the advertisement stock that the authorized customer intends to buy or\r\n    sell.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What organizations are collecting the information?</h2>\r\n\r\n<p>notwithstanding our immediate\r\n    assortment of information, our third-party service vendors (such as credit card companies, clearinghouses, and\r\n    banks) who may provide such types of services as credit, insurance, and escrow services may collect this\r\n    information from our visitors and authorized customers. we don\'t control how these third parties use such\r\n    information, but we do ask them to disclose how they use personal information provided to them by visitors and\r\n    authorized customers. a portion of these third parties may be mediators that act solely as links in the\r\n    distribution chain and do not store, retain, or use the information given to them.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does the Site use Personally Identifiable Information?</h2>\r\n\r\n<p>we use privately identifiable\r\n    information to customize the site, make appropriate service offerings, and fulfill buying and selling\r\n    recommendations on the site. we may email visitors and authorized customers about research or purchase and\r\n    selling opportunities on the site or information related to the topic matter of the site. we may also use\r\n    personally identifiable information to contact visitors and authorized customers in response to specific\r\n    inquiries or to provide requested information.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">With whom may the information may be shared?</h2>\r\n\r\n<p>personally identifiable information\r\n    about authorized customers might be imparted to other authorized customers who wish to evaluate potential\r\n    transactions with other authorized customers. we might share aggregated information about our visitors,\r\n    including the demographics of our visitors and authorized customers, with our affiliated agencies and\r\n    third-party vendors. we additionally offer the opportunity to \"opt-out\" of getting information or being\r\n    contacted by us or by any agency acting on our behalf.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How is Personally Identifiable Information stored?</h2>\r\n\r\n<p>personally identifiable information\r\n    collected by this app is safely stored and is not accessible to third parties or employees of this app except\r\n    for use as shown previously.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What options are available to Visitors regarding the exhibition, use, and dissemination of the information?</h2>\r\n\r\n<p>visitors and authorized customers\r\n    might quit getting spontaneous information from or being contacted by us and/or our vendors and affiliated\r\n    agencies by replying to emails as instructed, or by contacting us.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Are Cookies Used on the Site?</h2>\r\n\r\n<p>cookies are used for various reasons.\r\n    we use cookies to acquire information about the preferences of our visitors and the services they select. we\r\n    also use cookies for security purposes to safeguard our authorized customers. for instance, if an authorized\r\n    customer is signed on and the site is unused, the system may automatically log the authorized customer off.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does This APP use login information?</h2>\r\n\r\n<p>this app uses login information,\r\n    including, but not limited to, ip addresses, isps, and browser types, to analyze trends, administer the site,\r\n    track a user’s movement and use, and accumulate broad demographic information.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What partners or service providers have access to Personally Recognizable Information from Visitors and/or\r\n    Authorized Customers on the Site?</h2>\r\n\r\n<p>this app has entered into and will\r\n    continue to enter into partnerships and other affiliations with a number of vendors. such vendors may have\r\n    access to certain personally identifiable information on a need-to-know basis for evaluating authorized\r\n    customers for service eligibility. our privacy policy does not cover their collection or use of this\r\n    information. disclosure of personally identifiable information to comply with the law. we will reveal personally\r\n    identifiable information in order to comply with a court order or subpoena or request from a law enforcement\r\n    agency to release information. we will also uncover personally identifiable information when reasonably\r\n    necessary to protect the safeguard of our visitors and authorized customers.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does the Site keep Personally Identifiable Information secure?</h2>\r\n\r\n<p>our representatives are all acquainted\r\n    with our security policy and practices. the personally identifiable information of our visitors and authorized\r\n    customers is only accessible to a predetermined number of qualified employees who are given a password in order\r\n    to achieve access to the information. we review our security systems and processes on cycles consistently.\r\n    sensitive information, for example, credit card numbers or social security numbers, is protected by encryption\r\n    protocols, in place to protect information sent over the internet. while we take commercially reasonable\r\n    measures to maintain a secure site, electronic communications and databases are subject to errors, tampering,\r\n    and break-ins, and we cannot guarantee or warrant that such events won\'t take place and we will not be liable to\r\n    visitors or authorized customers for any such occurrences.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How can Visitors correct any inaccuracies in Personally Identifiable Information?</h2>\r\n\r\n<p>visitors and authorized customers may\r\n    messaging us to update personally identifiable information about them or to correct any inaccuracies by emailing\r\n    us here. </p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Can a Visitor delete or deactivate Personally Identifiable Information collected by the Site?</h2>\r\n\r\n<p>we provide visitors and authorized\r\n    customers with a mechanism to erase/deactivate personally identifiable information from the site’s database by\r\n    contacting . nonetheless, because of backups and records of deletions, it may be impossible to delete a\r\n    visitor’s entry without retaining some residual information. a person who requests to have personally\r\n    identifiable information deactivated will have this information functionally deleted, and we won\'t sell,\r\n    transfer, or use personally identifiable information relating to that individual in any way moving forward.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What happens if the Privacy Policy Changes?</h2>\r\n\r\n<p>we will tell our visitors and authorized customers know\r\n    about changes to our privacy policy by posting such changes on the site. nonetheless, assuming that we are\r\n    changing our privacy policy in a manner that might cause disclosure of personally identifiable information that\r\n    a visitor or authorized customer has previously requested not be disclosed, we will contact such visitor or\r\n    authorized customer to permit such visitor or authorized customer to prevent such exposure.</p>', 'public', NULL, '2023-12-05 18:02:27', NULL, 'Help Line', 'Help Line', NULL, NULL, 'default', 0, 1, '2023-12-05 18:02:27', '2023-12-27 15:49:28'),
(33, 'Terms & Conditions', 'terms-&-conditions', NULL, 1, '<h2 style=\"margin-bottom:14px;\">Introduction:</h2>\r\n<p>we comprehend that security online is\r\n    vital to clients of our website, particularly while leading a business. this assertion oversees our protection\r\n    arrangements regarding those users of the site (guests) who visit without executing business and visitors who\r\n    register to execute business on the site and utilize the different administrations presented by this application\r\n    (collectively, services) (authorized customers).</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Personally Identifiable Information</h2>\r\n<p>refers to any information that\r\n    identifies or can be used to identify, contact, or locate the person to whom such information relates,\r\n    including, however not limited to, name, address, phone number, fax number, email address, financial profiles,\r\n    social security number, and credit card information. actually, recognizable information does exclude information\r\n    that is collected anonymously (that is, without identification of the individual user) or demographic\r\n    information not associated with a recognized person.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What Personally Identifiable Information is collected?</h2>\r\n\r\n<p>we might collect primary user profile\r\n    information from all of our visitors. we collect the following extra information from our authorized customers:\r\n    the names, addresses, phone numbers, and email addresses of authorized customers, the nature and size of the\r\n    business, and the nature and size of the advertisement stock that the authorized customer intends to buy or\r\n    sell.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What organizations are collecting the information?</h2>\r\n\r\n<p>notwithstanding our immediate\r\n    assortment of information, our third-party service vendors (such as credit card companies, clearinghouses, and\r\n    banks) who may provide such types of services as credit, insurance, and escrow services may collect this\r\n    information from our visitors and authorized customers. we don\'t control how these third parties use such\r\n    information, but we do ask them to disclose how they use personal information provided to them by visitors and\r\n    authorized customers. a portion of these third parties may be mediators that act solely as links in the\r\n    distribution chain and do not store, retain, or use the information given to them.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does the Site use Personally Identifiable Information?</h2>\r\n\r\n<p>we use privately identifiable\r\n    information to customize the site, make appropriate service offerings, and fulfill buying and selling\r\n    recommendations on the site. we may email visitors and authorized customers about research or purchase and\r\n    selling opportunities on the site or information related to the topic matter of the site. we may also use\r\n    personally identifiable information to contact visitors and authorized customers in response to specific\r\n    inquiries or to provide requested information.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">With whom may the information may be shared?</h2>\r\n\r\n<p>personally identifiable information\r\n    about authorized customers might be imparted to other authorized customers who wish to evaluate potential\r\n    transactions with other authorized customers. we might share aggregated information about our visitors,\r\n    including the demographics of our visitors and authorized customers, with our affiliated agencies and\r\n    third-party vendors. we additionally offer the opportunity to \"opt-out\" of getting information or being\r\n    contacted by us or by any agency acting on our behalf.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How is Personally Identifiable Information stored?</h2>\r\n\r\n<p>personally identifiable information\r\n    collected by this app is safely stored and is not accessible to third parties or employees of this app except\r\n    for use as shown previously.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What options are available to Visitors regarding the exhibition, use, and dissemination of the information?</h2>\r\n\r\n<p>visitors and authorized customers\r\n    might quit getting spontaneous information from or being contacted by us and/or our vendors and affiliated\r\n    agencies by replying to emails as instructed, or by contacting us.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Are Cookies Used on the Site?</h2>\r\n\r\n<p>cookies are used for various reasons.\r\n    we use cookies to acquire information about the preferences of our visitors and the services they select. we\r\n    also use cookies for security purposes to safeguard our authorized customers. for instance, if an authorized\r\n    customer is signed on and the site is unused, the system may automatically log the authorized customer off.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does This APP use login information?</h2>\r\n\r\n<p>this app uses login information,\r\n    including, but not limited to, ip addresses, isps, and browser types, to analyze trends, administer the site,\r\n    track a user’s movement and use, and accumulate broad demographic information.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What partners or service providers have access to Personally Recognizable Information from Visitors and/or\r\n    Authorized Customers on the Site?</h2>\r\n\r\n<p>this app has entered into and will\r\n    continue to enter into partnerships and other affiliations with a number of vendors. such vendors may have\r\n    access to certain personally identifiable information on a need-to-know basis for evaluating authorized\r\n    customers for service eligibility. our privacy policy does not cover their collection or use of this\r\n    information. disclosure of personally identifiable information to comply with the law. we will reveal personally\r\n    identifiable information in order to comply with a court order or subpoena or request from a law enforcement\r\n    agency to release information. we will also uncover personally identifiable information when reasonably\r\n    necessary to protect the safeguard of our visitors and authorized customers.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How does the Site keep Personally Identifiable Information secure?</h2>\r\n\r\n<p>our representatives are all acquainted\r\n    with our security policy and practices. the personally identifiable information of our visitors and authorized\r\n    customers is only accessible to a predetermined number of qualified employees who are given a password in order\r\n    to achieve access to the information. we review our security systems and processes on cycles consistently.\r\n    sensitive information, for example, credit card numbers or social security numbers, is protected by encryption\r\n    protocols, in place to protect information sent over the internet. while we take commercially reasonable\r\n    measures to maintain a secure site, electronic communications and databases are subject to errors, tampering,\r\n    and break-ins, and we cannot guarantee or warrant that such events won\'t take place and we will not be liable to\r\n    visitors or authorized customers for any such occurrences.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">How can Visitors correct any inaccuracies in Personally Identifiable Information?</h2>\r\n\r\n<p>visitors and authorized customers may\r\n    messaging us to update personally identifiable information about them or to correct any inaccuracies by emailing\r\n    us here. </p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">Can a Visitor delete or deactivate Personally Identifiable Information collected by the Site?</h2>\r\n\r\n<p>we provide visitors and authorized\r\n    customers with a mechanism to erase/deactivate personally identifiable information from the site’s database by\r\n    contacting . nonetheless, because of backups and records of deletions, it may be impossible to delete a\r\n    visitor’s entry without retaining some residual information. a person who requests to have personally\r\n    identifiable information deactivated will have this information functionally deleted, and we won\'t sell,\r\n    transfer, or use personally identifiable information relating to that individual in any way moving forward.</p>\r\n\r\n<h2 style=\"margin-bottom:14px;\">What happens if the Privacy Policy Changes?</h2>\r\n\r\n<p>we will tell our visitors and authorized customers know\r\n    about changes to our privacy policy by posting such changes on the site. nonetheless, assuming that we are\r\n    changing our privacy policy in a manner that might cause disclosure of personally identifiable information that\r\n    a visitor or authorized customer has previously requested not be disclosed, we will contact such visitor or\r\n    authorized customer to permit such visitor or authorized customer to prevent such exposure.</p>', 'public', NULL, '2023-12-05 18:08:57', NULL, 'Terms & Conditions', 'Terms & Conditions', NULL, NULL, 'default', 0, 1, '2023-12-05 18:08:57', '2023-12-27 15:50:25'),
(34, 'Home 2', 'home-2', NULL, 1, '', 'public', NULL, '2023-12-06 11:26:31', NULL, 'Home 2', 'Home 2', NULL, NULL, 'builder', 0, 1, '2023-12-06 11:26:31', '2023-12-14 17:53:03'),
(35, 'Home 3', 'home-3', NULL, 1, '', 'public', NULL, '2023-12-06 11:26:47', NULL, 'Home 3', 'Home 3', NULL, NULL, 'builder', 0, 1, '2023-12-06 11:26:47', '2023-12-14 17:53:03'),
(36, 'Home 4', 'home-4', NULL, 1, '', 'public', NULL, '2023-12-10 10:44:13', NULL, '', '', NULL, NULL, 'builder', 0, 1, '2023-12-10 10:44:13', '2023-12-14 17:53:03'),
(37, 'Home 5', 'home-5', NULL, 1, '', 'public', NULL, '2023-12-10 10:44:42', NULL, '', '', NULL, NULL, 'builder', 0, 1, '2023-12-10 10:44:42', '2023-12-14 17:53:03');

-- --------------------------------------------------------

--
-- Table structure for table `tl_page_translations`
--

CREATE TABLE `tl_page_translations` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `page_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lang` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_page_translations`
--

INSERT INTO `tl_page_translations` (`id`, `title`, `content`, `page_id`, `lang`, `created_at`, `updated_at`) VALUES
(2, 'سياسة الخصوصية', '<h2>مقدمة:</h2>\r\n<br>\r\n<p>نحن ندرك أن الأمان عبر الإنترنت هو\r\n    أمر حيوي لعملاء موقعنا، خاصة أثناء قيادة الأعمال. هذا التأكيد يشرف على حمايتنا\r\n    الترتيبات المتعلقة بمستخدمي الموقع (الضيوف) الذين يقومون بالزيارة دون تنفيذ أعمال والزوار الذين\r\n    قم بالتسجيل لتنفيذ الأعمال على الموقع والاستفادة من الخدمات المختلفة التي يقدمها هذا التطبيق\r\n    (بشكل جماعي، الخدمات) (العملاء المعتمدون).</p>\r\n\r\n<h2>معلومات التعرف الشخصية</h2>\r\n<br>\r\n<p>يشير إلى أي معلومات ذلك\r\n    يحدد أو يمكن استخدامه لتحديد هوية الشخص الذي تتعلق به هذه المعلومات أو الاتصال به أو تحديد مكانه،\r\n    بما في ذلك، على سبيل المثال لا الحصر، الاسم والعنوان ورقم الهاتف ورقم الفاكس وعنوان البريد الإلكتروني والملفات المالية،\r\n    رقم الضمان الاجتماعي ومعلومات بطاقة الائتمان. في الواقع، المعلومات التي يمكن التعرف عليها تستبعد المعلومات\r\n    التي يتم جمعها بشكل مجهول (أي بدون تحديد هوية المستخدم الفردي) أو ديموغرافية\r\n    المعلومات غير المرتبطة بشخص معروف.</p>\r\n\r\n<h2>\r\n    ما هي معلومات التعريف الشخصية التي يتم جمعها؟</h2>\r\n<br>\r\n<p>قد نقوم بجمع ملف تعريف المستخدم الأساسي\r\n    المعلومات من جميع زوارنا. نقوم بجمع المعلومات الإضافية التالية من عملائنا المعتمدين:\r\n    الأسماء والعناوين وأرقام الهواتف وعناوين البريد الإلكتروني للعملاء المعتمدين وطبيعة وحجم\r\n    الأعمال التجارية، وطبيعة وحجم مخزون الإعلان الذي ينوي العميل المرخص شراءه أو\r\n    يبيع.</p>\r\n\r\n<h2>\r\n    ما هي المنظمات التي جمع المعلومات؟</h2>\r\n<br>\r\n<p>على الرغم من لدينا الفورية\r\n    مجموعة متنوعة من المعلومات، وموردي خدمات الطرف الثالث لدينا (مثل شركات بطاقات الائتمان، وغرف المقاصة، و\r\n    البنوك) التي قد تقدم أنواعًا من الخدمات مثل خدمات الائتمان والتأمين والضمان قد تجمع هذا المبلغ\r\n    المعلومات من زوارنا والعملاء المعتمدين. نحن لا نتحكم في كيفية استخدام هذه الأطراف الثالثة لذلك\r\n    المعلومات، لكننا نطلب منهم الكشف عن كيفية استخدامهم للمعلومات الشخصية المقدمة لهم من قبل الزوار و\r\n    العملاء المعتمدين. قد يكون جزء من هذه الأطراف الثالثة وسطاء يعملون فقط كروابط في\r\n    سلسلة التوزيع ولا تقم بتخزين أو الاحتفاظ أو استخدام المعلومات المقدمة لهم.</p>\r\n\r\n<h2>\r\n    كيف يستخدم الموقع معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>نحن نستخدم إمكانية التعرف على القطاع الخاص\r\n    المعلومات لتخصيص الموقع وتقديم عروض الخدمة المناسبة وإتمام عمليات البيع والشراء\r\n    توصيات على الموقع. قد نرسل بريدًا إلكترونيًا للزائرين والعملاء المعتمدين بشأن البحث أو الشراء و\r\n    فرص البيع على الموقع أو المعلومات المتعلقة بموضوع الموقع. قد نستخدمها أيضًا\r\n    معلومات التعريف الشخصية للاتصال بالزائرين والعملاء المعتمدين ردًا على أسئلة محددة\r\n    الاستفسارات أو تقديم المعلومات المطلوبة.</p>\r\n\r\n<h2>\r\n    الذين قد قد تكون مشتركة المعلومات؟</h2>\r\n<br>\r\n<p>معلومات التعرف الشخصية\r\n    قد يتم نقل معلومات حول العملاء المعتمدين إلى العملاء المعتمدين الآخرين الذين يرغبون في تقييم الإمكانات\r\n    المعاملات مع العملاء المعتمدين الآخرين. قد نشارك معلومات مجمعة عن زوارنا،\r\n    بما في ذلك التركيبة السكانية لزوارنا وعملائنا المعتمدين، مع الوكالات التابعة لنا و\r\n    بائعي الطرف الثالث. نحن نقدم بالإضافة إلى ذلك فرصة \"إلغاء الاشتراك\" للحصول على المعلومات أو الوجود\r\n    اتصلت بنا أو بواسطة أي وكالة تتصرف نيابة عنا.</p>\r\n\r\n<h2>\r\n    كيف يتم تخزين معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>معلومات التعرف الشخصية\r\n    يتم تخزينها بشكل آمن بواسطة هذا التطبيق ولا يمكن الوصول إليها من قبل أطراف ثالثة أو موظفي هذا التطبيق باستثناء\r\n    للاستخدام كما هو موضح سابقًا.</p>\r\n\r\n<h2>\r\n    ما هي الخيارات المتاحة للزوار فيما يتعلق بعرض المعلومات واستخدامها ونشرها؟</h2>\r\n<br>\r\n<p>الزوار والعملاء المعتمدين\r\n    قد تتوقف عن الحصول على معلومات عفوية منا أو الاتصال بنا و/أو البائعين التابعين لنا والشركات التابعة لنا\r\n    الوكالات عن طريق الرد على رسائل البريد الإلكتروني وفقًا للتعليمات، أو عن طريق الاتصال بنا.</p>\r\n\r\n<h2>\r\n    هل يتم استخدام ملفات تعريف الارتباط على الموقع؟</h2>\r\n<br>\r\n<p>يتم استخدام ملفات تعريف الارتباط لأسباب مختلفة.\r\n    نحن نستخدم ملفات تعريف الارتباط للحصول على معلومات حول تفضيلات زوارنا والخدمات التي يختارونها. نحن\r\n    استخدم أيضًا ملفات تعريف الارتباط لأغراض أمنية لحماية عملائنا المعتمدين. على سبيل المثال، إذا أذن\r\n    إذا قام العميل بتسجيل الدخول ولم يتم استخدام الموقع، فقد يقوم النظام تلقائيًا بتسجيل خروج العميل المصرح له.</p>\r\n\r\n<h2>\r\n    كيف يستخدم هذا التطبيق معلومات تسجيل الدخول؟</h2>\r\n<br>\r\n<p>يستخدم هذا التطبيق معلومات تسجيل الدخول،\r\n    بما في ذلك، على سبيل المثال لا الحصر، عناوين IP ومقدمي خدمات الإنترنت وأنواع المتصفحات، لتحليل الاتجاهات وإدارة الموقع،\r\n    تتبع حركة المستخدم واستخدامه، وتجميع معلومات ديموغرافية واسعة النطاق.</p>\r\n\r\n<h2>\r\n    ما هو الشركاء أو مقدمو الخدمات الذين يمكنهم الوصول إلى المعلومات الشخصية من الزوار و/أو\r\n    العملاء المعتمدين على الموقع؟</h2>\r\n<br>\r\n<p>وقد دخل هذا التطبيق في وسوف\r\n    الاستمرار في الدخول في شراكات وانتسابات أخرى مع عدد من البائعين. قد يكون لدى هؤلاء البائعين\r\n    الوصول إلى بعض معلومات التعريف الشخصية على أساس الحاجة إلى المعرفة لتقييم المصرح به\r\n    العملاء لأهلية الخدمة. لا تغطي سياسة الخصوصية الخاصة بنا جمعها أو استخدامها\r\n    معلومة. الكشف عن معلومات التعريف الشخصية للامتثال للقانون. سوف نكشف شخصيا\r\n    معلومات تعريفية من أجل الامتثال لأمر المحكمة أو أمر الاستدعاء أو طلب من جهة إنفاذ القانون\r\n    وكالة لنشر المعلومات. وسنكشف أيضًا عن معلومات التعريف الشخصية عندما يكون ذلك معقولًا\r\n    ضرورية لحماية حماية زوارنا وعملائنا المعتمدين.</p>\r\n\r\n<h2>\r\n    كيف يحافظ الموقع على معلومات التعريف الشخصية آمنة؟</h2>\r\n<br>\r\n<p>جميع ممثلينا على دراية\r\n    مع سياستنا وممارساتنا الأمنية. معلومات التعريف الشخصية لزوارنا والمصرح لهم\r\n    لا يمكن الوصول إلى العملاء إلا لعدد محدد مسبقًا من الموظفين المؤهلين الذين يتم منحهم كلمة مرور بالترتيب\r\n    لتحقيق الوصول إلى المعلومة. نقوم بمراجعة أنظمتنا وعملياتنا الأمنية بشكل دوري.\r\n    المعلومات الحساسة، على سبيل المثال، أرقام بطاقات الائتمان أو أرقام الضمان الاجتماعي، محمية بالتشفير\r\n    البروتوكولات المعمول بها لحماية المعلومات المرسلة عبر الإنترنت. في حين أننا نأخذ معقولة تجاريا\r\n    تدابير للحفاظ على موقع آمن، والاتصالات الإلكترونية وقواعد البيانات عرضة للأخطاء، والعبث،\r\n    والاقتحامات، ولا يمكننا أن نضمن أو نضمن عدم وقوع مثل هذه الأحداث ولن نكون مسؤولين عن ذلك\r\n    الزوار أو العملاء المعتمدين لأي من هذه الأحداث.</p>\r\n\r\n<h2>\r\n    كيف يمكن للزائرين تصحيح أي معلومات غير دقيقة في معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>يجوز للزوار والعملاء المعتمدين\r\n    مراسلتنا لتحديث معلومات التعريف الشخصية الخاصة بهم أو لتصحيح أي معلومات غير دقيقة عن طريق البريد الإلكتروني\r\n    لنا هنا. </p>\r\n\r\n<h2>\r\n    هل يمكن للزائر حذف أو إلغاء تنشيط معلومات التعريف الشخصية التي يجمعها الموقع؟</h2>\r\n<br>\r\n<p>نحن نقدم الزوار والمصرح لهم\r\n    العملاء مع آلية لمسح/إلغاء تنشيط معلومات التعريف الشخصية من قاعدة بيانات الموقع\r\n    الاتصال. ومع ذلك، بسبب النسخ الاحتياطية وسجلات الحذف، قد يكون من المستحيل حذف ملف\r\n    دخول الزائر دون الاحتفاظ ببعض المعلومات المتبقية. الشخص الذي يطلب أن يكون شخصيا\r\n    سيتم حذف معلومات التعريف التي تم إلغاء تنشيطها وظيفيًا، ولن نبيع،\r\n    نقل أو استخدام معلومات التعريف الشخصية المتعلقة بهذا الفرد بأي شكل من الأشكال للمضي قدمًا.</p>\r\n\r\n<h2>\r\n    ماذا يحدث إذا تغيرت سياسة الخصوصية؟</h2>\r\n<br>\r\n<p>سنخبر زوارنا وعملائنا المعتمدين بمعرفة ذلك\r\n    حول التغييرات التي تطرأ على سياسة الخصوصية الخاصة بنا عن طريق نشر هذه التغييرات على الموقع. ومع ذلك، على افتراض أننا\r\n    تغيير سياسة الخصوصية الخاصة بنا بطريقة قد تتسبب في الكشف عن معلومات التعريف الشخصية\r\n    طلب زائر أو عميل معتمد سابقًا عدم الكشف عنه، وسوف نقوم بالاتصال بهذا الزائر أو\r\n    العميل المعتمد بالسماح لهذا الزائر أو العميل المعتمد بمنع مثل هذا التعرض.</p>', 1, 'sa', '2023-12-24 10:14:31', '2023-12-24 16:14:31'),
(4, 'عن', '<h2>مقدمة:</h2>\r\n<br>\r\n<p>نحن ندرك أن الأمان عبر الإنترنت هو\r\n    أمر حيوي لعملاء موقعنا، خاصة أثناء قيادة الأعمال. هذا التأكيد يشرف على حمايتنا\r\n    الترتيبات المتعلقة بمستخدمي الموقع (الضيوف) الذين يقومون بالزيارة دون تنفيذ أعمال والزوار الذين\r\n    قم بالتسجيل لتنفيذ الأعمال على الموقع والاستفادة من الخدمات المختلفة التي يقدمها هذا التطبيق\r\n    (بشكل جماعي، الخدمات) (العملاء المعتمدون).</p>\r\n\r\n<h2>معلومات التعرف الشخصية</h2>\r\n<br>\r\n<p>يشير إلى أي معلومات ذلك\r\n    يحدد أو يمكن استخدامه لتحديد هوية الشخص الذي تتعلق به هذه المعلومات أو الاتصال به أو تحديد مكانه،\r\n    بما في ذلك، على سبيل المثال لا الحصر، الاسم والعنوان ورقم الهاتف ورقم الفاكس وعنوان البريد الإلكتروني والملفات المالية،\r\n    رقم الضمان الاجتماعي ومعلومات بطاقة الائتمان. في الواقع، المعلومات التي يمكن التعرف عليها تستبعد المعلومات\r\n    التي يتم جمعها بشكل مجهول (أي بدون تحديد هوية المستخدم الفردي) أو ديموغرافية\r\n    المعلومات غير المرتبطة بشخص معروف.</p>\r\n\r\n<h2>\r\n    ما هي معلومات التعريف الشخصية التي يتم جمعها؟</h2>\r\n<br>\r\n<p>قد نقوم بجمع ملف تعريف المستخدم الأساسي\r\n    المعلومات من جميع زوارنا. نقوم بجمع المعلومات الإضافية التالية من عملائنا المعتمدين:\r\n    الأسماء والعناوين وأرقام الهواتف وعناوين البريد الإلكتروني للعملاء المعتمدين وطبيعة وحجم\r\n    الأعمال التجارية، وطبيعة وحجم مخزون الإعلان الذي ينوي العميل المرخص شراءه أو\r\n    يبيع.</p>\r\n\r\n<h2>\r\n    ما هي المنظمات التي جمع المعلومات؟</h2>\r\n<br>\r\n<p>على الرغم من لدينا الفورية\r\n    مجموعة متنوعة من المعلومات، وموردي خدمات الطرف الثالث لدينا (مثل شركات بطاقات الائتمان، وغرف المقاصة، و\r\n    البنوك) التي قد تقدم أنواعًا من الخدمات مثل خدمات الائتمان والتأمين والضمان قد تجمع هذا المبلغ\r\n    المعلومات من زوارنا والعملاء المعتمدين. نحن لا نتحكم في كيفية استخدام هذه الأطراف الثالثة لذلك\r\n    المعلومات، لكننا نطلب منهم الكشف عن كيفية استخدامهم للمعلومات الشخصية المقدمة لهم من قبل الزوار و\r\n    العملاء المعتمدين. قد يكون جزء من هذه الأطراف الثالثة وسطاء يعملون فقط كروابط في\r\n    سلسلة التوزيع ولا تقم بتخزين أو الاحتفاظ أو استخدام المعلومات المقدمة لهم.</p>\r\n\r\n<h2>\r\n    كيف يستخدم الموقع معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>نحن نستخدم إمكانية التعرف على القطاع الخاص\r\n    المعلومات لتخصيص الموقع وتقديم عروض الخدمة المناسبة وإتمام عمليات البيع والشراء\r\n    توصيات على الموقع. قد نرسل بريدًا إلكترونيًا للزائرين والعملاء المعتمدين بشأن البحث أو الشراء و\r\n    فرص البيع على الموقع أو المعلومات المتعلقة بموضوع الموقع. قد نستخدمها أيضًا\r\n    معلومات التعريف الشخصية للاتصال بالزائرين والعملاء المعتمدين ردًا على أسئلة محددة\r\n    الاستفسارات أو تقديم المعلومات المطلوبة.</p>\r\n\r\n<h2>\r\n    الذين قد قد تكون مشتركة المعلومات؟</h2>\r\n<br>\r\n<p>معلومات التعرف الشخصية\r\n    قد يتم نقل معلومات حول العملاء المعتمدين إلى العملاء المعتمدين الآخرين الذين يرغبون في تقييم الإمكانات\r\n    المعاملات مع العملاء المعتمدين الآخرين. قد نشارك معلومات مجمعة عن زوارنا،\r\n    بما في ذلك التركيبة السكانية لزوارنا وعملائنا المعتمدين، مع الوكالات التابعة لنا و\r\n    بائعي الطرف الثالث. نحن نقدم بالإضافة إلى ذلك فرصة \"إلغاء الاشتراك\" للحصول على المعلومات أو الوجود\r\n    اتصلت بنا أو بواسطة أي وكالة تتصرف نيابة عنا.</p>\r\n\r\n<h2>\r\n    كيف يتم تخزين معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>معلومات التعرف الشخصية\r\n    يتم تخزينها بشكل آمن بواسطة هذا التطبيق ولا يمكن الوصول إليها من قبل أطراف ثالثة أو موظفي هذا التطبيق باستثناء\r\n    للاستخدام كما هو موضح سابقًا.</p>\r\n\r\n<h2>\r\n    ما هي الخيارات المتاحة للزوار فيما يتعلق بعرض المعلومات واستخدامها ونشرها؟</h2>\r\n<br>\r\n<p>الزوار والعملاء المعتمدين\r\n    قد تتوقف عن الحصول على معلومات عفوية منا أو الاتصال بنا و/أو البائعين التابعين لنا والشركات التابعة لنا\r\n    الوكالات عن طريق الرد على رسائل البريد الإلكتروني وفقًا للتعليمات، أو عن طريق الاتصال بنا.</p>\r\n\r\n<h2>\r\n    هل يتم استخدام ملفات تعريف الارتباط على الموقع؟</h2>\r\n<br>\r\n<p>يتم استخدام ملفات تعريف الارتباط لأسباب مختلفة.\r\n    نحن نستخدم ملفات تعريف الارتباط للحصول على معلومات حول تفضيلات زوارنا والخدمات التي يختارونها. نحن\r\n    استخدم أيضًا ملفات تعريف الارتباط لأغراض أمنية لحماية عملائنا المعتمدين. على سبيل المثال، إذا أذن\r\n    إذا قام العميل بتسجيل الدخول ولم يتم استخدام الموقع، فقد يقوم النظام تلقائيًا بتسجيل خروج العميل المصرح له.</p>\r\n\r\n<h2>\r\n    كيف يستخدم هذا التطبيق معلومات تسجيل الدخول؟</h2>\r\n<br>\r\n<p>يستخدم هذا التطبيق معلومات تسجيل الدخول،\r\n    بما في ذلك، على سبيل المثال لا الحصر، عناوين IP ومقدمي خدمات الإنترنت وأنواع المتصفحات، لتحليل الاتجاهات وإدارة الموقع،\r\n    تتبع حركة المستخدم واستخدامه، وتجميع معلومات ديموغرافية واسعة النطاق.</p>\r\n\r\n<h2>\r\n    ما هو الشركاء أو مقدمو الخدمات الذين يمكنهم الوصول إلى المعلومات الشخصية من الزوار و/أو\r\n    العملاء المعتمدين على الموقع؟</h2>\r\n<br>\r\n<p>وقد دخل هذا التطبيق في وسوف\r\n    الاستمرار في الدخول في شراكات وانتسابات أخرى مع عدد من البائعين. قد يكون لدى هؤلاء البائعين\r\n    الوصول إلى بعض معلومات التعريف الشخصية على أساس الحاجة إلى المعرفة لتقييم المصرح به\r\n    العملاء لأهلية الخدمة. لا تغطي سياسة الخصوصية الخاصة بنا جمعها أو استخدامها\r\n    معلومة. الكشف عن معلومات التعريف الشخصية للامتثال للقانون. سوف نكشف شخصيا\r\n    معلومات تعريفية من أجل الامتثال لأمر المحكمة أو أمر الاستدعاء أو طلب من جهة إنفاذ القانون\r\n    وكالة لنشر المعلومات. وسنكشف أيضًا عن معلومات التعريف الشخصية عندما يكون ذلك معقولًا\r\n    ضرورية لحماية حماية زوارنا وعملائنا المعتمدين.</p>\r\n\r\n<h2>\r\n    كيف يحافظ الموقع على معلومات التعريف الشخصية آمنة؟</h2>\r\n<br>\r\n<p>جميع ممثلينا على دراية\r\n    مع سياستنا وممارساتنا الأمنية. معلومات التعريف الشخصية لزوارنا والمصرح لهم\r\n    لا يمكن الوصول إلى العملاء إلا لعدد محدد مسبقًا من الموظفين المؤهلين الذين يتم منحهم كلمة مرور بالترتيب\r\n    لتحقيق الوصول إلى المعلومة. نقوم بمراجعة أنظمتنا وعملياتنا الأمنية بشكل دوري.\r\n    المعلومات الحساسة، على سبيل المثال، أرقام بطاقات الائتمان أو أرقام الضمان الاجتماعي، محمية بالتشفير\r\n    البروتوكولات المعمول بها لحماية المعلومات المرسلة عبر الإنترنت. في حين أننا نأخذ معقولة تجاريا\r\n    تدابير للحفاظ على موقع آمن، والاتصالات الإلكترونية وقواعد البيانات عرضة للأخطاء، والعبث،\r\n    والاقتحامات، ولا يمكننا أن نضمن أو نضمن عدم وقوع مثل هذه الأحداث ولن نكون مسؤولين عن ذلك\r\n    الزوار أو العملاء المعتمدين لأي من هذه الأحداث.</p>\r\n\r\n<h2>\r\n    كيف يمكن للزائرين تصحيح أي معلومات غير دقيقة في معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>يجوز للزوار والعملاء المعتمدين\r\n    مراسلتنا لتحديث معلومات التعريف الشخصية الخاصة بهم أو لتصحيح أي معلومات غير دقيقة عن طريق البريد الإلكتروني\r\n    لنا هنا. </p>\r\n\r\n<h2>\r\n    هل يمكن للزائر حذف أو إلغاء تنشيط معلومات التعريف الشخصية التي يجمعها الموقع؟</h2>\r\n<br>\r\n<p>نحن نقدم الزوار والمصرح لهم\r\n    العملاء مع آلية لمسح/إلغاء تنشيط معلومات التعريف الشخصية من قاعدة بيانات الموقع\r\n    الاتصال. ومع ذلك، بسبب النسخ الاحتياطية وسجلات الحذف، قد يكون من المستحيل حذف ملف\r\n    دخول الزائر دون الاحتفاظ ببعض المعلومات المتبقية. الشخص الذي يطلب أن يكون شخصيا\r\n    سيتم حذف معلومات التعريف التي تم إلغاء تنشيطها وظيفيًا، ولن نبيع،\r\n    نقل أو استخدام معلومات التعريف الشخصية المتعلقة بهذا الفرد بأي شكل من الأشكال للمضي قدمًا.</p>\r\n\r\n<h2>\r\n    ماذا يحدث إذا تغيرت سياسة الخصوصية؟</h2>\r\n<br>\r\n<p>سنخبر زوارنا وعملائنا المعتمدين بمعرفة ذلك\r\n    حول التغييرات التي تطرأ على سياسة الخصوصية الخاصة بنا عن طريق نشر هذه التغييرات على الموقع. ومع ذلك، على افتراض أننا\r\n    تغيير سياسة الخصوصية الخاصة بنا بطريقة قد تتسبب في الكشف عن معلومات التعريف الشخصية\r\n    طلب زائر أو عميل معتمد سابقًا عدم الكشف عنه، وسوف نقوم بالاتصال بهذا الزائر أو\r\n    العميل المعتمد بالسماح لهذا الزائر أو العميل المعتمد بمنع مثل هذا التعرض.</p>', 9, 'sa', '2023-12-24 10:15:15', '2023-12-24 16:15:15'),
(6, 'إعلان', '<h2>مقدمة:</h2>\r\n<br>\r\n<p>نحن ندرك أن الأمان عبر الإنترنت هو\r\n    أمر حيوي لعملاء موقعنا، خاصة أثناء قيادة الأعمال. هذا التأكيد يشرف على حمايتنا\r\n    الترتيبات المتعلقة بمستخدمي الموقع (الضيوف) الذين يقومون بالزيارة دون تنفيذ أعمال والزوار الذين\r\n    قم بالتسجيل لتنفيذ الأعمال على الموقع والاستفادة من الخدمات المختلفة التي يقدمها هذا التطبيق\r\n    (بشكل جماعي، الخدمات) (العملاء المعتمدون).</p>\r\n\r\n<h2>معلومات التعرف الشخصية</h2>\r\n<br>\r\n<p>يشير إلى أي معلومات ذلك\r\n    يحدد أو يمكن استخدامه لتحديد هوية الشخص الذي تتعلق به هذه المعلومات أو الاتصال به أو تحديد مكانه،\r\n    بما في ذلك، على سبيل المثال لا الحصر، الاسم والعنوان ورقم الهاتف ورقم الفاكس وعنوان البريد الإلكتروني والملفات المالية،\r\n    رقم الضمان الاجتماعي ومعلومات بطاقة الائتمان. في الواقع، المعلومات التي يمكن التعرف عليها تستبعد المعلومات\r\n    التي يتم جمعها بشكل مجهول (أي بدون تحديد هوية المستخدم الفردي) أو ديموغرافية\r\n    المعلومات غير المرتبطة بشخص معروف.</p>\r\n\r\n<h2>\r\n    ما هي معلومات التعريف الشخصية التي يتم جمعها؟</h2>\r\n<br>\r\n<p>قد نقوم بجمع ملف تعريف المستخدم الأساسي\r\n    المعلومات من جميع زوارنا. نقوم بجمع المعلومات الإضافية التالية من عملائنا المعتمدين:\r\n    الأسماء والعناوين وأرقام الهواتف وعناوين البريد الإلكتروني للعملاء المعتمدين وطبيعة وحجم\r\n    الأعمال التجارية، وطبيعة وحجم مخزون الإعلان الذي ينوي العميل المرخص شراءه أو\r\n    يبيع.</p>\r\n\r\n<h2>\r\n    ما هي المنظمات التي جمع المعلومات؟</h2>\r\n<br>\r\n<p>على الرغم من لدينا الفورية\r\n    مجموعة متنوعة من المعلومات، وموردي خدمات الطرف الثالث لدينا (مثل شركات بطاقات الائتمان، وغرف المقاصة، و\r\n    البنوك) التي قد تقدم أنواعًا من الخدمات مثل خدمات الائتمان والتأمين والضمان قد تجمع هذا المبلغ\r\n    المعلومات من زوارنا والعملاء المعتمدين. نحن لا نتحكم في كيفية استخدام هذه الأطراف الثالثة لذلك\r\n    المعلومات، لكننا نطلب منهم الكشف عن كيفية استخدامهم للمعلومات الشخصية المقدمة لهم من قبل الزوار و\r\n    العملاء المعتمدين. قد يكون جزء من هذه الأطراف الثالثة وسطاء يعملون فقط كروابط في\r\n    سلسلة التوزيع ولا تقم بتخزين أو الاحتفاظ أو استخدام المعلومات المقدمة لهم.</p>\r\n\r\n<h2>\r\n    كيف يستخدم الموقع معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>نحن نستخدم إمكانية التعرف على القطاع الخاص\r\n    المعلومات لتخصيص الموقع وتقديم عروض الخدمة المناسبة وإتمام عمليات البيع والشراء\r\n    توصيات على الموقع. قد نرسل بريدًا إلكترونيًا للزائرين والعملاء المعتمدين بشأن البحث أو الشراء و\r\n    فرص البيع على الموقع أو المعلومات المتعلقة بموضوع الموقع. قد نستخدمها أيضًا\r\n    معلومات التعريف الشخصية للاتصال بالزائرين والعملاء المعتمدين ردًا على أسئلة محددة\r\n    الاستفسارات أو تقديم المعلومات المطلوبة.</p>\r\n\r\n<h2>\r\n    الذين قد قد تكون مشتركة المعلومات؟</h2>\r\n<br>\r\n<p>معلومات التعرف الشخصية\r\n    قد يتم نقل معلومات حول العملاء المعتمدين إلى العملاء المعتمدين الآخرين الذين يرغبون في تقييم الإمكانات\r\n    المعاملات مع العملاء المعتمدين الآخرين. قد نشارك معلومات مجمعة عن زوارنا،\r\n    بما في ذلك التركيبة السكانية لزوارنا وعملائنا المعتمدين، مع الوكالات التابعة لنا و\r\n    بائعي الطرف الثالث. نحن نقدم بالإضافة إلى ذلك فرصة \"إلغاء الاشتراك\" للحصول على المعلومات أو الوجود\r\n    اتصلت بنا أو بواسطة أي وكالة تتصرف نيابة عنا.</p>\r\n\r\n<h2>\r\n    كيف يتم تخزين معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>معلومات التعرف الشخصية\r\n    يتم تخزينها بشكل آمن بواسطة هذا التطبيق ولا يمكن الوصول إليها من قبل أطراف ثالثة أو موظفي هذا التطبيق باستثناء\r\n    للاستخدام كما هو موضح سابقًا.</p>\r\n\r\n<h2>\r\n    ما هي الخيارات المتاحة للزوار فيما يتعلق بعرض المعلومات واستخدامها ونشرها؟</h2>\r\n<br>\r\n<p>الزوار والعملاء المعتمدين\r\n    قد تتوقف عن الحصول على معلومات عفوية منا أو الاتصال بنا و/أو البائعين التابعين لنا والشركات التابعة لنا\r\n    الوكالات عن طريق الرد على رسائل البريد الإلكتروني وفقًا للتعليمات، أو عن طريق الاتصال بنا.</p>\r\n\r\n<h2>\r\n    هل يتم استخدام ملفات تعريف الارتباط على الموقع؟</h2>\r\n<br>\r\n<p>يتم استخدام ملفات تعريف الارتباط لأسباب مختلفة.\r\n    نحن نستخدم ملفات تعريف الارتباط للحصول على معلومات حول تفضيلات زوارنا والخدمات التي يختارونها. نحن\r\n    استخدم أيضًا ملفات تعريف الارتباط لأغراض أمنية لحماية عملائنا المعتمدين. على سبيل المثال، إذا أذن\r\n    إذا قام العميل بتسجيل الدخول ولم يتم استخدام الموقع، فقد يقوم النظام تلقائيًا بتسجيل خروج العميل المصرح له.</p>\r\n\r\n<h2>\r\n    كيف يستخدم هذا التطبيق معلومات تسجيل الدخول؟</h2>\r\n<br>\r\n<p>يستخدم هذا التطبيق معلومات تسجيل الدخول،\r\n    بما في ذلك، على سبيل المثال لا الحصر، عناوين IP ومقدمي خدمات الإنترنت وأنواع المتصفحات، لتحليل الاتجاهات وإدارة الموقع،\r\n    تتبع حركة المستخدم واستخدامه، وتجميع معلومات ديموغرافية واسعة النطاق.</p>\r\n\r\n<h2>\r\n    ما هو الشركاء أو مقدمو الخدمات الذين يمكنهم الوصول إلى المعلومات الشخصية من الزوار و/أو\r\n    العملاء المعتمدين على الموقع؟</h2>\r\n<br>\r\n<p>وقد دخل هذا التطبيق في وسوف\r\n    الاستمرار في الدخول في شراكات وانتسابات أخرى مع عدد من البائعين. قد يكون لدى هؤلاء البائعين\r\n    الوصول إلى بعض معلومات التعريف الشخصية على أساس الحاجة إلى المعرفة لتقييم المصرح به\r\n    العملاء لأهلية الخدمة. لا تغطي سياسة الخصوصية الخاصة بنا جمعها أو استخدامها\r\n    معلومة. الكشف عن معلومات التعريف الشخصية للامتثال للقانون. سوف نكشف شخصيا\r\n    معلومات تعريفية من أجل الامتثال لأمر المحكمة أو أمر الاستدعاء أو طلب من جهة إنفاذ القانون\r\n    وكالة لنشر المعلومات. وسنكشف أيضًا عن معلومات التعريف الشخصية عندما يكون ذلك معقولًا\r\n    ضرورية لحماية حماية زوارنا وعملائنا المعتمدين.</p>\r\n\r\n<h2>\r\n    كيف يحافظ الموقع على معلومات التعريف الشخصية آمنة؟</h2>\r\n<br>\r\n<p>جميع ممثلينا على دراية\r\n    مع سياستنا وممارساتنا الأمنية. معلومات التعريف الشخصية لزوارنا والمصرح لهم\r\n    لا يمكن الوصول إلى العملاء إلا لعدد محدد مسبقًا من الموظفين المؤهلين الذين يتم منحهم كلمة مرور بالترتيب\r\n    لتحقيق الوصول إلى المعلومة. نقوم بمراجعة أنظمتنا وعملياتنا الأمنية بشكل دوري.\r\n    المعلومات الحساسة، على سبيل المثال، أرقام بطاقات الائتمان أو أرقام الضمان الاجتماعي، محمية بالتشفير\r\n    البروتوكولات المعمول بها لحماية المعلومات المرسلة عبر الإنترنت. في حين أننا نأخذ معقولة تجاريا\r\n    تدابير للحفاظ على موقع آمن، والاتصالات الإلكترونية وقواعد البيانات عرضة للأخطاء، والعبث،\r\n    والاقتحامات، ولا يمكننا أن نضمن أو نضمن عدم وقوع مثل هذه الأحداث ولن نكون مسؤولين عن ذلك\r\n    الزوار أو العملاء المعتمدين لأي من هذه الأحداث.</p>\r\n\r\n<h2>\r\n    كيف يمكن للزائرين تصحيح أي معلومات غير دقيقة في معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>يجوز للزوار والعملاء المعتمدين\r\n    مراسلتنا لتحديث معلومات التعريف الشخصية الخاصة بهم أو لتصحيح أي معلومات غير دقيقة عن طريق البريد الإلكتروني\r\n    لنا هنا. </p>\r\n\r\n<h2>\r\n    هل يمكن للزائر حذف أو إلغاء تنشيط معلومات التعريف الشخصية التي يجمعها الموقع؟</h2>\r\n<br>\r\n<p>نحن نقدم الزوار والمصرح لهم\r\n    العملاء مع آلية لمسح/إلغاء تنشيط معلومات التعريف الشخصية من قاعدة بيانات الموقع\r\n    الاتصال. ومع ذلك، بسبب النسخ الاحتياطية وسجلات الحذف، قد يكون من المستحيل حذف ملف\r\n    دخول الزائر دون الاحتفاظ ببعض المعلومات المتبقية. الشخص الذي يطلب أن يكون شخصيا\r\n    سيتم حذف معلومات التعريف التي تم إلغاء تنشيطها وظيفيًا، ولن نبيع،\r\n    نقل أو استخدام معلومات التعريف الشخصية المتعلقة بهذا الفرد بأي شكل من الأشكال للمضي قدمًا.</p>\r\n\r\n<h2>\r\n    ماذا يحدث إذا تغيرت سياسة الخصوصية؟</h2>\r\n<br>\r\n<p>سنخبر زوارنا وعملائنا المعتمدين بمعرفة ذلك\r\n    حول التغييرات التي تطرأ على سياسة الخصوصية الخاصة بنا عن طريق نشر هذه التغييرات على الموقع. ومع ذلك، على افتراض أننا\r\n    تغيير سياسة الخصوصية الخاصة بنا بطريقة قد تتسبب في الكشف عن معلومات التعريف الشخصية\r\n    طلب زائر أو عميل معتمد سابقًا عدم الكشف عنه، وسوف نقوم بالاتصال بهذا الزائر أو\r\n    العميل المعتمد بالسماح لهذا الزائر أو العميل المعتمد بمنع مثل هذا التعرض.</p>', 31, 'sa', '2023-12-24 16:15:54', '2023-12-24 16:15:54'),
(7, 'خط المساعدة', '<h2>مقدمة:</h2>\r\n<br>\r\n<p>نحن ندرك أن الأمان عبر الإنترنت هو\r\n    أمر حيوي لعملاء موقعنا، خاصة أثناء قيادة الأعمال. هذا التأكيد يشرف على حمايتنا\r\n    الترتيبات المتعلقة بمستخدمي الموقع (الضيوف) الذين يقومون بالزيارة دون تنفيذ أعمال والزوار الذين\r\n    قم بالتسجيل لتنفيذ الأعمال على الموقع والاستفادة من الخدمات المختلفة التي يقدمها هذا التطبيق\r\n    (بشكل جماعي، الخدمات) (العملاء المعتمدون).</p>\r\n\r\n<h2>معلومات التعرف الشخصية</h2>\r\n<br>\r\n<p>يشير إلى أي معلومات ذلك\r\n    يحدد أو يمكن استخدامه لتحديد هوية الشخص الذي تتعلق به هذه المعلومات أو الاتصال به أو تحديد مكانه،\r\n    بما في ذلك، على سبيل المثال لا الحصر، الاسم والعنوان ورقم الهاتف ورقم الفاكس وعنوان البريد الإلكتروني والملفات المالية،\r\n    رقم الضمان الاجتماعي ومعلومات بطاقة الائتمان. في الواقع، المعلومات التي يمكن التعرف عليها تستبعد المعلومات\r\n    التي يتم جمعها بشكل مجهول (أي بدون تحديد هوية المستخدم الفردي) أو ديموغرافية\r\n    المعلومات غير المرتبطة بشخص معروف.</p>\r\n\r\n<h2>\r\n    ما هي معلومات التعريف الشخصية التي يتم جمعها؟</h2>\r\n<br>\r\n<p>قد نقوم بجمع ملف تعريف المستخدم الأساسي\r\n    المعلومات من جميع زوارنا. نقوم بجمع المعلومات الإضافية التالية من عملائنا المعتمدين:\r\n    الأسماء والعناوين وأرقام الهواتف وعناوين البريد الإلكتروني للعملاء المعتمدين وطبيعة وحجم\r\n    الأعمال التجارية، وطبيعة وحجم مخزون الإعلان الذي ينوي العميل المرخص شراءه أو\r\n    يبيع.</p>\r\n\r\n<h2>\r\n    ما هي المنظمات التي جمع المعلومات؟</h2>\r\n<br>\r\n<p>على الرغم من لدينا الفورية\r\n    مجموعة متنوعة من المعلومات، وموردي خدمات الطرف الثالث لدينا (مثل شركات بطاقات الائتمان، وغرف المقاصة، و\r\n    البنوك) التي قد تقدم أنواعًا من الخدمات مثل خدمات الائتمان والتأمين والضمان قد تجمع هذا المبلغ\r\n    المعلومات من زوارنا والعملاء المعتمدين. نحن لا نتحكم في كيفية استخدام هذه الأطراف الثالثة لذلك\r\n    المعلومات، لكننا نطلب منهم الكشف عن كيفية استخدامهم للمعلومات الشخصية المقدمة لهم من قبل الزوار و\r\n    العملاء المعتمدين. قد يكون جزء من هذه الأطراف الثالثة وسطاء يعملون فقط كروابط في\r\n    سلسلة التوزيع ولا تقم بتخزين أو الاحتفاظ أو استخدام المعلومات المقدمة لهم.</p>\r\n\r\n<h2>\r\n    كيف يستخدم الموقع معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>نحن نستخدم إمكانية التعرف على القطاع الخاص\r\n    المعلومات لتخصيص الموقع وتقديم عروض الخدمة المناسبة وإتمام عمليات البيع والشراء\r\n    توصيات على الموقع. قد نرسل بريدًا إلكترونيًا للزائرين والعملاء المعتمدين بشأن البحث أو الشراء و\r\n    فرص البيع على الموقع أو المعلومات المتعلقة بموضوع الموقع. قد نستخدمها أيضًا\r\n    معلومات التعريف الشخصية للاتصال بالزائرين والعملاء المعتمدين ردًا على أسئلة محددة\r\n    الاستفسارات أو تقديم المعلومات المطلوبة.</p>\r\n\r\n<h2>\r\n    الذين قد قد تكون مشتركة المعلومات؟</h2>\r\n<br>\r\n<p>معلومات التعرف الشخصية\r\n    قد يتم نقل معلومات حول العملاء المعتمدين إلى العملاء المعتمدين الآخرين الذين يرغبون في تقييم الإمكانات\r\n    المعاملات مع العملاء المعتمدين الآخرين. قد نشارك معلومات مجمعة عن زوارنا،\r\n    بما في ذلك التركيبة السكانية لزوارنا وعملائنا المعتمدين، مع الوكالات التابعة لنا و\r\n    بائعي الطرف الثالث. نحن نقدم بالإضافة إلى ذلك فرصة \"إلغاء الاشتراك\" للحصول على المعلومات أو الوجود\r\n    اتصلت بنا أو بواسطة أي وكالة تتصرف نيابة عنا.</p>\r\n\r\n<h2>\r\n    كيف يتم تخزين معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>معلومات التعرف الشخصية\r\n    يتم تخزينها بشكل آمن بواسطة هذا التطبيق ولا يمكن الوصول إليها من قبل أطراف ثالثة أو موظفي هذا التطبيق باستثناء\r\n    للاستخدام كما هو موضح سابقًا.</p>\r\n\r\n<h2>\r\n    ما هي الخيارات المتاحة للزوار فيما يتعلق بعرض المعلومات واستخدامها ونشرها؟</h2>\r\n<br>\r\n<p>الزوار والعملاء المعتمدين\r\n    قد تتوقف عن الحصول على معلومات عفوية منا أو الاتصال بنا و/أو البائعين التابعين لنا والشركات التابعة لنا\r\n    الوكالات عن طريق الرد على رسائل البريد الإلكتروني وفقًا للتعليمات، أو عن طريق الاتصال بنا.</p>\r\n\r\n<h2>\r\n    هل يتم استخدام ملفات تعريف الارتباط على الموقع؟</h2>\r\n<br>\r\n<p>يتم استخدام ملفات تعريف الارتباط لأسباب مختلفة.\r\n    نحن نستخدم ملفات تعريف الارتباط للحصول على معلومات حول تفضيلات زوارنا والخدمات التي يختارونها. نحن\r\n    استخدم أيضًا ملفات تعريف الارتباط لأغراض أمنية لحماية عملائنا المعتمدين. على سبيل المثال، إذا أذن\r\n    إذا قام العميل بتسجيل الدخول ولم يتم استخدام الموقع، فقد يقوم النظام تلقائيًا بتسجيل خروج العميل المصرح له.</p>\r\n\r\n<h2>\r\n    كيف يستخدم هذا التطبيق معلومات تسجيل الدخول؟</h2>\r\n<br>\r\n<p>يستخدم هذا التطبيق معلومات تسجيل الدخول،\r\n    بما في ذلك، على سبيل المثال لا الحصر، عناوين IP ومقدمي خدمات الإنترنت وأنواع المتصفحات، لتحليل الاتجاهات وإدارة الموقع،\r\n    تتبع حركة المستخدم واستخدامه، وتجميع معلومات ديموغرافية واسعة النطاق.</p>\r\n\r\n<h2>\r\n    ما هو الشركاء أو مقدمو الخدمات الذين يمكنهم الوصول إلى المعلومات الشخصية من الزوار و/أو\r\n    العملاء المعتمدين على الموقع؟</h2>\r\n<br>\r\n<p>وقد دخل هذا التطبيق في وسوف\r\n    الاستمرار في الدخول في شراكات وانتسابات أخرى مع عدد من البائعين. قد يكون لدى هؤلاء البائعين\r\n    الوصول إلى بعض معلومات التعريف الشخصية على أساس الحاجة إلى المعرفة لتقييم المصرح به\r\n    العملاء لأهلية الخدمة. لا تغطي سياسة الخصوصية الخاصة بنا جمعها أو استخدامها\r\n    معلومة. الكشف عن معلومات التعريف الشخصية للامتثال للقانون. سوف نكشف شخصيا\r\n    معلومات تعريفية من أجل الامتثال لأمر المحكمة أو أمر الاستدعاء أو طلب من جهة إنفاذ القانون\r\n    وكالة لنشر المعلومات. وسنكشف أيضًا عن معلومات التعريف الشخصية عندما يكون ذلك معقولًا\r\n    ضرورية لحماية حماية زوارنا وعملائنا المعتمدين.</p>\r\n\r\n<h2>\r\n    كيف يحافظ الموقع على معلومات التعريف الشخصية آمنة؟</h2>\r\n<br>\r\n<p>جميع ممثلينا على دراية\r\n    مع سياستنا وممارساتنا الأمنية. معلومات التعريف الشخصية لزوارنا والمصرح لهم\r\n    لا يمكن الوصول إلى العملاء إلا لعدد محدد مسبقًا من الموظفين المؤهلين الذين يتم منحهم كلمة مرور بالترتيب\r\n    لتحقيق الوصول إلى المعلومة. نقوم بمراجعة أنظمتنا وعملياتنا الأمنية بشكل دوري.\r\n    المعلومات الحساسة، على سبيل المثال، أرقام بطاقات الائتمان أو أرقام الضمان الاجتماعي، محمية بالتشفير\r\n    البروتوكولات المعمول بها لحماية المعلومات المرسلة عبر الإنترنت. في حين أننا نأخذ معقولة تجاريا\r\n    تدابير للحفاظ على موقع آمن، والاتصالات الإلكترونية وقواعد البيانات عرضة للأخطاء، والعبث،\r\n    والاقتحامات، ولا يمكننا أن نضمن أو نضمن عدم وقوع مثل هذه الأحداث ولن نكون مسؤولين عن ذلك\r\n    الزوار أو العملاء المعتمدين لأي من هذه الأحداث.</p>\r\n\r\n<h2>\r\n    كيف يمكن للزائرين تصحيح أي معلومات غير دقيقة في معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>يجوز للزوار والعملاء المعتمدين\r\n    مراسلتنا لتحديث معلومات التعريف الشخصية الخاصة بهم أو لتصحيح أي معلومات غير دقيقة عن طريق البريد الإلكتروني\r\n    لنا هنا. </p>\r\n\r\n<h2>\r\n    هل يمكن للزائر حذف أو إلغاء تنشيط معلومات التعريف الشخصية التي يجمعها الموقع؟</h2>\r\n<br>\r\n<p>نحن نقدم الزوار والمصرح لهم\r\n    العملاء مع آلية لمسح/إلغاء تنشيط معلومات التعريف الشخصية من قاعدة بيانات الموقع\r\n    الاتصال. ومع ذلك، بسبب النسخ الاحتياطية وسجلات الحذف، قد يكون من المستحيل حذف ملف\r\n    دخول الزائر دون الاحتفاظ ببعض المعلومات المتبقية. الشخص الذي يطلب أن يكون شخصيا\r\n    سيتم حذف معلومات التعريف التي تم إلغاء تنشيطها وظيفيًا، ولن نبيع،\r\n    نقل أو استخدام معلومات التعريف الشخصية المتعلقة بهذا الفرد بأي شكل من الأشكال للمضي قدمًا.</p>\r\n\r\n<h2>\r\n    ماذا يحدث إذا تغيرت سياسة الخصوصية؟</h2>\r\n<br>\r\n<p>سنخبر زوارنا وعملائنا المعتمدين بمعرفة ذلك\r\n    حول التغييرات التي تطرأ على سياسة الخصوصية الخاصة بنا عن طريق نشر هذه التغييرات على الموقع. ومع ذلك، على افتراض أننا\r\n    تغيير سياسة الخصوصية الخاصة بنا بطريقة قد تتسبب في الكشف عن معلومات التعريف الشخصية\r\n    طلب زائر أو عميل معتمد سابقًا عدم الكشف عنه، وسوف نقوم بالاتصال بهذا الزائر أو\r\n    العميل المعتمد بالسماح لهذا الزائر أو العميل المعتمد بمنع مثل هذا التعرض.</p>', 32, 'sa', '2023-12-24 16:17:55', '2023-12-24 16:17:55'),
(8, 'البنود و الظروف', '<h2>مقدمة:</h2>\r\n<br>\r\n<p>نحن ندرك أن الأمان عبر الإنترنت هو\r\n    أمر حيوي لعملاء موقعنا، خاصة أثناء قيادة الأعمال. هذا التأكيد يشرف على حمايتنا\r\n    الترتيبات المتعلقة بمستخدمي الموقع (الضيوف) الذين يقومون بالزيارة دون تنفيذ أعمال والزوار الذين\r\n    قم بالتسجيل لتنفيذ الأعمال على الموقع والاستفادة من الخدمات المختلفة التي يقدمها هذا التطبيق\r\n    (بشكل جماعي، الخدمات) (العملاء المعتمدون).</p>\r\n\r\n<h2>معلومات التعرف الشخصية</h2>\r\n<br>\r\n<p>يشير إلى أي معلومات ذلك\r\n    يحدد أو يمكن استخدامه لتحديد هوية الشخص الذي تتعلق به هذه المعلومات أو الاتصال به أو تحديد مكانه،\r\n    بما في ذلك، على سبيل المثال لا الحصر، الاسم والعنوان ورقم الهاتف ورقم الفاكس وعنوان البريد الإلكتروني والملفات المالية،\r\n    رقم الضمان الاجتماعي ومعلومات بطاقة الائتمان. في الواقع، المعلومات التي يمكن التعرف عليها تستبعد المعلومات\r\n    التي يتم جمعها بشكل مجهول (أي بدون تحديد هوية المستخدم الفردي) أو ديموغرافية\r\n    المعلومات غير المرتبطة بشخص معروف.</p>\r\n\r\n<h2>\r\n    ما هي معلومات التعريف الشخصية التي يتم جمعها؟</h2>\r\n<br>\r\n<p>قد نقوم بجمع ملف تعريف المستخدم الأساسي\r\n    المعلومات من جميع زوارنا. نقوم بجمع المعلومات الإضافية التالية من عملائنا المعتمدين:\r\n    الأسماء والعناوين وأرقام الهواتف وعناوين البريد الإلكتروني للعملاء المعتمدين وطبيعة وحجم\r\n    الأعمال التجارية، وطبيعة وحجم مخزون الإعلان الذي ينوي العميل المرخص شراءه أو\r\n    يبيع.</p>\r\n\r\n<h2>\r\n    ما هي المنظمات التي جمع المعلومات؟</h2>\r\n<br>\r\n<p>على الرغم من لدينا الفورية\r\n    مجموعة متنوعة من المعلومات، وموردي خدمات الطرف الثالث لدينا (مثل شركات بطاقات الائتمان، وغرف المقاصة، و\r\n    البنوك) التي قد تقدم أنواعًا من الخدمات مثل خدمات الائتمان والتأمين والضمان قد تجمع هذا المبلغ\r\n    المعلومات من زوارنا والعملاء المعتمدين. نحن لا نتحكم في كيفية استخدام هذه الأطراف الثالثة لذلك\r\n    المعلومات، لكننا نطلب منهم الكشف عن كيفية استخدامهم للمعلومات الشخصية المقدمة لهم من قبل الزوار و\r\n    العملاء المعتمدين. قد يكون جزء من هذه الأطراف الثالثة وسطاء يعملون فقط كروابط في\r\n    سلسلة التوزيع ولا تقم بتخزين أو الاحتفاظ أو استخدام المعلومات المقدمة لهم.</p>\r\n\r\n<h2>\r\n    كيف يستخدم الموقع معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>نحن نستخدم إمكانية التعرف على القطاع الخاص\r\n    المعلومات لتخصيص الموقع وتقديم عروض الخدمة المناسبة وإتمام عمليات البيع والشراء\r\n    توصيات على الموقع. قد نرسل بريدًا إلكترونيًا للزائرين والعملاء المعتمدين بشأن البحث أو الشراء و\r\n    فرص البيع على الموقع أو المعلومات المتعلقة بموضوع الموقع. قد نستخدمها أيضًا\r\n    معلومات التعريف الشخصية للاتصال بالزائرين والعملاء المعتمدين ردًا على أسئلة محددة\r\n    الاستفسارات أو تقديم المعلومات المطلوبة.</p>\r\n\r\n<h2>\r\n    الذين قد قد تكون مشتركة المعلومات؟</h2>\r\n<br>\r\n<p>معلومات التعرف الشخصية\r\n    قد يتم نقل معلومات حول العملاء المعتمدين إلى العملاء المعتمدين الآخرين الذين يرغبون في تقييم الإمكانات\r\n    المعاملات مع العملاء المعتمدين الآخرين. قد نشارك معلومات مجمعة عن زوارنا،\r\n    بما في ذلك التركيبة السكانية لزوارنا وعملائنا المعتمدين، مع الوكالات التابعة لنا و\r\n    بائعي الطرف الثالث. نحن نقدم بالإضافة إلى ذلك فرصة \"إلغاء الاشتراك\" للحصول على المعلومات أو الوجود\r\n    اتصلت بنا أو بواسطة أي وكالة تتصرف نيابة عنا.</p>\r\n\r\n<h2>\r\n    كيف يتم تخزين معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>معلومات التعرف الشخصية\r\n    يتم تخزينها بشكل آمن بواسطة هذا التطبيق ولا يمكن الوصول إليها من قبل أطراف ثالثة أو موظفي هذا التطبيق باستثناء\r\n    للاستخدام كما هو موضح سابقًا.</p>\r\n\r\n<h2>\r\n    ما هي الخيارات المتاحة للزوار فيما يتعلق بعرض المعلومات واستخدامها ونشرها؟</h2>\r\n<br>\r\n<p>الزوار والعملاء المعتمدين\r\n    قد تتوقف عن الحصول على معلومات عفوية منا أو الاتصال بنا و/أو البائعين التابعين لنا والشركات التابعة لنا\r\n    الوكالات عن طريق الرد على رسائل البريد الإلكتروني وفقًا للتعليمات، أو عن طريق الاتصال بنا.</p>\r\n\r\n<h2>\r\n    هل يتم استخدام ملفات تعريف الارتباط على الموقع؟</h2>\r\n<br>\r\n<p>يتم استخدام ملفات تعريف الارتباط لأسباب مختلفة.\r\n    نحن نستخدم ملفات تعريف الارتباط للحصول على معلومات حول تفضيلات زوارنا والخدمات التي يختارونها. نحن\r\n    استخدم أيضًا ملفات تعريف الارتباط لأغراض أمنية لحماية عملائنا المعتمدين. على سبيل المثال، إذا أذن\r\n    إذا قام العميل بتسجيل الدخول ولم يتم استخدام الموقع، فقد يقوم النظام تلقائيًا بتسجيل خروج العميل المصرح له.</p>\r\n\r\n<h2>\r\n    كيف يستخدم هذا التطبيق معلومات تسجيل الدخول؟</h2>\r\n<br>\r\n<p>يستخدم هذا التطبيق معلومات تسجيل الدخول،\r\n    بما في ذلك، على سبيل المثال لا الحصر، عناوين IP ومقدمي خدمات الإنترنت وأنواع المتصفحات، لتحليل الاتجاهات وإدارة الموقع،\r\n    تتبع حركة المستخدم واستخدامه، وتجميع معلومات ديموغرافية واسعة النطاق.</p>\r\n\r\n<h2>\r\n    ما هو الشركاء أو مقدمو الخدمات الذين يمكنهم الوصول إلى المعلومات الشخصية من الزوار و/أو\r\n    العملاء المعتمدين على الموقع؟</h2>\r\n<br>\r\n<p>وقد دخل هذا التطبيق في وسوف\r\n    الاستمرار في الدخول في شراكات وانتسابات أخرى مع عدد من البائعين. قد يكون لدى هؤلاء البائعين\r\n    الوصول إلى بعض معلومات التعريف الشخصية على أساس الحاجة إلى المعرفة لتقييم المصرح به\r\n    العملاء لأهلية الخدمة. لا تغطي سياسة الخصوصية الخاصة بنا جمعها أو استخدامها\r\n    معلومة. الكشف عن معلومات التعريف الشخصية للامتثال للقانون. سوف نكشف شخصيا\r\n    معلومات تعريفية من أجل الامتثال لأمر المحكمة أو أمر الاستدعاء أو طلب من جهة إنفاذ القانون\r\n    وكالة لنشر المعلومات. وسنكشف أيضًا عن معلومات التعريف الشخصية عندما يكون ذلك معقولًا\r\n    ضرورية لحماية حماية زوارنا وعملائنا المعتمدين.</p>\r\n\r\n<h2>\r\n    كيف يحافظ الموقع على معلومات التعريف الشخصية آمنة؟</h2>\r\n<br>\r\n<p>جميع ممثلينا على دراية\r\n    مع سياستنا وممارساتنا الأمنية. معلومات التعريف الشخصية لزوارنا والمصرح لهم\r\n    لا يمكن الوصول إلى العملاء إلا لعدد محدد مسبقًا من الموظفين المؤهلين الذين يتم منحهم كلمة مرور بالترتيب\r\n    لتحقيق الوصول إلى المعلومة. نقوم بمراجعة أنظمتنا وعملياتنا الأمنية بشكل دوري.\r\n    المعلومات الحساسة، على سبيل المثال، أرقام بطاقات الائتمان أو أرقام الضمان الاجتماعي، محمية بالتشفير\r\n    البروتوكولات المعمول بها لحماية المعلومات المرسلة عبر الإنترنت. في حين أننا نأخذ معقولة تجاريا\r\n    تدابير للحفاظ على موقع آمن، والاتصالات الإلكترونية وقواعد البيانات عرضة للأخطاء، والعبث،\r\n    والاقتحامات، ولا يمكننا أن نضمن أو نضمن عدم وقوع مثل هذه الأحداث ولن نكون مسؤولين عن ذلك\r\n    الزوار أو العملاء المعتمدين لأي من هذه الأحداث.</p>\r\n\r\n<h2>\r\n    كيف يمكن للزائرين تصحيح أي معلومات غير دقيقة في معلومات التعريف الشخصية؟</h2>\r\n<br>\r\n<p>يجوز للزوار والعملاء المعتمدين\r\n    مراسلتنا لتحديث معلومات التعريف الشخصية الخاصة بهم أو لتصحيح أي معلومات غير دقيقة عن طريق البريد الإلكتروني\r\n    لنا هنا. </p>\r\n\r\n<h2>\r\n    هل يمكن للزائر حذف أو إلغاء تنشيط معلومات التعريف الشخصية التي يجمعها الموقع؟</h2>\r\n<br>\r\n<p>نحن نقدم الزوار والمصرح لهم\r\n    العملاء مع آلية لمسح/إلغاء تنشيط معلومات التعريف الشخصية من قاعدة بيانات الموقع\r\n    الاتصال. ومع ذلك، بسبب النسخ الاحتياطية وسجلات الحذف، قد يكون من المستحيل حذف ملف\r\n    دخول الزائر دون الاحتفاظ ببعض المعلومات المتبقية. الشخص الذي يطلب أن يكون شخصيا\r\n    سيتم حذف معلومات التعريف التي تم إلغاء تنشيطها وظيفيًا، ولن نبيع،\r\n    نقل أو استخدام معلومات التعريف الشخصية المتعلقة بهذا الفرد بأي شكل من الأشكال للمضي قدمًا.</p>\r\n\r\n<h2>\r\n    ماذا يحدث إذا تغيرت سياسة الخصوصية؟</h2>\r\n<br>\r\n<p>سنخبر زوارنا وعملائنا المعتمدين بمعرفة ذلك\r\n    حول التغييرات التي تطرأ على سياسة الخصوصية الخاصة بنا عن طريق نشر هذه التغييرات على الموقع. ومع ذلك، على افتراض أننا\r\n    تغيير سياسة الخصوصية الخاصة بنا بطريقة قد تتسبب في الكشف عن معلومات التعريف الشخصية\r\n    طلب زائر أو عميل معتمد سابقًا عدم الكشف عنه، وسوف نقوم بالاتصال بهذا الزائر أو\r\n    العميل المعتمد بالسماح لهذا الزائر أو العميل المعتمد بمنع مثل هذا التعرض.</p>', 33, 'sa', '2023-12-24 16:19:00', '2023-12-24 16:19:00');

-- --------------------------------------------------------

--
-- Table structure for table `tl_plugins`
--

CREATE TABLE `tl_plugins` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `location` varchar(150) DEFAULT NULL,
  `author` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `version` varchar(11) NOT NULL DEFAULT '1',
  `unique_indentifier` text NOT NULL,
  `is_activated` int(10) NOT NULL,
  `namespace` varchar(150) NOT NULL,
  `url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tl_plugins`
--

INSERT INTO `tl_plugins` (`id`, `name`, `location`, `author`, `description`, `version`, `unique_indentifier`, `is_activated`, `namespace`, `url`, `created_at`, `updated_at`) VALUES
(39, 'Demo Plugin', 'demo-plugin', 'Themelooks', 'Demo Plugin for CMSLooks', '1.0', 'xxCtN1kNseh5suW', 1, 'Plugin\\DemoPlugin\\', 'http://www.themelooks.com/', '2023-07-15 11:13:43', '2023-07-16 04:49:18'),
(48, 'Newslooks Page Builder', 'newslooks-pagebuilder', 'Themelooks', 'Page Builder Plugin for Newslooks', '1.0', '5Z3Q4IZiKADfcIm', 1, 'Plugin\\NewslooksPageBuilder\\', 'http://www.themelooks.com/', '2023-10-19 12:09:04', '2023-10-19 06:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `tl_sidebar_has_widgets`
--

CREATE TABLE `tl_sidebar_has_widgets` (
  `id` int(11) NOT NULL,
  `sidebar_id` int(11) DEFAULT NULL,
  `widget_id` bigint(20) DEFAULT NULL,
  `order` bigint(20) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_sidebar_has_widgets`
--

INSERT INTO `tl_sidebar_has_widgets` (`id`, `sidebar_id`, `widget_id`, `order`) VALUES
(849, 9, 111, 6),
(850, 9, 110, 7),
(852, 9, 114, 1),
(854, 9, 115, 4),
(855, 9, 116, 3),
(856, 9, 108, 2),
(857, 9, 118, 5),
(862, 10, 121, 6),
(874, 13, 119, 1),
(875, 13, 120, 2),
(876, 13, 121, 3),
(877, 10, 108, 2),
(878, 10, 113, 7),
(879, 10, 115, 5),
(880, 10, 111, 8),
(882, 10, 114, 1),
(883, 10, 116, 4),
(884, 10, 117, 3),
(885, 10, 118, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tl_sidebar_widget_has_translate_values`
--

CREATE TABLE `tl_sidebar_widget_has_translate_values` (
  `id` int(11) NOT NULL,
  `value` longtext DEFAULT NULL,
  `sidebar_widget_has_values_id` int(11) DEFAULT NULL,
  `lang` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_sidebar_widget_has_translate_values`
--

INSERT INTO `tl_sidebar_widget_has_translate_values` (`id`, `value`, `sidebar_widget_has_values_id`, `lang`, `created_at`, `updated_at`) VALUES
(52, '{\"widget_title\":\"\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0639\\u0646\\u0627\",\"description\":\"\\u0646\\u062d\\u0646 \\u0628\\u0648\\u0627\\u0628\\u0629 \\u0627\\u0644\\u0623\\u062e\\u0628\\u0627\\u0631 \\u0627\\u0644\\u0623\\u0643\\u062b\\u0631 \\u0634\\u0639\\u0628\\u064a\\u0629 \\u0641\\u064a \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645. \\u0647\\u0646\\u0627 \\u0646\\u0646\\u0634\\u0631 \\u062c\\u0645\\u064a\\u0639 \\u0623\\u0646\\u0648\\u0627\\u0639 \\u0622\\u062e\\u0631 \\u0627\\u0644\\u0623\\u062e\\u0628\\u0627\\u0631.\",\"address\":\"53 \\u0637\\u0631\\u064a\\u0642 \\u0627\\u0644\\u0645\\u0637\\u0631\\u060c \\u062c\\u0646\\u0627\\u062d 41 \\u0623\\u0648\\u0633\\u062a\\u0646\\u060c \\u0646\\u064a\\u0648\\u064a\\u0648\\u0631\\u0643\\u060c \\u0627\\u0644\\u0648\\u0644\\u0627\\u064a\\u0627\\u062a \\u0627\\u0644\\u0645\\u062a\\u062d\\u062f\\u0629 \\u0627\\u0644\\u0623\\u0645\\u0631\\u064a\\u0643\\u064a\\u0629\"}', 231, 'sa', '2023-12-26 18:03:15', '2023-12-26 18:03:15'),
(53, '{\"widget_title\":\"\\u0634\\u0631\\u0643\\u0629\"}', 232, 'sa', '2023-12-26 18:03:39', '2023-12-26 18:03:39'),
(54, '{\"widget_title\":\"\\u0645\\u0634\\u0627\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0635\\u0648\\u0631\\u0629\"}', 233, 'sa', '2023-12-26 18:04:05', '2023-12-26 18:04:05'),
(55, '{\"search_placeholder\":\"\\u0628\\u062d\\u062b \\u0641\\u064a \\u0627\\u0644\\u0623\\u062e\\u0628\\u0627\\u0631\"}', 209, 'sa', '2023-12-26 18:40:17', '2023-12-26 18:40:17'),
(56, '{\"widget_title\":\"\\u0627\\u0644\\u0642\\u0637\\u0639\\u0629 \\u0627\\u0644\\u0641\\u0626\\u0629\"}', 206, 'sa', '2023-12-26 18:40:29', '2023-12-26 18:40:29'),
(57, '{\"widget_title\":\"\\u062a\\u0627\\u0628\\u0639\\u0646\\u0627 \\u0647\\u0646\\u0627\"}', 213, 'sa', '2023-12-26 18:40:50', '2023-12-26 18:40:50'),
(58, '{\"widget_title\":\"\\u0627\\u0644\\u0642\\u0637\\u0639\\u0629 \\u0627\\u0644\\u0645\\u062f\\u0648\\u0646\\u0629\"}', 211, 'sa', '2023-12-26 18:41:36', '2023-12-26 18:41:36'),
(59, '{\"widget_title\":\"\\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0642 \\u0627\\u0644\\u0623\\u062e\\u064a\\u0631\"}', 241, 'sa', '2023-12-27 15:12:24', '2023-12-27 15:12:24'),
(60, '{\"search_placeholder\":\"\\u0628\\u062d\\u062b \\u0641\\u064a \\u0627\\u0644\\u0623\\u062e\\u0628\\u0627\\u0631\"}', 242, 'sa', '2023-12-27 17:06:17', '2023-12-27 17:06:17'),
(61, '{\"widget_title\":\"\\u062a\\u0627\\u0628\\u0639\\u0646\\u0627\"}', 234, 'sa', '2023-12-27 17:06:38', '2023-12-27 17:06:38'),
(62, '{\"widget_title\":\"\\u0627\\u0644\\u062a\\u0635\\u0648\\u064a\\u062a \\u0644\\u0644\\u0628\\u0637\\u0644\"}', 240, 'sa', '2023-12-27 17:06:50', '2023-12-27 17:06:50'),
(63, '{\"widget_title\":\"\\u0623\\u062e\\u0628\\u0627\\u0631 \\u062d\\u062f\\u064a\\u062b\\u0629\"}', 235, 'sa', '2023-12-27 17:07:14', '2023-12-27 17:07:14'),
(64, '{\"widget_title\":\"\\u0635\\u0627\\u0644\\u0629 \\u0639\\u0631\\u0636\"}', 218, 'sa', '2023-12-27 17:07:52', '2023-12-27 17:07:52'),
(65, '{\"newsletter_title\":\"\\u0627\\u062d\\u0635\\u0644 \\u0639\\u0644\\u0649 \\u0622\\u062e\\u0631 \\u0627\\u0644\\u0623\\u062e\\u0628\\u0627\\u0631\",\"newsletter_subtitle\":\"\\u0627\\u0634\\u062a\\u0631\\u0643 \\u0641\\u064a \\u0627\\u0644\\u0646\\u0634\\u0631\\u0629 \\u0627\\u0644\\u0625\\u062e\\u0628\\u0627\\u0631\\u064a\\u0629 \\u0644\\u062f\\u064a\\u0646\\u0627 \\u0644\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u0622\\u062e\\u0631 \\u0627\\u0644\\u0623\\u062e\\u0628\\u0627\\u0631 \\u0648\\u0627\\u0644\\u062a\\u062d\\u062f\\u064a\\u062b\\u0627\\u062a \\u0627\\u0644\\u062d\\u0635\\u0631\\u064a\\u0629.\",\"email_placeholder\":\"\\u0623\\u062f\\u062e\\u0644 \\u0627\\u0644\\u0628\\u0631\\u064a\\u062f \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a\",\"button_text\":\"\\u064a\\u0634\\u062a\\u0631\\u0643\"}', 236, 'sa', '2023-12-27 17:08:25', '2023-12-27 17:08:25'),
(66, '{\"widget_title\":\"\\u0623\\u0647\\u0645 \\u0627\\u0644\\u0641\\u0626\\u0627\\u062a\"}', 237, 'sa', '2023-12-27 17:08:39', '2023-12-27 17:08:39'),
(67, '{\"widget_title\":\"\\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0642 \\u0627\\u0644\\u0623\\u062e\\u064a\\u0631\"}', 214, 'sa', '2023-12-27 17:09:34', '2023-12-27 17:09:34'),
(68, '{\"widget_title\":\"\\u0627\\u0644\\u0643\\u0644\\u0645\\u0627\\u062a \\u0627\\u0644\\u0634\\u0639\\u0628\\u064a\\u0629\"}', 207, 'sa', '2023-12-27 17:50:01', '2023-12-27 17:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `tl_sidebar_widget_has_values`
--

CREATE TABLE `tl_sidebar_widget_has_values` (
  `id` int(11) NOT NULL,
  `sidebar_has_widget_id` int(11) DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_sidebar_widget_has_values`
--

INSERT INTO `tl_sidebar_widget_has_values` (`id`, `sidebar_has_widget_id`, `value`) VALUES
(204, 846, '{\"widget_title\":\"Blog Engrushu\",\"number_of_blogs\":\"3\",\"type_of_blogs\":\"recent\"}'),
(205, 847, '{\"widget_title\":\"About Me\",\"author_id\":\"1\",\"author_designation\":\"CEO of Bangladesh\",\"author_image\":\"1074\"}'),
(206, 849, '{\"widget_title\":\"Category Widget\",\"number_of_category\":\"5\"}'),
(207, 850, '{\"widget_title\":\"Popular Tags\",\"number_of_tags\":\"8\"}'),
(208, 851, '{\"ads_image\":\"1072\",\"ads_url\":\"\\/\",\"google_adsence_sidebar\":\"\"}'),
(209, 852, '{\"search_placeholder\":\"Search News\"}'),
(210, 853, '{\"newsletter_title\":\"Get Our News\",\"newsletter_subtitle\":\"Get The Latest News of Newslooks and Get Stoned\",\"email_placeholder\":\"Enter Email\",\"button_text\":\"Subscribe\"}'),
(211, 854, '{\"widget_title\":\"Blog Widget\",\"number_of_blogs\":\"4\",\"type_of_blogs\":\"most_view\"}'),
(212, 855, '{\"number_of_blogs\":\"3\"}'),
(213, 856, '{\"widget_title\":\"Follow Us Here\"}'),
(214, 857, '{\"widget_title\":\"Recent Comment\",\"number_of_comments\":\"3\"}'),
(215, 858, '{\"widget_title\":\"Online Voting\",\"vote_id\":\"1\"}'),
(216, 859, '{\"widget_title\":\"Best Footballer\",\"vote_id\":\"5\"}'),
(217, 860, '{\"widget_title\":\"ABOUT US\",\"description\":\"We are the most popular news portal in the world. Here we publish all kinds of the latest news.\",\"address\":\"27 Division St, New York, NY 1002 United States of America\",\"mail\":\"support@example.test\",\"phone\":\"+96-321-111-222\"}'),
(218, 862, '{\"widget_title\":\"Gallery\",\"blog_type\":\"recent\"}'),
(219, 861, '{\"widget_title\":\"Important Links\",\"menu_group_id\":\"26\"}'),
(220, 863, '{\"widget_title\":\"Best Author\",\"author_id\":\"1\",\"author_designation\":\"SEO Specilist\",\"author_image\":\"1074\"}'),
(221, 864, '{\"widget_title\":\"Follow Us Here\"}'),
(222, 865, '{\"widget_title\":\"Popular Tags\",\"number_of_tags\":\"15\"}'),
(223, 866, '{\"widget_title\":\"Top Categories\",\"number_of_category\":\"5\"}'),
(224, 867, '{\"ads_image\":\"1072\",\"ads_url\":\"\\/\",\"google_adsence_sidebar\":\"\"}'),
(225, 868, '{\"newsletter_title\":\"Newsletter\",\"newsletter_subtitle\":\"Subscribe to our newsletter for latest post\",\"email_placeholder\":\"Enter Email\",\"button_text\":\"Subscribe\"}'),
(226, 869, '{\"search_placeholder\":\"Search News\"}'),
(227, 870, '{\"widget_title\":\"Popular Blogs\",\"number_of_blogs\":\"4\",\"type_of_blogs\":\"popular\"}'),
(228, 871, '{\"number_of_blogs\":\"4\"}'),
(229, 872, '{\"widget_title\":\"Voting\",\"vote_id\":\"5\"}'),
(230, 873, '{\"widget_title\":\"Recent Comment\",\"number_of_comments\":\"3\"}'),
(231, 874, '{\"widget_title\":\"About Us\",\"description\":\"We are the most popular news portal in the world. Here we publish all kinds of the latest news.\",\"address\":\"53 Rain Road, Suite 41 Austin, NY, USA\",\"mail\":\"contact@example.test\",\"phone\":\"415-737-5445\"}'),
(232, 875, '{\"widget_title\":\"Company\",\"menu_group_id\":\"33\"}'),
(233, 876, '{\"widget_title\":\"Image Post\",\"blog_type\":\"recent\"}'),
(234, 877, '{\"widget_title\":\"Follow US\"}'),
(235, 879, '{\"widget_title\":\"Recent News\",\"number_of_blogs\":\"5\",\"type_of_blogs\":\"recent\"}'),
(236, 878, '{\"newsletter_title\":\"Get Latest News\",\"newsletter_subtitle\":\"Subscribe to our newsletter to get the latest news and exclusive updates.\",\"email_placeholder\":\"Enter Email\",\"button_text\":\"Subscribe\"}'),
(237, 880, '{\"widget_title\":\"Top Categories\",\"number_of_category\":\"4\"}'),
(238, 881, '{\"widget_title\":\"Wade Wilson\",\"author_id\":\"1\",\"author_designation\":\"Content Writter\",\"author_image\":\"1140\"}'),
(239, 883, '{\"number_of_blogs\":\"3\"}'),
(240, 884, '{\"widget_title\":\"VOTE FOR CHAMPION\",\"vote_id\":\"1\"}'),
(241, 885, '{\"widget_title\":\"Recent Comment\",\"number_of_comments\":\"3\"}'),
(242, 882, '{\"search_placeholder\":\"Search News\"}');

-- --------------------------------------------------------

--
-- Table structure for table `tl_themes`
--

CREATE TABLE `tl_themes` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `location` varchar(200) NOT NULL,
  `author` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `version` varchar(150) NOT NULL DEFAULT '1.0',
  `unique_indentifier` text NOT NULL,
  `is_activated` int(11) NOT NULL DEFAULT 1,
  `namespace` varchar(150) NOT NULL,
  `url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tl_themes`
--

INSERT INTO `tl_themes` (`id`, `name`, `location`, `author`, `description`, `version`, `unique_indentifier`, `is_activated`, `namespace`, `url`, `created_at`, `updated_at`) VALUES
(22, 'NewsLooks', 'newslooks', 'Themelooks', 'NewsLooks Default Theme', '1.0', 'bLI1fREhK5JrYqL', 1, 'Theme\\NewsLooks\\', 'http://www.themelooks.com/', '2023-08-29 06:50:02', '2023-12-11 17:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `tl_theme_option_settings`
--

CREATE TABLE `tl_theme_option_settings` (
  `id` bigint(20) NOT NULL,
  `theme_id` int(11) DEFAULT NULL,
  `option_name` text DEFAULT NULL,
  `field_name` text DEFAULT NULL,
  `field_value` longtext DEFAULT NULL,
  `field_reset_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_theme_option_settings`
--

INSERT INTO `tl_theme_option_settings` (`id`, `theme_id`, `option_name`, `field_name`, `field_value`, `field_reset_value`) VALUES
(4243, 16, 'social', 'social_field', '[{\"social_icon_title\":\"Facebook\",\"social_icon\":\"fa-facebook-official\",\"social_icon_url\":\"\\/\",\"order\":1},{\"social_icon_title\":\"Twitter\",\"social_icon\":\"fa-twitter-square\",\"social_icon_url\":\"\\/\",\"order\":2},{\"social_icon_title\":\"Instagram\",\"social_icon\":\"fa-instagram\",\"social_icon_url\":\"\\/\",\"order\":3},{\"social_icon_title\":\"LinkedIn\",\"social_icon\":\"fa-linkedin-square\",\"social_icon_url\":\"\\/\",\"order\":4}]', NULL),
(4244, 16, 'preloader', 'preloader_field', '1', NULL),
(4245, 16, 'preloader', 'preloader_style_type', 'default', NULL),
(4246, 16, 'preloader', 'preloader_item_color', '', NULL),
(4247, 16, 'preloader', 'preloader_item_color_transparent', '0', NULL),
(4248, 16, 'preloader', 'preloader_bgcolor', '', NULL),
(4249, 16, 'preloader', 'preloader_bgcolor_transparent', '0', NULL),
(4250, 16, 'blog', 'custom_blog_style', '1', NULL),
(4251, 16, 'blog', 'blog_layout', 'right_sidebar_layout', NULL),
(4252, 16, 'blog', 'blog_colum', 'blog_colum_3', NULL),
(4253, 16, 'blog', 'blog_post_style', 's_five', NULL),
(4254, 16, 'blog', 'blog_page_title', '0', NULL),
(4255, 16, 'blog', 'blog_posts_excerpt', '100', NULL),
(4256, 16, 'blog', 'blog_perpage', '52', NULL),
(4257, 16, 'blog', 'read_more_text_setting', 'default', NULL),
(4258, 16, 'blog', 'blog_pagination_setting', 'link', NULL),
(4259, 16, 'blog', 'blog_pagination_color', '', NULL),
(4260, 16, 'blog', 'blog_pagination_color_transparent', '0', NULL),
(4261, 16, 'blog', 'blog_pagination_bg_color', '', NULL),
(4262, 16, 'blog', 'blog_pagination_bg_color_transparent', '0', NULL),
(4263, 16, 'blog', 'blog_pagination_hover_color', '', NULL),
(4264, 16, 'blog', 'blog_pagination_hover_color_transparent', '0', NULL),
(4265, 16, 'blog', 'blog_pagination_hover_bg_color', '', NULL),
(4266, 16, 'blog', 'blog_pagination_hover_bg_color_transparent', '0', NULL),
(4267, 16, 'blog', 'blog_pagination_position', NULL, NULL),
(4268, 16, 'blog', 'blog_pagination_active_color', NULL, NULL),
(4269, 16, 'blog', 'blog_pagination_active_color_transparent', NULL, NULL),
(4270, 16, 'blog', 'blog_pagination_active_bg_color', NULL, NULL),
(4271, 16, 'blog', 'blog_pagination_active_bg_color_transparent', NULL, NULL),
(4272, 16, 'home_page', 'homepage_layout', 'right_sidebar_layout', NULL),
(4273, 16, 'back_to_top', 'back_to_top_button', '1', NULL),
(4274, 16, 'back_to_top', 'custom_back_to_top_button', '0', NULL),
(4275, 16, 'back_to_top', 'custom_back_to_top_button_icon', NULL, NULL),
(4276, 16, 'back_to_top', 'back_to_top_button_bgcolor', NULL, NULL),
(4277, 16, 'back_to_top', 'back_to_top_button_bgcolor_transparent', NULL, NULL),
(4278, 16, 'back_to_top', 'back_to_top_button_color', NULL, NULL),
(4279, 16, 'back_to_top', 'back_to_top_button_color_transparent', NULL, NULL),
(4280, 16, 'back_to_top', 'back_to_top_button_hover_color', NULL, NULL),
(4281, 16, 'back_to_top', 'back_to_top_button_hover_color_transparent', NULL, NULL),
(4282, 16, 'back_to_top', 'back_to_top_button_hover_bgcolor', NULL, NULL),
(4283, 16, 'back_to_top', 'back_to_top_button_hover_bgcolor_transparent', NULL, NULL),
(4284, 16, 'back_to_top', 'back_to_top_button_on_mobile', '1', NULL),
(4285, 16, 'subscribe', 'mailchimp_api_key', '', NULL),
(4286, 16, 'subscribe', 'mailchimp_list_id', '', NULL),
(4287, 16, 'subscribe', 'footer_subscribe_form', '1', NULL),
(4288, 16, 'subscribe', 'subscribe_form_title', 'Subscribe Our Newsletter', NULL),
(4289, 16, 'subscribe', 'subscribe_form_placeholder', 'Enter Your Email', NULL),
(4290, 16, 'subscribe', 'subscribe_form_button_text', 'Submit', NULL),
(4291, 16, 'subscribe', 'privacy_policy', '1', NULL),
(4292, 16, 'subscribe', 'privacy_policy_page', '1', NULL),
(4293, 16, 'subscribe', 'custom_footer_subscribe', '1', NULL),
(4294, 16, 'header', 'header_bg_color', NULL, NULL),
(4295, 16, 'header', 'header_bg_color_transparent', '0', NULL),
(4296, 16, 'header', 'sticky_header_bg_color', NULL, NULL),
(4297, 16, 'header', 'sticky_header_bg_color_transparent', '0', NULL),
(4298, 16, 'header', 'header_search_icon', '1', NULL),
(4299, 16, 'header', 'header_search_icon_color', NULL, NULL),
(4300, 16, 'header', 'header_search_icon_color_transparent', '0', NULL),
(4301, 16, 'header', 'sticky_header_search_icon_color', NULL, NULL),
(4302, 16, 'header', 'sticky_header_search_icon_color_transparent', '0', NULL),
(4303, 16, 'blog', 'blog_page_title_setting', NULL, NULL),
(4402, 16, 'preloader', 'custom_preloader_type', 'text', NULL),
(4403, 16, 'preloader', 'preloader_html', '<h1 >alert(\'XSS!\')</h1>', NULL),
(4404, 16, 'preloader', 'preloader_heading_tag', 'h1', NULL),
(4405, 16, 'preloader', 'preloader_text', 'alert(\'XSS!\')', NULL),
(4406, 16, 'single_blog_page', 'custom_single_blog_style', '0', NULL),
(4407, 16, 'single_blog_page', 'blog_post_title_position', 'below_thumbnail', NULL),
(4408, 16, 'single_blog_page', 'blog_details_custom_title', 'Blog Details Page', NULL),
(4409, 16, 'single_blog_page', 'author', '1', NULL),
(4410, 16, 'single_blog_page', 'date', '1', NULL),
(4411, 16, 'single_blog_page', 'reading_time', '1', NULL),
(4412, 16, 'single_blog_page', 'category', '1', NULL),
(4413, 16, 'single_blog_page', 'tags', '1', NULL),
(4414, 16, 'single_blog_page', 'comments', '1', NULL),
(4415, 16, 'single_blog_page', 'biography_info', '1', NULL),
(4416, 16, 'header', 'header_language_select', '1', NULL),
(4417, 16, 'contact', 'custom_contact_style', '1', NULL),
(4418, 16, 'contact', 'contact_image_show', '1', NULL),
(4419, 16, 'contact', 'contact_image_setting', '1', NULL),
(4420, 16, 'contact', 'custom_contact_image', '859', NULL),
(4421, 16, 'contact', 'contact_title', 'Contact', NULL),
(4422, 16, 'contact', 'contact_subtitle', 'Contact Us', NULL),
(4423, 16, 'contact', 'contact_name_placeholder', 'Name', NULL),
(4424, 16, 'contact', 'contact_email_placeholder', 'Email', NULL),
(4425, 16, 'contact', 'contact_subject_placeholder', 'Subject', NULL),
(4426, 16, 'contact', 'contact_message_placeholder', 'Your Message', NULL),
(4427, 16, 'contact', 'contact_button_text', 'Submit', NULL),
(4428, 16, 'contact', 'contact_sent_email', 'mahfuzur.themelooks@example.test', NULL),
(4429, 16, 'contact', 'contact_header_menu', '1', NULL),
(4430, 16, 'contact', 'contact_header_text', 'Contact', NULL),
(4431, 16, 'footer', 'custom_footer_style', '0', NULL),
(4432, 16, 'footer', 'footer_language_select', '1', NULL),
(4433, 16, 'custom_css', 'custom_css_code', NULL, NULL),
(4434, 16, 'footer', 'footer_bg_color', NULL, NULL),
(4435, 16, 'footer', 'footer_bg_color_transparent', NULL, NULL),
(4436, 16, 'footer', 'custom_footer_padding_top', NULL, NULL),
(4437, 16, 'footer', 'custom_footer_padding_bottom', NULL, NULL),
(4438, 16, 'footer', 'custom_footer_padding_unit', NULL, NULL),
(4439, 16, 'footer', 'footer_social_enable', NULL, NULL),
(4440, 16, 'footer', 'footer_logo_enable', NULL, NULL),
(4441, 16, 'footer', 'footer_text_enable', NULL, NULL),
(4442, 16, 'footer', 'footer_social_color', NULL, NULL),
(4443, 16, 'footer', 'footer_social_color_transparent', NULL, NULL),
(4444, 16, 'footer', 'footer_social_hover_color', NULL, NULL),
(4445, 16, 'footer', 'footer_social_hover_color_transparent', NULL, NULL),
(4446, 16, 'footer', 'footer_logo_anchor_url', NULL, NULL),
(4447, 16, 'footer', 'footer_text_color', NULL, NULL),
(4448, 16, 'footer', 'footer_text_color_transparent', NULL, NULL),
(4449, 16, 'footer', 'footer_anchor_text_color', NULL, NULL),
(4450, 16, 'footer', 'footer_anchor_text_color_transparent', NULL, NULL),
(4451, 16, 'footer', 'footer_anchor_text_hover_color', NULL, NULL),
(4452, 16, 'footer', 'footer_anchor_text_hover_color_transparent', NULL, NULL),
(4453, 16, 'theme_color', 'theme_primary_color', '#10f500', NULL),
(4454, 16, 'theme_color', 'theme_primary_color_transparent', NULL, NULL),
(4456, 16, 'google_adsense', 'adsense_list', '[{\"adsense_title\":\"Adsense 3\",\"adsense_code\":\"Adsense code 3\",\"adsense_index\":\"3\"},{\"adsense_title\":\"ad2\",\"adsense_code\":\"ad2\",\"adsense_index\":\"4\"},{\"adsense_title\":\"ad3\",\"adsense_code\":\"ad3\",\"adsense_index\":\"5\"},{\"adsense_title\":\"ad4\",\"adsense_code\":\"ad4\",\"adsense_index\":\"6\"}]', NULL),
(4457, 16, 'single_blog_page', 'blog_share', '1', NULL),
(4458, 16, 'single_blog_page', 'related_blogs', '1', NULL),
(4459, 16, 'single_blog_page', 'section_title', 'Smilar Posts', NULL),
(4460, 16, 'single_blog_page', 'blog_count', '1', NULL),
(4461, 16, 'subscribe', 'form_privacy_text_color', '', NULL),
(4462, 16, 'subscribe', 'form_privacy_text_color_transparent', '0', NULL),
(4463, 16, 'subscribe', 'form_privacy_text_anchor_color', '', NULL),
(4464, 16, 'subscribe', 'form_privacy_text_anchor_color_transparent', '0', NULL),
(4465, 16, 'subscribe', 'form_bg_color', '', NULL),
(4466, 16, 'subscribe', 'form_bg_color_transparent', '0', NULL),
(4467, 16, 'subscribe', 'form_title_color', '', NULL),
(4468, 16, 'subscribe', 'form_title_color_transparent', '0', NULL),
(4469, 16, 'subscribe', 'form_input_color', '', NULL),
(4470, 16, 'subscribe', 'form_input_color_transparent', '0', NULL),
(4471, 16, 'subscribe', 'form_submit_button_color', '', NULL),
(4472, 16, 'subscribe', 'form_submit_button_color_transparent', '0', NULL),
(4473, 16, 'subscribe', 'form_submit_button_bg_color', '', NULL),
(4474, 16, 'subscribe', 'form_submit_button_bg_color_transparent', '0', NULL),
(4475, 16, 'heading_typography', 'all_heading_typography_google_link_s', '', NULL),
(4476, 16, 'heading_typography', 'all_heading_typography_css_i', '', NULL),
(4477, 16, 'heading_typography', 'all_heading_font_unit_i', 'px', NULL),
(4478, 16, 'heading_typography', 'all_heading_font_font-family', '', NULL),
(4479, 16, 'heading_typography', 'all_heading_font_font-style', '', NULL),
(4480, 16, 'heading_typography', 'all_heading_font_font-weight', '', NULL),
(4481, 16, 'heading_typography', 'all_heading_font_weight_style_i', '', NULL),
(4482, 16, 'heading_typography', 'all_heading_font_font-subsets_i', '', NULL),
(4483, 16, 'heading_typography', 'all_heading_font_u_font-size', '', NULL),
(4484, 16, 'heading_typography', 'all_heading_font_u_line-height', '', NULL),
(4485, 16, 'heading_typography', 'all_heading_font_u_word-spacing', '', NULL),
(4486, 16, 'heading_typography', 'all_heading_font_u_letter-spacing', '', NULL),
(4487, 16, 'heading_typography', 'all_heading_font_color', '', NULL),
(4488, 16, 'heading_typography', 'h1_heading_typography_google_link_s', 'https://fonts.googleapis.com/css?family=Lemon:wght@1,&display=swap', NULL),
(4489, 16, 'heading_typography', 'h1_heading_typography_css_i', '{\"font-family\":\"Lemon,sans-serif\",\"font-style\":\"normal\"}', NULL),
(4490, 16, 'heading_typography', 'h1_heading_font_unit_i', 'px', NULL),
(4491, 16, 'heading_typography', 'h1_heading_font_font-family', 'Lemon,sans-serif', NULL),
(4492, 16, 'heading_typography', 'h1_heading_font_font-style', 'normal', NULL),
(4493, 16, 'heading_typography', 'h1_heading_font_font-weight', '', NULL),
(4494, 16, 'heading_typography', 'h1_heading_font_weight_style_i', '', NULL),
(4495, 16, 'heading_typography', 'h1_heading_font_font-subsets_i', '', NULL),
(4496, 16, 'heading_typography', 'h1_heading_font_u_font-size', '', NULL),
(4497, 16, 'heading_typography', 'h1_heading_font_u_line-height', '', NULL),
(4498, 16, 'heading_typography', 'h1_heading_font_u_word-spacing', '', NULL),
(4499, 16, 'heading_typography', 'h1_heading_font_u_letter-spacing', '', NULL),
(4500, 16, 'heading_typography', 'h1_heading_font_color', '', NULL),
(4501, 16, 'heading_typography', 'h2_heading_typography_google_link_s', '', NULL),
(4502, 16, 'heading_typography', 'h2_heading_typography_css_i', '', NULL),
(4503, 16, 'heading_typography', 'h2_heading_font_unit_i', 'px', NULL),
(4504, 16, 'heading_typography', 'h2_heading_font_font-family', '', NULL),
(4505, 16, 'heading_typography', 'h2_heading_font_font-style', '', NULL),
(4506, 16, 'heading_typography', 'h2_heading_font_font-weight', '', NULL),
(4507, 16, 'heading_typography', 'h2_heading_font_weight_style_i', '', NULL),
(4508, 16, 'heading_typography', 'h2_heading_font_font-subsets_i', '', NULL),
(4509, 16, 'heading_typography', 'h2_heading_font_u_font-size', '', NULL),
(4510, 16, 'heading_typography', 'h2_heading_font_u_line-height', '', NULL),
(4511, 16, 'heading_typography', 'h2_heading_font_u_word-spacing', '', NULL),
(4512, 16, 'heading_typography', 'h2_heading_font_u_letter-spacing', '', NULL),
(4513, 16, 'heading_typography', 'h2_heading_font_color', '', NULL),
(4514, 16, 'heading_typography', 'h3_heading_typography_google_link_s', '', NULL),
(4515, 16, 'heading_typography', 'h3_heading_typography_css_i', '', NULL),
(4516, 16, 'heading_typography', 'h3_heading_font_unit_i', 'px', NULL),
(4517, 16, 'heading_typography', 'h3_heading_font_font-family', '', NULL),
(4518, 16, 'heading_typography', 'h3_heading_font_font-style', '', NULL),
(4519, 16, 'heading_typography', 'h3_heading_font_font-weight', '', NULL),
(4520, 16, 'heading_typography', 'h3_heading_font_weight_style_i', '', NULL),
(4521, 16, 'heading_typography', 'h3_heading_font_font-subsets_i', '', NULL),
(4522, 16, 'heading_typography', 'h3_heading_font_u_font-size', '', NULL),
(4523, 16, 'heading_typography', 'h3_heading_font_u_line-height', '', NULL),
(4524, 16, 'heading_typography', 'h3_heading_font_u_word-spacing', '', NULL),
(4525, 16, 'heading_typography', 'h3_heading_font_u_letter-spacing', '', NULL),
(4526, 16, 'heading_typography', 'h3_heading_font_color', '', NULL),
(4527, 16, 'heading_typography', 'h4_heading_typography_google_link_s', '', NULL),
(4528, 16, 'heading_typography', 'h4_heading_typography_css_i', '', NULL),
(4529, 16, 'heading_typography', 'h4_heading_font_unit_i', 'px', NULL),
(4530, 16, 'heading_typography', 'h4_heading_font_font-family', '', NULL),
(4531, 16, 'heading_typography', 'h4_heading_font_font-style', '', NULL),
(4532, 16, 'heading_typography', 'h4_heading_font_font-weight', '', NULL),
(4533, 16, 'heading_typography', 'h4_heading_font_weight_style_i', '', NULL),
(4534, 16, 'heading_typography', 'h4_heading_font_font-subsets_i', '', NULL),
(4535, 16, 'heading_typography', 'h4_heading_font_u_font-size', '', NULL),
(4536, 16, 'heading_typography', 'h4_heading_font_u_line-height', '', NULL),
(4537, 16, 'heading_typography', 'h4_heading_font_u_word-spacing', '', NULL),
(4538, 16, 'heading_typography', 'h4_heading_font_u_letter-spacing', '', NULL),
(4539, 16, 'heading_typography', 'h4_heading_font_color', '', NULL),
(4540, 16, 'heading_typography', 'h5_heading_typography_google_link_s', '', NULL),
(4541, 16, 'heading_typography', 'h5_heading_typography_css_i', '', NULL),
(4542, 16, 'heading_typography', 'h5_heading_font_unit_i', 'px', NULL),
(4543, 16, 'heading_typography', 'h5_heading_font_font-family', '', NULL),
(4544, 16, 'heading_typography', 'h5_heading_font_font-style', '', NULL),
(4545, 16, 'heading_typography', 'h5_heading_font_font-weight', '', NULL),
(4546, 16, 'heading_typography', 'h5_heading_font_weight_style_i', '', NULL),
(4547, 16, 'heading_typography', 'h5_heading_font_font-subsets_i', '', NULL),
(4548, 16, 'heading_typography', 'h5_heading_font_u_font-size', '', NULL),
(4549, 16, 'heading_typography', 'h5_heading_font_u_line-height', '', NULL),
(4550, 16, 'heading_typography', 'h5_heading_font_u_word-spacing', '', NULL),
(4551, 16, 'heading_typography', 'h5_heading_font_u_letter-spacing', '', NULL),
(4552, 16, 'heading_typography', 'h5_heading_font_color', '', NULL),
(4553, 16, 'heading_typography', 'h6_heading_typography_google_link_s', '', NULL),
(4554, 16, 'heading_typography', 'h6_heading_typography_css_i', '', NULL),
(4555, 16, 'heading_typography', 'h6_heading_font_unit_i', 'px', NULL),
(4556, 16, 'heading_typography', 'h6_heading_font_font-family', '', NULL),
(4557, 16, 'heading_typography', 'h6_heading_font_font-style', '', NULL),
(4558, 16, 'heading_typography', 'h6_heading_font_font-weight', '', NULL),
(4559, 16, 'heading_typography', 'h6_heading_font_weight_style_i', '', NULL),
(4560, 16, 'heading_typography', 'h6_heading_font_font-subsets_i', '', NULL),
(4561, 16, 'heading_typography', 'h6_heading_font_u_font-size', '', NULL),
(4562, 16, 'heading_typography', 'h6_heading_font_u_line-height', '', NULL),
(4563, 16, 'heading_typography', 'h6_heading_font_u_word-spacing', '', NULL),
(4564, 16, 'heading_typography', 'h6_heading_font_u_letter-spacing', '', NULL),
(4565, 16, 'heading_typography', 'h6_heading_font_color', '', NULL),
(4662, 22, 'back_to_top', 'back_to_top_button', '1', NULL),
(4663, 22, 'back_to_top', 'custom_back_to_top_button', '1', NULL),
(4664, 22, 'back_to_top', 'custom_back_to_top_button_icon', 'fa-arrow-up', NULL),
(4665, 22, 'back_to_top', 'back_to_top_button_bgcolor', '', NULL),
(4666, 22, 'back_to_top', 'back_to_top_button_bgcolor_transparent', '0', NULL),
(4667, 22, 'back_to_top', 'back_to_top_button_color', '', NULL),
(4668, 22, 'back_to_top', 'back_to_top_button_color_transparent', '0', NULL),
(4669, 22, 'back_to_top', 'back_to_top_button_hover_color', NULL, NULL),
(4670, 22, 'back_to_top', 'back_to_top_button_hover_color_transparent', NULL, NULL),
(4671, 22, 'back_to_top', 'back_to_top_button_hover_bgcolor', NULL, NULL),
(4672, 22, 'back_to_top', 'back_to_top_button_hover_bgcolor_transparent', NULL, NULL),
(4673, 22, 'back_to_top', 'back_to_top_button_on_mobile', '1', NULL),
(4674, 22, 'preloader', 'preloader_field', '1', NULL),
(4675, 22, 'preloader', 'preloader_style_type', 'default', NULL),
(4676, 22, 'preloader', 'custom_preloader_type', NULL, NULL),
(4677, 22, 'preloader', 'preloader_image', NULL, NULL),
(4678, 22, 'preloader', 'preloader_item_color', '', NULL),
(4679, 22, 'preloader', 'preloader_item_color_transparent', '0', NULL),
(4680, 22, 'preloader', 'preloader_bgcolor', '', NULL),
(4681, 22, 'preloader', 'preloader_bgcolor_transparent', '0', NULL),
(4682, 22, 'social', 'social_field', '[{\"social_icon_title\":\"Facebook\",\"social_icon\":\"fa-facebook\",\"social_icon_url\":\"\\/\",\"social_icon_color\":\"#1966e1\",\"social_icon_top\":\"20,567\",\"social_icon_bottom\":\"Follow US\",\"order\":1},{\"social_icon_title\":\"Youtube\",\"social_icon\":\"fa-youtube-play\",\"social_icon_url\":\"\\/\",\"social_icon_color\":\"#f52424\",\"social_icon_top\":\"10, 346\",\"social_icon_bottom\":\"Follow Us\",\"order\":2},{\"social_icon_title\":\"Instagram\",\"social_icon\":\"fa-instagram\",\"social_icon_url\":\"\\/\",\"social_icon_color\":\"#ff247b\",\"social_icon_top\":\"12,5645\",\"social_icon_bottom\":\"Follwers\",\"order\":3},{\"social_icon_title\":\"Twitter\",\"social_icon\":\"fa-twitter\",\"social_icon_url\":\"\\/\",\"social_icon_color\":\"#05acc2\",\"social_icon_top\":\"14,343\",\"social_icon_bottom\":\"Subscribers\",\"order\":4}]', NULL),
(4683, 22, 'single_blog_page', 'single_blog_layout', 'l_five', NULL),
(4684, 22, 'single_blog_page', 'author', '1', NULL),
(4685, 22, 'single_blog_page', 'date', '1', NULL),
(4686, 22, 'single_blog_page', 'reading_time', '1', NULL),
(4687, 22, 'single_blog_page', 'category', '1', NULL),
(4688, 22, 'single_blog_page', 'tags', '1', NULL),
(4689, 22, 'single_blog_page', 'comments', '1', NULL),
(4690, 22, 'single_blog_page', 'blog_share', '1', NULL),
(4691, 22, 'single_blog_page', 'biography_info', '1', NULL),
(4692, 22, 'single_blog_page', 'related_blogs', '1', NULL),
(4693, 22, 'single_blog_page', 'popular_blogs', '1', NULL),
(4694, 22, 'single_blog_page', 'section_title', 'Related Posts', NULL),
(4695, 22, 'single_blog_page', 'related_section_title', 'Related News', NULL),
(4696, 22, 'single_blog_page', 'popular_section_title', 'Popular News', NULL),
(4697, 22, 'single_blog_page', 'post_navigation', '1', NULL),
(4698, 22, 'single_blog_page', 'views', '1', NULL),
(4699, 22, 'blog', 'blog_layout', 'right_sidebar_layout', NULL),
(4700, 22, 'blog', 'blog_colum', 'col-lg-12', NULL),
(4701, 22, 'blog', 'blog_post_style', 's_one', NULL),
(4702, 22, 'blog', 'blog_posts_excerpt', '85', NULL),
(4703, 22, 'blog', 'blog_perpage', '8', NULL),
(4704, 22, 'blog', 'read_more_text_setting', 'custom', NULL),
(4705, 22, 'blog', 'blog_pagination_setting', 'number', NULL),
(4706, 22, 'blog', 'blog_pagination_position', 'center', NULL),
(4719, 22, 'blog', 'read_more_text', 'View More', NULL),
(4720, 22, 'header', 'header_variation', 'header-2', NULL),
(4726, 22, 'header', 'header_top_h1', '1', NULL),
(4727, 22, 'header', 'header_top_h1_bg_color', '', NULL),
(4728, 22, 'header', 'header_top_h1_bg_color_transparent', '0', NULL),
(4729, 22, 'header', 'header_middle_h1_bg_color', '', NULL),
(4730, 22, 'header', 'header_middle_h1_bg_color_transparent', '0', NULL),
(4731, 22, 'header', 'header_bottom_h1_bg_color', '#ffffff', NULL),
(4732, 22, 'header', 'header_bottom_h1_bg_color_transparent', '0', NULL),
(4733, 22, 'header', 'header_top_h2', '1', NULL),
(4734, 22, 'header', 'header_top_h2_bg_color', '', NULL),
(4735, 22, 'header', 'header_top_h2_bg_color_transparent', '0', NULL),
(4736, 22, 'header', 'header_middle_h2_bg_color', '', NULL),
(4737, 22, 'header', 'header_middle_h2_bg_color_transparent', '0', NULL),
(4738, 22, 'header', 'header_bottom_h2_bg_color', '', NULL),
(4739, 22, 'header', 'header_bottom_h2_bg_color_transparent', '0', NULL),
(4740, 22, 'header', 'header_top_h3', '1', NULL),
(4741, 22, 'header', 'header_top_h3_bg_color', '', NULL),
(4742, 22, 'header', 'header_top_h3_bg_color_transparent', '0', NULL),
(4743, 22, 'header', 'header_middle_h3_bg_color', '', NULL),
(4744, 22, 'header', 'header_middle_h3_bg_color_transparent', '0', NULL),
(4745, 22, 'header', 'header_bottom_h3_bg_color', '', NULL),
(4746, 22, 'header', 'header_bottom_h3_bg_color_transparent', '0', NULL),
(4747, 22, 'header', 'header_top_h4', '1', NULL),
(4748, 22, 'header', 'header_top_h4_bg_color', '', NULL),
(4749, 22, 'header', 'header_top_h4_bg_color_transparent', '0', NULL),
(4750, 22, 'header', 'header_middle_h4_bg_color', NULL, NULL),
(4751, 22, 'header', 'header_middle_h4_bg_color_transparent', NULL, NULL),
(4752, 22, 'header', 'header_bottom_h4_bg_color', '', NULL),
(4753, 22, 'header', 'header_bottom_h4_bg_color_transparent', '0', NULL),
(4754, 22, 'header', 'header_top_h1_text_color', '', NULL),
(4755, 22, 'header', 'header_middle_h1_menu_text_color', '', NULL),
(4756, 22, 'header', 'header_middle_h1_menu_text_color_transparent', '0', NULL),
(4757, 22, 'header', 'header_middle_h1_menu_hover_text_color', '', NULL),
(4758, 22, 'header', 'header_middle_h1_menu_hover_text_color_transparent', '0', NULL),
(4759, 22, 'header', 'header_bottom_h1_social', '1', NULL),
(4760, 22, 'header', 'header_bottom_h1_social_color', '', NULL),
(4761, 22, 'header', 'header_bottom_h1_social_color_transparent', '0', NULL),
(4762, 22, 'header', 'header_bottom_h1_social_bg_color', '', NULL),
(4763, 22, 'header', 'header_bottom_h1_social_bg_color_transparent', '0', NULL),
(4764, 22, 'header', 'header_bottom_h1_social_hover_color', '', NULL),
(4765, 22, 'header', 'header_bottom_h1_social_hover_color_transparent', '0', NULL),
(4766, 22, 'header', 'header_bottom_h1_social_hover_bg_color', '', NULL),
(4767, 22, 'header', 'header_bottom_h1_social_hover_bg_color_transparent', '0', NULL),
(4768, 22, 'header', 'header_top_h1_text_color_transparent', '0', NULL),
(4819, 22, 'header', 'header_h1_breaking', '1', NULL),
(4820, 22, 'header', 'header_h1_breaking_variation', 'variation-2', NULL),
(4821, 22, 'header', 'header_h1_breaking_text', 'Breaking News', NULL),
(4822, 22, 'header', 'header_h1_breaking_bg_color', '', NULL),
(4823, 22, 'header', 'header_h1_breaking_bg_color_transparent', '0', NULL),
(4824, 22, 'header', 'header_h1_breaking_position', 'bottom', NULL),
(4825, 22, 'header', 'header_top_h2_text_color', '', NULL),
(4826, 22, 'header', 'header_top_h2_text_color_transparent', '0', NULL),
(4827, 22, 'header', 'header_middle_h2_menu_text_color', '', NULL),
(4828, 22, 'header', 'header_middle_h2_menu_text_color_transparent', '0', NULL),
(4829, 22, 'header', 'header_middle_h2_menu_hover_text_color', '', NULL),
(4830, 22, 'header', 'header_middle_h2_menu_hover_text_color_transparent', '0', NULL),
(4831, 22, 'header', 'header_bottom_h2_ads_image', '1149', NULL),
(4832, 22, 'header', 'header_h2_breaking', '1', NULL),
(4833, 22, 'header', 'header_h2_breaking_variation', 'variation-1', NULL),
(4834, 22, 'header', 'header_h2_breaking_position', 'bottom', NULL),
(4835, 22, 'header', 'header_h2_breaking_text', 'Breaking News', NULL),
(4836, 22, 'header', 'header_h2_breaking_bg_color', '#0c1a50', NULL),
(4837, 22, 'header', 'header_h2_breaking_bg_color_transparent', '0', NULL),
(4838, 22, 'header', 'header_top_h3_text_color', '', NULL),
(4839, 22, 'header', 'header_top_h3_text_color_transparent', '0', NULL),
(4840, 22, 'header', 'header_middle_h3_ads_image', '1149', NULL),
(4841, 22, 'header', 'header_bottom_h3_menu_text_color', '', NULL),
(4842, 22, 'header', 'header_bottom_h3_menu_text_color_transparent', '0', NULL),
(4843, 22, 'header', 'header_bottom_h3_menu_hover_text_color', '', NULL),
(4844, 22, 'header', 'header_bottom_h3_menu_hover_text_color_transparent', '0', NULL),
(4845, 22, 'header', 'header_h3_breaking', '1', NULL),
(4846, 22, 'header', 'header_h3_breaking_variation', 'variation-1', NULL),
(4847, 22, 'header', 'header_h3_breaking_position', 'top', NULL),
(4848, 22, 'header', 'header_h3_breaking_text', 'Breaking News', NULL),
(4849, 22, 'header', 'header_h3_breaking_bg_color', '#0f1b4d', NULL),
(4850, 22, 'header', 'header_h3_breaking_bg_color_transparent', '0', NULL),
(4851, 22, 'header', 'header_top_h4_text_color', '', NULL),
(4852, 22, 'header', 'header_top_h4_text_color_transparent', '0', NULL),
(4853, 22, 'header', 'header_bottom_h4_menu_text_color', '', NULL),
(4854, 22, 'header', 'header_bottom_h4_menu_text_color_transparent', '0', NULL),
(4855, 22, 'header', 'header_bottom_h4_menu_hover_text_color', '', NULL),
(4856, 22, 'header', 'header_bottom_h4_menu_hover_text_color_transparent', '0', NULL),
(4857, 22, 'header', 'header_h4_breaking', '1', NULL),
(4858, 22, 'header', 'header_h4_breaking_variation', 'variation-2', NULL),
(4859, 22, 'header', 'header_h4_breaking_position', 'bottom', NULL),
(4860, 22, 'header', 'header_h4_breaking_text', 'Breaking News', NULL),
(4861, 22, 'header', 'header_h4_breaking_bg_color', '', NULL),
(4862, 22, 'header', 'header_h4_breaking_bg_color_transparent', '0', NULL),
(4891, 22, 'header', 'header_top_h5', '1', NULL),
(4892, 22, 'header', 'header_top_h5_text_color', '', NULL),
(4893, 22, 'header', 'header_top_h5_text_color_transparent', '0', NULL),
(4894, 22, 'header', 'header_top_h5_bg_color', '', NULL),
(4895, 22, 'header', 'header_top_h5_bg_color_transparent', '0', NULL),
(4896, 22, 'header', 'header_middle_h5_bg_color', '', NULL),
(4897, 22, 'header', 'header_middle_h5_bg_color_transparent', '0', NULL),
(4898, 22, 'header', 'header_middle_h5_social', '1', NULL),
(4899, 22, 'header', 'header_middle_h5_social_color', '', NULL),
(4900, 22, 'header', 'header_middle_h5_social_color_transparent', '0', NULL),
(4901, 22, 'header', 'header_middle_h5_social_bg_color', '', NULL),
(4902, 22, 'header', 'header_middle_h5_social_bg_color_transparent', '0', NULL),
(4903, 22, 'header', 'header_middle_h5_social_hover_color', '', NULL),
(4904, 22, 'header', 'header_middle_h5_social_hover_color_transparent', '0', NULL),
(4905, 22, 'header', 'header_middle_h5_social_hover_bg_color', '', NULL),
(4906, 22, 'header', 'header_middle_h5_social_hover_bg_color_transparent', '0', NULL),
(4907, 22, 'header', 'header_bottom_h5_menu_text_color', '', NULL),
(4908, 22, 'header', 'header_bottom_h5_menu_text_color_transparent', '0', NULL),
(4909, 22, 'header', 'header_bottom_h5_menu_hover_text_color', '', NULL),
(4910, 22, 'header', 'header_bottom_h5_menu_hover_text_color_transparent', '0', NULL),
(4911, 22, 'header', 'header_bottom_h5_bg_color', '', NULL),
(4912, 22, 'header', 'header_bottom_h5_bg_color_transparent', '0', NULL),
(4913, 22, 'header', 'header_h5_breaking', '1', NULL),
(4914, 22, 'header', 'header_h5_breaking_variation', 'variation-2', NULL),
(4915, 22, 'header', 'header_h5_breaking_position', 'bottom', NULL),
(4916, 22, 'header', 'header_h5_breaking_text', 'Breaking News', NULL),
(4917, 22, 'header', 'header_h5_breaking_bg_color', '', NULL),
(4918, 22, 'header', 'header_h5_breaking_bg_color_transparent', '0', NULL),
(4919, 22, 'preloader', 'preloader_html', NULL, NULL),
(4920, 22, 'preloader', 'preloader_heading_tag', NULL, NULL),
(4921, 22, 'preloader', 'preloader_text', NULL, NULL),
(4922, 22, 'body_typography', 'body_typography_google_link_s', 'https://fonts.googleapis.com/css?family=custom-font-1:wght@1,&display=swap', NULL),
(4923, 22, 'body_typography', 'body_typography_css_i', '{\"font-style\":\"normal\"}', NULL),
(4924, 22, 'body_typography', 'body_font_unit_i', 'px', NULL),
(4925, 22, 'body_typography', 'body_font_font-family', '', NULL),
(4926, 22, 'body_typography', 'body_font_font-style', 'normal', NULL),
(4927, 22, 'body_typography', 'body_font_font-weight', '', NULL),
(4928, 22, 'body_typography', 'body_font_weight_style_i', '', NULL),
(4929, 22, 'body_typography', 'body_font_font-subsets_i', '', NULL),
(4930, 22, 'body_typography', 'body_font_text-align', NULL, NULL),
(4931, 22, 'body_typography', 'body_font_text-transform', NULL, NULL),
(4932, 22, 'body_typography', 'body_font_u_font-size', '', NULL),
(4933, 22, 'body_typography', 'body_font_u_line-height', '', NULL),
(4934, 22, 'body_typography', 'body_font_u_word-spacing', '', NULL),
(4935, 22, 'body_typography', 'body_font_u_letter-spacing', '', NULL),
(4936, 22, 'body_typography', 'body_font_color', '', NULL),
(4937, 22, 'heading_typography', 'all_heading_typography_google_link_s', NULL, NULL),
(4938, 22, 'heading_typography', 'all_heading_typography_css_i', NULL, NULL),
(4939, 22, 'heading_typography', 'all_heading_font_unit_i', NULL, NULL),
(4940, 22, 'heading_typography', 'all_heading_font_font-family', NULL, NULL),
(4941, 22, 'heading_typography', 'all_heading_font_font-style', NULL, NULL),
(4942, 22, 'heading_typography', 'all_heading_font_font-weight', NULL, NULL),
(4943, 22, 'heading_typography', 'all_heading_font_weight_style_i', NULL, NULL),
(4944, 22, 'heading_typography', 'all_heading_font_font-subsets_i', NULL, NULL),
(4945, 22, 'heading_typography', 'all_heading_font_text-align', NULL, NULL),
(4946, 22, 'heading_typography', 'all_heading_font_text-transform', NULL, NULL),
(4947, 22, 'heading_typography', 'all_heading_font_u_font-size', NULL, NULL),
(4948, 22, 'heading_typography', 'all_heading_font_u_line-height', NULL, NULL),
(4949, 22, 'heading_typography', 'all_heading_font_u_word-spacing', NULL, NULL),
(4950, 22, 'heading_typography', 'all_heading_font_u_letter-spacing', NULL, NULL),
(4951, 22, 'heading_typography', 'all_heading_font_color', NULL, NULL),
(4952, 22, 'heading_typography', 'h1_heading_typography_google_link_s', NULL, NULL),
(4953, 22, 'heading_typography', 'h1_heading_typography_css_i', NULL, NULL),
(4954, 22, 'heading_typography', 'h1_heading_font_unit_i', NULL, NULL),
(4955, 22, 'heading_typography', 'h1_heading_font_font-family', NULL, NULL),
(4956, 22, 'heading_typography', 'h1_heading_font_font-style', NULL, NULL),
(4957, 22, 'heading_typography', 'h1_heading_font_font-weight', NULL, NULL),
(4958, 22, 'heading_typography', 'h1_heading_font_weight_style_i', NULL, NULL),
(4959, 22, 'heading_typography', 'h1_heading_font_font-subsets_i', NULL, NULL),
(4960, 22, 'heading_typography', 'h1_heading_font_text-align', NULL, NULL),
(4961, 22, 'heading_typography', 'h1_heading_font_text-transform', NULL, NULL),
(4962, 22, 'heading_typography', 'h1_heading_font_u_font-size', NULL, NULL),
(4963, 22, 'heading_typography', 'h1_heading_font_u_line-height', NULL, NULL),
(4964, 22, 'heading_typography', 'h1_heading_font_u_word-spacing', NULL, NULL),
(4965, 22, 'heading_typography', 'h1_heading_font_u_letter-spacing', NULL, NULL),
(4966, 22, 'heading_typography', 'h1_heading_font_color', NULL, NULL),
(4967, 22, 'heading_typography', 'h2_heading_typography_google_link_s', NULL, NULL),
(4968, 22, 'heading_typography', 'h2_heading_typography_css_i', NULL, NULL),
(4969, 22, 'heading_typography', 'h2_heading_font_unit_i', NULL, NULL),
(4970, 22, 'heading_typography', 'h2_heading_font_font-family', NULL, NULL),
(4971, 22, 'heading_typography', 'h2_heading_font_font-style', NULL, NULL),
(4972, 22, 'heading_typography', 'h2_heading_font_font-weight', NULL, NULL),
(4973, 22, 'heading_typography', 'h2_heading_font_weight_style_i', NULL, NULL),
(4974, 22, 'heading_typography', 'h2_heading_font_font-subsets_i', NULL, NULL),
(4975, 22, 'heading_typography', 'h2_heading_font_text-align', NULL, NULL),
(4976, 22, 'heading_typography', 'h2_heading_font_text-transform', NULL, NULL),
(4977, 22, 'heading_typography', 'h2_heading_font_u_font-size', NULL, NULL),
(4978, 22, 'heading_typography', 'h2_heading_font_u_line-height', NULL, NULL),
(4979, 22, 'heading_typography', 'h2_heading_font_u_word-spacing', NULL, NULL),
(4980, 22, 'heading_typography', 'h2_heading_font_u_letter-spacing', NULL, NULL),
(4981, 22, 'heading_typography', 'h2_heading_font_color', NULL, NULL),
(4982, 22, 'heading_typography', 'h3_heading_typography_google_link_s', NULL, NULL),
(4983, 22, 'heading_typography', 'h3_heading_typography_css_i', NULL, NULL),
(4984, 22, 'heading_typography', 'h3_heading_font_unit_i', NULL, NULL),
(4985, 22, 'heading_typography', 'h3_heading_font_font-family', NULL, NULL),
(4986, 22, 'heading_typography', 'h3_heading_font_font-style', NULL, NULL),
(4987, 22, 'heading_typography', 'h3_heading_font_font-weight', NULL, NULL),
(4988, 22, 'heading_typography', 'h3_heading_font_weight_style_i', NULL, NULL),
(4989, 22, 'heading_typography', 'h3_heading_font_font-subsets_i', NULL, NULL),
(4990, 22, 'heading_typography', 'h3_heading_font_text-align', NULL, NULL),
(4991, 22, 'heading_typography', 'h3_heading_font_text-transform', NULL, NULL),
(4992, 22, 'heading_typography', 'h3_heading_font_u_font-size', NULL, NULL),
(4993, 22, 'heading_typography', 'h3_heading_font_u_line-height', NULL, NULL),
(4994, 22, 'heading_typography', 'h3_heading_font_u_word-spacing', NULL, NULL),
(4995, 22, 'heading_typography', 'h3_heading_font_u_letter-spacing', NULL, NULL),
(4996, 22, 'heading_typography', 'h3_heading_font_color', NULL, NULL),
(4997, 22, 'heading_typography', 'h4_heading_typography_google_link_s', NULL, NULL),
(4998, 22, 'heading_typography', 'h4_heading_typography_css_i', NULL, NULL),
(4999, 22, 'heading_typography', 'h4_heading_font_unit_i', NULL, NULL),
(5000, 22, 'heading_typography', 'h4_heading_font_font-family', NULL, NULL),
(5001, 22, 'heading_typography', 'h4_heading_font_font-style', NULL, NULL),
(5002, 22, 'heading_typography', 'h4_heading_font_font-weight', NULL, NULL),
(5003, 22, 'heading_typography', 'h4_heading_font_weight_style_i', NULL, NULL),
(5004, 22, 'heading_typography', 'h4_heading_font_font-subsets_i', NULL, NULL),
(5005, 22, 'heading_typography', 'h4_heading_font_text-align', NULL, NULL),
(5006, 22, 'heading_typography', 'h4_heading_font_text-transform', NULL, NULL),
(5007, 22, 'heading_typography', 'h4_heading_font_u_font-size', NULL, NULL),
(5008, 22, 'heading_typography', 'h4_heading_font_u_line-height', NULL, NULL),
(5009, 22, 'heading_typography', 'h4_heading_font_u_word-spacing', NULL, NULL),
(5010, 22, 'heading_typography', 'h4_heading_font_u_letter-spacing', NULL, NULL),
(5011, 22, 'heading_typography', 'h4_heading_font_color', NULL, NULL),
(5012, 22, 'heading_typography', 'h5_heading_typography_google_link_s', NULL, NULL),
(5013, 22, 'heading_typography', 'h5_heading_typography_css_i', NULL, NULL),
(5014, 22, 'heading_typography', 'h5_heading_font_unit_i', NULL, NULL),
(5015, 22, 'heading_typography', 'h5_heading_font_font-family', NULL, NULL),
(5016, 22, 'heading_typography', 'h5_heading_font_font-style', NULL, NULL),
(5017, 22, 'heading_typography', 'h5_heading_font_font-weight', NULL, NULL),
(5018, 22, 'heading_typography', 'h5_heading_font_weight_style_i', NULL, NULL),
(5019, 22, 'heading_typography', 'h5_heading_font_font-subsets_i', NULL, NULL),
(5020, 22, 'heading_typography', 'h5_heading_font_text-align', NULL, NULL),
(5021, 22, 'heading_typography', 'h5_heading_font_text-transform', NULL, NULL),
(5022, 22, 'heading_typography', 'h5_heading_font_u_font-size', NULL, NULL),
(5023, 22, 'heading_typography', 'h5_heading_font_u_line-height', NULL, NULL),
(5024, 22, 'heading_typography', 'h5_heading_font_u_word-spacing', NULL, NULL),
(5025, 22, 'heading_typography', 'h5_heading_font_u_letter-spacing', NULL, NULL),
(5026, 22, 'heading_typography', 'h5_heading_font_color', NULL, NULL),
(5027, 22, 'heading_typography', 'h6_heading_typography_google_link_s', NULL, NULL),
(5028, 22, 'heading_typography', 'h6_heading_typography_css_i', NULL, NULL),
(5029, 22, 'heading_typography', 'h6_heading_font_unit_i', NULL, NULL),
(5030, 22, 'heading_typography', 'h6_heading_font_font-family', NULL, NULL),
(5031, 22, 'heading_typography', 'h6_heading_font_font-style', NULL, NULL),
(5032, 22, 'heading_typography', 'h6_heading_font_font-weight', NULL, NULL),
(5033, 22, 'heading_typography', 'h6_heading_font_weight_style_i', NULL, NULL),
(5034, 22, 'heading_typography', 'h6_heading_font_font-subsets_i', NULL, NULL),
(5035, 22, 'heading_typography', 'h6_heading_font_text-align', NULL, NULL),
(5036, 22, 'heading_typography', 'h6_heading_font_text-transform', NULL, NULL),
(5037, 22, 'heading_typography', 'h6_heading_font_u_font-size', NULL, NULL),
(5038, 22, 'heading_typography', 'h6_heading_font_u_line-height', NULL, NULL),
(5039, 22, 'heading_typography', 'h6_heading_font_u_word-spacing', NULL, NULL),
(5040, 22, 'heading_typography', 'h6_heading_font_u_letter-spacing', NULL, NULL),
(5041, 22, 'heading_typography', 'h6_heading_font_color', NULL, NULL),
(5042, 22, 'menu_typography', 'menu_typography_google_link_s', NULL, NULL),
(5043, 22, 'menu_typography', 'menu_typography_css_i', NULL, NULL),
(5044, 22, 'menu_typography', 'menu_font_unit_i', NULL, NULL),
(5045, 22, 'menu_typography', 'menu_font_font-family', NULL, NULL),
(5046, 22, 'menu_typography', 'menu_font_font-style', NULL, NULL),
(5047, 22, 'menu_typography', 'menu_font_font-weight', NULL, NULL),
(5048, 22, 'menu_typography', 'menu_font_weight_style_i', NULL, NULL),
(5049, 22, 'menu_typography', 'menu_font_font-subsets_i', NULL, NULL),
(5050, 22, 'menu_typography', 'menu_font_text-align', NULL, NULL),
(5051, 22, 'menu_typography', 'menu_font_text-transform', NULL, NULL),
(5052, 22, 'menu_typography', 'menu_font_u_font-size', NULL, NULL),
(5053, 22, 'menu_typography', 'menu_font_u_line-height', NULL, NULL),
(5054, 22, 'menu_typography', 'menu_font_u_word-spacing', NULL, NULL),
(5055, 22, 'menu_typography', 'menu_font_u_letter-spacing', NULL, NULL),
(5056, 22, 'menu_typography', 'menu_font_color', NULL, NULL),
(5057, 22, 'menu_typography', 'sub_menu_typography_google_link_s', NULL, NULL),
(5058, 22, 'menu_typography', 'sub_menu_typography_css_i', NULL, NULL),
(5059, 22, 'menu_typography', 'sub_menu_font_unit_i', NULL, NULL),
(5060, 22, 'menu_typography', 'sub_menu_font_font-family', NULL, NULL),
(5061, 22, 'menu_typography', 'sub_menu_font_font-style', NULL, NULL),
(5062, 22, 'menu_typography', 'sub_menu_font_font-weight', NULL, NULL),
(5063, 22, 'menu_typography', 'sub_menu_font_weight_style_i', NULL, NULL),
(5064, 22, 'menu_typography', 'sub_menu_font_subsets_i', NULL, NULL),
(5065, 22, 'menu_typography', 'sub_menu_font_text-align', NULL, NULL),
(5066, 22, 'menu_typography', 'sub_menu_font_text-transform', NULL, NULL),
(5067, 22, 'menu_typography', 'sub_menu_font_u_font-size', NULL, NULL),
(5068, 22, 'menu_typography', 'sub_menu_font_u_line-height', NULL, NULL),
(5069, 22, 'menu_typography', 'sub_menu_font_u_word-spacing', NULL, NULL),
(5070, 22, 'menu_typography', 'sub_menu_font_u_letter-spacing', NULL, NULL),
(5071, 22, 'menu_typography', 'sub_menu_font_color', NULL, NULL),
(5072, 22, 'footer', 'footer_variation', 'footer-1', NULL),
(5146, 22, 'footer', 'footer_1_newsletter', '1', NULL),
(5147, 22, 'footer', 'footer_1_widget_bg_color', '', NULL),
(5148, 22, 'footer', 'footer_1_widget_bg_color_transparent', '0', NULL),
(5149, 22, 'footer', 'footer_1_widget_text_color', '', NULL),
(5150, 22, 'footer', 'footer_1_widget_text_color_transparent', '0', NULL),
(5151, 22, 'footer', 'footer_1_widget_title_style', 'style-2', NULL),
(5152, 22, 'footer', 'footer_1_widget_title_s1_after_color', '#ffffff', NULL),
(5153, 22, 'footer', 'footer_1_widget_title_s1_after_color_transparent', '0', NULL),
(5154, 22, 'footer', 'footer_1_widget_anchor_hover_color', '', NULL),
(5155, 22, 'footer', 'footer_1_widget_anchor_hover_color_transparent', '0', NULL),
(5156, 22, 'footer', 'footer_1_bottom_bg_color', '', NULL),
(5157, 22, 'footer', 'footer_1_bottom_bg_color_transparent', '0', NULL),
(5158, 22, 'footer', 'footer_1_bottom_menu', '31', NULL),
(5159, 22, 'footer', 'footer_2_middle_bg_color', '', NULL),
(5160, 22, 'footer', 'footer_2_middle_bg_color_transparent', '0', NULL),
(5161, 22, 'footer', 'footer_2_middle_text', 'We are the most popular news portal in the world. Here we publish all kinds of the latest news.', NULL),
(5162, 22, 'footer', 'footer_2_middle_text_color', '', NULL),
(5163, 22, 'footer', 'footer_2_middle_text_color_transparent', '0', NULL),
(5164, 22, 'footer', 'footer_2_middle_social_color', '', NULL),
(5165, 22, 'footer', 'footer_2_middle_social_color_transparent', '0', NULL),
(5166, 22, 'footer', 'footer_2_middle_social_bg_color', '', NULL),
(5167, 22, 'footer', 'footer_2_middle_social_bg_color_transparent', '0', NULL),
(5168, 22, 'footer', 'footer_2_middle_social_hover_color', '', NULL),
(5169, 22, 'footer', 'footer_2_middle_social_hover_color_transparent', '0', NULL),
(5170, 22, 'footer', 'footer_2_middle_social_hover_bg_color', '', NULL),
(5171, 22, 'footer', 'footer_2_middle_social_hover_bg_color_transparent', '0', NULL),
(5172, 22, 'footer', 'footer_2_bottom_bg_color', '', NULL),
(5173, 22, 'footer', 'footer_2_bottom_bg_color_transparent', '0', NULL),
(5174, 22, 'footer', 'footer_2_bottom_menu', '31', NULL),
(5235, 22, 'footer', 'footer_1_newsletter_position', 'top', NULL),
(5236, 22, 'footer', 'footer_1_newsletter_bg_color', '', NULL),
(5237, 22, 'footer', 'footer_1_newsletter_bg_color_transparent', '0', NULL),
(5238, 22, 'footer', 'footer_1_newsletter_button_bg_color', '', NULL),
(5239, 22, 'footer', 'footer_1_newsletter_button_bg_color_transparent', '0', NULL),
(5240, 22, 'footer', 'footer_1_newsletter_button_text_color', '', NULL),
(5241, 22, 'footer', 'footer_1_newsletter_button_text_color_transparent', '0', NULL),
(5242, 22, 'footer', 'footer_1_newsletter_social_color', '', NULL),
(5243, 22, 'footer', 'footer_1_newsletter_social_color_transparent', '0', NULL),
(5244, 22, 'footer', 'footer_1_newsletter_social_bg_color', '', NULL),
(5245, 22, 'footer', 'footer_1_newsletter_social_bg_color_transparent', '0', NULL),
(5246, 22, 'footer', 'footer_1_newsletter_social_hover_color', '', NULL),
(5247, 22, 'footer', 'footer_1_newsletter_social_hover_color_transparent', '0', NULL),
(5248, 22, 'footer', 'footer_1_newsletter_social_hover_bg_color', '', NULL),
(5249, 22, 'footer', 'footer_1_newsletter_social_hover_bg_color_transparent', '0', NULL),
(5250, 22, 'footer', 'footer_1_widget_title_color', '', NULL),
(5251, 22, 'footer', 'footer_1_widget_title_color_transparent', '0', NULL),
(5354, 22, 'sidebar_options', 'custom_sidebar', NULL, NULL),
(5355, 22, 'sidebar_options', 'widget_background_color', NULL, NULL),
(5356, 22, 'sidebar_options', 'widget_background_color_transparent', NULL, NULL),
(5357, 22, 'sidebar_options', 'widget_margin_top', NULL, NULL),
(5358, 22, 'sidebar_options', 'widget_margin_right', NULL, NULL),
(5359, 22, 'sidebar_options', 'widget_margin_bottom', NULL, NULL),
(5360, 22, 'sidebar_options', 'widget_margin_left', NULL, NULL),
(5361, 22, 'sidebar_options', 'widget_margin_unit', NULL, NULL),
(5362, 22, 'sidebar_options', 'widget_padding_top', NULL, NULL),
(5363, 22, 'sidebar_options', 'widget_padding_right', NULL, NULL),
(5364, 22, 'sidebar_options', 'widget_padding_bottom', NULL, NULL),
(5365, 22, 'sidebar_options', 'widget_padding_left', NULL, NULL),
(5366, 22, 'sidebar_options', 'widget_padding_unit', NULL, NULL),
(5367, 22, 'sidebar_options', 'widget_title_color', NULL, NULL),
(5368, 22, 'sidebar_options', 'widget_title_color_transparent', NULL, NULL),
(5369, 22, 'sidebar_options', 'widget_title_s1_after_color', NULL, NULL),
(5370, 22, 'sidebar_options', 'widget_title_s1_after_color_transparent', NULL, NULL),
(5371, 22, 'sidebar_options', 'widget_title_after_color', NULL, NULL),
(5372, 22, 'sidebar_options', 'widget_title_after_color_transparent', NULL, NULL),
(5373, 22, 'page', 'page_breadcrumb', '1', NULL),
(5374, 22, 'page_404', 'page_404_image', '1070', NULL),
(5375, 22, 'page_404', 'page_404_title', 'Ooops... Page Not Found!', NULL),
(5376, 22, 'page_404', 'page_404_subtitle', 'Try using the button below to go to main page of the site', NULL),
(5377, 22, 'page_404', 'page_404_button_text', 'Back To Home Page', NULL),
(5378, 22, 'page_404', 'custom_404_page_c', '1', NULL),
(5379, 22, 'page_404', 'page_404_bg_color', '#28c3c0', NULL),
(5380, 22, 'page_404', 'page_404_bg_color_transparent', '0', NULL),
(5381, 22, 'page_404', 'page_404_text_color', '#ffffff', NULL),
(5382, 22, 'page_404', 'page_404_text_color_transparent', '0', NULL),
(5385, 22, 'page_404', 'custom_404_page', '1', NULL),
(5386, 22, 'custom_css', 'custom_css_code', '', NULL),
(5387, 22, 'custom_fonts', 'custom_font_1', '1', NULL),
(5388, 22, 'custom_fonts', 'custom_font_1_woff', '', NULL),
(5389, 22, 'custom_fonts', 'custom_font_1_ttf', 'RubikGemstones-Regular.ttf', NULL),
(5390, 22, 'custom_fonts', 'custom_font_1_eot', '', NULL),
(5391, 22, 'custom_fonts', 'custom_font_2', '0', NULL),
(5392, 22, 'custom_fonts', 'custom_font_1_ttf_file', '/opt/lampp/temp/phpWgh8Do', NULL),
(5413, 22, 'subscribe', 'mailchimp_api_key', '', NULL),
(5414, 22, 'subscribe', 'mailchimp_list_id', '', NULL),
(5415, 22, 'subscribe', 'custom_footer_subscribe', '0', NULL),
(5416, 22, 'subscribe', 'newsletter_bg_image', NULL, NULL),
(5417, 22, 'subscribe', 'newsletter_title_color', NULL, NULL),
(5418, 22, 'subscribe', 'newsletter_title_color_transparent', NULL, NULL),
(5419, 22, 'subscribe', 'newsletter_subtitle_color', NULL, NULL),
(5420, 22, 'subscribe', 'newsletter_subtitle_color_transparent', NULL, NULL),
(5421, 22, 'subscribe', 'newsletter_button_color', NULL, NULL),
(5422, 22, 'subscribe', 'newsletter_button_color_transparent', NULL, NULL),
(5423, 22, 'gdpr', 'gdpr_status', '1', NULL),
(5424, 22, 'gdpr', 'gdpr_btn_label', 'Accept Cookie', NULL),
(5425, 22, 'gdpr', 'gdpr_message', '<p> <span style=\"font-size: 12px;\">Please Accept Cookies for Better Performance  </span></p>', NULL),
(5426, 22, 'gdpr', 'gdpr_position_class', 'left', NULL),
(5427, 22, 'gdpr', 'gdpr_bg_color', '#4b0d02', NULL),
(5428, 22, 'gdpr', 'gdpr_bg_color_transparent', '0', NULL),
(5429, 22, 'website_popup', 'website_popup_status', '0', NULL),
(5430, 22, 'website_popup', 'website_popup_content', '<p><img src=\"https://newslooks.themelooks.us/public/uploaded/blog/content/blog_content_image17015137241018016896.png\"><br></p><h2 style=\"text-align: center; \">Subscribe To Our Newsletter</h2><p style=\"text-align: center;\">Subscribe To our newsleetr for lattest news about word, sports, entertainment, war etc.</p>', NULL),
(5431, 22, 'website_popup', 'website_popup_subscribe_status', '0', NULL),
(5432, 22, 'website_popup', 'files', '/tmp/phptpOFmZ', NULL),
(5433, 22, 'theme_color', 'theme_primary_color', '', NULL),
(5434, 22, 'contact', 'contact_sent_email', 'mahfuzur.themelooks@example.test', NULL),
(5435, 22, 'footer', 'footer_1_widget_title_after_color', '', NULL),
(5436, 22, 'footer', 'footer_1_widget_title_after_color_transparent', '0', NULL),
(5437, 22, 'footer', 'footer_logo', '1138', NULL),
(5438, 22, 'header', 'header_top_multi_language', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tl_theme_sidebars`
--

CREATE TABLE `tl_theme_sidebars` (
  `id` int(11) NOT NULL,
  `sidebar_name` varchar(255) DEFAULT NULL,
  `theme_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_theme_sidebars`
--

INSERT INTO `tl_theme_sidebars` (`id`, `sidebar_name`, `theme_id`, `created_at`, `updated_at`) VALUES
(9, 'Post Page Sidebar', 22, '2023-09-02 06:15:46', '2024-12-04 11:24:18'),
(10, 'Single Post Sidebar', 22, '2023-09-02 06:15:46', '2024-12-04 11:24:18'),
(13, 'Footer Variation 1 Sidebar', 22, '2023-10-11 09:08:58', '2023-10-11 09:08:58');

-- --------------------------------------------------------

--
-- Table structure for table `tl_theme_translations`
--

CREATE TABLE `tl_theme_translations` (
  `id` int(11) NOT NULL,
  `lang` varchar(250) DEFAULT NULL,
  `lang_key` text DEFAULT NULL,
  `lang_value` longtext DEFAULT NULL,
  `theme` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tl_theme_translations`
--

INSERT INTO `tl_theme_translations` (`id`, `lang`, `lang_key`, `lang_value`, `theme`, `created_at`, `updated_at`) VALUES
(42974, 'en', 'Search Keyword', 'Search Keyword', 'newslooks', '2023-11-28 11:23:29', '2023-11-28 11:23:29'),
(42975, 'en', 'Read More', 'Read More', 'newslooks', '2023-11-28 11:23:29', '2023-11-28 11:23:29'),
(42976, 'en', 'View More', 'View More', 'newslooks', '2023-11-28 11:23:29', '2023-11-28 11:23:29'),
(42977, 'en', 'Recent', 'Recent', 'newslooks', '2023-11-28 11:23:30', '2023-11-28 11:23:30'),
(42978, 'en', 'Popular', 'Popular', 'newslooks', '2023-11-28 11:23:30', '2023-11-28 11:23:30'),
(42979, 'en', 'Comments', 'Comments', 'newslooks', '2023-11-28 11:23:30', '2023-11-28 11:23:30'),
(42980, 'en', 'Videos', 'Videos', 'newslooks', '2023-11-28 11:23:30', '2023-11-28 11:23:30'),
(42981, 'en', 'Vote', 'Vote', 'newslooks', '2023-11-28 11:23:30', '2023-11-28 11:23:30'),
(42982, 'en', 'Enter Your Email', 'Enter Your Email', 'newslooks', '2023-11-28 11:23:30', '2023-11-28 11:23:30'),
(42983, 'en', 'Subscribe', 'Subscribe', 'newslooks', '2023-11-28 11:23:30', '2023-11-28 11:23:30'),
(42984, 'en', 'Remove From Reading List', 'Remove From Reading List', 'newslooks', '2023-11-28 11:23:30', '2023-11-28 11:23:30'),
(42985, 'en', 'Add To Reading List', 'Add To Reading List', 'newslooks', '2023-11-28 11:23:30', '2023-11-28 11:23:30'),
(43014, 'en', 'Home', 'Home', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43015, 'en', 'Posts', 'Posts', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43016, 'en', 'Share', 'Share', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43017, 'en', 'Read Prev', 'Read Prev', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43018, 'en', 'Read Next', 'Read Next', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43019, 'en', 'Leave a Reply', 'Leave a Reply', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43020, 'en', 'Cancel Reply', 'Cancel Reply', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43021, 'en', 'Enter Comments', 'Enter Comments', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43022, 'en', 'Post Comment', 'Post Comment', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43025, 'en', 'Error!', 'Error!', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43026, 'en', 'Comment Request Failed', 'Comment Request Failed', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43027, 'en', 'Content Request Failed', 'Content Request Failed', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43028, 'en', 'Success!', 'Success!', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43029, 'en', 'Warning!', 'Warning!', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43030, 'en', 'Pending!', 'Pending!', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43031, 'en', 'Comment Submit Failed', 'Comment Submit Failed', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43032, 'en', 'Leave a Reply to', 'Leave a Reply to', 'newslooks', '2023-11-28 11:37:22', '2023-11-28 11:37:22'),
(43033, 'en', 'Comment Loaded Successfully', 'Comment Loaded Successfully', 'newslooks', '2023-11-28 11:37:30', '2023-11-28 11:37:30'),
(43034, 'en', 'votes', 'votes', 'newslooks', '2023-11-28 11:49:56', '2023-11-28 11:49:56'),
(43035, 'en', 'Login', 'Login', 'newslooks', '2023-11-28 11:51:21', '2023-11-28 11:51:21'),
(43036, 'en', 'Email Address', 'Email Address', 'newslooks', '2023-11-28 11:51:21', '2023-11-28 11:51:21'),
(43037, 'en', 'Password', 'Password', 'newslooks', '2023-11-28 11:51:21', '2023-11-28 11:51:21'),
(43038, 'en', 'Log In', 'Log In', 'newslooks', '2023-11-28 11:51:21', '2023-11-28 11:51:21'),
(43039, 'en', 'If you have no account?', 'If you have no account?', 'newslooks', '2023-11-28 11:51:21', '2023-11-28 11:51:21'),
(43040, 'en', 'Register', 'Register', 'newslooks', '2023-11-28 11:51:21', '2023-11-28 11:51:21'),
(43041, 'en', 'Registration', 'Registration', 'newslooks', '2023-11-28 11:51:26', '2023-11-28 11:51:26'),
(43042, 'en', 'Name', 'Name', 'newslooks', '2023-11-28 11:51:26', '2023-11-28 11:51:26'),
(43043, 'en', 'Retype Password', 'Retype Password', 'newslooks', '2023-11-28 11:51:26', '2023-11-28 11:51:26'),
(43044, 'en', 'If you already have an account?', 'If you already have an account?', 'newslooks', '2023-11-28 11:51:26', '2023-11-28 11:51:26'),
(43045, 'en', 'This Post is Password protected. Please Enter The Correct Password To Read The Post Content.', 'This Post is Password protected. Please Enter The Correct Password To Read The Post Content.', 'newslooks', '2023-11-29 11:44:55', '2023-11-29 11:44:55'),
(43046, 'en', 'Reply', 'Reply', 'newslooks', '2023-11-29 11:45:24', '2023-11-29 11:45:24'),
(43047, 'en', 'See Replies', 'See Replies', 'newslooks', '2023-11-29 11:45:24', '2023-11-29 11:45:24'),
(43048, 'en', 'Featured Post', 'Featured Post', 'newslooks', '2023-12-02 16:38:16', '2023-12-02 16:38:16'),
(43049, 'en', 'No More Posts', 'No More Posts', 'newslooks', '2023-12-02 16:38:17', '2023-12-02 16:38:17'),
(43050, 'en', 'Your email address will not be published.', 'Your email address will not be published.', 'newslooks', '2023-12-02 16:53:31', '2023-12-02 16:53:31'),
(43051, 'en', 'optional', 'optional', 'newslooks', '2023-12-02 16:53:31', '2023-12-02 16:53:31'),
(43052, 'en', 'Enter Name', 'Enter Name', 'newslooks', '2023-12-02 16:53:31', '2023-12-02 16:53:31'),
(43053, 'en', 'Enter Email', 'Enter Email', 'newslooks', '2023-12-02 16:53:31', '2023-12-02 16:53:31'),
(43054, 'en', 'Your Website (optional)', 'Your Website (optional)', 'newslooks', '2023-12-02 16:53:31', '2023-12-02 16:53:31'),
(43055, 'en', 'Tag', 'Tag', 'newslooks', '2023-12-02 17:20:41', '2023-12-02 17:20:41'),
(43056, 'en', 'No More Comments', 'No More Comments', 'newslooks', '2023-12-02 17:21:43', '2023-12-02 17:21:43'),
(43057, 'en', 'Please Check your Email to confirm your Subscription', 'Please Check your Email to confirm your Subscription', 'newslooks', '2023-12-03 10:08:27', '2023-12-03 10:08:27'),
(43058, 'en', 'Please Enter a Valid Email', 'Please Enter a Valid Email', 'newslooks', '2023-12-03 10:09:30', '2023-12-03 10:09:30'),
(43059, 'en', 'min read', 'min read', 'newslooks', '2023-12-03 11:46:59', '2023-12-03 11:46:59'),
(43060, 'en', 'Change Vote', 'Change Vote', 'newslooks', '2023-12-03 16:49:17', '2023-12-03 16:49:17'),
(43061, 'en', 'Category', 'Category', 'newslooks', '2023-12-05 16:17:07', '2023-12-05 16:17:07'),
(43062, 'en', 'Search', 'Search', 'newslooks', '2023-12-06 14:53:46', '2023-12-06 14:53:46'),
(43063, 'en', 'Breaking News', 'Breaking News', 'newslooks', '2023-12-06 16:10:49', '2023-12-06 16:10:49'),
(43064, 'en', 'We are the most popular news portal in the world. Here we publish all kinds of the latest news.', 'We are the most popular news portal in the world. Here we publish all kinds of the latest news.', 'newslooks', '2023-12-09 17:22:18', '2023-12-09 17:22:18'),
(43065, 'en', 'Login successful', 'Login successful', 'newslooks', '2023-12-10 17:24:16', '2023-12-10 17:24:16'),
(43066, 'en', 'User Dashboard', 'User Dashboard', 'newslooks', '2023-12-10 17:24:17', '2023-12-10 17:24:17'),
(43067, 'en', 'Reading List', 'Reading List', 'newslooks', '2023-12-10 17:24:17', '2023-12-10 17:24:17'),
(43068, 'en', 'Image', 'Image', 'newslooks', '2023-12-10 17:24:17', '2023-12-10 17:24:17'),
(43069, 'en', 'Blog', 'Blog', 'newslooks', '2023-12-10 17:24:17', '2023-12-10 17:24:17'),
(43070, 'en', 'Action', 'Action', 'newslooks', '2023-12-10 17:24:17', '2023-12-10 17:24:17'),
(43071, 'en', 'Remove Confirmation', 'Remove Confirmation', 'newslooks', '2023-12-10 17:24:17', '2023-12-10 17:24:17'),
(43072, 'en', 'Are you sure to remove this', 'Are you sure to remove this', 'newslooks', '2023-12-10 17:24:17', '2023-12-10 17:24:17'),
(43073, 'en', 'Cancel', 'Cancel', 'newslooks', '2023-12-10 17:24:17', '2023-12-10 17:24:17'),
(43074, 'en', 'Remove', 'Remove', 'newslooks', '2023-12-10 17:24:17', '2023-12-10 17:24:17'),
(43075, 'en', 'Post Added To Reading List', 'Post Added To Reading List', 'newslooks', '2023-12-11 11:39:16', '2023-12-11 11:39:16'),
(43076, 'en', 'User Comments', 'User Comments', 'newslooks', '2023-12-11 11:39:27', '2023-12-11 11:39:27'),
(43077, 'en', 'All', 'All', 'newslooks', '2023-12-11 11:39:27', '2023-12-11 11:39:27'),
(43078, 'en', 'Pending', 'Pending', 'newslooks', '2023-12-11 11:39:27', '2023-12-11 11:39:27'),
(43079, 'en', 'Approve', 'Approve', 'newslooks', '2023-12-11 11:39:27', '2023-12-11 11:39:27'),
(43080, 'en', 'Spam', 'Spam', 'newslooks', '2023-12-11 11:39:27', '2023-12-11 11:39:27'),
(43081, 'en', 'Trash', 'Trash', 'newslooks', '2023-12-11 11:39:27', '2023-12-11 11:39:27'),
(43082, 'en', 'Comment', 'Comment', 'newslooks', '2023-12-11 11:39:27', '2023-12-11 11:39:27'),
(43083, 'en', 'Status', 'Status', 'newslooks', '2023-12-11 11:39:27', '2023-12-11 11:39:27'),
(43084, 'en', 'Submitted on', 'Submitted on', 'newslooks', '2023-12-11 11:39:27', '2023-12-11 11:39:27'),
(43085, 'en', 'User Profile', 'User Profile', 'newslooks', '2023-12-11 11:39:48', '2023-12-11 11:39:48'),
(43086, 'en', 'Update Profile', 'Update Profile', 'newslooks', '2023-12-11 11:39:48', '2023-12-11 11:39:48'),
(43087, 'en', 'Profile Picture', 'Profile Picture', 'newslooks', '2023-12-11 11:39:48', '2023-12-11 11:39:48'),
(43088, 'en', 'Your Name', 'Your Name', 'newslooks', '2023-12-11 11:39:48', '2023-12-11 11:39:48'),
(43089, 'en', 'Email', 'Email', 'newslooks', '2023-12-11 11:39:48', '2023-12-11 11:39:48'),
(43090, 'en', 'Your Email', 'Your Email', 'newslooks', '2023-12-11 11:39:48', '2023-12-11 11:39:48'),
(43091, 'en', 'Update', 'Update', 'newslooks', '2023-12-11 11:39:48', '2023-12-11 11:39:48'),
(43092, 'en', 'Update Password', 'Update Password', 'newslooks', '2023-12-11 11:39:48', '2023-12-11 11:39:48'),
(43093, 'en', 'Old Password', 'Old Password', 'newslooks', '2023-12-11 11:39:48', '2023-12-11 11:39:48'),
(43094, 'en', 'New Password', 'New Password', 'newslooks', '2023-12-11 11:39:48', '2023-12-11 11:39:48'),
(43095, 'en', 'Confirm Password', 'Confirm Password', 'newslooks', '2023-12-11 11:39:48', '2023-12-11 11:39:48'),
(43096, 'en', 'Confirm your password', 'Confirm your password', 'newslooks', '2023-12-11 11:39:48', '2023-12-11 11:39:48'),
(43097, 'en', 'Post Removed From Reading List', 'Post Removed From Reading List', 'newslooks', '2023-12-11 14:27:30', '2023-12-11 14:27:30'),
(43098, 'en', 'Recent Post', 'Recent Post', 'newslooks', '2023-12-11 15:22:00', '2023-12-11 15:22:00'),
(43099, 'en', 'Date', 'Date', 'newslooks', '2023-12-11 15:23:48', '2023-12-11 15:23:48'),
(43100, 'en', 'Author', 'Author', 'newslooks', '2023-12-11 15:23:54', '2023-12-11 15:23:54'),
(43101, 'en', 'Popular Post', 'Popular Post', 'newslooks', '2023-12-11 15:26:18', '2023-12-11 15:26:18'),
(43102, 'en', 'Name Field Is Required', 'Name Field Is Required', 'newslooks', '2023-12-11 15:38:36', '2023-12-11 15:38:36'),
(43103, 'en', 'Name field maximum value is 100 characters', 'Name field maximum value is 100 characters', 'newslooks', '2023-12-11 15:38:36', '2023-12-11 15:38:36'),
(43104, 'en', 'Email Field Is Required', 'Email Field Is Required', 'newslooks', '2023-12-11 15:38:36', '2023-12-11 15:38:36'),
(43105, 'en', 'Email must be a valid email', 'Email must be a valid email', 'newslooks', '2023-12-11 15:38:36', '2023-12-11 15:38:36'),
(43106, 'en', 'An account with this email already exists', 'An account with this email already exists', 'newslooks', '2023-12-11 15:38:36', '2023-12-11 15:38:36'),
(43107, 'en', 'Password Field Is Required', 'Password Field Is Required', 'newslooks', '2023-12-11 15:38:36', '2023-12-11 15:38:36'),
(43108, 'en', 'Password minimum value is 6 characters', 'Password minimum value is 6 characters', 'newslooks', '2023-12-11 15:38:36', '2023-12-11 15:38:36'),
(43109, 'en', 'Password maximum value is 18 characters', 'Password maximum value is 18 characters', 'newslooks', '2023-12-11 15:38:36', '2023-12-11 15:38:36'),
(43110, 'en', 'Confirm password does not match', 'Confirm password does not match', 'newslooks', '2023-12-11 15:38:37', '2023-12-11 15:38:37'),
(43111, 'en', 'Most Commented Post', 'Most Commented Post', 'newslooks', '2023-12-12 16:30:25', '2023-12-12 16:30:25'),
(43112, 'en', 'Related News', 'Related News', 'newslooks', '2023-12-14 16:38:06', '2023-12-14 16:38:06'),
(43113, 'en', 'In reply to', 'In reply to', 'newslooks', '2023-12-14 17:55:19', '2023-12-14 17:55:19'),
(43114, 'sa', 'In reply to', 'ردا على', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43115, 'sa', 'Related News', 'أخبار ذات صلة', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43116, 'sa', 'Most Commented Post', 'المشاركة الأكثر تعليقا', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43117, 'sa', 'Confirm password does not match', 'تأكيد كلمة المرور غير متطابقة', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43118, 'sa', 'Password maximum value is 18 characters', 'الحد الأقصى لقيمة كلمة المرور هو 18 حرفًا', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43119, 'sa', 'Password minimum value is 6 characters', 'الحد الأدنى لقيمة كلمة المرور هو 6 أحرف', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43120, 'sa', 'Password Field Is Required', 'حقل كلمة المرور مطلوب', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43121, 'sa', 'An account with this email already exists', 'يوجد حساب بهذا البريد الإلكتروني بالفعل', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43122, 'sa', 'Email must be a valid email', 'يجب أن يكون البريد الإلكتروني بريدًا إلكترونيًا صالحًا', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43123, 'sa', 'Email Field Is Required', 'حقل البريد الإلكتروني مطلوب', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43124, 'sa', 'Name field maximum value is 100 characters', 'الحد الأقصى لقيمة حقل الاسم هو 100 حرف', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43125, 'sa', 'Name Field Is Required', 'حقل الاسم مطلوب', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43126, 'sa', 'Popular Post', 'منشور مشهور', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43127, 'sa', 'Author', 'مؤلف', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43128, 'sa', 'Date', 'تاريخ', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43129, 'sa', 'Recent Post', 'المنشور الاخير', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43130, 'sa', 'Post Removed From Reading List', 'تمت إزالة المشاركة من قائمة القراءة', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43131, 'sa', 'Confirm your password', 'أكد رقمك السري', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43132, 'sa', 'Confirm Password', 'تأكيد كلمة المرور', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43133, 'sa', 'New Password', 'كلمة المرور الجديدة', 'newslooks', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(43134, 'en', '26-year-old health centre receptionist who enjoy going movies photography and social media playing above you picked up some tips.', '26-year-old health centre receptionist who enjoy going movies photography and social media playing above you picked up some tips.', 'newslooks', '2023-12-19 14:38:55', '2023-12-19 14:38:55'),
(43135, 'en', 'Most Viewed Post', 'Most Viewed Post', 'newslooks', '2023-12-23 11:56:36', '2023-12-23 11:56:36'),
(43136, 'sa', 'Breaking News', 'أخبار عاجلة', 'newslooks', '2023-12-26 17:45:00', '2023-12-26 17:45:00'),
(43137, 'en', 'by', 'by', 'newslooks', '2023-12-26 18:04:36', '2023-12-26 18:04:36'),
(43138, 'sa', 'We are the most popular news portal in the world. Here we publish all kinds of the latest news.', 'حن بوابة الأخبار الأكثر شعبية في العالم. هنا ننشر جميع أنواع آخر الأخبار.', 'newslooks', '2023-12-26 18:18:48', '2023-12-27 12:38:49'),
(43139, 'sa', 'Popular News', 'أخبار شعبية', 'newslooks', '2023-12-26 18:18:48', '2023-12-26 18:18:48'),
(43140, 'sa', 'Subscribe', 'يشترك', 'newslooks', '2023-12-27 10:08:42', '2023-12-27 10:08:42'),
(43141, 'sa', 'Enter Your Email', 'أدخل بريدك الإلكتروني', 'newslooks', '2023-12-27 10:09:34', '2023-12-27 10:09:34'),
(43142, 'sa', 'Home', 'بيت', 'newslooks', '2023-12-27 10:10:22', '2023-12-27 10:10:22'),
(43143, 'sa', 'No More Posts', 'لا مزيد من المشاركات', 'newslooks', '2023-12-27 10:10:49', '2023-12-27 10:10:49'),
(43144, 'sa', 'Posts', 'دعامات', 'newslooks', '2023-12-27 10:10:49', '2023-12-27 10:10:49'),
(43145, 'sa', 'Recent', 'مؤخرًا', 'newslooks', '2023-12-27 10:11:29', '2023-12-27 10:11:29'),
(43146, 'sa', 'Popular', 'شائع', 'newslooks', '2023-12-27 10:12:07', '2023-12-27 10:12:07'),
(43147, 'sa', 'User Comments', 'تعليقات المستخدم', 'newslooks', '2023-12-27 10:14:27', '2023-12-27 10:34:24'),
(43148, 'sa', 'No More Comments', 'لا المزيد من التعليقات', 'newslooks', '2023-12-27 10:14:27', '2023-12-27 10:14:45'),
(43149, 'sa', 'Enter Comments', 'أدخل التعليقات', 'newslooks', '2023-12-27 10:14:27', '2023-12-27 10:34:24'),
(43150, 'sa', 'Comments', 'تعليقات', 'newslooks', '2023-12-27 10:14:27', '2023-12-27 10:14:27'),
(43151, 'sa', 'Category', 'فئة', 'newslooks', '2023-12-27 10:36:15', '2023-12-27 10:36:15'),
(43152, 'sa', 'Tag', 'بطاقة شعار', 'newslooks', '2023-12-27 10:40:50', '2023-12-27 10:40:50'),
(43153, 'sa', 'Search Keyword', 'كلمة البحث', 'newslooks', '2023-12-27 10:42:31', '2023-12-27 10:42:31'),
(43154, 'sa', 'Search', 'يبحث', 'newslooks', '2023-12-27 10:43:04', '2023-12-27 10:43:04'),
(43155, 'sa', 'Read Prev', 'اقرأ السابق', 'newslooks', '2023-12-27 10:45:57', '2023-12-27 10:45:57'),
(43156, 'sa', 'Read Next', 'اقرأ التالي', 'newslooks', '2023-12-27 10:46:09', '2023-12-27 10:46:09'),
(43157, 'sa', 'Share', 'يشارك', 'newslooks', '2023-12-27 10:53:11', '2023-12-27 10:53:11'),
(43158, 'sa', 'by', 'بواسطة', 'newslooks', '2023-12-27 10:53:48', '2023-12-27 12:02:48'),
(43159, 'sa', 'Most Viewed Post', 'المشاركات الأكثر مشاهدة', 'newslooks', '2023-12-27 10:53:48', '2023-12-27 12:02:38'),
(43160, 'sa', '26-year-old health centre receptionist who enjoy going movies photography and social media playing above you picked up some tips.', 'موظف استقبال في المركز الصحي يبلغ من العمر 26 عامًا ويستمتع بمشاهدة الأفلام والتصوير الفوتوغرافي ووسائل التواصل الاجتماعي التي تلعب فوقك، وقد حصل على بعض النصائح.', 'newslooks', '2023-12-27 10:53:48', '2023-12-27 10:53:48'),
(43161, 'sa', 'Leave a Reply to', 'اترك ردا ل', 'newslooks', '2023-12-27 10:59:50', '2023-12-27 10:59:50'),
(43162, 'sa', 'Leave a Reply', 'اترك رد', 'newslooks', '2023-12-27 10:59:50', '2023-12-27 10:59:50'),
(43163, 'sa', 'Post Comment', 'أضف تعليقا', 'newslooks', '2023-12-27 11:00:14', '2023-12-27 11:00:14'),
(43164, 'en', 'Popular News', 'Popular News', 'newslooks', '2023-12-27 11:55:40', '2023-12-27 11:55:40'),
(43165, 'sa', 'Cancel Reply', 'إلغاء الرد', 'newslooks', '2023-12-27 12:03:28', '2023-12-27 12:03:28'),
(43166, 'sa', 'Reply', 'رد', 'newslooks', '2023-12-27 12:06:35', '2023-12-27 12:06:35'),
(43167, 'sa', 'See Replies', 'انظر الردود', 'newslooks', '2023-12-27 12:07:03', '2023-12-27 12:07:03'),
(43168, 'sa', 'Your email address will not be published.', 'لن يتم نشر عنوان بريدك الإلكتروني', 'newslooks', '2023-12-27 12:08:21', '2023-12-27 12:08:21'),
(43169, 'sa', 'Enter Email', 'أدخل البريد الإلكتروني', 'newslooks', '2023-12-27 12:08:53', '2023-12-27 12:08:53'),
(43170, 'sa', 'Enter Name', 'أدخل الاسم', 'newslooks', '2023-12-27 12:09:09', '2023-12-27 12:26:58'),
(43171, 'sa', 'Your Website (optional)', 'موقع الويب الخاص بك (اختياري)', 'newslooks', '2023-12-27 12:09:52', '2023-12-27 12:10:45'),
(43172, 'sa', 'optional', 'خياري', 'newslooks', '2023-12-27 12:09:52', '2023-12-27 12:09:52'),
(43173, 'en', 'Ooops... Page Not Found!', 'Ooops... Page Not Found!', 'newslooks', '2023-12-27 12:13:03', '2023-12-27 12:13:03'),
(43174, 'en', 'Try using the button below to go to main page of the site', 'Try using the button below to go to main page of the site', 'newslooks', '2023-12-27 12:13:03', '2023-12-27 12:13:03'),
(43175, 'en', 'Back To Home Page', 'Back To Home Page', 'newslooks', '2023-12-27 12:13:03', '2023-12-27 12:13:03'),
(43176, 'sa', 'Ooops... Page Not Found!', 'عفوًا... لم يتم العثور على الصفحة!', 'newslooks', '2023-12-27 12:19:15', '2023-12-27 12:19:15'),
(43177, 'sa', 'Try using the button below to go to main page of the site', 'حاول استخدام الزر أدناه للانتقال إلى الصفحة الرئيسية للموقع', 'newslooks', '2023-12-27 12:19:52', '2023-12-27 12:19:52'),
(43178, 'sa', 'Back To Home Page', 'العودة إلى الصفحة الرئيسية', 'newslooks', '2023-12-27 12:20:17', '2023-12-27 12:20:17'),
(43179, 'sa', 'Email Address', 'عنوان البريد الإلكتروني', 'newslooks', '2023-12-27 12:23:07', '2023-12-27 12:23:07'),
(43180, 'sa', 'Old Password', 'كلمة المرور القديمة', 'newslooks', '2023-12-27 12:23:59', '2023-12-27 12:23:59'),
(43181, 'sa', 'Update Password', 'تطوير كلمة السر', 'newslooks', '2023-12-27 12:23:59', '2023-12-27 12:23:59'),
(43182, 'sa', 'This Post is Password protected. Please Enter The Correct Password To Read The Post Content.', 'هذه التدوينة محمية بكلمة مرور. الرجاء إدخال كلمة المرور الصحيحة لقراءة محتوى المنشور.', 'newslooks', '2023-12-27 12:23:59', '2023-12-27 12:23:59'),
(43183, 'sa', 'Retype Password', 'أعد إدخال كلمة السر', 'newslooks', '2023-12-27 12:23:59', '2023-12-27 12:23:59'),
(43184, 'sa', 'Password', 'كلمة المرور', 'newslooks', '2023-12-27 12:23:59', '2023-12-27 12:23:59'),
(43185, 'sa', 'If you have no account?', 'إذا لم يكن لديك حساب', 'newslooks', '2023-12-27 12:24:25', '2023-12-27 12:24:25'),
(43186, 'sa', 'Login successful', 'تم تسجيل الدخول بنجاح', 'newslooks', '2023-12-27 12:24:49', '2023-12-27 12:24:49'),
(43187, 'sa', 'Login', 'تسجيل الدخول', 'newslooks', '2023-12-27 12:24:49', '2023-12-27 12:24:49'),
(43188, 'sa', 'Register', 'يسجل', 'newslooks', '2023-12-27 12:25:13', '2023-12-27 12:25:13'),
(43189, 'sa', 'Log In', 'تسجيل الدخول', 'newslooks', '2023-12-27 12:25:34', '2023-12-27 12:25:34'),
(43190, 'sa', 'If you already have an account?', 'إذا كان لديك حساب بالفعل', 'newslooks', '2023-12-27 12:26:06', '2023-12-27 12:26:06'),
(43191, 'sa', 'Your Name', 'اسمك', 'newslooks', '2023-12-27 12:26:58', '2023-12-27 12:26:58'),
(43192, 'sa', 'Name', 'اسم', 'newslooks', '2023-12-27 12:26:58', '2023-12-27 12:26:58'),
(43193, 'sa', 'Registration', 'تسجيل', 'newslooks', '2023-12-27 12:27:24', '2023-12-27 12:27:24'),
(43194, 'en', 'Login Credentials Does not Match', 'Login Credentials Does not Match', 'newslooks', '2023-12-27 12:30:59', '2023-12-27 12:30:59'),
(43195, 'sa', 'Login Credentials Does not Match', 'بيانات اعتماد تسجيل الدخول غير متطابقة', 'newslooks', '2023-12-27 12:31:18', '2023-12-27 12:31:18'),
(43196, 'sa', 'Add To Reading List', 'أضف إلى قائمة القراءة', 'newslooks', '2023-12-27 12:33:01', '2023-12-27 12:33:01'),
(43197, 'sa', 'Remove From Reading List', 'إزالة من قائمة القراءة', 'newslooks', '2023-12-27 12:33:01', '2023-12-27 12:33:01'),
(43198, 'sa', 'Vote', 'تصويت', 'newslooks', '2023-12-27 12:33:01', '2023-12-27 12:33:01'),
(43199, 'sa', 'Videos', 'أشرطة فيديو', 'newslooks', '2023-12-27 12:33:01', '2023-12-27 12:33:01'),
(43200, 'sa', 'View More', 'عرض المزيد', 'newslooks', '2023-12-27 12:33:01', '2023-12-27 12:33:01'),
(43201, 'sa', 'Read More', 'اقرأ أكثر', 'newslooks', '2023-12-27 12:33:01', '2023-12-27 12:33:01'),
(43202, 'sa', 'votes', 'الأصوات', 'newslooks', '2023-12-27 12:36:11', '2023-12-27 12:36:11'),
(43203, 'sa', 'Comment Loaded Successfully', 'تم تحميل التعليق بنجاح', 'newslooks', '2023-12-27 12:36:11', '2023-12-27 12:36:11'),
(43204, 'sa', 'Comment Submit Failed', 'فشل إرسال التعليق', 'newslooks', '2023-12-27 12:36:11', '2023-12-27 12:36:11'),
(43205, 'sa', 'Pending!', 'قيد الانتظار!', 'newslooks', '2023-12-27 12:36:11', '2023-12-27 12:36:11'),
(43206, 'sa', 'Warning!', 'تحذير!', 'newslooks', '2023-12-27 12:36:11', '2023-12-27 12:36:11'),
(43207, 'sa', 'Success!', 'نجاح!', 'newslooks', '2023-12-27 12:36:11', '2023-12-27 12:36:11'),
(43208, 'sa', 'Content Request Failed', 'فشل طلب المحتوى', 'newslooks', '2023-12-27 12:36:11', '2023-12-27 12:36:11'),
(43209, 'sa', 'Comment Request Failed', 'فشل طلب التعليق', 'newslooks', '2023-12-27 12:36:11', '2023-12-27 12:36:11'),
(43210, 'sa', 'Error!', 'خطأ!', 'newslooks', '2023-12-27 12:36:11', '2023-12-27 12:36:11'),
(43211, 'sa', 'related maga', '', 'newslooks', '2023-12-27 12:36:11', '2023-12-27 12:36:11'),
(43212, 'sa', 'Change Vote', 'تغيير التصويت', 'newslooks', '2023-12-27 12:37:24', '2023-12-27 12:37:24'),
(43213, 'sa', 'min read', 'دقيقة قراءة', 'newslooks', '2023-12-27 12:37:24', '2023-12-27 12:37:24'),
(43214, 'sa', 'Please Enter a Valid Email', 'يرجى إدخال البريد الإلكتروني الصحيح', 'newslooks', '2023-12-27 12:37:24', '2023-12-27 12:37:24'),
(43215, 'sa', 'Please Check your Email to confirm your Subscription', 'يرجى التحقق من بريدك الالكتروني لتأكيد اشتراكك', 'newslooks', '2023-12-27 12:37:24', '2023-12-27 12:37:24'),
(43216, 'sa', 'Featured Post', 'مشاركة مميزة', 'newslooks', '2023-12-27 12:37:24', '2023-12-27 12:37:24'),
(43217, 'sa', 'Trash', 'نفاية', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43218, 'sa', 'Spam', 'رسائل إلكترونية مزعجة', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43219, 'sa', 'Approve', 'يعتمد', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43220, 'sa', 'Pending', 'قيد الانتظار', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43221, 'sa', 'All', 'الجميع', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43222, 'sa', 'Post Added To Reading List', 'تمت إضافة المشاركة إلى قائمة القراءة', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43223, 'sa', 'Remove', 'يزيل', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43224, 'sa', 'Cancel', 'يلغي', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43225, 'sa', 'Are you sure to remove this', 'هل أنت متأكد من إزالة هذا', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43226, 'sa', 'Remove Confirmation', 'إزالة التأكيد', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43227, 'sa', 'Action', 'فعل', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43228, 'sa', 'Blog', 'مدونة', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43229, 'sa', 'Image', 'صورة', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43230, 'sa', 'Reading List', 'قائمة القراءة', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43231, 'sa', 'User Dashboard', 'لوحة تحكم المستخدم', 'newslooks', '2023-12-27 12:38:49', '2023-12-27 12:38:49'),
(43232, 'sa', 'Update', 'تحديث', 'newslooks', '2023-12-27 12:39:45', '2023-12-27 12:39:45'),
(43233, 'sa', 'Your Email', 'بريدك الالكتروني', 'newslooks', '2023-12-27 12:39:45', '2023-12-27 12:39:45'),
(43234, 'sa', 'Email', 'بريد إلكتروني', 'newslooks', '2023-12-27 12:39:45', '2023-12-27 12:39:45'),
(43235, 'sa', 'Profile Picture', 'الصوره الشخصيه', 'newslooks', '2023-12-27 12:39:45', '2023-12-27 12:39:45'),
(43236, 'sa', 'Update Profile', 'تحديث الملف', 'newslooks', '2023-12-27 12:39:45', '2023-12-27 12:39:45'),
(43237, 'sa', 'User Profile', 'ملف تعريفي للمستخدم', 'newslooks', '2023-12-27 12:39:45', '2023-12-27 12:39:45'),
(43238, 'sa', 'Submitted on', 'تم إرساله', 'newslooks', '2023-12-27 12:39:45', '2023-12-27 12:39:45'),
(43239, 'sa', 'Status', 'حالة', 'newslooks', '2023-12-27 12:39:45', '2023-12-27 12:39:45'),
(43240, 'sa', 'Comment', 'تعليق', 'newslooks', '2023-12-27 12:39:45', '2023-12-27 12:39:45'),
(43241, 'en', 'Dashboard', 'Dashboard', 'newslooks', '2023-12-27 12:42:28', '2023-12-27 12:42:28'),
(43242, 'sa', 'Dashboard', 'لوحة القيادة', 'newslooks', '2023-12-27 12:46:53', '2023-12-27 12:46:53'),
(43243, 'en', 'My Profile', 'My Profile', 'newslooks', '2023-12-27 12:47:21', '2023-12-27 12:47:21'),
(43244, 'en', 'Log Out', 'Log Out', 'newslooks', '2023-12-27 12:47:21', '2023-12-27 12:47:21'),
(43245, 'sa', 'Log Out', 'تسجيل خروج', 'newslooks', '2023-12-27 12:48:27', '2023-12-27 12:48:27'),
(43246, 'sa', 'My Profile', 'ملفي', 'newslooks', '2023-12-27 12:48:27', '2023-12-27 12:48:27'),
(43247, 'en', 'Profile updated successfully', 'Profile updated successfully', 'newslooks', '2023-12-28 06:23:05', '2023-12-28 06:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `tl_translations`
--

CREATE TABLE `tl_translations` (
  `id` int(11) NOT NULL,
  `lang` text DEFAULT NULL,
  `lang_key` text DEFAULT NULL,
  `lang_value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_translations`
--

INSERT INTO `tl_translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(6892, 'en', 'page_builder', 'Page Builder', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6893, 'en', 'preview', 'Preview', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6894, 'en', 'add_new_section', 'Add New Section', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6895, 'en', 'widgets', 'Widgets', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6896, 'en', 'save', 'Save', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6897, 'en', 'search_widget', 'Search Widget', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6898, 'en', 'delete_confirmation', 'Delete Confirmation', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6899, 'en', 'are_you_sure_to_delete_this', 'Are you sure to delete this', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6900, 'en', 'cancel', 'cancel', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6901, 'en', 'delete', 'Delete', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6902, 'en', 'select_layout', 'Select Layout', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6903, 'en', 'media_library', 'Media Library', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6904, 'en', 'upload_files', 'Upload Files', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6905, 'en', 'click_or_drop_files_here_to_upload', 'Click or Drop files here to upload', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6906, 'en', 'filter_media', 'Filter media', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6907, 'en', 'all_file_type', 'All File Type', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6908, 'en', 'all_dates', 'All dates', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6909, 'en', 'load_more', 'Load more', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6910, 'en', 'insert', 'Insert', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6911, 'en', 'attachment_details', 'ATTACHMENT DETAILS', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6916, 'en', 'page_section_create_request_failed', 'Page Section Create Request Failed', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6917, 'en', 'page_section_remove_request_failed', 'Page Section Remove Request Failed', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6918, 'en', 'section_properties', 'Section Properties', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6919, 'en', 'section_edit_request_failed', 'Section Edit Request Failed', '2023-11-28 11:54:17', '2023-11-28 11:54:17'),
(6920, 'en', 'widget_adding_request_failed', 'Widget Adding Request Failed', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6921, 'en', 'widget_removing_request_failed', 'Widget Removing Request Failed', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6922, 'en', 'widget_position_update_request_failed', 'Widget Position Update Request Failed', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6923, 'en', 'widget_order_request_failed', 'Widget Order Request Failed', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6924, 'en', 'properties', 'Properties', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6925, 'en', 'widget_edit_request_failed', 'Widget Edit Request Failed', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6926, 'en', 'properties_update_request_failed', 'Properties Update Request Failed', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6927, 'en', 'my_profile', 'My Profile', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6928, 'en', 'log_out', 'Log Out', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6929, 'en', 'clear_cache', 'Clear Cache', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6930, 'en', 'dashboard', 'Dashboard', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6931, 'en', 'media', 'Media', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6932, 'en', 'post', 'Post', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6933, 'en', 'all_posts', 'All Posts', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6934, 'en', 'add_new_post', 'Add New Post', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6935, 'en', 'categories', 'Categories', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6936, 'en', 'tags', 'Tags', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6937, 'en', 'comments', 'Comments', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6938, 'en', 'settings', 'Settings', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6939, 'en', 'post_share_settings', 'Post Share Settings', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6940, 'en', 'open_ai_settings', 'Open AI Settings', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6941, 'en', 'comment_settings', 'Comment Settings', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6942, 'en', 'pages', 'Pages', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6943, 'en', 'all_pages', 'All Pages', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6944, 'en', 'add_new_page', 'Add New Page', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6945, 'en', 'demo_plugin', 'Demo Plugin', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6946, 'en', 'addon', 'Addon', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6947, 'en', 'adoon', 'Adoon', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6948, 'en', 'appearances', 'Appearances', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6949, 'en', 'themes', 'Themes', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6950, 'en', 'menus', 'Menus', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6951, 'en', 'theme_options', 'Theme Options', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6952, 'en', 'general_settings', 'General Settings', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6953, 'en', 'manage_members', 'Manage Members', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6954, 'en', 'manage_voting', 'Manage Voting', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6955, 'en', 'plugins', 'Plugins', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6956, 'en', 'email_settings', 'Email settings', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6957, 'en', 'email_templates', 'Email Templates', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6958, 'en', 'languages', 'Languages', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6959, 'en', 'media_settings', 'Media settings', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6960, 'en', 'seo_settings', 'SEO settings', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6961, 'en', 'generate_sitemap', 'Generate Sitemap', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6962, 'en', 'system_users', 'System Users', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6963, 'en', 'users', 'Users', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6964, 'en', 'roles', 'Roles', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6965, 'en', 'permissions', 'Permissions', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6966, 'en', 'activity_logs', 'Activity Logs', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6967, 'en', 'login_activity', 'Login activity', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6968, 'en', 'system', 'System', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6969, 'en', 'update', 'Update', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6970, 'en', 'backups', 'Backups', '2023-11-28 11:54:18', '2023-11-28 11:54:18'),
(6971, 'en', 'alt_text', 'Alt Text', '2023-11-28 11:56:15', '2023-11-28 11:56:15'),
(6972, 'en', 'title', 'Title', '2023-11-28 11:56:15', '2023-11-28 11:56:15'),
(6973, 'en', 'caption', 'Caption', '2023-11-28 11:56:15', '2023-11-28 11:56:15'),
(6974, 'en', 'description', 'Description', '2023-11-28 11:56:15', '2023-11-28 11:56:15'),
(6975, 'en', 'add_new_language', 'Add New Language', '2023-11-28 12:02:16', '2023-11-28 12:02:16'),
(6976, 'en', 'name', 'Name', '2023-11-28 12:02:16', '2023-11-28 12:02:16'),
(6977, 'en', 'native_name', 'Native Name', '2023-11-28 12:02:16', '2023-11-28 12:02:16'),
(6978, 'en', 'code', 'Code', '2023-11-28 12:02:16', '2023-11-28 12:02:16'),
(6979, 'en', 'flag', 'Flag', '2023-11-28 12:02:16', '2023-11-28 12:02:16'),
(6980, 'en', 'rtl', 'RTL', '2023-11-28 12:02:16', '2023-11-28 12:02:16'),
(6981, 'en', 'status', 'Status', '2023-11-28 12:02:16', '2023-11-28 12:02:16'),
(6982, 'en', 'actions', 'Actions', '2023-11-28 12:02:16', '2023-11-28 12:02:16'),
(6983, 'en', 'backend_translations', 'Backend Translations', '2023-11-28 12:02:16', '2023-11-28 12:02:16'),
(6984, 'en', 'frontend_translations', 'Frontend Translations', '2023-11-28 12:02:16', '2023-11-28 12:02:16'),
(6985, 'en', 'edit', 'Edit', '2023-11-28 12:02:16', '2023-11-28 12:02:16'),
(6986, 'en', 'cencel', 'Cencel', '2023-11-28 12:02:16', '2023-11-28 12:02:16'),
(6987, 'en', 'key', 'Key', '2023-11-28 12:02:29', '2023-11-28 12:02:29'),
(6988, 'en', 'value', 'Value', '2023-11-28 12:02:29', '2023-11-28 12:02:29'),
(6989, 'en', 'save_changes', 'Save Changes', '2023-11-28 12:02:29', '2023-11-28 12:02:29'),
(6990, 'en', 'login', 'Login', '2023-11-29 04:41:49', '2023-11-29 04:41:49'),
(6991, 'en', 'login_to', 'Login To', '2023-11-29 04:41:49', '2023-11-29 04:41:49'),
(6992, 'en', 'email', 'Email', '2023-11-29 04:41:49', '2023-11-29 04:41:49'),
(6993, 'en', 'email_address', 'Email Address', '2023-11-29 04:41:49', '2023-11-29 04:41:49'),
(6994, 'en', 'password', 'Password', '2023-11-29 04:41:49', '2023-11-29 04:41:49'),
(6995, 'en', '', '********', '2023-11-29 04:41:49', '2023-11-29 04:41:49'),
(6996, 'en', 'forgot_password', 'Forgot Password?', '2023-11-29 04:41:49', '2023-11-29 04:41:49'),
(6997, 'en', 'log_in', 'Log In', '2023-11-29 04:41:49', '2023-11-29 04:41:49'),
(6998, 'en', 'email_is_required', 'Email is required', '2023-11-29 04:41:58', '2023-11-29 04:41:58'),
(6999, 'en', 'invalid_email_address', 'Invalid Email Address', '2023-11-29 04:41:58', '2023-11-29 04:41:58'),
(7000, 'en', 'password_is_required', 'Password is required', '2023-11-29 04:41:58', '2023-11-29 04:41:58'),
(7001, 'en', 'login_successful', 'Login successful', '2023-11-29 04:41:58', '2023-11-29 04:41:58'),
(7002, 'en', 'total_posts', 'Total Posts', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7003, 'en', 'total_pages', 'Total Pages', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7004, 'en', 'total_members', 'Total Members', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7005, 'en', 'total_comments', 'Total Comments', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7006, 'en', 'visitors_reports', 'Visitors Reports', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7007, 'en', 'monthly', 'Monthly', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7008, 'en', 'daily', 'Daily', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7009, 'en', 'post_status', 'Post Status', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7010, 'en', 'published', 'Published', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7011, 'en', 'scheduled', 'Scheduled', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7012, 'en', 'drafts', 'Drafts', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7013, 'en', 'pending', 'Pending', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7014, 'en', 'featured', 'Featured', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7015, 'en', 'top_countries', 'Top Countries', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7016, 'en', 'this_month', 'This Month', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7017, 'en', 'today', 'Today', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7018, 'en', 'top_browser', 'Top Browser', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7019, 'en', 'top_device', 'Top Device', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7020, 'en', 'latest_members', 'Latest Members', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7021, 'en', 'member', 'Member', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7022, 'en', 'joined_at', 'Joined At', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7023, 'en', 'most_viewed_post', 'Most Viewed Post', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7024, 'en', 'recent_comments', 'Recent Comments', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7025, 'en', 'author', 'Author', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7026, 'en', 'comment', 'Comment', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7027, 'en', 'submitted_on', 'Submitted on', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7028, 'en', 'popular_categories', 'Popular Categories', '2023-11-29 04:41:59', '2023-11-29 04:41:59'),
(7029, 'en', 'latest_posts', 'Latest Posts', '2023-11-29 04:42:00', '2023-11-29 04:42:00'),
(7030, 'en', 'latest_pages', 'Latest Pages', '2023-11-29 04:42:00', '2023-11-29 04:42:00'),
(7031, 'en', 'image', 'Image', '2023-11-29 10:41:04', '2023-11-29 10:41:04'),
(7032, 'en', 'site_title', 'Site Title', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7033, 'en', 'site_motto', 'Site Motto', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7034, 'en', 'site_moto', 'Site Moto', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7035, 'en', 'logo', 'Logo', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7036, 'en', 'choose_image', 'Choose image', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7037, 'en', 'logo_mobile', 'Logo (Mobile)', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7038, 'en', 'admin_logo', 'Admin Logo', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7039, 'en', 'admin_logo_mobile', 'Admin Logo (Mobile)', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7040, 'en', 'admin_dark_logo', 'Admin Dark Logo', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7041, 'en', 'admin_dark_logo_mobile', 'Admin Dark Logo (Mobile)', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7042, 'en', 'favicon', 'Favicon', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7043, 'en', 'default_language', 'Default Language', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7044, 'en', 'select_default_language', 'Select default language', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7045, 'en', 'select_default_timezone', 'Select Default Timezone', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7046, 'en', 'copyright_text', 'Copyright Text', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7047, 'en', 'submit', 'Submit', '2023-11-29 10:41:10', '2023-11-29 10:41:10'),
(7048, 'en', 'add_new_user', 'Add New User', '2023-11-29 10:41:19', '2023-11-29 10:41:19'),
(7049, 'en', 'uid', 'UID', '2023-11-29 10:41:19', '2023-11-29 10:41:19'),
(7050, 'en', 'update_system', 'Update System', '2023-11-29 10:41:25', '2023-11-29 10:41:25'),
(7051, 'en', 'system__server_information', 'System & Server Information', '2023-11-29 10:41:26', '2023-11-29 10:41:26'),
(7052, 'en', 'config', 'Config', '2023-11-29 10:41:26', '2023-11-29 10:41:26'),
(7053, 'en', 'config_name', 'Config Name', '2023-11-29 10:41:26', '2023-11-29 10:41:26'),
(7054, 'en', 'current', 'Current', '2023-11-29 10:41:26', '2023-11-29 10:41:26'),
(7055, 'en', 'recommended', 'Recommended', '2023-11-29 10:41:26', '2023-11-29 10:41:26'),
(7056, 'en', 'filesystem_permissions', 'Filesystem Permissions', '2023-11-29 10:41:26', '2023-11-29 10:41:26'),
(7057, 'en', 'file_or_folder', 'File or Folder', '2023-11-29 10:41:26', '2023-11-29 10:41:26'),
(7058, 'en', 'system_update', 'System Update', '2023-11-29 10:41:26', '2023-11-29 10:41:26'),
(7059, 'en', 'please_backup_your_files_and_database_before_update', 'Please backup your files and database before update.', '2023-11-29 10:41:26', '2023-11-29 10:41:26'),
(7060, 'en', 'generate_file_backup', 'Generate File Backup', '2023-11-29 10:41:26', '2023-11-29 10:41:26'),
(7061, 'en', 'generate_database_backup', 'Generate Database Backup', '2023-11-29 10:41:26', '2023-11-29 10:41:26'),
(7062, 'en', 'do_not_reload_or_close_tab_while_updating_it_may_takes_some_times', 'Do not reload or close tab while updating. It may takes some times', '2023-11-29 10:41:26', '2023-11-29 10:41:26'),
(7063, 'en', 'update_zip_file', 'Update Zip File', '2023-11-29 10:41:26', '2023-11-29 10:41:26'),
(7064, 'en', 'reset_section', 'Reset Section', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7065, 'en', 'reset_all', 'Reset All', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7066, 'en', 'general', 'General', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7067, 'en', 'back_to_top', 'Back To Top', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7068, 'en', 'preloader', 'Preloader', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7069, 'en', 'theme_color', 'Theme Color', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7070, 'en', 'contact', 'Contact', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7071, 'en', 'typography', 'Typography', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7072, 'en', 'body_typography', 'Body Typography', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7073, 'en', 'paragraph_typography', 'Paragraph Typography', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7074, 'en', 'heading_typography', 'Heading Typography', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7075, 'en', 'menu_typography', 'Menu Typography', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7076, 'en', 'button_typography', 'Button Typography', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7077, 'en', 'custom_fonts', 'Custom Fonts', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7078, 'en', 'header', 'Header', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7079, 'en', 'header_option', 'Header Option', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7080, 'en', 'post_option', 'Post Option', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7081, 'en', 'single_post_page', 'Single Post Page', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7082, 'en', 'sidebar_options', 'Sidebar Options', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7083, 'en', 'page', 'Page', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7084, 'en', '404_page', '404 Page', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7085, 'en', 'subscribe', 'Subscribe', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7086, 'en', 'social', 'Social', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7087, 'en', 'footer', 'Footer', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7088, 'en', 'custom_css', 'Custom Css', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7089, 'en', 'google_adsense', 'Google Adsense', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7090, 'en', 'website_popup', 'Website Popup', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7091, 'en', 'gdprcookie_consent', 'GDPR(Cookie Consent)', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7092, 'en', 'importexport', 'Import/Export', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7093, 'en', 'reset_confirmation', 'Reset Confirmation', '2023-11-30 04:30:54', '2023-11-30 04:30:54'),
(7094, 'en', 'are_you_sure_to_want_to_reset', 'Are you sure to want to reset', '2023-11-30 04:30:55', '2023-11-30 04:30:55'),
(7095, 'en', 'action_failed', 'Action Failed', '2023-11-30 04:30:55', '2023-11-30 04:30:55'),
(7096, 'en', 'select_font_subsets', 'Select Font Subsets', '2023-11-30 04:30:55', '2023-11-30 04:30:55'),
(7097, 'en', 'select_weight__style', 'Select Weight & Style', '2023-11-30 04:30:55', '2023-11-30 04:30:55'),
(7098, 'en', 'new_slide', 'New Slide', '2023-11-30 04:30:55', '2023-11-30 04:30:55'),
(7099, 'en', 'iconexample_fa_fafacebook', 'Icon(example: fa fa-facebook)', '2023-11-30 04:30:55', '2023-11-30 04:30:55'),
(7100, 'en', 'url', 'Url', '2023-11-30 04:30:55', '2023-11-30 04:30:55'),
(7101, 'en', 'select_color', 'Select Color', '2023-11-30 04:30:55', '2023-11-30 04:30:55'),
(7102, 'en', 'social_top_text', 'Social Top Text', '2023-11-30 04:30:55', '2023-11-30 04:30:55'),
(7103, 'en', 'social_bottom_text', 'Social Bottom Text', '2023-11-30 04:30:55', '2023-11-30 04:30:55'),
(7104, 'en', 'new_adsense', 'New Adsense', '2023-11-30 04:30:55', '2023-11-30 04:30:55'),
(7105, 'en', 'copied', 'Copied', '2023-11-30 04:30:55', '2023-11-30 04:30:55'),
(7106, 'en', 'back_to_top_button', 'Back To Top Button', '2023-11-30 04:30:57', '2023-11-30 04:30:57'),
(7107, 'en', 'switch_on_to_display_back_to_top_button', 'Switch On to Display back to top button.', '2023-11-30 04:30:57', '2023-11-30 04:30:57'),
(7108, 'en', 'disable', 'Disable', '2023-11-30 04:30:57', '2023-11-30 04:30:57'),
(7109, 'en', 'enable', 'Enable', '2023-11-30 04:30:57', '2023-11-30 04:30:57'),
(7110, 'en', 'custom_back_to_top_button', 'Custom Back To Top Button', '2023-11-30 04:30:57', '2023-11-30 04:30:57'),
(7111, 'en', 'if_you_switch_it_off_it_will_show_default_design_for_back_to_top_button', 'If you switch it off, it will show default design for \"back to top\" button.', '2023-11-30 04:30:57', '2023-11-30 04:30:57'),
(7112, 'en', 'custom_back_to_top_button_icon', 'Custom Back To Top Button Icon', '2023-11-30 04:30:57', '2023-11-30 04:30:57'),
(7113, 'en', 'select_back_to_top_button_icon', 'Select Back To Top Button icon.', '2023-11-30 04:30:57', '2023-11-30 04:30:57'),
(7114, 'en', 'back_to_top_button_background_color', 'Back To Top Button Background Color', '2023-11-30 04:30:57', '2023-11-30 04:30:57'),
(7115, 'en', 'transparent', 'Transparent', '2023-11-30 04:30:57', '2023-11-30 04:30:57'),
(7116, 'en', 'back_to_top_button_color', 'Back To Top Button Color', '2023-11-30 04:30:57', '2023-11-30 04:30:57'),
(7117, 'en', 'keep_back_to_top_button_on_mobile', 'Keep Back To Top Button On Mobile', '2023-11-30 04:30:57', '2023-11-30 04:30:57'),
(7118, 'en', 'if_you_switch_it_on_it_will_show_in_mobile_devices', 'If you switch it on, it will show in mobile devices.', '2023-11-30 04:30:57', '2023-11-30 04:30:57'),
(7119, 'en', 'layout', 'Layout', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7120, 'en', 'choose_post_layout_from_here_if_you_use_this_option_then_you_will_able_to_change_three_type_of_blog_layout__default_right_sidebar_layout_', 'Choose post layout from here. If you use this option then you will able to change three type of blog layout ( Default Right Sidebar Layout ).', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7121, 'en', 'post_column', 'Post Column', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7122, 'en', 'select_your_post_post_column_from_here_if_you_use_this_option_then_you_will_able_to_select_three_type_of_blog_colum_layout__default_one_column_', 'Select your post post column from here. If you use this option then you will able to select three type of blog colum layout ( Default One Column ).', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7123, 'en', 'post_post_style', 'Post Post Style', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7124, 'en', 'select_post_post_style', 'Select Post Post Style.', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7125, 'en', 'post_posts_excerpt', 'Post Posts Excerpt', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7126, 'en', 'control_the_number_of_characters_you_want_to_show_in_the_post_page_for_each_post_if_you_use_this_option_then_you_can_able_to_control_your_post_post_characters_from_heredefault_50_character', 'Control the number of characters you want to show in the post page for each post.. If you use this option then you can able to control your post post characters from here.(default 50 character)', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7127, 'en', 'post_perpage_number', 'Post PerPage Number', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7128, 'en', 'control_the_number_posts_to_show_on_each_page__default_show_10_', 'Control the number posts to show on each page ( Default show 10 ).', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7129, 'en', 'read_more_text_setting', 'Read More Text Setting', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7130, 'en', 'control_read_more_text_from_here', 'Control read more text from here.', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7131, 'en', 'default', 'Default', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7132, 'en', 'custom', 'Custom', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7133, 'en', 'read_more_text', 'Read More Text', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7134, 'en', 'set_read_moer_text_here_if_you_use_this_option_then_you_will_able_to_set_your_won_text', 'Set read moer text here. If you use this option then you will able to set your won text.', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7135, 'en', 'transalate_to_another_language', 'Transalate to another language', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7136, 'en', 'click_here', 'click here', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7137, 'en', 'post_pagination_settings', 'Post Pagination Settings', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7138, 'en', 'set_post_pagination_number_pagination_or_link_pagination', 'Set post pagination. Number Pagination or Link Pagination', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7139, 'en', 'post_pagination_position', 'Post Pagination Position', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7140, 'en', 'set_post_pagination_position', 'Set post pagination Position.', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7141, 'en', 'left', 'left', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7142, 'en', 'center', 'center', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7143, 'en', 'right', 'right', '2023-11-30 04:31:04', '2023-11-30 04:31:04'),
(7144, 'en', 'choose_post_single_page_layout_from_here', 'Choose post single page layout from here.', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7145, 'en', 'switch_on_to_display_author', 'Switch On to Display Author.', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7146, 'en', 'date', 'Date', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7147, 'en', 'switch_on_to_display_date', 'Switch On to Display Date.', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7148, 'en', 'views_count', 'Views Count', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7149, 'en', 'switch_on_to_display_total_views', 'Switch On to Display Total Views.', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7150, 'en', 'category', 'Category', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7151, 'en', 'switch_on_to_display_category', 'Switch On to Display Category.', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7152, 'en', 'switch_on_to_display_tags', 'Switch On to Display Tags.', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7153, 'en', 'switch_on_to_display_comments', 'Switch On to Display Comments.', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7154, 'en', 'post_share_options', 'Post Share Options', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7155, 'en', 'switch_on_to_display_blog_share', 'Switch On to Display Blog Share.', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7156, 'en', 'biography_info', 'Biography Info', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7157, 'en', 'control_biography_info_from_here_if_you_use_this_option_then_you_will_able_to_show_ro_hide_biography_info', 'Control biography info from here. If you use this option then you will able to show ro hide biography info', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7158, 'en', 'hide', 'Hide', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7159, 'en', 'show', 'Show', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7160, 'en', 'post_prevnext_nav', 'Post Prev/Next Nav', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7161, 'en', 'control_post_previous_post_and_next_post_navbar', 'Control Post Previous Post and Next Post Navbar', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7162, 'en', 'related_posts', 'Related Posts', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7163, 'en', 'showhide_related_posts', 'Show/Hide related posts', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7164, 'en', 'related_post_section_title', 'Related Post Section Title', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7165, 'en', 'popular_posts', 'Popular Posts', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7166, 'en', 'showhide_popular_post', 'Show/Hide Popular post', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7167, 'en', 'popular_post_section_title', 'Popular Post Section Title', '2023-11-30 04:31:16', '2023-11-30 04:31:16'),
(7168, 'en', 'custom_sidebar_style', 'Custom Sidebar Style', '2023-11-30 04:31:44', '2023-11-30 04:31:44'),
(7169, 'en', 'widgets_background_color', 'Widgets Background Color', '2023-11-30 04:31:44', '2023-11-30 04:31:44'),
(7170, 'en', 'widget_margin', 'Widget Margin', '2023-11-30 04:31:44', '2023-11-30 04:31:44'),
(7171, 'en', 'top', 'Top', '2023-11-30 04:31:44', '2023-11-30 04:31:44'),
(7172, 'en', 'bottom', 'Bottom', '2023-11-30 04:31:44', '2023-11-30 04:31:44'),
(7173, 'en', 'widget_padding', 'Widget Padding', '2023-11-30 04:31:44', '2023-11-30 04:31:44'),
(7174, 'en', 'widget_title_color', 'Widget Title Color', '2023-11-30 04:31:44', '2023-11-30 04:31:44'),
(7175, 'en', 'widget_title_after_color', 'Widget Title After Color', '2023-11-30 04:31:44', '2023-11-30 04:31:44'),
(7176, 'en', 'menu', 'Menu', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7177, 'en', 'edit_menus', 'Edit Menus', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7178, 'en', 'manage_locations', 'Manage Locations', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7179, 'en', 'select_a_menu_to_edit', 'Select a menu to edit:', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7180, 'en', 'create_menu_', 'Create Menu ', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7181, 'en', 'translate_menu_into', 'Translate Menu Into:', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7182, 'en', 'custom_links', 'Custom Links', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7183, 'en', 'link_text', 'Link Text', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7184, 'en', 'add_to_menu', 'Add to Menu', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7185, 'en', 'most_recent', 'Most Recent', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7186, 'en', 'view_all', 'View All', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7187, 'en', 'search', 'Search', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7188, 'en', 'select_all', 'Select All', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7189, 'en', 'select_all_', 'Select All ', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7190, 'en', 'posts', 'Posts', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7191, 'en', 'menu_name', 'Menu Name', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7192, 'en', 'give_your_menu_a_name_then_click_save_menu', 'Give your menu a name, then click Save Menu.', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7193, 'en', 'menu_settings', 'Menu Settings', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7194, 'en', 'display_locations', 'Display Locations', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7195, 'en', 'currently_set_to__', 'Currently set to : ', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7196, 'en', 'save_menu', 'Save Menu', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7197, 'en', 'drag_the_items_into_the_order_you_prefer_click_the_arrow_on_the_right_of_the_item_to_reveal_additional_configuration_options', 'Drag the items into the order you prefer. Click the arrow on the right of the item to reveal additional configuration options.', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7198, 'en', 'delete_menu', 'Delete Menu', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7199, 'en', 'update_menu', 'Update Menu', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7200, 'en', 'your_theme_supports', 'Your theme supports', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7201, 'en', 'menus_select_which_menu_appears_in_each_location', 'menus. Select which menu appears in each location.', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7202, 'en', 'theme_location', 'Theme Location', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7203, 'en', 'assigned_menu', 'Assigned Menu', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7204, 'en', '_edit', ' Edit', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7205, 'en', 'use_new_menu', 'Use new menu', '2023-12-02 09:16:59', '2023-12-02 09:16:59'),
(7206, 'en', 'menu_list_updated_successfully', 'Menu list updated successfully', '2023-12-02 09:17:15', '2023-12-02 09:17:15'),
(7207, 'en', 'cache_clear_successfully', 'Cache clear successfully', '2023-12-02 09:18:50', '2023-12-02 09:18:50'),
(7208, 'en', 'enable_website_popup', 'Enable Website Popup', '2023-12-02 16:41:20', '2023-12-02 16:41:20'),
(7209, 'en', 'popup_content', 'Popup content', '2023-12-02 16:41:20', '2023-12-02 16:41:20'),
(7210, 'en', 'show_subscriber_form', 'Show Subscriber form?', '2023-12-02 16:41:20', '2023-12-02 16:41:20'),
(7211, 'en', 'theme_option_saved', 'Theme Option Saved', '2023-12-02 16:42:09', '2023-12-02 16:42:09'),
(7212, 'en', 'a_new_comment_added', 'A New Comment Added.', '2023-12-02 17:21:40', '2023-12-02 17:21:40'),
(7213, 'en', 'your_comment_added', 'Your Comment Added', '2023-12-02 17:21:40', '2023-12-02 17:21:40'),
(7214, 'en', 'delete_permanently', 'Delete Permanently', '2023-12-02 17:47:23', '2023-12-02 17:47:23'),
(7215, 'en', 'file_name', 'File Name:', '2023-12-02 17:47:23', '2023-12-02 17:47:23'),
(7216, 'en', 'file_url', 'File URL:', '2023-12-02 17:47:23', '2023-12-02 17:47:23'),
(7217, 'en', 'file_type', 'File Type:', '2023-12-02 17:47:23', '2023-12-02 17:47:23'),
(7218, 'en', 'file_size', 'File Size:', '2023-12-02 17:47:23', '2023-12-02 17:47:23'),
(7219, 'en', 'uploaded_by', 'Uploaded By:', '2023-12-02 17:47:23', '2023-12-02 17:47:23'),
(7220, 'en', 'created_at', 'Created At:', '2023-12-02 17:47:23', '2023-12-02 17:47:23'),
(7221, 'en', 'updated_at', 'Updated At:', '2023-12-02 17:47:23', '2023-12-02 17:47:23'),
(7222, 'en', 'download', 'Download', '2023-12-02 17:47:23', '2023-12-02 17:47:23'),
(7223, 'en', 'copy_url_to_clipboard', 'Copy URL to clipboard', '2023-12-02 17:47:23', '2023-12-02 17:47:23'),
(7224, 'en', 'add_post', 'Add Post', '2023-12-02 17:47:30', '2023-12-02 17:47:30'),
(7225, 'en', 'all', 'All', '2023-12-02 17:47:30', '2023-12-02 17:47:30'),
(7226, 'en', 'mine', 'Mine', '2023-12-02 17:47:30', '2023-12-02 17:47:30'),
(7227, 'en', 'showing', 'Showing', '2023-12-02 17:47:30', '2023-12-02 17:47:30'),
(7228, 'en', 'items_of', 'items of', '2023-12-02 17:47:30', '2023-12-02 17:47:30'),
(7229, 'en', 'bulk_action', 'Bulk Action', '2023-12-02 17:47:30', '2023-12-02 17:47:30'),
(7230, 'en', 'delete_selection', 'Delete selection', '2023-12-02 17:47:30', '2023-12-02 17:47:30'),
(7231, 'en', 'apply', 'Apply', '2023-12-02 17:47:30', '2023-12-02 17:47:30'),
(7232, 'en', 'no_action_selected', 'No Action Selected', '2023-12-02 17:47:30', '2023-12-02 17:47:30'),
(7233, 'en', 'no_item_selected', 'No Item Selected', '2023-12-02 17:47:30', '2023-12-02 17:47:30'),
(7234, 'en', 'ai_assistent', 'AI Assistent', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7235, 'en', 'language', 'Language', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7236, 'en', 'select_language', 'Select Language', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7237, 'en', 'arabic', 'Arabic', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7238, 'en', 'bulgarian', 'Bulgarian', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7239, 'en', 'chinese_simplified', 'Chinese (Simplified)', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7240, 'en', 'chinese_traditional', 'Chinese (Traditional)', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7241, 'en', 'croatian', 'Croatian', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7242, 'en', 'czech', 'Czech', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7243, 'en', 'danish', 'Danish', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7244, 'en', 'dutch', 'Dutch', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7245, 'en', 'english', 'English', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7246, 'en', 'estonian', 'Estonian', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7247, 'en', 'finnish', 'Finnish', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7248, 'en', 'french', 'French', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7249, 'en', 'german', 'German', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7250, 'en', 'greek', 'Greek', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7251, 'en', 'hebrew', 'Hebrew', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7252, 'en', 'hindi', 'Hindi', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7253, 'en', 'hungarian', 'Hungarian', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7254, 'en', 'icelandic', 'Icelandic', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7255, 'en', 'indonesian', 'Indonesian', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7256, 'en', 'italian', 'Italian', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7257, 'en', 'japanese', 'Japanese', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7258, 'en', 'korean', 'Korean', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7259, 'en', 'lithuanian', 'Lithuanian', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7260, 'en', 'malay', 'Malay', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7261, 'en', 'norwegian', 'Norwegian', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7262, 'en', 'polish', 'Polish', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7263, 'en', 'portuguese', 'Portuguese', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7264, 'en', 'romanian', 'Romanian', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7265, 'en', 'russian', 'Russian', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7266, 'en', 'slovenian', 'Slovenian', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7267, 'en', 'spanish', 'Spanish', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7268, 'en', 'swahili', 'Swahili', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7269, 'en', 'swedish', 'Swedish', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7270, 'en', 'thai', 'Thai', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7271, 'en', 'turkish', 'Turkish', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7272, 'en', 'ukrainian', 'Ukrainian', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7273, 'en', 'vietnamese', 'Vietnamese', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7274, 'en', 'what_is_the_primary_focus_of_your_blog', 'What is the primary focus of your blog', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7275, 'en', 'primary_focus', 'Primary Focus', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7276, 'en', 'priority_keywords', 'Priority Keywords', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7277, 'en', 'give_priority_kewords_seperated_by_comma_', 'Give priority kewords seperated by comma (,)', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7278, 'en', 'level_of_creativity', 'Level of creativity', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7279, 'en', 'extra_ordinary', 'Extra Ordinary', '2023-12-02 17:47:34', '2023-12-02 17:47:34'),
(7280, 'en', 'ordinary', 'Ordinary', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7281, 'en', 'minimal', 'Minimal', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7282, 'en', 'editorial_tone', 'Editorial tone', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7283, 'en', 'formal', 'Formal', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7284, 'en', 'casual', 'Casual', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7285, 'en', 'humorous', 'Humorous', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7286, 'en', 'authoritative', 'Authoritative', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7287, 'en', 'persuasive', 'Persuasive', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7288, 'en', 'empathetic', 'Empathetic', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7289, 'en', 'inspirational', 'Inspirational', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7290, 'en', 'educational', 'Educational', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7291, 'en', 'witty', 'Witty', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7292, 'en', 'intimate', 'Intimate', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7293, 'en', 'choose_what_you_want_to_generate', 'Choose What You Want To Generate', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7294, 'en', 'post_title', 'Post Title', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7295, 'en', 'post_short_description', 'Post Short Description', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7296, 'en', 'post_content', 'Post Content', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7297, 'en', 'title_length', 'Title Length', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7298, 'en', 'short_details_length', 'Short Details Length', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7299, 'en', 'content_length', 'Content Length', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7300, 'en', 'generate', 'Generate', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7301, 'en', 'permalink', 'Permalink', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7302, 'en', 'type_here', 'Type here', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7303, 'en', 'short_description', 'Short Description', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7304, 'en', 'content', 'Content', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7305, 'en', 'seo_meta_tags', 'Seo Meta Tags', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7306, 'en', 'meta_title', 'Meta Title', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7307, 'en', 'meta_description', 'Meta Description', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7308, 'en', 'meta_image', 'Meta Image', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7309, 'en', 'choose_file', 'Choose File', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7310, 'en', 'publish', 'Publish', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7311, 'en', 'draft', 'Draft', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7312, 'en', 'visibility', 'Visibility', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7313, 'en', 'public', 'Public', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7314, 'en', 'stick_this_post_to_the_front_of_post_list_page', 'Stick this post to the front of post list page', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7315, 'en', 'password_protected', 'Password protected', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7316, 'en', 'if_password_field_is_remain_empty_then_visibility_will_be_saved_as_public', 'If Password Field is remain Empty then visibility will be saved as Public.', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7317, 'en', 'private', 'Private', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7318, 'en', 'formate', 'Formate', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7319, 'en', 'standard', 'Standard', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7320, 'en', 'video', 'Video', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7321, 'en', 'audio', 'Audio', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7322, 'en', 'gallery', 'Gallery', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7323, 'en', 'post_image', 'Post Image', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7324, 'en', 'preferred_size_for_thumnail_image_is_1110__578_px', 'Preferred size for thumnail image is 1110 × 578 px', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7325, 'en', 'preferred_size_for_gallery_images_is_1110__578_px', 'Preferred size for gallery images is 1110 × 578 px', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7326, 'en', 'choose_files', 'Choose Files', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7327, 'en', 'featured_status', 'Featured Status', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7328, 'en', 'breaking_news', 'Breaking News', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7329, 'en', 'no_option_selected', 'No Option Selected', '2023-12-02 17:47:35', '2023-12-02 17:47:35'),
(7330, 'en', 'new_tag', 'New Tag', '2023-12-02 17:47:36', '2023-12-02 17:47:36'),
(7331, 'en', 'only_active_categories', 'Only Active Categories', '2023-12-02 17:47:36', '2023-12-02 17:47:36'),
(7332, 'en', 'add', 'Add', '2023-12-02 17:47:36', '2023-12-02 17:47:36'),
(7333, 'en', 'select_a_category', 'Select a Category', '2023-12-02 17:47:36', '2023-12-02 17:47:36'),
(7334, 'en', 'add_new_tag', 'Add New Tag', '2023-12-02 17:47:36', '2023-12-02 17:47:36'),
(7335, 'en', 'new_category', 'New Category', '2023-12-02 17:47:36', '2023-12-02 17:47:36'),
(7336, 'en', 'select_parent', 'Select Parent', '2023-12-02 17:47:36', '2023-12-02 17:47:36'),
(7337, 'en', 'select_a_parent_category', 'Select a Parent Category', '2023-12-02 17:47:36', '2023-12-02 17:47:36'),
(7338, 'en', 'add_new_category', 'Add New Category', '2023-12-02 17:47:36', '2023-12-02 17:47:36'),
(7339, 'en', 'post_category', 'Post Category', '2023-12-02 17:47:37', '2023-12-02 17:47:37'),
(7340, 'en', 'post_categories', 'Post Categories', '2023-12-02 17:47:37', '2023-12-02 17:47:37'),
(7341, 'en', 'add_post_category', 'Add Post Category', '2023-12-02 17:47:37', '2023-12-02 17:47:37'),
(7342, 'en', 'parent', 'Parent', '2023-12-02 17:47:37', '2023-12-02 17:47:37'),
(7343, 'en', 'tag', 'Tag', '2023-12-02 17:47:40', '2023-12-02 17:47:40'),
(7344, 'en', 'add_tag', 'Add Tag', '2023-12-02 17:47:40', '2023-12-02 17:47:40'),
(7345, 'en', 'post_comment', 'Post Comment', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7346, 'en', 'approve', 'Approve', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7347, 'en', 'spam', 'Spam', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7348, 'en', 'trash', 'Trash', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7349, 'en', 'in_response_to', 'In Response to', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7350, 'en', 'unapprove', 'Unapprove', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7351, 'en', 'reply', 'Reply', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7352, 'en', 'view_blog', 'View Blog', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7353, 'en', 'in_reply_to', 'In reply to', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7354, 'en', 'comment_delete_confirmation', 'Comment Delete Confirmation', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7355, 'en', 'are_you_sure_you_want_to_permanently_delete_this_comment', 'Are you sure you want to Permanently Delete This Comment', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7356, 'en', 'bulk_action_confirmation', 'Bulk Action Confirmation', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7357, 'en', 'are_you_sure_you_want_to_take_this_action', 'Are you sure you want to take this Action', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7358, 'en', 'comment_reply', 'Comment Reply', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7359, 'en', 'move_to_trash', 'Move to Trash', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7360, 'en', 'mark_as_spam', 'Mark as Spam', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7361, 'en', 'not_spam', 'Not Spam', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7362, 'en', 'delete_permanetly', 'Delete Permanetly', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7363, 'en', 'restore', 'Restore', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7364, 'en', 'delete_all', 'Delete All', '2023-12-02 17:47:42', '2023-12-02 17:47:42'),
(7365, 'en', 'share_options', 'Share Options', '2023-12-02 17:47:46', '2023-12-02 17:47:46'),
(7366, 'en', 'comment_setting', 'Comment Setting', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7367, 'en', 'default_post_settings', 'Default Post settings', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7368, 'en', 'allow_people_to_submit_comments_on_new_posts', 'Allow people to submit comments on new posts', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7369, 'en', 'other_comment_settings', 'Other comment settings', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7370, 'en', 'comment_author_must_fill_out_name_and_email', 'Comment author must fill out name and email', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7371, 'en', 'users_must_be_registered_and_logged_in_to_comment', 'Users must be registered and logged in to comment', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7372, 'en', 'automatically_close_comments_on_blogs_older_than', 'Automatically close comments on blogs older than', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7373, 'en', 'days', 'days', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7374, 'en', 'enable_threaded_nested_comments', 'Enable threaded (nested) comments', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7375, 'en', 'levels_deep', 'levels deep', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7376, 'en', 'break_comments_into_pages_with', 'Break comments into pages with', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7377, 'en', 'top_level_comments_per_page_and', 'top level comments per page and', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7378, 'en', 'comments_should_be_displayed_with_the', 'Comments should be displayed with the', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7379, 'en', 'older', 'older', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7380, 'en', 'newer', 'newer', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7381, 'en', 'comments_at_the_top_of_each_page', 'comments at the top of each page', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7382, 'en', 'email_me_whenever', 'Email me whenever', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7383, 'en', 'anyone_posts_a_comment', 'Anyone posts a comment', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7384, 'en', 'a_comment_is_held_for_moderation', 'A comment is held for moderation', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7385, 'en', 'before_a_comment_appears', 'Before a comment appears', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7386, 'en', 'comment_must_be_manually_approved', 'Comment must be manually approved', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7387, 'en', 'comment_author_must_have_a_previously_approved_comment', 'Comment author must have a previously approved comment', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7388, 'en', 'comment_moderation', 'Comment Moderation', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7389, 'en', 'hold_a_comment_in_the_queue_if_it_contains', 'Hold a comment in the queue if it contains', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7390, 'en', 'or_more_links_a_common_characteristic_of_comment_spam_is_a_large_number_of_hyperlinks', 'or more links. (A common characteristic of comment spam is a large number of hyperlinks.)', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7391, 'en', 'when_a_comment_contains_any_of_these_words_in_its_content_author_name_url_email_ip_address_or_browsers_user_agent_string_it_will_be_held_in_the_', 'When a comment contains any of these words in its content, author name, URL, email, IP address, or browser’s user agent string, it will be held in the ', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7392, 'en', 'pending_queue', 'pending queue', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7393, 'en', 'one_word_or_ip_address_per_line_it_will_match_inside_words_so_press_will_match_wordpress', 'One word or IP address per line. It will match inside words, so “press” will match “WordPress”.', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7394, 'en', 'disallowed_comment_keys', 'Disallowed Comment Keys', '2023-12-02 17:47:52', '2023-12-02 17:47:52');
INSERT INTO `tl_translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(7395, 'en', 'when_a_comment_contains_any_of_these_words_in_its_content_author_name_url_email_ip_address_or_browsers_user_agent_string_it_will_be_put_in_the_trash_one_word_or_ip_address_per_line_it_will_match_inside_words_so_press_will_match_wordpress', 'When a comment contains any of these words in its content, author name, URL, email, IP address, or browser’s user agent string, it will be put in the Trash. One word or IP address per line. It will match inside words, so “press” will match “WordPress”.', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7396, 'en', 'avatars', 'Avatars', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7397, 'en', 'an_avatar_is_an_image_that_can_be_associated_with_a_user_across_multiple_websites_in_this_area_you_can_choose_to_display_avatars_of_users_who_interact_with_the_site', 'An avatar is an image that can be associated with a user across multiple websites. In this area, you can choose to display avatars of users who interact with the site.', '2023-12-02 17:47:52', '2023-12-02 17:47:52'),
(7398, 'en', 'avatar_display', 'Avatar Display', '2023-12-02 17:47:53', '2023-12-02 17:47:53'),
(7399, 'en', 'show_avatars', 'Show Avatars', '2023-12-02 17:47:53', '2023-12-02 17:47:53'),
(7400, 'en', 'default_avatar', 'Default Avatar', '2023-12-02 17:47:53', '2023-12-02 17:47:53'),
(7401, 'en', 'for_users_without_a_custom_avatar_of_their_own_you_can_either_display_a_generic_logo_or_a_generated_one_based_on_their_email_address', 'For users without a custom avatar of their own, you can either display a generic logo or a generated one based on their email address.', '2023-12-02 17:47:53', '2023-12-02 17:47:53'),
(7402, 'en', 'mystery_person', 'Mystery Person', '2023-12-02 17:47:53', '2023-12-02 17:47:53'),
(7403, 'en', 'blank', 'Blank', '2023-12-02 17:47:53', '2023-12-02 17:47:53'),
(7404, 'en', 'gravatar_logo', 'Gravatar Logo', '2023-12-02 17:47:53', '2023-12-02 17:47:53'),
(7405, 'en', 'identicon_generated', 'Identicon (Generated)', '2023-12-02 17:47:53', '2023-12-02 17:47:53'),
(7406, 'en', 'wavatar_generated', 'Wavatar (Generated)', '2023-12-02 17:47:53', '2023-12-02 17:47:53'),
(7407, 'en', 'monsterid_generated', 'MonsterID (Generated)', '2023-12-02 17:47:53', '2023-12-02 17:47:53'),
(7408, 'en', 'retro_generated', 'Retro (Generated)', '2023-12-02 17:47:53', '2023-12-02 17:47:53'),
(7409, 'en', 'add_page', 'Add Page', '2023-12-02 17:47:57', '2023-12-02 17:47:57'),
(7410, 'en', 'homepage', 'Homepage', '2023-12-02 17:47:57', '2023-12-02 17:47:57'),
(7411, 'en', 'builder', 'Builder', '2023-12-02 17:47:57', '2023-12-02 17:47:57'),
(7412, 'en', 'current_homepage', 'Current Homepage', '2023-12-02 17:47:57', '2023-12-02 17:47:57'),
(7413, 'en', 'make_homepage', 'Make Homepage', '2023-12-02 17:47:57', '2023-12-02 17:47:57'),
(7414, 'en', 'demo_pluin', 'Demo Pluin', '2023-12-02 17:48:00', '2023-12-02 17:48:00'),
(7415, 'en', 'theme_creating_guide', 'Theme Creating Guide', '2023-12-02 17:48:02', '2023-12-02 17:48:02'),
(7416, 'en', 'install_theme', 'Install Theme', '2023-12-02 17:48:02', '2023-12-02 17:48:02'),
(7417, 'en', 'by', 'By:', '2023-12-02 17:48:02', '2023-12-02 17:48:02'),
(7418, 'en', 'version', 'Version:', '2023-12-02 17:48:02', '2023-12-02 17:48:02'),
(7419, 'en', 'activated', 'Activated', '2023-12-02 17:48:02', '2023-12-02 17:48:02'),
(7420, 'en', 'activate_confirmation', 'activate Confirmation', '2023-12-02 17:48:02', '2023-12-02 17:48:02'),
(7421, 'en', 'are_you_sure_to_active_this_theme', 'Are you sure to active this theme', '2023-12-02 17:48:02', '2023-12-02 17:48:02'),
(7422, 'en', 'activate', 'Activate', '2023-12-02 17:48:02', '2023-12-02 17:48:02'),
(7423, 'en', 'are_you_sure_to_delete_this_theme', 'Are you sure to delete this Theme', '2023-12-02 17:48:02', '2023-12-02 17:48:02'),
(7424, 'en', 'active_confirmation', 'Active Confirmation', '2023-12-02 17:48:02', '2023-12-02 17:48:02'),
(7425, 'en', 'purchase_key', 'Purchase Key', '2023-12-02 17:48:02', '2023-12-02 17:48:02'),
(7426, 'en', 'give_purchase_key_to_activate_this_theme', 'Give Purchase Key To Activate This Theme', '2023-12-02 17:48:02', '2023-12-02 17:48:02'),
(7427, 'en', 'manage_widgets', 'Manage Widgets', '2023-12-02 17:48:09', '2023-12-02 17:48:09'),
(7428, 'en', 'available_widgets', 'Available Widgets', '2023-12-02 17:48:09', '2023-12-02 17:48:09'),
(7429, 'en', 'add_widget', 'Add Widget', '2023-12-02 17:48:09', '2023-12-02 17:48:09'),
(7430, 'en', 'adding_widget_to_sidebar_failed', 'Adding Widget To Sidebar Failed', '2023-12-02 17:48:09', '2023-12-02 17:48:09'),
(7431, 'en', 'sidebar_widget_opening_failed', 'Sidebar Widget Opening Failed', '2023-12-02 17:48:09', '2023-12-02 17:48:09'),
(7432, 'en', 'widget_added_to_sidebar_failed', 'Widget Added To Sidebar Failed', '2023-12-02 17:48:09', '2023-12-02 17:48:09'),
(7433, 'en', 'widget_form_submit_failed_failed', 'Widget Form Submit Failed Failed', '2023-12-02 17:48:09', '2023-12-02 17:48:09'),
(7434, 'en', 'generate_site_map', 'Generate Site Map', '2023-12-02 17:48:19', '2023-12-02 17:48:19'),
(7435, 'en', 'sitemap_generating_request_failed', 'Sitemap Generating Request Failed', '2023-12-02 17:48:19', '2023-12-02 17:48:19'),
(7436, 'en', 'please_check_your_email_to_confirm_your_subscription', 'Please Check your Email to confirm your Subscription', '2023-12-03 10:08:27', '2023-12-03 10:08:27'),
(7437, 'en', 'please_enter_a_valid_email', 'Please Enter a Valid Email', '2023-12-03 10:09:30', '2023-12-03 10:09:30'),
(7438, 'en', 'mailchimp_api_key', 'Mailchimp API Key', '2023-12-03 10:18:33', '2023-12-03 10:18:33'),
(7439, 'en', 'set_mailchimp_api_key', 'Set mailchimp api key', '2023-12-03 10:18:33', '2023-12-03 10:18:33'),
(7440, 'en', 'mailchimp_list_id', 'Mailchimp List ID', '2023-12-03 10:18:33', '2023-12-03 10:18:33'),
(7441, 'en', 'set_mailchimp_list_id', 'Set mailchimp list id.', '2023-12-03 10:18:33', '2023-12-03 10:18:33'),
(7442, 'en', 'custom_sidebar_subscribe_style', 'Custom Sidebar Subscribe Style', '2023-12-03 10:18:33', '2023-12-03 10:18:33'),
(7443, 'en', 'set_custom_footer_subscribe_style', 'Set custom footer subscribe style', '2023-12-03 10:18:33', '2023-12-03 10:18:33'),
(7444, 'en', 'newsletter_background_image', 'Newsletter Background Image', '2023-12-03 10:18:33', '2023-12-03 10:18:33'),
(7445, 'en', 'newsletter_title_color', 'Newsletter Title Color', '2023-12-03 10:18:33', '2023-12-03 10:18:33'),
(7446, 'en', 'newsletter_subtitle_color', 'Newsletter Subtitle Color', '2023-12-03 10:18:33', '2023-12-03 10:18:33'),
(7447, 'en', 'newsletter_button_text_color', 'Newsletter Button Text Color', '2023-12-03 10:18:33', '2023-12-03 10:18:33'),
(7448, 'en', 'edit_post', 'Edit Post', '2023-12-03 11:41:38', '2023-12-03 11:41:38'),
(7449, 'en', 'what_is_the_primary_focus_of_your_post', 'What is the primary focus of your Post', '2023-12-03 11:41:39', '2023-12-03 11:41:39'),
(7450, 'en', 'add_new', 'Add New', '2023-12-03 11:41:39', '2023-12-03 11:41:39'),
(7451, 'en', 'stick_this_post_to_the_front_of_blog_list_page', 'Stick this post to the front of blog list page', '2023-12-03 11:41:39', '2023-12-03 11:41:39'),
(7452, 'en', 'please_insert_post_name', 'Please Insert Post Name', '2023-12-03 11:46:59', '2023-12-03 11:46:59'),
(7453, 'en', 'this_name_is_already_available_please_insert_another', 'This Name is Already Available Please Insert Another', '2023-12-03 11:46:59', '2023-12-03 11:46:59'),
(7454, 'en', 'please_write_the_post_name_under_225_words', 'Please Write The Post Name under 225 words', '2023-12-03 11:46:59', '2023-12-03 11:46:59'),
(7455, 'en', 'this_permalink_is_already_available_please_insert_another', 'This Permalink is Already Available Please Insert Another', '2023-12-03 11:46:59', '2023-12-03 11:46:59'),
(7456, 'en', 'something_went_wrong_please_select_category_again', 'Something went Wrong, Please Select Category Again', '2023-12-03 11:46:59', '2023-12-03 11:46:59'),
(7457, 'en', 'please_insert_a_valid_image', 'Please Insert A Valid Image', '2023-12-03 11:46:59', '2023-12-03 11:46:59'),
(7458, 'en', 'please_write_some_content', 'Please write some Content', '2023-12-03 11:46:59', '2023-12-03 11:46:59'),
(7459, 'en', 'please_select_a_valid_image', 'Please Select a Valid Image', '2023-12-03 11:46:59', '2023-12-03 11:46:59'),
(7460, 'en', 'something_went_wrong_please_select_visibility_again', 'Something went Wrong, Please Select Visibility Again', '2023-12-03 11:46:59', '2023-12-03 11:46:59'),
(7461, 'en', 'post_updated_successfully', 'Post Updated Successfully', '2023-12-03 11:46:59', '2023-12-03 11:46:59'),
(7462, 'en', 'category_cannot_be_deleted_there_are_posts_available', 'Category Cannot Be Deleted! There are Posts Available', '2023-12-03 11:47:19', '2023-12-03 11:47:19'),
(7463, 'en', 'ecommercecategory_cannot_be_deleted_there_are_posts_available', 'E-commerceCategory Cannot Be Deleted! There are Posts Available', '2023-12-03 11:47:19', '2023-12-03 11:47:19'),
(7464, 'en', 'media_file_uploaded_successful', 'Media file uploaded successful', '2023-12-03 12:05:13', '2023-12-03 12:05:13'),
(7465, 'en', 'this_category_name_or_slug_is_already_available_please_insert_another', 'This Category Name or Slug is Already Available Please Insert Another', '2023-12-03 15:00:05', '2023-12-03 15:00:05'),
(7466, 'en', 'this_tag_name_or_slug_is_already_available_please_insert_another', 'This Tag Name or Slug is Already Available Please Insert Another', '2023-12-03 15:12:56', '2023-12-03 15:12:56'),
(7467, 'en', 'a_parent_category_cannot_be_deletedfirst_delete_the_child_category', 'A Parent Category Cannot Be deleted.First Delete The Child Category', '2023-12-03 15:40:41', '2023-12-03 15:40:41'),
(7468, 'en', 'edit_post_category', 'Edit Post Category', '2023-12-03 15:41:00', '2023-12-03 15:41:00'),
(7469, 'en', 'please_insert_a_name', 'Please Insert a Name', '2023-12-03 15:41:10', '2023-12-03 15:41:10'),
(7470, 'en', 'please_write_the_category_name_under_225_words', 'Please Write The Category Name under 225 words', '2023-12-03 15:41:10', '2023-12-03 15:41:10'),
(7471, 'en', 'post_category_update_failed', 'Post Category Update Failed', '2023-12-03 15:41:10', '2023-12-03 15:41:10'),
(7472, 'en', 'post_category_updated_successfully', 'Post Category Updated Successfully', '2023-12-03 15:46:03', '2023-12-03 15:46:03'),
(7473, 'en', 'post_category_deleted_successfully', 'Post Category Deleted Successfully', '2023-12-03 15:46:24', '2023-12-03 15:46:24'),
(7474, 'en', 'post_category_deleting_failed', 'Post Category Deleting Failed', '2023-12-03 15:47:10', '2023-12-03 15:47:10'),
(7475, 'en', 'tag_bulk_deleted_successfully', 'Tag Bulk Deleted Successfully', '2023-12-03 16:20:03', '2023-12-03 16:20:03'),
(7476, 'en', 'new_blog_saved', 'New Blog Saved', '2023-12-05 10:44:55', '2023-12-05 10:44:55'),
(7477, 'en', 'media_file_deleted_successfully', 'Media file deleted successfully', '2023-12-05 10:57:05', '2023-12-05 10:57:05'),
(7478, 'en', 'post_featured_status_changed_successfully', 'Post Featured Status Changed Successfully', '2023-12-05 16:44:42', '2023-12-05 16:44:42'),
(7479, 'en', 'background', 'Background', '2023-12-05 16:46:13', '2023-12-05 16:46:13'),
(7480, 'en', 'advanced', 'Advanced', '2023-12-05 16:46:13', '2023-12-05 16:46:13'),
(7481, 'en', 'widget_title', 'Widget Title', '2023-12-05 16:46:13', '2023-12-05 16:46:13'),
(7482, 'en', 'post_type', 'Post Type', '2023-12-05 16:46:13', '2023-12-05 16:46:13'),
(7483, 'en', 'recent_post', 'Recent Post', '2023-12-05 16:46:13', '2023-12-05 16:46:13'),
(7484, 'en', 'featured_post', 'Featured Post', '2023-12-05 16:46:13', '2023-12-05 16:46:13'),
(7485, 'en', 'most_commented_post', 'Most Commented Post', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7486, 'en', 'popular_post', 'Popular Post', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7487, 'en', 'category_wise', 'Category Wise', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7488, 'en', 'select_category', 'Select Category', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7489, 'en', 'post_advance_style', 'Post Advance Style', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7490, 'en', 'background_color', 'Background Color', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7491, 'en', 'background_image', 'Background Image', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7492, 'en', 'background_size', 'Background Size', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7493, 'en', 'background_position', 'Background Position', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7494, 'en', 'background_repeat', 'Background Repeat', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7495, 'en', 'desktop', 'Desktop', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7496, 'en', 'tab', 'Tab', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7497, 'en', 'mobile', 'Mobile', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7498, 'en', 'padding', 'Padding', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7499, 'en', 'margin', 'Margin', '2023-12-05 16:46:14', '2023-12-05 16:46:14'),
(7500, 'en', 'widget_properties_updated_successfully', 'Widget Properties Updated Successfully', '2023-12-05 16:46:26', '2023-12-05 16:46:26'),
(7501, 'en', 'section_width', 'Section Width', '2023-12-05 16:49:49', '2023-12-05 16:49:49'),
(7502, 'en', 'container', 'Container', '2023-12-05 16:49:49', '2023-12-05 16:49:49'),
(7503, 'en', 'container_fluid', 'Container Fluid', '2023-12-05 16:49:49', '2023-12-05 16:49:49'),
(7504, 'en', 'vertical_alignment', 'Vertical Alignment', '2023-12-05 16:49:49', '2023-12-05 16:49:49'),
(7505, 'en', 'featured_title', 'Featured Title', '2023-12-05 16:51:25', '2023-12-05 16:51:25'),
(7506, 'en', 'most_popular_title', 'Most Popular Title', '2023-12-05 16:51:25', '2023-12-05 16:51:25'),
(7507, 'en', 'most_viewed_title', 'Most Viewed Title', '2023-12-05 16:51:25', '2023-12-05 16:51:25'),
(7508, 'en', 'recent_title', 'Recent Title', '2023-12-05 16:51:25', '2023-12-05 16:51:25'),
(7509, 'en', 'most_commented_title', 'Most Commented Title', '2023-12-05 16:51:25', '2023-12-05 16:51:25'),
(7510, 'en', 'section_properties_updated_successfully', 'Section Properties Updated Successfully', '2023-12-05 16:51:49', '2023-12-05 16:51:49'),
(7511, 'en', 'post_style', 'Post Style', '2023-12-05 16:57:01', '2023-12-05 16:57:01'),
(7512, 'en', 'post_count', 'Post Count', '2023-12-05 16:57:01', '2023-12-05 16:57:01'),
(7513, 'en', 'playlist_title', 'Playlist Title', '2023-12-05 16:57:53', '2023-12-05 16:57:53'),
(7514, 'en', 'menu_deleted_successfully', 'Menu deleted successfully', '2023-12-05 17:34:35', '2023-12-05 17:34:35'),
(7515, 'en', 'pages_bulk_delete_successful', 'Pages Bulk Delete Successful', '2023-12-05 17:52:41', '2023-12-05 17:52:41'),
(7516, 'en', 'page_deleted_successfully', 'Page Deleted Successfully', '2023-12-05 18:01:30', '2023-12-05 18:01:30'),
(7517, 'en', 'page_deleting_failed', 'Page Deleting Failed', '2023-12-05 18:01:30', '2023-12-05 18:01:30'),
(7518, 'en', 'page_title', 'Page Title', '2023-12-05 18:01:42', '2023-12-05 18:01:42'),
(7519, 'en', 'add_title', 'Add Title', '2023-12-05 18:01:42', '2023-12-05 18:01:42'),
(7520, 'en', 'make_with_builder', 'Make with Builder', '2023-12-05 18:01:42', '2023-12-05 18:01:42'),
(7521, 'en', 'page_attributes', 'Page Attributes', '2023-12-05 18:01:42', '2023-12-05 18:01:42'),
(7522, 'en', 'parents', 'Parents', '2023-12-05 18:01:42', '2023-12-05 18:01:42'),
(7523, 'en', 'select_a_parent_page', 'Select a Parent Page', '2023-12-05 18:01:42', '2023-12-05 18:01:42'),
(7524, 'en', 'featured_image', 'Featured Image', '2023-12-05 18:01:42', '2023-12-05 18:01:42'),
(7525, 'en', 'please_insert_page_title', 'Please Insert Page Title', '2023-12-05 18:02:08', '2023-12-05 18:02:08'),
(7526, 'en', 'this_title_is_already_available_please_insert_another', 'This Title is Already Available Please Insert Another', '2023-12-05 18:02:08', '2023-12-05 18:02:08'),
(7527, 'en', 'please_write_the_page_title_under_225_words', 'Please Write The Page Title under 225 words', '2023-12-05 18:02:08', '2023-12-05 18:02:08'),
(7528, 'en', 'something_went_wrong_please_select_parent_again', 'Something went Wrong, Please Select Parent Again', '2023-12-05 18:02:08', '2023-12-05 18:02:08'),
(7529, 'en', 'new_page_saved', 'New Page Saved', '2023-12-05 18:02:08', '2023-12-05 18:02:08'),
(7530, 'en', 'edit_page', 'Edit Page', '2023-12-05 18:02:08', '2023-12-05 18:02:08'),
(7531, 'en', 'page_updated_successfully', 'Page Updated Successfully', '2023-12-06 11:16:28', '2023-12-06 11:16:28'),
(7532, 'en', 'select_menu_group', 'Select Menu Group', '2023-12-06 11:39:26', '2023-12-06 11:39:26'),
(7533, 'en', 'done', 'Done', '2023-12-06 11:39:26', '2023-12-06 11:39:26'),
(7534, 'en', 'widget_form_saved', 'Widget Form Saved', '2023-12-06 11:39:33', '2023-12-06 11:39:33'),
(7535, 'en', 'please_check_for_missing_field_or_invalid_data_and_try_again', 'Please check for missing field or invalid data and try again.', '2023-12-06 11:50:53', '2023-12-06 11:50:53'),
(7536, 'en', 'select_vote', 'Select Vote', '2023-12-06 12:10:43', '2023-12-06 12:10:43'),
(7537, 'en', 'widget_removed_from_sidebar', 'Widget Removed From Sidebar', '2023-12-06 12:10:46', '2023-12-06 12:10:46'),
(7538, 'en', 'select_adsence', 'Select Adsence', '2023-12-06 12:11:11', '2023-12-06 12:11:11'),
(7539, 'en', 'if_you_select_adsense_it_will_be_overwrite_image_and_url_fields', 'If you select AdSense, it will be overwrite Image and Url fields.', '2023-12-06 12:11:11', '2023-12-06 12:11:11'),
(7540, 'en', 'newsletter_title', 'Newsletter Title', '2023-12-06 12:11:23', '2023-12-06 12:11:23'),
(7541, 'en', 'newsletter_subtitle', 'Newsletter Subtitle', '2023-12-06 12:11:23', '2023-12-06 12:11:23'),
(7542, 'en', 'email_placeholder', 'Email Placeholder', '2023-12-06 12:11:23', '2023-12-06 12:11:23'),
(7543, 'en', 'button_text', 'Button Text', '2023-12-06 12:11:23', '2023-12-06 12:11:23'),
(7544, 'en', 'number_of_comments', 'Number of Comments', '2023-12-06 12:11:30', '2023-12-06 12:11:30'),
(7545, 'en', 'number_of_posts', 'Number of Posts', '2023-12-06 12:11:31', '2023-12-06 12:11:31'),
(7546, 'en', 'recent_tab_popular_tab_and_most_comment_tab', 'Recent Tab, Popular tab and Most Comment Tab', '2023-12-06 12:14:22', '2023-12-06 12:14:22'),
(7547, 'en', 'select_a_user_for_authur_widget', 'Select a User for Authur Widget', '2023-12-06 12:31:35', '2023-12-06 12:31:35'),
(7548, 'en', 'author_designation', 'Author Designation', '2023-12-06 12:31:35', '2023-12-06 12:31:35'),
(7549, 'en', 'author_image', 'Author Image', '2023-12-06 12:31:35', '2023-12-06 12:31:35'),
(7550, 'en', 'header_variations', 'Header Variations', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7551, 'en', 'choose_header_variation_from_here', 'Choose header variation from here.', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7552, 'en', 'header_top', 'Header Top', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7553, 'en', 'header_top_text_color', 'Header Top Text Color', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7554, 'en', 'header_top_background_color', 'Header Top Background Color', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7555, 'en', 'header_main_menu_text_color', 'Header Main Menu Text Color', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7556, 'en', 'header_main_menu_hover_color', 'Header Main Menu Hover Color', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7557, 'en', 'header_middle_background_color', 'Header Middle Background Color', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7558, 'en', 'header_bottom_background_color', 'Header Bottom Background Color', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7559, 'en', 'header_bottom_social_option', 'Header Bottom Social Option', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7560, 'en', 'switch_header_bottom_social_option', 'Switch header bottom social option.', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7561, 'en', 'header_bottom_social_icon_color', 'Header Bottom Social Icon Color', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7562, 'en', 'header_bottom_social_background_color', 'Header Bottom Social Background Color', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7563, 'en', 'header_bottom_social_icon_hover_color', 'Header Bottom Social Icon Hover Color', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7564, 'en', 'header_bottom_social_background_hover_color', 'Header Bottom Social Background Hover Color', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7565, 'en', 'breaking_news_option', 'Breaking News Option', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7566, 'en', 'breaking_news_variations', 'Breaking News Variations', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7567, 'en', 'choose_breaking_news_variation_from_here', 'Choose breaking news variation from here.', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7568, 'en', 'breaking_news_position', 'Breaking News Position', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7569, 'en', 'choose_breaking_news_position', 'Choose breaking news position.', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7570, 'en', 'breaking_news_text', 'Breaking News Text', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7571, 'en', 'breaking_news_variation_1_background_color', 'Breaking News Variation 1 Background Color', '2023-12-06 16:10:22', '2023-12-06 16:10:22'),
(7572, 'en', 'ads', 'Ads', '2023-12-06 16:10:23', '2023-12-06 16:10:23'),
(7573, 'en', 'set_ads_image', 'Set ads image.', '2023-12-06 16:10:23', '2023-12-06 16:10:23'),
(7574, 'en', 'header_main_background_color', 'Header Main Background Color', '2023-12-06 16:10:23', '2023-12-06 16:10:23'),
(7575, 'en', 'header_middle_social_option', 'Header Middle Social Option', '2023-12-06 16:10:23', '2023-12-06 16:10:23'),
(7576, 'en', 'switch_header_middle_social_option', 'Switch header middle social option.', '2023-12-06 16:10:23', '2023-12-06 16:10:23'),
(7577, 'en', 'header_middle_social_icon_color', 'Header Middle Social Icon Color', '2023-12-06 16:10:23', '2023-12-06 16:10:23'),
(7578, 'en', 'header_middle_social_background_color', 'Header Middle Social Background Color', '2023-12-06 16:10:23', '2023-12-06 16:10:23'),
(7579, 'en', 'header_middle_social_icon_hover_color', 'Header Middle Social Icon Hover Color', '2023-12-06 16:10:23', '2023-12-06 16:10:23'),
(7580, 'en', 'header_middle_social_background_hover_color', 'Header Middle Social Background Hover Color', '2023-12-06 16:10:23', '2023-12-06 16:10:23'),
(7581, 'en', 'header_bottom_menu_text_color', 'Header Bottom Menu Text Color', '2023-12-06 16:10:23', '2023-12-06 16:10:23'),
(7582, 'en', 'header_bottom_menu_hover_color', 'Header Bottom Menu Hover Color', '2023-12-06 16:10:23', '2023-12-06 16:10:23'),
(7583, 'en', 'widget_position_updated_successfully', 'Widget Position Updated Successfully', '2023-12-09 10:17:56', '2023-12-09 10:17:56'),
(7584, 'en', 'widget_order_updated_successfully', 'Widget Order Updated Successfully', '2023-12-09 10:17:56', '2023-12-09 10:17:56'),
(7585, 'en', 'new_section_created_successfully', 'New Section Created Successfully', '2023-12-09 10:18:30', '2023-12-09 10:18:30'),
(7586, 'en', 'section_sorted_successfully', 'Section Sorted Successfully', '2023-12-09 10:18:35', '2023-12-09 10:18:35'),
(7587, 'en', 'section_removed_successfully', 'Section Removed Successfully', '2023-12-09 10:19:04', '2023-12-09 10:19:04'),
(7588, 'en', 'link', 'Link', '2023-12-09 10:19:23', '2023-12-09 10:19:23'),
(7589, 'en', 'ads_url', 'Ads Url', '2023-12-09 10:19:23', '2023-12-09 10:19:23'),
(7590, 'en', 'open_in_new_window', 'Open in new window', '2023-12-09 10:19:23', '2023-12-09 10:19:23'),
(7591, 'en', 'widget_removed_successfully', 'Widget Removed Successfully', '2023-12-09 10:22:40', '2023-12-09 10:22:40'),
(7592, 'en', 'widget_added_successfully', 'Widget Added Successfully', '2023-12-09 10:23:55', '2023-12-09 10:23:55'),
(7593, 'en', 'newsletter_short_desc', 'Newsletter Short Desc', '2023-12-09 12:08:40', '2023-12-09 12:08:40'),
(7594, 'en', 'name_placeholder', 'Name Placeholder', '2023-12-09 14:34:52', '2023-12-09 14:34:52'),
(7595, 'en', 'subject_placeholder', 'Subject Placeholder', '2023-12-09 14:34:52', '2023-12-09 14:34:52'),
(7596, 'en', 'message_placeholder', 'Message Placeholder', '2023-12-09 14:34:52', '2023-12-09 14:34:52'),
(7597, 'en', 'button_placeholder', 'Button Placeholder', '2023-12-09 14:34:52', '2023-12-09 14:34:52'),
(7598, 'en', 'submit_button_alignment', 'Submit Button Alignment', '2023-12-09 14:34:52', '2023-12-09 14:34:52'),
(7599, 'en', 'search_placeholder', 'Search Placeholder', '2023-12-09 14:49:42', '2023-12-09 14:49:42'),
(7600, 'en', 'voting', 'Voting', '2023-12-09 16:32:22', '2023-12-09 16:32:22'),
(7601, 'en', 'votes', 'Votes', '2023-12-09 16:32:22', '2023-12-09 16:32:22'),
(7602, 'en', 'add_vote', 'Add Vote', '2023-12-09 16:32:22', '2023-12-09 16:32:22'),
(7603, 'en', 'vote_deleted_successfully', 'Vote Deleted Successfully', '2023-12-09 16:32:28', '2023-12-09 16:32:28'),
(7604, 'en', 'edit_vote', 'Edit Vote', '2023-12-09 16:32:31', '2023-12-09 16:32:31'),
(7605, 'en', 'vote_end', 'Vote End', '2023-12-09 16:32:31', '2023-12-09 16:32:31'),
(7606, 'en', 'voting_featured_image', 'Voting Featured Image', '2023-12-09 16:32:31', '2023-12-09 16:32:31'),
(7607, 'en', 'options', 'Options', '2023-12-09 16:32:31', '2023-12-09 16:32:31'),
(7608, 'en', 'option', 'Option', '2023-12-09 16:32:31', '2023-12-09 16:32:31'),
(7609, 'en', 'title_field_is_required', 'Title Field Is Required', '2023-12-09 16:32:54', '2023-12-09 16:32:54'),
(7610, 'en', 'date_field_is_required', 'Date Field Is Required', '2023-12-09 16:32:54', '2023-12-09 16:32:54'),
(7611, 'en', 'option_field_is_required', 'Option Field Is Required', '2023-12-09 16:32:54', '2023-12-09 16:32:54'),
(7612, 'en', 'vote_update_successfully', 'Vote Update Successfully', '2023-12-09 16:32:54', '2023-12-09 16:32:54'),
(7613, 'en', 'theme_primary_color', 'Theme Primary Color', '2023-12-09 17:08:44', '2023-12-09 17:08:44'),
(7614, 'en', 'set_theme_primary_color', 'Set theme primary color', '2023-12-09 17:08:44', '2023-12-09 17:08:44'),
(7615, 'en', 'no_section_found', 'No Section Found', '2023-12-09 17:16:40', '2023-12-09 17:16:40'),
(7616, 'en', 'header_variation', 'Header Variation', '2023-12-09 17:16:53', '2023-12-09 17:16:53'),
(7617, 'en', 'footer_variation', 'Footer Variation', '2023-12-09 17:16:57', '2023-12-09 17:16:57'),
(7618, 'en', 'footer_variations', 'Footer Variations', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7619, 'en', 'choose_footer_variation_from_here', 'Choose footer variation from here.', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7620, 'en', 'newsletter_on_footer', 'Newsletter On Footer', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7621, 'en', 'footer_newsletter_position', 'Footer Newsletter Position', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7622, 'en', 'choose_footer_newsletter_position', 'Choose footer newsletter position.', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7623, 'en', 'footer_newsletter_background_color', 'Footer Newsletter Background Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7624, 'en', 'footer_newsletter_button_color', 'Footer Newsletter Button Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7625, 'en', 'footer_newsletter_button_text_color', 'Footer Newsletter Button Text Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7626, 'en', 'newsletter_social_icon_color', 'Newsletter Social Icon Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7627, 'en', 'newsletter_social_background_color', 'Newsletter Social Background Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7628, 'en', 'newsletter_social_icon_hover_color', 'Newsletter Social Icon Hover Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7629, 'en', 'newsletter_social_background_hover_color', 'Newsletter Social Background Hover Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7630, 'en', 'footer_widget_background_color', 'Footer Widget Background Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7631, 'en', 'footer_widget_title_color', 'Footer Widget Title Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7632, 'en', 'footer_widget_title_after_color', 'Footer Widget Title After Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7633, 'en', 'footer_widget_text_color', 'Footer Widget Text Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7634, 'en', 'footer_widget_anchor_hover_color', 'Footer Widget Anchor Hover Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7635, 'en', 'footer_bottom_background_color', 'Footer Bottom Background Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7636, 'en', 'footer_bottom_menu', 'Footer Bottom Menu', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7637, 'en', 'choose_footer_bottom_menu', 'Choose footer bottom menu.', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7638, 'en', 'footer_middle_background_color', 'Footer Middle Background Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7639, 'en', 'footer_middle_text', 'Footer Middle Text', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7640, 'en', 'footer_middle_text_color', 'Footer Middle Text Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7641, 'en', 'footer_middle_social_icon_color', 'Footer Middle Social Icon Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7642, 'en', 'footer_middle_social_background_color', 'Footer Middle Social Background Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7643, 'en', 'footer_middle_social_icon_hover_color', 'Footer Middle Social Icon Hover Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7644, 'en', 'footer_middle_social_background_hover_color', 'Footer Middle Social Background Hover Color', '2023-12-09 17:21:16', '2023-12-09 17:21:16'),
(7645, 'en', 'style', 'Style', '2023-12-10 11:45:07', '2023-12-10 11:45:07'),
(7646, 'en', 'none', 'None', '2023-12-10 11:45:07', '2023-12-10 11:45:07'),
(7647, 'en', 'media_file', 'Media File', '2023-12-10 11:45:07', '2023-12-10 11:45:07'),
(7648, 'en', 'custom_url', 'Custom Url', '2023-12-10 11:45:07', '2023-12-10 11:45:07'),
(7649, 'en', 'your_link', 'Your Link', '2023-12-10 11:45:07', '2023-12-10 11:45:07'),
(7650, 'en', 'image_alignment', 'Image Alignment', '2023-12-10 11:45:07', '2023-12-10 11:45:07'),
(7651, 'en', 'width', 'Width', '2023-12-10 11:45:07', '2023-12-10 11:45:07'),
(7652, 'en', 'max_width', 'Max Width', '2023-12-10 11:45:07', '2023-12-10 11:45:07'),
(7653, 'en', 'height', 'Height', '2023-12-10 11:45:07', '2023-12-10 11:45:07'),
(7654, 'en', 'number_of_categories', 'Number of Categories', '2023-12-10 12:48:44', '2023-12-10 12:48:44'),
(7655, 'en', 'number_of_tags', 'Number of Tags', '2023-12-10 12:49:58', '2023-12-10 12:49:58'),
(7656, 'en', 'comment_count', 'Comment Count', '2023-12-10 12:51:02', '2023-12-10 12:51:02'),
(7657, 'en', 'address', 'Address', '2023-12-10 15:35:33', '2023-12-10 15:35:33'),
(7658, 'en', 'mail', 'Mail', '2023-12-10 15:35:33', '2023-12-10 15:35:33'),
(7659, 'en', 'phone', 'Phone', '2023-12-10 15:35:33', '2023-12-10 15:35:33'),
(7660, 'en', 'sidebar_updated', 'Sidebar Updated', '2023-12-10 15:36:28', '2023-12-10 15:36:28'),
(7661, 'en', 'type_of_posts', 'Type of Posts', '2023-12-10 16:10:31', '2023-12-10 16:10:31'),
(7662, 'en', 'login_credentials_does_not_match', 'Login Credentials Does not Match', '2023-12-10 17:23:26', '2023-12-10 17:23:26'),
(7663, 'en', 'edit_comment', 'Edit Comment', '2023-12-11 10:07:54', '2023-12-11 10:07:54'),
(7664, 'en', 'post_update_failed', 'Post Update Failed', '2023-12-11 10:08:00', '2023-12-11 10:08:00'),
(7665, 'en', 'please_insert_author_name', 'Please Insert Author Name', '2023-12-11 10:08:00', '2023-12-11 10:08:00'),
(7666, 'en', 'author_maximum_length_is_50', 'Author Maximum Length is 50', '2023-12-11 10:08:00', '2023-12-11 10:08:00'),
(7667, 'en', 'please_insert_author_email', 'Please Insert Author Email', '2023-12-11 10:08:00', '2023-12-11 10:08:00'),
(7668, 'en', 'email_is_not_valid', 'Email is not valid', '2023-12-11 10:08:00', '2023-12-11 10:08:00'),
(7669, 'en', 'please_write_some_comment', 'Please Write Some Comment', '2023-12-11 10:08:00', '2023-12-11 10:08:00'),
(7670, 'en', 'comment_status_is_required', 'Comment Status is Required', '2023-12-11 10:08:00', '2023-12-11 10:08:00'),
(7671, 'en', 'submitted_field_must_not_be_empty', 'Submitted Field Must not be Empty', '2023-12-11 10:08:00', '2023-12-11 10:08:00'),
(7672, 'en', 'comment_update_successfully', 'Comment Update Successfully', '2023-12-11 11:14:22', '2023-12-11 11:14:22'),
(7673, 'en', 'setup_open_ai_settings', 'Setup Open AI Settings', '2023-12-11 11:39:00', '2023-12-11 11:39:00'),
(7674, 'en', 'default_openai_model', 'Default OpenAI Model', '2023-12-11 11:39:00', '2023-12-11 11:39:00'),
(7675, 'en', 'openai_secret_key', 'OpenAI Secret Key', '2023-12-11 11:39:00', '2023-12-11 11:39:00'),
(7676, 'en', 'enter_secret_key', 'Enter Secret Key', '2023-12-11 11:39:00', '2023-12-11 11:39:00'),
(7677, 'en', 'general_settings_updated_successfully', 'General settings updated successfully', '2023-12-11 11:49:10', '2023-12-11 11:49:10'),
(7678, 'en', 'registration_successful_please_login', 'Registration Successful. Please Login', '2023-12-11 15:38:37', '2023-12-11 15:38:37'),
(7679, 'en', 'name_field_is_required', 'Name Field Is Required', '2023-12-11 15:40:20', '2023-12-11 15:40:20'),
(7680, 'en', 'name_field_maximum_value_is_100_characters', 'Name field maximum value is 100 characters', '2023-12-11 15:40:20', '2023-12-11 15:40:20'),
(7681, 'en', 'email_field_is_required', 'Email Field Is Required', '2023-12-11 15:40:20', '2023-12-11 15:40:20'),
(7682, 'en', 'email_must_be_a_valid_email', 'Email must be a valid email', '2023-12-11 15:40:20', '2023-12-11 15:40:20'),
(7683, 'en', 'an_account_with_this_email_already_exists', 'An account with this email already exists', '2023-12-11 15:40:20', '2023-12-11 15:40:20'),
(7684, 'en', 'the_image_must_be_a_file_of_type_png_jpg_jpeg_svg', 'The image must be a file of type: png, jpg, jpeg, svg.', '2023-12-11 15:40:20', '2023-12-11 15:40:20'),
(7685, 'en', 'the_image_maximum_size_is_100_kilobytes', 'The image maximum size is 100 kilobytes.', '2023-12-11 15:40:20', '2023-12-11 15:40:20'),
(7686, 'en', 'profile_updated_successfully', 'Profile updated successfully', '2023-12-11 15:40:20', '2023-12-11 15:40:20'),
(7687, 'en', 'update_user', 'Update User', '2023-12-11 15:42:15', '2023-12-11 15:42:15'),
(7688, 'en', 'profile_picture', 'Profile Picture', '2023-12-11 15:42:15', '2023-12-11 15:42:15'),
(7689, 'en', 'give_your_name', 'Give your name', '2023-12-11 15:42:15', '2023-12-11 15:42:15'),
(7690, 'en', 'give_your_email_address', 'Give your email address', '2023-12-11 15:42:15', '2023-12-11 15:42:15'),
(7691, 'en', 'assign_role', 'Assign Role', '2023-12-11 15:42:15', '2023-12-11 15:42:15'),
(7692, 'en', 'select_a_role', 'Select a Role', '2023-12-11 15:42:15', '2023-12-11 15:42:15'),
(7693, 'en', 'profile_pic_is_required', 'Profile pic is required', '2023-12-11 15:43:07', '2023-12-11 15:43:07'),
(7694, 'en', 'invalid_selection', 'Invalid selection', '2023-12-11 15:43:07', '2023-12-11 15:43:07'),
(7695, 'en', 'user_updated_successfully', 'User updated successfully', '2023-12-11 15:43:07', '2023-12-11 15:43:07'),
(7696, 'en', 'install_themes', 'Install Themes', '2023-12-11 16:12:46', '2023-12-11 16:12:46'),
(7697, 'en', 'zip_file', 'Zip File', '2023-12-11 16:12:47', '2023-12-11 16:12:47'),
(7698, 'en', 'install', 'Install', '2023-12-11 16:12:47', '2023-12-11 16:12:47'),
(7699, 'en', 'theme_install_successfully', 'Theme install successfully', '2023-12-11 16:14:07', '2023-12-11 16:14:07'),
(7700, 'en', 'theme_activate_successfully', 'Theme activate successfully', '2023-12-11 16:14:15', '2023-12-11 16:14:15'),
(7701, 'en', 'plugings', 'Plugings', '2023-12-11 17:21:16', '2023-12-11 17:21:16'),
(7702, 'en', 'plugin_creating_guide', 'Plugin Creating Guide', '2023-12-11 17:21:16', '2023-12-11 17:21:16'),
(7703, 'en', 'install_plugin', 'Install Plugin', '2023-12-11 17:21:16', '2023-12-11 17:21:16'),
(7704, 'en', 'deactivate', 'Deactivate', '2023-12-11 17:21:16', '2023-12-11 17:21:16'),
(7705, 'en', 'deactive_confirmation', 'Deactive Confirmation', '2023-12-11 17:21:16', '2023-12-11 17:21:16'),
(7706, 'en', 'are_you_sure_to_deactive_this_plugin', 'Are you sure to deactive this plugin', '2023-12-11 17:21:16', '2023-12-11 17:21:16'),
(7707, 'en', 'are_you_sure_to_active_this_plugin', 'Are you sure to active this plugin', '2023-12-11 17:21:16', '2023-12-11 17:21:16'),
(7708, 'en', 'give_purchase_key_to_activate_this_plugin', 'Give Purchase Key To Activate This Plugin', '2023-12-11 17:21:16', '2023-12-11 17:21:16'),
(7709, 'en', 'theme_deleted_successfully', 'Theme Deleted Successfully', '2023-12-11 17:35:01', '2023-12-11 17:35:01'),
(7710, 'en', 'nothing_found', 'Nothing found', '2023-12-11 17:35:09', '2023-12-11 17:35:09'),
(7711, 'en', 'footer_logo', 'Footer Logo', '2023-12-12 12:49:57', '2023-12-12 12:49:57'),
(7712, 'en', 'set_footer_logo', 'Set Footer Logo.', '2023-12-12 12:49:57', '2023-12-12 12:49:57'),
(7713, 'en', 'site_seo__settings', 'Site Seo  Settings', '2023-12-12 16:33:35', '2023-12-12 16:33:35'),
(7714, 'en', 'meta_keywords', 'Meta keywords', '2023-12-12 16:33:35', '2023-12-12 16:33:35'),
(7715, 'en', 'seo_update_successfully', 'Seo update successfully', '2023-12-12 16:33:58', '2023-12-12 16:33:58'),
(7716, 'en', 'page_home_status_updated', 'Page Home Status Updated', '2023-12-14 17:04:33', '2023-12-14 17:04:33'),
(7717, 'en', 'smtp_configuration', 'Smtp Configuration', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7718, 'en', 'email_configuration', 'Email Configuration', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7719, 'en', 'type', 'Type', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7720, 'en', 'smtp', 'smtp', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7721, 'en', 'sendmail', 'Sendmail', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7722, 'en', 'mailgun', 'Mailgun', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7723, 'en', 'mail_host', 'MAIL HOST', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7724, 'en', 'mail_port', 'MAIL PORT', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7725, 'en', 'mail_username', 'MAIL USERNAME', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7726, 'en', 'mail_password', 'MAIL PASSWORD', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7727, 'en', 'mail_encryption', 'MAIL ENCRYPTION', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7728, 'en', 'mail_from_address', 'MAIL FROM ADDRESS', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7729, 'en', 'mail_from_name', 'MAIL FROM NAME', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7730, 'en', 'mailgun_domain', 'MAILGUN DOMAIN', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7731, 'en', 'mailgun_secret', 'MAILGUN SECRET', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7732, 'en', 'send_test_mail', 'Send Test Mail', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7733, 'en', 'subject', 'Subject', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7734, 'en', 'message', 'Message', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7735, 'en', 'send', 'Send', '2023-12-14 17:38:39', '2023-12-14 17:38:39'),
(7736, 'en', 'no', 'No.', '2023-12-14 17:41:10', '2023-12-14 17:41:10'),
(7737, 'en', 'template', 'Template', '2023-12-14 17:41:10', '2023-12-14 17:41:10'),
(7738, 'en', 'details', 'Details', '2023-12-14 17:41:10', '2023-12-14 17:41:10'),
(7739, 'en', 'enter_email_subject', 'Enter email subject', '2023-12-14 17:41:10', '2023-12-14 17:41:10'),
(7740, 'en', 'variables', 'Variables', '2023-12-14 17:41:10', '2023-12-14 17:41:10'),
(7741, 'en', 'email_template_updated_successful', 'Email template updated successful', '2023-12-14 17:42:25', '2023-12-14 17:42:25'),
(7742, 'en', 'placeholder_image', 'Placeholder Image', '2023-12-14 17:59:34', '2023-12-14 17:59:34'),
(7743, 'en', 'media_thumbnails_sizes', 'Media Thumbnails Sizes', '2023-12-14 17:59:34', '2023-12-14 17:59:34'),
(7744, 'en', 'large_thumb_image_size', 'Large Thumb Image Size', '2023-12-14 17:59:34', '2023-12-14 17:59:34'),
(7745, 'en', 'large_thumb_image_width', 'Large thumb image width', '2023-12-14 17:59:34', '2023-12-14 17:59:34'),
(7746, 'en', 'large_thumb_image_height', 'Large thumb image height', '2023-12-14 17:59:34', '2023-12-14 17:59:34'),
(7747, 'en', 'medium_thumb_image_size', 'Medium Thumb Image Size', '2023-12-14 17:59:34', '2023-12-14 17:59:34'),
(7748, 'en', 'medium_thumb_image_width', 'Medium thumb image width', '2023-12-14 17:59:34', '2023-12-14 17:59:34'),
(7749, 'en', 'medium_thumb_image_height', 'Medium thumb image height', '2023-12-14 17:59:34', '2023-12-14 17:59:34'),
(7750, 'en', 'small_thumb_image_size', 'Small Thumb Image Size', '2023-12-14 17:59:34', '2023-12-14 17:59:34'),
(7751, 'en', 'small_thumb_image_width', 'Small thumb image width', '2023-12-14 17:59:34', '2023-12-14 17:59:34'),
(7752, 'en', 'small_thumb_image_height', 'Small thumb image height', '2023-12-14 17:59:34', '2023-12-14 17:59:34'),
(7753, 'en', 'language_deleted_successfully', 'Language deleted successfully', '2023-12-19 10:43:19', '2023-12-19 10:43:19'),
(7754, 'en', 'new_language', 'New Language', '2023-12-19 10:45:57', '2023-12-19 10:45:57'),
(7755, 'en', 'type_name', 'Type Name', '2023-12-19 10:45:57', '2023-12-19 10:45:57'),
(7756, 'en', 'type__native_name', 'Type  Native Name', '2023-12-19 10:45:57', '2023-12-19 10:45:57'),
(7757, 'en', 'select_a_option', 'Select a option', '2023-12-19 10:45:57', '2023-12-19 10:45:57'),
(7758, 'en', 'translations_updated_successfully', 'Translations updated successfully', '2023-12-19 10:50:18', '2023-12-19 10:50:18'),
(7759, 'en', 'site_map_generated_successfully', 'Site Map Generated successfully', '2023-12-19 10:53:11', '2023-12-19 10:53:11'),
(7760, 'en', 'add_user', 'Add User', '2023-12-19 12:51:57', '2023-12-19 12:51:57'),
(7761, 'en', 'give_your_password', 'Give your password', '2023-12-19 12:51:57', '2023-12-19 12:51:57'),
(7762, 'en', 'confirm_password', 'Confirm Password', '2023-12-19 12:51:57', '2023-12-19 12:51:57'),
(7763, 'en', 'confirm_your_password', 'Confirm your password', '2023-12-19 12:51:57', '2023-12-19 12:51:57'),
(7764, 'en', 'add_role', 'Add Role', '2023-12-19 12:54:06', '2023-12-19 12:54:06'),
(7765, 'en', 'give_role_name', 'Give role name', '2023-12-19 12:54:06', '2023-12-19 12:54:06'),
(7766, 'en', 'module', 'Module', '2023-12-19 12:54:06', '2023-12-19 12:54:06'),
(7767, 'en', 'feature', 'Feature', '2023-12-19 12:54:06', '2023-12-19 12:54:06'),
(7768, 'en', 'create', 'Create', '2023-12-19 12:54:06', '2023-12-19 12:54:06'),
(7769, 'en', 'manage', 'Manage', '2023-12-19 12:54:06', '2023-12-19 12:54:06'),
(7770, 'en', 'show_', 'Show ', '2023-12-19 12:54:06', '2023-12-19 12:54:06'),
(7771, 'en', 'create_', 'Create ', '2023-12-19 12:54:06', '2023-12-19 12:54:06'),
(7772, 'en', 'edit_', 'Edit ', '2023-12-19 12:54:06', '2023-12-19 12:54:06'),
(7773, 'en', 'delete_', 'Delete ', '2023-12-19 12:54:06', '2023-12-19 12:54:06'),
(7774, 'en', 'manage_', 'Manage ', '2023-12-19 12:54:06', '2023-12-19 12:54:06'),
(7775, 'en', 'update_role', 'Update Role', '2023-12-19 12:54:07', '2023-12-19 12:54:07'),
(7776, 'en', 'update_profile', 'Update Profile', '2023-12-19 14:37:25', '2023-12-19 14:37:25'),
(7777, 'en', 'biography', 'Biography', '2023-12-19 14:37:25', '2023-12-19 14:37:25'),
(7778, 'en', 'not_more_than_200_characters', 'Not more than 200 characters', '2023-12-19 14:37:25', '2023-12-19 14:37:25'),
(7779, 'en', 'give_you_biography', 'Give you biography', '2023-12-19 14:37:25', '2023-12-19 14:37:25'),
(7780, 'en', 'old_password', 'Old Password', '2023-12-19 14:37:25', '2023-12-19 14:37:25'),
(7781, 'en', 'social_info', 'Social Info', '2023-12-19 14:37:25', '2023-12-19 14:37:25'),
(7782, 'en', 'set_the_default_social_from_theme_option_or_make_custom_social', 'Set the default social from theme option or make custom social.', '2023-12-19 14:37:25', '2023-12-19 14:37:25'),
(7783, 'en', 'add_slide', 'Add Slide', '2023-12-19 14:37:25', '2023-12-19 14:37:25'),
(7784, 'en', 'switch_enabled_to_display_preloader', 'Switch Enabled to Display Preloader.', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7785, 'en', 'preloader_style_type', 'Preloader Style Type', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7786, 'en', 'control_preloader_style_type_if_you_use_this_option_then_you_will_able_to_set_lot_of_preloader_style', 'Control preloader style type. If you use this option then you will able to set lot of preloader style', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7787, 'en', 'custom_preloader_type', 'Custom Preloader Type', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7788, 'en', 'image_type__text_type', 'Image Type - Text Type', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7789, 'en', 'set_custom_preloader_type', 'Set Custom Preloader Type.', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7790, 'en', 'preloader_image', 'Preloader Image', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7791, 'en', 'set_preloader_image', 'Set Preloader Image.', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7792, 'en', 'preloader_heading_tag', 'Preloader Heading Tag', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7793, 'en', 'set_preloader_heading_tag', 'Set Preloader Heading Tag.', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7794, 'en', 'preloader_text', 'Preloader Text', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7795, 'en', 'set_preloader_text', 'Set Preloader Text.', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7796, 'en', 'preloader_item_color', 'Preloader Item Color', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7797, 'en', 'preloader_background_color', 'Preloader Background Color', '2023-12-19 15:02:30', '2023-12-19 15:02:30'),
(7798, 'en', 'these_settings_control_the_typography_for_body', 'These settings control the typography for body.', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7799, 'en', 'font_family', 'Font Family', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7800, 'en', 'select__fonts', 'Select  Fonts', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7801, 'en', 'custom_font_1', 'Custom Font 1', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7802, 'en', 'custom_font_2', 'Custom Font 2', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7803, 'en', 'google_web_fonts', 'Google Web Fonts', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7804, 'en', 'font_weight__style', 'Font Weight & Style', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7805, 'en', 'font_subsets', 'Font Subsets', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7806, 'en', 'text_align', 'Text Align', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7807, 'en', 'text_transform', 'Text Transform', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7808, 'en', 'font_size', 'Font Size', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7809, 'en', 'size', 'Size', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7810, 'en', 'line_height', 'Line Height', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7811, 'en', 'word_spacing', 'Word Spacing', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7812, 'en', 'letter_spacing', 'Letter Spacing', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7813, 'en', 'the_quick_brown_fox_jumps_over_the_lazy_dog', 'The Quick Brown Fox Jumps Over The Lazy Dog', '2023-12-19 15:09:29', '2023-12-19 15:09:29'),
(7814, 'en', 'after_uploading_your_fonts_you_should_select_font_family_customfont1customfont2_from_dropdown_list_in_bodyparagraphheadingsmenu_typography_section', 'After uploading your fonts, you should select font family (custom-font-1/custom-font-2 from dropdown list in (Body/Paragraph/Headings/Menu) Typography section.', '2023-12-19 15:13:01', '2023-12-19 15:13:01'),
(7815, 'en', 'custom_font1', 'Custom Font1', '2023-12-19 15:13:01', '2023-12-19 15:13:01'),
(7816, 'en', 'please_enable_this_option_to_use_custom_font_1', 'Please Enable this option to use Custom Font 1.', '2023-12-19 15:13:01', '2023-12-19 15:13:01'),
(7817, 'en', 'custom_font_1_woff', 'Custom font 1 .woff', '2023-12-19 15:13:01', '2023-12-19 15:13:01'),
(7818, 'en', 'uploade_file', 'Uploade File', '2023-12-19 15:13:01', '2023-12-19 15:13:01'),
(7819, 'en', 'remove', 'Remove', '2023-12-19 15:13:01', '2023-12-19 15:13:01'),
(7820, 'en', 'custom_font_1_ttf', 'Custom font 1 .ttf', '2023-12-19 15:13:01', '2023-12-19 15:13:01'),
(7821, 'en', 'custom_font_1_eot', 'Custom font 1 .eot', '2023-12-19 15:13:01', '2023-12-19 15:13:01'),
(7822, 'en', 'custom_font2', 'Custom Font2', '2023-12-19 15:13:01', '2023-12-19 15:13:01'),
(7823, 'en', 'please_enable_this_option_to_use_custom_font_2', 'Please Enable this option to use Custom Font 2.', '2023-12-19 15:13:01', '2023-12-19 15:13:01'),
(7824, 'en', 'custom_font_2_woff', 'Custom font 2 .woff', '2023-12-19 15:13:01', '2023-12-19 15:13:01'),
(7825, 'en', 'custom_font_2_ttf', 'Custom font 2 .ttf', '2023-12-19 15:13:01', '2023-12-19 15:13:01'),
(7826, 'en', 'custom_font_2_eot', 'Custom font 2 .eot', '2023-12-19 15:13:01', '2023-12-19 15:13:01'),
(7827, 'en', 'page_breadcrumb', 'Page Breadcrumb', '2023-12-20 11:49:33', '2023-12-20 11:49:33'),
(7828, 'en', 'page_404_image', 'Page 404 Image', '2023-12-20 11:49:37', '2023-12-20 11:49:37'),
(7829, 'en', 'set_404_page_image', 'Set 404 Page Image.', '2023-12-20 11:49:37', '2023-12-20 11:49:37'),
(7830, 'en', 'set_page_title', 'Set Page Title', '2023-12-20 11:49:37', '2023-12-20 11:49:37'),
(7831, 'en', 'page_subtitle', 'Page Subtitle', '2023-12-20 11:49:37', '2023-12-20 11:49:37'),
(7832, 'en', 'set_page_subtitle', 'Set Page Subtitle', '2023-12-20 11:49:37', '2023-12-20 11:49:37'),
(7833, 'en', 'button_before_text', 'Button Before Text', '2023-12-20 11:49:37', '2023-12-20 11:49:37'),
(7834, 'en', 'custom_404_style', 'Custom 404 Style', '2023-12-20 11:49:37', '2023-12-20 11:49:37'),
(7835, 'en', 'page_404_button_background_color', 'Page 404 Button Background Color', '2023-12-20 11:49:37', '2023-12-20 11:49:37'),
(7836, 'en', 'page_404_button_text_after_color', 'Page 404 Button Text After Color', '2023-12-20 11:49:37', '2023-12-20 11:49:37'),
(7837, 'en', 'contact_email_will_be_sent', 'Contact Email Will Be Sent', '2023-12-20 12:17:29', '2023-12-20 12:17:29'),
(7838, 'en', 'set_where_will_be_the_contact_email_will_be_sent', 'set where will be the contact email will be sent', '2023-12-20 12:17:29', '2023-12-20 12:17:29'),
(7839, 'en', 'social_profile_links', 'Social Profile Links', '2023-12-20 15:02:56', '2023-12-20 15:02:56'),
(7840, 'en', 'add_social_icon_and_url', 'Add social icon and url.', '2023-12-20 15:02:56', '2023-12-20 15:02:56'),
(7841, 'en', 'css_code', 'CSS Code', '2023-12-20 15:12:36', '2023-12-20 15:12:36'),
(7842, 'en', 'paste_your_css_code_here', 'Paste your CSS code here.', '2023-12-20 15:12:36', '2023-12-20 15:12:36');
INSERT INTO `tl_translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(7843, 'en', 'adsense_list', 'Adsense List', '2023-12-20 15:47:54', '2023-12-20 15:47:54'),
(7844, 'en', 'add_new_addsense', 'Add new addsense.', '2023-12-20 15:47:54', '2023-12-20 15:47:54'),
(7845, 'en', 'import_options_json', 'Import Options Json', '2023-12-20 15:55:20', '2023-12-20 15:55:20'),
(7846, 'en', 'import_from_clipboard', 'Import From Clipboard', '2023-12-20 15:55:20', '2023-12-20 15:55:20'),
(7847, 'en', 'paste_your_clipboard_data_here', 'Paste your clipboard data here.', '2023-12-20 15:55:20', '2023-12-20 15:55:20'),
(7848, 'en', 'import', 'Import', '2023-12-20 15:55:20', '2023-12-20 15:55:20'),
(7849, 'en', 'warning_this_will_overwrite_all_existing_option_values_please_proceed_with_caution', 'WARNING! This will overwrite all existing option values, please proceed with caution!', '2023-12-20 15:55:20', '2023-12-20 15:55:20'),
(7850, 'en', 'export_options_json', 'Export Options Json', '2023-12-20 15:55:20', '2023-12-20 15:55:20'),
(7851, 'en', 'here_you_can_copydownload_your_current_option_settings_keep_this_safe_as_you_can_use_it_as_a_backup_should_anything_go_wrong_or_you_can_use_it_to_restore_your_settings_on_this_site_or_any_other_site', 'Here you can copy/download your current option settings. Keep this safe as you can use it as a backup should anything go wrong, or you can use it to restore your settings on this site (or any other site).', '2023-12-20 15:55:20', '2023-12-20 15:55:20'),
(7852, 'en', 'copy_to_clipboard', 'Copy to Clipboard', '2023-12-20 15:55:20', '2023-12-20 15:55:20'),
(7853, 'en', 'export_file', 'Export File', '2023-12-20 15:55:20', '2023-12-20 15:55:20'),
(7854, 'en', 'gdpr_cookies_consent', 'GDPR (Cookies Consent)', '2023-12-20 16:39:18', '2023-12-20 16:39:18'),
(7855, 'en', 'enable_cookie_consent', 'Enable Cookie Consent', '2023-12-20 16:39:18', '2023-12-20 16:39:18'),
(7856, 'en', 'button_label', 'Button Label', '2023-12-20 16:39:18', '2023-12-20 16:39:18'),
(7857, 'en', 'enter_button_label', 'Enter button Label', '2023-12-20 16:39:18', '2023-12-20 16:39:18'),
(7858, 'en', 'position', 'Position', '2023-12-20 16:39:18', '2023-12-20 16:39:18'),
(7859, 'en', 'users_login_activity', 'Users login activity', '2023-12-20 17:28:21', '2023-12-20 17:28:21'),
(7860, 'en', 'user', 'User', '2023-12-20 17:28:21', '2023-12-20 17:28:21'),
(7861, 'en', 'login_at', 'Login At', '2023-12-20 17:28:21', '2023-12-20 17:28:21'),
(7862, 'en', 'logout_at', 'Logout At', '2023-12-20 17:28:21', '2023-12-20 17:28:21'),
(7863, 'en', 'ip', 'IP', '2023-12-20 17:28:21', '2023-12-20 17:28:21'),
(7864, 'en', 'operating_system', 'Operating System', '2023-12-20 17:28:21', '2023-12-20 17:28:21'),
(7865, 'en', 'browser', 'Browser', '2023-12-20 17:28:21', '2023-12-20 17:28:21'),
(7866, 'en', 'action', 'Action', '2023-12-20 17:28:21', '2023-12-20 17:28:21'),
(7867, 'en', '________________________bulk_action_', '                        Bulk Action ', '2023-12-20 17:28:21', '2023-12-20 17:28:21'),
(7868, 'en', '________________________delete_selection_', '                        Delete selection ', '2023-12-20 17:28:21', '2023-12-20 17:28:21'),
(7869, 'en', '________________________apply_', '                        Apply ', '2023-12-20 17:28:21', '2023-12-20 17:28:21'),
(7870, 'en', 'no_item_selected_', 'No Item Selected ', '2023-12-20 17:28:21', '2023-12-20 17:28:21'),
(7871, 'en', 'no_action_selected_', 'No Action Selected ', '2023-12-20 17:28:21', '2023-12-20 17:28:21'),
(7872, 'en', 'create_voting', 'Create Voting', '2023-12-20 18:11:37', '2023-12-20 18:11:37'),
(7873, 'en', 'files_backup', 'Files Backup', '2023-12-21 10:44:10', '2023-12-21 10:44:10'),
(7874, 'en', 'database_backup', 'Database Backup', '2023-12-21 10:44:10', '2023-12-21 10:44:10'),
(7875, 'en', 'generate_project_backup', 'Generate Project Backup', '2023-12-21 10:44:10', '2023-12-21 10:44:10'),
(7876, 'en', 'file', 'File', '2023-12-21 10:44:10', '2023-12-21 10:44:10'),
(7877, 'en', 'create_date', 'Create Date', '2023-12-21 10:44:10', '2023-12-21 10:44:10'),
(7878, 'en', 'no_backup_file_found', 'No backup file found', '2023-12-21 10:44:10', '2023-12-21 10:44:10'),
(7879, 'en', 'backup_generate_successfully', 'Backup generate successfully', '2023-12-21 10:59:30', '2023-12-21 10:59:30'),
(7880, 'en', 'database_backup_file_created_successfully', 'Database backup file created successfully', '2023-12-21 10:59:37', '2023-12-21 10:59:37'),
(7881, 'en', 'header_top_multilanguage', 'Header Top Multi-Language', '2023-12-21 15:58:49', '2023-12-21 15:58:49'),
(7882, 'en', 'edit_tag', 'Edit Tag', '2023-12-24 14:48:28', '2023-12-24 14:48:28'),
(7883, 'en', 'please_write_the_tag_name_under_225_words', 'Please Write The Tag Name under 225 words', '2023-12-24 14:49:18', '2023-12-24 14:49:18'),
(7884, 'en', 'tag_updated_successfully', 'Tag Updated Successfully', '2023-12-24 14:49:18', '2023-12-24 14:49:18'),
(7885, 'en', 'try_forgot_password', 'Try Forgot Password', '2023-12-24 15:22:02', '2023-12-24 15:22:02'),
(7886, 'en', 'reset_password', 'Reset Password', '2023-12-24 15:22:02', '2023-12-24 15:22:02'),
(7887, 'en', 'send_password_reset________________________________________________________________________________________________________link', 'Send Password Reset                                                                                                        Link', '2023-12-24 15:22:02', '2023-12-24 15:22:02'),
(7888, 'en', 'unable_to_delete_menu', 'Unable to delete menu', '2023-12-26 11:58:09', '2023-12-26 11:58:09'),
(7889, 'en', 'clear_filter', 'Clear Filter', '2023-12-26 17:44:18', '2023-12-26 17:44:18'),
(7890, 'en', 'select_post_type', 'Select Post Type', '2023-12-26 18:03:48', '2023-12-26 18:03:48'),
(7891, 'en', 'number_of_tag', 'Number of Tag', '2023-12-26 18:41:00', '2023-12-26 18:41:00'),
(7892, 'en', '___', 'تم تسجيل الدخول بنجاح', '2023-12-27 12:40:22', '2023-12-27 12:40:22'),
(7893, 'en', 'edit_language', 'Edit Language', '2023-12-27 12:48:04', '2023-12-27 12:48:04'),
(7894, 'en', 'update_language_information', 'Update Language Information', '2023-12-27 12:48:05', '2023-12-27 12:48:05'),
(7895, 'en', 'module_name', 'Module Name', '2023-12-28 09:52:48', '2023-12-28 09:52:48'),
(7896, 'en', 'permission_name', 'Permission Name', '2023-12-28 09:52:48', '2023-12-28 09:52:48'),
(7897, 'sa', 'page_builder', 'منشئ الصفحة', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7898, 'sa', 'preview', 'معاينة', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7899, 'sa', 'add_new_section', 'إضافة قسم جديد', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7900, 'sa', 'widgets', 'الحاجيات', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7901, 'sa', 'save', 'يحفظ', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7902, 'sa', 'search_widget', 'أداة البحث', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7903, 'sa', 'delete_confirmation', 'حذف التأكيد', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7904, 'sa', 'are_you_sure_to_delete_this', 'هل أنت متأكد من حذف هذا', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7905, 'sa', 'cancel', 'يلغي', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7906, 'sa', 'delete', 'يمسح', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7907, 'sa', 'select_layout', 'حدد التخطيط', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7908, 'sa', 'media_library', 'مكتبة الوسائط', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7909, 'sa', 'upload_files', 'تحميل الملفات', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7910, 'sa', 'click_or_drop_files_here_to_upload', 'انقر أو أسقط الملفات هنا للتحميل', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7911, 'sa', 'filter_media', 'إعلام منقى', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7912, 'sa', 'all_file_type', 'كل نوع الملف', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7913, 'sa', 'all_dates', 'جميع التواريخ', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7914, 'sa', 'load_more', 'تحميل المزيد', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7915, 'sa', 'insert', 'إدراج', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7916, 'sa', 'attachment_details', 'تفاصيل المرفقات', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7917, 'sa', 'page_section_create_request_failed', 'فشل إنشاء طلب قسم الصفحة', '2023-12-28 11:00:33', '2023-12-28 11:00:33'),
(7918, 'sa', 'page_section_remove_request_failed', 'فشل طلب إزالة قسم الصفحة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7919, 'sa', 'section_properties', 'خصائص القسم', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7920, 'sa', 'section_edit_request_failed', 'فشل طلب تحرير القسم', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7921, 'sa', 'widget_adding_request_failed', 'فشل طلب إضافة القطعة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7922, 'sa', 'widget_removing_request_failed', 'فشل طلب إزالة القطعة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7923, 'sa', 'widget_position_update_request_failed', 'فشل طلب تحديث موضع عنصر واجهة المستخدم', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7924, 'sa', 'widget_order_request_failed', 'فشل طلب طلب القطعة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7925, 'sa', 'properties', 'ملكيات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7926, 'sa', 'widget_edit_request_failed', 'فشل طلب تحرير القطعة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7927, 'sa', 'properties_update_request_failed', 'فشل طلب تحديث الخصائص', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7928, 'sa', 'my_profile', 'ملفي', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7929, 'sa', 'log_out', 'تسجيل خروج', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7930, 'sa', 'clear_cache', 'مسح ذاكرة التخزين المؤقت', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7931, 'sa', 'dashboard', 'لوحة القيادة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7932, 'sa', 'media', 'وسائط', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7933, 'sa', 'post', 'بريد', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7934, 'sa', 'all_posts', 'جميع المشاركات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7935, 'sa', 'add_new_post', 'إضافة مشاركة جديدة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7936, 'sa', 'categories', '********', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7937, 'sa', 'tags', 'العلامات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7938, 'sa', 'comments', 'تعليقات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7939, 'sa', 'settings', 'إعدادات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7940, 'sa', 'post_share_settings', 'إعدادات مشاركة النشر', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7941, 'sa', 'open_ai_settings', 'افتح إعدادات الذكاء الاصطناعي', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7942, 'sa', 'comment_settings', 'إعدادات التعليق', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7943, 'sa', 'pages', 'الصفحات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7944, 'sa', 'all_pages', 'كل الصفحات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7945, 'sa', 'add_new_page', 'إضافة صفحة جديدة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7946, 'sa', 'demo_plugin', 'البرنامج المساعد التجريبي', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7947, 'sa', 'addon', 'اضافه', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7948, 'sa', 'adoon', 'عبد', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7949, 'sa', 'appearances', 'ظهور', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7950, 'sa', 'themes', 'المواضيع', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7951, 'sa', 'menus', 'القوائم', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7952, 'sa', 'theme_options', 'خيارات الموضوع', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7953, 'sa', 'general_settings', 'الاعدادات العامة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7954, 'sa', 'manage_members', 'إدارة الأعضاء', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7955, 'sa', 'manage_voting', 'إدارة التصويت', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7956, 'sa', 'plugins', 'الإضافات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7957, 'sa', 'email_settings', 'إعدادات البريد الإلكتروني', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7958, 'sa', 'email_templates', 'قوالب البريد الإلكتروني', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7959, 'sa', 'languages', 'اللغات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7960, 'sa', 'media_settings', 'إعدادات الوسائط', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7961, 'sa', 'seo_settings', 'إعدادات تحسين محركات البحث', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7962, 'sa', 'generate_sitemap', 'إنشاء خريطة الموقع', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7963, 'sa', 'system_users', 'مستخدمي النظام', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7964, 'sa', 'users', 'المستخدمين', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7965, 'sa', 'roles', 'الأدوار', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7966, 'sa', 'permissions', 'الأذونات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7967, 'sa', 'activity_logs', 'سجلات النشاط', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7968, 'sa', 'login_activity', 'نشاط تسجيل الدخول', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7969, 'sa', 'system', 'نظام', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7970, 'sa', 'update', 'تحديث', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7971, 'sa', 'backups', 'النسخ الاحتياطية', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7972, 'sa', 'alt_text', 'نص بديل', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7973, 'sa', 'title', 'عنوان', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7974, 'sa', 'caption', 'التسمية التوضيحية', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7975, 'sa', 'description', 'وصف', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7976, 'sa', 'add_new_language', 'إضافة لغة جديدة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7977, 'sa', 'name', 'اسم', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7978, 'sa', 'native_name', 'الاسم الأصلي', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7979, 'sa', 'code', 'شفرة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7980, 'sa', 'flag', 'علَم', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7981, 'sa', 'rtl', 'من اليمين إلى اليسار', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7982, 'sa', 'status', 'حالة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7983, 'sa', 'actions', 'أجراءات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7984, 'sa', 'backend_translations', 'ترجمات الخلفية', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7985, 'sa', 'frontend_translations', 'ترجمات الواجهة الأمامية', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7986, 'sa', 'edit', 'يحرر', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7987, 'sa', 'cencel', 'سينسيل', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7988, 'sa', 'key', 'مفتاح', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7989, 'sa', 'value', 'قيمة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7990, 'sa', 'save_changes', 'حفظ التغييرات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7991, 'sa', 'login', 'تسجيل الدخول', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7992, 'sa', 'login_to', 'تسجيل الدخول إلى', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7993, 'sa', 'email', 'بريد إلكتروني', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7994, 'sa', 'email_address', 'عنوان البريد الإلكتروني', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7995, 'sa', 'password', 'كلمة المرور', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7996, 'sa', 'forgot_password', 'هل نسيت كلمة السر؟', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7997, 'sa', 'log_in', 'تسجيل الدخول', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7998, 'sa', 'email_is_required', 'البريد الالكتروني مطلوب', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(7999, 'sa', 'invalid_email_address', 'عنوان البريد الإلكتروني غير صالح', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8000, 'sa', 'password_is_required', 'كلمة المرور مطلوبة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8001, 'sa', 'login_successful', 'تم تسجيل الدخول بنجاح', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8002, 'sa', 'total_posts', 'إجمالي المشاركات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8003, 'sa', 'total_pages', 'إجمالي الصفحات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8004, 'sa', 'total_members', 'إجمالي الأعضاء', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8005, 'sa', 'total_comments', 'إجمالي التعليقات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8006, 'sa', 'visitors_reports', 'تقارير الزوار', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8007, 'sa', 'monthly', 'شهريا', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8008, 'sa', 'daily', 'يوميًا', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8009, 'sa', 'post_status', 'وضع آخر', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8010, 'sa', 'published', 'نشرت', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8011, 'sa', 'scheduled', 'المقرر', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8012, 'sa', 'drafts', 'المسودات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8013, 'sa', 'pending', 'قيد الانتظار', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8014, 'sa', 'featured', 'متميز', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8015, 'sa', 'top_countries', 'أهم الدول', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8016, 'sa', 'this_month', 'هذا الشهر', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8017, 'sa', 'today', 'اليوم', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8018, 'sa', 'top_browser', 'المتصفح الأعلى', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8019, 'sa', 'top_device', 'الجهاز العلوي', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8020, 'sa', 'latest_members', 'أحدث الأعضاء', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8021, 'sa', 'member', 'عضو', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8022, 'sa', 'joined_at', 'انضم في', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8023, 'sa', 'most_viewed_post', 'المشاركة الأكثر مشاهدة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8024, 'sa', 'recent_comments', 'احدث التعليقات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8025, 'sa', 'author', 'مؤلف', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8026, 'sa', 'comment', 'تعليق', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8027, 'sa', 'submitted_on', 'تم إرساله', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8028, 'sa', 'popular_categories', 'الفئات الشعبية', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8029, 'sa', 'latest_posts', 'آخر المشاركات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8030, 'sa', 'latest_pages', 'أحدث الصفحات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8031, 'sa', 'image', 'صورة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8032, 'sa', 'site_title', 'عنوان الموقع', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8033, 'sa', 'site_motto', 'شعار الموقع', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8034, 'sa', 'site_moto', 'موقع موتو', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8035, 'sa', 'logo', 'شعار', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8036, 'sa', 'choose_image', 'اختر صورة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8037, 'sa', 'logo_mobile', 'الشعار (الجوال)', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8038, 'sa', 'admin_logo', 'شعار المشرف', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8039, 'sa', 'admin_logo_mobile', 'شعار المشرف (الجوال)', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8040, 'sa', 'admin_dark_logo', 'شعار المشرف الداكن', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8041, 'sa', 'admin_dark_logo_mobile', 'الشعار الداكن للمشرف (الجوال)', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8042, 'sa', 'favicon', 'الرمز المفضل', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8043, 'sa', 'default_language', 'اللغة الافتراضية', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8044, 'sa', 'select_default_language', 'حدد اللغة الافتراضية', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8045, 'sa', 'select_default_timezone', 'حدد المنطقة الزمنية الافتراضية', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8046, 'sa', 'copyright_text', 'نص حقوق التأليف والنشر', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8047, 'sa', 'submit', 'يُقدِّم', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8048, 'sa', 'add_new_user', 'إضافة مستخدم جديد', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8049, 'sa', 'uid', 'معرف فريد', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8050, 'sa', 'update_system', 'تحديث النظام', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8051, 'sa', 'system__server_information', 'النظام & معلومات الخادم', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8052, 'sa', 'config', 'التكوين', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8053, 'sa', 'config_name', 'اسم التكوين', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8054, 'sa', 'current', 'حاضِر', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8055, 'sa', 'recommended', 'مُستَحسَن', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8056, 'sa', 'filesystem_permissions', 'أذونات نظام الملفات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8057, 'sa', 'file_or_folder', 'ملف أو مجلد', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8058, 'sa', 'system_update', 'تحديث النظام', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8059, 'sa', 'please_backup_your_files_and_database_before_update', 'يرجى النسخ الاحتياطي للملفات وقاعدة البيانات الخاصة بك قبل التحديث.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8060, 'sa', 'generate_file_backup', 'إنشاء نسخة احتياطية للملفات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8061, 'sa', 'generate_database_backup', 'إنشاء نسخة احتياطية لقاعدة البيانات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8062, 'sa', 'do_not_reload_or_close_tab_while_updating_it_may_takes_some_times', 'لا تقم بإعادة تحميل أو إغلاق علامة التبويب أثناء التحديث. قد يستغرق الأمر بعض الأوقات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8063, 'sa', 'update_zip_file', 'تحديث ملف مضغوط', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8064, 'sa', 'reset_section', 'إعادة تعيين القسم', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8065, 'sa', 'reset_all', 'إعادة ضبط الجميع', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8066, 'sa', 'general', 'عام', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8067, 'sa', 'back_to_top', 'العودة إلى الأعلى', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8068, 'sa', 'preloader', 'أداة التحميل المسبق', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8069, 'sa', 'theme_color', 'لون الموضوع', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8070, 'sa', 'contact', 'اتصال', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8071, 'sa', 'typography', 'الطباعة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8072, 'sa', 'body_typography', 'طباعة الجسم', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8073, 'sa', 'paragraph_typography', 'طباعة الفقرة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8074, 'sa', 'heading_typography', 'عنوان الطباعة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8075, 'sa', 'menu_typography', 'طباعة القائمة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8076, 'sa', 'button_typography', 'طباعة الأزرار', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8077, 'sa', 'custom_fonts', 'خطوط عادية', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8078, 'sa', 'header', 'رأس', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8079, 'sa', 'header_option', 'خيار الرأس', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8080, 'sa', 'post_option', 'خيار النشر', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8081, 'sa', 'single_post_page', 'صفحة مشاركة واحدة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8082, 'sa', 'sidebar_options', 'خيارات الشريط الجانبي', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8083, 'sa', 'page', 'صفحة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8084, 'sa', '404_page', '404 صفحة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8085, 'sa', 'subscribe', 'يشترك', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8086, 'sa', 'social', 'اجتماعي', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8087, 'sa', 'footer', 'تذييل', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8088, 'sa', 'custom_css', 'لغة تنسيق ويب حسب الطلب', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8089, 'sa', 'google_adsense', 'جوجل ادسنس', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8090, 'sa', 'website_popup', 'نافذة منبثقة لموقع الويب', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8091, 'sa', 'gdprcookie_consent', 'اللائحة العامة لحماية البيانات (الموافقة على ملفات تعريف الارتباط)', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8092, 'sa', 'importexport', 'استيراد و تصدير', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8093, 'sa', 'reset_confirmation', 'إعادة تعيين التأكيد', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8094, 'sa', 'are_you_sure_to_want_to_reset', 'هل أنت متأكد من أنك تريد إعادة التعيين', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8095, 'sa', 'action_failed', 'العمل: فشل', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8096, 'sa', 'select_font_subsets', 'حدد مجموعات فرعية من الخطوط', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8097, 'sa', 'select_weight__style', 'حدد الوزن & amp؛ أسلوب', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8098, 'sa', 'new_slide', 'شريحة جديدة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8099, 'sa', 'iconexample_fa_fafacebook', 'أيقونة (مثال: fa fa-facebook)', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8100, 'sa', 'url', 'عنوان URL', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8101, 'sa', 'select_color', 'إختر لون', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8102, 'sa', 'social_top_text', 'النص الاجتماعي الأعلى', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8103, 'sa', 'social_bottom_text', 'النص السفلي الاجتماعي', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8104, 'sa', 'new_adsense', 'ادسنس الجديد', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8105, 'sa', 'copied', 'نسخ', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8106, 'sa', 'back_to_top_button', 'زر العودة الى اعلى', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8107, 'sa', 'switch_on_to_display_back_to_top_button', 'قم بالتبديل إلى زر العرض إلى الأعلى.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8108, 'sa', 'disable', 'إبطال', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8109, 'sa', 'enable', 'يُمكَِن', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8110, 'sa', 'custom_back_to_top_button', 'مخصص العودة إلى زر الأعلى', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8111, 'sa', 'if_you_switch_it_off_it_will_show_default_design_for_back_to_top_button', 'إذا قمت بإيقاف تشغيله، فسوف يُظهر التصميم الافتراضي لـ \"العودة إلى الأعلى\" زر.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8112, 'sa', 'custom_back_to_top_button_icon', 'مخصص العودة إلى أيقونة الزر الأعلى', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8113, 'sa', 'select_back_to_top_button_icon', 'حدد أيقونة زر العودة إلى الأعلى.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8114, 'sa', 'back_to_top_button_background_color', 'العودة إلى الأعلى لون خلفية الزر', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8115, 'sa', 'transparent', 'شفاف', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8116, 'sa', 'back_to_top_button_color', 'العودة إلى أعلى لون الزر', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8117, 'sa', 'keep_back_to_top_button_on_mobile', 'استمر في الرجوع إلى الزر العلوي على الهاتف المحمول', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8118, 'sa', 'if_you_switch_it_on_it_will_show_in_mobile_devices', 'إذا قمت بتشغيله، فسوف يظهر في الأجهزة المحمولة.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8119, 'sa', 'layout', 'تَخطِيط', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8120, 'sa', 'choose_post_layout_from_here_if_you_use_this_option_then_you_will_able_to_change_three_type_of_blog_layout__default_right_sidebar_layout_', 'اختر تخطيط المنشور من هنا. إذا استخدمت هذا الخيار، فستتمكن من تغيير ثلاثة أنواع من تخطيط المدونة (تخطيط الشريط الجانبي الأيمن الافتراضي).', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8121, 'sa', 'post_column', 'عمود المشاركة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8122, 'sa', 'select_your_post_post_column_from_here_if_you_use_this_option_then_you_will_able_to_select_three_type_of_blog_colum_layout__default_one_column_', 'حدد عمود النشر الخاص بك من هنا. إذا استخدمت هذا الخيار، فستتمكن من تحديد ثلاثة أنواع من تخطيط عمود المدونة (عمود واحد افتراضي).', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8123, 'sa', 'post_post_style', 'نمط ما بعد النشر', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8124, 'sa', 'select_post_post_style', 'حدد نمط النشر.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8125, 'sa', 'post_posts_excerpt', 'نشر مقتطفات من المشاركات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8126, 'sa', 'control_the_number_of_characters_you_want_to_show_in_the_post_page_for_each_post_if_you_use_this_option_then_you_can_able_to_control_your_post_post_characters_from_heredefault_50_character', 'التحكم في عدد الأحرف التي تريد إظهارها في صفحة المنشور لكل منشور.. إذا استخدمت هذا الخيار، فيمكنك التحكم في أحرف منشورك من هنا. (الافتراضي 50 حرفًا)', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8127, 'sa', 'post_perpage_number', 'نشر رقم لكل صفحة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8128, 'sa', 'control_the_number_posts_to_show_on_each_page__default_show_10_', 'التحكم في عدد المشاركات التي ستظهر في كل صفحة ( العرض الافتراضي 10 ).', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8129, 'sa', 'read_more_text_setting', 'اقرأ المزيد إعداد النص', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8130, 'sa', 'control_read_more_text_from_here', 'التحكم في قراءة المزيد من النص من هنا.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8131, 'sa', 'default', 'تقصير', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8132, 'sa', 'custom', 'مخصص', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8133, 'sa', 'read_more_text', 'اقرأ المزيد النص', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8134, 'sa', 'set_read_moer_text_here_if_you_use_this_option_then_you_will_able_to_set_your_won_text', 'قم بتعيين قراءة المزيد من النص هنا. إذا استخدمت هذا الخيار فستتمكن من ضبط النص الذي فازت به.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8135, 'sa', 'transalate_to_another_language', 'ترجمة إلى لغة أخرى', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8136, 'sa', 'click_here', 'انقر هنا', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8137, 'sa', 'post_pagination_settings', 'إعدادات نشر الصفحات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8138, 'sa', 'set_post_pagination_number_pagination_or_link_pagination', 'تعيين ترقيم الصفحات بعد. ترقيم الصفحات للأرقام أو ترقيم الصفحات للارتباط', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8139, 'sa', 'post_pagination_position', 'موقف ما بعد ترقيم الصفحات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8140, 'sa', 'set_post_pagination_position', 'تعيين موضع ترقيم الصفحات بعد النشر.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8141, 'sa', 'left', 'غادر', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8142, 'sa', 'center', 'مركز', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8143, 'sa', 'right', 'يمين', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8144, 'sa', 'choose_post_single_page_layout_from_here', 'اختر تخطيط صفحة واحدة للنشر من هنا.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8145, 'sa', 'switch_on_to_display_author', 'قم بالتبديل إلى عرض المؤلف.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8146, 'sa', 'date', 'تاريخ', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8147, 'sa', 'switch_on_to_display_date', 'قم بالتبديل لعرض التاريخ.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8148, 'sa', 'views_count', 'عدد المشاهدات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8149, 'sa', 'switch_on_to_display_total_views', 'قم بالتبديل لعرض إجمالي المشاهدات.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8150, 'sa', 'category', 'فئة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8151, 'sa', 'switch_on_to_display_category', 'قم بالتبديل إلى عرض الفئة.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8152, 'sa', 'switch_on_to_display_tags', 'قم بالتبديل لعرض العلامات.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8153, 'sa', 'switch_on_to_display_comments', 'قم بالتبديل لعرض التعليقات.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8154, 'sa', 'post_share_options', 'خيارات مشاركة المشاركة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8155, 'sa', 'switch_on_to_display_blog_share', 'قم بالتبديل لعرض مشاركة المدونة.', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8156, 'sa', 'biography_info', 'معلومات السيرة الذاتية', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8157, 'sa', 'control_biography_info_from_here_if_you_use_this_option_then_you_will_able_to_show_ro_hide_biography_info', 'السيطرة على معلومات السيرة الذاتية من هنا. إذا استخدمت هذا الخيار، فستتمكن من إظهار معلومات السيرة الذاتية المخفية', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8158, 'sa', 'hide', 'يخفي', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8159, 'sa', 'show', 'يعرض', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8160, 'sa', 'post_prevnext_nav', 'النشر السابق/التنقل التالي', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8161, 'sa', 'control_post_previous_post_and_next_post_navbar', 'التحكم في النشر السابق والنشر التالي Navbar', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8162, 'sa', 'related_posts', 'المنشورات ذات الصلة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8163, 'sa', 'showhide_related_posts', 'إظهار/إخفاء المشاركات ذات الصلة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8164, 'sa', 'related_post_section_title', 'عنوان قسم المشاركة ذات الصلة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8165, 'sa', 'popular_posts', 'منشورات شائعة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8166, 'sa', 'showhide_popular_post', 'إظهار/إخفاء المنشورات الشائعة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8167, 'sa', 'popular_post_section_title', 'عنوان قسم المشاركة الشعبية', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8168, 'sa', 'custom_sidebar_style', 'نمط الشريط الجانبي المخصص', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8169, 'sa', 'widgets_background_color', 'لون خلفية الحاجيات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8170, 'sa', 'widget_margin', 'هامش القطعة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8171, 'sa', 'top', 'قمة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8172, 'sa', 'bottom', 'قاع', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8173, 'sa', 'widget_padding', 'الحشو القطعة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8174, 'sa', 'widget_title_color', 'لون عنوان القطعة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8175, 'sa', 'widget_title_after_color', 'عنوان القطعة بعد اللون', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8176, 'sa', 'menu', 'قائمة طعام', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8177, 'sa', 'edit_menus', 'تحرير القوائم', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8178, 'sa', 'manage_locations', 'إدارة المواقع', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8179, 'sa', 'select_a_menu_to_edit', 'حدد قائمة لتحريرها:', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8180, 'sa', 'create_menu_', 'إنشاء القائمة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8181, 'sa', 'translate_menu_into', 'ترجمة القائمة إلى:', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8182, 'sa', 'custom_links', 'الروابط المخصصة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8183, 'sa', 'link_text', 'نص الارتباط', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8184, 'sa', 'add_to_menu', 'أضف إلى القائمة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8185, 'sa', 'most_recent', 'الأحدث', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8186, 'sa', 'view_all', 'عرض الكل', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8187, 'sa', 'search', 'يبحث', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8188, 'sa', 'select_all', 'اختر الكل', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8189, 'sa', 'select_all_', 'اختر الكل', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8190, 'sa', 'posts', 'دعامات', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8191, 'sa', 'menu_name', 'اسم القائمة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8192, 'sa', 'give_your_menu_a_name_then_click_save_menu', 'قم بتسمية القائمة الخاصة بك، ثم انقر فوق \"حفظ القائمة\".', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8193, 'sa', 'menu_settings', 'إعدادات القائمة', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8194, 'sa', 'display_locations', 'مواقع العرض', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8195, 'sa', 'currently_set_to__', 'تم ضبطه حاليًا على:', '2023-12-28 11:00:34', '2023-12-28 11:00:34'),
(8196, 'sa', 'save_menu', 'حفظ القائمة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8197, 'sa', 'drag_the_items_into_the_order_you_prefer_click_the_arrow_on_the_right_of_the_item_to_reveal_additional_configuration_options', 'اسحب العناصر إلى الترتيب الذي تفضله. انقر فوق السهم الموجود على يمين العنصر للكشف عن خيارات التكوين الإضافية.', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8198, 'sa', 'delete_menu', 'حذف القائمة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8199, 'sa', 'update_menu', 'تحديث القائمة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8200, 'sa', 'your_theme_supports', 'يدعم الموضوع الخاص بك', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8201, 'sa', 'menus_select_which_menu_appears_in_each_location', 'القوائم. حدد القائمة التي تظهر في كل موقع.', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8202, 'sa', 'theme_location', 'موقع الموضوع', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8203, 'sa', 'assigned_menu', 'القائمة المخصصة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8204, 'sa', '_edit', 'يحرر', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8205, 'sa', 'use_new_menu', 'استخدم القائمة الجديدة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8206, 'sa', 'menu_list_updated_successfully', 'تم تحديث قائمة القائمة بنجاح', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8207, 'sa', 'cache_clear_successfully', 'تم مسح ذاكرة التخزين المؤقت بنجاح', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8208, 'sa', 'enable_website_popup', 'تمكين النافذة المنبثقة لموقع الويب', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8209, 'sa', 'popup_content', 'المحتوى المنبثق', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8210, 'sa', 'show_subscriber_form', 'إظهار نموذج المشترك؟', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8211, 'sa', 'theme_option_saved', 'تم حفظ خيار الموضوع', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8212, 'sa', 'a_new_comment_added', 'تمت إضافة تعليق جديد.', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8213, 'sa', 'your_comment_added', 'تمت إضافة تعليقك', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8214, 'sa', 'delete_permanently', 'الحذف بشكل نهائي', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8215, 'sa', 'file_name', 'اسم الملف:', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8216, 'sa', 'file_url', 'عنوان URL للملف:', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8217, 'sa', 'file_type', 'نوع الملف:', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8218, 'sa', 'file_size', 'حجم الملف:', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8219, 'sa', 'uploaded_by', 'تم الرفع بواسطة:', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8220, 'sa', 'created_at', 'أنشئت في:', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8221, 'sa', 'updated_at', 'تم التحديث في:', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8222, 'sa', 'download', 'تحميل', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8223, 'sa', 'copy_url_to_clipboard', 'انسخ عنوان URL إلى الحافظة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8224, 'sa', 'add_post', 'أضف منشورا', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8225, 'sa', 'all', 'الجميع', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8226, 'sa', 'mine', 'مِلكِي', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8227, 'sa', 'showing', 'عرض', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8228, 'sa', 'items_of', 'عناصر من', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8229, 'sa', 'bulk_action', 'العمل بالجملة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8230, 'sa', 'delete_selection', 'حذف التحديد', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8231, 'sa', 'apply', 'يتقدم', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8232, 'sa', 'no_action_selected', 'لم يتم تحديد أي إجراء', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8233, 'sa', 'no_item_selected', 'لم يتم تحديد أي عنصر', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8234, 'sa', 'ai_assistent', 'مساعدة الذكاء الاصطناعي', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8235, 'sa', 'language', 'لغة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8236, 'sa', 'select_language', 'اختار اللغة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8237, 'sa', 'arabic', 'عربي', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8238, 'sa', 'bulgarian', 'البلغارية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8239, 'sa', 'chinese_simplified', 'الصينية المبسطة)', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8240, 'sa', 'chinese_traditional', 'تقاليد صينية)', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8241, 'sa', 'croatian', 'الكرواتية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8242, 'sa', 'czech', 'التشيكية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8243, 'sa', 'danish', 'دانماركي', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8244, 'sa', 'dutch', 'هولندي', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8245, 'sa', 'english', 'إنجليزي', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8246, 'sa', 'estonian', 'الإستونية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8247, 'sa', 'finnish', 'الفنلندية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8248, 'sa', 'french', 'فرنسي', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8249, 'sa', 'german', 'ألمانية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8250, 'sa', 'greek', 'اليونانية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8251, 'sa', 'hebrew', 'اللغة العبرية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8252, 'sa', 'hindi', 'لا', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8253, 'sa', 'hungarian', 'المجرية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8254, 'sa', 'icelandic', 'الأيسلندية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8255, 'sa', 'indonesian', 'الاندونيسية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8256, 'sa', 'italian', 'ايطالي', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8257, 'sa', 'japanese', 'اليابانية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8258, 'sa', 'korean', 'الكورية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8259, 'sa', 'lithuanian', 'الليتوانية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8260, 'sa', 'malay', 'لغة الملايو', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8261, 'sa', 'norwegian', 'النرويجية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8262, 'sa', 'polish', 'تلميع', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8263, 'sa', 'portuguese', 'البرتغالية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8264, 'sa', 'romanian', 'روماني', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8265, 'sa', 'russian', 'الروسية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8266, 'sa', 'slovenian', 'السلوفينية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8267, 'sa', 'spanish', 'الأسبانية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8268, 'sa', 'swahili', 'السواحلية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8269, 'sa', 'swedish', 'السويدية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8270, 'sa', 'thai', 'التايلاندية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8271, 'sa', 'turkish', 'اللغة التركية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8272, 'sa', 'ukrainian', 'الأوكرانية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8273, 'sa', 'vietnamese', 'الفيتنامية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8274, 'sa', 'what_is_the_primary_focus_of_your_blog', 'ما هو التركيز الأساسي لمدونتك', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8275, 'sa', 'primary_focus', 'التركيز الأساسي', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8276, 'sa', 'priority_keywords', 'الكلمات الرئيسية ذات الأولوية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8277, 'sa', 'give_priority_kewords_seperated_by_comma_', 'إعطاء الأولوية للكلمات الرئيسية مفصولة بفاصلة (،)', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8278, 'sa', 'level_of_creativity', 'مستوى الإبداع', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8279, 'sa', 'extra_ordinary', 'نادِر', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8280, 'sa', 'ordinary', 'عادي', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8281, 'sa', 'minimal', 'الحد الأدنى', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8282, 'sa', 'editorial_tone', 'لهجة التحرير', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8283, 'sa', 'formal', 'رَسمِيّ', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8284, 'sa', 'casual', 'غير رسمي', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8285, 'sa', 'humorous', 'روح الدعابة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8286, 'sa', 'authoritative', 'موثوق', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8287, 'sa', 'persuasive', 'مقنع', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8288, 'sa', 'empathetic', 'متعاطف', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8289, 'sa', 'inspirational', 'ملهم', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8290, 'sa', 'educational', 'التعليمية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8291, 'sa', 'witty', 'بارع', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8292, 'sa', 'intimate', 'حَمِيم', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8293, 'sa', 'choose_what_you_want_to_generate', 'اختر ما تريد توليده', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8294, 'sa', 'post_title', 'عنوان المشاركة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8295, 'sa', 'post_short_description', 'نشر وصف قصير', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8296, 'sa', 'post_content', 'آخر المحتوى', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8297, 'sa', 'title_length', 'طول العنوان', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8298, 'sa', 'short_details_length', 'تفاصيل قصيرة الطول', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8299, 'sa', 'content_length', 'طول المحتوى', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8300, 'sa', 'generate', 'يولد', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8301, 'sa', 'permalink', 'الرابط الثابت', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8302, 'sa', 'type_here', 'أكتب هنا', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8303, 'sa', 'short_description', 'وصف قصير', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8304, 'sa', 'content', 'محتوى', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8305, 'sa', 'seo_meta_tags', 'العلامات التعريفية لسيو', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8306, 'sa', 'meta_title', 'عنوان الفوقية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8307, 'sa', 'meta_description', 'ميتا الوصف', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8308, 'sa', 'meta_image', 'صورة ميتا', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8309, 'sa', 'choose_file', 'اختر ملف', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8310, 'sa', 'publish', 'ينشر', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8311, 'sa', 'draft', 'مسودة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8312, 'sa', 'visibility', 'الرؤية', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8313, 'sa', 'public', 'عام', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8314, 'sa', 'stick_this_post_to_the_front_of_post_list_page', 'الصق هذا المنشور في مقدمة صفحة قائمة المنشورات', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8315, 'sa', 'password_protected', 'محمية بكلمة مرور', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8316, 'sa', 'if_password_field_is_remain_empty_then_visibility_will_be_saved_as_public', 'إذا ظل حقل كلمة المرور فارغًا، فسيتم حفظ إمكانية الرؤية كعامة.', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8317, 'sa', 'private', 'خاص', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8318, 'sa', 'formate', 'التنسيقات', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8319, 'sa', 'standard', 'معيار', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8320, 'sa', 'video', 'فيديو', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8321, 'sa', 'audio', 'صوتي', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8322, 'sa', 'gallery', 'صالة عرض', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8323, 'sa', 'post_image', 'مشاركة الصورة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8324, 'sa', 'preferred_size_for_thumnail_image_is_1110__578_px', 'الحجم المفضل للصورة المصغرة هو 1110 × 578 بكسل', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8325, 'sa', 'preferred_size_for_gallery_images_is_1110__578_px', 'الحجم المفضل لصور المعرض هو 1110 × 578 بكسل', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8326, 'sa', 'choose_files', 'اختر الملفات', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8327, 'sa', 'featured_status', 'الحالة المميزة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8328, 'sa', 'breaking_news', 'أخبار عاجلة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8329, 'sa', 'no_option_selected', 'لم يتم تحديد أي خيار', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8330, 'sa', 'new_tag', 'علامة جديدة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8331, 'sa', 'only_active_categories', 'الفئات النشطة فقط', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8332, 'sa', 'add', 'يضيف', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8333, 'sa', 'select_a_category', 'اختر تصنيف', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8334, 'sa', 'add_new_tag', 'إضافة علامة جديدة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8335, 'sa', 'new_category', 'فئة جديدة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8336, 'sa', 'select_parent', 'حدد الوالدين', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8337, 'sa', 'select_a_parent_category', 'حدد فئة الوالدين', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8338, 'sa', 'add_new_category', 'إضافة فئة جديدة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8339, 'sa', 'post_category', 'فئة المشاركة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8340, 'sa', 'post_categories', 'فئات المشاركة', '2023-12-28 11:01:46', '2023-12-28 11:01:46'),
(8341, 'sa', 'add_post_category', 'إضافة فئة المشاركة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8342, 'sa', 'parent', 'الأبوين', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8343, 'sa', 'tag', 'بطاقة شعار', '2023-12-28 11:01:47', '2023-12-28 11:01:47');
INSERT INTO `tl_translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(8344, 'sa', 'add_tag', 'إضافة علامة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8345, 'sa', 'post_comment', 'أضف تعليقا', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8346, 'sa', 'approve', 'يعتمد', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8347, 'sa', 'spam', 'رسائل إلكترونية مزعجة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8348, 'sa', 'trash', 'نفاية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8349, 'sa', 'in_response_to', 'للإستجابة ل', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8350, 'sa', 'unapprove', 'عدم الموافقة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8351, 'sa', 'reply', 'رد', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8352, 'sa', 'view_blog', 'عرض المدونة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8353, 'sa', 'in_reply_to', 'ردا على', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8354, 'sa', 'comment_delete_confirmation', 'تأكيد حذف التعليق', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8355, 'sa', 'are_you_sure_you_want_to_permanently_delete_this_comment', 'هل أنت متأكد أنك تريد حذف هذا التعليق نهائيًا', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8356, 'sa', 'bulk_action_confirmation', 'تأكيد الإجراء المجمع', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8357, 'sa', 'are_you_sure_you_want_to_take_this_action', 'هل أنت متأكد أنك تريد اتخاذ هذا الإجراء', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8358, 'sa', 'comment_reply', 'الرد على التعليق', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8359, 'sa', 'move_to_trash', 'ارسال الى سلة المحذوفات', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8360, 'sa', 'mark_as_spam', 'علامة كدعاية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8361, 'sa', 'not_spam', 'ليس بريدا موذيا', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8362, 'sa', 'delete_permanetly', 'حذف نهائيا', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8363, 'sa', 'restore', 'يعيد', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8364, 'sa', 'delete_all', 'حذف الكل', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8365, 'sa', 'share_options', 'مشاركة الخيارات', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8366, 'sa', 'comment_setting', 'إعداد التعليق', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8367, 'sa', 'default_post_settings', 'إعدادات النشر الافتراضية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8368, 'sa', 'allow_people_to_submit_comments_on_new_posts', 'السماح للأشخاص بتقديم تعليقات على المشاركات الجديدة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8369, 'sa', 'other_comment_settings', 'إعدادات التعليق الأخرى', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8370, 'sa', 'comment_author_must_fill_out_name_and_email', 'يجب على مؤلف التعليق ملء الاسم والبريد الإلكتروني', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8371, 'sa', 'users_must_be_registered_and_logged_in_to_comment', 'المستخدمون يجب ان يسجلوا دخولهم للتعليق', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8372, 'sa', 'automatically_close_comments_on_blogs_older_than', 'إغلاق التعليقات تلقائيًا على المدونات الأقدم من', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8373, 'sa', 'days', 'أيام', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8374, 'sa', 'enable_threaded_nested_comments', 'تمكين التعليقات المترابطة (المتداخلة).', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8375, 'sa', 'levels_deep', 'مستويات عميقة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8376, 'sa', 'break_comments_into_pages_with', 'قسم التعليقات إلى صفحات باستخدام', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8377, 'sa', 'top_level_comments_per_page_and', 'تعليقات المستوى الأعلى لكل صفحة و', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8378, 'sa', 'comments_should_be_displayed_with_the', 'يجب أن يتم عرض التعليقات مع', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8379, 'sa', 'older', 'اكبر سنا', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8380, 'sa', 'newer', 'أحدث', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8381, 'sa', 'comments_at_the_top_of_each_page', 'التعليقات في أعلى كل صفحة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8382, 'sa', 'email_me_whenever', 'أرسل لي بريدا إلكترونيا في أي وقت', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8383, 'sa', 'anyone_posts_a_comment', 'أي شخص ينشر تعليقا', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8384, 'sa', 'a_comment_is_held_for_moderation', 'التعليق معلق للإعتدال', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8385, 'sa', 'before_a_comment_appears', 'قبل ظهور التعليق', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8386, 'sa', 'comment_must_be_manually_approved', 'يجب الموافقة على التعليق يدويا', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8387, 'sa', 'comment_author_must_have_a_previously_approved_comment', 'يجب أن يكون لدى كاتب التعليق تعليق تمت الموافقة عليه مسبقًا', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8388, 'sa', 'comment_moderation', 'تعليق الاعتدال', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8389, 'sa', 'hold_a_comment_in_the_queue_if_it_contains', 'احتفظ بالتعليق في قائمة الانتظار إذا كان يحتوي على', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8390, 'sa', 'or_more_links_a_common_characteristic_of_comment_spam_is_a_large_number_of_hyperlinks', 'أو المزيد من الروابط (من السمات الشائعة للتعليقات غير المرغوب فيها وجود عدد كبير من الارتباطات التشعبية.)', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8391, 'sa', 'when_a_comment_contains_any_of_these_words_in_its_content_author_name_url_email_ip_address_or_browsers_user_agent_string_it_will_be_held_in_the_', 'عندما يحتوي التعليق على أي من هذه الكلمات في محتواه أو اسم المؤلف أو عنوان URL أو البريد الإلكتروني أو عنوان IP أو سلسلة وكيل مستخدم المتصفح، فسيتم الاحتفاظ به في', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8392, 'sa', 'pending_queue', 'قائمة الانتظار المعلقة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8393, 'sa', 'one_word_or_ip_address_per_line_it_will_match_inside_words_so_press_will_match_wordpress', 'كلمة واحدة أو عنوان IP في كل سطر. سوف يتطابق مع الكلمات الداخلية، لذا فإن كلمة \"صحافة\" سوف تتطابق مع كلمة \"WordPress\".', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8394, 'sa', 'disallowed_comment_keys', 'مفاتيح التعليق غير المسموح بها', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8395, 'sa', 'when_a_comment_contains_any_of_these_words_in_its_content_author_name_url_email_ip_address_or_browsers_user_agent_string_it_will_be_put_in_the_trash_one_word_or_ip_address_per_line_it_will_match_inside_words_so_press_will_match_wordpress', 'عندما يحتوي التعليق على أي من هذه الكلمات في محتواه أو اسم المؤلف أو عنوان URL أو البريد الإلكتروني أو عنوان IP أو سلسلة وكيل مستخدم المتصفح، فسيتم وضعه في سلة المهملات. كلمة واحدة أو عنوان IP في كل سطر. سوف يتطابق مع الكلمات الداخلية، لذا فإن كلمة \"صحافة\" سوف تتطابق مع كلمة \"WordPress\".', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8396, 'sa', 'avatars', 'الآلهة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8397, 'sa', 'an_avatar_is_an_image_that_can_be_associated_with_a_user_across_multiple_websites_in_this_area_you_can_choose_to_display_avatars_of_users_who_interact_with_the_site', 'الصورة الرمزية هي صورة يمكن ربطها بمستخدم عبر مواقع ويب متعددة. في هذه المنطقة، يمكنك اختيار عرض الصور الرمزية للمستخدمين الذين يتفاعلون مع الموقع.', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8398, 'sa', 'avatar_display', 'عرض الصورة الرمزية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8399, 'sa', 'show_avatars', 'إظهار الصور الرمزية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8400, 'sa', 'default_avatar', 'الصورة الرمزية الافتراضية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8401, 'sa', 'for_users_without_a_custom_avatar_of_their_own_you_can_either_display_a_generic_logo_or_a_generated_one_based_on_their_email_address', 'بالنسبة للمستخدمين الذين ليس لديهم صورة رمزية مخصصة خاصة بهم، يمكنك إما عرض شعار عام أو شعار تم إنشاؤه بناءً على عنوان بريدهم الإلكتروني.', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8402, 'sa', 'mystery_person', 'الشخص الغامض', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8403, 'sa', 'blank', 'فارغ', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8404, 'sa', 'gravatar_logo', 'شعار غرافاتار', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8405, 'sa', 'identicon_generated', 'رمز التعريف (تم إنشاؤه)', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8406, 'sa', 'wavatar_generated', 'وافاتار (تم إنشاؤه)', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8407, 'sa', 'monsterid_generated', 'MonsterID (تم إنشاؤه)', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8408, 'sa', 'retro_generated', 'ريترو (تم إنشاؤه)', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8409, 'sa', 'add_page', 'إضافة صفحة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8410, 'sa', 'homepage', 'الصفحة الرئيسية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8411, 'sa', 'builder', 'منشئ', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8412, 'sa', 'current_homepage', 'الصفحة الرئيسية الحالية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8413, 'sa', 'make_homepage', 'جعل الصفحة الرئيسية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8414, 'sa', 'demo_pluin', 'التجريبي بلوين', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8415, 'sa', 'theme_creating_guide', 'دليل إنشاء الموضوع', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8416, 'sa', 'install_theme', 'تثبيت موضوع', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8417, 'sa', 'by', 'بواسطة:', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8418, 'sa', 'version', 'إصدار:', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8419, 'sa', 'activated', 'مفعل', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8420, 'sa', 'activate_confirmation', 'تفعيل التأكيد', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8421, 'sa', 'are_you_sure_to_active_this_theme', 'هل أنت متأكد من تفعيل هذا الموضوع', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8422, 'sa', 'activate', 'تفعيل', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8423, 'sa', 'are_you_sure_to_delete_this_theme', 'هل أنت متأكد من حذف هذا الموضوع', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8424, 'sa', 'active_confirmation', 'التأكيد النشط', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8425, 'sa', 'purchase_key', 'مفتاح الشراء', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8426, 'sa', 'give_purchase_key_to_activate_this_theme', 'أعط مفتاح الشراء لتنشيط هذا الموضوع', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8427, 'sa', 'manage_widgets', 'إدارة الحاجيات', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8428, 'sa', 'available_widgets', 'الحاجيات المتاحة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8429, 'sa', 'add_widget', 'إضافة القطعة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8430, 'sa', 'adding_widget_to_sidebar_failed', 'فشلت إضافة القطعة إلى الشريط الجانبي', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8431, 'sa', 'sidebar_widget_opening_failed', 'فشل فتح عنصر واجهة المستخدم للشريط الجانبي', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8432, 'sa', 'widget_added_to_sidebar_failed', 'فشلت إضافة القطعة إلى الشريط الجانبي', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8433, 'sa', 'widget_form_submit_failed_failed', 'فشل إرسال نموذج القطعة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8434, 'sa', 'generate_site_map', 'إنشاء خريطة الموقع', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8435, 'sa', 'sitemap_generating_request_failed', 'فشل إنشاء طلب خريطة الموقع', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8436, 'sa', 'please_check_your_email_to_confirm_your_subscription', 'يرجى التحقق من بريدك الالكتروني لتأكيد اشتراكك', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8437, 'sa', 'please_enter_a_valid_email', 'يرجى إدخال البريد الإلكتروني الصحيح', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8438, 'sa', 'mailchimp_api_key', 'مفتاح واجهة برمجة تطبيقات Mailchimp', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8439, 'sa', 'set_mailchimp_api_key', 'قم بتعيين مفتاح واجهة برمجة تطبيقات mailchimp', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8440, 'sa', 'mailchimp_list_id', 'معرف قائمة Mailchimp', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8441, 'sa', 'set_mailchimp_list_id', 'تعيين معرف قائمة mailchimp', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8442, 'sa', 'custom_sidebar_subscribe_style', 'نمط الاشتراك في الشريط الجانبي المخصص', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8443, 'sa', 'set_custom_footer_subscribe_style', 'قم بتعيين نمط الاشتراك المخصص للتذييل', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8444, 'sa', 'newsletter_background_image', 'صورة خلفية النشرة الإخبارية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8445, 'sa', 'newsletter_title_color', 'لون عنوان النشرة الإخبارية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8446, 'sa', 'newsletter_subtitle_color', 'لون العنوان الفرعي للنشرة الإخبارية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8447, 'sa', 'newsletter_button_text_color', 'لون نص زر النشرة الإخبارية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8448, 'sa', 'edit_post', 'تعديل المنشور', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8449, 'sa', 'what_is_the_primary_focus_of_your_post', 'ما هو التركيز الأساسي لمشاركتك', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8450, 'sa', 'add_new', 'اضف جديد', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8451, 'sa', 'stick_this_post_to_the_front_of_blog_list_page', 'الصق هذا المنشور في مقدمة صفحة قائمة المدونات', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8452, 'sa', 'please_insert_post_name', 'الرجاء إدخال اسم المشاركة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8453, 'sa', 'this_name_is_already_available_please_insert_another', 'هذا الاسم متاح بالفعل، يرجى إدخال اسم آخر', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8454, 'sa', 'please_write_the_post_name_under_225_words', 'يرجى كتابة اسم المشاركة تحت 225 كلمة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8455, 'sa', 'this_permalink_is_already_available_please_insert_another', 'هذا الرابط الثابت متوفر بالفعل، يرجى إدخال رابط آخر', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8456, 'sa', 'something_went_wrong_please_select_category_again', 'حدث خطأ ما، يرجى تحديد الفئة مرة أخرى', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8457, 'sa', 'please_insert_a_valid_image', 'الرجاء إدخال صورة صالحة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8458, 'sa', 'please_write_some_content', 'يرجى كتابة بعض المحتوى', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8459, 'sa', 'please_select_a_valid_image', 'الرجاء تحديد صورة صالحة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8460, 'sa', 'something_went_wrong_please_select_visibility_again', 'حدث خطأ ما، يرجى تحديد مستوى الرؤية مرة أخرى', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8461, 'sa', 'post_updated_successfully', 'تم تحديث المشاركة بنجاح', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8462, 'sa', 'category_cannot_be_deleted_there_are_posts_available', 'لا يمكن حذف الفئة! هناك مشاركات متاحة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8463, 'sa', 'ecommercecategory_cannot_be_deleted_there_are_posts_available', 'لا يمكن حذف فئة التجارة الإلكترونية! هناك مشاركات متاحة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8464, 'sa', 'media_file_uploaded_successful', 'تم تحميل ملف الوسائط بنجاح', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8465, 'sa', 'this_category_name_or_slug_is_already_available_please_insert_another', 'اسم الفئة أو سبيكة الاتصال هذه متاحة بالفعل، يرجى إدخال اسم آخر', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8466, 'sa', 'this_tag_name_or_slug_is_already_available_please_insert_another', 'اسم العلامة أو Slug هذا متاح بالفعل، يرجى إدخال اسم آخر', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8467, 'sa', 'a_parent_category_cannot_be_deletedfirst_delete_the_child_category', 'لا يمكن حذف الفئة الأصلية. قم أولاً بحذف الفئة الفرعية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8468, 'sa', 'edit_post_category', 'تحرير فئة المشاركة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8469, 'sa', 'please_insert_a_name', 'الرجاء إدخال اسم', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8470, 'sa', 'please_write_the_category_name_under_225_words', 'يرجى كتابة اسم الفئة تحت 225 كلمة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8471, 'sa', 'post_category_update_failed', 'فشل تحديث فئة المشاركة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8472, 'sa', 'post_category_updated_successfully', 'تم تحديث فئة المشاركة بنجاح', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8473, 'sa', 'post_category_deleted_successfully', 'تم حذف فئة المشاركة بنجاح', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8474, 'sa', 'post_category_deleting_failed', 'فشل حذف فئة المشاركة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8475, 'sa', 'tag_bulk_deleted_successfully', 'تم حذف العلامة المجمعة بنجاح', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8476, 'sa', 'new_blog_saved', 'تم حفظ المدونة الجديدة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8477, 'sa', 'media_file_deleted_successfully', 'تم حذف ملف الوسائط بنجاح', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8478, 'sa', 'post_featured_status_changed_successfully', 'تم تغيير حالة المشاركة المميزة بنجاح', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8479, 'sa', 'background', 'خلفية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8480, 'sa', 'advanced', 'متقدم', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8481, 'sa', 'widget_title', 'عنوان الأداة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8482, 'sa', 'post_type', 'نوع آخر', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8483, 'sa', 'recent_post', 'المنشور الاخير', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8484, 'sa', 'featured_post', 'مشاركة مميزة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8485, 'sa', 'most_commented_post', 'المشاركة الأكثر تعليقا', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8486, 'sa', 'popular_post', 'منشور مشهور', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8487, 'sa', 'category_wise', 'الفئة الحكيمة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8488, 'sa', 'select_category', 'اختر الفئة', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8489, 'sa', 'post_advance_style', 'أسلوب النشر المسبق', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8490, 'sa', 'background_color', 'لون الخلفية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8491, 'sa', 'background_image', 'الصورة الخلفية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8492, 'sa', 'background_size', 'حجم الخلفية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8493, 'sa', 'background_position', 'موقف الخلفية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8494, 'sa', 'background_repeat', 'تكرار الخلفية', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8495, 'sa', 'desktop', 'سطح المكتب', '2023-12-28 11:01:47', '2023-12-28 11:01:47'),
(8496, 'sa', 'tab', 'فاتورة غير مدفوعة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8497, 'sa', 'mobile', 'متحرك', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8498, 'sa', 'padding', 'حشوة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8499, 'sa', 'margin', 'هامِش', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8500, 'sa', 'widget_properties_updated_successfully', 'تم تحديث خصائص القطعة بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8501, 'sa', 'section_width', 'عرض القسم', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8502, 'sa', 'container', 'حاوية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8503, 'sa', 'container_fluid', 'سائل الحاوية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8504, 'sa', 'vertical_alignment', 'انحياز عمودي', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8505, 'sa', 'featured_title', 'عنوان مميز', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8506, 'sa', 'most_popular_title', 'العنوان الأكثر شعبية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8507, 'sa', 'most_viewed_title', 'العنوان الأكثر مشاهدة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8508, 'sa', 'recent_title', 'العنوان الأخير', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8509, 'sa', 'most_commented_title', 'العنوان الأكثر تعليقا', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8510, 'sa', 'section_properties_updated_successfully', 'تم تحديث خصائص القسم بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8511, 'sa', 'post_style', 'نمط المشاركة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8512, 'sa', 'post_count', 'عدد المشاركات', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8513, 'sa', 'playlist_title', 'عنوان قائمة التشغيل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8514, 'sa', 'menu_deleted_successfully', 'تم حذف القائمة بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8515, 'sa', 'pages_bulk_delete_successful', 'تم حذف الصفحات المجمعة بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8516, 'sa', 'page_deleted_successfully', 'تم حذف الصفحة بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8517, 'sa', 'page_deleting_failed', 'فشل حذف الصفحة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8518, 'sa', 'page_title', 'عنوان الصفحة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8519, 'sa', 'add_title', 'أضف عنوانا', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8520, 'sa', 'make_with_builder', 'اصنع مع منشئ', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8521, 'sa', 'page_attributes', 'سمات الصفحة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8522, 'sa', 'parents', 'آباء', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8523, 'sa', 'select_a_parent_page', 'حدد الصفحة الأم', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8524, 'sa', 'featured_image', 'صورة مميزة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8525, 'sa', 'please_insert_page_title', 'الرجاء إدراج عنوان الصفحة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8526, 'sa', 'this_title_is_already_available_please_insert_another', 'هذا العنوان متاح بالفعل، يرجى إدخال عنوان آخر', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8527, 'sa', 'please_write_the_page_title_under_225_words', 'يرجى كتابة عنوان الصفحة تحت 225 كلمة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8528, 'sa', 'something_went_wrong_please_select_parent_again', 'حدث خطأ ما، يرجى تحديد أحد الوالدين مرة أخرى', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8529, 'sa', 'new_page_saved', 'تم حفظ الصفحة الجديدة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8530, 'sa', 'edit_page', 'تعديل الصفحة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8531, 'sa', 'page_updated_successfully', 'تم تحديث الصفحة بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8532, 'sa', 'select_menu_group', 'حدد مجموعة القائمة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8533, 'sa', 'done', 'منتهي', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8534, 'sa', 'widget_form_saved', 'تم حفظ نموذج القطعة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8535, 'sa', 'please_check_for_missing_field_or_invalid_data_and_try_again', 'يرجى التحقق من وجود حقل مفقود أو بيانات غير صالحة والمحاولة مرة أخرى.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8536, 'sa', 'select_vote', 'حدد التصويت', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8537, 'sa', 'widget_removed_from_sidebar', 'تمت إزالة القطعة من الشريط الجانبي', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8538, 'sa', 'select_adsence', 'حدد ادسنس', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8539, 'sa', 'if_you_select_adsense_it_will_be_overwrite_image_and_url_fields', 'إذا حددت AdSense، فسيتم استبدال حقول الصور وعنوان URL.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8540, 'sa', 'newsletter_title', 'عنوان النشرة الإخبارية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8541, 'sa', 'newsletter_subtitle', 'النشرة الإخبارية العنوان الفرعي', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8542, 'sa', 'email_placeholder', 'العنصر النائب للبريد الإلكتروني', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8543, 'sa', 'button_text', 'زر كتابة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8544, 'sa', 'number_of_comments', 'عدد التعليقات', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8545, 'sa', 'number_of_posts', 'عدد المنشورات', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8546, 'sa', 'recent_tab_popular_tab_and_most_comment_tab', 'علامة التبويب الأخيرة وعلامة التبويب الشائعة وعلامة التبويب الأكثر تعليقًا', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8547, 'sa', 'select_a_user_for_authur_widget', 'حدد مستخدمًا لأداة Authur', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8548, 'sa', 'author_designation', 'تسمية المؤلف', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8549, 'sa', 'author_image', 'صورة المؤلف', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8550, 'sa', 'header_variations', 'اختلافات الرأس', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8551, 'sa', 'choose_header_variation_from_here', 'اختر اختلاف الرأس من هنا.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8552, 'sa', 'header_top', 'رأس أعلى', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8553, 'sa', 'header_top_text_color', 'لون النص العلوي للرأس', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8554, 'sa', 'header_top_background_color', 'رأس أعلى لون الخلفية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8555, 'sa', 'header_main_menu_text_color', 'لون نص القائمة الرئيسية للرأس', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8556, 'sa', 'header_main_menu_hover_color', 'رأس القائمة الرئيسية تحوم اللون', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8557, 'sa', 'header_middle_background_color', 'لون الخلفية الوسطى للرأس', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8558, 'sa', 'header_bottom_background_color', 'رأس أسفل لون الخلفية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8559, 'sa', 'header_bottom_social_option', 'رأس أسفل الخيار الاجتماعي', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8560, 'sa', 'switch_header_bottom_social_option', 'تبديل الخيار الاجتماعي السفلي للرأس.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8561, 'sa', 'header_bottom_social_icon_color', 'لون الرمز الاجتماعي السفلي للرأس', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8562, 'sa', 'header_bottom_social_background_color', 'لون الخلفية الاجتماعية للرأس السفلي', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8563, 'sa', 'header_bottom_social_icon_hover_color', 'لون رأس الصفحة السفلية للرمز الاجتماعي', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8564, 'sa', 'header_bottom_social_background_hover_color', 'لون الخلفية الاجتماعية للرأس السفلي', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8565, 'sa', 'breaking_news_option', 'خيار الأخبار العاجلة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8566, 'sa', 'breaking_news_variations', 'الأخبار العاجلة الاختلافات', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8567, 'sa', 'choose_breaking_news_variation_from_here', 'اختر صيغة الأخبار العاجلة من هنا.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8568, 'sa', 'breaking_news_position', 'موقف الأخبار العاجلة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8569, 'sa', 'choose_breaking_news_position', 'اختر موضع الأخبار العاجلة.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8570, 'sa', 'breaking_news_text', 'نص الأخبار العاجلة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8571, 'sa', 'breaking_news_variation_1_background_color', 'الأخبار العاجلة الاختلاف 1 لون الخلفية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8572, 'sa', 'ads', 'إعلانات', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8573, 'sa', 'set_ads_image', 'تعيين صورة الإعلانات.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8574, 'sa', 'header_main_background_color', 'لون الخلفية الرئيسية للرأس', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8575, 'sa', 'header_middle_social_option', 'رأس الخيار الاجتماعي الأوسط', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8576, 'sa', 'switch_header_middle_social_option', 'تبديل الخيار الاجتماعي الأوسط للرأس.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8577, 'sa', 'header_middle_social_icon_color', 'لون الرمز الاجتماعي الأوسط للرأس', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8578, 'sa', 'header_middle_social_background_color', 'لون الخلفية الاجتماعية الوسطى للرأس', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8579, 'sa', 'header_middle_social_icon_hover_color', 'لون رأس الرمز الاجتماعي الأوسط', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8580, 'sa', 'header_middle_social_background_hover_color', 'لون الخلفية الاجتماعية الوسطى للرأس', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8581, 'sa', 'header_bottom_menu_text_color', 'لون نص القائمة السفلية للرأس', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8582, 'sa', 'header_bottom_menu_hover_color', 'رأس القائمة السفلية تحوم اللون', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8583, 'sa', 'widget_position_updated_successfully', 'تم تحديث موضع القطعة بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8584, 'sa', 'widget_order_updated_successfully', 'تم تحديث ترتيب القطعة بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8585, 'sa', 'new_section_created_successfully', 'تم إنشاء قسم جديد بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8586, 'sa', 'section_sorted_successfully', 'تم فرز القسم بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8587, 'sa', 'section_removed_successfully', 'تمت إزالة القسم بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8588, 'sa', 'link', 'وصلة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8589, 'sa', 'ads_url', 'عنوان URL للإعلانات', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8590, 'sa', 'open_in_new_window', 'افتح في نافذة جديدة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8591, 'sa', 'widget_removed_successfully', 'تمت إزالة القطعة بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8592, 'sa', 'widget_added_successfully', 'تمت إضافة القطعة بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8593, 'sa', 'newsletter_short_desc', 'النشرة الإخبارية وصف قصير', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8594, 'sa', 'name_placeholder', 'اسم العنصر النائب', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8595, 'sa', 'subject_placeholder', 'العنصر النائب للموضوع', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8596, 'sa', 'message_placeholder', 'العنصر النائب للرسالة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8597, 'sa', 'button_placeholder', 'العنصر النائب للزر', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8598, 'sa', 'submit_button_alignment', 'إرسال محاذاة الزر', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8599, 'sa', 'search_placeholder', 'البحث في العنصر النائب', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8600, 'sa', 'voting', 'التصويت', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8601, 'sa', 'votes', 'الأصوات', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8602, 'sa', 'add_vote', 'أضف التصويت', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8603, 'sa', 'vote_deleted_successfully', 'تم حذف التصويت بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8604, 'sa', 'edit_vote', 'تحرير التصويت', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8605, 'sa', 'vote_end', 'نهاية التصويت', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8606, 'sa', 'voting_featured_image', 'صورة التصويت المميزة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8607, 'sa', 'options', 'خيارات', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8608, 'sa', 'option', 'خيار', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8609, 'sa', 'title_field_is_required', 'حقل العنوان مطلوب', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8610, 'sa', 'date_field_is_required', 'حقل التاريخ مطلوب', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8611, 'sa', 'option_field_is_required', 'حقل الخيار مطلوب', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8612, 'sa', 'vote_update_successfully', 'تم تحديث التصويت بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8613, 'sa', 'theme_primary_color', 'اللون الأساسي للموضوع', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8614, 'sa', 'set_theme_primary_color', 'تعيين اللون الأساسي للموضوع', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8615, 'sa', 'no_section_found', 'لم يتم العثور على أي قسم', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8616, 'sa', 'header_variation', 'اختلاف الرأس', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8617, 'sa', 'footer_variation', 'تنوع التذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8618, 'sa', 'footer_variations', 'اختلافات التذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8619, 'sa', 'choose_footer_variation_from_here', 'اختر صيغة التذييل من هنا.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8620, 'sa', 'newsletter_on_footer', 'النشرة الإخبارية على التذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8621, 'sa', 'footer_newsletter_position', 'موضع تذييل النشرة الإخبارية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8622, 'sa', 'choose_footer_newsletter_position', 'اختر موضع تذييل الرسالة الإخبارية.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8623, 'sa', 'footer_newsletter_background_color', 'لون خلفية الرسالة الإخبارية في التذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8624, 'sa', 'footer_newsletter_button_color', 'لون زر الرسالة الإخبارية للتذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8625, 'sa', 'footer_newsletter_button_text_color', 'لون نص زر الرسالة الإخبارية للتذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8626, 'sa', 'newsletter_social_icon_color', 'لون أيقونة النشرة الاجتماعية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8627, 'sa', 'newsletter_social_background_color', 'لون الخلفية الاجتماعية للنشرة الإخبارية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8628, 'sa', 'newsletter_social_icon_hover_color', 'أيقونة النشرة الاجتماعية تحوم اللون', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8629, 'sa', 'newsletter_social_background_hover_color', 'لون الخلفية الاجتماعية للنشرة الإخبارية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8630, 'sa', 'footer_widget_background_color', 'لون خلفية القطعة التذييلية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8631, 'sa', 'footer_widget_title_color', 'لون عنوان عنصر واجهة المستخدم', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8632, 'sa', 'footer_widget_title_after_color', 'عنوان القطعة التذييلية بعد اللون', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8633, 'sa', 'footer_widget_text_color', 'لون نص أداة التذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8634, 'sa', 'footer_widget_anchor_hover_color', 'لون مرساة أداة التذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8635, 'sa', 'footer_bottom_background_color', 'لون الخلفية السفلية للتذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8636, 'sa', 'footer_bottom_menu', 'القائمة السفلية للتذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8637, 'sa', 'choose_footer_bottom_menu', 'اختر القائمة السفلية للتذييل.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8638, 'sa', 'footer_middle_background_color', 'لون الخلفية الوسطى للتذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8639, 'sa', 'footer_middle_text', 'تذييل النص الأوسط', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8640, 'sa', 'footer_middle_text_color', 'لون النص الأوسط للتذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8641, 'sa', 'footer_middle_social_icon_color', 'لون رمز التذييل الاجتماعي الأوسط', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8642, 'sa', 'footer_middle_social_background_color', 'لون الخلفية الاجتماعية الوسطى للتذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8643, 'sa', 'footer_middle_social_icon_hover_color', 'لون رمز التذييل الاجتماعي الأوسط', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8644, 'sa', 'footer_middle_social_background_hover_color', 'لون الخلفية الاجتماعية للتذييل الأوسط', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8645, 'sa', 'style', 'أسلوب', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8646, 'sa', 'none', 'لا أحد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8647, 'sa', 'media_file', 'ملف وسائط', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8648, 'sa', 'custom_url', 'عنوان URL مخصص', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8649, 'sa', 'your_link', 'وصلتك', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8650, 'sa', 'image_alignment', 'محاذاة الصورة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8651, 'sa', 'width', 'عرض', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8652, 'sa', 'max_width', 'أقصى عرض', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8653, 'sa', 'height', 'ارتفاع', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8654, 'sa', 'number_of_categories', 'عدد الفئات', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8655, 'sa', 'number_of_tags', 'عدد العلامات', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8656, 'sa', 'comment_count', 'تعليق العد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8657, 'sa', 'address', 'عنوان', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8658, 'sa', 'mail', 'بريد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8659, 'sa', 'phone', 'هاتف', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8660, 'sa', 'sidebar_updated', 'تم تحديث الشريط الجانبي', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8661, 'sa', 'type_of_posts', 'نوع المشاركات', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8662, 'sa', 'login_credentials_does_not_match', 'بيانات اعتماد تسجيل الدخول غير متطابقة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8663, 'sa', 'edit_comment', 'تعديل التعليق', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8664, 'sa', 'post_update_failed', 'فشل نشر التحديث', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8665, 'sa', 'please_insert_author_name', 'الرجاء إدخال اسم المؤلف', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8666, 'sa', 'author_maximum_length_is_50', 'الحد الأقصى لطول المؤلف هو 50', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8667, 'sa', 'please_insert_author_email', 'الرجاء إدخال البريد الإلكتروني للمؤلف', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8668, 'sa', 'email_is_not_valid', 'البريد الإلكتروني غير صالح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8669, 'sa', 'please_write_some_comment', 'يرجى كتابة بعض التعليق', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8670, 'sa', 'comment_status_is_required', 'حالة التعليق مطلوبة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8671, 'sa', 'submitted_field_must_not_be_empty', 'يجب ألا يكون الحقل المقدم فارغًا', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8672, 'sa', 'comment_update_successfully', 'تم تحديث التعليق بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8673, 'sa', 'setup_open_ai_settings', 'الإعداد افتح إعدادات الذكاء الاصطناعي', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8674, 'sa', 'default_openai_model', 'نموذج OpenAI الافتراضي', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8675, 'sa', 'openai_secret_key', 'OpenAI المفتاح السري', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8676, 'sa', 'enter_secret_key', 'أدخل المفتاح السري', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8677, 'sa', 'general_settings_updated_successfully', 'تم تحديث الإعدادات العامة بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8678, 'sa', 'registration_successful_please_login', 'تم التسجيل بنجاح. الرجاء تسجيل الدخول', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8679, 'sa', 'name_field_is_required', 'حقل الاسم مطلوب', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8680, 'sa', 'name_field_maximum_value_is_100_characters', 'الحد الأقصى لقيمة حقل الاسم هو 100 حرف', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8681, 'sa', 'email_field_is_required', 'حقل البريد الإلكتروني مطلوب', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8682, 'sa', 'email_must_be_a_valid_email', 'يجب أن يكون البريد الإلكتروني بريدًا إلكترونيًا صالحًا', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8683, 'sa', 'an_account_with_this_email_already_exists', 'يوجد حساب بهذا البريد الإلكتروني بالفعل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8684, 'sa', 'the_image_must_be_a_file_of_type_png_jpg_jpeg_svg', 'يجب أن تكون الصورة ملفًا من النوع: png، jpg، jpeg، svg.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8685, 'sa', 'the_image_maximum_size_is_100_kilobytes', 'الحد الأقصى لحجم الصورة هو 100 كيلو بايت.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8686, 'sa', 'profile_updated_successfully', 'تم تحديث الملف الشخصي بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8687, 'sa', 'update_user', 'تحديث المستخدم', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8688, 'sa', 'profile_picture', 'الصوره الشخصيه', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8689, 'sa', 'give_your_name', 'ذكر اسمك', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8690, 'sa', 'give_your_email_address', 'أعط عنوان بريدك الإلكتروني', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8691, 'sa', 'assign_role', 'تعيين الدور', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8692, 'sa', 'select_a_role', 'حدد دورًا', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8693, 'sa', 'profile_pic_is_required', 'صورة الملف الشخصي مطلوبة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8694, 'sa', 'invalid_selection', 'التحديد غير صالح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8695, 'sa', 'user_updated_successfully', 'تم تحديث المستخدم بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8696, 'sa', 'install_themes', 'تثبيت السمات', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8697, 'sa', 'zip_file', 'ملف مضغوط', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8698, 'sa', 'install', 'ثَبَّتَ', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8699, 'sa', 'theme_install_successfully', 'تم تثبيت الموضوع بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8700, 'sa', 'theme_activate_successfully', 'تم تفعيل الموضوع بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8701, 'sa', 'plugings', 'المقابس', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8702, 'sa', 'plugin_creating_guide', 'دليل إنشاء البرنامج المساعد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8703, 'sa', 'install_plugin', 'تثبيت البرنامج المساعد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8704, 'sa', 'deactivate', 'إلغاء التنشيط', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8705, 'sa', 'deactive_confirmation', 'تأكيد التعطيل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8706, 'sa', 'are_you_sure_to_deactive_this_plugin', 'هل أنت متأكد من إلغاء تنشيط هذا البرنامج المساعد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8707, 'sa', 'are_you_sure_to_active_this_plugin', 'هل أنت متأكد من تفعيل هذا البرنامج المساعد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8708, 'sa', 'give_purchase_key_to_activate_this_plugin', 'أعط مفتاح الشراء لتنشيط هذا البرنامج المساعد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8709, 'sa', 'theme_deleted_successfully', 'تم حذف الموضوع بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8710, 'sa', 'nothing_found', 'لم يتم العثور على شيء', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8711, 'sa', 'footer_logo', 'شعار التذييل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8712, 'sa', 'set_footer_logo', 'تعيين شعار التذييل.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8713, 'sa', 'site_seo__settings', 'إعدادات سيو الموقع', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8714, 'sa', 'meta_keywords', 'كلمات دلالية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8715, 'sa', 'seo_update_successfully', 'تم تحديث السيو بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8716, 'sa', 'page_home_status_updated', 'تم تحديث حالة الصفحة الرئيسية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8717, 'sa', 'smtp_configuration', 'تكوين SMTP', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8718, 'sa', 'email_configuration', 'تكوين البريد الإلكتروني', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8719, 'sa', 'type', 'يكتب', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8720, 'sa', 'smtp', 'com.smtp', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8721, 'sa', 'sendmail', 'ارسل بريد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8722, 'sa', 'mailgun', 'بريد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8723, 'sa', 'mail_host', 'مضيف البريد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8724, 'sa', 'mail_port', 'ميناء البريد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8725, 'sa', 'mail_username', 'اسم مستخدم البريد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8726, 'sa', 'mail_password', 'كلمة مرور البريد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8727, 'sa', 'mail_encryption', 'تشفير البريد', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8728, 'sa', 'mail_from_address', 'البريد من العنوان', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8729, 'sa', 'mail_from_name', 'البريد من الاسم', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8730, 'sa', 'mailgun_domain', 'مجال ميلجون', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8731, 'sa', 'mailgun_secret', 'سر مايلجون', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8732, 'sa', 'send_test_mail', 'إرسال بريد الاختبار', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8733, 'sa', 'subject', 'موضوع', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8734, 'sa', 'message', 'رسالة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8735, 'sa', 'send', 'يرسل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8736, 'sa', 'no', 'لا.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8737, 'sa', 'template', 'نموذج', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8738, 'sa', 'details', 'تفاصيل', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8739, 'sa', 'enter_email_subject', 'أدخل موضوع البريد الإلكتروني', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8740, 'sa', 'variables', 'المتغيرات', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8741, 'sa', 'email_template_updated_successful', 'تم تحديث قالب البريد الإلكتروني بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8742, 'sa', 'placeholder_image', 'صورة العنصر النائب', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8743, 'sa', 'media_thumbnails_sizes', 'أحجام الصور المصغرة للوسائط', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8744, 'sa', 'large_thumb_image_size', 'حجم صورة الإبهام كبير', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8745, 'sa', 'large_thumb_image_width', 'عرض صورة الإبهام كبير', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8746, 'sa', 'large_thumb_image_height', 'ارتفاع صورة الإبهام كبير', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8747, 'sa', 'medium_thumb_image_size', 'حجم صورة الإبهام المتوسط', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8748, 'sa', 'medium_thumb_image_width', 'عرض صورة الإبهام متوسط', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8749, 'sa', 'medium_thumb_image_height', 'ارتفاع متوسط ​​لصورة الإبهام', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8750, 'sa', 'small_thumb_image_size', 'حجم صورة الإبهام صغير', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8751, 'sa', 'small_thumb_image_width', 'عرض صورة الإبهام الصغيرة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8752, 'sa', 'small_thumb_image_height', 'ارتفاع صورة الإبهام الصغيرة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8753, 'sa', 'language_deleted_successfully', 'تم حذف اللغة بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8754, 'sa', 'new_language', 'لغة جديدة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8755, 'sa', 'type_name', 'أكتب اسم', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8756, 'sa', 'type__native_name', 'اكتب الاسم الأصلي', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8757, 'sa', 'select_a_option', 'حدد خيارًا', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8758, 'sa', 'translations_updated_successfully', 'تم تحديث الترجمات بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8759, 'sa', 'site_map_generated_successfully', 'تم إنشاء خريطة الموقع بنجاح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8760, 'sa', 'add_user', 'إضافة مستخدم', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8761, 'sa', 'give_your_password', 'أعط كلمة المرور الخاصة بك', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8762, 'sa', 'confirm_password', 'تأكيد كلمة المرور', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8763, 'sa', 'confirm_your_password', 'أكد رقمك السري', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8764, 'sa', 'add_role', 'أضف دور', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8765, 'sa', 'give_role_name', 'إعطاء اسم الدور', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8766, 'sa', 'module', 'وحدة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8767, 'sa', 'feature', 'ميزة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8768, 'sa', 'create', 'يخلق', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8769, 'sa', 'manage', 'يدير', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8770, 'sa', 'show_', 'يعرض', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8771, 'sa', 'create_', 'يخلق', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8772, 'sa', 'edit_', 'يحرر', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8773, 'sa', 'delete_', 'يمسح', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8774, 'sa', 'manage_', 'يدير', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8775, 'sa', 'update_role', 'تحديث الدور', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8776, 'sa', 'update_profile', 'تحديث الملف', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8777, 'sa', 'biography', 'سيرة شخصية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8778, 'sa', 'not_more_than_200_characters', 'لا يزيد عن 200 حرفا', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8779, 'sa', 'give_you_biography', 'أعطيك السيرة الذاتية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8780, 'sa', 'old_password', 'كلمة المرور القديمة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8781, 'sa', 'social_info', 'المعلومات الاجتماعية', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8782, 'sa', 'set_the_default_social_from_theme_option_or_make_custom_social', 'قم بتعيين الخيار الاجتماعي الافتراضي من السمة أو قم بإنشاء اجتماعي مخصص.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8783, 'sa', 'add_slide', 'أضف شريحة', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8784, 'sa', 'switch_enabled_to_display_preloader', 'تم تمكين التبديل لعرض أداة التحميل المسبق.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8785, 'sa', 'preloader_style_type', 'نوع نمط التحميل المسبق', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8786, 'sa', 'control_preloader_style_type_if_you_use_this_option_then_you_will_able_to_set_lot_of_preloader_style', 'التحكم في نوع نمط التحميل المسبق. إذا استخدمت هذا الخيار، فسوف تتمكن من تعيين الكثير من أنماط التحميل المسبق', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8787, 'sa', 'custom_preloader_type', 'نوع التحميل المسبق المخصص', '2023-12-28 11:02:37', '2023-12-28 11:02:37');
INSERT INTO `tl_translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(8788, 'sa', 'image_type__text_type', 'نوع الصورة - نوع النص', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8789, 'sa', 'set_custom_preloader_type', 'قم بتعيين نوع أداة التحميل المسبق المخصصة.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8790, 'sa', 'preloader_image', 'صورة التحميل المسبق', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8791, 'sa', 'set_preloader_image', 'تعيين صورة التحميل المسبق.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8792, 'sa', 'preloader_heading_tag', 'علامة عنوان التحميل المسبق', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8793, 'sa', 'set_preloader_heading_tag', 'قم بتعيين علامة عنوان أداة التحميل المسبق.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8794, 'sa', 'preloader_text', 'نص التحميل المسبق', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8795, 'sa', 'set_preloader_text', 'تعيين نص التحميل المسبق.', '2023-12-28 11:02:37', '2023-12-28 11:02:37'),
(8796, 'sa', 'preloader_item_color', 'لون عنصر التحميل المسبق', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8797, 'sa', 'preloader_background_color', 'لون خلفية التحميل المسبق', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8798, 'sa', 'these_settings_control_the_typography_for_body', 'تتحكم هذه الإعدادات في الطباعة للجسم.', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8799, 'sa', 'font_family', 'خط العائلة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8800, 'sa', 'select__fonts', 'حدد الخطوط', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8801, 'sa', 'custom_font_1', 'الخط المخصص 1', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8802, 'sa', 'custom_font_2', 'الخط المخصص 2', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8803, 'sa', 'google_web_fonts', 'خطوط الويب جوجل', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8804, 'sa', 'font_weight__style', 'وزن الخط & أسلوب', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8805, 'sa', 'font_subsets', 'مجموعات فرعية من الخطوط', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8806, 'sa', 'text_align', 'محاذاة النص', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8807, 'sa', 'text_transform', 'تحويل النص', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8808, 'sa', 'font_size', 'حجم الخط', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8809, 'sa', 'size', 'مقاس', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8810, 'sa', 'line_height', 'ارتفاع خط', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8811, 'sa', 'word_spacing', 'تباعد الكلمات', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8812, 'sa', 'letter_spacing', 'تباعد الحروف', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8813, 'sa', 'the_quick_brown_fox_jumps_over_the_lazy_dog', 'الثعلب البني السريع يقفز فوق الكلب الكسول', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8814, 'sa', 'after_uploading_your_fonts_you_should_select_font_family_customfont1customfont2_from_dropdown_list_in_bodyparagraphheadingsmenu_typography_section', 'بعد تحميل الخطوط الخاصة بك، يجب عليك تحديد عائلة الخطوط (custom-font-1/custom-font-2) من القائمة المنسدلة في قسم الطباعة (النص/الفقرة/العناوين/القائمة).', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8815, 'sa', 'custom_font1', 'الخط المخصص1', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8816, 'sa', 'please_enable_this_option_to_use_custom_font_1', 'الرجاء تمكين هذا الخيار لاستخدام الخط المخصص 1.', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8817, 'sa', 'custom_font_1_woff', 'الخط المخصص 1 .woff', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8818, 'sa', 'uploade_file', 'رفع ملف', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8819, 'sa', 'remove', 'يزيل', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8820, 'sa', 'custom_font_1_ttf', 'الخط المخصص 1 .ttf', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8821, 'sa', 'custom_font_1_eot', 'الخط المخصص 1 .eot', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8822, 'sa', 'custom_font2', 'الخط المخصص 2', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8823, 'sa', 'please_enable_this_option_to_use_custom_font_2', 'الرجاء تمكين هذا الخيار لاستخدام الخط المخصص 2.', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8824, 'sa', 'custom_font_2_woff', 'الخط المخصص 2 .woff', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8825, 'sa', 'custom_font_2_ttf', 'الخط المخصص 2 .ttf', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8826, 'sa', 'custom_font_2_eot', 'الخط المخصص 2 .eot', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8827, 'sa', 'page_breadcrumb', 'مسار التنقل للصفحة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8828, 'sa', 'page_404_image', 'صفحة 404 صورة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8829, 'sa', 'set_404_page_image', 'تعيين 404 صفحة صورة.', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8830, 'sa', 'set_page_title', 'تعيين عنوان الصفحة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8831, 'sa', 'page_subtitle', 'العنوان الفرعي للصفحة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8832, 'sa', 'set_page_subtitle', 'تعيين العنوان الفرعي للصفحة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8833, 'sa', 'button_before_text', 'الزر قبل النص', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8834, 'sa', 'custom_404_style', 'نمط 404 مخصص', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8835, 'sa', 'page_404_button_background_color', 'صفحة 404 لون خلفية الزر', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8836, 'sa', 'page_404_button_text_after_color', 'صفحة 404 زر النص بعد اللون', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8837, 'sa', 'contact_email_will_be_sent', 'سيتم إرسال البريد الإلكتروني للاتصال', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8838, 'sa', 'set_where_will_be_the_contact_email_will_be_sent', 'تعيين أين سيتم إرسال البريد الإلكتروني للاتصال', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8839, 'sa', 'social_profile_links', 'روابط الملف الشخصي الاجتماعي', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8840, 'sa', 'add_social_icon_and_url', 'إضافة رمز الاجتماعية وعنوان URL.', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8841, 'sa', 'css_code', 'كود CSS', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8842, 'sa', 'paste_your_css_code_here', 'الصق كود CSS الخاص بك هنا.', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8843, 'sa', 'adsense_list', 'قائمة ادسنس', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8844, 'sa', 'add_new_addsense', 'إضافة أدسنس جديد.', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8845, 'sa', 'import_options_json', 'خيارات الاستيراد Json', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8846, 'sa', 'import_from_clipboard', 'استيراد من الحافظة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8847, 'sa', 'paste_your_clipboard_data_here', 'الصق بيانات الحافظة الخاصة بك هنا.', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8848, 'sa', 'import', 'يستورد', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8849, 'sa', 'warning_this_will_overwrite_all_existing_option_values_please_proceed_with_caution', 'تحذير! سيؤدي هذا إلى استبدال كافة قيم الخيارات الموجودة، يرجى المتابعة بحذر!', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8850, 'sa', 'export_options_json', 'خيارات التصدير Json', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8851, 'sa', 'here_you_can_copydownload_your_current_option_settings_keep_this_safe_as_you_can_use_it_as_a_backup_should_anything_go_wrong_or_you_can_use_it_to_restore_your_settings_on_this_site_or_any_other_site', 'هنا يمكنك نسخ/تنزيل إعدادات خيارك الحالي. احتفظ بهذا آمنًا حيث يمكنك استخدامه كنسخة احتياطية في حالة حدوث أي خطأ، أو يمكنك استخدامه لاستعادة إعداداتك على هذا الموقع (أو أي موقع آخر).', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8852, 'sa', 'copy_to_clipboard', 'نسخ إلى الحافظة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8853, 'sa', 'export_file', 'ملف التصدير', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8854, 'sa', 'gdpr_cookies_consent', 'اللائحة العامة لحماية البيانات (الموافقة على ملفات تعريف الارتباط)', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8855, 'sa', 'enable_cookie_consent', 'تمكين الموافقة على ملفات تعريف الارتباط', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8856, 'sa', 'button_label', 'تسمية الزر', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8857, 'sa', 'enter_button_label', 'أدخل تسمية الزر', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8858, 'sa', 'position', 'موضع', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8859, 'sa', 'users_login_activity', 'نشاط تسجيل دخول المستخدمين', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8860, 'sa', 'user', 'مستخدم', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8861, 'sa', 'login_at', 'تسجيل الدخول في', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8862, 'sa', 'logout_at', 'تسجيل الخروج عند', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8863, 'sa', 'ip', 'الملكية الفكرية', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8864, 'sa', 'operating_system', 'نظام التشغيل', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8865, 'sa', 'browser', 'المتصفح', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8866, 'sa', 'action', 'فعل', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8867, 'sa', '________________________bulk_action_', 'العمل بالجملة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8868, 'sa', '________________________delete_selection_', 'حذف التحديد', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8869, 'sa', '________________________apply_', 'يتقدم', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8870, 'sa', 'no_item_selected_', 'لم يتم تحديد أي عنصر', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8871, 'sa', 'no_action_selected_', 'لم يتم تحديد أي إجراء', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8872, 'sa', 'create_voting', 'إنشاء التصويت', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8873, 'sa', 'files_backup', 'النسخ الاحتياطي للملفات', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8874, 'sa', 'database_backup', 'نسخه الاحتياطيه لقاعدة البيانات', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8875, 'sa', 'generate_project_backup', 'إنشاء نسخة احتياطية للمشروع', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8876, 'sa', 'file', 'ملف', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8877, 'sa', 'create_date', 'تاريخ الإنشاء', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8878, 'sa', 'no_backup_file_found', 'لم يتم العثور على ملف النسخ الاحتياطي', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8879, 'sa', 'backup_generate_successfully', 'تم إنشاء النسخة الاحتياطية بنجاح', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8880, 'sa', 'database_backup_file_created_successfully', 'تم إنشاء ملف النسخ الاحتياطي لقاعدة البيانات بنجاح', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8881, 'sa', 'header_top_multilanguage', 'رأس أعلى متعدد اللغات', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8882, 'sa', 'edit_tag', 'تحرير العلامة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8883, 'sa', 'please_write_the_tag_name_under_225_words', 'يرجى كتابة اسم العلامة تحت 225 كلمة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8884, 'sa', 'tag_updated_successfully', 'تم تحديث العلامة بنجاح', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8885, 'sa', 'try_forgot_password', 'حاول نسيت كلمة المرور', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8886, 'sa', 'reset_password', 'إعادة تعيين كلمة المرور', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8887, 'sa', 'send_password_reset________________________________________________________________________________________________________link', 'إرسال رابط إعادة تعيين كلمة السر', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8888, 'sa', 'unable_to_delete_menu', 'غير قادر على حذف القائمة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8889, 'sa', 'clear_filter', 'مرشح واضح', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8890, 'sa', 'select_post_type', 'حدد نوع المشاركة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8891, 'sa', 'number_of_tag', 'عدد العلامات', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8892, 'sa', '___', '997', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8893, 'sa', 'edit_language', 'تحرير اللغة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8894, 'sa', 'update_language_information', 'تحديث معلومات اللغة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8895, 'sa', 'module_name', 'اسم وحدة', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8896, 'sa', 'permission_name', 'اسم الإذن', '2023-12-28 11:03:14', '2023-12-28 11:03:14'),
(8897, 'en', 'user_deleted_successfully', 'User deleted successfully', '2023-12-28 06:21:05', '2023-12-28 06:21:05'),
(8898, 'en', 'verify_license_key', 'Verify License Key', '2023-12-28 06:46:57', '2023-12-28 06:46:57'),
(8899, 'en', 'license_key', 'License Key', '2023-12-28 06:46:58', '2023-12-28 06:46:58'),
(8900, 'en', 'enter_license_key', 'Enter License Key', '2023-12-28 06:46:58', '2023-12-28 06:46:58'),
(8901, 'en', 'verify_now', 'Verify Now', '2023-12-28 06:46:58', '2023-12-28 06:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `tl_uploaded_files`
--

CREATE TABLE `tl_uploaded_files` (
  `id` int(11) NOT NULL,
  `media_type` int(11) NOT NULL DEFAULT 1,
  `disk` varchar(150) NOT NULL DEFAULT 'public',
  `name` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `alt` text DEFAULT NULL,
  `caption` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `path` text NOT NULL,
  `size` double DEFAULT NULL,
  `variant` text DEFAULT NULL,
  `file_type` varchar(150) DEFAULT NULL,
  `extension` varchar(150) DEFAULT NULL,
  `folder_name` varchar(200) DEFAULT NULL,
  `uploaded_by` varchar(150) DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_uploaded_files`
--

INSERT INTO `tl_uploaded_files` (`id`, `media_type`, `disk`, `name`, `title`, `alt`, `caption`, `description`, `path`, `size`, `variant`, `file_type`, `extension`, `folder_name`, `uploaded_by`, `created_at`, `updated_at`) VALUES
(1051, 3, 'public', 'img-demo_1051', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Aug/img-demo_1051.jpg', 2972, '{\"large_size\":[\"700\",\"600\"],\"medium_size\":[\"500\",\"270\"],\"small_size\":[\"60\",\"60\"]}', 'image', 'jpg', 'storage/all_files/2023/Aug', 'Wade Wilson', '2023-08-29 06:37:22', '2023-08-29 06:37:22'),
(1069, 3, 'public', 'loader_1069', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Oct/loader_1069.svg', 5636, NULL, 'svg', 'svg', 'storage/all_files/2023/Oct', 'Wade Wilson', '2023-10-04 09:42:00', '2023-10-04 09:42:00'),
(1070, 3, 'public', '404_1070', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Oct/404_1070.png', 10069, '{\"large_size\":[\"700\",\"700\"],\"medium_size\":[\"350\",\"480\"],\"small_size\":[\"250\",\"250\"]}', 'image', 'png', 'storage/all_files/2023/Oct', 'Wade Wilson', '2023-10-09 11:55:27', '2023-10-09 11:55:27'),
(1097, 3, 'public', 'favicon_1097', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Nov/favicon_1097.png', 29400, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Nov', 'Wade Wilson', '2023-11-12 08:28:53', '2023-11-12 08:28:54'),
(1137, 3, 'public', 'logo (1)_1137', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Dec/logo (1)_1137.png', 9552, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Dec', 'Wade Wilson', '2023-12-12 12:15:18', '2023-12-12 12:15:18'),
(1138, 3, 'public', 'logo-1_1138', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Dec/logo-1_1138.png', 8713, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Dec', 'Wade Wilson', '2023-12-12 12:15:18', '2023-12-12 12:15:18'),
(1148, 3, 'public', 'dummy_750x410_ffffff_cccccc_1148', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Dec/dummy_750x410_ffffff_cccccc_1148.png', 9988, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Dec', 'Wade Wilson', '2023-12-28 05:27:12', '2023-12-28 05:27:12'),
(1149, 3, 'public', 'dummy_728x90_ffffff_cccccc_1149', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Dec/dummy_728x90_ffffff_cccccc_1149.png', 4607, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Dec', 'Wade Wilson', '2023-12-28 05:36:10', '2023-12-28 05:36:10'),
(1150, 3, 'public', 'dummy_350x246_ffffff_cccccc_1150', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Dec/dummy_350x246_ffffff_cccccc_1150.png', 5615, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Dec', 'Wade Wilson', '2023-12-28 05:38:39', '2023-12-28 05:38:39'),
(1151, 3, 'public', 'dummy_350x408_ffffff_cccccc_1151', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Dec/dummy_350x408_ffffff_cccccc_1151.png', 6956, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Dec', 'Wade Wilson', '2023-12-28 05:39:40', '2023-12-28 05:39:40'),
(1152, 3, 'public', 'dummy_350x670_ffffff_cccccc_1152', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Dec/dummy_350x670_ffffff_cccccc_1152.png', 9030, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Dec', 'Wade Wilson', '2023-12-28 05:40:25', '2023-12-28 05:40:25'),
(1153, 3, 'public', 'dummy_310x173_ffffff_cccccc_1153', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Dec/dummy_310x173_ffffff_cccccc_1153.png', 4241, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Dec', 'Wade Wilson', '2023-12-28 05:41:44', '2023-12-28 05:41:44'),
(1154, 3, 'public', 'dummy_350x300_ffffff_cccccc_1154', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Dec/dummy_350x300_ffffff_cccccc_1154.png', 6064, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Dec', 'Wade Wilson', '2023-12-28 05:44:04', '2023-12-28 05:44:04'),
(1155, 3, 'public', 'dummy_990x90_ffffff_cccccc_1155', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Dec/dummy_990x90_ffffff_cccccc_1155.png', 5050, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Dec', 'Wade Wilson', '2023-12-28 05:46:11', '2023-12-28 05:46:11'),
(1156, 3, 'public', 'dummy_330x525_ffffff_cccccc_1156', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Dec/dummy_330x525_ffffff_cccccc_1156.png', 8583, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Dec', 'Wade Wilson', '2023-12-28 05:48:37', '2023-12-28 05:48:37'),
(1157, 3, 'public', 'dummy_1920x869_ffffff_cccccc_1157', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Dec/dummy_1920x869_ffffff_cccccc_1157.png', 35945, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Dec', 'Wade Wilson', '2023-12-28 05:52:15', '2023-12-28 05:52:16'),
(1158, 3, 'public', 'dummy_70x70_ffffff_cccccc_1158', NULL, NULL, NULL, NULL, 'storage/all_files/2023/Dec/dummy_70x70_ffffff_cccccc_1158.png', 985, '{\"large_size\":[655,670],\"medium_size\":[350,480],\"small_size\":[255,250]}', 'image', 'png', 'storage/all_files/2023/Dec', 'Wade Wilson', '2023-12-28 06:20:21', '2023-12-28 06:20:21');

-- --------------------------------------------------------

--
-- Table structure for table `tl_users`
--

CREATE TABLE `tl_users` (
  `id` int(11) NOT NULL,
  `uid` varchar(150) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `remember_token` varchar(150) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_logged_in` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `user_type` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_users`
--

INSERT INTO `tl_users` (`id`, `uid`, `name`, `email`, `image`, `password`, `remember_token`, `email_verified_at`, `is_logged_in`, `status`, `user_type`, `created_at`, `updated_at`) VALUES
(1, 'SUPER-ADMIN-1230202', 'Wade Wilson', 'admin@example.com', '1158', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 1, 1, '2023-02-01 21:40:15', '2023-12-28 06:20:45'),
(8, 'USERQdw1G', 'Habib', 'habib@example.test', 'USERQdw1G1703744585.png', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 1, 2, '2023-11-12 06:50:02', '2023-12-28 06:23:05'),
(11, 'USERTBonS', 'Rohan', 'rohan@example.test', 'USERTBonS1703744742.png', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 1, 2, '2023-11-12 06:51:25', '2023-12-28 06:25:42'),
(13, 'USER8idNn', 'Alen', 'alen@example.test', 'USER8idNn1703744847.png', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 1, 2, '2023-12-11 15:38:37', '2023-12-28 06:27:27'),
(14, 'USERqCiB7', 'Clark', 'clark@example.test', 'USERqCiB71703744806.png', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 1, 2, '2023-12-11 15:39:13', '2023-12-28 06:26:46');

-- --------------------------------------------------------

--
-- Table structure for table `tl_user_informations`
--

CREATE TABLE `tl_user_informations` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `custom_social` int(11) NOT NULL DEFAULT 0,
  `social` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_user_informations`
--

INSERT INTO `tl_user_informations` (`id`, `user_id`, `bio`, `custom_social`, `social`, `created_at`, `updated_at`) VALUES
(29, 1, '26-year-old health centre receptionist who enjoy going movies photography and social media playing above you picked up some tips.', 0, NULL, '2023-12-28 06:20:45', '2023-12-28 06:20:45');

-- --------------------------------------------------------

--
-- Table structure for table `tl_water_mark_image_applicable_folders`
--

CREATE TABLE `tl_water_mark_image_applicable_folders` (
  `id` int(11) NOT NULL,
  `image_type` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tl_widgets`
--

CREATE TABLE `tl_widgets` (
  `id` bigint(20) NOT NULL,
  `widget_name` varchar(255) DEFAULT NULL,
  `widget_short_desc` text DEFAULT NULL,
  `theme_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tl_widgets`
--

INSERT INTO `tl_widgets` (`id`, `widget_name`, `widget_short_desc`, `theme_id`, `created_at`, `updated_at`) VALUES
(107, 'Author Widget', 'Display Author Information', 22, '2023-09-02 06:15:46', '2023-09-02 06:15:46'),
(108, 'Social Widget', 'Display Social Icons and Text', 22, '2023-09-02 06:15:46', '2023-09-02 06:15:46'),
(110, 'Tag Widget', 'Display Tags', 22, '2023-09-02 06:15:46', '2023-09-02 06:15:46'),
(111, 'Category Widget', 'Display Categories', 22, '2023-09-02 06:15:46', '2023-09-02 06:15:46'),
(112, 'Advertisement Widget', 'Display Ads', 22, '2023-09-02 06:15:46', '2023-09-02 06:15:46'),
(113, 'Newsletter Widget', 'Display newsletter Box', 22, '2023-09-02 06:15:46', '2023-09-02 06:15:46'),
(114, 'Search Widget', 'Display Blog Search Box', 22, '2023-10-11 11:07:46', '2023-10-11 11:07:46'),
(115, 'Blog List Widget', 'Display Blogs As List', 22, '2023-10-11 11:07:46', '2023-10-11 11:07:46'),
(116, 'Blog Tab Widget', 'Display Blogs As Tabs', 22, '2023-10-11 11:07:46', '2023-10-11 11:07:46'),
(117, 'Voting Widget', 'Display Votings', 22, '2023-10-11 11:07:47', '2023-10-11 11:07:47'),
(118, 'Recent Comment Widget', 'Display Recent Comments', 22, '2023-10-11 11:07:47', '2023-10-11 11:07:47'),
(119, 'Address Widget', 'Display Address Information', 22, '2023-10-21 04:00:33', '2023-10-21 04:00:33'),
(120, 'Menu Widget', 'Display Menu Links', 22, '2023-10-21 04:00:33', '2023-10-21 04:00:33'),
(121, 'Gallery Widget', 'Display Blogs Gallery', 22, '2023-10-21 04:00:33', '2023-10-21 04:00:33');

-- --------------------------------------------------------

--
-- Table structure for table `user_keys`
--

CREATE TABLE `user_keys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `license_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_is` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` bigint(20) NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `visited_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `title`, `image`, `date`, `created_at`, `updated_at`) VALUES
(1, 'Who is the world cup winner of 2023', '1153', '2024-01-01 17:40:00', '2023-10-16 10:48:32', '2023-12-28 05:41:51');

-- --------------------------------------------------------

--
-- Table structure for table `vote_counts`
--

CREATE TABLE `vote_counts` (
  `id` int(11) NOT NULL,
  `vote_id` int(11) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vote_counts`
--

INSERT INTO `vote_counts` (`id`, `vote_id`, `options`, `count`, `created_at`, `updated_at`) VALUES
(1, 1, 'India', 34, NULL, '2023-12-28 05:41:51'),
(2, 1, 'Australia', 11, NULL, '2023-12-28 05:41:51'),
(3, 1, 'Bangladesh', 30, NULL, '2023-12-28 05:41:51'),
(4, 1, 'New-Zealand', 17, NULL, '2023-12-28 05:41:51'),
(26, 1, 'England', 2, '2023-10-18 10:44:40', '2023-12-28 05:41:51'),
(27, 1, 'Pakistan', 4, '2023-10-18 10:45:07', '2023-12-28 05:41:51'),
(28, 1, 'USA', 0, '2023-12-26 13:23:59', '2023-12-28 05:41:51');

-- --------------------------------------------------------

--
-- Table structure for table `vote_translations`
--

CREATE TABLE `vote_translations` (
  `id` int(11) NOT NULL,
  `vote_id` int(11) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vote_translations`
--

INSERT INTO `vote_translations` (`id`, `vote_id`, `title`, `lang`, `created_at`, `updated_at`) VALUES
(4, 1, 'من هو الفائز بكأس العالم 2023؟', 'sa', '2023-10-18 11:43:42', '2023-12-24 16:27:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `admin_login_activity_log`
--
ALTER TABLE `admin_login_activity_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_admin_login_activity_log_tl_users` (`user_id`);

--
-- Indexes for table `blog_share_options`
--
ALTER TABLE `blog_share_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tl_com_product_share_options_tl_all_status` (`status`);

--
-- Indexes for table `custom_ads`
--
ALTER TABLE `custom_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD KEY `FK_model_has_permissions_tl_users` (`model_id`),
  ADD KEY `FK_model_has_permissions_permissions` (`permission_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD KEY `FK_model_has_roles_tl_users` (`model_id`),
  ADD KEY `FK_model_has_roles_roles` (`role_id`);

--
-- Indexes for table `open_ai_settings`
--
ALTER TABLE `open_ai_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_builder_sections`
--
ALTER TABLE `page_builder_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `page_builder_sections_layout_widget_properties`
--
ALTER TABLE `page_builder_sections_layout_widget_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_has_widget_id` (`layout_has_widget_id`);

--
-- Indexes for table `page_builder_sections_properties`
--
ALTER TABLE `page_builder_sections_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `page_builder_section_layouts`
--
ALTER TABLE `page_builder_section_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `page_builder_section_layout_widgets`
--
ALTER TABLE `page_builder_section_layout_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `section_layout_id` (`section_layout_id`),
  ADD KEY `page_widget_id` (`page_widget_id`);

--
-- Indexes for table `page_builder_widgets`
--
ALTER TABLE `page_builder_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_builder_widget_translations`
--
ALTER TABLE `page_builder_widget_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `layout_widget_properties_id` (`layout_widget_properties_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_permissions_permission_module` (`module_id`);

--
-- Indexes for table `permission_module`
--
ALTER TABLE `permission_module`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reading_list`
--
ALTER TABLE `reading_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `blog_id` (`blog_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_blogs`
--
ALTER TABLE `tl_blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_blogs_tl_users` (`user_id`),
  ADD KEY `is_publish` (`is_publish`),
  ADD KEY `permalink` (`permalink`),
  ADD KEY `views` (`views`),
  ADD KEY `formate` (`formate`);

--
-- Indexes for table `tl_blogs_categories`
--
ALTER TABLE `tl_blogs_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_blogs_categories_tl_blogs` (`blog_id`),
  ADD KEY `FK_tl_blogs_categories_tl_blog_categories` (`category_id`);

--
-- Indexes for table `tl_blogs_tags`
--
ALTER TABLE `tl_blogs_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_blogs_tags_tl_blogs` (`blog_id`),
  ADD KEY `FK_tl_blogs_tags_tl_blog_tags` (`tag_id`);

--
-- Indexes for table `tl_blog_categories`
--
ALTER TABLE `tl_blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_blog_categories_tl_blog_categories` (`parent`);

--
-- Indexes for table `tl_blog_category_translations`
--
ALTER TABLE `tl_blog_category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_blog_category_translations_tl_blog_categories` (`category_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `tl_blog_comments`
--
ALTER TABLE `tl_blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_blog_comments_tl_blogs` (`blog_id`),
  ADD KEY `FK_tl_blog_comments_tl_blog_comments` (`parent`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`),
  ADD KEY `user_type` (`user_type`);

--
-- Indexes for table `tl_blog_tags`
--
ALTER TABLE `tl_blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `is_publish` (`is_publish`);

--
-- Indexes for table `tl_blog_tag_translations`
--
ALTER TABLE `tl_blog_tag_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_blog_tag_translations_tl_blog_tags` (`tag_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `tl_blog_translations`
--
ALTER TABLE `tl_blog_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_blog_translations_tl_blogs` (`blog_id`);

--
-- Indexes for table `tl_email_templates`
--
ALTER TABLE `tl_email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tl_email_template_properties`
--
ALTER TABLE `tl_email_template_properties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_email_template_tl_notification_type` (`email_type`) USING BTREE;

--
-- Indexes for table `tl_email_template_variable`
--
ALTER TABLE `tl_email_template_variable`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tl_general_settings`
--
ALTER TABLE `tl_general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_general_settings_has_values`
--
ALTER TABLE `tl_general_settings_has_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_general_settings_has_value_tl_general_settings` (`settings_id`);

--
-- Indexes for table `tl_languages`
--
ALTER TABLE `tl_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_language_tl_all_status` (`status`);

--
-- Indexes for table `tl_media_type`
--
ALTER TABLE `tl_media_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tl_menus`
--
ALTER TABLE `tl_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_menus_tl_menu_groups` (`menu_group_id`);

--
-- Indexes for table `tl_menu_groups`
--
ALTER TABLE `tl_menu_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tl_menu_groups_translations`
--
ALTER TABLE `tl_menu_groups_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_menu_groups_translations_tl_menu_groups` (`menu_group_id`);

--
-- Indexes for table `tl_menu_group_has_positon`
--
ALTER TABLE `tl_menu_group_has_positon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_menu_group_has_positon_tl_menu_groups` (`menu_group_id`),
  ADD KEY `FK_tl_menu_group_has_positon_tl_menu_positions` (`menu_position_id`);

--
-- Indexes for table `tl_menu_items`
--
ALTER TABLE `tl_menu_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tl_menu_positions`
--
ALTER TABLE `tl_menu_positions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_menu_positions_tl_themes` (`theme_id`);

--
-- Indexes for table `tl_menu_translations`
--
ALTER TABLE `tl_menu_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_menu_translations_tl_menus` (`menu_id`);

--
-- Indexes for table `tl_pages`
--
ALTER TABLE `tl_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_pages_tl_users` (`user_id`);

--
-- Indexes for table `tl_page_translations`
--
ALTER TABLE `tl_page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_page_translations_tl_pages` (`page_id`);

--
-- Indexes for table `tl_plugins`
--
ALTER TABLE `tl_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_sidebar_has_widgets`
--
ALTER TABLE `tl_sidebar_has_widgets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_sidebar_has_widgets_tl_theme_sidebars` (`sidebar_id`),
  ADD KEY `FK_tl_sidebar_has_widgets_tl_widgets` (`widget_id`);

--
-- Indexes for table `tl_sidebar_widget_has_translate_values`
--
ALTER TABLE `tl_sidebar_widget_has_translate_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `sidebar_widget_has_values_id` (`sidebar_widget_has_values_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `tl_sidebar_widget_has_values`
--
ALTER TABLE `tl_sidebar_widget_has_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_sidebar_widget_has_values_tl_sidebar_has_widgets` (`sidebar_has_widget_id`);

--
-- Indexes for table `tl_themes`
--
ALTER TABLE `tl_themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_theme_option_settings`
--
ALTER TABLE `tl_theme_option_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_id` (`theme_id`);

--
-- Indexes for table `tl_theme_sidebars`
--
ALTER TABLE `tl_theme_sidebars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_id` (`theme_id`);

--
-- Indexes for table `tl_theme_translations`
--
ALTER TABLE `tl_theme_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tl_translations`
--
ALTER TABLE `tl_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tl_uploaded_files`
--
ALTER TABLE `tl_uploaded_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_uploaded_files_tl_media_image_type` (`media_type`) USING BTREE;

--
-- Indexes for table `tl_users`
--
ALTER TABLE `tl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `tl_user_informations`
--
ALTER TABLE `tl_user_informations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tl_water_mark_image_applicable_folders`
--
ALTER TABLE `tl_water_mark_image_applicable_folders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_tl_water_mark_image_applicable_folders_tl_media_image_type` (`image_type`);

--
-- Indexes for table `tl_widgets`
--
ALTER TABLE `tl_widgets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `theme_id` (`theme_id`);

--
-- Indexes for table `user_keys`
--
ALTER TABLE `user_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vote_counts`
--
ALTER TABLE `vote_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote_id` (`vote_id`);

--
-- Indexes for table `vote_translations`
--
ALTER TABLE `vote_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote_id` (`vote_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT for table `admin_login_activity_log`
--
ALTER TABLE `admin_login_activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=556;

--
-- AUTO_INCREMENT for table `blog_share_options`
--
ALTER TABLE `blog_share_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `custom_ads`
--
ALTER TABLE `custom_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=472;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  MODIFY `role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `open_ai_settings`
--
ALTER TABLE `open_ai_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_builder_sections`
--
ALTER TABLE `page_builder_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `page_builder_sections_layout_widget_properties`
--
ALTER TABLE `page_builder_sections_layout_widget_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `page_builder_sections_properties`
--
ALTER TABLE `page_builder_sections_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `page_builder_section_layouts`
--
ALTER TABLE `page_builder_section_layouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- AUTO_INCREMENT for table `page_builder_section_layout_widgets`
--
ALTER TABLE `page_builder_section_layout_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=456;

--
-- AUTO_INCREMENT for table `page_builder_widgets`
--
ALTER TABLE `page_builder_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `page_builder_widget_translations`
--
ALTER TABLE `page_builder_widget_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `permission_module`
--
ALTER TABLE `permission_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reading_list`
--
ALTER TABLE `reading_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  MODIFY `permission_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_blogs`
--
ALTER TABLE `tl_blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT for table `tl_blogs_categories`
--
ALTER TABLE `tl_blogs_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1258;

--
-- AUTO_INCREMENT for table `tl_blogs_tags`
--
ALTER TABLE `tl_blogs_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;

--
-- AUTO_INCREMENT for table `tl_blog_categories`
--
ALTER TABLE `tl_blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT for table `tl_blog_category_translations`
--
ALTER TABLE `tl_blog_category_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tl_blog_comments`
--
ALTER TABLE `tl_blog_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tl_blog_tags`
--
ALTER TABLE `tl_blog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `tl_blog_tag_translations`
--
ALTER TABLE `tl_blog_tag_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tl_blog_translations`
--
ALTER TABLE `tl_blog_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tl_email_templates`
--
ALTER TABLE `tl_email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tl_email_template_properties`
--
ALTER TABLE `tl_email_template_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tl_email_template_variable`
--
ALTER TABLE `tl_email_template_variable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tl_general_settings`
--
ALTER TABLE `tl_general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=360;

--
-- AUTO_INCREMENT for table `tl_general_settings_has_values`
--
ALTER TABLE `tl_general_settings_has_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2815;

--
-- AUTO_INCREMENT for table `tl_languages`
--
ALTER TABLE `tl_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tl_media_type`
--
ALTER TABLE `tl_media_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tl_menus`
--
ALTER TABLE `tl_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=597;

--
-- AUTO_INCREMENT for table `tl_menu_groups`
--
ALTER TABLE `tl_menu_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tl_menu_groups_translations`
--
ALTER TABLE `tl_menu_groups_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tl_menu_group_has_positon`
--
ALTER TABLE `tl_menu_group_has_positon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `tl_menu_items`
--
ALTER TABLE `tl_menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tl_menu_positions`
--
ALTER TABLE `tl_menu_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tl_menu_translations`
--
ALTER TABLE `tl_menu_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `tl_pages`
--
ALTER TABLE `tl_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tl_page_translations`
--
ALTER TABLE `tl_page_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tl_plugins`
--
ALTER TABLE `tl_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tl_sidebar_has_widgets`
--
ALTER TABLE `tl_sidebar_has_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=886;

--
-- AUTO_INCREMENT for table `tl_sidebar_widget_has_translate_values`
--
ALTER TABLE `tl_sidebar_widget_has_translate_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tl_sidebar_widget_has_values`
--
ALTER TABLE `tl_sidebar_widget_has_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `tl_themes`
--
ALTER TABLE `tl_themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tl_theme_option_settings`
--
ALTER TABLE `tl_theme_option_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5439;

--
-- AUTO_INCREMENT for table `tl_theme_sidebars`
--
ALTER TABLE `tl_theme_sidebars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tl_theme_translations`
--
ALTER TABLE `tl_theme_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43248;

--
-- AUTO_INCREMENT for table `tl_translations`
--
ALTER TABLE `tl_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8902;

--
-- AUTO_INCREMENT for table `tl_uploaded_files`
--
ALTER TABLE `tl_uploaded_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1159;

--
-- AUTO_INCREMENT for table `tl_users`
--
ALTER TABLE `tl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tl_user_informations`
--
ALTER TABLE `tl_user_informations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tl_water_mark_image_applicable_folders`
--
ALTER TABLE `tl_water_mark_image_applicable_folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tl_widgets`
--
ALTER TABLE `tl_widgets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `user_keys`
--
ALTER TABLE `user_keys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34625;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vote_counts`
--
ALTER TABLE `vote_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `vote_translations`
--
ALTER TABLE `vote_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_login_activity_log`
--
ALTER TABLE `admin_login_activity_log`
  ADD CONSTRAINT `FK_admin_login_activity_log_tl_users` FOREIGN KEY (`user_id`) REFERENCES `tl_users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `FK_model_has_permissions_permissions` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_model_has_permissions_tl_users` FOREIGN KEY (`model_id`) REFERENCES `tl_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `FK_model_has_roles_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_model_has_roles_tl_users` FOREIGN KEY (`model_id`) REFERENCES `tl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `page_builder_sections`
--
ALTER TABLE `page_builder_sections`
  ADD CONSTRAINT `page_builder_sections_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `tl_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `page_builder_sections_layout_widget_properties`
--
ALTER TABLE `page_builder_sections_layout_widget_properties`
  ADD CONSTRAINT `page_builder_sections_layout_widget_properties_ibfk_1` FOREIGN KEY (`layout_has_widget_id`) REFERENCES `page_builder_section_layout_widgets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `page_builder_sections_properties`
--
ALTER TABLE `page_builder_sections_properties`
  ADD CONSTRAINT `page_builder_sections_properties_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `page_builder_sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `page_builder_section_layouts`
--
ALTER TABLE `page_builder_section_layouts`
  ADD CONSTRAINT `page_builder_section_layouts_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `page_builder_sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `page_builder_section_layout_widgets`
--
ALTER TABLE `page_builder_section_layout_widgets`
  ADD CONSTRAINT `page_builder_section_layout_widgets_ibfk_1` FOREIGN KEY (`section_layout_id`) REFERENCES `page_builder_section_layouts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `page_builder_section_layout_widgets_ibfk_2` FOREIGN KEY (`page_widget_id`) REFERENCES `page_builder_widgets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `page_builder_widget_translations`
--
ALTER TABLE `page_builder_widget_translations`
  ADD CONSTRAINT `page_builder_widget_translations_ibfk_1` FOREIGN KEY (`layout_widget_properties_id`) REFERENCES `page_builder_sections_layout_widget_properties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `FK_permissions_permission_module` FOREIGN KEY (`module_id`) REFERENCES `permission_module` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reading_list`
--
ALTER TABLE `reading_list`
  ADD CONSTRAINT `reading_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reading_list_ibfk_2` FOREIGN KEY (`blog_id`) REFERENCES `tl_blogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `FK_role_has_permissions_permissions` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_role_has_permissions_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tl_blogs`
--
ALTER TABLE `tl_blogs`
  ADD CONSTRAINT `FK_tl_blogs_tl_users` FOREIGN KEY (`user_id`) REFERENCES `tl_users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tl_blogs_categories`
--
ALTER TABLE `tl_blogs_categories`
  ADD CONSTRAINT `FK_tl_blogs_categories_tl_blog_categories` FOREIGN KEY (`category_id`) REFERENCES `tl_blog_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tl_blogs_categories_tl_blogs` FOREIGN KEY (`blog_id`) REFERENCES `tl_blogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tl_blogs_tags`
--
ALTER TABLE `tl_blogs_tags`
  ADD CONSTRAINT `FK_tl_blogs_tags_tl_blog_tags` FOREIGN KEY (`tag_id`) REFERENCES `tl_blog_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tl_blogs_tags_tl_blogs` FOREIGN KEY (`blog_id`) REFERENCES `tl_blogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tl_blog_categories`
--
ALTER TABLE `tl_blog_categories`
  ADD CONSTRAINT `FK_tl_blog_categories_tl_blog_categories` FOREIGN KEY (`parent`) REFERENCES `tl_blog_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tl_blog_category_translations`
--
ALTER TABLE `tl_blog_category_translations`
  ADD CONSTRAINT `FK_tl_blog_category_translations_tl_blog_categories` FOREIGN KEY (`category_id`) REFERENCES `tl_blog_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tl_blog_comments`
--
ALTER TABLE `tl_blog_comments`
  ADD CONSTRAINT `FK_tl_blog_comments_tl_blog_comments` FOREIGN KEY (`parent`) REFERENCES `tl_blog_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tl_blog_comments_tl_blogs` FOREIGN KEY (`blog_id`) REFERENCES `tl_blogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tl_blog_comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tl_users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tl_blog_tag_translations`
--
ALTER TABLE `tl_blog_tag_translations`
  ADD CONSTRAINT `FK_tl_blog_tag_translations_tl_blog_tags` FOREIGN KEY (`tag_id`) REFERENCES `tl_blog_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tl_blog_translations`
--
ALTER TABLE `tl_blog_translations`
  ADD CONSTRAINT `FK_tl_blog_translations_tl_blogs` FOREIGN KEY (`blog_id`) REFERENCES `tl_blogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tl_user_informations`
--
ALTER TABLE `tl_user_informations`
  ADD CONSTRAINT `tl_user_informations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vote_counts`
--
ALTER TABLE `vote_counts`
  ADD CONSTRAINT `vote_counts_ibfk_1` FOREIGN KEY (`vote_id`) REFERENCES `votes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vote_translations`
--
ALTER TABLE `vote_translations`
  ADD CONSTRAINT `vote_translations_ibfk_1` FOREIGN KEY (`vote_id`) REFERENCES `votes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
