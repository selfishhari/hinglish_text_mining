-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 04, 2020 at 12:26 PM
-- Server version: 5.7.29
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rootvj_shop_rmm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@rmm.com', '$2y$10$zd9cmHQhiYp3XgsySEW5z.s5GdJMGh3KlBebn.rCI4eiV.yYzS8Wy', 'Za7bR2iSRkiyaXpVTV72lXVT4dgjOXsfkFHKtVpRyh0iNI0rVEH2p5sU84cb', '2019-09-05 10:53:43', '2019-09-05 10:53:43');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewaste_categories`
--

CREATE TABLE `ewaste_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewaste_categories`
--

INSERT INTO `ewaste_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Mobile', '2019-09-24 18:21:20', '2019-09-24 18:21:20'),
(3, 'Android board', '2019-09-25 08:29:33', '2019-09-25 08:29:33'),
(4, 'e-waste new', '2019-10-20 14:17:20', '2019-10-20 14:17:20');

-- --------------------------------------------------------

--
-- Table structure for table `ewaste_password_resets`
--

CREATE TABLE `ewaste_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewaste_products`
--

CREATE TABLE `ewaste_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ewaste_user_id` bigint(20) NOT NULL,
  `ewaste_category_id` bigint(20) NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewaste_products`
--

INSERT INTO `ewaste_products` (`id`, `title`, `slug`, `ewaste_user_id`, `ewaste_category_id`, `location`, `latitude`, `longitude`, `contact_number`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'maracek', 'maracek', 1, 2, 'Banaswadi, Bengaluru, Karnataka, India', 13.01037610, 77.64819440, '899899883', 'Lorem ipsum pharetra lorem felis. Aliquam egestas consectetur elementum class aptentea taciti sociosqu ad litora torquent perea conubia nostra lorem consectetur adipiscing elit. Donec vestibulum justo a diam ultricies pellentesque.Lorem ipsum pharetra lorem felis. Aliquam egestas consectetur elementum class aptentea taciti sociosqu ad litora torquent perea conubia nostra lorem consectetur adipiscing elit. Donec vestibulum justo a diam ultricies pellentesque.Lorem ipsum pharetra lorem felis. Aliquam egestas consectetur elementum class aptentea taciti sociosqu ad litora torquent perea conubia nostra lorem consectetur adipiscing elit. Donec vestibulum justo a diam ultricies pellentesque.', 1, '2019-09-24 18:23:33', '2019-09-24 18:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `ewaste_product_images`
--

CREATE TABLE `ewaste_product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ewaste_product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewaste_product_images`
--

INSERT INTO `ewaste_product_images` (`id`, `ewaste_product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, '1', '1569349413-1037888134.jpg', '2019-09-24 18:23:33', '2019-09-24 18:23:33'),
(2, '1', '1569349413-221978387.jpg', '2019-09-24 18:23:33', '2019-09-24 18:23:33'),
(3, '1', '1569349413-2123666603.jpg', '2019-09-24 18:23:33', '2019-09-24 18:23:33');

-- --------------------------------------------------------

--
-- Table structure for table `ewaste_users`
--

CREATE TABLE `ewaste_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ewaste_users`
--

INSERT INTO `ewaste_users` (`id`, `name`, `email`, `password`, `remember_token`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Ferris Vance', 'rasicasul@mailinator.com', '$2y$10$9V0ztbTlzSJh1duQl7ZVlOyVzfdm5RFJUb0rmwzYKBvN4cLBjat/S', 'Q6F8aNo1rC46WMzpUQm3S53Cn8Ri9YwwCm4PsyMK7lXm4JL2Nrs3aD0SpoJ1', 1, '2019-09-24 18:20:28', '2019-09-24 18:20:28'),
(2, 'lenus', 'lenus.bangaloreads@gmail.com', '$2y$10$BSviUEcfxXCTVEJRppFL4eL4DJMxVJ23Q3yvQPMgDxUfNcGuLaMdW', '2FKequyaXz7Wo33L2lDNC6G1QVUzFBlL1B6op3n7mRHlUkTHuz5pKRDxcr2v', 1, '2019-09-28 14:08:01', '2019-09-28 14:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_category_id` bigint(20) NOT NULL,
  `mobile_brand_id` bigint(20) DEFAULT NULL,
  `mobile_model_id` bigint(20) DEFAULT NULL,
  `paid_access` tinyint(4) NOT NULL,
  `file_type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=> Full URL, 2=> File',
  `description` text COLLATE utf8mb4_unicode_ci,
  `file_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `title`, `slug`, `file_category_id`, `mobile_brand_id`, `mobile_model_id`, `paid_access`, `file_type`, `description`, `file_link`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Smart Phones', 'smart-phones', 2, 1, 1, 0, '1', '<p>Download the Samsung firmware for the Galaxy A7 SM-A750FN with product code TPL from Poland (T-mobile). This firmware has version number PDA A750FNXXU1BSE3 and CSC A750FNODX1BSD2. The operating system of this firmware is Android 9 , with build date Tue, 21 May 2019 09:56:07 +0000. Security patch date is 2019-04-01, with changelist 15516145.</p>', 'https://jigsawcambs.org/images/step%20by%20step%20guide%20to%20dumpy%20level%20survey.pdf', '1568476394.png', '2019-09-12 18:49:15', '2019-10-03 07:52:11'),
(2, 'samsung file', 'samsung-file', 3, 1, 5, 0, '2', '<p>Download the Samsung firmware for the Galaxy A7 SM-A750FN with product code TPL from Poland (T-mobile). This firmware has version number PDA A750FNXXU1BSE3 and CSC A750FNODX1BSD2. The operating system of this firmware is Android 9 , with build date Tue, 21 May 2019 09:56:07 +0000. Security patch date is 2019-04-01, with changelist 15516145.</p>', '1568314211-1747015424.pdf', '1568476413.png', '2019-09-12 18:50:11', '2019-09-25 07:13:09'),
(4, 'apple 11 OS', 'apple-11-os', 6, 2, 6, 1, '1', '<p>&nbsp;</p>\r\n\r\n<p>Complete disassembly/ teardown of Lenovo Vibe k5, Model A6020A46 plus and how to change display, PCB cleaning and assembly. About Repair My Mobile: We provide ultimate solution to repair your mobile/tablets. We also provide online/offline training (Software/Hardware) to the technician without any boundaries. We have trained mobile Engineers all around the Globe to resolve any mobile/tablet related technical issue. Learning has been made easier through our video tutorials and you can also access free firmware, Flash tools and drivers. Our networking has been widespread through which we assist users with mobile spare parts and Shopkeeper recommendation in your city to get your gadgets repaired easily. For more details please click here <a href=\"https://www.youtube.com/redirect?redir_token=d2VQ2234jJnIBQnWeVBLrL9qrIh8MTU2OTQ4MTM2NUAxNTY5Mzk0OTY1&amp;q=http%3A%2F%2Frepairmymobile.in%2F&amp;v=JDT6ULWKXQ8&amp;event=video_description\" target=\"_blank\">http://repairmymobile.in/</a> You can also reach us through: Mobile no: +91-830-831-7248 Whatsapp no: +91-773-946-9263 For more updates, subscribe to our YouTube Channel: <a href=\"https://www.youtube.com/redirect?redir_token=d2VQ2234jJnIBQnWeVBLrL9qrIh8MTU2OTQ4MTM2NUAxNTY5Mzk0OTY1&amp;q=https%3A%2F%2Fgoo.gl%2Flgt1bE&amp;v=JDT6ULWKXQ8&amp;event=video_description\" target=\"_blank\">https://goo.gl/lgt1bE</a> You can also follow us on: Facebook: <a href=\"https://www.youtube.com/redirect?redir_token=d2VQ2234jJnIBQnWeVBLrL9qrIh8MTU2OTQ4MTM2NUAxNTY5Mzk0OTY1&amp;q=https%3A%2F%2Fwww.facebook.com%2FRepairMyMobile.in%2F&amp;v=JDT6ULWKXQ8&amp;event=video_description\" target=\"_blank\">https://www.facebook.com/RepairMyMobi...</a> Twitter: <a href=\"https://www.youtube.com/redirect?redir_token=d2VQ2234jJnIBQnWeVBLrL9qrIh8MTU2OTQ4MTM2NUAxNTY5Mzk0OTY1&amp;q=https%3A%2F%2Ftwitter.com%2FRepairMy_Mobile&amp;v=JDT6ULWKXQ8&amp;event=video_description\" target=\"_blank\">https://twitter.com/RepairMy_Mobile</a></p>', 'https://www.mediafire.com/file/god2k74p9lwoso3/COMBINATION_FAC_FA80_A605GDXU2ARF1_Repairmymobile.rar/file', '1569395531.JPG', '2019-09-25 07:12:12', '2019-09-25 07:12:12'),
(5, 'apple test', 'apple-test', 2, 5, 7, 0, '2', '<p>test</p>', '1571668496-946650210.jpg', '1571668496.jpg', '2019-10-21 14:34:56', '2020-01-22 14:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `file_categories`
--

CREATE TABLE `file_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_categories`
--

INSERT INTO `file_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Samsung Files', '2019-09-12 18:46:04', '2019-09-12 18:46:04'),
(3, 'Safety & Security', '2019-09-12 18:46:13', '2019-09-12 18:46:13'),
(4, 'PAC Files', '2019-09-12 18:46:22', '2019-09-12 18:46:22'),
(6, 'apple', '2019-09-25 07:09:40', '2019-09-25 07:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_09_05_160807_create_admins_table', 1),
(4, '2019_09_05_160808_create_admin_password_resets_table', 1),
(5, '2019_09_05_161627_create_video_categories_table', 1),
(6, '2019_09_05_182333_create_training_videos_table', 1),
(12, '2019_09_07_062956_create_file_categories_table', 2),
(13, '2019_09_10_151447_create_files_table', 2),
(14, '2019_09_10_154737_create_mobile_brands_table', 2),
(15, '2019_09_10_160233_create_mobile_models_table', 2),
(16, '2019_09_10_163502_create_mobile_issues_table', 2),
(17, '2019_09_12_194114_create_repairing_quotations_table', 3),
(19, '2019_09_14_073749_create_mobile_model_images', 4),
(20, '2014_10_12_000000_create_users_table', 5),
(21, '2019_09_14_161055_create_user_password_resets_table', 5),
(22, '2019_09_14_163803_create_users_verify_numbers_table', 5),
(23, '2019_09_16_162739_create_post_categories_table', 6),
(24, '2019_09_16_164923_create_posts_table', 6),
(25, '2019_09_18_145031_create_sells_table', 7),
(26, '2019_09_18_145032_create_sell_password_resets_table', 7),
(29, '2019_09_18_171057_create_sell_categories_table', 8),
(30, '2019_09_18_171236_create_sell_locations_table', 8),
(31, '2019_09_19_154422_create_sell_products_table', 9),
(32, '2019_09_19_170026_create_sell_product_images_table', 9),
(33, '2019_09_21_124039_create_ewastes_table', 10),
(34, '2019_09_21_124040_create_ewaste_password_resets_table', 10),
(35, '2019_09_21_152259_alert_user_and_post_table', 10),
(36, '2019_09_22_133418_ewaste_categories', 11),
(37, '2019_09_14_073716_create_mobile_model_labels', 12),
(38, '2019_09_23_162918_create_mobile_feature_labels_table', 12),
(39, '2019_09_24_161602_add_ewaste_products_table', 13),
(40, '2019_09_24_162000_add_ewaste_product_images_table', 13),
(41, '2019_09_29_190137_alter_all_login_users_table', 14),
(42, '2019_10_12_080949_add_premium_expiry_date_users_table', 15),
(43, '2019_10_12_081927_create_subscription_users_table', 15),
(44, '2019_10_12_111148_alter_user_and_seller_products_table', 16),
(45, '2019_10_18_185854_create_premium_today_files_table', 17),
(46, '2019_10_26_122523_add_normal_password_table_users', 18),
(47, '2019_10_29_122530_add_address_columns_repair_quototation_table', 19),
(48, '2019_10_29_125543_add_repair_quotation_amounts_table', 19),
(49, '2019_11_02_114405_add_pincode_column_sel_products_table', 20),
(50, '2019_11_23_134102_add_city_column_sell_products_table', 21);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_brands`
--

CREATE TABLE `mobile_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_brands`
--

INSERT INTO `mobile_brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'RedMi', '2019-09-12 18:46:38', '2019-09-12 18:46:38'),
(2, 'Samsung', '2019-09-12 18:46:48', '2019-09-12 18:46:48'),
(3, 'Vivo', '2019-09-12 18:46:54', '2019-09-12 18:46:54'),
(4, 'Jio', '2019-09-13 06:08:00', '2019-09-13 06:08:00'),
(5, 'test', '2019-10-21 14:09:29', '2019-10-21 14:09:29');

-- --------------------------------------------------------

--
-- Table structure for table `mobile_feature_labels`
--

CREATE TABLE `mobile_feature_labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_feature_labels`
--

INSERT INTO `mobile_feature_labels` (`id`, `label_name`, `created_at`, `updated_at`) VALUES
(1, 'Price', '2019-09-23 17:31:53', '2019-09-23 17:31:53'),
(2, 'OS', '2019-09-23 17:31:59', '2019-09-23 17:31:59'),
(3, 'Screen Size', '2019-09-23 17:32:07', '2019-09-23 17:32:07'),
(4, 'Network', '2019-09-26 17:19:10', '2019-09-26 17:19:10'),
(5, 'processor', '2019-09-26 17:19:23', '2019-09-26 17:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `mobile_issues`
--

CREATE TABLE `mobile_issues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_issues`
--

INSERT INTO `mobile_issues` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Screen Damage', '2019-09-12 20:35:29', '2019-09-12 20:35:29'),
(2, 'FRP lock', '2019-09-13 06:07:50', '2019-09-13 06:07:50'),
(3, 'Liquid damage', '2019-09-17 10:28:13', '2019-09-17 10:28:13'),
(5, 'Battery/ Charging', '2019-10-20 05:51:31', '2019-10-20 05:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `mobile_models`
--

CREATE TABLE `mobile_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_brand_id` bigint(20) NOT NULL,
  `screen_size` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_models`
--

INSERT INTO `mobile_models` (`id`, `name`, `mobile_brand_id`, `screen_size`, `price`, `os`, `description`, `created_at`, `updated_at`) VALUES
(1, '1 plus', 1, '900 x 700', '5000', 'Bada', 'Download the Samsung firmware for the Galaxy A7 SM-A750FN with product code TPL from Poland (T-mobile). This firmware has version number PDA A750FNXXU1BSE3 and CSC A750FNODX1BSD2. The operating system of this firmware is Android 9 , with build date Tue, 21 May 2019 09:56:07 +0000. Security patch date is 2019-04-01, with changelist 15516145.', '2019-09-12 18:47:17', '2019-09-14 15:52:16'),
(2, 'j1', 2, '900 x 700', '4000', 'Bada', 'Download the Samsung firmware for the Galaxy A7 SM-A750FN with product code TPL from Poland (T-mobile). This firmware has version number PDA A750FNXXU1BSE3 and CSC A750FNODX1BSD2. The operating system of this firmware is Android 9 , with build date Tue, 21 May 2019 09:56:07 +0000. Security patch date is 2019-04-01, with changelist 15516145.', '2019-09-12 18:47:33', '2019-09-14 15:52:44'),
(4, 'Gareth Bradley', 2, '900 x 700', '4000', 'Bada', NULL, '2019-09-16 15:03:32', '2019-09-16 15:03:32'),
(5, 'iphone 11', 1, '54', '43', 'android', NULL, '2019-09-18 06:55:34', '2019-09-18 06:55:34'),
(6, 'ss', 2, 'sf', 'sf', 'sf', NULL, '2019-09-19 06:41:29', '2019-09-19 06:41:29'),
(7, 'test', 5, NULL, NULL, NULL, NULL, '2019-10-21 14:11:08', '2019-10-21 14:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `mobile_model_images`
--

CREATE TABLE `mobile_model_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_id` bigint(20) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_model_images`
--

INSERT INTO `mobile_model_images` (`id`, `model_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '1568476336-630382616.png', '2019-09-14 15:52:16', '2019-09-14 15:52:16'),
(2, 1, '1568476339-60001874.png', '2019-09-14 15:52:19', '2019-09-14 15:52:19'),
(3, 2, '1568476364-963941626.png', '2019-09-14 15:52:44', '2019-09-14 15:52:44'),
(4, 6, '1568875289-510414389.JPG', '2019-09-19 06:41:29', '2019-09-19 06:41:29'),
(5, 6, '1568875289-1872517497.JPG', '2019-09-19 06:41:29', '2019-09-19 06:41:29'),
(6, 7, '1571667068-127394555.jpg', '2019-10-21 14:11:08', '2019-10-21 14:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `mobile_model_labels`
--

CREATE TABLE `mobile_model_labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_id` bigint(20) NOT NULL,
  `label_id` bigint(20) NOT NULL,
  `label_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_model_labels`
--

INSERT INTO `mobile_model_labels` (`id`, `model_id`, `label_id`, `label_value`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '5000', '2019-09-23 17:32:29', '2019-09-23 17:32:29'),
(2, 1, 2, 'Bada Os', '2019-09-23 17:32:29', '2019-09-23 17:32:29'),
(3, 1, 3, 'N/A', '2019-09-23 17:32:29', '2019-09-23 17:32:29'),
(4, 7, 1, '4566', '2019-10-21 14:11:08', '2019-10-21 14:11:08'),
(5, 7, 2, 'test', '2019-10-21 14:11:08', '2019-10-21 14:11:08'),
(6, 7, 3, 'N/A', '2019-10-21 14:11:08', '2019-10-21 14:11:08'),
(7, 7, 4, '4g lte', '2019-10-21 14:11:08', '2019-10-21 14:11:08'),
(8, 7, 5, 'test', '2019-10-21 14:11:08', '2019-10-21 14:11:08');

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

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mlenus16@gmail.com', '$2y$10$KKJhk3g/QHkeFv16SkXAV.CKxuAJcjAwDf/sXbuwIegS9CYWQfBZu', '2019-10-12 05:01:41'),
('mlenus16@gmail.com', '$2y$10$KKJhk3g/QHkeFv16SkXAV.CKxuAJcjAwDf/sXbuwIegS9CYWQfBZu', '2019-10-12 05:01:41'),
('mlenus16@gmail.com', '$2y$10$KKJhk3g/QHkeFv16SkXAV.CKxuAJcjAwDf/sXbuwIegS9CYWQfBZu', '2019-10-12 05:01:41'),
('mlenus16@gmail.com', '$2y$10$KKJhk3g/QHkeFv16SkXAV.CKxuAJcjAwDf/sXbuwIegS9CYWQfBZu', '2019-10-12 05:01:41'),
('subhashsirdar@gmail.com', '$2y$10$n6hVdoce0oOOD33sDWwH5OJ5QYqgSlP6TYZa..PasW5d7cRLwy4Ye', '2020-03-04 07:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `posted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_type` enum('job','resume','others') COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=> New , 2=> Publish, 3 => Unpublish',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Vehicle', '2019-09-16 18:47:23', '2019-09-16 18:47:23'),
(2, 'Jobs', '2019-09-17 10:28:40', '2019-09-17 10:28:40'),
(3, 'Buy / Sell', '2019-09-17 10:28:51', '2019-09-17 10:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `premium_today_files`
--

CREATE TABLE `premium_today_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `files_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repairing_quotations`
--

CREATE TABLE `repairing_quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issues_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `repairing_quotations`
--

INSERT INTO `repairing_quotations` (`id`, `model_no`, `mobile_company`, `issues_id`, `name`, `mobile_number`, `email`, `address`, `postal_code`, `city`, `state`, `address_line1`, `address_line2`, `landmark`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cph1809', 'Oppo', '\"FRP lock\"', 'Raushan kumar', '7427909325', 'rr7758452@gmail.com', '734301', NULL, 'Kalimpong', 'Kalimpong', 'Kalimpong', 'Kalimpong', 'Kalimpong', NULL, NULL, 1, '2020-02-20 19:30:22', '2020-02-20 19:30:22'),
(2, 'Realme2', 'Realme2', '\"FRP lock\"', 'Ranjan munda', '6379004677', 'ranjankumar21130@gmail.com', 'Maidanikela', NULL, 'Kendujhar', 'ଭାରତ', 'Dhudurupal', 'Khajuri nalua', 'Panikoili', 21.66441250, 85.71902760, 1, '2020-02-29 16:41:35', '2020-02-29 16:41:35');

-- --------------------------------------------------------

--
-- Table structure for table `repair_quotation_amounts`
--

CREATE TABLE `repair_quotation_amounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `quotation_id` bigint(20) NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_latitude` double(15,8) DEFAULT NULL,
  `shop_longitude` double(15,8) DEFAULT NULL,
  `photos1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sellers_password_resets`
--

CREATE TABLE `sellers_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_categories`
--

CREATE TABLE `sell_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sell_categories`
--

INSERT INTO `sell_categories` (`id`, `name`, `slug`, `image`, `icon_image`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'IC', 'ic', '1582706646-19156546.jpg', '1582706646-247939990.jpg', NULL, '2019-09-25 07:39:08', '2020-02-26 08:44:06'),
(3, 'Display', 'display', '1582706285-153162496.jpg', '1582706285-1939725964.jpg', NULL, '2019-09-25 07:41:13', '2020-02-26 08:38:05'),
(4, 'Back Cover', 'back cover', '1582706172-1665295996.jpg', '1582706172-619378279.jpg', NULL, '2019-10-22 07:12:14', '2020-02-26 08:36:12'),
(5, 'Battery', 'battery', '1582706087-715179484.jpg', '1582706087-1024155366.jpg', NULL, '2019-10-22 07:14:48', '2020-02-26 08:34:47'),
(6, 'Combo', 'combo', '1582705771-555732218.jpg', '1582705771-463259176.jpg', NULL, '2019-10-22 07:17:31', '2020-02-26 08:29:31'),
(7, 'Head Phone', 'head phone', '1582705693-26739759.jpg', '1582705694-616841584.jpg', NULL, '2019-10-22 07:34:01', '2020-02-26 08:28:14'),
(8, 'BT Headphone', 'bt headphone', '1582705606-1487983233.jpg', '1582705606-415335360.jpg', NULL, '2019-10-22 07:37:37', '2020-02-26 08:26:46'),
(9, 'Soldering Iron', 'soldering iron', '1582705455-446198987.png', '1582705455-507347832.png', NULL, '2019-10-23 09:32:16', '2020-02-26 08:24:15'),
(10, 'Usb Speaker', 'usb speaker', '1582704882-1967374307.jpg', '1582704882-1551407161.jpg', NULL, '2019-10-23 09:54:49', '2020-02-26 08:14:42'),
(11, 'Usb Cable', 'usb cable', '1582704442-480770089.png', '1582704442-1031169853.png', NULL, '2019-10-24 10:53:08', '2020-02-26 08:07:23'),
(12, 'Usb Charger', 'usb charger', '1582705911-278983157.png', '1582705911-251069242.png', NULL, '2019-10-24 11:01:34', '2020-02-26 08:31:51'),
(13, 'Flip Cover', 'flip cover', '1582704073-1326326502.png', '1582704073-1067844667.png', NULL, '2019-10-24 11:22:57', '2020-02-26 08:01:13'),
(14, 'Pen drive', 'pen drive', '1582705066-1699053063.png', '1582705066-1997891803.png', NULL, '2019-10-24 11:59:21', '2020-02-26 08:17:47'),
(15, 'Power Bank', 'power bank', '1582703748-996286766.jpg', '1582703748-2121764196.jpg', NULL, '2019-10-24 12:07:11', '2020-02-26 07:55:48'),
(16, 'Flash Box', 'flash box', '1582706884-462769608.png', '1582706884-688054467.png', NULL, '2019-10-31 06:19:35', '2020-02-26 08:48:04'),
(17, 'Tools', 'tools', '1582706989-2081655639.jpg', '1582706989-540233598.jpg', NULL, '2020-02-23 07:15:22', '2020-02-26 08:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `sell_locations`
--

CREATE TABLE `sell_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_products`
--

CREATE TABLE `sell_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `sell_category_id` bigint(20) NOT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brands` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `user_product_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sell_products`
--

INSERT INTO `sell_products` (`id`, `title`, `slug`, `seller_id`, `sell_category_id`, `latitude`, `longitude`, `postal_code`, `city`, `model`, `brands`, `no_of_item`, `price`, `description`, `image`, `active`, `user_product_active`, `created_at`, `updated_at`) VALUES
(169, 'UFI Box', 'ufi box', 22, 16, 25.61553520, 85.16089850, '800004', 'Patna', 'UFI India', 'UFI', NULL, 17000, 'UFi Box is a powerful EMMC Service Tool that can Read EMMC user data, as well as repair, resize, format, erase, read write and update the firmware on EMMC in Samsung, china phone SK Hynix, Toshiba, Kingston, micron, and other brands.\r\n\r\nUFi Box is a tool to repair phones with the ability to: \r\n\r\n    Repair EMMC\r\n    Resize EMMC\r\n    Format EMMC\r\n    Write full data, erase fully\r\n    Read boot1\r\n    Read boot2\r\n    Read EXT CSD\r\n    Read User Data\r\n    Update firmware\r\n    Via test point', 'empty', 1, 1, '2019-12-28 10:11:45', '2020-03-04 06:17:37'),
(170, 'UMT Dongle', 'umt dongle', 22, 16, 25.61553520, 85.16089850, '800004', 'Patna', 'UMT', 'UMT', NULL, 3200, 'UMT is one of the Dongle used to reset FRP in Samsung Latest Phones. Most of them can be unlocked directly by selecting the New method in the tool. While some of the latest Android version like: Nougat & Oreo can be unlocked by enabling ADB either Flashing through combination files or using Talk back method. \r\nUMT Dongle now requires activation, after 1 year of use. You can install updates which have been rolled out for the product.', 'empty', 1, 1, '2019-12-29 06:43:35', '2020-03-04 06:17:37'),
(171, 'Miracle Flash Box', 'miracle flash box', 22, 16, 25.61553520, 85.16089850, '800004', 'Patna', 'Miracle', 'Miracle', NULL, 8500, 'Miracle Box based on china mobile repair tools , it is first fuzzy logic technology. This Device have so many unique feature which make it different from other Software.\r\n\r\nUsed for-\r\nMTK : FRP, Flash, Read Pattern, Format, Privacy Lock, Read File.\r\nSPD:  FRP, Flash, Read Pattern, Format, Privacy Lock, Read File.\r\nQualcomm: FRP, Flash, Read Pattern, Format, Privacy Lock, Read File.\r\nSupport Mi account unlock, Vivo Demo Unlock, Moto Frp.\r\nWeight-0.5 Kg', 'empty', 1, 1, '2019-12-29 06:49:13', '2020-03-04 06:17:37'),
(172, 'Miracle Thunder Dongle', 'miracle thunder dongle', 22, 16, 25.61553520, 85.16089850, '800004', 'Patna', 'Miracle', 'Miracle Thunder', NULL, 6500, 'Miracle Thunder Red is launched exclusively for Indian Market.\r\n\r\nIt has been launched in two variants Green & Red.\r\n\r\nIf you had been using Green one in India, it can be blocked anytime.\r\n\r\nMiracle thunder has been powered with EMMC solution and supports MTK, SPD & Qualcomm Devices.\r\n\r\nIt does not require Miracle Box and is a perfect substitute. With Launch of FRP tool v1.31, Free FRP tool has been discontinued. Now, it has to be activated separately.', 'empty', 1, 1, '2019-12-29 06:51:08', '2020-03-04 06:17:37'),
(173, 'Miracle Box License Activation', 'miracle box license activation', 22, 16, 25.61553520, 85.16089850, '800004', 'Patna', 'Miracle', 'Miracle', NULL, 1900, 'Miracle Box Renewal is done after the period of 1 years and it can be renew for the Time interval of 1 Year.\r\n\r\nRequirements: Miracle dongle Serial No.\r\n\r\nAmount: Rs. 1900\r\n\r\nTime Taken for Activation: 5 min\r\n\r\nNote: If the Server is down, then it will take more time to activation.', 'empty', 1, 1, '2019-12-29 06:53:56', '2020-03-04 06:17:37'),
(174, 'MRT Dongle', 'mrt dongle', 22, 16, 25.61553520, 85.16089850, '800004', 'Patna', 'MRT', 'MRT', NULL, 4500, 'MRT Dongle is a Powerful tool which support FRP, Flash, Password Reset, Mi Account, Bootloader Unlock etc.\r\n\r\nSupports:\r\n\r\nVivo\r\nOppo\r\nMeizu\r\nCoolpad\r\nHuawei\r\nMTK', 'empty', 1, 1, '2019-12-29 06:56:32', '2020-03-04 06:17:37'),
(175, 'Infinity CM2 Dongle', 'infinity cm2 dongle', 22, 16, 25.61553520, 85.16089850, '800004', 'Patna', 'Infinity', 'Infinity', NULL, 4700, 'Infinity Chinese Miracle dongle is used to repair Software problem of Chinese Phones.\r\n\r\nUsed for-\r\nCard Reader\r\nMTK\r\nSPD\r\nCoolsand\r\nRockchip\r\nRKT\r\nMOTO\r\nNo box required\r\nInfinity CM2 Dongle lowest price in India', 'empty', 1, 1, '2019-12-29 06:58:46', '2020-03-04 06:17:37'),
(176, 'Nokia phone Display', 'nokia phone display', 23, 3, 22.53173910, 88.31961810, '700023', 'kolkata', 'Nokia 5', 'Orignal 100%', NULL, 1700, 'This product is 100% original .whatsapp or call us for more detail.', 'empty', 1, 1, '2019-12-30 05:52:56', '2019-12-31 07:27:18'),
(177, 'Nokia phone Display', 'nokia phone display-2', 23, 3, 22.53173910, 88.31961810, '700023', 'kolkata', 'Nokia 6', 'Orignal 100%', NULL, 1650, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 05:54:50', '2019-12-31 07:38:18'),
(178, 'Nokia phone Display', 'nokia phone display-2', 23, 3, 22.53173910, 88.31961810, '700023', 'kolkata', 'Nokia 8', 'Orignal 100%', NULL, 1800, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 06:21:22', '2019-12-31 07:38:40'),
(179, 'Nokia phone Display', 'nokia phone display-2', 23, 3, 22.53173910, 88.31961810, '700023', 'kolkata', 'Nokia 3.1', 'Nokia', NULL, 1200, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 06:36:42', '2019-12-31 07:39:29'),
(180, 'Nokia phone Display', 'nokia phone display-2', 23, 3, 22.53173910, 88.31961810, '700023', 'kolkata', 'Nokia 2.1', 'Nokia', NULL, 1200, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 06:51:45', '2019-12-31 07:39:33'),
(181, 'Lenovo Phone Display', 'lenovo phone display', 23, 3, 22.53173910, 88.31961810, '700023', 'kolkata', 'Lenovo 6020A40', 'Lenovo', NULL, 800, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 09:17:46', '2019-12-31 07:39:36'),
(182, 'Oppo Phone Display', 'oppo phone display', 23, 3, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo A37', 'Oppo', NULL, 800, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 09:18:47', '2019-12-31 07:39:40'),
(183, 'Oppo Phone Display', 'oppo phone display-2', 23, 3, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo 71', 'Oppo', NULL, 1400, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 09:19:51', '2019-12-31 07:39:45'),
(184, 'Oppo Phone Display', 'oppo phone display-2', 23, 3, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo F9', 'Oppo', NULL, 1800, 'this is 100% original product .for more detail call or whatsapp us.And supported in f9/f9pro/Realme 2 pro', 'empty', 1, 1, '2019-12-30 09:22:28', '2019-12-31 07:39:49'),
(185, 'Oppo Phone Display', 'oppo phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo F9 Pro', 'Oppo', NULL, 1800, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 09:23:54', '2019-12-31 07:39:55'),
(186, 'Apple Phone Combo', 'apple phone combo', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'iPhone 7g', 'Apple', NULL, 1400, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 09:25:56', '2019-12-31 07:40:00'),
(187, 'Samsung Phone Display', 'samsung phone display', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung', 'Samsung j4 plus', NULL, 2000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 09:32:40', '2019-12-31 07:40:04'),
(188, 'Vivo Mobile Display', 'vivo mobile display', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo y53', 'Vivo', NULL, 1800, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 09:44:33', '2019-12-31 07:40:10'),
(189, 'Redmi Phone Display', 'redmi phone display', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 4a', 'Redmi Mi', NULL, 1300, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 09:46:59', '2019-12-31 07:40:58'),
(190, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 4x', 'Redmi Mi', NULL, 1300, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 10:08:13', '2019-12-31 07:41:01'),
(191, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 5', 'Redmi Mi', NULL, 2200, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 10:09:55', '2019-12-31 07:41:05'),
(192, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 6& 6a', 'Redmi Mi', NULL, 1300, 'this is 100% original product .for more detail call or whatsapp us.this folder supported on mi 6 & 6a both model', 'empty', 1, 1, '2019-12-30 10:12:11', '2019-12-31 07:41:09'),
(193, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 7a', 'Redmi Mi', NULL, 1700, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 10:13:30', '2019-12-31 07:41:14'),
(194, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi note 3', 'Redmi Mi', NULL, 1400, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 10:14:46', '2019-12-31 07:41:17'),
(195, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi Note 4x', 'Redmi Mi', NULL, 1800, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 10:16:07', '2019-12-31 07:41:21'),
(196, 'Motorola Phone Display', 'motorola phone display', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Moto c Plus', 'Motorola', NULL, 1500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 10:17:40', '2019-12-31 07:41:25'),
(197, 'Motorola Phone Display', 'motorola phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Moto E3', 'Motorola', NULL, 1400, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 10:18:53', '2019-12-31 07:41:29'),
(198, 'Motorola Phone Display', 'motorola phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Moto G3', 'Motorola', NULL, 1200, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 10:26:02', '2019-12-31 07:41:33'),
(199, 'Huawei Phone Display', 'huawei phone display', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Honor P8 Lite', 'Huawei', NULL, 1400, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 10:29:48', '2019-12-31 07:41:54'),
(200, 'Realme Phone display', 'realme phone display', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Realme 2 Pro', 'Realme', NULL, 1900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 10:31:38', '2019-12-31 07:41:58'),
(201, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo V7 Plus', 'Vivo', NULL, 1500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 11:30:07', '2019-12-31 07:42:02'),
(202, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo y71', 'Vivo', NULL, 2000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 11:31:02', '2019-12-31 07:42:06'),
(203, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo y81&83', 'Vivo', NULL, 1700, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 11:32:04', '2019-12-31 07:42:10'),
(204, 'v', 'v', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo y55', 'Vivo', NULL, 1200, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 11:33:05', '2019-12-31 07:42:14'),
(205, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo y93', 'Vivo', NULL, 1700, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 11:33:55', '2019-12-31 07:42:18'),
(206, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'J250f', 'Samsung', NULL, 1500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 11:36:01', '2019-12-31 07:42:22'),
(207, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung j210f', 'Samsung', NULL, 1200, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 11:38:00', '2019-12-31 07:42:26'),
(208, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'vivo y51', 'Vivo', NULL, 1500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 11:42:25', '2019-12-31 07:42:30'),
(209, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'j5', 'Samsung', NULL, 1700, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 11:43:08', '2019-12-31 07:42:46'),
(210, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'j5 prime', 'Samsung', NULL, 2000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 11:43:57', '2019-12-31 07:42:48'),
(211, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'j710f', 'Samsung', NULL, 1400, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 11:44:50', '2019-12-31 07:42:52'),
(212, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'j8', 'Samsung', NULL, 1900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 11:45:36', '2019-12-31 07:42:55'),
(213, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'j210f', 'Samsung', NULL, 1100, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-30 11:46:11', '2019-12-31 07:42:58'),
(214, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung A5', 'Samsung', NULL, 1300, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 07:56:44', '2019-12-31 12:08:11'),
(215, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo Y91', 'Vivo', NULL, 2500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:30:46', '2019-12-31 12:08:13'),
(216, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo Y69', 'Vivo', NULL, 2000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:32:10', '2019-12-31 12:08:16'),
(217, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo y66', 'Vivo', NULL, 2000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:32:58', '2019-12-31 12:08:18'),
(218, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo y55', 'Vivo', NULL, 2000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:35:06', '2019-12-31 12:08:21'),
(219, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo y53', 'Vivo', NULL, 1900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:35:46', '2019-12-31 11:37:43'),
(220, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'vivo y19', 'Vivo', NULL, 1400, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:36:34', '2019-12-31 11:37:46'),
(221, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo S1', 'Vivo', NULL, 5500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:37:23', '2019-12-31 11:37:52'),
(222, 'Oppo Phone Display', 'oppo phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo F11', 'Oppo', NULL, 3400, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:38:20', '2019-12-31 11:37:57'),
(223, 'Oppo Phone Display', 'oppo phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo Neo 7', 'Oppo', NULL, 1100, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:39:22', '2019-12-31 11:38:00'),
(224, 'Oppo Phone Display', 'oppo phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo Neo 5', 'Oppo', NULL, 900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:43:00', '2019-12-31 11:38:04'),
(225, 'Oppo Phone Display', 'oppo phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo A9 2020', 'Oppo', NULL, 3400, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:44:22', '2019-12-31 11:38:07'),
(226, 'Oppo Phone Display', 'oppo phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo A57', 'Oppo', NULL, 2000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:45:15', '2019-12-31 11:38:11'),
(227, 'Oppo Phone Display', 'oppo phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo A37', 'Oppo', NULL, 1200, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:47:38', '2019-12-31 11:38:14'),
(228, 'Oppo Phone Display', 'oppo phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo F7', 'Oppo', NULL, 2200, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:48:58', '2019-12-31 11:38:18'),
(229, 'Oppo Phone Display', 'oppo phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo F3 plus', 'Oppo', NULL, 1100, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:49:56', '2019-12-31 12:03:38'),
(230, 'Oppo Phone Display', 'oppo phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo F3 plus', 'Oppo', NULL, 2500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:51:01', '2019-12-31 12:03:41'),
(231, 'Oppo Phone Display', 'oppo phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Oppo F1s', 'Oppo', NULL, 1100, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:51:53', '2019-12-31 12:03:44'),
(232, 'Real me Display', 'real me display', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Real me XT', 'Realme', NULL, 1900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:53:11', '2019-12-31 12:03:47'),
(233, 'Realme Phone display', 'realme phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Real me 5', 'Realme', NULL, 4500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:54:27', '2019-12-31 12:03:50'),
(234, 'Realme Phone display', 'realme phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Real me 2', 'Realme', NULL, 1900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:55:24', '2019-12-31 12:03:54'),
(235, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi note 8 Pro', 'Redmi Mi', NULL, 1400, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:58:24', '2019-12-31 12:03:58'),
(236, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi note 8', 'Redmi Mi', NULL, 1400, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 09:59:43', '2019-12-31 12:04:01'),
(237, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi note 5 Pro', 'Redmi Mi', NULL, 2000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:00:52', '2019-12-31 12:04:05'),
(238, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi note 4', 'Redmi Mi', NULL, 1200, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:01:38', '2019-12-31 12:04:08'),
(239, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 8a', 'Redmi Mi', NULL, 2000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:02:33', '2019-12-31 12:04:29'),
(240, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 8', 'Redmi Mi', NULL, 1900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:06:58', '2019-12-31 12:04:32'),
(241, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 7a', 'Redmi Mi', NULL, 1400, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:08:21', '2019-12-31 12:04:34'),
(242, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 7', 'Redmi Mi', NULL, 1600, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:08:58', '2019-12-31 12:04:37'),
(243, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 6 Pro', 'Redmi Mi', NULL, 1800, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:09:56', '2019-12-31 12:04:40'),
(244, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 6& 6a', 'Redmi Mi', NULL, 2500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:10:54', '2019-12-31 12:04:43'),
(245, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 5a', 'Redmi Mi', NULL, 800, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:14:44', '2019-12-31 12:04:45'),
(246, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 4a', 'Redmi Mi', NULL, 1300, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:16:26', '2019-12-31 12:04:49'),
(247, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 4i', 'Redmi Mi', NULL, 1100, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:17:12', '2019-12-31 12:04:52'),
(248, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 3s', 'Redmi Mi', NULL, 1100, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:18:14', '2019-12-31 12:04:55'),
(249, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 1S', 'Redmi Mi', NULL, 900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:19:01', '2019-12-31 12:05:14'),
(250, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung A9 Star', 'Samsung', NULL, 2000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:20:29', '2019-12-31 12:05:16'),
(251, 'Sony Experia Phone Display', 'sony experia phone display', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Sony Experia Z5', 'Sony Experia', NULL, 1500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:22:21', '2019-12-31 12:05:19'),
(252, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung Z4', 'Redmi Mi', NULL, 1600, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:23:30', '2019-12-31 12:05:21'),
(253, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung s3', 'Samsung', NULL, 1300, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:29:11', '2019-12-31 12:05:24'),
(254, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung G530H', 'Samsung', NULL, 1200, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:30:10', '2019-12-31 12:05:27'),
(255, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung C7 pro', 'Samsung', NULL, 1900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:30:59', '2019-12-31 12:05:30'),
(256, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung E5', 'Samsung', NULL, 1100, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:31:42', '2019-12-31 12:05:34'),
(257, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung A5', 'Samsung', NULL, 1600, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:32:33', '2019-12-31 12:05:36'),
(258, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung On7', 'Samsung', NULL, 1900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:33:19', '2019-12-31 12:05:40'),
(259, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung On5', 'Samsung', NULL, 1900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:34:04', '2019-12-31 12:06:04'),
(260, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung A50', 'Samsung', NULL, 3500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:34:54', '2019-12-31 12:06:07'),
(261, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung A30', 'Samsung', NULL, 3500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:40:57', '2019-12-31 12:06:09'),
(262, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung A20s', 'Samsung', NULL, 1900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:52:36', '2019-12-31 12:06:11'),
(263, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung A20', 'Samsung', NULL, 2300, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:53:17', '2019-12-31 12:06:14'),
(264, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung A10', 'Samsung', NULL, 1400, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:54:00', '2019-12-31 12:06:17'),
(265, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung j7 Duo', 'Samsung', NULL, 1000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:54:46', '2019-12-31 12:06:19'),
(266, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung J7 Max', 'Samsung', NULL, 1800, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:55:37', '2019-12-31 12:06:23'),
(267, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung J7 Max', 'Samsung', NULL, 2000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:56:16', '2019-12-31 12:06:26'),
(268, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung J7', 'Samsung', NULL, 1200, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:57:19', '2019-12-31 12:06:29'),
(269, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung J6 Plus', 'Samsung', NULL, 1900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:58:12', '2019-12-31 12:06:50'),
(270, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung J4 Plus', 'Samsung', NULL, 1900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:59:06', '2019-12-31 12:06:53'),
(271, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung J4', 'Samsung', NULL, 1600, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 10:59:50', '2019-12-31 12:06:56'),
(272, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung J2 Core', 'Samsung', NULL, 1100, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:00:39', '2019-12-31 12:06:59'),
(273, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung J2 18', 'Samsung', NULL, 1500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:01:32', '2019-12-31 12:07:01'),
(274, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung J210f', 'Samsung', NULL, 900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:02:38', '2019-12-31 12:07:06'),
(275, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung J2', 'Samsung', NULL, 1300, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:03:39', '2019-12-31 12:07:08'),
(276, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Samsung j1 4g', 'Samsung', NULL, 900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:04:25', '2019-12-31 12:07:13'),
(277, 'Realme Phone display', 'realme phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Real me 1', 'Realme', NULL, 2500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:05:12', '2019-12-31 12:07:16'),
(278, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo y17', 'Vivo', NULL, 3000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:06:00', '2019-12-31 12:07:19'),
(279, 'Samsung Phone Display', 'samsung phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi Y3', 'Samsung', NULL, 2700, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:06:50', '2019-12-31 12:07:32'),
(280, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi Note 6 Pro', 'Redmi Mi', NULL, 2700, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:07:44', '2019-12-31 12:07:35'),
(281, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo Y81', 'Vivo', NULL, 3000, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:08:36', '2019-12-31 12:07:37'),
(282, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo y83', 'Vivo', NULL, 2500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:09:28', '2019-12-31 12:07:40'),
(283, 'Vivo Mobile Display', 'vivo mobile display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Vivo Y83 Pro', 'Vivo', NULL, 2900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:10:10', '2019-12-31 12:07:43'),
(284, 'Realme Phone display', 'realme phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Real me 2 pro', 'Realme', NULL, 1900, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:11:08', '2019-12-31 12:07:46'),
(285, 'Redmi Phone Display', 'redmi phone display-2', 23, 6, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi Y2 Pro', 'Redmi Mi', NULL, 1500, 'this is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2019-12-31 11:12:17', '2019-12-31 12:07:49'),
(286, 'Miracle Box', 'miracle box', 23, 16, 22.53173910, 88.31961810, '700023', 'kolkata', 'China', 'China', NULL, 8500, 'this is 100% original product .for more detail call or whatsapp us.\r\nthis box is use for unlocking mobile and flashing mobile phone', 'empty', 1, 1, '2020-01-02 06:09:23', '2020-01-02 06:52:22'),
(287, 'miracle Thunder dongle', 'miracle thunder dongle-2', 23, 16, 22.53173910, 88.31961810, '700023', 'kolkata', 'China', 'China', NULL, 6500, 'this is 100% original product .for more detail call or whatsapp us.\r\nthis box is use for unlocking mobile and flashing mobile phone', 'empty', 1, 1, '2020-01-02 06:10:28', '2020-01-02 06:52:18'),
(288, 'MRT Dongle', 'mrt dongle-2', 23, 16, 22.53173910, 88.31961810, '700023', 'kolkata', 'China', 'China', NULL, 4200, 'this is 100% original product .for more detail call or whatsapp us.\r\nthis dongle is use for unlocking mobile and flashing mobile phone', 'empty', 1, 1, '2020-01-02 06:11:32', '2020-01-02 06:52:14'),
(289, 'UFI Box', 'ufi box-2', 23, 16, 22.53173910, 88.31961810, '700023', 'kolkata', 'China', 'China', NULL, 17000, 'this is 100% original product .for more detail call or whatsapp us.\r\nthis box is use for unlocking mobile and flashing mobile phone', 'empty', 1, 1, '2020-01-02 06:12:32', '2020-01-02 06:51:46'),
(290, 'Z3x Box', 'z3x box', 23, 16, 22.53173910, 88.31961810, '700023', 'kolkata', 'China', 'China', NULL, 7000, 'this is 100% original product .for more detail call or whatsapp us.this box is used for unlocking and flashing samsung mobile phone.', 'empty', 1, 1, '2020-01-02 06:16:04', '2020-01-02 06:51:49'),
(291, 'UMT Dongle', 'umt dongle-2', 23, 16, 22.53173910, 88.31961810, '700023', 'kolkata', 'China', 'China', NULL, 4200, 'this is 100% original product .for more detail call or whatsapp us.this product is used for unlocking and flashing mobile phones.', 'empty', 1, 1, '2020-01-02 06:22:31', '2020-01-02 06:51:52'),
(292, 'UFI Dongle', 'ufi dongle', 23, 16, 22.53173910, 88.31961810, '700023', 'kolkata', 'China', 'China', NULL, 6500, 'this is 100% original product .for more detail call or whatsapp us.this product is used for unlocking and flashing mobile phones.', 'empty', 1, 1, '2020-01-02 06:46:26', '2020-01-02 06:51:58'),
(293, 'UMT Pro Dongle', 'umt pro dongle', 23, 16, 22.53173910, 88.31961810, '700023', 'kolkata', 'China', 'China', NULL, 4200, 'this is 100% original product .for more detail call or whatsapp us.this product is used for unlocking and flashing mobile phones.', 'empty', 1, 1, '2020-01-02 06:47:17', '2020-01-02 06:52:02'),
(294, 'Infinity CM2 Dongle', 'infinity cm2 dongle-2', 23, 16, 22.53173910, 88.31961810, '700023', 'kolkata', 'China', 'China', NULL, 4700, 'this is 100% original product .for more detail call or whatsapp us.this product is used for unlocking and flashing mobile phones.', 'empty', 1, 1, '2020-01-02 06:47:52', '2020-01-02 06:52:06'),
(295, 'BST Dongle', 'bst dongle', 23, 16, 22.53173910, 88.31961810, '700023', 'kolkata', 'China', 'China', NULL, 4500, 'this is 100% original product .for more detail call or whatsapp us.this product is used for unlocking and flashing mobile phones.', 'empty', 1, 1, '2020-01-02 06:48:28', '2020-01-02 06:52:09'),
(296, 'MT 6328V', 'mt 6328v', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MTK POWER IC', 'MTK', NULL, 210, 'MTK POWER IC\r\nMT 6328V Original', 'empty', 1, 1, '2020-01-02 08:08:22', '2020-01-02 11:29:54'),
(297, 'MT6261DA', 'mt6261da', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MTK POWER IC', 'MTK', NULL, 165, 'MTK POWER IC\r\nMT6261DA Original', 'empty', 1, 1, '2020-01-02 08:09:59', '2020-01-02 11:29:51'),
(298, 'MT6371P', 'mt6371p', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MTK POWER IC', 'MTK', NULL, 275, 'MTK POWER IC\r\nMT6371P', 'empty', 1, 1, '2020-01-02 08:11:29', '2020-01-02 11:29:49'),
(299, 'MT6371P New', 'mt6371p new', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MTK POWER IC', 'MTK', NULL, 295, 'MTK POWER IC\r\nMT6371P', 'empty', 1, 1, '2020-01-02 08:13:07', '2020-01-02 11:30:22'),
(300, 'MT6357V Original', 'mt6357v original', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MTK POWER IC', 'MTK', NULL, 255, 'MTK POWER IC\r\nMT6357V Original', 'empty', 1, 1, '2020-01-02 08:16:10', '2020-01-02 11:30:25'),
(301, 'MT6357V New', 'mt6357v new', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MTK POWER IC', 'MTK', NULL, 205, 'MTK POWER IC\r\nMT6357V New', 'empty', 1, 1, '2020-01-02 08:28:27', '2020-01-02 11:30:27'),
(302, 'MT6331P', 'mt6331p', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MTK POWER IC', 'MTK', NULL, 120, 'MTK POWER IC\r\nMT6331P', 'empty', 1, 1, '2020-01-02 08:30:14', '2020-01-02 11:30:29'),
(303, 'MT6357MRV', 'mt6357mrv', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MTK POWER IC', 'MTK', NULL, 225, 'MTK POWER IC\r\nMT6357MRV', 'empty', 1, 1, '2020-01-02 08:37:47', '2020-01-02 11:30:32'),
(304, 'MT6357CRV', 'mt6357crv', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MTK POWER IC', 'MTK', NULL, 250, 'MTK POWER IC\r\nMT6357CRV', 'empty', 1, 1, '2020-01-02 08:39:07', '2020-01-02 11:30:35'),
(305, 'D6 LIGHT IC', 'd6 light ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Iphone', 'Apple', NULL, 130, 'Iphone \r\nD6 LIGHT IC', 'empty', 1, 1, '2020-01-02 09:12:53', '2020-01-02 11:30:39'),
(306, 'D7 LIGHT IC 9pin', 'd7 light ic 9pin', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'iPhone', 'Apple', NULL, 130, 'iPhone\r\nD7 LIGHT IC 9pin', 'empty', 1, 1, '2020-01-02 09:16:07', '2020-01-02 11:30:42'),
(307, 'D7 LIGHT IC 12pin', 'd7 light ic 12pin', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'iPhone', 'Apple', NULL, 160, 'iPhone \r\nD7 LIGHT IC 12pin', 'empty', 1, 1, '2020-01-02 09:17:19', '2020-01-02 11:30:44'),
(308, 'D8 LIGHT IC', 'd8 light ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'iPhone', 'Apple', NULL, 135, 'iPhone \r\nD8 LIGHT IC', 'empty', 1, 1, '2020-01-02 09:18:28', '2020-01-02 11:30:47'),
(309, 'D9 LIGHT IC 9pin', 'd9 light ic 9pin', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'iPhone', 'Apple', NULL, 130, 'iPhone \r\nD9 LIGHT IC 9pin', 'empty', 1, 1, '2020-01-02 09:23:51', '2020-01-02 11:29:30'),
(310, 'D9 LIGHT IC 12pin', 'd9 light ic 12pin', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'iPhone', 'Apple', NULL, 160, 'iPhone \r\nD9 LIGHT IC 12pin', 'empty', 1, 1, '2020-01-02 09:24:59', '2020-01-02 11:29:26'),
(311, 'PM660', 'pm660', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi', 'Xiaomi', NULL, 145, 'Redmi Power IC\r\nPM660', 'empty', 1, 1, '2020-01-02 09:27:00', '2020-01-02 11:29:23'),
(312, 'PM660L IC', 'pm660l ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi', 'Xiaomi', NULL, 140, 'Redmi Power IC\r\nPM660L IC', 'empty', 1, 1, '2020-01-02 09:28:23', '2020-01-02 11:29:20'),
(313, 'PM8916 IC', 'pm8916 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi', 'Xiaomi', NULL, 100, 'Redmi Power IC\r\nPM8916 IC', 'empty', 1, 1, '2020-01-02 09:29:34', '2020-01-02 11:29:17'),
(314, 'PM8917 IC', 'pm8917 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi', 'Xiaomi', NULL, 180, 'Redmi Power IC \r\nPM8917 IC', 'empty', 1, 1, '2020-01-02 09:30:40', '2020-01-02 11:29:14'),
(315, 'PM8937 IC', 'pm8937 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi', 'Xiaomi', NULL, 140, 'Redmi Power IC\r\nPM8937 IC', 'empty', 1, 1, '2020-01-02 09:31:53', '2020-01-02 11:29:11'),
(316, 'PM8952 IC', 'pm8952 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi', 'Xiaomi', NULL, 120, 'Redmi Power IC\r\nPM8952 IC', 'empty', 1, 1, '2020-01-02 09:33:16', '2020-01-02 11:29:08'),
(317, 'PM8953 IC', 'pm8953 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi', 'Xiaomi', NULL, 210, 'Redmi Power IC\r\nPM8953 IC', 'empty', 1, 1, '2020-01-02 09:37:22', '2020-01-02 11:29:04'),
(318, 'PMI8937 IC', 'pmi8937 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi', 'Xiaomi', NULL, 130, 'Redmi Power IC\r\nPMI8937 IC', 'empty', 1, 1, '2020-01-02 09:38:27', '2020-01-02 11:29:01'),
(319, 'PMI8940 IC', 'pmi8940 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi', 'Xiaomi', NULL, 200, 'Redmi Power IC\r\nPMI8940 IC', 'empty', 1, 1, '2020-01-02 09:39:43', '2020-01-02 11:28:38'),
(320, 'PMI8952 IC', 'pmi8952 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi', 'Xiaomi', NULL, 210, 'Redmi Power IC\r\nPMI8952 IC', 'empty', 1, 1, '2020-01-02 09:41:20', '2020-01-02 11:28:34'),
(321, 'PM8940 IC', 'pm8940 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi', 'Xiaomi', NULL, 150, 'Redmi Power IC\r\nPM8940 IC', 'empty', 1, 1, '2020-01-02 09:43:05', '2020-01-02 11:28:31'),
(322, 'PM 8909', 'pm 8909', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi', 'Xiaomi', NULL, 130, 'Redmi Power IC\r\nPM 8909', 'empty', 1, 1, '2020-01-02 09:44:24', '2020-01-02 11:28:28'),
(323, 'MI 5A AUDIO IC', 'mi 5a audio ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi 5a', 'Xiaomi', NULL, 230, 'Redmi 5a Power IC', 'empty', 1, 1, '2020-01-02 09:46:20', '2020-01-02 11:28:25'),
(324, 'MI Y1 AUDIO IC', 'mi y1 audio ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mi Y1', 'Xiaomi', NULL, 210, 'MI Y1 AUDIO IC', 'empty', 1, 1, '2020-01-02 10:14:26', '2020-01-02 11:28:22'),
(325, 'MI Y1 CHARGING IC', 'mi y1 charging ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MI Y1', 'Xiaomi', NULL, 130, 'MI Y1 CHARGING IC', 'empty', 1, 1, '2020-01-02 10:15:13', '2020-01-02 11:28:19'),
(326, 'MI 5A CHARGING IC', 'mi 5a charging ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mi 5a', 'Xiaomi', NULL, 130, 'MI 5A CHARGING IC', 'empty', 1, 1, '2020-01-02 10:19:31', '2020-01-02 11:28:16'),
(327, 'MI 4A CHARGING IC', 'mi 4a charging ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MI 4A', 'Xiaomi', NULL, 140, 'MI 4A CHARGING IC', 'empty', 1, 1, '2020-01-02 10:20:10', '2020-01-02 11:28:13'),
(328, 'MI 4A GRAPHIC IC', 'mi 4a graphic ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MI 4A', 'Xiaomi', NULL, 140, 'MI 4A GRAPHIC IC', 'empty', 1, 1, '2020-01-02 10:20:48', '2020-01-02 11:28:10'),
(329, 'MI 5A GRAPHIC IC', 'mi 5a graphic ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MI 5A', 'Xiaomi', NULL, 135, 'MI 5A GRAPHIC IC', 'empty', 1, 1, '2020-01-02 10:21:30', '2020-01-02 11:27:55'),
(330, 'PM8004', 'pm8004', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi', 'Xiaomi', NULL, 120, 'Redmi Power IC\r\nPM8004', 'empty', 1, 1, '2020-01-02 10:23:13', '2020-01-02 11:27:52'),
(331, 'MI 4X LIGHT IC', 'mi 4x light ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'MI 4X', 'Xiaomi', NULL, 135, 'MI 4X LIGHT IC', 'empty', 1, 1, '2020-01-02 10:24:26', '2020-01-02 11:27:49'),
(332, 'PMI632 IC', 'pmi632 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi Power IC', 'Xiaomi', NULL, 230, 'Redmi Power IC \r\nPMI632 IC', 'empty', 1, 1, '2020-01-02 10:26:56', '2020-01-02 11:27:45'),
(333, 'PM8940', 'pm8940', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi Power IC', 'Xiaomi', NULL, 140, 'Redmi Power IC\r\nPM8940', 'empty', 1, 1, '2020-01-02 10:28:28', '2020-01-02 11:27:42'),
(334, 'PM8956 IC', 'pm8956 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi Power IC', 'Xiaomi', NULL, 160, 'Redmi Power IC\r\nPM8956', 'empty', 1, 1, '2020-01-02 10:30:00', '2020-01-02 11:27:39'),
(335, 'PM8994 IC', 'pm8994 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Redmi Power IC', 'Xiaomi', NULL, 180, 'Redmi Power IC \r\nPM8994 IC', 'empty', 1, 1, '2020-01-02 10:31:41', '2020-01-02 11:27:36'),
(336, 'atongm 20000mAh Portable Double USB Port', 'atongm 20000mah portable double usb port', 23, 15, 22.53173910, 88.31961810, '700023', 'kolkata', 'Atongm', 'China', NULL, 1400, 'atongm 20000mAh Portable Double USB Port Li-Polymer External Battery Power Bank with Digital Display for Mobile Phones (Black)\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-02 10:39:24', '2020-01-02 11:27:32'),
(337, 'Estilo Etpb-01  Power Bank', 'estilo etpb-01  power bank', 23, 15, 22.53173910, 88.31961810, '700023', 'kolkata', 'Estilo Etpb-01  Power Bank', 'Estilo Etpb-01', NULL, 850, 'Estilo Etpb-01 (Compact Size and High Capacity of 10,000 Mah) Power Bank\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-02 10:45:15', '2020-01-02 11:27:29'),
(338, 'S2MPU04 IC', 's2mpu04 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'J2', 'Samsung', NULL, 150, 'Samsung J2 Power IC', 'empty', 1, 1, '2020-01-02 10:45:51', '2020-01-02 11:27:26'),
(339, 'S2MPU04 IC', 's2mpu04 ic-2', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'ON5', 'Samsung', NULL, 150, 'Samsung  ON5 Power IC', 'empty', 1, 1, '2020-01-02 10:46:31', '2020-01-02 11:26:42'),
(340, 'S2MPU03A IC', 's2mpu03a ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'J7', 'Samsung', NULL, 170, 'Samsung J7 Power IC', 'empty', 1, 1, '2020-01-02 10:47:40', '2020-01-02 11:26:46'),
(341, 'SC2723M IC', 'sc2723m ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'J210', 'Samsung', NULL, 110, 'Samsung J210 Power IC', 'empty', 1, 1, '2020-01-02 10:48:42', '2020-01-02 11:26:48'),
(342, 'SC2723M IC', 'sc2723m ic-2', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'J320', 'Samsung', NULL, 110, 'Samsung J320 Power IC', 'empty', 1, 1, '2020-01-02 10:49:28', '2020-01-02 11:26:51'),
(343, 'SM5701 IC', 'sm5701 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Samsung', 'Samsung', NULL, 120, 'Samsung SM5701 Power IC', 'empty', 1, 1, '2020-01-02 10:51:37', '2020-01-02 11:26:54'),
(344, 'SM5703 IC', 'sm5703 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Samsung', 'Samsung', NULL, 200, 'Samsung SM5703 Power IC', 'empty', 1, 1, '2020-01-02 10:52:34', '2020-01-02 11:26:57'),
(345, 'SM5703A IC', 'sm5703a ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Samsung', 'Samsung', NULL, 170, 'Samsung SM5703A Power IC', 'empty', 1, 1, '2020-01-02 10:53:31', '2020-01-02 11:27:00'),
(346, 'Mi Power Bank', 'mi power bank', 23, 15, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 10000mAH Li-Polymer Power Bank 2', 'Mi', NULL, 900, 'Mi 10000mAH Li-Polymer Power Bank 2\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-02 10:53:33', '2020-01-02 11:27:03'),
(347, 'MU005X01-2 IC', 'mu005x01-2 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Samsung', 'Samsung', NULL, 220, 'Samsung MU005X01-2 Power IC', 'empty', 1, 1, '2020-01-02 10:54:42', '2020-01-02 11:27:06'),
(348, 'MU005X03 IC', 'mu005x03 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Samsung', 'Samsung', NULL, 260, 'Samsung MU005X03 Power IC', 'empty', 1, 1, '2020-01-02 10:55:41', '2020-01-02 11:27:10'),
(349, 'MU005X02', 'mu005x02', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Samsung', 'Samsung', NULL, 260, 'Samsung MU005X02 Power IC', 'empty', 1, 1, '2020-01-02 10:56:49', '2020-01-02 11:26:21'),
(350, 'Mi Power Bank', 'mi power bank-2', 23, 15, 22.53173910, 88.31961810, '700023', 'kolkata', 'Mi 10000mAH Li-Polymer Power Bank 2', 'Redmi Mi', NULL, 900, 'Mi 10000mAH Li-Polymer Power Bank 2i blue\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-02 10:57:42', '2020-01-02 11:26:16');
INSERT INTO `sell_products` (`id`, `title`, `slug`, `seller_id`, `sell_category_id`, `latitude`, `longitude`, `postal_code`, `city`, `model`, `brands`, `no_of_item`, `price`, `description`, `image`, `active`, `user_product_active`, `created_at`, `updated_at`) VALUES
(351, 'SM5705', 'sm5705', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Samsung', 'Samsung', NULL, 140, 'Samsung SM5705 Power IC', 'empty', 1, 1, '2020-01-02 10:57:49', '2020-01-02 11:26:11'),
(352, 'BCM 59054 A1 POWER IC', 'bcm 59054 a1 power ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 200, 'BCM 59054 A1 POWER IC', 'empty', 1, 1, '2020-01-02 10:59:45', '2020-01-02 11:26:08'),
(353, 'Ambrane PP-150 Power Bank', 'ambrane pp-150 power bank', 23, 15, 22.53173910, 88.31961810, '700023', 'kolkata', 'Ambrane PP-150', 'Ambrane', NULL, 800, 'Ambrane PP-150 15000 mAh Lithium Polymer Power Bank\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-02 10:59:58', '2020-01-02 11:26:05'),
(354, 'PM8941 ORIGINAL IC', 'pm8941 original ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 155, 'PM8941 ORIGINAL IC', 'empty', 1, 1, '2020-01-02 11:00:58', '2020-01-02 11:26:02'),
(355, 'PM8996 IC', 'pm8996 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 165, 'PM8996 IC', 'empty', 1, 1, '2020-01-02 11:02:05', '2020-01-02 11:25:59'),
(356, 'RF7198D IC', 'rf7198d ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'QFN', 'Universal', NULL, 120, 'RF7198D IC', 'empty', 1, 1, '2020-01-02 11:03:43', '2020-01-02 11:25:56'),
(357, 'WCD9335 IC', 'wcd9335 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 190, 'WCD9335 Audio IC', 'empty', 1, 1, '2020-01-02 11:04:55', '2020-01-02 11:25:50'),
(358, 'S515', 's515', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Samsung', 'Samsung', NULL, 160, 'Samsung S515 Power IC', 'empty', 1, 1, '2020-01-02 11:06:01', '2020-01-02 11:25:47'),
(359, 'PM6150-001', 'pm6150-001', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 170, 'PM6150-001 Power IC', 'empty', 1, 1, '2020-01-02 11:07:31', '2020-01-02 11:24:55'),
(360, 'PM6150-102', 'pm6150-102', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Samsung', 'Samsung', NULL, 240, 'PM6150-102 Power IC', 'empty', 1, 1, '2020-01-02 11:08:42', '2020-01-02 11:24:59'),
(361, 'WTR1605L IC', 'wtr1605l ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 150, 'WTR1605L Network IC', 'empty', 1, 1, '2020-01-02 11:09:52', '2020-01-02 11:25:01'),
(362, 'SYSKA P1016B Power Pocket  Lithium Polymer', 'syska p1016b power pocket  lithium polymer', 23, 15, 22.53173910, 88.31961810, '700023', 'kolkata', 'SYSKA P1016B Power Pocket 100', 'syska', NULL, 700, 'SYSKA P1016B Power Pocket 100 10000mAH Lithium Polymer\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-02 11:10:11', '2020-01-02 11:25:04'),
(363, 'PLINTON Mi 4 Power Bank', 'plinton mi 4 power bank', 23, 15, 22.53173910, 88.31961810, '700023', 'kolkata', 'PLINTON Mi 4 10400', 'PLINTON', NULL, 500, 'PLINTON Mi 4 10400 -mAh Li-Ion Power Bank\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-02 11:14:18', '2020-01-02 11:25:07'),
(364, 'Ambrane Lithium Polymer Power Bank', 'ambrane lithium polymer power bank', 23, 15, 22.53173910, 88.31961810, '700023', 'kolkata', 'Ambrane 20000mAh', 'Ambrane', NULL, 1200, 'Ambrane 20000mAh Lithium Polymer Power Bank\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-02 11:15:32', '2020-01-02 11:25:10'),
(365, 'WTR3925 IC', 'wtr3925 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Samsung', 'Samsung', NULL, 140, 'WTR3925 IC Network IC', 'empty', 1, 1, '2020-01-02 11:15:34', '2020-01-02 11:25:13'),
(366, 'WTR1625 IC', 'wtr1625 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 140, 'WTR1625 Network IC', 'empty', 1, 1, '2020-01-02 11:17:24', '2020-01-02 11:25:16'),
(367, 'WTR2965', 'wtr2965', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 180, 'WTR2965 Network IC', 'empty', 1, 1, '2020-01-02 11:18:29', '2020-01-02 11:25:21'),
(368, 'Ambrane PP-11  Power Bank', 'ambrane pp-11  power bank', 23, 15, 22.53173910, 88.31961810, '700023', 'kolkata', 'Ambrane PP-11', 'Ambrane', NULL, 600, 'Ambrane PP-11 10000mAH Lithium Polymer Power Bank\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-02 11:19:37', '2020-01-02 11:25:43'),
(369, 'WTR 2955', 'wtr 2955', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 140, 'WTR 2955 Network IC', 'empty', 1, 1, '2020-01-02 11:20:10', '2020-01-02 11:24:17'),
(370, 'WTR 4905', 'wtr 4905', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 150, 'WTR 4905 Network IC', 'empty', 1, 1, '2020-01-02 11:21:55', '2020-01-02 11:24:14'),
(371, 'Stuffcool Type C Power Bank', 'stuffcool type c power bank', 23, 15, 22.53173910, 88.31961810, '700023', 'kolkata', 'Stuffcool Type C 18W', 'Stuffcool', NULL, 1400, 'Stuffcool Type C 18W Power delivery 10000 mAh Dual USB Fast Charging Li Polymer Mini Power Bank\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-02 11:23:22', '2020-01-02 11:24:12'),
(372, '070A CHARGING IC', '070a charging ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 120, '070A CHARGING IC', 'empty', 1, 1, '2020-01-02 11:40:34', '2020-01-03 09:05:02'),
(373, '358/2122', '358/2122', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 130, '358/2122 Charging IC', 'empty', 1, 1, '2020-01-02 11:41:49', '2020-01-03 09:04:58'),
(374, '358S 2166', '358s 2166', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 135, '358S 2166 Charging IC', 'empty', 1, 1, '2020-01-02 11:50:11', '2020-01-03 09:04:55'),
(375, '358S 2225', '358s 2225', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 130, '358S 2225 Charging IC', 'empty', 1, 1, '2020-01-02 11:51:41', '2020-01-03 09:04:52'),
(376, 'BQ27426', 'bq27426', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 150, 'BQ27426 Charging IC', 'empty', 1, 1, '2020-01-02 11:52:42', '2020-01-03 09:04:48'),
(377, 'BQ24261 IC', 'bq24261 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 145, 'BQ24261 Charging IC', 'empty', 1, 1, '2020-01-02 11:54:07', '2020-01-03 09:04:45'),
(378, 'BQ24296M IC', 'bq24296m ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 130, 'BQ24296M Charging IC', 'empty', 1, 1, '2020-01-02 11:55:01', '2020-01-03 09:04:42'),
(379, 'BQ24196 IC', 'bq24196 ic', 29, 2, 25.61288570, 85.13659210, '800017', 'Patna', 'Mix', 'Universal', NULL, 130, 'BQ24196 Charging IC', 'empty', 1, 1, '2020-01-02 11:56:05', '2020-01-03 09:03:24'),
(380, 'Toshiba 16 GB pen drive', 'toshiba 16 gb pen drive', 23, 14, 22.53173910, 88.31961810, '700023', 'kolkata', 'Toshiba 16 GB THN-U202W0160A4', 'Toshiba', NULL, 300, 'Toshiba 16 GB THN-U202W0160A4 Flash Drive\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 07:51:15', '2020-01-03 09:03:20'),
(381, 'IT Solutions 8GB Wrist Band Shape Fancy Design Pen Drive', 'it solutions 8gb wrist band shape fancy design pen drive', 23, 14, 22.53173910, 88.31961810, '700023', 'kolkata', 'IT Solutions 8GB Wrist Band', 'IT Solutions', NULL, 500, 'IT Solutions 8GB Wrist Band Shape Fancy Design Pen Drive\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 07:52:28', '2020-01-03 09:03:16'),
(382, 'DIRESTA Iron Man Blue Eye Pen Drive 32 GB Pen Drive (Red)', 'diresta iron man blue eye pen drive 32 gb pen drive (red)', 23, 14, 22.53173910, 88.31961810, '700023', 'kolkata', 'DIRESTA Iron Man Blue Eye', 'DIRESTA', NULL, 900, 'DIRESTA Iron Man Blue Eye Pen Drive 32 GB Pen Drive (Red)\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 07:56:14', '2020-01-03 09:03:12'),
(383, 'HP x740w 32 GB USB Flash Drive (Gray)', 'hp x740w 32 gb usb flash drive (gray)', 23, 14, 22.53173910, 88.31961810, '700023', 'kolkata', 'HP x740w', 'HP', NULL, 550, 'HP x740w 32 GB USB Flash Drive (Gray)\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 07:57:04', '2020-01-03 09:03:09'),
(384, 'Strontium Pollex 32GB Flash Drive (Black/Red)', 'strontium pollex 32gb flash drive (black/red)', 23, 14, 22.53173910, 88.31961810, '700023', 'kolkata', 'Strontium Pollex', 'Strontium Pollex', NULL, 350, 'Strontium Pollex 32GB Flash Drive (Black/Red)\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 07:58:52', '2020-01-03 09:03:05'),
(385, 'Strontium Ammo 32GB 2.0 USB Pen Drive (Silver)', 'strontium ammo 32gb 2.0 usb pen drive (silver)', 23, 14, 22.53173910, 88.31961810, '700023', 'kolkata', 'Strontium Ammo', 'Strontium Ammo', NULL, 350, 'Strontium Ammo 32GB 2.0 USB Pen Drive (Silver)\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 08:00:05', '2020-01-03 09:03:02'),
(386, 'SanDisk Ultra Dual 32GB USB 3.0', 'sandisk ultra dual 32gb usb 3.0', 23, 14, 22.53173910, 88.31961810, '700023', 'kolkata', 'SanDisk Ultra Dual', 'SanDisk', NULL, 500, 'SanDisk Ultra Dual 32GB USB 3.0 OTG Pen Drive (Gold)\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 08:01:35', '2020-01-03 09:02:58'),
(387, 'Toshiba U202 16GB USB 2.0 Pendrive (Blue)', 'toshiba u202 16gb usb 2.0 pendrive (blue)', 23, 14, 22.53173910, 88.31961810, '700023', 'kolkata', 'Toshiba U202', 'Toshiba', NULL, 300, 'Toshiba U202 16GB USB 2.0 Pendrive (Blue)\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 08:02:44', '2020-01-03 09:02:54'),
(388, 'SanDisk Cruzer Blade 32GB USB Flash Drive', 'sandisk_cruzer_blade_32gb_usb_flash_drive', 23, 14, 22.53173910, 88.31961810, '700023', 'kolkata', 'SanDisk Cruzer Blade', 'SanDisk Cruzer', NULL, 400, 'SanDisk Cruzer Blade 32GB USB Flash Drive\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 08:03:56', '2020-01-03 09:02:50'),
(389, 'Xech Mini Card 16 GB USB High Speed Flash Memory Stick Pen Drive', 'xech mini card 16 gb usb high speed flash memory stick pen drive', 23, 14, 22.53173910, 88.31961810, '700023', 'kolkata', 'Xech Mini Card', 'Xech', NULL, 350, 'Xech Mini Card 16 GB USB High Speed Flash Memory Stick Pen Drive\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 08:05:06', '2020-01-08 06:13:30'),
(390, 'AMRI Leather Wallet Flip Cover Case for REDMI 6A (Color - Brown)', 'amri leather wallet flip cover case for redmi 6a (color - brown)', 23, 13, 22.53173910, 88.31961810, '700023', 'kolkata', 'AMRI Leather Wallet Flip Cover', 'AMRI', NULL, 300, 'AMRI Leather Wallet Flip Cover Case for REDMI 6A (Color - Brown)\r\n\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 10:52:36', '2020-01-08 06:13:34'),
(391, 'TecKraft Leather Wallet Case Flip Cover Cover for Redmi Note 8 Pro (Blue)', 'teckraft leather wallet case flip cover cover for redmi note 8 pro (blue)', 23, 13, 22.53173910, 88.31961810, '700023', 'kolkata', 'TecKraft Leather Wallet Case Flip Cover Cover', 'TecKraft', NULL, 300, 'TecKraft Leather Wallet Case Flip Cover Cover for Redmi Note 8 Pro (Blue)\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 10:53:44', '2020-01-08 06:12:26'),
(392, 'Nkarta Flip Flap Cover Case with Stand/Wallet/Card Holder for Vivo V17 - Cherry', 'nkarta flip flap cover case with stand/wallet/card holder for vivo v17 - cherry', 23, 13, 22.53173910, 88.31961810, '700023', 'kolkata', 'Nkarta Flip Flap Cover', 'Nkarta', NULL, 300, 'Nkarta Flip Flap Cover Case with Stand/Wallet/Card Holder for Vivo V17 - Cherry\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 10:57:25', '2020-01-08 06:12:30'),
(393, 'Nkarta Flip Flap Cover Case with Stand/Wallet/Card Holder for Samsung Galaxy A71 - Coffee Brown', 'nkarta flip flap cover case with stand/wallet/card holder for samsung galaxy a71 - coffee brown', 23, 13, 22.53173910, 88.31961810, '700023', 'kolkata', 'Nkarta Flip Flap Cover', 'Nkarta', NULL, 300, 'Nkarta Flip Flap Cover Case with Stand/Wallet/Card Holder for Samsung Galaxy A71 - Coffee Brown\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 10:58:24', '2020-01-08 06:12:34'),
(394, 'WOW Imagine Galaxy M30s Flip Case Leather Finish | Inside TPU with Card Pockets | Wallet Stand | Shock Proof | Magnetic Closure | 360 Degree Complete Protection Flip Cover for Galaxy M30s - Blue', 'wow imagine galaxy m30s flip case leather finish | inside tpu with card pockets | wallet stand | shock proof | magnetic closure | 360 degree complete protection flip cover for galaxy m30s - blue', 23, 13, 22.53173910, 88.31961810, '700023', 'kolkata', 'WOW Imagine Galaxy M30s Flip cover', 'WOW3', NULL, 300, 'WOW Imagine Galaxy M30s Flip Case Leather Finish | Inside TPU with Card Pockets | Wallet Stand | Shock Proof | Magnetic Closure | 360 Degree Complete Protection Flip Cover for Galaxy M30s - Blue\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 10:59:36', '2020-01-08 06:12:37'),
(395, 'HITFIT Double Window PU Leather Flip Cover Case for Samsung Galaxy J7 Nxt -Black', 'hitfit double window pu leather flip cover case for samsung galaxy j7 nxt -black', 23, 13, 22.53173910, 88.31961810, '700023', 'kolkata', 'HITFIT Double Window PU Leather Flip Cover Case', 'HITFIT', NULL, 600, 'HITFIT Double Window PU Leather Flip Cover Case for Samsung Galaxy J7 Nxt -Black\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 11:00:32', '2020-01-08 06:12:41'),
(396, 'SHINESTAR PU Leather Flip Wallet Case with TPU Shockproof Cover for Xiaomi Redmi Note 8 (Blue, Xiaomi Redmi Note 8)', 'shinestar pu leather flip wallet case with tpu shockproof cover for xiaomi redmi note 8 (blue, xiaomi redmi note 8)', 23, 13, 22.53173910, 88.31961810, '700023', 'kolkata', 'SHINESTAR PU Leather Flip cover', 'SHINESTAR', NULL, 300, 'SHINESTAR PU Leather Flip Wallet Case with TPU Shockproof Cover for Xiaomi Redmi Note 8 (Blue, Xiaomi Redmi Note 8)\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 11:02:10', '2020-01-08 06:12:44'),
(397, 'MOBICLONICS® Imported Mercury Wallet Flip Cover for Samsung Galaxy M10 (Blue)', 'mobiclonics® imported mercury wallet flip cover for samsung galaxy m10 (blue)', 23, 13, 22.53173910, 88.31961810, '700023', 'kolkata', 'MOBICLONICS® Imported Mercury', 'MOBICLONICS®', NULL, 300, 'MOBICLONICS® Imported Mercury Wallet Flip Cover for Samsung Galaxy M10 (Blue)\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 11:03:08', '2020-01-08 06:13:37'),
(398, 'SHINESTAR PU Leather Flip Wallet Case with TPU Shockproof Cover for Apple iPhone 6 / 6S - (Classic Brown)', 'shinestar pu leather flip wallet case with tpu shockproof cover for apple iphone 6 / 6s - (classic brown)', 23, 13, 22.53173910, 88.31961810, '700023', 'kolkata', 'SHINESTAR PU Leather Flip cover', 'SHINESTAR', NULL, 300, 'SHINESTAR PU Leather Flip Wallet Case with TPU Shockproof Cover for Apple iPhone 6 / 6S - (Classic Brown)\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 11:04:09', '2020-01-08 06:12:48'),
(399, 'SHINESTAR PU Leather Flip Wallet Case with TPU Shockproof Cover for Mi Redmi 8 (Classic Brown, Mi Redmi 8)', 'shinestar pu leather flip wallet case with tpu shockproof cover for mi redmi 8 (classic brown, mi redmi 8)', 23, 13, 22.53173910, 88.31961810, '700023', 'kolkata', 'SHINESTAR PU Leather Flip Wallet Case', 'SHINESTAR', NULL, 300, 'SHINESTAR PU Leather Flip Wallet Case with TPU Shockproof Cover for Mi Redmi 8 (Classic Brown, Mi Redmi 8)\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-03 11:04:56', '2020-01-08 06:12:20'),
(400, 'C11P1424 Battery for Asus ZenFone 2(3000 mAh)', 'c11p1424 battery for asus zenfone 2(3000 mah)', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Z008D ZE551ML ZE550ML Z00AD', 'ASUS', NULL, 1289, 'This is an import unit & it comes without retail packaging, QC Pass, professional needed for installation.', 'empty', 1, 1, '2020-01-06 09:41:05', '2020-01-08 06:14:35'),
(401, 'C11P1501 for ASUS 2 Laser 5.5/6-inch zenfone Selfie ZE550KL ZE600KL ZE601KL Z00LD Z011D ZD551KL Z00UD -3000 mAh', 'c11p1501 for asus 2 laser 5.5/6-inch zenfone selfie ze550kl ze600kl ze601kl z00ld z011d zd551kl z00ud -3000 mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Zenfone 2 Laser', 'ASUS', NULL, 1099, 'Compact design, high in quality and stability and performance, Usually takes 2 hours to full Charge with Normal Power Adapter, With Fast Charging Adapter it will take less time.', 'empty', 1, 1, '2020-01-06 09:44:50', '2020-01-08 06:14:46'),
(402, 'ZEWON OriginaI for Asus ZenFone 5 A500G Z5 A500 A500CG A501CG A500KL Battery [ Part No: C11P1324] Rated: 3.8V 2050mAh 8.Wh Model No (A500G Z5 A500 A500CG A501CG A500KL)', 'zewon originai for asus zenfone 5 a500g z5 a500 a500cg a501cg a500kl battery [ part no: c11p1324] rated: 3.8v 2050mah 8.wh model no (a500g z5 a500 a500cg a501cg a500kl)', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Zenfone 5', 'ASUS', NULL, 1099, 'Long-Lasting 2050mAh Battery., Backed by a large 2050mAh battery with standby time of up to 200 hours., Asus ZenFone 5, A500G Z5 A500 A500CG A501CG A500KL Battery has enough juice to last the entire day and beyond., Along with the large battery., The CPU and GPU are optimised for better battery consumption so that you do not have to worry about charging points before the day is over.', 'empty', 1, 1, '2020-01-06 09:49:54', '2020-01-08 06:14:49'),
(403, 'ZEWON OriginaI C11P1506 Battery for ASUS ZenFone Go 5.5 ASUS Live G500TG ZC500TG Z00VD Battery [ Part No: C11P1506] 2070mAh Battery', 'zewon originai c11p1506 battery for asus zenfone go 5.5 asus live g500tg zc500tg z00vd battery [ part no: c11p1506] 2070mah battery', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Zenfone Go', 'ASUS', NULL, 1099, 'ZEWON\r\nModel	ASUS ZenFone Go 5.5 Part No: C11P1506\r\nItem Weight	54.4 g\r\nProduct Dimensions	7.6 x 5.1 x 2.5 cm\r\nBatteries:	1 Lithium-ion battery required. (included)\r\nItem model number	ASUS ZenFone Go 5.5 Part No: C11P1506\r\nCompatible Devices	ASUS ZenFone Go 5.5 ASUS Live G500TG ZC500TG Z00VD\r\nNumber Of Items	1\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium-Ion\r\nBattery Power	2000 milliamp_hours', 'empty', 1, 1, '2020-01-06 09:55:56', '2020-01-08 06:14:53'),
(404, 'Pacificdeals C11P1506 Battery for Asus Zenfone Go - 2000mAh', 'pacificdeals c11p1506 battery for asus zenfone go - 2000mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Zenfone GO', 'Pacificdeals', NULL, 595, 'Brand	Pacificdeals\r\nModel	C11P1506\r\nItem Weight	90.7 g\r\nProduct Dimensions	5 x 5 x 5 cm\r\nItem model number	C11P1506\r\nCompatible Devices	For Asus Zenfone Go\r\nBatteries Included	No\r\nBatteries Required	No\r\nBattery Power	2000 milliamp_hours', 'empty', 1, 1, '2020-01-06 10:01:31', '2020-01-08 06:14:57'),
(405, 'Screencart 100% High Backup Compatilble Mobile Battery/Batteries for Coolpad Cpld 407 (Check Your Old Battery Model Properly)', 'screencart 100% high backup compatilble mobile battery/batteries for coolpad cpld 407 (check your old battery model properly)', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Coolpad 407', 'Screencart', NULL, 999, 'Brand	Screencart\r\nModel	Coolpad Cpld 407\r\nItem Weight	200 g\r\nPackage Dimensions	10 x 5 x 5 cm\r\nItem model number	Coolpad Cpld 407\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Ion', 'empty', 1, 1, '2020-01-06 10:57:03', '2020-01-08 06:15:01'),
(406, 'GTEC 3000 mAh Battery for Coolpad Note 3', 'gtec 3000 mah battery for coolpad note 3', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Coolpad Note 3', 'GTEC', NULL, 599, 'Brand	GTEC\r\nCompatible Devices	Samsung Galaxy Note 3\r\nBattery Power	3000 milliamp_hours', 'empty', 1, 1, '2020-01-06 11:14:20', '2020-01-08 06:15:08'),
(407, 'moxica Coolpad Note 5 compatiable Battery CPLD-405', 'moxica coolpad note 5 compatiable battery cpld-405', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Coolpad Note 5', 'Moxica', NULL, 799, 'Brand	moxica\r\nItem part number	7449332444497', 'empty', 1, 1, '2020-01-06 11:20:26', '2020-01-08 06:15:20'),
(408, 'Amnicor Mobile Battery for BlackBerry CS2', 'amnicor mobile battery for blackberry cs2', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'BlackBerry CS2', 'Amnicor', NULL, 645, 'Brand	Amnicor\r\nModel	Blackberry CS2\r\nItem Weight	18.1 g\r\nProduct Dimensions	7.6 x 2.5 x 10.2 cm\r\nBatteries:	1 Lithium ion batteries required. (included)\r\nItem model number	Blackberry CS2\r\nCompatible Devices	Blackberry CS2\r\nAdditional Features	Charging Time: 90 min, Long backup, Heat free Lithium Cell\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Ion\r\nMaterial	Lithium Battery', 'empty', 1, 1, '2020-01-06 11:25:44', '2020-01-08 06:15:25'),
(409, 'Amnicor Mobile Battery for BlackBerry DX1', 'amnicor mobile battery for blackberry dx1', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'BlackBerry DX1', 'Amnicor', NULL, 745, 'Brand	Amnicor\r\nModel	Blackberry DX1\r\nItem Weight	9.07 g\r\nProduct Dimensions	7.6 x 2.5 x 10.2 cm\r\nBatteries:	1 Lithium ion batteries required. (included)\r\nItem model number	Blackberry DX1\r\nCompatible Devices	Blackberry DX1\r\nAdditional Features	Charging Time: 90 min, Long backup, Heat free Lithium Cell\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Ion\r\nMaterial	Lithium Battery', 'empty', 1, 1, '2020-01-06 11:38:02', '2020-01-08 06:15:51'),
(410, 'Original BlackBerry C-X2 CX2 C X2 Battery 4 Curve 8350 8350i 8800 8820 8830 8100', 'original blackberry c-x2 cx2 c x2 battery 4 curve 8350 8350i 8800 8820 8830 8100', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'BlackBerry C-X2', 'Blackberry', NULL, 799, 'Brand	BlackBerry\r\nModel	CX2\r\nItem Weight	22.7 g\r\nProduct Dimensions	5.5 x 0.7 x 3.4 cm\r\nItem model number	CX2', 'empty', 1, 1, '2020-01-06 11:41:15', '2020-01-08 06:15:54'),
(411, 'The Black Store Orignal E-M1 / EM1 / EM 1 Battery for BlackBerry Curve 9350 9360 9370 (1000 mAh)', 'the black store orignal e-m1 / em1 / em 1 battery for blackberry curve 9350 9360 9370 (1000 mah)', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Blackberry E-M1', 'Blackberry', NULL, 1189, 'Brand	The Black Store\r\nItem part number	BT-E-M1', 'empty', 1, 1, '2020-01-06 11:48:43', '2020-01-08 06:15:59'),
(412, 'blackberry F-M1 battery', 'blackberry f-m1 battery', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'blackberry F-M1', 'Blackberry', NULL, 549, 'Capacity: 1150 mAh\r\nType: 3.7V Li-ion\r\nOriginal OEM Standard Battery for Blackberry Pearl 3G 9100 9105 Style 967', 'empty', 1, 1, '2020-01-06 12:07:13', '2020-01-08 06:16:03'),
(413, 'Ubon lite ub826', 'ubon lite ub826', 31, 10, 22.70077430, 88.34821880, '712235', 'Hoogly', 'Uber 826', 'Ubon', NULL, 400, 'Good quality product high base and sound', 'empty', 1, 1, '2020-01-07 05:43:51', '2020-01-08 06:16:07'),
(414, 'CELLQON Compatible BlackBerry Phone Battery J-M1 for Bold 9790 Bold Touch 9900 Torch 9860 Curve 9360 ACC-40871-101', 'cellqon compatible blackberry phone battery j-m1 for bold 9790 bold touch 9900 torch 9860 curve 9360 acc-40871-101', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Blackberry J-M1', 'CELLQON', NULL, 990, 'Brand	CELLQON\r\nModel	BlackBerry\r\nItem model number	BlackBerry\r\nBatteries Required	No', 'empty', 1, 1, '2020-01-07 07:40:28', '2020-01-08 06:16:11'),
(415, 'RJR 2000 mAh Compatible Battery for Gionee E3', 'rjr 2000 mah compatible battery for gionee e3', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee E3', 'RJR', NULL, 699, 'Brand	RJR\r\nItem part number	RJR_BATTERY_GIONEE_E3\r\nBatteries Included	No\r\nBatteries Required	No\r\nBattery Power	2000 milliamp_hours', 'empty', 1, 1, '2020-01-07 07:56:30', '2020-01-08 06:16:15'),
(416, 'Kaeel OriginaI BLG024A Battery for Gionee F103 Pro/F103S/GN152/BL-G024A (2400mAh)', 'kaeel originai blg024a battery for gionee f103 pro/f103s/gn152/bl-g024a (2400mah)', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Blackberry F103', 'Kaeel OriginaI', NULL, 1095, 'Brand	Kaeel OriginaI\r\nModel	BL-G024A\r\nItem Weight	122 g\r\nPackage Dimensions	15 x 10 x 5 cm\r\nBatteries:	1 Lithium ion batteries required. (included)\r\nItem model number	BL-G024A\r\nCompatible Devices	Gionee F103 Pro / F103S / GN152\r\nAdditional Features	This is a brand new battery, 100% Original Battery, 100% Full Cell Battery, Our Original Battery last for 2 Year + with normal use, We give 100% Support to all our product contact us if you have any issue\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nMaterial	Li-ion Polymer Cell', 'empty', 1, 1, '2020-01-07 08:14:28', '2020-01-08 06:16:19'),
(417, 'SROCK 2250 mAh Compatible Battery for Gionee G3 BL-G022', 'srock 2250 mah compatible battery for gionee g3 bl-g022', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee G3', 'SROCK', NULL, 799, 'Brand	SROCK\r\nItem part number	GIONEE-G3-BATTERY-SROCK\r\nNumber Of Items	1', 'empty', 1, 1, '2020-01-07 08:18:59', '2020-01-08 06:16:22'),
(418, 'Kinsman Enterprise Generic Internal Battery for Gionee Gpad G5 (2400 Mah) Li-Ion', 'kinsman enterprise generic internal battery for gionee gpad g5 (2400 mah) li-ion', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee G5', 'Generic', NULL, 499, 'Brand	Generic\r\nModel	Gpad G5\r\nItem Weight	13.6 g\r\nProduct Dimensions	5.5 x 5 x 0.1 cm\r\nItem model number	Gpad G5\r\nNumber Of Items	1\r\nBatteries Included	No\r\nBatteries Required	No\r\nBattery Cell Composition	Lithium Ion', 'empty', 1, 1, '2020-01-07 08:21:14', '2020-01-08 06:12:38'),
(419, 'Nagnechi Mobile Battery for Gionee L700', 'nagnechi mobile battery for gionee l700', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee L700', 'Nagnechi', NULL, 399, 'Brand	Nagnechi\r\nModel	Gionee L700\r\nItem Weight	99.8 g\r\nProduct Dimensions	5 x 7 x 1 cm\r\nBatteries:	1 Lithium ion batteries required. (included)\r\nItem model number	Gionee L700\r\nCompatible Devices	Gionee L700\r\nAdditional Features	Charging Time 3 hrs approx, For the first time please charge the battery for 8-10 hours continuously [over night] without using the mobile., Comes in loose packing.Not manufactured by XOLO, Standby Time-10-12 hours, Talk time:2-3 hours continuously\r\nNumber Of Items	2\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Ion', 'empty', 1, 1, '2020-01-07 08:26:27', '2020-01-08 06:21:03'),
(420, 'Generic Ignition Compatible Internal Battery for Gionee L800 3000 Mah Li-Polymer', 'generic ignition compatible internal battery for gionee l800 3000 mah li-polymer', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee L800', 'Generic', NULL, 955, 'Brand	Generic\r\nModel	L800\r\nItem Weight	13.6 g\r\nProduct Dimensions	5.5 x 5 x 0.1 cm\r\nBatteries:	1 AAA batteries required. (included)\r\nItem model number	L800\r\nCompatible Devices	Gionee L800\r\nNumber Of Items	1\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Ion\r\nBattery Power	3000 milliamp_hours', 'empty', 1, 1, '2020-01-07 08:28:42', '2020-01-08 06:21:45'),
(421, 'RJR 4200 mAh Compatible Battery for Gionee M2', 'rjr 4200 mah compatible battery for gionee m2', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee M2', 'RJR', NULL, 999, 'Brand	RJR\r\nItem part number	RJR_BATTERY_GIONEE_M2\r\nNumber Of Items	1\r\nBatteries Included	No\r\nBatteries Required	No', 'empty', 1, 1, '2020-01-07 08:37:36', '2020-01-08 06:22:29'),
(422, 'khavya Compatible Mobile Battery for Gionee P1 1300mAh', 'khavya compatible mobile battery for gionee p1 1300mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee P1', 'khavya', NULL, 799, 'Brand	khavya\r\nModel	KA89488\r\nItem model number	KA89488\r\nNumber Of Items	1', 'empty', 1, 1, '2020-01-07 08:43:24', '2020-01-08 06:28:38'),
(423, 'RJR 1600 mAh Compatible Battery for Gionee P2S', 'rjr 1600 mah compatible battery for gionee p2s', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee P2S', 'RJR', NULL, 699, 'Brand	RJR\r\nItem part number	RJR_BATTERY_GIONEE_P2S\r\nBatteries Included	No\r\nBatteries Required	No', 'empty', 1, 1, '2020-01-07 08:46:28', '2020-01-08 06:29:29'),
(424, 'Sagar Trading Compatible Battery for Gionee Pioneer P2 Gionee Pioneer P3 1700mAh', 'sagar trading compatible battery for gionee pioneer p2 gionee pioneer p3 1700mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee P2/P3', 'SAGAR TRADING', NULL, 439, 'Brand	SAGAR TRADING\r\nModel	P3\r\nItem Weight	59 g\r\nProduct Dimensions	6 x 0.5 x 9 cm\r\nBatteries:	1 Lithium ion batteries required.\r\nItem model number	P3\r\nCompatible Devices	Sagar Trading Compatible Battery for Gionee Pioneer P2 Gionee Pioneer P3 1700mAh\r\nNumber Of Items	1\r\nBattery Capacity	1700 milliamp_hours', 'empty', 1, 1, '2020-01-07 09:22:15', '2020-01-08 06:30:04'),
(425, 'MOBOCHIP Battery Compatible for Gionee P4 1800mAh', 'mobochip battery compatible for gionee p4 1800mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee P4', 'MOBOCHIP', NULL, 599, 'Brand	MOBOCHIP\r\nItem part number	MOBOP4\r\nBatteries Included	No\r\nBatteries Required	No\r\nBattery Cell Composition	Lithium Ion', 'empty', 1, 1, '2020-01-07 09:46:46', '2020-01-08 06:30:40'),
(426, 'K4SS Mobile Battery for GIONEE P5L /BL-G2300Z- 2300MAH', 'k4ss mobile battery for gionee p5l /bl-g2300z- 2300mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee P5', 'K4SS', NULL, 499, 'Brand	K4SS\r\nModel	K4SSMNBTRY-762\r\nItem model number	K4SSMNBTRY-762\r\nBattery Power	2300 milliamp_hours', 'empty', 1, 1, '2020-01-07 09:52:53', '2020-01-08 06:32:04'),
(427, 'Nagnechi Mobile Battery for Gionee P5W', 'nagnechi mobile battery for gionee p5w', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee P5W', 'Nagnechi', NULL, 417, 'Brand	Nagnechi\r\nModel	Gionee P5W\r\nItem Weight	99.8 g\r\nProduct Dimensions	5 x 7 x 1 cm\r\nBatteries:	1 Lithium ion batteries required. (included)\r\nItem model number	Gionee P5W\r\nCompatible Devices	Gionee P5W\r\nAdditional Features	Charging Time 3 hrs approx, For the first time please charge the battery for 8-10 hours continuously [over night] without using the mobile., Comes in loose packing.Not manufactured by XOLO, Standby Time-10-12 hours, Talk time:2-3 hours continuously\r\nNumber Of Items	2\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Ion', 'empty', 1, 1, '2020-01-07 09:58:35', '2020-01-08 06:32:27'),
(428, 'Star Bright Enterprise Generic Internal Battery for Gionee Pioneer P6 BL-G019A', 'star bright enterprise generic internal battery for gionee pioneer p6 bl-g019a', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee P6', 'Generic', NULL, 499, 'Brand	Generic\r\nModel	Gionee Pioneer P6 BL-G019A\r\nItem model number	Gionee Pioneer P6 BL-G019A\r\nCompatible Devices	Gionee Pioneer P6 BL-G019A', 'empty', 1, 1, '2020-01-07 10:02:17', '2020-01-08 06:33:08'),
(429, 'jacksunspareparts Polymer Cell BL-G2300X 2300mAh Mobile Battery for Gionee P7', 'jacksunspareparts polymer cell bl-g2300x 2300mah mobile battery for gionee p7', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee P7', 'jacksunspareparts', NULL, 399, 'Battery Power Rating	2300 milliamp_hours\r\nBL-G2300X 2300mAh Mobile Battery for Gionee P7', 'empty', 1, 1, '2020-01-07 10:05:39', '2020-01-08 06:32:29'),
(430, 'Welcozon Battery BL-G030Y 3150 mAh for Gionee P7 Max (Warranty Version)', 'welcozon battery bl-g030y 3150 mah for gionee p7 max (warranty version)', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee P7 MAX', 'Welcozon', NULL, 399, 'Brand	Welcozon\r\nModel	W- Gionee P7 Max 3150 mAh\r\nItem Weight	18.1 g\r\nPackage Dimensions	18 x 15 x 3 cm\r\nItem model number	W- Gionee P7 Max 3150 mAh\r\nCompatible Devices	Gionee P7 Max\r\nAdditional Features	Premium Quality, Long Life, Best Performance, Battery Model: BL-G030Y\r\nNumber Of Items	1\r\nBatteries Included	No\r\nBatteries Required	No\r\nMaterial	Lithium\r\nForm Factor	3150 mAh Battery, 100 Days Online Warranty, BL-G030Y Battery, Gionee P7 Max Battery', 'empty', 1, 1, '2020-01-07 10:08:53', '2020-01-08 06:32:33'),
(431, 'S.N Communication 3150mAh Battery Compatible for Gionee S Plus BL-G030Z', 's.n communication 3150mah battery compatible for gionee s plus bl-g030z', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee S Plus', 'S.N', NULL, 434, 'Brand	S.N Communication\r\nModel	Battery 57\r\nItem model number	Battery 57\r\nBatteries Included	No\r\nBatteries Required	No', 'empty', 1, 1, '2020-01-07 10:11:42', '2020-01-08 06:32:36'),
(432, 'Sagar Trading Compatible Battery for Gionee S80 1280mAh', 'sagar trading compatible battery for gionee s80 1280mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee S80', 'SAGAR TRADING', NULL, 399, 'Brand	SAGAR TRADING\r\nModel	S80\r\nItem Weight	59 g\r\nProduct Dimensions	6 x 0.5 x 9 cm\r\nBatteries:	1 Lithium ion batteries required.\r\nItem model number	S80\r\nCompatible Devices	Sagar Trading Compatible Battery for Gionee S80 1280mAh\r\nNumber Of Items	1\r\nBattery Capacity	1280 milliamp_hours', 'empty', 1, 1, '2020-01-07 10:29:03', '2020-01-08 06:32:40'),
(433, 'MJR Mobile Battery for Gionee S90 (Orange)', 'mjr mobile battery for gionee s90 (orange)', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee S90', 'MJR', NULL, 385, 'Brand	MJR\r\nModel	S90\r\nItem Weight	99.8 g\r\nProduct Dimensions	5 x 7 x 1 cm\r\nBatteries:	1 Lithium ion batteries required. (included)\r\nItem model number	S90\r\nNumber Of Items	2\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Ion', 'empty', 1, 1, '2020-01-07 10:34:15', '2020-01-08 06:32:44'),
(434, 'MOBOCHIP Battery Compatible for Gionee P4S V4S 1800mAh', 'mobochip battery compatible for gionee p4s v4s 1800mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee P4S V4S', 'MOBOCHIP', NULL, 380, 'Brand	MOBOCHIP\r\nItem part number	MOBOP4S\r\nCompatible Devices	Gionee P4S\r\nBatteries Included	No\r\nBatteries Required	No\r\nBattery Cell Composition	Lithium Ion', 'empty', 1, 1, '2020-01-07 10:39:19', '2020-01-08 06:32:48'),
(435, 'Battery for Gionee V5 / Gionee Ctrl V5 + Freebie of rs.125 - by Mjr', 'battery for gionee v5 / gionee ctrl v5 + freebie of rs.125 - by mjr', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Gionee V5', 'MJR', NULL, 485, 'Brand	MJR\r\nModel	Gionee V5 Gionee Ctrl V5\r\nItem Weight	99.8 g\r\nProduct Dimensions	5 x 7 x 1 cm\r\nBatteries:	1 Lithium ion batteries required. (included)\r\nItem model number	Gionee V5 Gionee Ctrl V5\r\nCompatible Devices	Gionee V5 Gionee Ctrl V5\r\nAdditional Features	Charging Time 3 hrs approx, For the first time please charge the battery for 8-10 hours continuously [over night] without using the mobile., Comes in loose packing, Standby Time-10-12 hours, Talk time:2-3 hours continuously, Battery For Gionee V5 Gionee Ctrl V5\r\nNumber Of Items	2\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Ion', 'empty', 1, 1, '2020-01-07 10:42:36', '2020-01-08 06:32:51'),
(436, 'ZEWON The Black Store 3000mAh HB4242B4EBW Battery for Huawei Honor 6 H60-L01 H60-L02 H60-L11 H60-L04 4X', 'zewon the black store 3000mah hb4242b4ebw battery for huawei honor 6 h60-l01 h60-l02 h60-l11 h60-l04 4x', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Honor 4242', 'ZEWON', NULL, 1199, 'Brand	ZEWON\r\nModel	Model No:EB4242B4EBW, Huawei honor 6\r\nItem Weight	54.4 g\r\nProduct Dimensions	7.6 x 5.1 x 2.5 cm\r\nBatteries:	1 Lithium ion batteries required. (included)\r\nItem model number	Model No:EB4242B4EBW, Huawei honor 6\r\nCompatible Devices	Model No:EB4242B4EBW, Huawei honor 6\r\nAdditional Features	Long-Lasting 3000mAh Battery., Backed by a large 3000mAh battery with standby time of up to 200 hours., Huawei honor 6 Battery has enough juice to last the entire day and beyond., Along with the large battery., The CPU and GPU are optimised for better battery consumption so that you do not have to worry about charging points before the day is over.\r\nNumber Of Items	1\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Ion', 'empty', 1, 1, '2020-01-07 10:50:43', '2020-01-08 06:33:02'),
(437, 'Screencart 100% High Backup Compatilble Mobile Battery/Batteries for Huawei Honor HB4742AORBC (Check Your Old', 'screencart 100% high backup compatilble mobile battery/batteries for huawei honor hb4742aorbc (check your old', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Honor HB4742AORBC', 'Screencart', NULL, 999, 'Brand	Screencart\r\nModel	Huawei Honor HB4742AORBC\r\nItem Weight	200 g\r\nPackage Dimensions	10 x 5 x 5 cm\r\nItem model number	Huawei Honor HB4742AORBC\r\nBatteries Included	Yes', 'empty', 1, 1, '2020-01-07 10:54:34', '2020-01-08 06:33:05'),
(438, 'Ignition Internal Battery Compatible with Honor 9 HB386280ECW 3200 Mah Li-Polymer', 'ignition internal battery compatible with honor 9 hb386280ecw 3200 mah li-polymer', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Honor HB386280ECW', 'Ignition', NULL, 1045, 'Brand	Ignition\r\nModel	Honor 9 HB386280ECW\r\nItem Weight	13.6 g\r\nProduct Dimensions	5.5 x 5 x 0.1 cm\r\nBatteries:	1 AA batteries required. (included)\r\nItem model number	Honor 9 HB386280ECW\r\nCompatible Devices	Honor 9 HB386280ECW\r\nNumber Of Items	1\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Polymer', 'empty', 1, 1, '2020-01-07 10:58:32', '2020-01-08 06:33:13'),
(439, 'VBCFT Battery for Huawei P10 Plus HB386589 ECW/Honor Play/NOVA 3/Honor 8X', 'vbcft battery for huawei p10 plus hb386589 ecw/honor play/nova 3/honor 8x', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Honor HB386589 ECW+', 'VBCFT', NULL, 999, 'Brand	VBCFT\r\nModel	HB386589ECW\r\nItem model number	HB386589ECW\r\nCompatible Devices	Huawei Honor Nova/Honor Play 7 / Honor 7s / CAZ-AL10 CAZ-TL00 / Enjoy 6S / Honor 6A 6C Y6 Pro 2017 / P9 Lite Mini / Y5 2017 HB405979ECW', 'empty', 1, 1, '2020-01-07 11:01:41', '2020-01-08 06:27:41'),
(440, 'Amnicor Mobile Battery for Huawei Honor 4X HB4242B4EBW', 'amnicor mobile battery for huawei honor 4x hb4242b4ebw', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Honor 4X', 'Amnicor', NULL, 1390, 'Brand	Amnicor\r\nModel	Honor 4X\r\nItem Weight	18.1 g\r\nProduct Dimensions	6 x 1 x 8 cm\r\nBatteries:	1 Lithium ion batteries required.\r\nItem model number	Honor 4X\r\nCompatible Devices	Huawei Honor 4X HB4242B4EBW\r\nAdditional Features	Charging Time: 90 min, Long backup even in Vedio mode, Heat free Lithium Cell\r\nBatteries Included	No\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Ion', 'empty', 1, 1, '2020-01-07 11:04:39', '2020-01-08 06:27:37'),
(441, 'Welcozon HB474284RBC 2000 mAh Battery for Huawei Honor Holly U19 G601 Y550 Y560 Y625 Y635 G521 G620 C8816 Hol-T00U10T10 Hol-U19 Honor 3C lite', 'welcozon hb474284rbc 2000 mah battery for huawei honor holly u19 g601 y550 y560 y625 y635 g521 g620 c8816 hol-t00u10t10 hol-u19 honor 3c lite', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Honor u19', 'Welcozon', NULL, 599, 'Brand	Welcozon\r\nModel	HB474284RBC honor u19 battery -2000 mAh\r\nItem Weight	18.1 g\r\nPackage Dimensions	20 x 15 x 3 cm\r\nBatteries:	1 Lithium ion batteries required.\r\nItem model number	HB474284RBC honor u19 battery -2000 mAh\r\nCompatible Devices	Huawei Honor Holly U19 G601 Y550 Y560 Y625 Y635 G521 G620 C8816 Hol-T00U10T10 Hol-U19 Honor 3C lite\r\nAdditional Features	Long Life, 100 Days Warranty, Premium Quality, Extra Performance, Honor Holly U19 2000 mAh Battery with warranty, First Brand to Provide Warranty, Easy Warranty Online Claim\r\nNumber Of Items	1\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Polymer\r\nBattery Power	2000 milliamp_hours\r\nMaterial	Lithium\r\nForm Factor	Best Results With Original Brand Charger', 'empty', 1, 1, '2020-01-07 11:08:17', '2020-01-08 06:27:33'),
(442, 'Pacificdeals HB424B4EBW Battery for Huawei Honor 6-3000mAh', 'pacificdeals hb424b4ebw battery for huawei honor 6-3000mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Honor 6 HB424B4EBW', 'Pacificdeals', NULL, 635, 'Brand	Pacificdeals\r\nModel	HB424B4EBW\r\nItem Weight	90.7 g\r\nProduct Dimensions	5 x 5 x 5 cm\r\nItem model number	HB424B4EBW\r\nCompatible Devices	For Huawei Honor 6\r\nBatteries Included	No\r\nBatteries Required	No\r\nBattery Power	3000 milliamp_hours', 'empty', 1, 1, '2020-01-07 11:26:59', '2020-01-08 06:27:26'),
(443, 'Systums Mobile Battery for HTC Desire 210 1300mAh', 'systums mobile battery for htc desire 210 1300mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC Desire 210', 'Systums', NULL, 499, 'Brand	Systums\r\nItem Weight	18.1 g\r\nPackage Dimensions	5 x 5 x 5 cm\r\nItem part number	SYS-210\r\nCompatible Devices	HTC Desire\r\nBatteries Required	No', 'empty', 1, 1, '2020-01-07 11:28:40', '2020-01-08 06:27:24'),
(444, 'Sagar Trading Compatible Battery for HTC Desire 310 BOPA2100 D310n 2000mAh', 'sagar trading compatible battery for htc desire 310 bopa2100 d310n 2000mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC DESIRE 310', 'Sagar Trading', NULL, 499, 'Brand	Sagar Trading\r\nModel	D310\r\nItem Weight	59 g\r\nProduct Dimensions	6 x 0.5 x 9 cm\r\nBatteries:	1 Lithium ion batteries required.\r\nItem model number	D310\r\nCompatible Devices	Sagar Trading Compatible Battery For HTC Desire 310 BOPA2100 D310n 2000mAh\r\nAdditional Features	High Quality Lithium Ion Genuine Battery with proper Amperes\r\nNumber Of Items	1\r\nBattery Capacity	2000 milliamp_hours\r\nBattery Power	2000 milliamp_hours', 'empty', 1, 1, '2020-01-07 11:31:00', '2020-01-08 06:27:19'),
(445, 'CELLQON High Backup Compatible Mobile Battery for HTC Desire 500 ONE SV C525E, for HTC', 'cellqon high backup compatible mobile battery for htc desire 500 one sv c525e, for htc', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC DESIRE 500', 'CELLQON', NULL, 550, 'Brand	CELLQON\r\nItem part number	Cel_47\r\nCompatible Devices	HTC Desire\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Ion', 'empty', 1, 1, '2020-01-07 11:33:59', '2020-01-08 06:27:16'),
(446, 'RAGA MOBICARE Mobile Battery Compatible for HTC Desire 501', 'raga mobicare mobile battery compatible for htc desire 501', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC DESIRE 501', 'RAGA MOBICARE', NULL, 599, 'Brand	RAGA MOBICARE\r\nModel	HTC Desire 501\r\nItem model number	HTC Desire 501\r\nCompatible Devices	HTC Desire\r\nAdditional Features	Mobile Battery for HTC Desire 501', 'empty', 1, 1, '2020-01-07 11:41:29', '2020-01-08 06:27:13'),
(447, 'G n G Battery Model Bopb5100 1950 Mah Compatible With Htc Desire 516', 'g n g battery model bopb5100 1950 mah compatible with htc desire 516', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC DESIRE 516', 'G n G', NULL, 533, 'Brand	G n G\r\nModel	Bopb5100\r\nItem Weight	40.8 g\r\nPackage Dimensions	7.3 x 6.1 x 1.4 cm\r\nItem model number	Bopb5100\r\nCompatible Devices	HTC Desire\r\nBatteries Included	No\r\nBatteries Required	No', 'empty', 1, 1, '2020-01-07 11:52:37', '2020-01-08 06:27:09'),
(448, 'Nextgen earphone', 'nextgen earphone', 24, 7, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Ng 111', 'Nextgen', NULL, 150, '100%. Original', 'empty', 1, 1, '2020-01-08 05:13:22', '2020-01-08 06:27:06'),
(449, 'Etar charger', 'etar charger', 24, 12, 22.70077430, 88.34821880, '712235', 'Hooghly', 'ET-110', 'Etar', NULL, 200, '100%original', 'empty', 1, 1, '2020-01-08 05:18:16', '2020-01-08 06:26:34'),
(450, 'Divine int', 'divine int', 24, 12, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'China', NULL, 150, '100 original', 'empty', 1, 1, '2020-01-08 05:21:20', '2020-01-08 06:26:31'),
(451, 'iPhone earpods', 'iphone earpods', 24, 7, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'China', NULL, 500, '100% original', 'empty', 1, 1, '2020-01-08 05:25:35', '2020-01-08 06:26:27'),
(452, 'Boat Bluetooth headphone', 'boat bluetooth headphone', 24, 8, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'China', NULL, 500, '100% original', 'empty', 1, 1, '2020-01-08 05:29:32', '2020-01-08 06:26:24'),
(453, 'Lebon', 'lebon', 24, 11, 22.70077430, 88.34821880, '712235', 'Hooghly', 'LB-DC-518', 'China', NULL, 180, '100% original', 'empty', 1, 1, '2020-01-08 05:33:10', '2020-01-08 06:26:22'),
(455, 'Lebon data cable', 'lebon data cable', 24, 11, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'Lebon', NULL, 100, '100% original product', 'empty', 1, 1, '2020-01-08 05:48:34', '2020-01-08 06:26:18'),
(456, 'AE TOOL BOX EMMC PROGRAMMER BY MRT TEAM', 'ae tool box emmc programmer by mrt team', 23, 16, 22.53173910, 88.31961810, '700023', 'kolkata', 'China', 'China', NULL, 5000, 'AE TOOL BOX EMMC PROGRAMMER BY MRT TEAM\r\nthis is 100% original product .for more detail call or whatsapp us.', 'empty', 1, 1, '2020-01-08 06:01:04', '2020-01-08 06:26:15'),
(457, 'Lebon data cable', 'lebon data cable-2', 24, 11, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'Lebon', NULL, 100, '100% original product', 'empty', 1, 1, '2020-01-08 06:03:17', '2020-01-08 06:25:39'),
(460, 'Divine int', 'divine int-2', 31, 11, 22.70077430, 88.34821880, '712235', 'Hoogly', 'China', 'Divine int', NULL, 180, '100% original', 'empty', 1, 1, '2020-01-08 06:29:00', '2020-01-08 06:30:10'),
(461, 'Troops bluetooth earphone', 'troops bluetooth earphone', 31, 8, 22.70077430, 88.34821880, '712235', 'Hoogly', 'Tp 7024', 'Troops', NULL, 300, '100% original', 'empty', 1, 1, '2020-01-08 06:41:43', '2020-01-08 07:12:18'),
(462, 'Oneness charger', 'oneness charger', 31, 12, 22.70077430, 88.34821880, '712235', 'Hoogly', 'DN 22G', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-08 06:45:46', '2020-01-08 07:12:52'),
(463, 'Ktrs charger', 'ktrs charger', 31, 12, 22.70077430, 88.34821880, '712235', 'Hoogly', 'KS_CH041', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-08 06:53:24', '2020-01-08 07:08:11'),
(464, 'Sony headphone', 'sony headphone', 31, 7, 22.70077430, 88.34821880, '712235', 'Hoogly', 'China', 'Sony', NULL, 150, '100% ORIGINAL', 'empty', 1, 1, '2020-01-08 06:56:13', '2020-01-08 07:08:13'),
(466, 'Erd data cable type C', 'erd data cable type c', 24, 11, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'China', NULL, 180, '100% original', 'empty', 1, 1, '2020-01-08 07:10:21', '2020-01-08 07:13:16'),
(468, 'Kdm battery', 'kdm battery', 24, 5, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-08 07:41:09', '2020-01-08 07:56:30'),
(469, 'Nokia headphone', 'nokia headphone', 24, 7, 22.70077430, 88.34821880, '712235', 'Hooghly', 'WH_108', 'China', NULL, 199, '100% original', 'empty', 1, 1, '2020-01-08 07:45:19', '2020-01-08 07:57:53'),
(470, 'Erd charger', 'erd charger', 24, 12, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'China', NULL, 250, '100% original', 'empty', 1, 1, '2020-01-08 07:47:40', '2020-01-08 07:59:55'),
(471, 'Divine int charger', 'divine int charger', 24, 12, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'China', NULL, 350, '100% original', 'empty', 1, 1, '2020-01-08 07:50:29', '2020-01-08 08:07:48'),
(472, 'And longer battery', 'and longer battery', 24, 5, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-01-08 07:52:18', '2020-01-08 11:36:43'),
(473, 'Unix battery', 'unix battery', 24, 5, 22.70077430, 88.34821880, '712235', 'Hooghly', 'BL- 5C', 'China', NULL, 200, '100% original', 'empty', 1, 1, '2020-01-08 07:53:50', '2020-01-08 09:55:29'),
(474, 'Ifone lnt.', 'ifone lnt.', 24, 12, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-08 07:59:37', '2020-01-08 09:58:03'),
(475, 'Alfa lnt.', 'alfa lnt.', 24, 12, 22.70077430, 88.34821880, '712235', 'Hooghly', 'MAI7-3c', 'China', NULL, 80, '100% original', 'empty', 1, 1, '2020-01-08 08:02:23', '2020-01-08 09:57:51'),
(476, 'Nexia', 'nexia', 24, 12, 22.70077430, 88.34821880, '712235', 'Hooghly', 'N.70', 'China', NULL, 80, '100% orignal', 'empty', 1, 1, '2020-01-08 08:04:55', '2020-01-08 09:57:41'),
(477, 'N.G charger', 'n.g charger', 24, 12, 22.70077430, 88.34821880, '712235', 'Hooghly', '3310', 'China', NULL, 100, '100% orignal', 'empty', 1, 1, '2020-01-08 08:06:38', '2020-01-08 09:56:42'),
(478, 'Ifone lnt', 'ifone lnt', 24, 12, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'China', NULL, 100, '100% original', 'empty', 1, 1, '2020-01-08 08:11:47', '2020-01-08 09:56:32'),
(479, 'Realme', 'realme', 24, 8, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Rma101', 'China', NULL, 350, '100% original', 'empty', 1, 1, '2020-01-08 08:15:40', '2020-01-08 09:56:23'),
(480, 'Ktrs', 'ktrs', 24, 12, 22.70077430, 88.34821880, '712235', 'Hooghly', 'KS-CH041', 'China', NULL, 200, '100% original', 'empty', 1, 1, '2020-01-08 08:17:00', '2020-01-08 09:56:04');
INSERT INTO `sell_products` (`id`, `title`, `slug`, `seller_id`, `sell_category_id`, `latitude`, `longitude`, `postal_code`, `city`, `model`, `brands`, `no_of_item`, `price`, `description`, `image`, `active`, `user_product_active`, `created_at`, `updated_at`) VALUES
(481, 'Yroto', 'yroto', 24, 8, 22.70077430, 88.34821880, '712235', 'Hooghly', 'GL-15', 'China', NULL, 250, '100% original', 'empty', 1, 1, '2020-01-08 08:25:00', '2020-01-08 09:55:57'),
(482, 'Bt-21', 'bt-21', 24, 8, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'China', NULL, 350, '100% original', 'empty', 1, 1, '2020-01-08 08:26:53', '2020-01-08 09:55:41'),
(483, 'DOOR OF FASHION Battery Compatible for HTC Desire 526', 'door of fashion battery compatible for htc desire 526', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC Desire 526', 'DOOR OF FASHION', NULL, 599, 'Brand	DOOR OF FASHION\r\nItem Weight	4.54 g\r\nPackage Dimensions	1 x 1 x 1 cm\r\nItem part number	DOFHTC526\r\nCompatible Devices	HTC Desire\r\nBatteries Included	No\r\nBatteries Required	No\r\nBattery Cell Composition	Lithium Ion', 'empty', 1, 1, '2020-01-08 11:44:48', '2020-01-08 12:19:52'),
(484, 'Generic Battery For HTC Desire 616 BOPBM100', 'generic battery for htc desire 616 bopbm100', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC Desire 616', 'GENERIC', NULL, 499, 'Brand	GENERIC\r\nItem Weight	81.6 g\r\nPackage Dimensions	7 x 5.5 x 0.3 cm\r\nBatteries Included	No\r\nBatteries Required	No', 'empty', 1, 1, '2020-01-08 11:52:17', '2020-01-08 11:58:26'),
(485, 'Internal Battery for HTC Desire 700 Bm65100', 'internal battery for htc desire 700 bm65100', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC Desire 700', 'Generic', NULL, 499, 'Brand	Generic\r\nModel	Htc Desire 700 Bm65100\r\nItem model number	Htc Desire 700 Bm65100\r\nCompatible Devices	Htc Desire 700 Bm65100', 'empty', 1, 1, '2020-01-08 12:02:40', '2020-01-08 12:15:37'),
(486, 'RJR Compitable for HTC 1650 mAh Battery HTC Desire VC', 'rjr compitable for htc 1650 mah battery htc desire vc', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC Desire VC', 'RJR', NULL, 699, 'Brand	RJR\r\nItem part number	RJR_BATTERY_HTC_DESIRE_VC\r\nCompatible Devices	HTC Desire\r\nNumber Of Items	1', 'empty', 1, 1, '2020-01-08 12:15:34', '2020-01-08 12:19:41'),
(487, 'CELLQON Compatible Mobile Battery for HTC Incredible S', 'cellqon compatible mobile battery for htc incredible s', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC Incredible S', 'CELLQON', NULL, 793, 'Brand	CELLQON\r\nModel	New Battery-89\r\nItem model number	New Battery-89\r\nCompatible Devices	HTC Incredible S\r\nBatteries Included	No', 'empty', 1, 1, '2020-01-08 12:24:49', '2020-01-08 12:29:49'),
(488, 'K4SS Mobile Battery for HTC Desire 620G 620-2100mah', 'k4ss mobile battery for htc desire 620g 620-2100mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC 620', 'K4SS', NULL, 499, 'Brand	K4SS\r\nModel	K4SSMNBTRY-1012\r\nItem model number	K4SSMNBTRY-1012\r\nCompatible Devices	HTC Desire', 'empty', 1, 1, '2020-01-08 12:31:18', '2020-01-09 05:50:31'),
(489, 'Yoroto', 'yoroto', 24, 8, 22.70077430, 88.34821880, '712235', 'Hooghly', 'GL-28', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 05:30:23', '2020-01-09 05:50:36'),
(490, 'Syska earphones', 'syska earphones', 24, 8, 22.70077430, 88.34821880, '712235', 'Hooghly', 'H_15', 'China', NULL, 300, '100% original', 'empty', 1, 1, '2020-01-09 05:34:29', '2020-01-09 05:50:41'),
(491, 'Belief', 'belief', 24, 5, 22.70077430, 88.34821880, '712235', 'Hooghly', 'BL_4CT', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 05:42:47', '2020-01-09 05:50:49'),
(492, 'Nexia', 'nexia-2', 24, 5, 22.70077430, 88.34821880, '712235', 'Hooghly', '4L', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 05:46:01', '2020-01-09 05:50:55'),
(493, 'Maxcell', 'maxcell', 31, 5, 22.70077430, 88.34821880, '712235', 'Hoogly', 'NOK 5310', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 05:49:24', '2020-01-09 05:50:59'),
(494, 'Alfa lnt.', 'alfa lnt.-2', 24, 5, 22.70077430, 88.34821880, '712235', 'Hooghly', 'A7000', 'China', NULL, 300, '100% original', 'empty', 1, 1, '2020-01-09 06:00:09', '2020-01-09 12:17:33'),
(495, 'Robotek', 'robotek', 24, 5, 22.70077430, 88.34821880, '712235', 'Hooghly', 'J5', 'China', NULL, 300, '100% original', 'empty', 1, 1, '2020-01-09 06:02:11', '2020-01-09 12:17:46'),
(496, 'Belief', 'belief-2', 24, 5, 22.70077430, 88.34821880, '712235', 'Hooghly', 'SAM X200', 'China', NULL, 100, '100% original', 'empty', 1, 1, '2020-01-09 06:04:38', '2020-01-09 12:17:58'),
(497, 'Rich boss', 'rich boss', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Vivo y51', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:08:59', '2020-01-09 12:18:04'),
(498, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung m 30 .s', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:13:18', '2020-01-09 12:18:12'),
(499, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung A 20 S', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:17:53', '2020-01-09 12:18:20'),
(500, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung A 10/ M 10', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:20:37', '2020-01-09 12:21:20'),
(501, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung A30S', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:22:37', '2020-01-09 12:18:36'),
(502, 'Lishen', 'lishen', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Oppo F3', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:24:45', '2020-01-09 12:18:41'),
(503, 'Lishonn', 'lishonn', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi 5', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:29:18', '2020-01-09 12:18:46'),
(504, 'Lishen', 'lishen-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung J2 ACE', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:31:40', '2020-01-09 12:24:08'),
(505, 'Lishen', 'lishen-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung J7', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:34:22', '2020-01-09 12:24:05'),
(506, 'Lishen', 'lishen-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung J2 ACE', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:36:18', '2020-01-09 12:24:02'),
(507, 'Lishonn', 'lishonn-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Lenovo K6 POWER', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:38:58', '2020-01-09 12:23:59'),
(508, 'Lishonn', 'lishonn-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Moto E4+', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:40:48', '2020-01-09 12:23:55'),
(509, 'Lishonn', 'lishonn-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi A-1', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:43:00', '2020-01-09 12:23:53'),
(510, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi 7A', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:50:03', '2020-01-09 12:23:52'),
(511, 'Dakkin', 'dakkin', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi note 5', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:52:11', '2020-01-09 12:23:39'),
(512, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Oppo A3S', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:54:14', '2020-01-09 12:23:30'),
(513, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Realme 2', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 06:56:14', '2020-01-09 12:23:20'),
(514, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Lenovo K5+', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:00:55', '2020-01-09 12:31:30'),
(515, 'Golden coast', 'golden coast', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Oppo A-37', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:04:12', '2020-01-09 12:31:27'),
(516, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Nokia A2', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:06:30', '2020-01-09 12:31:21'),
(517, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung J7', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:14:36', '2020-01-09 12:31:43'),
(518, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi C2', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:16:55', '2020-01-09 12:31:37'),
(519, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung A50', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:19:24', '2020-01-09 12:31:55'),
(520, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi note 7 pro', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:21:20', '2020-01-09 12:31:53'),
(521, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi 6A', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:22:46', '2020-01-09 12:32:04'),
(522, 'Big boss', 'big boss', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Nokia A5', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:26:28', '2020-01-09 12:31:14'),
(523, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi 4A', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:28:37', '2020-01-09 12:29:38'),
(524, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi note 3', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:30:32', '2020-01-10 07:03:41'),
(525, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung J2', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:34:09', '2020-01-10 07:03:38'),
(526, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung J5', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:38:23', '2020-01-10 07:03:30'),
(527, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung J-6+', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:40:15', '2020-01-10 07:03:26'),
(528, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung J2', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:43:59', '2020-01-10 07:03:19'),
(529, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung J.6', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:45:28', '2020-01-10 07:03:15'),
(530, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung J10', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:47:42', '2020-01-10 07:03:12'),
(531, 'Rich boss', 'rich boss-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung M10', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:48:48', '2020-01-10 07:03:08'),
(532, 'Funky', 'funky', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung A20s', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 07:57:11', '2020-01-10 07:03:05'),
(533, 'Golden coast', 'golden coast-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung J4+', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-09 08:02:00', '2020-01-10 07:03:00'),
(534, 'S view cover', 's view cover', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Geone P7', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-10 05:24:16', '2020-01-10 07:04:46'),
(535, 'Generic Replacement Internal Battery for HTC Desire 728 D728 D728H 2800 Mah Li-Polymer', 'generic replacement internal battery for htc desire 728 d728 d728h 2800 mah li-polymer', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC Desire 728', 'G n G', NULL, 529, 'Brand	G n G\r\nModel	Bopjx100\r\nItem Weight	40.8 g\r\nPackage Dimensions	9.1 x 8.1 x 0.9 cm\r\nBatteries:	1 Lithium ion batteries required. (included)\r\nItem model number	Bopjx100\r\nCompatible Devices	Htc Desire 728 2800 Mah\r\nNumber Of Items	1\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Ion\r\nMaterial	Lithium ion', 'empty', 1, 1, '2020-01-10 10:43:25', '2020-01-10 12:10:45'),
(536, 'Generic Li-Ion Battery for HTC DESIRE 816', 'generic li-ion battery for htc desire 816', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'TC DESIRE 816', 'Generic', NULL, 429, 'Brand	Generic\r\nItem Weight	81.6 g\r\nPackage Dimensions	16.4 x 11 x 3.2 cm\r\nBatteries:	1 Lithium-ion batteries required. (included)\r\nItem part number	KINGSMB203\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium', 'empty', 1, 1, '2020-01-10 10:46:59', '2020-01-10 12:10:42'),
(537, 'G D Battery for HTC Desire 816 816G B0P9C100 2600 mAh', 'g d battery for htc desire 816 816g b0p9c100 2600 mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC Desire 816 816G', 'Generic', NULL, 600, 'Brand	Generic\r\nModel	HTC 816 BATTERY\r\nItem Weight	4.54 g\r\nPackage Dimensions	6 x 6 x 3 cm\r\nBatteries:	10 Lithium ion batteries required. (included)\r\nItem model number	HTC 816 BATTERY\r\nCompatible Devices	HTC Desire\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Cell Composition	Lithium Ion\r\nBattery Power	2600 milliamp_hours', 'empty', 1, 1, '2020-01-10 10:51:55', '2020-01-10 12:10:54'),
(538, 'Sagar Trading Compatible Battery for 2100mAh BOPE6100 HTC Desire 620 Battery D820 820 Mini D620 D820MU D820MT D620U', 'sagar trading compatible battery for 2100mah bope6100 htc desire 620 battery d820 820 mini d620 d820mu d820mt d620u', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC Desire 620', 'Sagar Trading', NULL, 499, 'Brand	Sagar Trading\r\nModel	BOPE6100\r\nItem Weight	40.8 g\r\nProduct Dimensions	6 x 0.5 x 9 cm\r\nBatteries:	1 Lithium ion batteries required. (included)\r\nItem model number	BOPE6100\r\nCompatible Devices	Sagar Trading compatible Battery for 2100mAh BOPE6100 HTC Desire 620 Battery D820 820 mini D620 D820MU D820MT D620U 620H 620G\r\nNumber Of Items	1\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Capacity	2100 milliamp_hours\r\nBattery Cell Composition	Lithium Ion', 'empty', 1, 1, '2020-01-10 11:07:50', '2020-01-10 12:10:58'),
(539, 'Sharbros Battery Model Bopjx100 2800 Mah Compatible to HTC Desire 828', 'sharbros battery model bopjx100 2800 mah compatible to htc desire 828', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC Desire 828', 'Sharbros', NULL, 588, 'Brand	Sharbros\r\nModel	Bopjx100\r\nItem Weight	49.9 g\r\nPackage Dimensions	8.9 x 8.5 x 1.4 cm\r\nBatteries:	1 Lithium Polymer batteries required. (included)\r\nItem model number	Bopjx100\r\nCompatible Devices	Sharbros Battery Model Bopjx100 Compatible To Htc Desire 828 And E9 Plus 2800 Mah\r\nBatteries Included	Yes\r\nBatteries Required	No\r\nBattery Cell Composition	Lithium Polymer', 'empty', 1, 1, '2020-01-10 11:12:38', '2020-01-10 12:11:02'),
(540, 'SROCK 2300 mAh Compatible Battery for HTC One M7', 'srock 2300 mah compatible battery for htc one m7', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC M7', 'SROCK', NULL, 795, 'Brand	SROCK\r\nItem part number	HTC-ONEM7-BATTERY-SROCK\r\nNumber Of Items	1\r\nBattery Power	2300 milliamp_hours', 'empty', 1, 1, '2020-01-10 11:50:04', '2020-01-10 12:11:09'),
(541, 'Systums Mobile Battery for HTC ONE- M8 /ONE E8 (2600 mah)', 'systums mobile battery for htc one- m8 /one e8 (2600 mah)', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'HTC M8', 'Systums699', NULL, 699, 'Brand	Systums\r\nItem Weight	49.9 g\r\nPackage Dimensions	5 x 5 x 5 cm\r\nItem part number	SYS-ONE-E8\r\nCompatible Devices	HTC One M8\r\nBatteries Required	No\r\nBattery Power	2600 milliamp_hours', 'empty', 1, 1, '2020-01-10 12:07:52', '2020-01-10 12:11:17'),
(542, 'Mahira Enterprises Generic Replacment Internal Battery for Intex Aqua Dream 2 BR2386BE', 'mahira enterprises generic replacment internal battery for intex aqua dream 2 br2386be', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Intex Aqua Dream 2', 'Generic', NULL, 399, 'Brand	Generic\r\nModel	Intex Aqua Dream 2 BR2386BE\r\nItem model number	Intex Aqua Dream 2 BR2386BE\r\nCompatible Devices	Intex Aqua Dream 2 BR2386BE', 'empty', 1, 1, '2020-01-10 12:19:34', '2020-01-10 12:25:03'),
(543, 'ERD Mobile Phone Battery Compatible For Intex Aqua Marvel', 'erd mobile phone battery compatible for intex aqua marvel', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'Aqua Marvel', 'ERD', NULL, 599, 'Brand	ERD\r\nModel	ERD BT-303\r\nItem Weight	49.9 g\r\nPackage Dimensions	12 x 6 x 1 cm\r\nItem model number	ERD BT-303\r\nBatteries Included	No', 'empty', 1, 1, '2020-01-10 12:29:43', '2020-01-10 12:31:50'),
(544, 'Sagar Trading Compatible Battery for Intex Aqua Q1 Aqua Q1+ BR1675AX 1600mAh', 'sagar trading compatible battery for intex aqua q1 aqua q1+ br1675ax 1600mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'AQUA Q1', 'SAGAR TRADING', NULL, 499, 'Brand	SAGAR TRADING\r\nModel	AQUA Q1+\r\nItem Weight	49.9 g\r\nProduct Dimensions	6 x 0.5 x 9 cm\r\nBatteries:	1 Lithium ion batteries required.\r\nItem model number	AQUA Q1+\r\nCompatible Devices	Sagar Trading Compatible Battery for Intex AQUA Q1 AQUA Q1+ BR1675AX 1600mAh\r\nAdditional Features	High Quality Lithium Ion Genuine Battery with proper Amperes\r\nNumber Of Items	1\r\nBattery Capacity	1600 milliamp_hours', 'empty', 1, 1, '2020-01-13 11:58:15', '2020-01-13 12:25:54'),
(545, 'Sagar Trading Compatible Battery for Intex Aqua 4.5E BR1665BO 1600mAh Aqua N11 Aqua Q2', 'sagar trading compatible battery for intex aqua 4.5e br1665bo 1600mah aqua n11 aqua q2', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'AQUA Q1', 'SAGAR TRADING', NULL, 399, 'Brand	SAGAR TRADING\r\nModel	AQUA 4.5 E\r\nItem Weight	49.9 g\r\nProduct Dimensions	6 x 0.5 x 9 cm\r\nBatteries:	1 Lithium ion batteries required.\r\nItem model number	AQUA 4.5 E\r\nCompatible Devices	Sagar Trading Compatible Battery for Intex AQUA 4.5E BR1665BO 1600mAh AQUA N11 AQUA Q2\r\nAdditional Features	High Quality Lithium Ion Genuine Battery with proper Amperes\r\nNumber Of Items	1\r\nBattery Capacity	1600 milliamp_hours', 'empty', 1, 1, '2020-01-13 12:02:19', '2020-01-13 12:31:37'),
(546, 'Sagar Trading Compatible Battery for Intex Aqua Speed HD 335667AR 1850mAh', 'sagar trading compatible battery for intex aqua speed hd 335667ar 1850mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'AQUA Q1', 'SAGAR TRADING', NULL, 399, 'Brand	SAGAR TRADING\r\nModel	AQUA SPEED HD\r\nItem Weight	49.9 g\r\nProduct Dimensions	6 x 0.5 x 9 cm\r\nBatteries:	1 Lithium ion batteries required.\r\nItem model number	AQUA SPEED HD\r\nCompatible Devices	Sagar Trading Compatible Battery for Intex AQUA SPEED HD 335667AR 1850mAh\r\nAdditional Features	High Quality Lithium Ion Genuine Battery with proper Amperes\r\nNumber Of Items	1\r\nBattery Capacity	1850 milliamp_hours', 'empty', 1, 1, '2020-01-13 12:07:58', '2020-01-13 12:31:40'),
(547, 'Sagar Trading Compatible Battery for Intex Aqua Q7 BR2075BU 2000mAh', 'sagar trading compatible battery for intex aqua q7 br2075bu 2000mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'AQUA Q7', 'SAGAR TRADING', NULL, 399, 'Brand	SAGAR TRADING\r\nModel	AQUA Q7\r\nItem Weight	31.8 g\r\nProduct Dimensions	6 x 0.5 x 9 cm\r\nBatteries:	1 Lithium ion batteries required. (included)\r\nItem model number	AQUA Q7\r\nCompatible Devices	Sagar Trading Compatible Battery for Intex Aqua Q7 BR2075BU 2000mAh\r\nAdditional Features	High Quality Lithium Ion Genuine Battery with proper Amperes\r\nNumber Of Items	1\r\nBatteries Included	Yes\r\nBatteries Required	Yes\r\nBattery Capacity	2000 milliamp_hours\r\nBattery Cell Composition	Lithium Ion\r\nBattery Power	2000 milliamp_hours', 'empty', 1, 1, '2020-01-13 12:15:42', '2020-01-13 12:31:45'),
(548, 'Sagar Trading Compatible Battery for Intex Aqua Q5 375557AR 1600mAh', 'sagar trading compatible battery for intex aqua q5 375557ar 1600mah', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'AQUA 5', 'SAGAR TRADING', NULL, 399, 'Brand	SAGAR TRADING\r\nModel	AQUA Q5\r\nItem Weight	49.9 g\r\nProduct Dimensions	6 x 0.5 x 9 cm\r\nBatteries:	1 Lithium ion batteries required.\r\nItem model number	AQUA Q5\r\nCompatible Devices	Sagar Trading Compatible Battery for Intex AQUA Q5 375557AR 1600mAh\r\nAdditional Features	High Quality Lithium Ion Genuine Battery with proper Amperes\r\nNumber Of Items	1\r\nBattery Capacity	1600 milliamp_hours', 'empty', 1, 1, '2020-01-13 12:20:08', '2020-01-13 12:25:45'),
(549, 'Online City World Generic Internal Battery for Intex Aqua R3 Br1455bm', 'online city world generic internal battery for intex aqua r3 br1455bm', 29, 5, 25.61288570, 85.13659210, '800017', 'Patna', 'AQUA R3', 'Generic', NULL, 499, 'Brand	Generic\r\nModel	Intex Aqua R3 Br1455bm\r\nItem model number	Intex Aqua R3 Br1455bm\r\nCompatible Devices	Intex Aqua R3 Br1455bm', 'empty', 1, 1, '2020-01-13 12:27:33', '2020-01-13 12:31:50'),
(551, 'Novateur R11 On-Ear Headphones with Microphone, Lightweight Folding Stereo Bass Headphones with 1.5M Tangle Free Cord, Portable Wired Headphones for Smartphone Tablet Laptop and PUBG', 'novateur r11 on-ear headphones with microphone, lightweight folding stereo bass headphones with 1.5m tangle free cord, portable wired headphones for smartphone tablet laptop and pubg', 23, 7, 22.53173910, 88.31961810, '700023', 'kolkata', 'Novateur', 'China', NULL, 500, 'Novateur R11 On-Ear Headphones with Microphone, Lightweight Folding Stereo Bass Headphones with 1.5M Tangle Free Cord, Portable Wired Headphones for Smartphone Tablet Laptop and PUBG', 'empty', 1, 1, '2020-01-14 07:49:20', '2020-01-14 12:25:42'),
(583, 'Mobile Microscop', 'mobile microscop', 22, 9, 25.61553520, 85.16089850, '800004', 'Patna', 'AZX', 'Sigma', NULL, 12000, 'Latest microscope', 'empty', 1, 1, '2020-01-17 04:59:29', '2020-03-04 06:17:37'),
(584, 'S view cover', 's view cover-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Geone P7', 'China', NULL, 150, '100% original', 'empty', 1, 1, '2020-01-17 07:04:23', '2020-01-17 07:17:18'),
(585, 'Ufi Box', 'ufi box-2', 35, 16, 23.02441580, 72.66456600, '382415', 'Ahmedabad', 'Ufi Indian Edition', 'Ufi', NULL, 17000, 'Ufi Box', 'empty', 1, 1, '2020-01-18 11:16:57', '2020-01-21 12:13:19'),
(587, 'Hitage', 'hitage-2', 24, 8, 22.70077430, 88.34821880, '712235', 'Hooghly', 'HB 6786', 'China', NULL, 500, '100% original', 'empty', 1, 1, '2020-02-18 06:38:21', '2020-02-18 06:41:35'),
(599, 'Charging Connectors', 'charging connectors', 88, 12, 19.65306470, 78.54337010, '504001', 'Adilabad', 'Universal', 'SK', NULL, 45, 'Support All Version Of Android Mobiles Very Easy To Remove And Install Support Moto And Asus and Also Mi Vivo intex karbonn Mobiles', 'empty', 1, 1, '2020-02-21 10:00:58', '2020-02-21 10:16:29'),
(603, 'Mi', 'mi', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi 6 pro', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-24 07:41:19', '2020-02-24 08:42:57'),
(604, 'Baseus', 'baseus', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi note 5', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-24 07:43:18', '2020-02-24 10:48:01'),
(605, 'Mi', 'mi-2', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi note 7 pro', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-24 07:44:34', '2020-02-24 10:48:14'),
(606, 'The warrior', 'the warrior', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi 6 pro', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-24 07:46:00', '2020-02-24 10:48:30'),
(607, 'Case', 'case', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi 5', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-24 07:47:22', '2020-02-24 10:49:03'),
(608, 'Km kelims', 'km kelims', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Ureks 5510', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-24 07:49:24', '2020-02-24 10:49:10'),
(609, 'Samsung', 'samsung', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung j6', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-24 07:50:26', '2020-02-24 10:52:37'),
(610, 'Baseus', 'baseus-2', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'J 7 pro', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-24 07:51:51', '2020-02-24 10:52:44'),
(611, 'U case', 'u case', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mmx A106', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-24 07:53:12', '2020-02-24 10:52:51'),
(612, 'Air pods', 'air pods', 118, 8, 26.01747360, 90.28078680, '783129', 'Goalpara', 'i 11 tws', 'I 11', NULL, 350, 'i 11  5.0 new version Bluetooth Airports', 'empty', 1, 1, '2020-02-25 17:14:16', '2020-02-26 08:11:10'),
(613, 'Airports', 'airports', 118, 8, 26.01747360, 90.28078680, '783129', 'Goalpara', 'i12 Tws', 'Airport', NULL, 400, 'Dual ear Bluetooth ,in 4 color..', 'empty', 1, 1, '2020-02-25 17:18:28', '2020-02-26 08:11:21'),
(614, 'HP Pandrive', 'hp pandrive', 118, 14, 26.01747360, 90.28078680, '783129', 'Goalpara', '32Gb', 'HP', NULL, 399, 'Hp Pandrive 32Gb matal..', 'empty', 1, 1, '2020-02-25 17:28:37', '2020-02-26 08:11:25'),
(615, 'Hp Pandrive', 'hp pandrive-2', 118, 14, 26.01747360, 90.28078680, '783129', 'Goalpara', '64Gb', 'Hp', NULL, 449, 'Hp Pandrive 64Gb matal....', 'empty', 1, 1, '2020-02-25 17:29:37', '2020-02-26 08:11:31'),
(616, 'Nextgen', 'nextgen', 24, 7, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Ng 115', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 06:41:02', '2020-02-26 08:11:36'),
(617, 'Ubon', 'ubon', 24, 8, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Ub 750', 'China', NULL, 350, '100% original', 'empty', 1, 1, '2020-02-26 06:42:07', '2020-02-26 08:11:40'),
(618, 'Hitage', 'hitage', 24, 7, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Ht 27', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 06:43:18', '2020-02-26 08:11:45'),
(619, 'Ulike', 'ulike', 24, 7, 22.70077430, 88.34821880, '712235', 'Hooghly', 'U hf 1', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 06:44:55', '2020-02-26 08:11:52'),
(620, 'Ubon', 'ubon-2', 24, 7, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Sp 31', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 06:45:57', '2020-02-26 08:11:56'),
(621, 'Sonilex', 'sonilex', 24, 8, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Slg 39ep', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 06:47:17', '2020-02-26 08:12:16'),
(622, 'Nextgen', 'nextgen-2', 24, 7, 22.70077430, 88.34821880, '712235', 'Hooghly', '95', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 06:48:41', '2020-02-26 08:12:19'),
(623, 'Hitech', 'hitech', 24, 7, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Hitech', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 06:50:16', '2020-02-26 08:12:21'),
(624, 'Vivo', 'vivo', 24, 7, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Rd 08', 'China', NULL, 200, '100% original', 'empty', 1, 1, '2020-02-26 06:51:40', '2020-02-26 08:12:24'),
(625, 'Kps', 'kps', 24, 7, 22.70077430, 88.34821880, '712235', 'Hooghly', 'China', 'Kps', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 06:53:24', '2020-02-26 08:12:26'),
(626, 'Lebon', 'lebon-2', 24, 7, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Lb c 35', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 06:55:04', '2020-02-26 08:12:28'),
(627, 'Uc case', 'uc case', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Nokia 5', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 06:57:13', '2020-02-26 08:12:30'),
(628, 'Redmi', 'redmi', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi A-1', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 06:58:23', '2020-02-26 08:12:33'),
(629, 'Ipaky', 'ipaky', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Mi note 3', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 06:59:25', '2020-02-26 08:12:36'),
(630, 'Rexten case', 'rexten case', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung on 7', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 07:00:59', '2020-02-26 08:12:39'),
(631, 'Happy ant', 'happy ant', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung z2', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 07:02:17', '2020-02-26 08:12:56'),
(632, 'Moshi', 'moshi', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung 7562', 'China', NULL, 100, '100% original', 'empty', 1, 1, '2020-02-26 07:03:42', '2020-02-26 08:12:59'),
(633, 'U care', 'u care', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'À57', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 07:04:57', '2020-02-26 08:13:02'),
(634, 'Hello kitty', 'hello kitty', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Samsung grand prime', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 07:06:56', '2020-02-26 08:13:04'),
(635, 'Nokia', 'nokia', 24, 4, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Nokia 520', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 07:08:51', '2020-02-26 08:13:06'),
(637, 'S view cover', 's view cover-2', 24, 13, 22.70077430, 88.34821880, '712235', 'Hooghly', 'Gionee  P7', 'China', NULL, 120, '100% original', 'empty', 1, 1, '2020-02-26 13:43:13', '2020-02-27 12:16:21'),
(638, 'Lenovo K3 Note With Frame', 'lenovo k3 note with frame', 122, 6, 28.64556700, 77.21109720, '110055', 'New Delhi', 'K3', 'Lenovo', NULL, 800, 'Original Combo. Price may change as per demand & supply.\r\nCourier service not available. Visit shop to buy .', 'empty', 1, 1, '2020-02-27 07:00:59', '2020-02-27 07:03:34'),
(639, 'Comio C2 lite', 'comio c2 lite', 122, 6, 28.64556700, 77.21109720, '110055', 'New Delhi', 'C2 Lite', 'Comio', NULL, 650, '100 % OG. \r\nPrice vary as per demand.', 'empty', 1, 1, '2020-02-28 10:43:38', '2020-02-28 10:43:55'),
(640, 'Real C2 Folder', 'real c2 folder', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'C2', 'RealMe', NULL, 1200, 'Original folder of Realme c2. \r\nPrice may vary .', 'empty', 1, 1, '2020-02-28 11:52:04', '2020-02-28 11:52:31'),
(641, 'Oppo A71 Folder', 'oppo a71 folder', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'A71', 'Oppo', NULL, 750, 'Oppo A71 Folder . Original. \r\nPrice may change.', 'empty', 1, 1, '2020-02-28 12:05:29', '2020-02-28 12:05:41'),
(642, 'Bset oca mashine', 'bset oca mashine', 137, 17, 25.61206710, 85.16078400, '800004', 'Patna', 'J2', 'Bset', NULL, 45000, '1 year warranty', 'empty', 1, 1, '2020-02-29 06:59:25', '2020-02-29 07:16:57'),
(643, 'miracle box', 'miracle box-2', 139, 16, 29.85844680, 74.14748460, '335062', 'sadul-shahar', 'xxxx', 'box', NULL, 3000, '9783532803', 'empty', 1, 1, '2020-02-29 13:08:10', '2020-03-01 06:02:58'),
(644, 'Folder', 'folder', 137, 6, 25.61206710, 85.16078400, '800004', 'Patna', 'SAMSUNG J7PRIME', 'SAMSUNG', NULL, 1200, 'Og Folder 100% 9661719490 HELLO BROTHER MOBILE', 'empty', 1, 1, '2020-02-29 18:53:12', '2020-03-01 06:03:07'),
(645, 'Oppo', 'oppo', 137, 6, 25.61206710, 85.16078400, '800004', 'Patna', 'Oppo A3s', 'Oppo', NULL, 1400, 'Care Of 100,% Hello Brother Mobile 9661719490', 'empty', 1, 1, '2020-02-29 18:56:48', '2020-03-01 06:03:25'),
(646, 'Nokia', 'nokia-2', 137, 6, 25.61206710, 85.16078400, '800004', 'Patna', 'Nokia 5.1+', 'Nokia', NULL, 1400, 'Nokia 100 care og 1000% Hello broter mobile 9661719490', 'empty', 1, 1, '2020-02-29 19:00:14', '2020-03-01 06:03:31'),
(647, 'Nokia', 'nokia-2', 137, 6, 25.61206710, 85.16078400, '800004', 'Patna', 'Nokia 5', 'Noka', NULL, 1200, 'Nokia Care og 100% Hello Brother Mobile', 'empty', 1, 1, '2020-02-29 19:01:54', '2020-03-01 06:03:43'),
(648, 'Samsung', 'samsung-2', 137, 6, 25.61206710, 85.16078400, '800004', 'Patna', 'Samsung j7pro', 'Samsung', NULL, 1200, 'Combo og', 'empty', 1, 1, '2020-02-29 19:03:53', '2020-03-01 06:04:16'),
(649, 'Best', 'best', 137, 17, 25.61206710, 85.16078400, '800004', 'Patna', 'M20', 'Best', NULL, 50000, '2 in 1', 'empty', 1, 1, '2020-02-29 19:05:16', '2020-03-01 06:04:09'),
(650, 'Mi', 'mi-2', 137, 6, 25.61206710, 85.16078400, '800004', 'Patna', 'Mi a2', 'Mi', NULL, 1400, 'Mi a2 1000% Care og Hello Brother Mobile 9661719490', 'empty', 1, 1, '2020-02-29 19:07:27', '2020-03-01 06:03:59'),
(651, 'Samsung', 'samsung-2', 137, 6, 25.61206710, 85.16078400, '800004', 'Patna', 'J7max', 'Samsung j7max', NULL, 1850, 'Og', 'empty', 1, 1, '2020-02-29 19:29:33', '2020-03-01 06:03:50'),
(652, 'Samsung', 'samsung-2', 137, 12, 25.61206710, 85.16078400, '800004', 'Patna', 'Samsung 2am', 'Samsung 2am', NULL, 240, 'Samsung usb charger care og 100% hello brother mobile', 'empty', 1, 1, '2020-02-29 19:32:27', '2020-03-01 06:04:31'),
(653, 'Mi', 'mi-2', 137, 15, 25.61206710, 85.16078400, '800004', 'Patna', 'Mi care og', 'Mi', NULL, 800, 'Mi 100% hello brother mobile', 'empty', 1, 1, '2020-02-29 19:34:12', '2020-03-01 06:04:37'),
(654, '1+', '1+', 137, 12, 25.61206710, 85.16078400, '800004', 'Patna', '1+', '1+', NULL, 450, '1+ 100% charger care og Hello Brother Mobile', 'empty', 1, 1, '2020-02-29 19:36:05', '2020-03-01 06:04:43'),
(655, 'Best', 'best-2', 137, 17, 25.61206710, 85.16078400, '800004', 'Patna', 'Best 192', 'Best', NULL, 3200, 'Best 192', 'empty', 1, 1, '2020-02-29 19:37:40', '2020-03-01 06:04:55'),
(656, 'Gionee F205 Pro LCD with Touch Screen', 'gionee f205 pro lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'F205', 'Gionee', NULL, 850, 'Compatible Brand 	Gionee\r\nCompatible Model 	Gionee F205 Pro', 'empty', 1, 1, '2020-03-02 08:58:49', '2020-03-02 12:37:02'),
(657, 'Gionee P5W Touch Screen Digitizer', 'gionee p5w touch screen digitizer', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'P5W', 'Gionee', NULL, 650, 'Compatible Brand	Gionee\r\nCompatible Model	Gionee P5W', 'empty', 1, 1, '2020-03-02 09:02:37', '2020-03-02 12:36:56'),
(658, 'Honor 8 Pro LCD with Touch Scree', 'honor 8 pro lcd with touch scree', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Honor 8 Pro', 'HONOR', NULL, 1350, 'Compatible Brand 	Honor\r\nCompatible Model 	Huawei Honor 8 Pro', 'empty', 1, 1, '2020-03-02 11:00:07', '2020-03-02 12:37:32'),
(659, 'Honor 8 LCD with Touch Screen', 'honor 8 lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Honor 8', 'HONOR', NULL, 1200, 'Compatible Brand 	Honor\r\nCompatible Model 	Honor 8', 'empty', 1, 1, '2020-03-02 11:07:07', '2020-03-02 12:37:29'),
(660, 'Honor P 20 lite LCD with Touch Screen', 'honor p 20 lite lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Honor P 20 Lite', 'HONOR', NULL, 1100, 'Compatible Brand 	Honor\r\nCompatible Model 	Honor 20 lite China', 'empty', 1, 1, '2020-03-02 11:15:49', '2020-03-02 12:37:27'),
(661, 'Huawaei Y7 Prime LCD with Touch Screen', 'huawaei y7 prime lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Huwaei Y-7 Prime', 'HUWAEIA', NULL, 1100, 'Compatible Brand 	Huawei\r\nCompatible Model 	Huawei Y7 Prime', 'empty', 1, 1, '2020-03-02 11:21:10', '2020-03-02 12:37:24'),
(662, 'Itel A44 Air LCD with Touch Screen', 'itel a44 air lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Itel A44 Air', 'ITEL', NULL, 700, 'Compatible Brand 	Itel\r\nCompatible Model 	Itel A44 Air', 'empty', 1, 1, '2020-03-02 11:27:20', '2020-03-02 12:39:41'),
(663, 'Itel A44 Power', 'itel a44 power', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Itel A44 Power', 'ITEL', NULL, 700, 'Compatible Brand 	Itel\r\nCompatible Model 	Itel A44 Power', 'empty', 1, 1, '2020-03-02 11:29:28', '2020-03-02 12:39:39'),
(664, 'Itel A45 LCD with Touch Screen', 'itel a45 lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Itel A45', 'ITEL', NULL, 700, 'Compatible Brand 	Itel\r\nCompatible Model 	Itel A45', 'empty', 1, 1, '2020-03-02 11:32:37', '2020-03-02 12:38:29'),
(665, 'InFocus M2 3G Lcd Display with Touch Screen', 'infocus m2 3g lcd display with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'InFocus M2 3G', 'Infocus', NULL, 790, 'Part:  Lcd Display+Touch Screen Digitizer Panel For InFocus M2 3G\r\n\r\nCondition: Brand New (compatible)', 'empty', 1, 1, '2020-03-02 11:38:28', '2020-03-02 12:38:27'),
(666, 'Lava Z60s LCD with Touch Screen', 'lava z60s lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Lava Z60s', 'LAVA', NULL, 650, 'Compatible Brand 	Lava\r\nCompatible Model 	Lava Z60s', 'empty', 1, 1, '2020-03-02 11:42:33', '2020-03-02 12:38:23'),
(667, 'Lava Z70 LCD with Touch Screen', 'lava z70 lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Lava Z70', 'LAVA', NULL, 700, 'Compatible Brand 	Lava\r\nCompatible Model 	Lava Z70', 'empty', 1, 1, '2020-03-02 11:45:55', '2020-03-02 12:38:20'),
(668, 'Lava Z91 LCD with Touch Screen', 'lava z91 lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Lava Z91', 'LAVA', NULL, 750, 'Compatible Brand 	Lava\r\nCompatible Model 	Lava Z91', 'empty', 1, 1, '2020-03-02 11:49:45', '2020-03-02 12:36:25'),
(669, 'LYF Wind 4S RDG LCD Mobile Display', 'lyf wind 4s rdg lcd mobile display', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'LYF Wind 4S', 'LYF', NULL, 700, 'Brand   RDG\r\n\r\nModel Number   RDG Wind 4S -\r\n\r\nCompatible Model  display for Lyf Wind 4S black complete folder', 'empty', 1, 1, '2020-03-02 11:52:48', '2020-03-02 12:36:27'),
(670, 'Micromax Canvas Nitro A311 Touch screen', 'micromax canvas nitro a311 touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Micromax Canvas Nitro A311', 'Miracle Liquids', NULL, 700, 'Brand	Miracle Liquids\r\nItem model number	canvasnitroa311', 'empty', 1, 1, '2020-03-02 11:59:06', '2020-03-02 12:36:30'),
(671, 'Micromax Canvas Nitro A310 RDG LCD Mobile Display', 'micromax canvas nitro a310 rdg lcd mobile display', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Micromax Canvas Nitro A310', 'RDG', NULL, 700, 'Brand  RDG\r\nModel Number RDG Nitro A310 LCD\r\nCompatible Model display for Micromax A310 Canvas Nitro black complete folder', 'empty', 1, 1, '2020-03-02 12:03:13', '2020-03-02 12:36:32'),
(672, 'Micromax C2A  LCD Display Touch Screen', 'micromax c2a  lcd display touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Micromax C2A', 'SURABHI', NULL, 800, 'Brand	SURABHI\r\nItem part number	ASC-141', 'empty', 1, 1, '2020-03-02 12:09:25', '2020-03-02 12:36:03'),
(673, 'Micromax Canvas 2 Plus LCD Screen', 'micromax canvas 2 plus lcd screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Micromax Canvas 2 Plus', 'Micromax', NULL, 900, 'Compatible Brand	Micromax\r\nCompatible Model	Micromax Canvas 2 Plus', 'empty', 1, 1, '2020-03-02 12:12:24', '2020-03-02 12:38:17'),
(674, 'Micromax Canvas Mega E353-Q353 LCD with Touch Screen', 'micromax canvas mega e353-q353 lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Micromax Canvas Mega E353-Q353', 'Micromax', NULL, 700, 'Compatible Brand 	Micromax\r\nCompatible Model 	Micromax Canvas Mega E353-Q353', 'empty', 1, 1, '2020-03-02 12:15:53', '2020-03-02 12:35:49'),
(675, 'Micromax Canvas Infinity Life HS1  LCD Display Touch Screen', 'micromax canvas infinity life hs1  lcd display touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Micromax Canvas Infinity Life HS1', 'YuvKuz', NULL, 700, 'Brand	YuvKuz', 'empty', 1, 1, '2020-03-02 12:19:28', '2020-03-02 12:35:46'),
(676, 'Micromax Q412 LCD Display with Touch Screen Digitizer', 'micromax q412 lcd display with touch screen digitizer', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Micromax Q412', 'Micromax', NULL, 700, 'Brand	Micromax', 'empty', 1, 1, '2020-03-02 12:35:14', '2020-03-02 12:35:44'),
(677, 'Micromax Q4204 Infinity Bharat 5 LCD Display With Touch Screen Glass', 'micromax q4204 infinity bharat 5 lcd display with touch screen glass', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Micromax Q4204 Infinity Bharat 5', 'Micromax', NULL, 900, 'Brand Micromax\r\nmodel Microax q4204 infinity Bharat 5\r\nLCD Display Screen & Touch Screen Combined together', 'empty', 1, 1, '2020-03-03 06:07:31', '2020-03-03 07:17:34'),
(678, 'Micromax Unite 4 Q427 Display LCD With Touch Screen', 'micromax unite 4 q427 display lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Micromax Unite 4 Q427', 'Micromax', NULL, 650, 'Brand  Micromax\r\nModel  Micromax Unite 4 Q427', 'empty', 1, 1, '2020-03-03 06:10:45', '2020-03-03 07:17:19'),
(679, 'Mobiistar C1 LCD with Touch Screen', 'mobiistar c1 lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Mobiistar C1', 'Mobiistar', NULL, 750, 'Compatible Brand 	Mobiistar\r\nCompatible Model 	Mobiistar C1', 'empty', 1, 1, '2020-03-03 06:15:49', '2020-03-03 07:17:22'),
(680, 'Mobiistar CQ LCD with Touch Screen', 'mobiistar cq lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Mobiistar CQ', 'Mobiistar', NULL, 800, 'Compatible Brand 	Mobiistar\r\nCompatible Model 	Mobiistar CQ', 'empty', 1, 1, '2020-03-03 06:17:20', '2020-03-03 07:17:25'),
(681, 'Oppo F11 Pro LCD with Touch Screen', 'oppo f11 pro lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Oppo F11 Pro', 'Oppo', NULL, 1300, 'Compatible Brand	Oppo\r\nCompatible Model	Oppo F11 Pro', 'empty', 1, 1, '2020-03-03 06:21:27', '2020-03-03 07:17:27'),
(682, 'Oppo F3 Display and Touch Screen', 'oppo f3 display and touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Oppo F3', 'Oppo', NULL, 1200, 'Brands  Oppo\r\nModel   Oppo F3', 'empty', 1, 1, '2020-03-03 06:26:40', '2020-03-03 07:18:51'),
(683, 'PANASONIC ELUGA A2 LCD SCREEN WITH DIGITIZER', 'panasonic eluga a2 lcd screen with digitizer', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'PANASONIC ELUGA A2', 'PANASONIC', NULL, 700, 'Brands  PANASONIC \r\nModel  PANASONIC ELUGA A2', 'empty', 1, 1, '2020-03-03 06:30:10', '2020-03-03 07:18:48'),
(684, 'Panasonic Eluga I2 LCD Display With Touch', 'panasonic eluga i2 lcd display with touch', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Panasonic Eluga I2', 'PANASONIC', NULL, 700, 'Brand  PANASONIC\r\nModel  Panasonic Eluga I2', 'empty', 1, 1, '2020-03-03 06:35:34', '2020-03-03 07:18:46'),
(685, 'Panasonic Eluga I4 Display and Touch Screen', 'panasonic eluga i4 display and touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Panasonic Eluga I4', 'PANASONIC', NULL, 700, 'Brands PANASONIC\r\nModel  Panasonic Eluga I4', 'empty', 1, 1, '2020-03-03 06:37:16', '2020-03-03 07:18:44'),
(686, 'Panasonic Eluga I7 Display and Touch Screen', 'panasonic eluga i7 display and touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Panasonic Eluga I7', 'PANASONIC', NULL, 800, 'Brand  PANASONIC\r\nModel  Panasonic Eluga I7', 'empty', 1, 1, '2020-03-03 06:38:49', '2020-03-03 07:18:42'),
(687, 'Panasonic P100 LCD with Touch Screen', 'panasonic p100 lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Panasonic P100', 'PANASONIC', NULL, 800, 'Compatible Brand 	Panasonic\r\nCompatible Model 	Panasonic P100', 'empty', 1, 1, '2020-03-03 06:42:00', '2020-03-03 07:18:40'),
(688, 'Panasonic P55 Novo LCD with Touch Screen', 'panasonic p55 novo lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Panasonic P55 Novo', 'PANASONIC', NULL, 650, 'Compatible Brand 	Panasonic\r\nCompatible Model 	Panasonic P55 Novo', 'empty', 1, 1, '2020-03-03 06:44:34', '2020-03-03 07:18:03'),
(689, 'Xiaomi Mi4i LCD with Touch Screen', 'xiaomi mi4i lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Xiaomi Mi4i', 'Xiaomi', NULL, 650, 'Compatible Brand 	Xiaomi\r\nCompatible Model 	Xiaomi Mi4i', 'empty', 1, 1, '2020-03-03 06:46:41', '2020-03-03 07:18:00'),
(690, 'Xiaomi Redmi 5A  LCD Display With Touch Screen', 'xiaomi redmi 5a  lcd display with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Xiaomi Redmi 5A', 'Xiaomi', NULL, 650, 'Compatible Brand 	Xiaomi\r\nCompatible Model 	Xiaomi Redmi 5A', 'empty', 1, 1, '2020-03-03 06:49:07', '2020-03-03 07:17:58'),
(691, 'Xiaomi Mi A2 Display and Touch Screen', 'xiaomi mi a2 display and touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Xiaomi Mi A2', 'Xiaomi', NULL, 950, 'Compatible Brand 	Xiaomi\r\nCompatible Model 	Xiaomi Mi A2', 'empty', 1, 1, '2020-03-03 06:53:01', '2020-03-03 07:17:56'),
(692, 'Techno i3 Display and Touch Screen', 'techno i3 display and touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Techno i3', 'Tecno', NULL, 700, 'Compatible Brand 	Tecno\r\nCompatible Model 	Tecno i3', 'empty', 1, 1, '2020-03-03 06:56:28', '2020-03-03 07:19:22'),
(693, 'Tecno Camon i4 LCD Display And Touch Screen', 'tecno camon i4 lcd display and touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Tecno i4', 'Tecno', NULL, 1300, 'Brand Tecno\r\nModel Tecno i4', 'empty', 1, 1, '2020-03-03 07:04:47', '2020-03-03 07:19:24'),
(694, 'Tecno i5 LCD with Touch Screen', 'tecno i5 lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Tecno i5', 'Tecno', NULL, 750, 'Compatible Brand 	Tecno\r\nCompatible Model 	Tecno i5', 'empty', 1, 1, '2020-03-03 07:06:26', '2020-03-03 07:19:26'),
(695, 'Tecno IN 2 LCD with Touch Screen', 'tecno in 2 lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Tecno IN 2', 'Tecno', NULL, 700, 'Compatible Brand 	Tecno\r\nCompatible Model 	Tecno Camon I Sky IN2', 'empty', 1, 1, '2020-03-03 07:09:28', '2020-03-03 07:19:28'),
(696, 'Tecno i7 LCD with Touch Screen', 'tecno i7 lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Tecno i7', 'Tecno', NULL, 1350, 'Compatible Brand 	Tecno\r\nCompatible Model 	Tecno i7', 'empty', 1, 1, '2020-03-03 07:11:18', '2020-03-03 07:19:30'),
(697, 'InFocus Turbo 5 Plus LCD with Touch Screen', 'infocus turbo 5 plus lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'InFocus Turbo 5 Plus', 'Infocus', NULL, 1400, 'Compatible Brand 	InFocus\r\nCompatible Model 	InFocus Turbo 5 Plus', 'empty', 1, 1, '2020-03-03 07:13:37', '2020-03-03 07:19:32'),
(698, 'Zenfone 4 Selfie LCD with Touch Screen', 'zenfone 4 selfie lcd with touch screen', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Zenfone 4 Selfie', 'Asus', NULL, 1000, 'Compatible Brand 	Asus\r\nCompatible Model 	Asus Zenfone 4 Selfie', 'empty', 1, 1, '2020-03-03 07:16:05', '2020-03-03 07:19:34'),
(699, 'Lephone', 'lephone', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'W2', 'Lephone', NULL, 299, 'full  cell  battery.', 'empty', 1, 1, '2020-03-04 07:07:55', '2020-03-04 07:17:30'),
(700, 'Lephone', 'lephone-2', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'W7', 'Lephone', NULL, 299, 'Full cell battery', 'empty', 1, 1, '2020-03-04 07:09:55', '2020-03-04 07:12:43'),
(701, 'samsung', 'samsung-2', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'J2', 'samsung', NULL, 299, 'full cell battery', 'empty', 1, 1, '2020-03-04 07:12:16', '2020-03-04 07:18:06'),
(702, 'samsung', 'samsung-2', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'J5', 'samsung', NULL, 299, 'full cell battery', 'empty', 1, 1, '2020-03-04 07:13:07', '2020-03-04 07:18:04'),
(703, 'samsung', 'samsung-2', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'J7', 'samsung', NULL, 299, 'full cell battery', 'empty', 1, 1, '2020-03-04 07:14:28', '2020-03-04 07:18:02'),
(704, 'samsung', 'samsung-2', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'x200', 'samsung', NULL, 99, 'full cell battery', 'empty', 1, 1, '2020-03-04 07:15:27', '2020-03-04 07:17:59'),
(705, 'Itel 15bi', 'itel 15bi', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', '15bi', 'itel', NULL, 199, 'full cell battery', 'empty', 1, 1, '2020-03-04 07:18:37', '2020-03-04 07:31:29'),
(706, 'itel 19ci', 'itel 19ci', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', '19ci', 'itel', NULL, 199, 'full cell battery', 'empty', 1, 1, '2020-03-04 07:19:30', '2020-03-04 07:31:25'),
(707, 'itel 25bi', 'itel 25bi', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', '25bi', 'itel', NULL, 199, 'full cell battery', 'empty', 1, 1, '2020-03-04 07:20:41', '2020-03-04 07:31:22'),
(708, 'nokia 4L', 'nokia 4l', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', '4L', 'Nokia', NULL, 129, 'full cell battery', 'empty', 1, 1, '2020-03-04 07:22:35', '2020-03-04 07:31:17'),
(709, 'nokia 4u', 'nokia 4u', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', '4u', 'nokia', NULL, 129, 'full cell battery', 'empty', 1, 1, '2020-03-04 07:23:29', '2020-03-04 07:31:11'),
(710, 'nokia 4UL', 'nokia 4ul', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', '4UL', 'Nokia', NULL, 129, 'full cell battery', 'empty', 1, 1, '2020-03-04 07:24:17', '2020-03-04 07:31:07'),
(711, 'nokia 5J', 'nokia 5j', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', '5J', 'Nokia', NULL, 129, 'Full cell bettery', 'empty', 1, 1, '2020-03-04 07:25:07', '2020-03-04 07:31:02'),
(712, 'Xiomi 5A', 'xiomi 5a', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'BN34', 'Xiomi', NULL, 399, 'full cell battery.', 'empty', 1, 1, '2020-03-04 07:26:58', '2020-03-04 07:30:24');
INSERT INTO `sell_products` (`id`, `title`, `slug`, `seller_id`, `sell_category_id`, `latitude`, `longitude`, `postal_code`, `city`, `model`, `brands`, `no_of_item`, `price`, `description`, `image`, `active`, `user_product_active`, `created_at`, `updated_at`) VALUES
(714, 'REDMI  4 , Redmi  3S', 'redmi  4 , redmi  3s', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'BM47', 'Xiomi', NULL, 399, 'Full cell battery', 'empty', 1, 1, '2020-03-04 07:29:00', '2020-03-04 07:30:29'),
(715, 'Oppo A57 LCD with Touch Screen', 'oppo a57 lcd with touch screen-2', 122, 3, 28.64556700, 77.21109720, '110055', 'New Delhi', 'Oppo A57', 'Oppo', NULL, 750, 'Model: Oppo A57\r\nBrand: Oppo', 'empty', 1, 1, '2020-03-04 07:29:48', '2020-03-04 07:30:13'),
(716, 'Redmi note 4', 'redmi note 4', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'BN43', 'Xiomi', NULL, 399, 'full cell battery', 'empty', 1, 1, '2020-03-04 07:30:18', '2020-03-04 07:33:43'),
(717, 'Redmi note 4, BN43', 'redmi note 4, bn43', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'BN43', 'Xiomi', NULL, 399, 'FULL CELL BATTERY', 'empty', 1, 1, '2020-03-04 07:33:33', '2020-03-04 07:35:15'),
(718, 'REDMI NOTE 5 PRO , BN-45', 'redmi note 5 pro , bn-45', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'BN45', 'Xiomi', NULL, 399, 'FULL CELL BATTERY', 'empty', 1, 1, '2020-03-04 07:36:56', '2020-03-04 08:19:51'),
(719, 'MI-6-PRO, BN47', 'mi-6-pro, bn47', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'BN47', 'Xiomi', NULL, 399, 'FULL CELL BATTERY', 'empty', 1, 1, '2020-03-04 07:40:21', '2020-03-04 08:19:55'),
(720, 'REDMI-6/6A BN37', 'redmi-6/6a bn37', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'BN37', 'Xiomi', NULL, 399, 'FULL CELL BATTERY', 'empty', 1, 1, '2020-03-04 07:48:14', '2020-03-04 08:20:03'),
(721, 'REDMI NOTE 5 BN-44', 'redmi note 5 bn-44', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'BN44', 'Xiomi', NULL, 399, 'FULL CELL BATTERY', 'empty', 1, 1, '2020-03-04 07:50:03', '2020-03-04 08:20:05'),
(722, 'REDMI 4A BN-30', 'redmi 4a bn-30', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'BN-30', 'Xiomi', NULL, 399, 'FULL CELL BATTERY', 'empty', 1, 1, '2020-03-04 07:51:19', '2020-03-04 08:20:08'),
(723, 'REDMI Y1/Y1LIT/A1  BN-31', 'redmi y1/y1lit/a1  bn-31', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'BN-31', 'Xiomi', NULL, 399, 'FULL CELL BATTERY', 'empty', 1, 1, '2020-03-04 07:52:52', '2020-03-04 08:20:15'),
(724, 'REDMI NOTE 4 BM-46', 'redmi note 4 bm-46', 118, 5, 26.01747360, 90.28078680, '783129', 'Goalpara', 'BM-46', 'Xiomi', NULL, 399, 'FULL CELL BATTERY', 'empty', 1, 1, '2020-03-04 07:54:00', '2020-03-04 08:20:12'),
(725, 'Online mobile flashing', 'online mobile flashing', 164, 3, 13.62446110, 79.43100520, '517501', 'Chittoor', 'j2', 'samsung', NULL, 517501, 'hi', 'empty', 0, 1, '2020-03-04 11:48:36', '2020-03-04 11:48:36');

-- --------------------------------------------------------

--
-- Table structure for table `sell_product_images`
--

CREATE TABLE `sell_product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sell_product_id` bigint(20) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sell_product_images`
--

INSERT INTO `sell_product_images` (`id`, `sell_product_id`, `image`, `created_at`, `updated_at`) VALUES
(9, 4, '1568926772-468045966.jpg', '2019-09-19 20:59:32', '2019-09-19 20:59:32'),
(10, 4, '1568926772-136106170.jpg', '2019-09-19 20:59:32', '2019-09-19 20:59:32'),
(11, 4, '1568926772-1341916784.jpg', '2019-09-19 20:59:32', '2019-09-19 20:59:32'),
(13, 6, '1571202935-1531702088.jpeg', '2019-10-16 05:15:35', '2019-10-16 05:15:35'),
(14, 7, '1571735961-2050951782.jpg', '2019-10-22 09:19:21', '2019-10-22 09:19:21'),
(15, 8, '1571736805-2126901410.jpg', '2019-10-22 09:33:25', '2019-10-22 09:33:25'),
(16, 9, '1571738658-799916.jpg', '2019-10-22 10:04:18', '2019-10-22 10:04:18'),
(17, 10, '1571738843-759189736.jpg', '2019-10-22 10:07:23', '2019-10-22 10:07:23'),
(18, 11, '1571738979-462871884.jpg', '2019-10-22 10:09:39', '2019-10-22 10:09:39'),
(19, 12, '1571739499-1234648794.jpg', '2019-10-22 10:18:19', '2019-10-22 10:18:19'),
(20, 13, '1571739648-531777361.jpg', '2019-10-22 10:20:48', '2019-10-22 10:20:48'),
(21, 14, '1571739870-38780060.jpg', '2019-10-22 10:24:30', '2019-10-22 10:24:30'),
(22, 15, '1571740001-611293232.jpg', '2019-10-22 10:26:41', '2019-10-22 10:26:41'),
(23, 16, '1571741205-266270894.jpg', '2019-10-22 10:46:45', '2019-10-22 10:46:45'),
(24, 17, '1571741393-521535830.jpg', '2019-10-22 10:49:53', '2019-10-22 10:49:53'),
(25, 18, '1571741526-585342423.jpg', '2019-10-22 10:52:06', '2019-10-22 10:52:06'),
(26, 19, '1571742021-1671047645.jpg', '2019-10-22 11:00:21', '2019-10-22 11:00:21'),
(27, 20, '1571742241-1079950561.jpg', '2019-10-22 11:04:01', '2019-10-22 11:04:01'),
(28, 21, '1571742395-1466907603.jpg', '2019-10-22 11:06:35', '2019-10-22 11:06:35'),
(29, 22, '1571742542-1693048810.jpg', '2019-10-22 11:09:02', '2019-10-22 11:09:02'),
(30, 23, '1571742706-279678031.jpg', '2019-10-22 11:11:46', '2019-10-22 11:11:46'),
(31, 24, '1571742861-857978940.jpg', '2019-10-22 11:14:21', '2019-10-22 11:14:21'),
(32, 25, '1571743034-32249624.jpg', '2019-10-22 11:17:14', '2019-10-22 11:17:14'),
(33, 26, '1571743185-987218473.jpg', '2019-10-22 11:19:45', '2019-10-22 11:19:45'),
(34, 27, '1571743675-616505411.jpg', '2019-10-22 11:27:55', '2019-10-22 11:27:55'),
(35, 28, '1571743860-421280404.jpg', '2019-10-22 11:31:00', '2019-10-22 11:31:00'),
(36, 29, '1571744251-440422865.jpg', '2019-10-22 11:37:31', '2019-10-22 11:37:31'),
(37, 30, '1571745081-1171584447.jpg', '2019-10-22 11:51:21', '2019-10-22 11:51:21'),
(38, 31, '1571745479-426493854.jpg', '2019-10-22 11:57:59', '2019-10-22 11:57:59'),
(39, 32, '1571746701-267890584.jpg', '2019-10-22 12:18:21', '2019-10-22 12:18:21'),
(40, 33, '1571822075-916987233.jpg', '2019-10-23 09:14:35', '2019-10-23 09:14:35'),
(41, 34, '1571822308-1707575585.jpg', '2019-10-23 09:18:28', '2019-10-23 09:18:28'),
(42, 35, '1571822654-1737346393.jpg', '2019-10-23 09:24:14', '2019-10-23 09:24:14'),
(43, 36, '1571822881-80328402.jpg', '2019-10-23 09:28:01', '2019-10-23 09:28:01'),
(44, 37, '1571823040-1786374377.jpg', '2019-10-23 09:30:40', '2019-10-23 09:30:40'),
(45, 38, '1571823316-1849197342.jpg', '2019-10-23 09:35:16', '2019-10-23 09:35:16'),
(46, 39, '1571824695-1359180687.jpg', '2019-10-23 09:58:16', '2019-10-23 09:58:16'),
(47, 40, '1571824893-1914206298.jpg', '2019-10-23 10:01:33', '2019-10-23 10:01:33'),
(48, 41, '1571825148-1616293624.jpg', '2019-10-23 10:05:49', '2019-10-23 10:05:49'),
(49, 42, '1571825424-1822421142.jpg', '2019-10-23 10:10:25', '2019-10-23 10:10:25'),
(50, 43, '1571825760-1838214581.jpg', '2019-10-23 10:16:01', '2019-10-23 10:16:01'),
(51, 44, '1571825873-909350078.jpg', '2019-10-23 10:17:54', '2019-10-23 10:17:54'),
(52, 45, '1571913887-151193300.jpg', '2019-10-24 10:44:47', '2019-10-24 10:44:47'),
(53, 46, '1571914099-1604636462.jpg', '2019-10-24 10:48:20', '2019-10-24 10:48:20'),
(54, 47, '1571914495-910145380.jpg', '2019-10-24 10:54:56', '2019-10-24 10:54:56'),
(55, 48, '1571914810-1838529036.jpg', '2019-10-24 11:00:11', '2019-10-24 11:00:11'),
(56, 49, '1571915011-1919957458.jpg', '2019-10-24 11:03:32', '2019-10-24 11:03:32'),
(57, 50, '1571915360-690279602.jpg', '2019-10-24 11:09:21', '2019-10-24 11:09:21'),
(58, 51, '1571915575-1738636663.jpg', '2019-10-24 11:12:56', '2019-10-24 11:12:56'),
(59, 52, '1571915990-1700997299.jpg', '2019-10-24 11:19:50', '2019-10-24 11:19:50'),
(60, 53, '1571916496-265788799.jpg', '2019-10-24 11:28:17', '2019-10-24 11:28:17'),
(61, 54, '1571917358-108216191.jpg', '2019-10-24 11:42:39', '2019-10-24 11:42:39'),
(62, 55, '1571917486-47241510.jpg', '2019-10-24 11:44:47', '2019-10-24 11:44:47'),
(63, 56, '1571917618-858926301.jpg', '2019-10-24 11:46:58', '2019-10-24 11:46:58'),
(64, 57, '1571917974-1542013030.jpg', '2019-10-24 11:52:54', '2019-10-24 11:52:54'),
(65, 58, '1571918034-1857501695.jpg', '2019-10-24 11:53:55', '2019-10-24 11:53:55'),
(66, 59, '1571918113-1084720936.jpg', '2019-10-24 11:55:13', '2019-10-24 11:55:13'),
(67, 60, '1571918318-1300658829.jpg', '2019-10-24 11:58:38', '2019-10-24 11:58:38'),
(68, 61, '1571918506-1714352545.jpg', '2019-10-24 12:01:46', '2019-10-24 12:01:46'),
(69, 62, '1571918981-2025957840.jpg', '2019-10-24 12:09:42', '2019-10-24 12:09:42'),
(70, 63, '1572682733-895134729.png', '2019-11-02 08:18:53', '2019-11-02 08:18:53'),
(71, 64, '1572683971-280150443.jpg', '2019-11-02 08:39:31', '2019-11-02 08:39:31'),
(72, 64, '1572683971-1004828432.jpg', '2019-11-02 08:39:31', '2019-11-02 08:39:31'),
(73, 64, '1572683971-503275576.jpg', '2019-11-02 08:39:31', '2019-11-02 08:39:31'),
(74, 64, '1572683971-1806475700.png', '2019-11-02 08:39:31', '2019-11-02 08:39:31'),
(78, 66, '1572852700-502900224.jpg', '2019-11-04 07:31:40', '2019-11-04 07:31:40'),
(79, 66, '1572852700-1459354233.jpg', '2019-11-04 07:31:41', '2019-11-04 07:31:41'),
(80, 67, '1572853051-1673145151.png', '2019-11-04 07:37:31', '2019-11-04 07:37:31'),
(81, 67, '1572853051-1983937318.jpg', '2019-11-04 07:37:31', '2019-11-04 07:37:31'),
(82, 68, '1572853200-825438500.jpeg', '2019-11-04 07:40:00', '2019-11-04 07:40:00'),
(83, 69, '1572853643-743356759.jpeg', '2019-11-04 07:47:23', '2019-11-04 07:47:23'),
(84, 70, '1572853810-1449259443.jpeg', '2019-11-04 07:50:10', '2019-11-04 07:50:10'),
(85, 71, '1572854113-1512312015.jpg', '2019-11-04 07:55:13', '2019-11-04 07:55:13'),
(86, 72, '1572854314-399512089.jpeg', '2019-11-04 07:58:34', '2019-11-04 07:58:34'),
(87, 73, '1572854462-941179646.jpeg', '2019-11-04 08:01:02', '2019-11-04 08:01:02'),
(88, 74, '1572854612-1547733899.jpg', '2019-11-04 08:03:32', '2019-11-04 08:03:32'),
(89, 75, '1572854722-714560053.jpg', '2019-11-04 08:05:22', '2019-11-04 08:05:22'),
(90, 76, '1572854886-50275951.jpg', '2019-11-04 08:08:06', '2019-11-04 08:08:06'),
(91, 77, '1572854989-413892083.jpg', '2019-11-04 08:09:49', '2019-11-04 08:09:49'),
(92, 78, '1572855141-937598667.jpg', '2019-11-04 08:12:21', '2019-11-04 08:12:21'),
(93, 79, '1572855290-1679990824.jpg', '2019-11-04 08:14:50', '2019-11-04 08:14:50'),
(94, 80, '1572855397-1469217888.jpg', '2019-11-04 08:16:37', '2019-11-04 08:16:37'),
(95, 81, '1572855489-569460889.jpg', '2019-11-04 08:18:09', '2019-11-04 08:18:09'),
(96, 82, '1572855620-1796833572.jpg', '2019-11-04 08:20:20', '2019-11-04 08:20:20'),
(97, 83, '1572855871-283417408.jpg', '2019-11-04 08:24:31', '2019-11-04 08:24:31'),
(98, 84, '1572856047-1706625636.jpeg', '2019-11-04 08:27:27', '2019-11-04 08:27:27'),
(99, 85, '1572856209-1578614776.png', '2019-11-04 08:30:09', '2019-11-04 08:30:09'),
(100, 86, '1572856289-1667699260.jpg', '2019-11-04 08:31:29', '2019-11-04 08:31:29'),
(101, 87, '1572856426-1986405423.jpg', '2019-11-04 08:33:46', '2019-11-04 08:33:46'),
(102, 88, '1572856521-641689092.jpg', '2019-11-04 08:35:21', '2019-11-04 08:35:21'),
(103, 89, '1572856662-411580687.jpg', '2019-11-04 08:37:42', '2019-11-04 08:37:42'),
(104, 90, '1572858449-1099905285.png', '2019-11-04 09:07:29', '2019-11-04 09:07:29'),
(105, 91, '1572858551-5528110.png', '2019-11-04 09:09:11', '2019-11-04 09:09:11'),
(106, 92, '1572858705-702500169.jpg', '2019-11-04 09:11:45', '2019-11-04 09:11:45'),
(107, 93, '1572859003-680729870.png', '2019-11-04 09:16:43', '2019-11-04 09:16:43'),
(108, 94, '1572859233-2045708731.jpg', '2019-11-04 09:20:33', '2019-11-04 09:20:33'),
(109, 95, '1572859363-754536639.jpg', '2019-11-04 09:22:43', '2019-11-04 09:22:43'),
(110, 96, '1572859491-556778237.jpg', '2019-11-04 09:24:51', '2019-11-04 09:24:51'),
(111, 97, '1572859860-1732913589.jpg', '2019-11-04 09:31:00', '2019-11-04 09:31:00'),
(112, 98, '1572860014-52788914.jpg', '2019-11-04 09:33:34', '2019-11-04 09:33:34'),
(113, 99, '1572860139-2103967555.jpeg', '2019-11-04 09:35:39', '2019-11-04 09:35:39'),
(114, 100, '1572860264-474934976.jpeg', '2019-11-04 09:37:44', '2019-11-04 09:37:44'),
(115, 101, '1572860363-648733912.png', '2019-11-04 09:39:23', '2019-11-04 09:39:23'),
(116, 102, '1572860468-282072813.png', '2019-11-04 09:41:08', '2019-11-04 09:41:08'),
(117, 103, '1572860769-635671857.png', '2019-11-04 09:46:09', '2019-11-04 09:46:09'),
(118, 104, '1572860886-1647937822.jpg', '2019-11-04 09:48:06', '2019-11-04 09:48:06'),
(119, 105, '1572860956-1972097812.jpg', '2019-11-04 09:49:16', '2019-11-04 09:49:16'),
(120, 106, '1572861067-501057184.png', '2019-11-04 09:51:07', '2019-11-04 09:51:07'),
(121, 107, '1572861144-885905665.jpg', '2019-11-04 09:52:24', '2019-11-04 09:52:24'),
(122, 108, '1572941082-2123938219.png', '2019-11-05 08:04:42', '2019-11-05 08:04:42'),
(123, 109, '1572944026-1725970722.jpg', '2019-11-05 08:53:46', '2019-11-05 08:53:46'),
(124, 109, '1572944026-730011652.jpg', '2019-11-05 08:53:46', '2019-11-05 08:53:46'),
(125, 109, '1572944026-1753380370.png', '2019-11-05 08:53:46', '2019-11-05 08:53:46'),
(130, 112, '1573205046-1801640675.jpg', '2019-11-08 09:24:06', '2019-11-08 09:24:06'),
(131, 113, '1573205189-24824735.png', '2019-11-08 09:26:29', '2019-11-08 09:26:29'),
(132, 113, '1573205189-824627930.png', '2019-11-08 09:26:29', '2019-11-08 09:26:29'),
(133, 114, '1573209118-705024196.png', '2019-11-08 10:31:58', '2019-11-08 10:31:58'),
(134, 114, '1573209118-200198544.png', '2019-11-08 10:31:58', '2019-11-08 10:31:58'),
(135, 115, '1575358372-1906735112.jpeg', '2019-12-03 07:32:52', '2019-12-03 07:32:52'),
(136, 160, '1576784948-951510206.png', '2019-12-19 19:49:08', '2019-12-19 19:49:08'),
(137, 161, '1576788256-548001630.jpg', '2019-12-19 20:44:16', '2019-12-19 20:44:16'),
(138, 162, '1576826617-1010361977.jpeg', '2019-12-20 07:23:37', '2019-12-20 07:23:37'),
(139, 163, '1576828205-1925680609.png', '2019-12-20 07:50:05', '2019-12-20 07:50:05'),
(140, 164, '1577085394-1187790627.jpeg', '2019-12-23 07:16:34', '2019-12-23 07:16:34'),
(141, 165, '1577089247-1945060615.jpg', '2019-12-23 08:20:47', '2019-12-23 08:20:47'),
(142, 165, '1577089247-201434990.bmp', '2019-12-23 08:20:47', '2019-12-23 08:20:47'),
(143, 166, '1577089373-932359738.jpg', '2019-12-23 08:22:53', '2019-12-23 08:22:53'),
(144, 167, '1577089570-371774633.png', '2019-12-23 08:26:10', '2019-12-23 08:26:10'),
(145, 168, '1577089717-664920279.jpg', '2019-12-23 08:28:37', '2019-12-23 08:28:37'),
(146, 169, '1577527905-140978658.JPG', '2019-12-28 10:11:45', '2019-12-28 10:11:45'),
(147, 169, '1577527905-1534758896.JPG', '2019-12-28 10:11:45', '2019-12-28 10:11:45'),
(149, 171, '1577602153-74566643.png', '2019-12-29 06:49:13', '2019-12-29 06:49:13'),
(150, 172, '1577602268-298770537.jpeg', '2019-12-29 06:51:08', '2019-12-29 06:51:08'),
(151, 173, '1577602436-1119602992.jpeg', '2019-12-29 06:53:56', '2019-12-29 06:53:56'),
(152, 174, '1577602592-434436753.jpeg', '2019-12-29 06:56:32', '2019-12-29 06:56:32'),
(153, 175, '1577602726-104284649.jpg', '2019-12-29 06:58:46', '2019-12-29 06:58:46'),
(154, 176, '1577685176-151980314.jpg', '2019-12-30 05:52:56', '2019-12-30 05:52:56'),
(155, 177, '1577685290-1175928198.jpg', '2019-12-30 05:54:50', '2019-12-30 05:54:50'),
(156, 178, '1577686882-818200122.jpg', '2019-12-30 06:21:22', '2019-12-30 06:21:22'),
(157, 179, '1577687802-8714076.jpg', '2019-12-30 06:36:42', '2019-12-30 06:36:42'),
(158, 180, '1577688705-1331529192.jpg', '2019-12-30 06:51:45', '2019-12-30 06:51:45'),
(159, 181, '1577697466-1568415200.jpg', '2019-12-30 09:17:46', '2019-12-30 09:17:46'),
(160, 182, '1577697527-37288718.jpg', '2019-12-30 09:18:47', '2019-12-30 09:18:47'),
(161, 183, '1577697591-1139961634.jpg', '2019-12-30 09:19:51', '2019-12-30 09:19:51'),
(162, 184, '1577697748-1981523344.jpg', '2019-12-30 09:22:28', '2019-12-30 09:22:28'),
(163, 184, '1577697748-908441651.jpg', '2019-12-30 09:22:28', '2019-12-30 09:22:28'),
(164, 185, '1577697834-1905111433.jpg', '2019-12-30 09:23:54', '2019-12-30 09:23:54'),
(165, 186, '1577697956-404754082.jpg', '2019-12-30 09:25:56', '2019-12-30 09:25:56'),
(166, 187, '1577698360-262723194.jpg', '2019-12-30 09:32:40', '2019-12-30 09:32:40'),
(167, 188, '1577699073-1557732726.jpg', '2019-12-30 09:44:33', '2019-12-30 09:44:33'),
(168, 189, '1577699219-342336269.jpg', '2019-12-30 09:46:59', '2019-12-30 09:46:59'),
(169, 190, '1577700493-125880728.jpg', '2019-12-30 10:08:13', '2019-12-30 10:08:13'),
(170, 191, '1577700595-1878236774.jpg', '2019-12-30 10:09:55', '2019-12-30 10:09:55'),
(171, 192, '1577700731-241819969.jpg', '2019-12-30 10:12:11', '2019-12-30 10:12:11'),
(172, 193, '1577700810-156377421.jpg', '2019-12-30 10:13:30', '2019-12-30 10:13:30'),
(173, 194, '1577700886-1078782341.jpg', '2019-12-30 10:14:46', '2019-12-30 10:14:46'),
(174, 195, '1577700967-1797991262.jpg', '2019-12-30 10:16:07', '2019-12-30 10:16:07'),
(175, 196, '1577701060-772507286.jpg', '2019-12-30 10:17:40', '2019-12-30 10:17:40'),
(176, 197, '1577701133-1630823793.jpg', '2019-12-30 10:18:53', '2019-12-30 10:18:53'),
(177, 198, '1577701562-295240757.jpg', '2019-12-30 10:26:02', '2019-12-30 10:26:02'),
(178, 199, '1577701788-525488915.jpg', '2019-12-30 10:29:48', '2019-12-30 10:29:48'),
(179, 200, '1577701898-56466298.jpg', '2019-12-30 10:31:38', '2019-12-30 10:31:38'),
(180, 201, '1577705407-129414725.jpg', '2019-12-30 11:30:07', '2019-12-30 11:30:07'),
(181, 202, '1577705462-1545445986.jpg', '2019-12-30 11:31:02', '2019-12-30 11:31:02'),
(182, 203, '1577705524-1600869960.jpg', '2019-12-30 11:32:04', '2019-12-30 11:32:04'),
(183, 204, '1577705585-102413396.jpg', '2019-12-30 11:33:05', '2019-12-30 11:33:05'),
(184, 205, '1577705635-363996987.jpg', '2019-12-30 11:33:55', '2019-12-30 11:33:55'),
(185, 206, '1577705761-626232964.jpg', '2019-12-30 11:36:01', '2019-12-30 11:36:01'),
(186, 207, '1577705880-1466543930.jpg', '2019-12-30 11:38:00', '2019-12-30 11:38:00'),
(187, 208, '1577706145-983059352.jpg', '2019-12-30 11:42:25', '2019-12-30 11:42:25'),
(188, 209, '1577706188-1422900343.jpg', '2019-12-30 11:43:08', '2019-12-30 11:43:08'),
(189, 210, '1577706237-958943.jpg', '2019-12-30 11:43:57', '2019-12-30 11:43:57'),
(190, 211, '1577706290-1438608616.jpg', '2019-12-30 11:44:50', '2019-12-30 11:44:50'),
(191, 212, '1577706336-1496007524.jpg', '2019-12-30 11:45:36', '2019-12-30 11:45:36'),
(192, 213, '1577706371-1424751913.jpg', '2019-12-30 11:46:11', '2019-12-30 11:46:11'),
(193, 214, '1577779004-314505251.jpg', '2019-12-31 07:56:44', '2019-12-31 07:56:44'),
(194, 215, '1577784646-110497834.jpg', '2019-12-31 09:30:46', '2019-12-31 09:30:46'),
(195, 215, '1577784646-741196725.png', '2019-12-31 09:30:46', '2019-12-31 09:30:46'),
(196, 216, '1577784730-256105468.jpg', '2019-12-31 09:32:10', '2019-12-31 09:32:10'),
(197, 217, '1577784778-1623228108.jpg', '2019-12-31 09:32:58', '2019-12-31 09:32:58'),
(198, 218, '1577784906-1711453234.jpg', '2019-12-31 09:35:06', '2019-12-31 09:35:06'),
(199, 219, '1577784946-1894999193.jpg', '2019-12-31 09:35:46', '2019-12-31 09:35:46'),
(200, 220, '1577784994-1433671186.jpg', '2019-12-31 09:36:34', '2019-12-31 09:36:34'),
(201, 221, '1577785043-283194320.jpg', '2019-12-31 09:37:23', '2019-12-31 09:37:23'),
(202, 222, '1577785100-957945732.jpg', '2019-12-31 09:38:20', '2019-12-31 09:38:20'),
(203, 223, '1577785162-1742644453.jpg', '2019-12-31 09:39:22', '2019-12-31 09:39:22'),
(204, 224, '1577785380-1517616848.jpg', '2019-12-31 09:43:00', '2019-12-31 09:43:00'),
(205, 225, '1577785462-262664682.jpg', '2019-12-31 09:44:22', '2019-12-31 09:44:22'),
(206, 226, '1577785515-902390675.jpg', '2019-12-31 09:45:15', '2019-12-31 09:45:15'),
(207, 227, '1577785658-1384105196.jpg', '2019-12-31 09:47:38', '2019-12-31 09:47:38'),
(208, 228, '1577785738-1398447132.jpg', '2019-12-31 09:48:58', '2019-12-31 09:48:58'),
(209, 229, '1577785796-2040156426.jpg', '2019-12-31 09:49:56', '2019-12-31 09:49:56'),
(210, 230, '1577785861-540888015.jpg', '2019-12-31 09:51:01', '2019-12-31 09:51:01'),
(211, 231, '1577785913-1769020476.jpg', '2019-12-31 09:51:53', '2019-12-31 09:51:53'),
(212, 232, '1577785991-1560044433.jpg', '2019-12-31 09:53:11', '2019-12-31 09:53:11'),
(213, 233, '1577786067-650899840.jpg', '2019-12-31 09:54:27', '2019-12-31 09:54:27'),
(214, 234, '1577786124-267040220.png', '2019-12-31 09:55:24', '2019-12-31 09:55:24'),
(215, 235, '1577786304-1718243345.jpg', '2019-12-31 09:58:24', '2019-12-31 09:58:24'),
(216, 236, '1577786383-508290255.jpg', '2019-12-31 09:59:43', '2019-12-31 09:59:43'),
(217, 237, '1577786452-108804457.jpg', '2019-12-31 10:00:52', '2019-12-31 10:00:52'),
(218, 238, '1577786498-163597445.jpg', '2019-12-31 10:01:38', '2019-12-31 10:01:38'),
(219, 239, '1577786553-682337098.jpg', '2019-12-31 10:02:33', '2019-12-31 10:02:33'),
(220, 240, '1577786818-2082787236.jpg', '2019-12-31 10:06:58', '2019-12-31 10:06:58'),
(221, 241, '1577786901-145375334.jpg', '2019-12-31 10:08:21', '2019-12-31 10:08:21'),
(222, 242, '1577786938-226437959.jpg', '2019-12-31 10:08:58', '2019-12-31 10:08:58'),
(223, 243, '1577786996-1691309101.jpg', '2019-12-31 10:09:56', '2019-12-31 10:09:56'),
(224, 244, '1577787054-2035688418.jpg', '2019-12-31 10:10:54', '2019-12-31 10:10:54'),
(225, 245, '1577787285-1589130420.jpg', '2019-12-31 10:14:45', '2019-12-31 10:14:45'),
(226, 246, '1577787386-2106209230.jpg', '2019-12-31 10:16:26', '2019-12-31 10:16:26'),
(227, 247, '1577787432-374269794.jpg', '2019-12-31 10:17:12', '2019-12-31 10:17:12'),
(228, 248, '1577787494-237546288.jpg', '2019-12-31 10:18:14', '2019-12-31 10:18:14'),
(229, 249, '1577787541-1921134361.jpg', '2019-12-31 10:19:01', '2019-12-31 10:19:01'),
(230, 250, '1577787629-1463605222.jpg', '2019-12-31 10:20:29', '2019-12-31 10:20:29'),
(231, 251, '1577787741-1329362062.jpg', '2019-12-31 10:22:21', '2019-12-31 10:22:21'),
(232, 252, '1577787810-1600933372.jpg', '2019-12-31 10:23:30', '2019-12-31 10:23:30'),
(233, 253, '1577788151-1982339254.jpg', '2019-12-31 10:29:11', '2019-12-31 10:29:11'),
(234, 254, '1577788210-1983986954.jpg', '2019-12-31 10:30:10', '2019-12-31 10:30:10'),
(235, 255, '1577788259-572012689.jpg', '2019-12-31 10:30:59', '2019-12-31 10:30:59'),
(236, 256, '1577788302-1176790426.jpg', '2019-12-31 10:31:42', '2019-12-31 10:31:42'),
(237, 257, '1577788353-932792585.jpg', '2019-12-31 10:32:33', '2019-12-31 10:32:33'),
(238, 258, '1577788399-1016101591.jpg', '2019-12-31 10:33:19', '2019-12-31 10:33:19'),
(239, 259, '1577788444-727399909.jpg', '2019-12-31 10:34:04', '2019-12-31 10:34:04'),
(240, 260, '1577788494-1310346124.jpg', '2019-12-31 10:34:54', '2019-12-31 10:34:54'),
(241, 261, '1577788857-1716949963.jpg', '2019-12-31 10:40:57', '2019-12-31 10:40:57'),
(242, 262, '1577789556-1682253760.jpg', '2019-12-31 10:52:36', '2019-12-31 10:52:36'),
(243, 263, '1577789597-1675678535.jpg', '2019-12-31 10:53:17', '2019-12-31 10:53:17'),
(244, 264, '1577789640-753683352.jpg', '2019-12-31 10:54:00', '2019-12-31 10:54:00'),
(245, 265, '1577789686-1554699260.jpg', '2019-12-31 10:54:46', '2019-12-31 10:54:46'),
(246, 266, '1577789737-128985006.png', '2019-12-31 10:55:37', '2019-12-31 10:55:37'),
(247, 267, '1577789776-1967851798.jpg', '2019-12-31 10:56:16', '2019-12-31 10:56:16'),
(248, 268, '1577789839-32884230.jpg', '2019-12-31 10:57:19', '2019-12-31 10:57:19'),
(249, 269, '1577789892-991318239.jpg', '2019-12-31 10:58:12', '2019-12-31 10:58:12'),
(250, 270, '1577789946-302999653.jpg', '2019-12-31 10:59:06', '2019-12-31 10:59:06'),
(251, 271, '1577789990-2116948167.jpg', '2019-12-31 10:59:50', '2019-12-31 10:59:50'),
(252, 272, '1577790039-914206685.jpg', '2019-12-31 11:00:39', '2019-12-31 11:00:39'),
(253, 273, '1577790092-668995851.jpg', '2019-12-31 11:01:32', '2019-12-31 11:01:32'),
(254, 274, '1577790158-608857496.jpg', '2019-12-31 11:02:38', '2019-12-31 11:02:38'),
(255, 275, '1577790219-1432324733.jpg', '2019-12-31 11:03:39', '2019-12-31 11:03:39'),
(256, 276, '1577790265-737984501.jpg', '2019-12-31 11:04:25', '2019-12-31 11:04:25'),
(257, 277, '1577790312-385684826.jpg', '2019-12-31 11:05:12', '2019-12-31 11:05:12'),
(258, 278, '1577790360-994142634.jpg', '2019-12-31 11:06:00', '2019-12-31 11:06:00'),
(259, 279, '1577790410-963086148.jpg', '2019-12-31 11:06:50', '2019-12-31 11:06:50'),
(260, 280, '1577790464-2004201755.jpg', '2019-12-31 11:07:44', '2019-12-31 11:07:44'),
(261, 281, '1577790516-1511738445.jpg', '2019-12-31 11:08:36', '2019-12-31 11:08:36'),
(262, 282, '1577790568-268227897.jpg', '2019-12-31 11:09:28', '2019-12-31 11:09:28'),
(263, 283, '1577790610-890502075.jpg', '2019-12-31 11:10:10', '2019-12-31 11:10:10'),
(264, 284, '1577790668-689070593.jpg', '2019-12-31 11:11:08', '2019-12-31 11:11:08'),
(265, 285, '1577790737-1797573541.jpg', '2019-12-31 11:12:17', '2019-12-31 11:12:17'),
(266, 286, '1577945363-1331793875.png', '2020-01-02 06:09:23', '2020-01-02 06:09:23'),
(267, 287, '1577945429-1918931926.jpeg', '2020-01-02 06:10:29', '2020-01-02 06:10:29'),
(268, 288, '1577945492-1278660594.jpeg', '2020-01-02 06:11:32', '2020-01-02 06:11:32'),
(269, 289, '1577945552-1753111049.jpeg', '2020-01-02 06:12:32', '2020-01-02 06:12:32'),
(270, 290, '1577945764-1761818237.jpeg', '2020-01-02 06:16:04', '2020-01-02 06:16:04'),
(271, 291, '1577946151-80637553.jpg', '2020-01-02 06:22:31', '2020-01-02 06:22:31'),
(272, 292, '1577947586-488821136.jpg', '2020-01-02 06:46:26', '2020-01-02 06:46:26'),
(273, 293, '1577947637-2145175821.jpg', '2020-01-02 06:47:17', '2020-01-02 06:47:17'),
(274, 294, '1577947672-1191733866.jpg', '2020-01-02 06:47:52', '2020-01-02 06:47:52'),
(275, 295, '1577947708-63901708.jpg', '2020-01-02 06:48:28', '2020-01-02 06:48:28'),
(276, 296, '1577952502-1645771104.jpg', '2020-01-02 08:08:22', '2020-01-02 08:08:22'),
(277, 297, '1577952599-1242399382.jpg', '2020-01-02 08:09:59', '2020-01-02 08:09:59'),
(278, 298, '1577952689-1696256959.jpg', '2020-01-02 08:11:29', '2020-01-02 08:11:29'),
(279, 299, '1577952787-2078584338.jpg', '2020-01-02 08:13:07', '2020-01-02 08:13:07'),
(280, 300, '1577952970-512659148.jpg', '2020-01-02 08:16:10', '2020-01-02 08:16:10'),
(281, 301, '1577953707-1367044426.jpg', '2020-01-02 08:28:27', '2020-01-02 08:28:27'),
(282, 302, '1577953814-457008990.jpg', '2020-01-02 08:30:14', '2020-01-02 08:30:14'),
(283, 303, '1577954267-119683508.jpg', '2020-01-02 08:37:47', '2020-01-02 08:37:47'),
(284, 304, '1577954347-1863228679.jpg', '2020-01-02 08:39:07', '2020-01-02 08:39:07'),
(285, 305, '1577956373-1815406426.jpg', '2020-01-02 09:12:53', '2020-01-02 09:12:53'),
(286, 306, '1577956567-538386153.jpg', '2020-01-02 09:16:07', '2020-01-02 09:16:07'),
(287, 307, '1577956639-89885412.jpg', '2020-01-02 09:17:19', '2020-01-02 09:17:19'),
(288, 308, '1577956708-2098351486.jpg', '2020-01-02 09:18:28', '2020-01-02 09:18:28'),
(289, 309, '1577957031-1296451296.jpg', '2020-01-02 09:23:51', '2020-01-02 09:23:51'),
(290, 310, '1577957099-642302038.jpg', '2020-01-02 09:24:59', '2020-01-02 09:24:59'),
(291, 311, '1577957220-990279592.jpg', '2020-01-02 09:27:00', '2020-01-02 09:27:00'),
(292, 312, '1577957303-320432426.jpg', '2020-01-02 09:28:23', '2020-01-02 09:28:23'),
(293, 313, '1577957374-1666004964.jpg', '2020-01-02 09:29:34', '2020-01-02 09:29:34'),
(294, 314, '1577957440-985858666.jpg', '2020-01-02 09:30:40', '2020-01-02 09:30:40'),
(295, 315, '1577957513-612072430.jpg', '2020-01-02 09:31:53', '2020-01-02 09:31:53'),
(296, 316, '1577957596-412082980.jpg', '2020-01-02 09:33:16', '2020-01-02 09:33:16'),
(297, 317, '1577957842-396673132.jpg', '2020-01-02 09:37:22', '2020-01-02 09:37:22'),
(298, 318, '1577957907-127978583.jpg', '2020-01-02 09:38:27', '2020-01-02 09:38:27'),
(299, 319, '1577957983-1401480584.jpg', '2020-01-02 09:39:43', '2020-01-02 09:39:43'),
(300, 320, '1577958080-437299222.jpg', '2020-01-02 09:41:20', '2020-01-02 09:41:20'),
(301, 321, '1577958185-1533394645.jpg', '2020-01-02 09:43:05', '2020-01-02 09:43:05'),
(302, 321, '1577958185-1007026950.jpg', '2020-01-02 09:43:05', '2020-01-02 09:43:05'),
(303, 322, '1577958264-671392403.jpg', '2020-01-02 09:44:24', '2020-01-02 09:44:24'),
(304, 323, '1577958380-326543371.jpg', '2020-01-02 09:46:20', '2020-01-02 09:46:20'),
(305, 324, '1577960066-638042357.jpg', '2020-01-02 10:14:26', '2020-01-02 10:14:26'),
(306, 325, '1577960113-1603971537.jpg', '2020-01-02 10:15:13', '2020-01-02 10:15:13'),
(307, 326, '1577960371-1905599406.jpg', '2020-01-02 10:19:31', '2020-01-02 10:19:31'),
(308, 327, '1577960410-1419257207.jpg', '2020-01-02 10:20:10', '2020-01-02 10:20:10'),
(309, 328, '1577960448-1840077452.jpg', '2020-01-02 10:20:48', '2020-01-02 10:20:48'),
(310, 329, '1577960490-2145596709.jpg', '2020-01-02 10:21:30', '2020-01-02 10:21:30'),
(311, 330, '1577960593-1023338560.jpg', '2020-01-02 10:23:13', '2020-01-02 10:23:13'),
(312, 331, '1577960666-1907230133.jpg', '2020-01-02 10:24:26', '2020-01-02 10:24:26'),
(313, 332, '1577960816-1792320393.jpg', '2020-01-02 10:26:56', '2020-01-02 10:26:56'),
(314, 333, '1577960908-1236351517.jpg', '2020-01-02 10:28:28', '2020-01-02 10:28:28'),
(315, 334, '1577961000-316983660.jpg', '2020-01-02 10:30:00', '2020-01-02 10:30:00'),
(316, 335, '1577961101-338060448.jpg', '2020-01-02 10:31:41', '2020-01-02 10:31:41'),
(317, 336, '1577961564-2070805875.jpg', '2020-01-02 10:39:24', '2020-01-02 10:39:24'),
(318, 337, '1577961915-2139872483.jpg', '2020-01-02 10:45:15', '2020-01-02 10:45:15'),
(319, 338, '1577961951-1423754744.jpg', '2020-01-02 10:45:51', '2020-01-02 10:45:51'),
(320, 339, '1577961991-839295762.jpg', '2020-01-02 10:46:31', '2020-01-02 10:46:31'),
(321, 340, '1577962060-567397922.jpg', '2020-01-02 10:47:40', '2020-01-02 10:47:40'),
(322, 341, '1577962122-359647156.jpg', '2020-01-02 10:48:42', '2020-01-02 10:48:42'),
(323, 342, '1577962168-566441460.jpg', '2020-01-02 10:49:28', '2020-01-02 10:49:28'),
(324, 343, '1577962297-128012999.jpg', '2020-01-02 10:51:37', '2020-01-02 10:51:37'),
(325, 344, '1577962354-401390797.jpg', '2020-01-02 10:52:34', '2020-01-02 10:52:34'),
(326, 345, '1577962411-1217681062.jpg', '2020-01-02 10:53:31', '2020-01-02 10:53:31'),
(327, 346, '1577962413-590101592.jpg', '2020-01-02 10:53:33', '2020-01-02 10:53:33'),
(328, 347, '1577962482-64283908.jpg', '2020-01-02 10:54:42', '2020-01-02 10:54:42'),
(329, 348, '1577962541-5514603.jpg', '2020-01-02 10:55:41', '2020-01-02 10:55:41'),
(330, 349, '1577962609-1142964786.jpg', '2020-01-02 10:56:49', '2020-01-02 10:56:49'),
(331, 350, '1577962662-428932009.jpg', '2020-01-02 10:57:42', '2020-01-02 10:57:42'),
(332, 351, '1577962669-397402977.jpg', '2020-01-02 10:57:49', '2020-01-02 10:57:49'),
(333, 352, '1577962785-1044198940.jpg', '2020-01-02 10:59:45', '2020-01-02 10:59:45'),
(334, 353, '1577962798-959572936.jpg', '2020-01-02 10:59:58', '2020-01-02 10:59:58'),
(335, 354, '1577962858-1380431584.jpg', '2020-01-02 11:00:58', '2020-01-02 11:00:58'),
(336, 355, '1577962925-2015750623.jpg', '2020-01-02 11:02:05', '2020-01-02 11:02:05'),
(337, 356, '1577963023-1568868817.jpg', '2020-01-02 11:03:43', '2020-01-02 11:03:43'),
(338, 357, '1577963095-908340589.jpg', '2020-01-02 11:04:55', '2020-01-02 11:04:55'),
(339, 358, '1577963161-1682517363.jpg', '2020-01-02 11:06:01', '2020-01-02 11:06:01'),
(340, 359, '1577963252-180711323.jpg', '2020-01-02 11:07:32', '2020-01-02 11:07:32'),
(341, 360, '1577963322-994320229.jpg', '2020-01-02 11:08:42', '2020-01-02 11:08:42'),
(342, 361, '1577963392-1007777900.jpg', '2020-01-02 11:09:52', '2020-01-02 11:09:52'),
(343, 362, '1577963411-1381294510.jpg', '2020-01-02 11:10:11', '2020-01-02 11:10:11'),
(344, 363, '1577963658-1861863736.jpg', '2020-01-02 11:14:18', '2020-01-02 11:14:18'),
(345, 364, '1577963732-1363537620.jpg', '2020-01-02 11:15:32', '2020-01-02 11:15:32'),
(346, 365, '1577963734-1213547954.jpg', '2020-01-02 11:15:34', '2020-01-02 11:15:34'),
(347, 366, '1577963844-879584013.jpg', '2020-01-02 11:17:24', '2020-01-02 11:17:24'),
(348, 367, '1577963909-446919841.jpg', '2020-01-02 11:18:29', '2020-01-02 11:18:29'),
(349, 368, '1577963977-1311866215.jpg', '2020-01-02 11:19:37', '2020-01-02 11:19:37'),
(350, 369, '1577964010-361236543.jpg', '2020-01-02 11:20:10', '2020-01-02 11:20:10'),
(351, 370, '1577964115-1792334100.jpg', '2020-01-02 11:21:55', '2020-01-02 11:21:55'),
(352, 371, '1577964202-184736303.jpg', '2020-01-02 11:23:22', '2020-01-02 11:23:22'),
(353, 372, '1577965234-1400389951.jpg', '2020-01-02 11:40:34', '2020-01-02 11:40:34'),
(354, 373, '1577965309-365813607.jpg', '2020-01-02 11:41:49', '2020-01-02 11:41:49'),
(355, 374, '1577965811-1847716081.jpg', '2020-01-02 11:50:11', '2020-01-02 11:50:11'),
(356, 375, '1577965901-1280658493.jpg', '2020-01-02 11:51:41', '2020-01-02 11:51:41'),
(357, 376, '1577965962-718210554.jpg', '2020-01-02 11:52:42', '2020-01-02 11:52:42'),
(358, 377, '1577966047-452157127.jpg', '2020-01-02 11:54:07', '2020-01-02 11:54:07'),
(359, 378, '1577966101-172734621.jpg', '2020-01-02 11:55:01', '2020-01-02 11:55:01'),
(360, 379, '1577966165-957707310.jpg', '2020-01-02 11:56:05', '2020-01-02 11:56:05'),
(361, 380, '1578037875-1245487536.jpg', '2020-01-03 07:51:15', '2020-01-03 07:51:15'),
(362, 380, '1578037875-765655112.jpg', '2020-01-03 07:51:15', '2020-01-03 07:51:15'),
(363, 381, '1578037948-920874369.jpg', '2020-01-03 07:52:28', '2020-01-03 07:52:28'),
(364, 382, '1578038174-526130767.jpg', '2020-01-03 07:56:14', '2020-01-03 07:56:14'),
(365, 383, '1578038224-2096621385.jpg', '2020-01-03 07:57:04', '2020-01-03 07:57:04'),
(366, 384, '1578038332-1195075345.jpg', '2020-01-03 07:58:52', '2020-01-03 07:58:52'),
(367, 385, '1578038405-1245431257.jpg', '2020-01-03 08:00:05', '2020-01-03 08:00:05'),
(368, 386, '1578038495-1011809098.jpg', '2020-01-03 08:01:35', '2020-01-03 08:01:35'),
(369, 388, '1578038636-1408096041.jpg', '2020-01-03 08:03:56', '2020-01-03 08:03:56'),
(370, 389, '1578038706-1953660514.jpg', '2020-01-03 08:05:06', '2020-01-03 08:05:06'),
(371, 390, '1578048756-2130079327.jpg', '2020-01-03 10:52:36', '2020-01-03 10:52:36'),
(372, 391, '1578048824-944816948.jpg', '2020-01-03 10:53:44', '2020-01-03 10:53:44'),
(373, 392, '1578049045-587807821.jpg', '2020-01-03 10:57:25', '2020-01-03 10:57:25'),
(374, 393, '1578049104-1551296170.jpg', '2020-01-03 10:58:24', '2020-01-03 10:58:24'),
(375, 394, '1578049176-974782277.jpg', '2020-01-03 10:59:36', '2020-01-03 10:59:36'),
(376, 395, '1578049232-1331147847.jpg', '2020-01-03 11:00:32', '2020-01-03 11:00:32'),
(377, 396, '1578049330-1680509711.jpg', '2020-01-03 11:02:10', '2020-01-03 11:02:10'),
(378, 397, '1578049388-1118393594.jpg', '2020-01-03 11:03:08', '2020-01-03 11:03:08'),
(379, 398, '1578049449-8742716.jpg', '2020-01-03 11:04:09', '2020-01-03 11:04:09'),
(380, 399, '1578049496-1461439402.jpg', '2020-01-03 11:04:56', '2020-01-03 11:04:56'),
(381, 387, '', '2020-01-05 12:51:00', '2020-01-05 12:51:00'),
(382, 400, '1578303665-51029752.jpg', '2020-01-06 09:41:05', '2020-01-06 09:41:05'),
(383, 401, '1578303890-1070104865.jpg', '2020-01-06 09:44:50', '2020-01-06 09:44:50'),
(384, 401, '1578303890-1513485105.jpg', '2020-01-06 09:44:50', '2020-01-06 09:44:50'),
(385, 402, '1578304194-22700372.jpg', '2020-01-06 09:49:54', '2020-01-06 09:49:54'),
(386, 403, '1578304556-1677742678.jpg', '2020-01-06 09:55:56', '2020-01-06 09:55:56'),
(387, 404, '1578304891-1076586763.jpg', '2020-01-06 10:01:31', '2020-01-06 10:01:31'),
(388, 405, '1578308223-333877441.jpg', '2020-01-06 10:57:03', '2020-01-06 10:57:03'),
(389, 406, '1578309260-1591724718.jpg', '2020-01-06 11:14:20', '2020-01-06 11:14:20'),
(390, 407, '1578309626-1322002085.jpg', '2020-01-06 11:20:26', '2020-01-06 11:20:26'),
(391, 408, '1578309944-1333220883.jpg', '2020-01-06 11:25:44', '2020-01-06 11:25:44'),
(392, 408, '1578309944-238112527.jpg', '2020-01-06 11:25:44', '2020-01-06 11:25:44'),
(393, 409, '1578310682-1289247869.jpg', '2020-01-06 11:38:02', '2020-01-06 11:38:02'),
(394, 410, '1578310875-1070018057.jpg', '2020-01-06 11:41:15', '2020-01-06 11:41:15'),
(395, 411, '1578311323-1439213775.jpg', '2020-01-06 11:48:43', '2020-01-06 11:48:43'),
(396, 412, '1578312433-532842052.jpg', '2020-01-06 12:07:13', '2020-01-06 12:07:13'),
(397, 413, '1578375831-1533028463.jpg', '2020-01-07 05:43:51', '2020-01-07 05:43:51'),
(398, 414, '1578382828-617131008.jpg', '2020-01-07 07:40:28', '2020-01-07 07:40:28'),
(399, 415, '1578383790-1159969438.jpg', '2020-01-07 07:56:30', '2020-01-07 07:56:30'),
(400, 416, '1578384868-1102649018.jpg', '2020-01-07 08:14:28', '2020-01-07 08:14:28'),
(401, 417, '1578385139-1553278018.jpg', '2020-01-07 08:18:59', '2020-01-07 08:18:59'),
(402, 418, '1578385274-1847030087.jpg', '2020-01-07 08:21:14', '2020-01-07 08:21:14'),
(403, 419, '1578385587-1374654301.jpg', '2020-01-07 08:26:27', '2020-01-07 08:26:27'),
(404, 420, '1578385722-1022058784.jpg', '2020-01-07 08:28:42', '2020-01-07 08:28:42'),
(405, 421, '1578386256-1916331174.jpg', '2020-01-07 08:37:36', '2020-01-07 08:37:36'),
(406, 422, '1578386604-868076604.jpg', '2020-01-07 08:43:24', '2020-01-07 08:43:24'),
(407, 423, '1578386788-839241056.jpg', '2020-01-07 08:46:28', '2020-01-07 08:46:28'),
(408, 424, '1578388935-220555297.jpg', '2020-01-07 09:22:15', '2020-01-07 09:22:15'),
(409, 425, '1578390406-1760164828.jpg', '2020-01-07 09:46:46', '2020-01-07 09:46:46'),
(410, 426, '1578390773-267442344.jpg', '2020-01-07 09:52:53', '2020-01-07 09:52:53'),
(411, 427, '1578391115-48849226.jpg', '2020-01-07 09:58:35', '2020-01-07 09:58:35'),
(412, 428, '1578391337-1607988385.jpg', '2020-01-07 10:02:17', '2020-01-07 10:02:17'),
(413, 429, '1578391539-362023384.jpg', '2020-01-07 10:05:39', '2020-01-07 10:05:39'),
(414, 430, '1578391733-415628052.jpg', '2020-01-07 10:08:53', '2020-01-07 10:08:53'),
(415, 431, '1578391902-872508445.jpg', '2020-01-07 10:11:42', '2020-01-07 10:11:42'),
(416, 432, '1578392943-1811117780.jpg', '2020-01-07 10:29:03', '2020-01-07 10:29:03'),
(417, 433, '1578393255-1056492677.jpg', '2020-01-07 10:34:15', '2020-01-07 10:34:15'),
(418, 435, '1578393756-992496187.jpg', '2020-01-07 10:42:36', '2020-01-07 10:42:36'),
(419, 436, '1578394243-1491991242.jpg', '2020-01-07 10:50:43', '2020-01-07 10:50:43'),
(420, 437, '1578394474-899941405.jpg', '2020-01-07 10:54:34', '2020-01-07 10:54:34'),
(421, 438, '1578394712-1135644471.jpg', '2020-01-07 10:58:32', '2020-01-07 10:58:32'),
(422, 439, '1578394901-2104863284.jpg', '2020-01-07 11:01:41', '2020-01-07 11:01:41'),
(423, 440, '1578395079-2063804555.jpg', '2020-01-07 11:04:39', '2020-01-07 11:04:39'),
(424, 441, '1578395297-1544973865.jpg', '2020-01-07 11:08:17', '2020-01-07 11:08:17'),
(425, 442, '1578396419-1503943892.jpg', '2020-01-07 11:26:59', '2020-01-07 11:26:59'),
(426, 443, '1578396520-1959945774.jpg', '2020-01-07 11:28:40', '2020-01-07 11:28:40'),
(427, 444, '1578396660-1617171784.jpg', '2020-01-07 11:31:00', '2020-01-07 11:31:00'),
(428, 445, '1578396839-548707275.jpg', '2020-01-07 11:33:59', '2020-01-07 11:33:59'),
(429, 446, '1578397289-1325114849.jpg', '2020-01-07 11:41:29', '2020-01-07 11:41:29'),
(430, 447, '1578397957-1470175507.jpg', '2020-01-07 11:52:37', '2020-01-07 11:52:37'),
(431, 448, '1578460402-990915623.jpg', '2020-01-08 05:13:22', '2020-01-08 05:13:22'),
(432, 449, '1578460696-1310182879.jpg', '2020-01-08 05:18:16', '2020-01-08 05:18:16'),
(433, 450, '1578460880-141474724.jpg', '2020-01-08 05:21:20', '2020-01-08 05:21:20'),
(434, 451, '1578461135-268306479.jpg', '2020-01-08 05:25:35', '2020-01-08 05:25:35'),
(435, 452, '1578461372-470034262.jpg', '2020-01-08 05:29:32', '2020-01-08 05:29:32'),
(436, 456, '1578463264-1569936708.jpg', '2020-01-08 06:01:04', '2020-01-08 06:01:04'),
(437, 460, '1578464940-973725967.jpg', '2020-01-08 06:29:00', '2020-01-08 06:29:00'),
(438, 461, '1578465703-627839551.jpg', '2020-01-08 06:41:43', '2020-01-08 06:41:43'),
(439, 462, '1578465946-1306553620.jpg', '2020-01-08 06:45:46', '2020-01-08 06:45:46'),
(440, 463, '1578466404-699797871.jpg', '2020-01-08 06:53:24', '2020-01-08 06:53:24'),
(442, 468, '1578469269-597284198.jpg', '2020-01-08 07:41:09', '2020-01-08 07:41:09'),
(443, 469, '1578469519-875695477.jpg', '2020-01-08 07:45:19', '2020-01-08 07:45:19'),
(444, 470, '1578469660-200701708.jpg', '2020-01-08 07:47:40', '2020-01-08 07:47:40'),
(445, 471, '1578469829-1997876345.jpg', '2020-01-08 07:50:29', '2020-01-08 07:50:29'),
(446, 472, '1578469938-838119596.jpg', '2020-01-08 07:52:18', '2020-01-08 07:52:18'),
(447, 473, '1578470030-1778249641.jpg', '2020-01-08 07:53:50', '2020-01-08 07:53:50'),
(448, 474, '1578470377-403412001.jpg', '2020-01-08 07:59:37', '2020-01-08 07:59:37'),
(449, 475, '1578470543-936963017.jpg', '2020-01-08 08:02:23', '2020-01-08 08:02:23'),
(450, 476, '1578470695-1146936645.jpg', '2020-01-08 08:04:55', '2020-01-08 08:04:55'),
(451, 479, '1578471340-1259196071.jpg', '2020-01-08 08:15:40', '2020-01-08 08:15:40'),
(452, 481, '1578471900-642820293.jpg', '2020-01-08 08:25:00', '2020-01-08 08:25:00'),
(453, 482, '1578472013-354490126.jpg', '2020-01-08 08:26:53', '2020-01-08 08:26:53'),
(454, 483, '1578483888-1561639168.jpg', '2020-01-08 11:44:48', '2020-01-08 11:44:48'),
(455, 484, '1578484337-1418487052.jpg', '2020-01-08 11:52:17', '2020-01-08 11:52:17'),
(456, 484, '1578484337-1808597273.jpg', '2020-01-08 11:52:17', '2020-01-08 11:52:17'),
(457, 485, '1578484960-1348265566.jpg', '2020-01-08 12:02:40', '2020-01-08 12:02:40'),
(458, 486, '1578485734-385254168.jpg', '2020-01-08 12:15:34', '2020-01-08 12:15:34'),
(459, 487, '1578486289-1304051329.jpg', '2020-01-08 12:24:49', '2020-01-08 12:24:49'),
(460, 488, '', '2020-01-08 12:24:49', '2020-01-08 12:24:49'),
(461, 434, '', '2020-01-08 12:24:49', '2020-01-08 12:24:49'),
(462, 489, '1578547823-1418465264.jpg', '2020-01-09 05:30:23', '2020-01-09 05:30:23'),
(463, 490, '1578548069-690623262.jpg', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(464, 453, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(465, 455, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(466, 457, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(467, 460, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(468, 466, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(469, 477, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(470, 478, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(471, 480, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(472, 497, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(473, 498, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(474, 499, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(475, 500, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(476, 501, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(477, 502, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(478, 503, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(479, 504, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(480, 505, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(481, 506, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(482, 507, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(483, 508, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(484, 509, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(485, 510, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(486, 511, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(487, 512, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(488, 513, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(489, 514, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(490, 515, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(491, 516, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(492, 517, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(493, 518, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(494, 519, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(495, 520, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(496, 521, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(497, 522, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(498, 523, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(499, 491, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(500, 492, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(501, 493, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(502, 494, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(503, 495, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(504, 496, '', '2020-01-09 05:34:29', '2020-01-09 05:34:29'),
(505, 535, '1578653005-190678281.jpg', '2020-01-10 10:43:25', '2020-01-10 10:43:25'),
(506, 536, '1578653219-1165589293.jpg', '2020-01-10 10:46:59', '2020-01-10 10:46:59'),
(507, 537, '1578653515-910471439.jpg', '2020-01-10 10:51:55', '2020-01-10 10:51:55'),
(508, 539, '1578654758-454459573.jpg', '2020-01-10 11:12:38', '2020-01-10 11:12:38'),
(509, 540, '1578657004-1851616293.jpg', '2020-01-10 11:50:04', '2020-01-10 11:50:04'),
(510, 541, '1578658072-1663950204.jpg', '2020-01-10 12:07:52', '2020-01-10 12:07:52'),
(511, 542, '1578658774-2135512638.jpg', '2020-01-10 12:19:34', '2020-01-10 12:19:34'),
(512, 543, '1578659383-694046676.jpg', '2020-01-10 12:29:43', '2020-01-10 12:29:43'),
(513, 534, '1578911118-187131498.jpg', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(514, 544, '1578916695-526839433.jpg', '2020-01-13 11:58:15', '2020-01-13 11:58:15'),
(515, 545, '1578916939-651231892.jpg', '2020-01-13 12:02:19', '2020-01-13 12:02:19'),
(516, 546, '1578917278-127847286.jpg', '2020-01-13 12:07:58', '2020-01-13 12:07:58'),
(517, 547, '1578917742-1921463438.jpg', '2020-01-13 12:15:42', '2020-01-13 12:15:42'),
(518, 548, '1578918008-285090792.jpg', '2020-01-13 12:20:08', '2020-01-13 12:20:08'),
(523, 533, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(524, 532, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(525, 531, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(526, 530, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(527, 529, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(528, 528, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(529, 527, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(530, 526, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(531, 525, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(532, 524, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(533, 523, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(534, 522, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(535, 521, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(536, 464, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(537, 538, '', '2020-01-13 10:25:18', '2020-01-13 10:25:18'),
(538, 551, '1578988160-1945232691.jpg', '2020-01-14 07:49:20', '2020-01-14 07:49:20'),
(549, 170, '1579049168-1803140912.jpg', '2020-01-15 00:46:08', '2020-01-15 00:46:08'),
(551, 549, '1579049547-314575762.jpg', '2020-01-15 00:52:27', '2020-01-15 00:52:27'),
(582, 583, '1579237169-2097081066.jpeg', '2020-01-17 04:59:29', '2020-01-17 04:59:29'),
(583, 585, '1579346217-1443822996.jpg', '2020-01-18 11:16:57', '2020-01-18 11:16:57'),
(589, 599, '1582279258-214750356.jpg', '2020-02-21 10:00:58', '2020-02-21 10:00:58'),
(591, 603, '1582530079-277720821.jpg', '2020-02-24 07:41:19', '2020-02-24 07:41:19'),
(592, 604, '1582530198-313824598.jpg', '2020-02-24 07:43:18', '2020-02-24 07:43:18'),
(593, 604, '1582530198-1063383084.jpg', '2020-02-24 07:43:18', '2020-02-24 07:43:18'),
(594, 605, '1582530274-262322216.jpg', '2020-02-24 07:44:34', '2020-02-24 07:44:34'),
(595, 606, '1582530360-210606265.jpg', '2020-02-24 07:46:00', '2020-02-24 07:46:00'),
(596, 607, '1582530442-627716930.jpg', '2020-02-24 07:47:22', '2020-02-24 07:47:22'),
(597, 608, '1582530564-1729190566.jpg', '2020-02-24 07:49:24', '2020-02-24 07:49:24'),
(598, 609, '1582530626-1099741205.jpg', '2020-02-24 07:50:26', '2020-02-24 07:50:26'),
(599, 610, '1582530711-1415547092.jpg', '2020-02-24 07:51:51', '2020-02-24 07:51:51'),
(600, 611, '1582530792-277053235.jpg', '2020-02-24 07:53:12', '2020-02-24 07:53:12'),
(601, 612, '1582650856-1670104579.jpg', '2020-02-25 17:14:16', '2020-02-25 17:14:16'),
(602, 613, '1582651108-293346260.jpg', '2020-02-25 17:18:28', '2020-02-25 17:18:28'),
(603, 614, '1582651717-926567728.jpg', '2020-02-25 17:28:37', '2020-02-25 17:28:37'),
(604, 615, '1582651777-1720876910.jpg', '2020-02-25 17:29:38', '2020-02-25 17:29:38'),
(605, 616, '1582699262-1713004910.jpg', '2020-02-26 06:41:02', '2020-02-26 06:41:02'),
(606, 617, '1582699327-1567074952.jpg', '2020-02-26 06:42:07', '2020-02-26 06:42:07'),
(607, 618, '1582699398-972751732.jpg', '2020-02-26 06:43:18', '2020-02-26 06:43:18'),
(608, 619, '1582699495-162408675.jpg', '2020-02-26 06:44:55', '2020-02-26 06:44:55'),
(609, 620, '1582699557-495881934.jpg', '2020-02-26 06:45:57', '2020-02-26 06:45:57'),
(610, 621, '1582699637-2081255169.jpg', '2020-02-26 06:47:17', '2020-02-26 06:47:17'),
(611, 622, '1582699721-324360650.jpg', '2020-02-26 06:48:41', '2020-02-26 06:48:41'),
(612, 623, '1582699816-208201434.jpg', '2020-02-26 06:50:16', '2020-02-26 06:50:16'),
(613, 624, '1582699900-208058646.jpg', '2020-02-26 06:51:40', '2020-02-26 06:51:40'),
(614, 625, '1582700004-1120211193.jpg', '2020-02-26 06:53:24', '2020-02-26 06:53:24'),
(615, 626, '1582700104-2025004134.jpg', '2020-02-26 06:55:04', '2020-02-26 06:55:04'),
(616, 627, '1582700233-606677586.jpg', '2020-02-26 06:57:13', '2020-02-26 06:57:13'),
(617, 628, '1582700303-691129409.jpg', '2020-02-26 06:58:23', '2020-02-26 06:58:23'),
(618, 629, '1582700365-1406286663.jpg', '2020-02-26 06:59:25', '2020-02-26 06:59:25'),
(619, 630, '1582700459-794183182.jpg', '2020-02-26 07:00:59', '2020-02-26 07:00:59'),
(620, 631, '1582700537-57061902.jpg', '2020-02-26 07:02:17', '2020-02-26 07:02:17'),
(621, 632, '1582700622-1812833923.jpg', '2020-02-26 07:03:43', '2020-02-26 07:03:43'),
(622, 633, '1582700697-235208334.jpg', '2020-02-26 07:04:57', '2020-02-26 07:04:57'),
(623, 634, '1582700816-750445384.jpg', '2020-02-26 07:06:56', '2020-02-26 07:06:56'),
(624, 635, '1582700931-1070601874.jpg', '2020-02-26 07:08:51', '2020-02-26 07:08:51'),
(626, 638, '1582787139-2032693280.jpg', '2020-02-27 07:05:39', '2020-02-27 07:05:39'),
(628, 637, '1582805781-1508289801.jpg', '2020-02-27 12:16:21', '2020-02-27 12:16:21'),
(629, 639, '1582886618-1674815140.jpeg', '2020-02-28 10:43:38', '2020-02-28 10:43:38'),
(630, 640, '1582890724-1535557396.jpeg', '2020-02-28 11:52:05', '2020-02-28 11:52:05'),
(631, 641, '1582891529-669497746.jpg', '2020-02-28 12:05:29', '2020-02-28 12:05:29'),
(632, 642, '1582959565-2078516612.jpg', '2020-02-29 06:59:25', '2020-02-29 06:59:25'),
(633, 643, '1582981690-2004347190.jpg', '2020-02-29 13:08:10', '2020-02-29 13:08:10'),
(634, 644, '1583002392-1527037452.jpg', '2020-02-29 18:53:12', '2020-02-29 18:53:12'),
(635, 645, '1583002608-1013608233.jpg', '2020-02-29 18:56:48', '2020-02-29 18:56:48'),
(636, 646, '1583002814-1978145691.jpg', '2020-02-29 19:00:14', '2020-02-29 19:00:14'),
(637, 647, '1583002914-7018884.jpg', '2020-02-29 19:01:55', '2020-02-29 19:01:55'),
(638, 648, '1583003033-1068925717.jpg', '2020-02-29 19:03:53', '2020-02-29 19:03:53'),
(639, 649, '1583003116-1888597772.jpg', '2020-02-29 19:05:17', '2020-02-29 19:05:17'),
(640, 650, '1583003247-51551441.jpg', '2020-02-29 19:07:27', '2020-02-29 19:07:27'),
(641, 651, '1583004573-1597005844.jpg', '2020-02-29 19:29:33', '2020-02-29 19:29:33'),
(642, 652, '1583004747-1176760509.jpg', '2020-02-29 19:32:27', '2020-02-29 19:32:27'),
(643, 653, '1583004852-1173653433.jpg', '2020-02-29 19:34:12', '2020-02-29 19:34:12'),
(644, 654, '1583004965-799805910.jpg', '2020-02-29 19:36:05', '2020-02-29 19:36:05'),
(645, 655, '1583005060-1506212637.jpg', '2020-02-29 19:37:40', '2020-02-29 19:37:40'),
(648, 657, '1583145671-1764452345.jpg', '2020-03-02 10:41:12', '2020-03-02 10:41:12'),
(649, 656, '1583145698-437136696.jpg', '2020-03-02 10:41:38', '2020-03-02 10:41:38'),
(650, 658, '1583146807-883132145.jpg', '2020-03-02 11:00:07', '2020-03-02 11:00:07'),
(651, 659, '1583147227-387394182.jpg', '2020-03-02 11:07:07', '2020-03-02 11:07:07'),
(652, 660, '1583147749-328477631.jpg', '2020-03-02 11:15:49', '2020-03-02 11:15:49'),
(653, 661, '1583148070-1753839361.jpg', '2020-03-02 11:21:10', '2020-03-02 11:21:10'),
(654, 662, '1583148440-1050426037.jpg', '2020-03-02 11:27:20', '2020-03-02 11:27:20'),
(655, 663, '1583148568-1260357629.jpg', '2020-03-02 11:29:28', '2020-03-02 11:29:28'),
(656, 664, '1583148757-616165837.jpg', '2020-03-02 11:32:37', '2020-03-02 11:32:37'),
(657, 665, '1583149108-810778242.jpg', '2020-03-02 11:38:28', '2020-03-02 11:38:28'),
(658, 666, '1583149353-1696239511.jpg', '2020-03-02 11:42:33', '2020-03-02 11:42:33'),
(659, 667, '1583149555-1775362012.jpg', '2020-03-02 11:45:56', '2020-03-02 11:45:56'),
(660, 668, '1583149785-491714509.jpg', '2020-03-02 11:49:45', '2020-03-02 11:49:45'),
(661, 669, '1583149968-633066832.jpeg', '2020-03-02 11:52:48', '2020-03-02 11:52:48'),
(662, 670, '1583150346-1462004867.jpg', '2020-03-02 11:59:06', '2020-03-02 11:59:06'),
(663, 671, '1583150593-381743885.jpg', '2020-03-02 12:03:13', '2020-03-02 12:03:13'),
(664, 672, '1583150965-1585143039.jpg', '2020-03-02 12:09:25', '2020-03-02 12:09:25'),
(665, 673, '1583151144-2146729282.jpg', '2020-03-02 12:12:24', '2020-03-02 12:12:24'),
(666, 674, '1583151353-1572900785.jpg', '2020-03-02 12:15:53', '2020-03-02 12:15:53'),
(667, 675, '1583151568-668435498.jpg', '2020-03-02 12:19:28', '2020-03-02 12:19:28'),
(668, 676, '1583152514-1482845614.jpg', '2020-03-02 12:35:14', '2020-03-02 12:35:14'),
(669, 677, '1583215651-133396188.jpg', '2020-03-03 06:07:31', '2020-03-03 06:07:31'),
(670, 678, '1583215845-1577269945.jpg', '2020-03-03 06:10:45', '2020-03-03 06:10:45'),
(671, 679, '1583216149-2047662069.jpg', '2020-03-03 06:15:49', '2020-03-03 06:15:49'),
(672, 680, '1583216240-1901107989.jpg', '2020-03-03 06:17:20', '2020-03-03 06:17:20'),
(673, 681, '1583216487-1571532711.jpg', '2020-03-03 06:21:27', '2020-03-03 06:21:27'),
(674, 682, '1583216800-494044118.jpg', '2020-03-03 06:26:40', '2020-03-03 06:26:40'),
(675, 683, '1583217010-2053471715.jpg', '2020-03-03 06:30:11', '2020-03-03 06:30:11'),
(676, 684, '1583217334-2092507143.jpg', '2020-03-03 06:35:34', '2020-03-03 06:35:34'),
(677, 685, '1583217436-940401186.jpg', '2020-03-03 06:37:16', '2020-03-03 06:37:16'),
(678, 686, '1583217529-2289355.jpg', '2020-03-03 06:38:49', '2020-03-03 06:38:49'),
(679, 687, '1583217720-422813930.jpg', '2020-03-03 06:42:00', '2020-03-03 06:42:00'),
(680, 688, '1583217874-58456014.jpg', '2020-03-03 06:44:34', '2020-03-03 06:44:34'),
(681, 689, '1583218001-1886542913.jpg', '2020-03-03 06:46:41', '2020-03-03 06:46:41'),
(682, 690, '1583218147-568277564.jpg', '2020-03-03 06:49:07', '2020-03-03 06:49:07'),
(683, 691, '1583218381-2125794800.jpg', '2020-03-03 06:53:01', '2020-03-03 06:53:01');
INSERT INTO `sell_product_images` (`id`, `sell_product_id`, `image`, `created_at`, `updated_at`) VALUES
(684, 692, '1583218588-1661236841.jpg', '2020-03-03 06:56:28', '2020-03-03 06:56:28'),
(685, 693, '1583219087-117685319.jpg', '2020-03-03 07:04:47', '2020-03-03 07:04:47'),
(686, 694, '1583219186-1431854120.jpg', '2020-03-03 07:06:26', '2020-03-03 07:06:26'),
(687, 695, '1583219368-1958910730.jpg', '2020-03-03 07:09:28', '2020-03-03 07:09:28'),
(688, 696, '1583219478-256525642.jpg', '2020-03-03 07:11:18', '2020-03-03 07:11:18'),
(689, 697, '1583219617-2118337121.jpg', '2020-03-03 07:13:37', '2020-03-03 07:13:37'),
(690, 698, '1583219765-224813666.jpg', '2020-03-03 07:16:05', '2020-03-03 07:16:05'),
(691, 699, '1583305675-1325158675.jpg', '2020-03-04 07:07:55', '2020-03-04 07:07:55'),
(692, 700, '1583305795-42289500.jpg', '2020-03-04 07:09:55', '2020-03-04 07:09:55'),
(693, 701, '1583305936-877315023.jpg', '2020-03-04 07:12:16', '2020-03-04 07:12:16'),
(694, 702, '1583305987-1581436501.jpg', '2020-03-04 07:13:07', '2020-03-04 07:13:07'),
(695, 703, '1583306068-1133450728.jpg', '2020-03-04 07:14:28', '2020-03-04 07:14:28'),
(696, 704, '1583306127-726781313.jpg', '2020-03-04 07:15:27', '2020-03-04 07:15:27'),
(697, 705, '1583306317-1334741079.jpg', '2020-03-04 07:18:37', '2020-03-04 07:18:37'),
(698, 706, '1583306370-2039596382.jpg', '2020-03-04 07:19:30', '2020-03-04 07:19:30'),
(699, 707, '1583306441-1929082153.jpg', '2020-03-04 07:20:41', '2020-03-04 07:20:41'),
(700, 708, '1583306555-291982343.jpg', '2020-03-04 07:22:35', '2020-03-04 07:22:35'),
(701, 709, '1583306609-369979799.jpg', '2020-03-04 07:23:29', '2020-03-04 07:23:29'),
(702, 710, '1583306657-1574390784.jpg', '2020-03-04 07:24:17', '2020-03-04 07:24:17'),
(703, 711, '1583306707-280160877.jpg', '2020-03-04 07:25:07', '2020-03-04 07:25:07'),
(704, 712, '1583306818-1045525415.jpg', '2020-03-04 07:26:58', '2020-03-04 07:26:58'),
(706, 714, '1583306940-86998802.jpg', '2020-03-04 07:29:01', '2020-03-04 07:29:01'),
(707, 715, '1583306988-524576121.jpeg', '2020-03-04 07:29:48', '2020-03-04 07:29:48'),
(708, 716, '1583307018-1096737581.jpg', '2020-03-04 07:30:19', '2020-03-04 07:30:19'),
(709, 717, '1583307213-1498795548.jpg', '2020-03-04 07:33:33', '2020-03-04 07:33:33'),
(710, 718, '1583307416-873097159.jpg', '2020-03-04 07:36:56', '2020-03-04 07:36:56'),
(711, 719, '1583307621-737824350.jpg', '2020-03-04 07:40:21', '2020-03-04 07:40:21'),
(712, 720, '1583308094-739150473.jpg', '2020-03-04 07:48:14', '2020-03-04 07:48:14'),
(713, 721, '1583308203-1116283729.jpg', '2020-03-04 07:50:03', '2020-03-04 07:50:03'),
(714, 722, '1583308279-785319873.jpg', '2020-03-04 07:51:19', '2020-03-04 07:51:19'),
(715, 723, '1583308372-1436017531.jpg', '2020-03-04 07:52:53', '2020-03-04 07:52:53'),
(716, 724, '1583308440-471486129.jpg', '2020-03-04 07:54:00', '2020-03-04 07:54:00'),
(717, 725, '1583322516-229140773.png', '2020-03-04 11:48:36', '2020-03-04 11:48:36');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_users`
--

CREATE TABLE `subscription_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paytm_transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_expiry_date` datetime NOT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `traning_videos`
--

CREATE TABLE `traning_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_category_id` bigint(20) NOT NULL,
  `video_type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=> URL, 2=> Iframe , 3=>File',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_access` tinyint(4) NOT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `traning_videos`
--

INSERT INTO `traning_videos` (`id`, `title`, `video_category_id`, `video_type`, `description`, `paid_access`, `video`, `created_at`, `updated_at`) VALUES
(1, 'Et dolorum veniam f', 2, '3', '<p>zXCzxCzxCXZ</p>', 0, '1568313816-1812532679.mp4', '2019-09-06 18:40:17', '2019-09-12 18:43:36'),
(2, 'how to flash', 3, '2', '<p>flash the video&nbsp;</p>', 0, 'https://www.youtube.com/embed/FH5nzotKo0U', '2019-09-10 12:38:08', '2019-09-12 18:45:14'),
(3, 'IC changing', 4, '1', '<p>Here is the steps to show how to change the IC of the board&nbsp;</p>', 1, 'https://www.youtube.com/watch?v=Qxf2ooJjF-M', '2019-09-25 07:02:30', '2019-09-25 07:02:30'),
(4, 'test', 2, '1', '<p>test</p>', 0, 'https://www.youtube.com/watch?v=a3ICNMQW7Ok', '2019-09-26 05:31:20', '2019-09-26 05:31:20'),
(5, 'new video', 2, '1', '<p>new video test</p>', 1, 'https://www.youtube.com/watch?v=Ml1xXe4hnNE', '2019-09-26 17:17:53', '2019-10-03 07:51:57'),
(6, 'test', 7, '1', '<p>description test</p>', 0, 'https://www.youtube.com/watch?v=JeTMQCSNzXU', '2019-10-21 13:47:55', '2019-10-21 13:47:55'),
(7, 'test case-pk', 7, '2', '<p>description test</p>', 0, 'https://www.youtube.com/embed/JeTMQCSNzXU', '2019-10-21 13:53:13', '2019-10-21 13:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=> Mobile Repair Shop Owner/Technician , 2=> Mobile Spare Parts Dealer',
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_latitude` double(15,8) DEFAULT NULL,
  `shop_longitude` double(15,8) DEFAULT NULL,
  `spare_parts_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_fb_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_twitter_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registeration_status` enum('Init','Success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Init',
  `is_premium_user` tinyint(4) NOT NULL DEFAULT '0',
  `current_plan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `premium_expiry_date` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `normal_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile_number`, `user_type`, `shop_name`, `location`, `postal_code`, `city`, `state`, `address_line1`, `address_line2`, `landmark`, `shop_latitude`, `shop_longitude`, `spare_parts_name`, `social_fb_id`, `social_twitter_id`, `social_google_id`, `registeration_status`, `is_premium_user`, `current_plan`, `premium_expiry_date`, `password`, `remember_token`, `active`, `normal_password`, `photos1`, `photos2`, `photos3`, `photos4`, `created_at`, `updated_at`) VALUES
(22, 'Sidhartha', 'sidharthavijay@gmail.com', '8446123434', '2', 'Repair My Mobile', '800004', NULL, 'Patna', 'Bihar', 'bakerganj', 'Ashok Raj Path', NULL, 25.61553520, 85.16089850, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$Gp5CRLSh9pX22Zse8.ftcuxo4c5cPmznJ.YnM3aWu6DCCh18WAcee', 'JsXp9KLMDBKA5Z8UmQtcv6M4FNxiw64TyzespSMpn0nf5Kiqcgp2VWxBcQAB', 1, 'qwerty123', NULL, NULL, NULL, NULL, '2019-12-26 12:36:42', '2020-03-04 06:17:37'),
(23, 'sunil kumar', 'sunilnancyrudra@gmail.com', '9304902404', '1', 'chand mobile', '700023', NULL, 'kolkata', 'west bengal', 'fancy market', 'khidirpur', NULL, 22.53173910, 88.31961810, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$FptY7nmwR1fh5f3S2jZB1u/2NTd7n8swTlwIK84Neo8wzAD3vb3Lu', 'bpgCQyM8cES1UgclUA8u3GQWKFJTEIn5Zh3cZzSox9nIOHFgULcXcCLmFAYl', 1, 'sunil1234', '1577448863-655555419.jpg', NULL, NULL, NULL, '2019-12-26 13:07:48', '2019-12-27 12:16:18'),
(24, 'subhodip', 'dipsubho42@gmail.com', '7980477199', '1', 'Milon mobile', '712235', NULL, 'Hooghly', 'West Bengal', 'Konnagar Mukherjee bagan', 'Konnagar', NULL, 22.70077430, 88.34821880, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$mJ/k3SVwVSP6VHr1ulT40e/XWWlGqNms5V7fkj/Hxf.zFwJx22fBm', '5NNibTmGzAWGEGGDOztrKmdKV2HP0h3JpbmoHnDWhvBItryrMdPuaMsOIqx7', 1, 'sunil95760', NULL, NULL, NULL, NULL, '2019-12-26 13:11:58', '2020-01-07 05:50:39'),
(25, 'Ram', 'aumehaatwork@gmail.com', '8805249035', '1', 'chan mobile', '700023', NULL, 'Kolkata', 'West Bengal', 'fancy market', 'Khidirpur', NULL, 22.53173910, 88.31961810, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$6O/ceHpKiKEYf60vX16dBe5kOwQKubBLrw0l9/huhtrTq/Shxqayu', 'lQlLBfxWlMmN3aWwjQ0nDW43bqIW9e3R66phZiW4KqzbtEqf9cme5HnIS5xM', 1, 'qazwsx', '1577485413-249620067.jpeg', '1577485413-427608314.jpg', '1577485413-1542676933.jpeg', '1577485413-1294927238.png', '2019-12-27 06:43:41', '2020-01-13 23:49:59'),
(29, 'ESC', 'esckart.com@gmail.com', '8935939022', '2', 'Electro Sales Corporation', '800017', NULL, 'Patna', 'Bihar', 'Shop no 104, 1st Floor', 'Kaushalya Estate, Dakbunglow Chowk', NULL, 25.61288570, 85.13659210, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$/S.HJb0aC4agV0qNKPr8j.hizBRxiz71jXkT.KETrpi4rVGlEzJI2', 'PFIZN9jhfHyjnrlU0HhCfYVOSD7dqptLhLGRUiWtbVMHMz0dyyFFGb3Lm1p5', 1, 'qwerty@54321', NULL, NULL, NULL, NULL, '2020-01-02 06:04:24', '2020-01-02 06:10:02'),
(31, 'Shivshaw', 'shawshiv782@gmail.com', '9330085388', '2', 'Mukesh time center', '712235', NULL, 'Hoogly', 'West Bengal', 'Konnagar c.s mukherjee street', 'Konnagar', NULL, 22.70077430, 88.34821880, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$QlP4NQt1v6fQVYJFhqpw/O37VxCBG49wACiAxtnhC92ZJca3RA1lu', '42ewnJUlXRpSAwVUd0cELhhyPBmWfS4SjA8eJStQvBaFTPPDwouPFR9wnoZr', 1, 'sunil95760', '1578374956-69205232.jpg', '1578375058-1605953164.jpg', NULL, NULL, '2020-01-07 05:05:30', '2020-01-07 05:36:57'),
(32, 'Sunil Gupta', 'sunil.reliancesmart@gmail.com', '9883121550', '2', 'Gupta Mobile', '712235', NULL, 'Konnagar', 'West Bengal', 'Criper Road', 'Near : Anand Bazar Patrika office, Super Market Konnagar', NULL, 22.70077430, 88.34821880, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$gUW5GmZoMyaLbOkXNh8Wy.BTzEPaRiv3Ey9UqRys.Bpu5Q/nGcnL2', 'gDzHz6gmc8GevwhN94GL15vRKSDIMPBAUEBmHwLyL5QF9usfS1LkbKPNeSya', 1, 'sunil1202', NULL, NULL, NULL, NULL, '2020-01-08 05:32:25', '2020-01-08 06:46:04'),
(33, 'Jawed ALI', 'jawedali1226@gmail.com', '9331944886', '2', 'vghv', '8000g', NULL, 'jughvghc', 'ghvjhv', 'hvhvh', 'hjvbhvfc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$Ehs0m7Lx7MpZUj8JvmKpRucTdjV3jLksPdh/Miht3MBqLwew3nDES', 'jYBBM9ojlR7vVb0XNq4brrVT6Ilkwv0Xgvv3loMjGGbm0K9cdZQnL84i0yQk', 1, '9331944886', '1579845830-1120410244.jpg', NULL, NULL, NULL, '2020-01-08 09:43:53', '2020-01-24 06:03:50'),
(34, 'vicky’s', 'brar12388@gmail.com', '9781122334', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$K9WGXxziOX7I9okFowQos.SqY8/6Qiw0fnbASs9sKBu3V6ae14BhG', 'M6sIII2CTppb9z12BSokZknnMqxYp1Fb7uyv2tHf7DM4QlbfUuJEXtSboOek', 1, 'dihci3-noZxyj-wupsav', NULL, NULL, NULL, NULL, '2020-01-16 21:16:20', '2020-01-16 21:17:27'),
(35, 'Updev', 'updevray@gmail.com', '8460339333', '2', 'Ur Technology & Services', '382415', NULL, 'Ahmedabad', 'Gujarat', 'Odhav', 'odhav', NULL, 23.02441580, 72.66456600, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$bzLQ79BZrQqSH/RHdauVIu2Zuf6UXPZOGuOkmJvPdKsc1GoSUTu0u', 'eTFQscgM8qaZ0KV53dwo9Bgu8Uo2DyIyXmTAMo18L7jobP6aatMNmOjuQcds', 1, 'abhay8904', NULL, NULL, NULL, NULL, '2020-01-18 11:08:25', '2020-01-18 11:13:34'),
(36, 'Ibrahim Khan', 'ibrahimkhanbst@gmail.com', '9648239060', '1', 'IK Computer & Mobile Repairing Center Hardware & Software', '272181', NULL, 'Basti', 'Uttar Pradesh', 'Baba ganj tenuwa gaur basti utter pradesh 272181', 'Baba ganj tenuwa gaur basti utter pradesh 272181', NULL, 26.86793110, 82.48610530, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$wHFwb112OUaeGX3fMvQ73uEZAcIhN8V1HT4InQqgKhDir35pXVd9i', 'aRLLCysMZ0Bum64zuqO0fFoSypmsFw4tTGkFB1ogK1skHJyui3dWS5EuhfFk', 1, 'khanbst', NULL, NULL, NULL, NULL, '2020-01-19 14:35:10', '2020-01-19 14:42:28'),
(37, 'Sandip Bhise', 'sandipbhise91@gmail.com', '7350373432', '1', 'Sandip mobile shopee patoda', '423401', NULL, 'Nashik', 'Maharashtra', 'At post patoda tal Yeola dist nashik', 'At post patoda tal Yeola dist nashik', NULL, 20.08295470, 74.42911350, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$ONnc75RlGsJaBi8x94WtDue9KLYh6vMaXbxDngfpSxXRSjbctv5JG', 'kQDcfCuMIiE6MiY4JWfzh8mdfF6jyH85eNTtNS2RXCcHKSRItw7MOhcUy52s', 1, '8788626061', NULL, NULL, NULL, NULL, '2020-01-20 03:56:51', '2020-01-20 04:00:30'),
(39, 'KANHAIYA KAHAR', 'KANHAIYAKAHAR0@GMAIL.COM', '9472919542', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$3cBWk/O3Osfpi5h1R4Upges2eydWH7aOZhHK0meji37miq2GZpIx.', 'JtBuQvHP0lPu0geF6BV4Zrj3qpzkm8ZUCGXWkcP31zyDyN5boNocaaQ3TbeZ', 1, 'Care@123', NULL, NULL, NULL, NULL, '2020-01-23 05:46:59', '2020-01-23 05:47:31'),
(40, 'kamalpaliwal', 'kamalpaliwal5@gmail.com', '6353683394', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$dL3IgGNvQMt8UqfCfOG/keCacYZpfROZhghni7EmhXA8nGaZXwifq', 'CoQsTZHYoODHJcxNxzjTOUQQL1b1NRHIhlK3hzL86nXVlfYCFtrjIwlBJ4l1', 1, 'kamal2217', NULL, NULL, NULL, NULL, '2020-01-23 17:26:33', '2020-01-23 17:27:05'),
(42, 'MUNISH SINGH', 'munishsinghskn@gmail.com', '8574926006', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$SJQ8A7WG2lGkF9NqO4QxH.NHqDH122JDNjwE0qFMNI5fDqmGIRRhm', 'lnHaiIMbmqS0SyXJyADrEdfsJEpyrml17HH6LDznlkg1l5vy5I36FFDYLLF0', 1, 'Manish@123', NULL, NULL, NULL, NULL, '2020-01-24 14:17:11', '2020-01-24 14:18:47'),
(43, 'Deepak Mehra', 'deepakmehra466@gmail.com', '7697349320', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$Anm.fUogmKu7Lmx/vklDFuy7C3araks/j8KFGuMfyU.8uyHyP2Pzi', 'nMdLuhrRTCxtvix55kmRaCwpvsfg97I9gjiejODqBYJXVM60X4eCxfCfVLxO', 1, 'Deepak@1', NULL, NULL, NULL, NULL, '2020-01-25 02:52:23', '2020-01-25 02:52:46'),
(44, 'raghava', 'raghavacelltech@gmail.com', '8686684243', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$xk4GFf8h.BUUlQGhH9b.FeU/BEntk6Yhdy0rmAdl7mp1pS3LwuIbS', 'JPR6dePVYsBWpNkmxAAh9nG1GopRI7244B9uvfhAf2t9s6W2DE1j5FGtHYIi', 1, 'raghava@1984', NULL, NULL, NULL, NULL, '2020-01-25 14:31:15', '2020-01-25 14:31:34'),
(45, 'Jaspreet Singh', 'jaspreet70878@gmail.com', '7009662263', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$RE.6ipINH47VouAWRmfRlOR98LbxwcvFhDXp4z8OTFu/cRyeMbsoi', 'KaNubaFeRsoQnDj0ft5ZL3GONwMAY5YkYj2alD93gaBvKBjqtu7Mulgx2viP', 1, 'jaspreet62264', NULL, NULL, NULL, NULL, '2020-01-28 10:01:59', '2020-01-28 10:02:10'),
(46, 'Pratik Naik', 'weprem@rediffmail.com', '9377779677', '1', 'Happy The Tech Store', '396445', NULL, 'Navsari', 'Gujarat', '6, Samerr Apartment,', 'Thighra Jakatnaka', NULL, 20.94526300, 72.93424510, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$YGKY/Hue57LcNd/MRyNCyejizThIm.db1VlTkn6qdlZKwpoofCDyO', 'AVAnSKMC8uVeDra1jfY3ptX4ZGKHBM5wop41tmaTS8QAOHgyI5Vh8URsayLV', 1, 'dream12345', NULL, NULL, NULL, NULL, '2020-01-28 12:13:52', '2020-01-28 12:17:37'),
(47, 'ritesh kumar', 'rk1@gmail.com', '8210524174', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$nOWMHxeDxRwfzYDrT5k.0OQHXvqfAPg0bTp2kWrZxGTQ7cBnBU1pW', 'ngiqO3LwXMeJbto2nL9zXSBVgcxpE90CCwTnFj9sFdZ13OhzAr676sMmvFQ3', 1, '123456', NULL, NULL, NULL, NULL, '2020-01-31 07:30:23', '2020-01-31 07:55:55'),
(48, 'SYEDMOKTHAR', 'syedmokthar143@gmail.com', '9741414325', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$x3x6sIVm3/buNWFqvoakfOUFccuWI/PquayElCrx7YMq4ib57Zekq', 'XRpVTy3hw96QVy9Qc3ZXMKOFOhi0VAXdinIDk08Xmam5kpIvORTtU8bnmVmQ', 1, 'H1U2S3N4A5', NULL, NULL, NULL, NULL, '2020-01-31 11:30:50', '2020-01-31 11:31:04'),
(50, 'GANPAT', 'ganpat.pctech@gmail.com', '9828051280', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$rMOPfDwvT.asTJU.UXGTt.LbmY8GOE6u9RL8skPDiqyx5DoazuZjq', '3wEhBaAD2NtaFBSVDlTA8lul9YjWKK3fIn1poSmJ0hiLa6PsKKtn2SWX9blY', 1, '9828051280', NULL, NULL, NULL, NULL, '2020-02-03 08:48:50', '2020-02-03 08:49:19'),
(51, 'Srimanta Karmakar', 'smartboysrimanta74@gmail.com', '9732984174', '1', 'Srimanta Store', '741222', NULL, 'Chakdaha', 'West Bengal', 'Chakdaha Pabna Colony Water Tank', 'Chakdaha Railway Station', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$RYLU9XBtKi6LS.ASG67k6eJVubNetMWOTgmJJcnSvBlhnM35s5Gs2', 'o0PLzqGh6hyprCUrMPN2ZH1WtoqJRLoJ3iXhkD0bqCKEmttiNDh1OOLp2KqU', 1, 'Sriman7#', NULL, NULL, NULL, NULL, '2020-02-06 09:06:50', '2020-02-06 09:11:48'),
(53, 'Amit kumar', 'amitjinedpur@gmail.com', '8405824334', '1', 'MAA TELECOM', '851131', NULL, 'Begusarai', 'Bihar', 'Rajaura', 'Near BSNL tower', NULL, 25.48159480, 86.12428810, 'Mobile', NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$bfqS4jutx1PEj0Zgpy7aP.rBX2I5WESugkN9sMKrRBfhPZDClisDy', 'XWldcBPK08V3wFkMCdhc7LwZSl7zt05y7zaeLk4kzZApBiX2Z9NopRJilcuz', 1, 'Amit@116', NULL, NULL, NULL, NULL, '2020-02-11 06:25:46', '2020-02-11 10:58:34'),
(55, 'Deepak saxena', 'deepak9084267068@gmail.com', '9149101949', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$Ce/JW9fmdb6HEFBznoMMW.wVVZQn4qxccqDh3eqT0ylgecJ/P0pL2', 'iFygi66t2BfF2BcH3Co5eMIuoC1PDlkInW1GybV84VN6C6MrwrioKvtgo9WL', 1, '9084267068', NULL, NULL, NULL, NULL, '2020-02-11 07:38:55', '2020-02-11 07:39:27'),
(56, 'Prashanta Karmakar', 'kprashanta203@gmail.com', '9134096901', '1', 'Karmakar Telecom', '742189', NULL, 'Murshidabad', 'West Bengal', 'Rejinagar', 'Kashipur', NULL, 23.93757420, 88.23151300, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$RicSA.weXsoKfewWtbhKCOLbrPuZpWT3NKP8MfQcMQMlkOmnyZGSa', 'kGJ5yXiFDZjrXxYMuSdZ1krw3Q1f43btKkpWT2NspJm8hQXPkT4hh09spGJT', 1, 'Pk@1234', NULL, NULL, NULL, NULL, '2020-02-11 11:05:16', '2020-02-11 11:07:52'),
(57, 'hitechmobileptg', 'hitechmobileptg@gmail.com', '9587608910', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Init', 0, NULL, NULL, '$2y$10$nrtpRmg/gyf.NIm.mnxYwO1Ybdx5Y.UZBv7E7jqTeYe4JtTPQIfR2', NULL, 1, 'hitech958760', NULL, NULL, NULL, NULL, '2020-02-12 05:20:58', '2020-02-12 05:20:58'),
(58, 'Saravanan', 'saranbodi22@gmail.com', '08903255590', '1', 'Vignesh Cellphone and Laptop Services', '625513', NULL, 'Bodinayakanur', 'Tamilnadu', 'Udhayamariamman Kovil Upstairs', 'PH Road', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$FtOCx3pTXqX9wq/yTmtlOODIZzjQ.55c3ts/jXwyrFch2atirYA6e', 'Fbv8ORNolHAjtTSxNhLf4idRP25OhpQHhqz2y5pvNQcCuPZnRRBp9BFm0W5b', 1, 'Sa4546281174!', NULL, NULL, NULL, NULL, '2020-02-12 05:27:15', '2020-02-12 05:28:56'),
(59, 'Ram khedkar', 'ramakhedkar@gmail.com', '9890439595', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$uaI8DSp40ZkYgnRX.UFdYuAk7SZTZSgyHDJHiR4SnIARMGVEEkLlW', 'Eyrup7HoNUWOf2KNpDFNEQz7QW6ffpbbkcOtpQhNZCVRqrlRRo3HZBZX9Oaf', 1, 'Ran@9595', NULL, NULL, NULL, NULL, '2020-02-12 05:43:34', '2020-02-12 05:44:47'),
(60, 'Habibur Rahman', 'Mdhabib934@gmail.com', '9771205714', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$erOvfT/yXxsUszDC8RzGLOkzGn1sM9faki3woTrIqZueDqqXXSXmK', 'jn4Ja4GiKhVaWH7BGxEUMQjPNoM6VOCnMxpukScQAUy1vIgWmb0aDeEASufa', 1, '788300', NULL, NULL, NULL, NULL, '2020-02-12 06:00:58', '2020-02-12 06:01:18'),
(61, 'DILIP MALVIYA', 'dmalviya619@gmail.com', '7869038606', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$Ap8gfamm6spmKzP/BqAcPuLemvVxeWfPX6jLaZRCIYas1EYMm2xWW', 'SAICcDPNpWIjT12a6lAnA3hkwcVLwDoeceEZD64jtPRNT3MJDll7Qq2Ka5P5', 1, 'Hemant@333', NULL, NULL, NULL, NULL, '2020-02-12 06:05:50', '2020-02-12 06:12:32'),
(62, 'ANARUL ISLAM', 'sabinayesmin911@gmail.com', '8118960260', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$7S/7i0VFvupCjyD509rb/u6fOMoPayOvF.UUjyyUzDJfw524SBTs.', 'lQN82cg6f0BrvJe7OJI0naDqkHtGNbIihJtEpRiqD5q3CqWVAsbltt3JErA7', 1, 'SABINA@786', NULL, NULL, NULL, NULL, '2020-02-12 06:23:31', '2020-02-12 06:28:42'),
(63, 'Azarudeen', 'babunewtimes@gmail.com', '8667032001', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$8oOZ/UjM09r21r6mCtH.dOhb6OD9JXi.fN1SUYUZgyEP3yE9R3Qd.', 'QQnzDXA2aZi53M4r04I7fQPvT14llC6WhVx8htVmLcoca9oo1OSgYhyePxwn', 1, 'azeez99522', NULL, NULL, NULL, NULL, '2020-02-12 06:33:09', '2020-02-12 06:33:46'),
(64, 'Renuka', 'renuka_mob@rediffmail.com', '9372260631', '1', 'Renuka mobile shopee', '443101', NULL, 'Malkapur', 'Maharastra', 'Renuka mobile shopi  In front icici bank   jagannath sumuthi complex  letiphone colony rod malkapur  dist buldhana', 'Maharastra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$zPFNWHis7UsSjGEUuNx6NO8r7Np3ptLgrQ64pZT4epIKj3dm28XGK', 'NWvd1XIMDkJp4Z2SfJ4HLAESxF7tTR8CIOZjKYNXR4LOWBWvPflht8cZ1WB8', 1, '9372260631', NULL, NULL, NULL, NULL, '2020-02-12 07:12:02', '2020-02-12 09:42:58'),
(65, 'satish kumar sharma', 'satishkrsharma720@gmail.com', '7209118936', '1', 'SHARMA & SON\'S', '832108', NULL, 'Seraikela Kharsawan', 'Jharkhand', 'GAMHARIA USHA MORE', 'GAMHARIA USHA MORE', NULL, 22.84649310, 86.10391890, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$NCveotc2JrjjYzeqqTqShe2D.aDU/FG.axjIzs4xJij6tauYrktey', 'nvco6Ec8j9C50w0TBpkaMWzhG0UBndDoQOrVqczeuUa3SSwoErjuXk4mBJy2', 1, 'badrelations', NULL, NULL, NULL, NULL, '2020-02-12 07:20:20', '2020-02-12 07:22:57'),
(66, 'pavan Kumar', 'pavannamana@gmail.com', '09742866580', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$ml3qIXX5OUxAW0iPWvUsOORsOV9o.lgm5iRzXmEnMH/oc./DtN3Gm', 'GWzVrYVQH7ekUkarX5vZJ2juI756B8JOc3a0fKltgGisohtfjflAfnMow3R0', 1, '9060883639', NULL, NULL, NULL, NULL, '2020-02-12 15:31:09', '2020-02-12 15:31:34'),
(67, 'Ajit Sheoran', 'ajitsheoran3513@gmail.com', '9728116943', '1', 'Sheoran Mobile Repairing Centre', '127308', NULL, 'Badhra', 'Haryana', 'Main Chowk Badhra', 'Distt-Charkhi Dadri', NULL, 28.52133930, 75.96954650, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$RyOQmZE4kvoIJGK2DGFnMeSwQGDRlyVsXPGug3VP6HlfB4L2cxUC2', 'ET3AXvHvhNBZqj4qSarHfAsw1tOz0fX3ZHiUR99djhFJ7qlv9HiGz4mqnHt0', 1, 'ajit.ajit', NULL, NULL, NULL, NULL, '2020-02-12 21:30:26', '2020-02-12 21:37:47'),
(69, 'Ruvaiz khan', 'ruzu222@gmail.com', '8770677911', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$dFiH.AThy9dCppLzMNhN3.gshnO7455InwgcrrzTmxQIcZY/HJCca', '4LDlpnNbqzPdqtsEST2F7kh3LAxvq919BkGhrfC6XGwvrinhYoMTdrMDzJ11', 1, 'qwerty@12', NULL, NULL, NULL, NULL, '2020-02-13 06:57:14', '2020-02-13 06:57:33'),
(70, 'cell point', 'esusekar@gmail.com', '7373404887', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$oY2VEajbWPrwIBFec63d..v0wtM0/FYUGPE1/0DSfUUAxD5Y9i51e', 'psqVxDTHxEPCMZgQFuTLvPjbpgXTxIeTa3u37IFl9a1ziWmVi1mT0uKp4KM0', 1, '2016517059', NULL, NULL, NULL, NULL, '2020-02-13 09:28:52', '2020-02-13 09:40:41'),
(71, 'mekapothula sudhakar', 'ssbmobiles4u@gmail.com', '9553900966', '1', 'sri siva bhavani mobiles', '521201', NULL, 'Krishna', 'Andhra Pradesh', 'pedda gandhi bomma center', 'pg college road,nuzvid,near petrol bunk', NULL, 16.78037940, 80.87652050, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$Zeo5f7vz23hrVRTu26Klsenjj3DmrZq8mq9qfFdmmY/42Q7a14v1m', 'XZs5qM4Sseg1Ubnju0kYTwyx1HLnP5LyQKRvVoGSVbeLyBqlOQEZqb1DemPm', 1, 'Chinnu1@', NULL, NULL, NULL, NULL, '2020-02-13 13:36:31', '2020-02-13 13:42:43'),
(72, 'Mohibur Rahaman', 'Rmohibur85@gmail.com', '07005174309', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Init', 0, NULL, NULL, '$2y$10$II8fTRxxQvQxUHmk.n6pjux/YM4UgGCj6u4GbaXs7IOFU.WpIIKqm', NULL, 1, 'Hmzxq@1234', NULL, NULL, NULL, NULL, '2020-02-14 13:27:36', '2020-02-14 13:27:36'),
(74, 'abdul gaffur', 'updul69@gmail.com', '8415916938', '1', 'AG Electronics', '795131', NULL, 'Moreh', 'Manipur', 'Moreh Ward No 5', 'Near Indo-Myanmar friendship Gate', NULL, 24.39347540, 94.25384520, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$Adqtie6GJHfJuxjsio81S.gd/Yd9X231jAGBmHeUoufn9lfzoKeRS', 'y9OksUBUYfYCL8TQ35KscESZEb8ZqglfeLaFBSpbEJLLiNlKoGMQzbZFQ60B', 1, '7224@Ding', NULL, NULL, NULL, NULL, '2020-02-15 13:15:43', '2020-02-15 13:21:05'),
(75, 'Prabhakara T S', 'tigerprabha.ts@gmail.com', '9900970459', '1', 'Aishwarya Communivation And Enterprises', '562159', NULL, 'Ramanagara', 'Karnataka', 'B M Road Ijoor Ramanagara', 'near K S R T C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$crdumzHEzAJX.BTPxAuQ6O1uPnofpVeuLmy2z.VT.whtZvrj65TlO', 'DzQcZyR3b4u3AzUkSL3pISeOwFb8tILaftBo1GzCruP59qh1YXFBhdsMHs77', 1, '9900970459', NULL, NULL, NULL, NULL, '2020-02-16 06:58:01', '2020-02-16 07:05:24'),
(76, 'rakeshbhowmick', 'rakeshbhowmick999@gmail.com', '7003232725', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$MDFLPyBx7.zHU.fHyzt4X.eif/2YdHFBkx2NLlabI4MeP2ybpyaSS', 'bG6jxq0TmFqFm9Wu8OTlUgOfazgYatKc3IECACPG3IW2ZtfHnpGDBFxQ6cBY', 1, 'rakesh@999', NULL, NULL, NULL, NULL, '2020-02-17 16:45:06', '2020-02-17 16:46:28'),
(78, 'BASAVE GOWDA', 'mbasavegowda@gmail.com', '9739307926', '1', 'MOBILE REPAIR POINT', '560064', NULL, 'Bangalore Urban', 'Karnataka', '#540, LIG, 707, 4TH PHASE, 4TH MAIN, 4TH  CROSS', 'YELAHANKA NEW TOWN BANGLORE 560064', NULL, 13.10675220, 77.57570170, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$xx4XFU2f/LQsChneHzLJgOMASJk7XCy3FiPqYmSSUFSwWDPQ7pU8y', 'bJ3ceT7F7Im14v8pB5ozsLh198U66N2Sw5Oq6CA8AnsUNdOdwYln6gdUS0xM', 1, '9739307926', NULL, NULL, NULL, NULL, '2020-02-18 06:38:20', '2020-02-18 06:40:50'),
(79, 'Sonu Ali', 'sohailali232000@gmail.com', '7485002118', '1', 'Sakuntla Communication', '801109', NULL, 'Patna', 'Bihar', 'Lakh Sabzimandi, Naubatpur', 'Naubatpur, Patna', NULL, 25.49400270, 84.97135120, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$oKkDydY1OsBzg4owP4WB6.58hAgVtfQ/JLPe1MnNKyTletUwv5lKy', 'g60HuoQsKoNq2JWc192YXUHUnuQNPIwxJYkmVjJisy6nf8f8CWFrNp6EcrPD', 1, '7485002118', NULL, NULL, NULL, NULL, '2020-02-18 07:09:30', '2020-02-18 07:12:08'),
(80, 'Yogi', 'yogi003mathuria@gmail.com', '9023271546', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$84bsnDWbdAO7TDGIA92S8OQhN8Gs.OITokLc5ZHtJ5Y568uVHWPLi', '1mi2PxsQdbS5IJZSdY0tFAazpxdsIwLvAym2u7jZrPh98qG3jfX1vBIJDpeX', 1, '017910', NULL, NULL, NULL, NULL, '2020-02-19 10:04:19', '2020-02-19 10:04:45'),
(81, 'Krishan Roushan', 'krishankumarbth@gmail.com', '7979965100', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$R/KSjsxpSLSJ.q0NxGZ1venzDVaof17bM0qEcxPRQl6ksx5UZfU2O', 'BkutBRZbI3YZu7W5vZRFjsf9UfQct110pH432WGaYYCIhZn6yWTgjChXynRV', 1, '9122220084', NULL, NULL, NULL, NULL, '2020-02-20 06:03:35', '2020-02-20 10:31:11'),
(82, 'RAJENDRA MENDHE', 'mobicare69@gmail.com', '08390994639', '1', 'MOBILE CARE', '441902', NULL, 'AMGAON', 'Maharashtra', 'AT AMGAON TAH AMGAON DIST GONDIA', 'PIN 441902', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$7lhCZkWwuXL4H13MRbOjO.56FXovZ.Jmjbn6OAGX82yd9GHHl9GAW', 'SB4j0RbgEaqMfqlAA4VeyLBD3nv1r3O7cGdbDBmH57s78nJdrMDVUdxbGCvn', 1, 'ROCKSSTAR123', NULL, NULL, NULL, NULL, '2020-02-20 09:00:28', '2020-02-20 09:15:29'),
(84, 'Subhash negi', 'subhashnegi811@gmail.com', '9805940014', '1', 'Vijay mobile sale and service', '172101', NULL, 'Jeori', 'Himachal Pradesh', 'V. P. O jeori teh rampur', 'Distt shimla', NULL, 31.60703270, 77.76809520, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$zhqIWl4Jzp1pQ9nOLRpM/OZ0YiOzTQhnedLmwH5rSMWhNpZE45K.K', 'HSayM5B6Z33xHFGdBS0sQarMklIp6bGc7dZv1Qt3pSQyKySy4ij1BFfCxecX', 1, 'Golunegi300', NULL, NULL, NULL, NULL, '2020-02-20 10:08:44', '2020-02-20 10:14:35'),
(85, 'ROYAL MOBILE', 'pankaj_koriya2020@yahoo.in', '9879127571', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$q/Bz98lqsqfK0nf2zQjyJeF/lgTFc5WgoWpLyuUsbwH5wTlmVsWBi', 'M1EdxKMMOLQBqrjEHL3jUlTUbLc7gX3AIcnDuUv6MTCyYzhXLzUkENYIxKNj', 1, 'Yash@27571', NULL, NULL, NULL, NULL, '2020-02-20 12:24:56', '2020-02-20 12:30:58'),
(86, 'Anand viswam', 'tmprepair007@gmail.com', '9847432319', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$B6.GnczZS25V/42Yp9DQz.npWsBwuRh8UBz3Bes2R8w9Iz91M66.u', 'UCkx38CGjoJklXV6Aky9fnr3V9gTSjjVhNb5hSf75xS3LpvxWX7SOAFhTnuX', 1, 'Anand@007', NULL, NULL, NULL, NULL, '2020-02-21 04:43:40', '2020-02-21 04:44:04'),
(87, 'Subhash sirdar', 'subhashsirdar@gmail.com', '7354545392', '1', 'Shubh mobile', '497449', NULL, 'कोरिया', 'छत्तीसगढ़', 'Amka chauk pondi bachra korea cg', 'Amka chauk pondi bachra korea cg', NULL, 23.05824730, 82.43194050, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$RnFMys4zirf.HJ8JnPloA.x/2Bh.xHslnYf5EqOHAbXu5GKtVl4pq', '9mfLHm5HJ87B9wghW2HO3j3YeOQq65mW6RbnNGVVUp4P0WiZCk8D17WGEc4a', 1, '7354545392', NULL, NULL, NULL, NULL, '2020-02-21 07:15:04', '2020-02-21 08:56:35'),
(88, 'Mohammad Moin Khan', 'andoidgeeks@gmail.com', '9603337587', '1', 'SK Mobiles', '504001', NULL, 'Adilabad', 'Telangana', 'Near Natraj Theater Adilabad', 'Bhoktapoor', NULL, 19.65306470, 78.54337010, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$sOzxZcxmmQoWTKOIVFuG2uumeN7zhUWdSgQYxTxxRisKLLvy4qKRS', 'ZFTCC7Uv0PeKvg3J9RWUktpRjnvqZ4ipb5B04biHKEQ7LtDtgEfmCFrYQMqO', 1, 'Batista@1234', NULL, NULL, NULL, NULL, '2020-02-21 08:41:59', '2020-02-21 09:57:27'),
(89, 'Amit Kumar keshari', 'amitsoft14@gmail.com', '7380749091', '1', 'sachin enterprises', '212306', NULL, 'Koraon', 'Uttar Pradesh', 'malaviy nagar koraon prayagaraj', 'malaviy nagar koraon prayagraj', NULL, 24.93115620, 82.08429010, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$uLNOYZY3I2KlPbRbS9oh1ukXVsj8V14vaSVJTXoo74o4H6zrA/T66', 'akudHcDtP6JWzQgp8VMMefcwRMEMZIwzJx0O1C4XFNojgfUp3fQxOoyeSkcv', 1, '8795@123', NULL, NULL, NULL, NULL, '2020-02-21 09:58:49', '2020-02-24 16:12:19'),
(90, 'Deepak Kumar', 'sonanchalmobile@gmail.com', '9795609335', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$EkBzjcIOWwjeUetT/O0JYO3DMab9GTK/o8E.38iMfhs4TCmyCMdIS', 'luXY74nU388DBT0bFjaUGolaijFyYqbL9wH8RzPjYpV5e8QzPWvWwAqWne4c', 1, '9454544828', NULL, NULL, NULL, NULL, '2020-02-21 10:14:20', '2020-02-21 10:14:36'),
(92, 'Deepak Kumar', 'dk820550@gmail.com', '9464000689', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$XVgI4berMUSmrGGUHjIVnu6a6ml3E6vfYrvZvg0l4Ih61u4Eg/y1u', '6Z36oitctfQKAT17nGVEQm6r5kfihHyYW8gCTLyMpjcFy1ITG6rWWkTIEH0I', 1, 'deepak0689', NULL, NULL, NULL, NULL, '2020-02-21 10:51:16', '2020-02-21 10:52:13'),
(93, 'Ashish', 'ashimobilecare@gmail.com', '9993256835', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$EMdVet1qdWNcjqCPVSrmW.GYcefxbUL9jk0oNi1MJmCQ9iTLkPsGi', 'cSCi0stziXE0qRaJVVQH4rmr2nVsCLGDQnnQYHZy1yEZjBSxQAeImOXjiurh', 1, '50799336', NULL, NULL, NULL, NULL, '2020-02-21 12:01:49', '2020-02-21 12:12:41'),
(95, 'Goutam Mahata', 'Goutammobileworld@gmail.com', '8250143265', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Init', 0, NULL, NULL, '$2y$10$rUNZBsNuJBWv/4mpaw9m4uF3LdXctA1uA2VrSXPkdmKl1LsP8BEoO', NULL, 1, '9933468446', NULL, NULL, NULL, NULL, '2020-02-21 14:04:09', '2020-02-21 14:04:09'),
(97, 'Jana', 'janalogi1629@gmail.com', '9176353825', '1', 'AMK MOBILES', '600054', NULL, 'Avadi', 'Tamilnadu', 'NO 251/32 RC COMPLEX NERHU BAZZAR', 'Avadi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$InVLmBHJ7Z/vjGYMJKO2bui9eVdrjDeMkhD5YlMrNcarxXRJfxpBe', 'VvlgRLm6j4RFM7PD5rNlQMjPEwvK7NqmWdE56RjLoMfwG3YEvHOGuxgBXPPF', 1, 'Amkservuce123', NULL, NULL, NULL, NULL, '2020-02-21 17:57:52', '2020-02-21 18:00:37'),
(98, 'Akmal', 'akmal143r@gmail.com', '9263446865', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$KULDCtf6cwQFWa8BNCmlwedx7JOImWaZ9bTkBuvb7v0ZbYa3Alz0G', 'aP0GD6HpuyERBTcPUn84AOV77ts10sbgPcMvWc9ozg1UovLApmRZlnFtTdfn', 1, 'akmal143r', NULL, NULL, NULL, NULL, '2020-02-21 20:15:03', '2020-02-21 20:15:54'),
(99, 'Sairam', 'sai.reddy2588@gmail.com', '9290194046', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$c6xGqCTT8/AgOdQ.93H.q.aTaioQvxjOFA3mpAlyhs10s3OrQMXMu', 'v4Y9rj3EM8xcGXW5LEsxaS3FT4PbfRYVWqzXW4HnGT2xlJaZQOgSdv5HtOgr', 1, '4646464646', NULL, NULL, NULL, NULL, '2020-02-22 11:40:27', '2020-02-22 11:42:52'),
(100, 'Rajesh kumar', 'rk645451@gmail.com', '9882848376', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Init', 0, NULL, NULL, '$2y$10$s4fQERXcGR4NEDksAeyPOu95BVHSBH4gdnSe52c5MTk3RFmv8pRwi', NULL, 1, 'kando111', NULL, NULL, NULL, NULL, '2020-02-22 14:14:27', '2020-02-22 14:14:27'),
(101, 'RAKESH RANJAN', 'rakeshranjanobra@gmail.com', '9097198198', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$U9KwuYK85smJwRgb4bjmYew.MLOX//4g67x1CJOdiCqvkkSsHphhi', 'FKErly1f4XxuAMDbJLxNhZNtuSJjyQEVf3AiImkyHb10keLevcbGOcNbxxzh', 1, '9097000034', NULL, NULL, NULL, NULL, '2020-02-22 15:20:13', '2020-02-22 15:20:44'),
(102, 'Mohd Faisal', 'faisalmansoori17@gmail.com', '9919005023', '2', 'Ayan Mobiles', '271903', NULL, 'Dihawa Sher Bahadur Singh', 'Uttar Pradesh', 'Mahila Hospital Wali Gali Kaisarganj Bahraich', 'Mahila Hospital Wali Gali Kaisarganj Bahraich', NULL, 27.26719130, 81.49379930, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$F8TZW5RhF.HivdiF16KV/uVuAlgMZER8S.v.uJr5NrkgEQX2h0csW', 'fvvk8572SbzdH76p1wMjLNTSLDvwFeiZgVbreX62OK1a27ghW7YHwHWe6o8S', 1, 'Faisal@17', NULL, NULL, NULL, NULL, '2020-02-23 03:10:49', '2020-02-23 03:13:50'),
(103, 'Pittala raju', 'rajuamma98@gmail.com', '9908202797', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$UWA1/hRtsfilB8D.bxJldOxUELZVzEEHxdH34whT9Tnqil5xVVEOO', 'rAQtZqKVAnoX0E5lzgHIAqJFWwCBaKeWGZv00bazDAbwRfDrJr5mAVuqFFc7', 1, 'raju@1234', NULL, NULL, NULL, NULL, '2020-02-23 04:02:54', '2020-02-23 04:03:10'),
(104, 'Prince kumar', '9708835@gmail.com', '6201443961', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$38dXPq.IDD7BdriVqbJ.recuZ5OahudoClKTbkA1wUtjrqPI6GIrq', 'JnyCEWk5kZTxZqDcdWyodoJPA0UGOuHG59xop1ixE0JA6BcOivsBmxM0B0Y2', 1, '6201443961pk', NULL, NULL, NULL, NULL, '2020-02-23 13:37:28', '2020-02-23 13:37:48'),
(105, 'PINAKI Ghosh', 'pinakighosh69@gmail.com', '9775132701', '1', 'PRB INFOTECH', '721437', NULL, 'West Medinipur', 'West Bengal', 'Makrampur Bazar', 'Makrampur', NULL, 22.19392410, 87.40091650, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$KZNR8F.xcs5HYRivn/NxieA4lVZKCgDeNSK8lSnoAr.m5LdfZSMjm', '0D1uDtwXCt3hAMLEZ0eHEnM7aT98wNyN1OzQuLNeaNPGBvvgDcwAJJ4rYamM', 1, '9775132701&b', NULL, NULL, NULL, NULL, '2020-02-23 16:44:21', '2020-02-23 16:46:03'),
(106, 'Praveen', 'rapakapraveen@gmail.com', '9989315915', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$DXUiA30kLmf25KymtxOsOOTP5guGzrnyaLsgRCo3UZqUb7qJpS1Q.', 'HuEYnddGRIMorsAt8HA4cIPXAtfbA60p4BviZIIdWLryuuuSOvNJzUlbdpGt', 1, 'bangaram', NULL, NULL, NULL, NULL, '2020-02-24 02:37:37', '2020-02-24 02:37:52'),
(107, 'Tarun', 'tripathitarun14395@gmail.com', '9713145002', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$aMFGpTWL7e/A8D0ZDTM8gusy0UoU7vc2HS6pIO1g.Nk2XD9BPPvGS', '3xVSeXz0eHYb1CiBLaSLmdOv53RsoseFzd90LLTclN9ELipPTRHsy5NWrqBB', 1, 'mango14395', NULL, NULL, NULL, NULL, '2020-02-24 05:47:11', '2020-02-24 05:47:43'),
(108, 'Hari Prakash Maurya', 'hpindia88@gmail.com', '7522881100', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$kglacaFraTeKzbn9FQJNku8pnZVWMASA1hkGnvi4g.TGGeB5IgfKu', 'p8MLfN0xetl3LUo8N6ZScwU2WOb4eAeYS6VcQYPvoRQHdWpqZIqaHLaqpz4a', 1, 'Hari@2016', NULL, NULL, NULL, NULL, '2020-02-24 08:02:24', '2020-02-24 08:02:51'),
(109, 'Prabu', 'prabu.yuvasri@gmail.com', '8248895889', '1', 'Sri mobiles', '624702', NULL, 'Dindigul', 'Tamil Nadu', 'Murugan kovil street', 'Eriyodu', NULL, 10.51530530, 78.03095420, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$E9g2slmCtt9wOaN/c4arpemHJai5qoZ/nn0vUa7sR/kLyXvFSV8AW', '0CYAEnEK85lL1zD3Ff7EuaujO8KMduiEiQVgKUz1u7fisWaql7MdSt9dth4y', 1, 'murugaperumal', NULL, NULL, NULL, NULL, '2020-02-24 09:49:55', '2020-02-24 09:57:12'),
(110, 'Raj', 'raj7kumar16@gmail.com', '6207120534', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$NFoil4.C.pj/evYPGYWbsOU1LJm2fjxadAmOwg3adJxZxFZv2gHQy', 'lol8XFbt7xNeTead7lBGHWlMD23UtJSNPksH4aGkqdW8jVBuCXJu7cFjmJNE', 1, 'kaylee75500@', NULL, NULL, NULL, NULL, '2020-02-24 11:10:02', '2020-02-24 11:10:27'),
(111, 'AHMAD RAZA', 'ahmadraza942243@gmail.com', '9422434549', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$lFpMQNVAkwCIjiHcTqlbY.5Czln0ZXe6yeYJkXJQmEUUZqqGmmC8m', 'F9x4qq9s9HEisco21lhjmvwMcvSTK5eCKAL4ppbEqIyTuyTefKH7BJuP3moU', 1, 'ahmad313', NULL, NULL, NULL, NULL, '2020-02-25 11:08:38', '2020-02-25 11:08:56'),
(112, 'vijay kumar', 'viji230785@gmail.com', '9964635536', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Init', 0, NULL, NULL, '$2y$10$WKuhqjWwGNapSdU5z0hb6.2BkZlNQdGhpnn.j0sCWfjXZYgevES4S', NULL, 1, '9972991681', NULL, NULL, NULL, NULL, '2020-02-25 11:16:53', '2020-02-25 11:16:53'),
(114, 'Ajay', 'dharmkumar941@gmail.com', '9614830581', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$ZuyvRwXiULmKmwNSnlsQNu5JMfzat/DNMKAAu2gBikxXag.14Pj5e', 'BrLcQyP4uKROOdJ5kYH0r92bAW3M6c42ATp95sZf4ER13vNbmffrcKiI69fG', 1, '9851594088', NULL, NULL, NULL, NULL, '2020-02-25 12:03:56', '2020-02-25 12:04:19'),
(115, 'Pintu', 'pintu001212@gmail.com', '9931560667', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$nbJpsXC03pzNoyncVuBnXuE23/E/S28unY5BX97lM1I2E4CXnMXZy', 'sVze8u0ptqEOQOVb5RuYXZRA0MmENHojMmezAx8YY111FTwMCU7PTUc8v3jx', 1, '00121212', NULL, NULL, NULL, NULL, '2020-02-25 12:20:26', '2020-02-25 12:20:52'),
(116, 'selvakumar', 'selvapkt85@gmail.com', '9788190755', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$HCp9ZgVEKR6P5.3ZPmEg8uNZJWY87nGQ6HEvYCTDPZn8KXiKLE8p2', 'U3NLK25aBnWqydqx6IxVA2xccMosQXIy8jIbgS9Rf3k3FcY64kSpjQa3Z9Nq', 1, 'Nokia3310c', NULL, NULL, NULL, NULL, '2020-02-25 14:42:39', '2020-02-25 14:43:05'),
(117, 'nazmul', 'naz690f@gmail.com', '7002116491', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$surC3GAtfE8Fl1eEQi2e7OtjmUBXOxPK2VQfVdBWxkxG5JZ3paz6m', 'ZWnSPXxYYi0ExA2AwFcY0BZX4YYaRIdusjBqlvsESD1tUqOCzGMCnqEZ6hEy', 1, '245/1992', NULL, NULL, NULL, NULL, '2020-02-25 15:51:00', '2020-02-25 15:52:18'),
(118, 'Ajay Raj', 'ajay92147@gmail.com', '8638760442', '2', 'Vijay store', '783129', NULL, 'Goalpara', 'Assam', 'Lakhipur', 'Main bazar', NULL, 26.01747360, 90.28078680, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$qBjq4WRuofNW/5YvgHJJ2.HhPbUCrGZzMKnwROSQa0/.SqMcyb8j.', '0LqjxIiIrPAVgAn4Uh720PSBvkLWihC6hDLBHSK3EmseoWYXinJdiEWHqsIH', 1, 'ajayraj5', NULL, NULL, NULL, NULL, '2020-02-25 17:06:50', '2020-02-25 17:08:34'),
(119, 'Mahesh Pawar', 'solutionmobile79@gmail.com', '9923269238', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$yxg4M03CnhA.XkAjvTiZ4..zmyU8MAWlBPQeYFRPW/aQCxvrOF1gS', 'gLYbJjaALYTjlXfPHtp8dRBhdwwy3fHkGupC7545wFiyA2oi9cl4pJkanG96', 1, 'Solution@38', NULL, NULL, NULL, NULL, '2020-02-25 21:01:40', '2020-02-25 21:02:13'),
(121, 'Bhaskar', 'bhaskargupta132@gmail.com', '7000283818', '1', 'Natraj Mobile', '497001', NULL, 'Ambikapur', 'Chhattisgarh', 'Shivaji chowk, church road, ambikapur', 'Chattishgarh', NULL, 23.18458500, 83.12200740, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$60Otp9L4G8FIF8023DiiCe5Vt5McALE8TriT8r/8QdVLxNV/1iDXG', '1Lfj6hpwWxBi1JJ6hbaizEh3t0tMoqWll0tlnSsFKTthZbF60h6pYLJ0PbhC', 1, '9826964751b', NULL, NULL, NULL, NULL, '2020-02-26 08:19:49', '2020-02-26 08:28:41'),
(122, 'amit goyal', 'goyalamit1541@gmail.com', '9811145110', '1', 'AVSG Communication', '110055', NULL, 'New Delhi', 'Delhi', '161-162 New Gaffar Market', 'Hardhyan Singh Road', NULL, 28.64556700, 77.21109720, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$ux.RqCzyTwVPK43PEpBSh.uvEGdFEf.pfmn.1z0fk/d5hzLXTd99i', 'zS4xm5KK8zdJGcfGnrO3EUuCDmXskvWqikxdy5apBam6A2O6Mt3ydmJQtBig', 1, 'Amitgoyal1', NULL, NULL, NULL, NULL, '2020-02-26 08:41:52', '2020-02-27 07:03:34'),
(123, 'Roni Store', 'iamshahinurislam0@gmail.com', '9101132562', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$iuiH2KT3vYKVcRfdEHYUxOT7bm6VS4IagQ3lz1dTX..BuPTEOUTz.', 'yHGLqkuicoeJ3tkqdfWeVQOGXK74zVmWcLQdwXOgzTzEt9Ogh6t0Eo3C2pAp', 1, 'ronibhai01', NULL, NULL, NULL, NULL, '2020-02-26 08:43:29', '2020-02-26 08:45:09'),
(124, 'ganesh kumar', 'mobileshop7550@gmail.com', '9125197550', '1', 'ganesh mobile', '274202', NULL, 'deoria', 'Uttar Pradesh', 'hata road gauri bazar', 'deoria', NULL, 26.63383100, 83.69865680, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$bjioewG60m6aVu2PZEbyG.DEYg19MvtENfFssbMImJskOLyoG7I6q', 'hOHlDUH9xizCl6GMY2Nj74tLmQH7YXjjgvmHhDWu4CfpYuVN4EoWQOMYFo0B', 1, '9125197550', NULL, NULL, NULL, NULL, '2020-02-26 08:50:56', '2020-02-26 08:53:31'),
(125, 'Anup Kumar', 'cyberworld6989@gmail.com', '8660042849', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$OeZd.PVOr87C5kvmojhfZ.JSCHofLR2SLgDz/zfcL72fxqba1ruQO', 'QYRwsNLqfjtAKPQ00k6s4nPM30sTZVXFFsKz2Irw0vRGq3EKMY3l1D8pzdBk', 1, 'Iphonex1tb@', NULL, NULL, NULL, NULL, '2020-02-26 11:49:39', '2020-02-26 11:49:53'),
(126, 'Ram Maurys', 'rammaurya9648@gmail.com', '9517184282', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$NKJQswf5YH7.GU7Jm3wdeeXMgthmNxPRUIIJl.RX8HoKcWgPBnyDm', 'NOk4QntsymoHbT6KHsfJojWNgKto4HL7vUMFxhnjHgAat3mzGK4yyNLQDPEA', 1, 'Ram@9648', NULL, NULL, NULL, NULL, '2020-02-26 13:23:19', '2020-02-26 13:23:57'),
(127, 'Senthil KN', 'gokulmobilespolur@gmail.com', '9865818614', '1', 'Gokul mobiles', '606803', NULL, 'Tiruvannamalai', 'Tamil Nadu', '96/A Railway station road', 'Polur', NULL, 12.51532740, 79.13227440, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$EHVj2C6xX/Ql.tezPzuF2eMLy05J1rmZgfVg4ZlpDgCiq471UVQQG', 'KWtc4G6c4K4rBx07i1MTXBOG7qpJqIARFAJ9L3H7HVmYehyY6RgEHbHWmD3c', 1, '9865818614', NULL, NULL, NULL, NULL, '2020-02-26 21:24:37', '2020-02-26 21:26:53'),
(128, 'Mrinmay Ghosh', 'mahaprabhuelectronics@gmail.com', '9126234219', '1', 'Mahaprabhu Electronics', '712404', NULL, 'jangipara, hooghly', 'West Bengal', 'jangipara, hooghly', 'near state bank of india', NULL, 22.73949630, 88.08030510, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$OEatkpwab5TIAq6NXqh.jOP1glKeWaTGYo75Ol8hoa/aZv4yi0n7q', 'vlZZElZOzPd5nZNbTuQrzlLEQ1ZZoioNFdOxOAWyvECHToBXJQoakj2bLonp', 1, 'monu973209', NULL, NULL, NULL, NULL, '2020-02-27 04:08:15', '2020-02-27 04:12:25'),
(132, 'pravin m', 'pravinya0027@gmail.com', '8805921943', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$z/xTnx.HQkhK3Qs7D1ZwMe1BOm2NrsSZBg5UGgP612BBSZwh9aytu', 'STDjjNzKcPOu27UbjryEtg5TwyqKIJPVPLleXjEuo3MGj3qTo3CcJGgNkzJc', 1, 'qwerty', NULL, NULL, NULL, NULL, '2020-02-27 14:15:01', '2020-02-27 14:15:20'),
(133, 'rajendra singh', 'repairslab14@gmail.com', '9950991535', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$R0wR9OTsT59I/Vkbf3bQR.fhHljMItqjqoivuj.DpRskH0.KsyWSi', 'NEyuY354Be6XK5iSMRxG0XbmJzNwwyrwlXRWg6fLkZ9THGQI3yqqaUcpgqmk', 1, 'rj19sr@01', NULL, NULL, NULL, NULL, '2020-02-27 14:50:04', '2020-02-27 14:50:27'),
(134, 'Mohd Asif', 'Aashiq.mmx@gmail.com', '9559340153', '1', 'Kuldeep Mobile', '284001', NULL, 'Jhansi', 'Uttar Pradesh', 'In Front Of GyaanSthali School Jhansi', 'Shivaji Nagar Jhansi', NULL, 25.42225570, 78.57176310, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$.dnepjLwI4Ks0eY3FOXyi.Ewnt5TqpiWFpgK3nM5VWwFB7CG7Q4G.', '2GcJpVyeMV1k5QSigBcfIY4scC1Pfubs4SpWp0oaP3LFRZ04834GSmSt7Pkp', 1, 'micromax', NULL, NULL, NULL, NULL, '2020-02-27 17:03:20', '2020-02-27 17:07:40'),
(135, 'Anshu', 'anshuzentex85@gmail.com', '9807303600', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Init', 0, NULL, NULL, '$2y$10$4n0kx0UZcJ1Fi.d0n5YtwOZXSCRZGKxT4Q/dD.dT/XtHUcOxeLaGu', NULL, 1, 'Talgram@09', NULL, NULL, NULL, NULL, '2020-02-27 18:00:13', '2020-02-27 18:01:58'),
(137, 'Hello Brother Mobile', 'kgoldi31@gmail.com', '9661719490', '2', 'Hello brother mobile', '800004', NULL, 'Patna', 'Bihar', 'Bakerganj', 'Bajaja Gali', NULL, 25.61206710, 85.16078400, 'Tools', NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$TeGzu2GB0qprRHN/IJKMQ.JJ3NA4a0K0bOAFnbt92aBBoHDOnOzaC', 'eu8H9C0kIzPHLsbxdRlic6ZnybueVqg9BRRhMrgChZzXodBWbc6U2AszKxjl', 1, 'goldi9934', NULL, NULL, NULL, NULL, '2020-02-28 07:28:00', '2020-02-29 07:16:57'),
(138, 'rajesh', 'jeevanrajesh3@gmail.com', '8886552289', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$cyZWGl5lclQydanhAhIYTu9QY6P/3sfVLTJuVJP5T/zZM0MTFhPre', 'RbqJXjvMyzQiUSVECubCkLZxDDF2m9yALWLjjiRQQq76G5Sz7dVPnsJgTOgA', 1, 'Chetan#9999', NULL, NULL, NULL, NULL, '2020-02-29 09:51:33', '2020-02-29 09:51:48'),
(139, 'kamal', 'kamalgalgat@gmail.com', '9783532803', '1', 'kamalmobile', '335062', NULL, 'sadul-shahar', 'Rajasthan', '1', '1', NULL, 29.85844680, 74.14748460, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$t.QSzECwUjzOWRSweI7Use.ywqjTBIV201Gglleqc2Z9wwo7HlGdm', '0eXhbYD3lhSO7aIRWho0nonlkF3g6mG84dVnUTwBgVjlUza7Dxz9SewHOzeH', 1, 'kamal@12345', NULL, NULL, NULL, NULL, '2020-02-29 13:01:10', '2020-02-29 13:03:06'),
(140, 'Ranjan munda', 'ranjankumar21130@gmail.com', '6379004677', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Init', 0, NULL, NULL, '$2y$10$Dn/EtyLJlEBOQ6VLLmaFdOp6POVfXh99VrYSVFty5/JLFGwbVyLt2', NULL, 1, '6379004677', NULL, NULL, NULL, NULL, '2020-02-29 16:37:38', '2020-02-29 16:37:38'),
(141, 'Shakir Ali', 'shakirl88@gmail.com', '9852665983', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$SQDpYyR9YLamtNetUrxXVuHeNZVbcUGWE2QJhN9kqLRhrLiqRj2Yi', 'hcMajuh6viQTuGYBfwl7v9vupt6Z4HDlhdNhxd9Mo7gxxDkp8yM6AENbC7Gz', 1, 'qwerty', NULL, NULL, NULL, NULL, '2020-03-02 18:23:09', '2020-03-02 18:23:55'),
(142, 'Shatrughan', 'shatrughanbst@gmail.com', '9648440756', '1', 'Raj mobile', '272302', NULL, 'Basti', 'Uttar Pradesh', 'Belari Chauraha', 'Basti', NULL, 26.72527750, 82.66994700, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$fXMbSGBtudOmWvZnOG7whOjqKVzV.82qNOyvfVRsqgYM.bveg5lO6', 'rXcUCDyXeFbHMqXPI0f0nRbdagimCJ4D0mbCWH1A1ui2TwQ9cUCxnhS2edZV', 1, '12345678', NULL, NULL, NULL, NULL, '2020-03-03 02:10:03', '2020-03-03 02:12:54'),
(143, 'saddam', 'saddamrangrej@gmail.com', '9725874713', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$iJoF01WWb/wfzAyLPhsjSuxkrUhJx2.HbvFoFHPo5nnmF8MUBv1HS', 'jPkjvrPwYCdwOvw0KaLkxEcPVeewYzsOxlaYuPdhKp0vB2JQRJYWA5az2ySx', 1, '8000107860', NULL, NULL, NULL, NULL, '2020-03-03 04:28:04', '2020-03-03 04:28:18'),
(144, 'Kaleem', 'kaleem4u2u@gmail.com', '9842498798', '1', 'Sanjay Mobile Solutions', '636808', NULL, 'Palacode', 'Tamilnadu', 'Bus stand, palacode', 'Dharmapuri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$udppxuqo2npsx0uLNNbqV.We0R1ZSobB71ZHBkGmM0nLNp/CM39bS', 'vEHp9xcb0b64W8B1zyE9S1OG2g8xgMOwJaD7bGOi32OKICXLKRCK0aY5hFOb', 1, 'Aa1!-Zz1!', NULL, NULL, NULL, NULL, '2020-03-03 07:54:46', '2020-03-03 07:57:07'),
(145, 'Srinivas', 'srinivaskatakam35@gmail.com', '9247459693', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$QwDen1MVwJ1SefSogjsHhu5UnALf6Q0cssDM26iNWMgWCE4WvjB8K', 'RQNPEz5vTqBCv2lUegXQtV7Y6omTvC8s0hxQw9lpVTsZYIUm5fNntV7MvWEM', 1, '9247459693', NULL, NULL, NULL, NULL, '2020-03-03 08:48:39', '2020-03-03 08:49:12'),
(146, 'Mukesh jain', 'mukesh.h479@gmail.com', '9945301671', '1', 'Parshwa telecom', '586212', NULL, 'Bijapur', 'Karnataka', 'Main road', 'Muddebihal', NULL, 16.38489370, 76.24791200, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$LN3i5Hg4nm/tWO9iaf3Sf.IElkftbX3LT85Htenmn.3xvsGKggmUC', '9xKnCYwsgHFLgY53wCf2Ql44OChmWCUjvw4H6zBTXCHCwRh7GZTstesxqP4M', 1, '45301671', '1583225882-1191038035.jpeg', NULL, NULL, NULL, '2020-03-03 08:54:42', '2020-03-03 08:58:02'),
(147, 'Ravinder', 'Ravindar141@gmail.com', '9550390380', '1', 'Surya mobiles', '505402', NULL, 'Rajanna sircilla', 'Telangana', 'Ellanthakunta', 'Ellanthakunta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$EXPpsWInJdnirmi/4MuquesXhck4p4jC6GypD4MdAv6SeHFG7n05S', '5PJ8VcY5WDImdm34wrlxszKM2VJyTosozmxizLRF6OYMRI153W4WPcKNERhw', 1, 'surya1234', NULL, NULL, NULL, NULL, '2020-03-03 09:27:34', '2020-03-03 09:32:11'),
(148, 'Sanjay Kumar', 'dilkhushsingh1@gmail.com', '9813825584', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$OaloS.ScW3Mwex8SzaGle.19o/.X8radUG.RnDBjtVncawPTHpILC', 'wk8PbAkXQunBSXuG8u8UOVVjLSx7tvxc51RSmoP5Z6F1Q0zOX9aGjysIIgot', 1, 'rupa26sanjay', '1583235716-394258594.jpeg', NULL, NULL, NULL, '2020-03-03 11:33:50', '2020-03-03 11:41:56'),
(149, 'rahul', 'rahulmobile807@gmail.com', '6394307728', '2', 'Rahul mobile', '274401', NULL, 'kushinagar', 'uttar pardesh', 'bankata bajar', 'fajilanagar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$Ys9/vSIX9mlvBBooUREkfOA9Rze/rKwZ6QlbKat08C0IGxHEXhusG', 'yCjoggYcPPZq2SuXTPWN73acCX65A3H0LOl8JFaYwnnVr3fwCwqShgo1SvAo', 1, '7379969914', NULL, NULL, NULL, NULL, '2020-03-03 12:00:05', '2020-03-03 12:03:01'),
(150, 'Manigandan P', 'manigandanp0@gmail.com', '09741999992', '1', 'E-fix', '560028', NULL, 'Bangalore Urban', 'Karnataka', '5th main road', 'T.R.NAGAR', NULL, 12.93348150, 77.56910640, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$adYsy5g2mGgrPKZlGa1SsOUYzJXlHgg.0urOYw4L0D9dUQ.ppPvHa', '6Rt9D9Uc3j8QFx5y1sV0ACxVxfUAWsOpn7QLQXNgWZZ5AXcjpDCYmx6FHQa2', 1, 'Maddy*1004#', NULL, NULL, NULL, NULL, '2020-03-03 12:59:26', '2020-03-03 13:01:49'),
(151, 'Uma Shankar Prasad Yadav', 'umashankarprasadyadav@gmail.com', '9006004642', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$RrPBK3KIL1NaUGWloposO.dgwRtL0uftQdNZ5c/zxEz8UmSzgQZ8K', 'vRcuP4FJ3VgjWA96lXIUbTJE7I4MVvYHYY4xlYD6MLSFUm2fy6vlHJbkbTuD', 1, 'Uma@7862533', NULL, NULL, NULL, NULL, '2020-03-03 15:43:57', '2020-03-03 15:44:42'),
(152, 'Suraj Kumar', 'iamsurajkr00@gmail.com', '6202156062', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$8aKttlYU5O3L/WjOHt2k9.hATx6gcmNOLKQn.uwAnUiy6cXigTll6', 'D9VTG08tpsJhEGrWcCoC1uCH29S7aCOiCKsuGYKVkV0jlFkvBBwkw46xFJSB', 1, 'Suraj@171095', NULL, NULL, NULL, NULL, '2020-03-04 02:00:47', '2020-03-04 02:01:05'),
(153, 'Manish kumar', 'chandanjai34@gmail.com', '7398205354', '2', 'Chandan Mobile', '248140', NULL, 'Dehradun', 'Uttarakhand', 'Doiwal', 'Near Ajay telar P.N.B.', NULL, 30.18995000, 78.08801290, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$aE/sTWwXi044SKzWQVO9tOg3YIgHfsaEalo2z/gHWZOT4eUW25hjG', 'TXXyx3ppWAPTwBWcjmWwDqMDikUZGgDzwsqF6wY762LsQCCUcp2gow1Tne7T', 1, '7398205354', NULL, NULL, NULL, NULL, '2020-03-04 02:46:15', '2020-03-04 02:49:03'),
(155, 'Shanu', 'shanujat07@gmail.com', '8871772273', '1', 'Narmada mobile (Gsm Shanu)', '462001', NULL, 'Bhopal', 'Madhya Pradesh', 'https://www.google.com/search?q=shanu+jat+hamidia+rd&rlz=1C1CHBF_enIN873IN873&oq=shanu+jat&aqs=chrome.1.69i57j0j69i60l3.7679j0j7&sourceid=chrome&ie=UTF-8', 'Hamidia Rd, Ghora Nakkas, Peer Gate Area, Bhopal, Madhya Pradesh', NULL, 23.26960830, 77.39560040, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$Z5Ch9NglsE2q0Gvl//qJmut/WQ/ppGMi.UdIK9AXvN6gqIkUBeC7y', 'RACCg3roJ62tzSwrKhGigNeqJ7DZykJ8gIrjcua5LlMREp6X7eMLkrUd7Mw9', 1, '8871shanusweta', NULL, NULL, NULL, NULL, '2020-03-04 06:36:01', '2020-03-04 06:41:04'),
(156, 'Again shahed', 'shaikhshahed409@gmail.com', '9881818976', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$RJZcgeEQsAQq/NUPdiyonuXuvoOGg4d1Xn8kiB4EiIkgxsm/lvCQ2', 'Ufuy836YS10nb5rwNlQBvsvZFWZIvhTeU3dK4GYiA0dFPhL8y7Jwd7n2EG0G', 1, 'shaikh123', NULL, NULL, NULL, NULL, '2020-03-04 07:06:05', '2020-03-04 07:06:41'),
(157, 'Rizwan Ali', 'rizwanali123sh.rs@gmail.com', '9890610366', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Init', 0, NULL, NULL, '$2y$10$BKuMgXymQRh3Fp4ZPPXeNeUbVRfs.DTGxjlJDsc20aYNiyR6r1YtS', NULL, 1, '10011988', NULL, NULL, NULL, NULL, '2020-03-04 07:12:08', '2020-03-04 07:15:45'),
(158, 'Rameshwarpooja', 'rameshwarmasari@gmail.com', '9828310127', '1', 'Pooja mobile point', '321605', NULL, 'Kathumar', 'Rajsthan', 'Kathumar', 'Alwar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$/53S31CZz7nS1XjC6xTC3u/.BEkwdtdMc3yf4V6a/Md4Gk.ShuqoS', 'PMVPlXNSS0ZCFY5SfobV3Y6JmJ1xgVIE8Pb43tnxkYLnt8soWNrpAFsyoeae', 1, '000000', NULL, NULL, NULL, NULL, '2020-03-04 07:21:57', '2020-03-04 07:24:18'),
(160, 'Vikash pal', 'palvikash67@gmail.com', '7748893005', '1', 'Vikash mobile &camputer repairing', '474001', NULL, 'Gwalior', 'Mp', 'Shinde ki chawani near wincom plaza', 'Gwalior shinde ki chawani near Wincom plaza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$1Ykr/7FSvh4wkyLlY17OiefB3OOTmetGTbVshv9uhOFZUV139Eh/y', 'YJLwzKPjJvE7bTfwToxfMOeS5rFgQXn2sPV4EyfzDHc3OY2xVMh2qer42fmY', 1, 'madhu@vikash', NULL, NULL, NULL, NULL, '2020-03-04 08:01:14', '2020-03-04 08:05:29'),
(161, 'Ramakrishna', 'jr.ramakrishna@gmail.com', '8142875803', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Init', 0, NULL, NULL, '$2y$10$K3kt0C8ryoebN/mrWqH7QeC677vRQvUps16Dg1mCfPCJSd1PfgGHy', NULL, 1, 'kittu225', NULL, NULL, NULL, NULL, '2020-03-04 08:40:28', '2020-03-04 08:40:28');
INSERT INTO `users` (`id`, `name`, `email`, `mobile_number`, `user_type`, `shop_name`, `location`, `postal_code`, `city`, `state`, `address_line1`, `address_line2`, `landmark`, `shop_latitude`, `shop_longitude`, `spare_parts_name`, `social_fb_id`, `social_twitter_id`, `social_google_id`, `registeration_status`, `is_premium_user`, `current_plan`, `premium_expiry_date`, `password`, `remember_token`, `active`, `normal_password`, `photos1`, `photos2`, `photos3`, `photos4`, `created_at`, `updated_at`) VALUES
(162, 'sunil', 'skagrahari@gmail.com', '9815818015', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$MHygG.yg3K2Dg1XVXVx..uE/CCPBs4bYIAXe07mSLi0XuycvvkE4m', 'QbRacPsXYybjvZ8H9NM9XuUIKNmm3ZHSo7xrSQEVP6fPXwQxd2Cfl0umzLLu', 1, '9936966098', NULL, NULL, NULL, NULL, '2020-03-04 09:03:33', '2020-03-04 09:04:50'),
(163, 'AJEET KUMAR', 'ajeet.k.m65@gmail.com', '7573855059', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$UQHXNS4U0dgSQeLsLYfU8.KuhMg8E3AFF7FMNk17ieu4qbRfD/Lre', 'sMhUCl4eiRfGnhCXEq6xL3RTTvLZSq8fqkeO117BO79LCjfCpw7JhDl6BqOi', 1, 'ak757385@', NULL, NULL, NULL, NULL, '2020-03-04 09:31:29', '2020-03-04 09:32:02'),
(164, 'Naresh', 'naresh.k691@gmail.com', '9573340105', '1', 'srinivasa mobiles', '517501', NULL, 'Chittoor', 'Andhra Pradesh', '1-18, jayasam road', 'tirupati', NULL, 13.62446110, 79.43100520, NULL, NULL, NULL, NULL, 'Success', 0, NULL, NULL, '$2y$10$8jyj9DoSpFocRZ9vDcuJxOeIg6wbhsmPA99c.qL43ZFxsKO/34vFG', 'oscVONIWYC9fkbYbCyYuDMJHO3jrKWMyLnAvZMvvSzN43mqvoS1UpI7sn5zp', 1, 'n9573340105', NULL, NULL, NULL, NULL, '2020-03-04 11:40:29', '2020-03-04 11:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_password_resets`
--

CREATE TABLE `user_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verify_numbers`
--

CREATE TABLE `verify_numbers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mobile_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('VERIFY','VALID','INVALID') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verify_numbers`
--

INSERT INTO `verify_numbers` (`id`, `mobile_number`, `otp_code`, `country_code`, `status`, `created_at`, `updated_at`) VALUES
(17, '8446123434', '648752', '+91', 'VERIFY', '2019-12-26 12:36:42', '2020-03-04 06:07:50'),
(18, '9304902404', '834019', '+91', 'VERIFY', '2019-12-26 13:07:48', '2020-01-14 07:50:19'),
(19, '7980477199', '630478', '+91', 'VERIFY', '2019-12-26 13:11:58', '2020-02-18 06:36:17'),
(20, '8805249035', '279586', '+91', 'VERIFY', '2019-12-27 06:43:41', '2020-01-10 00:49:55'),
(21, '9934007836', '983260', '+91', 'VERIFY', '2019-12-30 11:58:47', '2019-12-31 10:16:24'),
(22, '8935939022', '049286', '+91', 'VERIFY', '2020-01-02 06:04:24', '2020-02-26 08:20:45'),
(23, '9330085388', '653091', '+91', 'VERIFY', '2020-01-06 07:31:17', '2020-02-26 07:30:30'),
(24, '9883121550', '123569', '+91', 'VERIFY', '2020-01-08 05:32:25', '2020-01-08 06:43:31'),
(25, '9331944886', '975210', '+91', 'VERIFY', '2020-01-08 09:43:53', '2020-01-24 05:56:10'),
(26, '9781122334', '231985', '+91', 'VERIFY', '2020-01-16 21:16:20', '2020-01-16 21:16:20'),
(27, '8460339333', '504871', '+91', 'VERIFY', '2020-01-18 11:08:25', '2020-01-24 06:08:54'),
(28, '9648239060', '592183', '+91', 'VERIFY', '2020-01-19 14:35:10', '2020-01-19 14:35:10'),
(29, '7350373432', '830264', '+91', 'VERIFY', '2020-01-20 03:56:51', '2020-01-20 03:56:51'),
(30, '0547596351', '407192', '+91', 'VERIFY', '2020-01-20 14:22:32', '2020-01-20 14:22:32'),
(31, '9472919542', '081975', '+91', 'VERIFY', '2020-01-23 05:46:59', '2020-01-23 05:46:59'),
(32, '6353683394', '795231', '+91', 'VERIFY', '2020-01-23 17:26:32', '2020-01-23 17:26:34'),
(33, '8574926006', '952031', '+91', 'VERIFY', '2020-01-24 14:17:11', '2020-01-24 14:17:11'),
(34, '7697349320', '436572', '+91', 'VERIFY', '2020-01-25 02:52:23', '2020-02-19 12:46:41'),
(35, '8686684243', '785926', '+91', 'VERIFY', '2020-01-25 14:31:15', '2020-01-25 14:31:15'),
(36, '7009662263', '932768', '+91', 'VERIFY', '2020-01-28 10:01:59', '2020-01-28 10:01:59'),
(37, '9377779677', '039547', '+91', 'VERIFY', '2020-01-28 12:13:51', '2020-01-28 12:13:51'),
(38, '8210524174', '564031', '+91', 'VERIFY', '2020-01-31 07:30:23', '2020-02-19 15:25:22'),
(39, '9741414325', '293614', '+91', 'VERIFY', '2020-01-31 11:30:50', '2020-01-31 11:30:50'),
(40, '17029541490', '086193', '+91', 'VERIFY', '2020-02-03 07:06:11', '2020-02-03 07:10:32'),
(41, '9828051280', '190453', '+91', 'VERIFY', '2020-02-03 08:48:50', '2020-02-03 08:48:50'),
(42, '9732984174', '786034', '+91', 'VERIFY', '2020-02-06 09:06:50', '2020-02-06 09:06:50'),
(43, '0755373467', '329604', '+91', 'VERIFY', '2020-02-08 02:25:10', '2020-02-08 02:29:32'),
(44, '8405824334', '859301', '+91', 'VERIFY', '2020-02-11 06:25:46', '2020-02-11 06:25:46'),
(45, '9084267068', '249356', '+91', 'VERIFY', '2020-02-11 07:32:12', '2020-02-11 07:35:41'),
(46, '9149101949', '732149', '+91', 'VERIFY', '2020-02-11 07:38:55', '2020-02-11 07:38:55'),
(47, '9134096901', '937618', '+91', 'VERIFY', '2020-02-11 11:05:16', '2020-02-11 11:05:16'),
(48, '9587608910', '548932', '+91', 'VERIFY', '2020-02-12 05:20:58', '2020-02-12 05:20:58'),
(49, '08903255590', '089317', '+91', 'VERIFY', '2020-02-12 05:27:15', '2020-02-12 05:27:15'),
(50, '9890439595', '245197', '+91', 'VERIFY', '2020-02-12 05:43:34', '2020-02-12 05:43:34'),
(51, '9771205714', '643291', '+91', 'VERIFY', '2020-02-12 06:00:58', '2020-02-12 06:00:58'),
(52, '7869038606', '861253', '+91', 'VERIFY', '2020-02-12 06:05:50', '2020-02-12 06:12:05'),
(53, '8118960260', '417839', '+91', 'VERIFY', '2020-02-12 06:23:31', '2020-02-12 06:23:31'),
(54, '8667032001', '306897', '+91', 'VERIFY', '2020-02-12 06:33:09', '2020-02-12 06:33:09'),
(55, '9372260631', '451732', '+91', 'VERIFY', '2020-02-12 07:12:02', '2020-02-12 07:12:02'),
(56, '7209118936', '913046', '+91', 'VERIFY', '2020-02-12 07:20:20', '2020-02-12 07:20:20'),
(57, '09742866580', '932081', '+91', 'VERIFY', '2020-02-12 15:31:09', '2020-02-12 15:31:09'),
(58, '9728116943', '406921', '+91', 'VERIFY', '2020-02-12 21:30:26', '2020-02-12 21:30:26'),
(59, '08770677911', '405871', '+91', 'VERIFY', '2020-02-13 02:08:06', '2020-02-13 02:08:06'),
(60, '8770677911', '493218', '+91', 'VERIFY', '2020-02-13 06:57:14', '2020-03-02 13:30:41'),
(61, '7373404887', '316042', '+91', 'VERIFY', '2020-02-13 09:28:52', '2020-02-13 09:40:11'),
(62, '9553900966', '465871', '+91', 'VERIFY', '2020-02-13 13:36:31', '2020-02-13 13:36:31'),
(63, '07005174309', '921354', '+91', 'VERIFY', '2020-02-14 13:27:36', '2020-02-14 13:27:36'),
(64, '09739307926', '816523', '+91', 'VERIFY', '2020-02-15 04:11:28', '2020-02-15 04:11:28'),
(65, '8415916938', '346750', '+91', 'VERIFY', '2020-02-15 13:15:43', '2020-02-15 13:15:43'),
(66, '9900970459', '204953', '+91', 'VERIFY', '2020-02-16 06:58:01', '2020-02-16 06:58:01'),
(67, '7003232725', '398174', '+91', 'VERIFY', '2020-02-17 16:45:06', '2020-02-17 16:45:06'),
(68, '0242605117', '973218', '+91', 'VERIFY', '2020-02-18 04:14:49', '2020-02-18 04:14:49'),
(69, '9739307926', '679854', '+91', 'VERIFY', '2020-02-18 06:38:20', '2020-02-20 06:10:33'),
(70, '7485002118', '013985', '+91', 'VERIFY', '2020-02-18 07:09:30', '2020-02-18 07:20:36'),
(71, '9023271546', '081342', '+91', 'VERIFY', '2020-02-19 10:04:19', '2020-02-19 10:04:19'),
(72, '7979965100', '731654', '+91', 'VERIFY', '2020-02-20 06:03:35', '2020-02-20 10:30:40'),
(73, '08390994639', '472310', '+91', 'VERIFY', '2020-02-20 09:00:28', '2020-02-20 09:00:28'),
(74, '09805940014', '058461', '+91', 'VERIFY', '2020-02-20 09:58:46', '2020-02-20 09:58:46'),
(75, '9805940014', '698405', '+91', 'VERIFY', '2020-02-20 10:08:44', '2020-02-20 10:08:44'),
(76, '9879127571', '236794', '+91', 'VERIFY', '2020-02-20 12:24:56', '2020-02-20 12:24:56'),
(77, '9847432319', '812605', '+91', 'VERIFY', '2020-02-21 04:43:40', '2020-02-21 04:43:40'),
(78, '7354545392', '268439', '+91', 'VERIFY', '2020-02-21 07:15:04', '2020-02-21 08:51:41'),
(79, '9603337587', '510628', '+91', 'VERIFY', '2020-02-21 08:41:59', '2020-02-21 08:41:59'),
(80, '7380749091', '375462', '+91', 'VERIFY', '2020-02-21 09:58:49', '2020-02-21 09:58:49'),
(81, '9795609335', '726104', '+91', 'VERIFY', '2020-02-21 10:14:20', '2020-02-21 10:14:20'),
(82, '8102408711', '189265', '+91', 'VERIFY', '2020-02-21 10:19:22', '2020-02-21 10:19:22'),
(83, '9464000689', '583401', '+91', 'VERIFY', '2020-02-21 10:51:16', '2020-02-21 10:51:16'),
(84, '9993256835', '738502', '+91', 'VERIFY', '2020-02-21 12:01:49', '2020-02-21 12:12:05'),
(85, '08033250618', '641327', '+91', 'VERIFY', '2020-02-21 14:04:04', '2020-02-21 14:04:04'),
(86, '8250143265', '634179', '+91', 'VERIFY', '2020-02-21 14:04:09', '2020-02-21 14:04:09'),
(87, '887527203', '890274', '+91', 'VERIFY', '2020-02-21 15:54:20', '2020-02-21 15:54:20'),
(88, '9176353825', '039572', '+91', 'VERIFY', '2020-02-21 17:57:52', '2020-02-21 17:57:52'),
(89, '9263446865', '145692', '+91', 'VERIFY', '2020-02-21 20:15:03', '2020-02-21 20:15:03'),
(90, '9290194046', '785693', '+91', 'VERIFY', '2020-02-22 11:40:27', '2020-02-22 11:40:27'),
(91, '9882848376', '869375', '+91', 'VERIFY', '2020-02-22 14:14:27', '2020-02-22 14:14:27'),
(92, '9097198198', '048397', '+91', 'VERIFY', '2020-02-22 15:20:13', '2020-02-22 15:20:13'),
(93, '9919005023', '768934', '+91', 'VERIFY', '2020-02-23 03:10:49', '2020-02-23 03:10:49'),
(94, '9908202797', '792351', '+91', 'VERIFY', '2020-02-23 04:02:54', '2020-02-23 04:02:54'),
(95, '6201443961', '037158', '+91', 'VERIFY', '2020-02-23 13:37:28', '2020-02-23 13:37:28'),
(96, '9775132701', '495023', '+91', 'VERIFY', '2020-02-23 16:44:21', '2020-02-23 16:44:21'),
(97, '9989315915', '328590', '+91', 'VERIFY', '2020-02-24 02:37:37', '2020-02-24 02:37:37'),
(98, '9713145002', '234681', '+91', 'VERIFY', '2020-02-24 05:47:11', '2020-02-24 05:47:11'),
(99, '7522881100', '612948', '+91', 'VERIFY', '2020-02-24 08:02:24', '2020-02-24 08:02:24'),
(100, '8248895889', '834165', '+91', 'VERIFY', '2020-02-24 09:49:55', '2020-02-24 09:55:44'),
(101, '6207120534', '519083', '+91', 'VERIFY', '2020-02-24 11:10:02', '2020-02-24 11:10:02'),
(102, '9422434549', '234956', '+91', 'VERIFY', '2020-02-25 11:08:37', '2020-02-25 11:08:37'),
(103, '9964635536', '785290', '+91', 'VERIFY', '2020-02-25 11:16:53', '2020-02-25 11:16:53'),
(104, '9614830581', '547690', '+91', 'VERIFY', '2020-02-25 11:30:11', '2020-02-25 12:03:56'),
(105, '9931560667', '386402', '+91', 'VERIFY', '2020-02-25 12:20:26', '2020-02-25 12:20:26'),
(106, '9788190755', '231704', '+91', 'VERIFY', '2020-02-25 14:42:39', '2020-02-25 14:42:39'),
(107, '7002116491', '423157', '+91', 'VERIFY', '2020-02-25 15:51:00', '2020-02-25 15:51:04'),
(108, '8638760442', '835496', '+91', 'VERIFY', '2020-02-25 17:06:50', '2020-02-25 17:06:50'),
(109, '9923269238', '934052', '+91', 'VERIFY', '2020-02-25 21:01:40', '2020-02-25 21:01:40'),
(110, '9811145110', '879326', '+91', 'VERIFY', '2020-02-26 07:38:00', '2020-02-26 08:41:52'),
(111, '7000283818', '805127', '+91', 'VERIFY', '2020-02-26 08:19:49', '2020-02-26 08:26:39'),
(112, '9101132562', '583201', '+91', 'VERIFY', '2020-02-26 08:43:29', '2020-02-26 08:43:29'),
(113, '9125197550', '926137', '+91', 'VERIFY', '2020-02-26 08:50:56', '2020-02-26 08:50:56'),
(114, '8660042849', '379560', '+91', 'VERIFY', '2020-02-26 11:49:39', '2020-02-26 11:49:39'),
(115, '9517184282', '462710', '+91', 'VERIFY', '2020-02-26 13:23:18', '2020-02-26 13:23:18'),
(116, '9865818614', '152837', '+91', 'VERIFY', '2020-02-26 21:24:37', '2020-02-26 21:24:37'),
(117, '9126234219', '321608', '+91', 'VERIFY', '2020-02-27 04:08:15', '2020-02-27 04:08:16'),
(118, '9933472875', '481706', '+91', 'VERIFY', '2020-02-27 05:12:02', '2020-02-27 05:12:02'),
(119, '09686792166', '540127', '+91', 'VERIFY', '2020-02-27 07:08:30', '2020-02-27 07:08:40'),
(120, '08068888019', '103426', '+91', 'VERIFY', '2020-02-27 07:15:32', '2020-02-27 07:17:26'),
(121, '8805921943', '685230', '+91', 'VERIFY', '2020-02-27 14:15:01', '2020-02-27 14:15:01'),
(122, '9950991535', '159786', '+91', 'VERIFY', '2020-02-27 14:50:03', '2020-02-27 14:50:03'),
(123, '9559340153', '615204', '+91', 'VERIFY', '2020-02-27 17:03:20', '2020-02-27 17:03:20'),
(124, '9807303600', '794356', '+91', 'VERIFY', '2020-02-27 18:00:13', '2020-02-27 18:01:58'),
(125, '8562881226', '752094', '+91', 'VERIFY', '2020-02-28 04:20:28', '2020-02-28 04:20:28'),
(126, '9661719490', '628135', '+91', 'VERIFY', '2020-02-28 07:28:00', '2020-02-28 07:28:00'),
(127, '8886552289', '297831', '+91', 'VERIFY', '2020-02-29 09:51:33', '2020-02-29 09:51:33'),
(128, '9783532803', '256178', '+91', 'VERIFY', '2020-02-29 13:01:10', '2020-02-29 13:01:10'),
(129, '6379004677', '157063', '+91', 'VERIFY', '2020-02-29 16:37:38', '2020-02-29 16:37:38'),
(130, '9852665983', '769235', '+91', 'VERIFY', '2020-03-02 18:23:09', '2020-03-02 18:23:09'),
(131, '9648440756', '632970', '+91', 'VERIFY', '2020-03-03 02:10:03', '2020-03-03 14:25:05'),
(132, '9725874713', '148652', '+91', 'VERIFY', '2020-03-03 04:28:04', '2020-03-03 04:28:04'),
(133, '9842498798', '109628', '+91', 'VERIFY', '2020-03-03 07:54:46', '2020-03-03 07:54:46'),
(134, '9247459693', '576934', '+91', 'VERIFY', '2020-03-03 08:48:39', '2020-03-03 08:48:39'),
(135, '9945301671', '654913', '+91', 'VERIFY', '2020-03-03 08:54:42', '2020-03-03 08:54:42'),
(136, '9550390380', '375281', '+91', 'VERIFY', '2020-03-03 09:27:34', '2020-03-03 09:27:34'),
(137, '9813825584', '915237', '+91', 'VERIFY', '2020-03-03 11:33:50', '2020-03-03 11:33:50'),
(138, '6394307728', '753489', '+91', 'VERIFY', '2020-03-03 12:00:05', '2020-03-03 12:00:05'),
(139, '09741999992', '812567', '+91', 'VERIFY', '2020-03-03 12:59:26', '2020-03-03 12:59:26'),
(140, '9006004642', '582769', '+91', 'VERIFY', '2020-03-03 15:43:57', '2020-03-03 15:43:57'),
(141, '6202156062', '089637', '+91', 'VERIFY', '2020-03-04 02:00:47', '2020-03-04 02:00:47'),
(142, '7398205354', '813974', '+91', 'VERIFY', '2020-03-04 02:46:15', '2020-03-04 02:46:15'),
(143, '082291796557', '830475', '+91', 'VERIFY', '2020-03-04 05:29:53', '2020-03-04 05:34:18'),
(144, '8871772273', '635471', '+91', 'VERIFY', '2020-03-04 06:36:01', '2020-03-04 06:36:01'),
(145, '9881818976', '936407', '+91', 'VERIFY', '2020-03-04 07:06:04', '2020-03-04 07:06:06'),
(146, '9890610366', '643179', '+91', 'VERIFY', '2020-03-04 07:12:08', '2020-03-04 07:15:45'),
(147, '9828310127', '109236', '+91', 'VERIFY', '2020-03-04 07:21:57', '2020-03-04 07:21:57'),
(148, '7748893005', '436801', '+91', 'VERIFY', '2020-03-04 07:40:47', '2020-03-04 08:01:14'),
(149, '8142875803', '216793', '+91', 'VERIFY', '2020-03-04 08:40:28', '2020-03-04 08:40:28'),
(150, '9815818015', '415876', '+91', 'VERIFY', '2020-03-04 09:03:33', '2020-03-04 09:03:33'),
(151, '7573855059', '024871', '+91', 'VERIFY', '2020-03-04 09:31:29', '2020-03-04 09:31:29'),
(152, '9573340105', '376805', '+91', 'VERIFY', '2020-03-04 11:40:29', '2020-03-04 11:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `video_categories`
--

CREATE TABLE `video_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video_categories`
--

INSERT INTO `video_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Software', '2019-09-05 19:00:29', '2019-09-12 18:45:38'),
(3, 'Hardware', '2019-09-10 12:36:58', '2019-09-10 12:36:58'),
(4, 'EMMC', '2019-09-13 06:16:56', '2019-09-13 06:16:56'),
(5, 'Apple', '2019-09-25 07:05:55', '2019-09-25 07:05:55'),
(7, 'test cat', '2019-10-21 13:44:25', '2019-10-21 13:44:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`),
  ADD KEY `admin_password_resets_token_index` (`token`);

--
-- Indexes for table `ewaste_categories`
--
ALTER TABLE `ewaste_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ewaste_password_resets`
--
ALTER TABLE `ewaste_password_resets`
  ADD KEY `ewaste_password_resets_email_index` (`email`),
  ADD KEY `ewaste_password_resets_token_index` (`token`);

--
-- Indexes for table `ewaste_products`
--
ALTER TABLE `ewaste_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ewaste_product_images`
--
ALTER TABLE `ewaste_product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ewaste_users`
--
ALTER TABLE `ewaste_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ewaste_users_email_unique` (`email`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_categories`
--
ALTER TABLE `file_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_brands`
--
ALTER TABLE `mobile_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_feature_labels`
--
ALTER TABLE `mobile_feature_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_issues`
--
ALTER TABLE `mobile_issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_models`
--
ALTER TABLE `mobile_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_model_images`
--
ALTER TABLE `mobile_model_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_model_labels`
--
ALTER TABLE `mobile_model_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `premium_today_files`
--
ALTER TABLE `premium_today_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repairing_quotations`
--
ALTER TABLE `repairing_quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repair_quotation_amounts`
--
ALTER TABLE `repair_quotation_amounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `sellers_password_resets`
--
ALTER TABLE `sellers_password_resets`
  ADD KEY `sellers_password_resets_email_index` (`email`),
  ADD KEY `sellers_password_resets_token_index` (`token`);

--
-- Indexes for table `sell_categories`
--
ALTER TABLE `sell_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sell_locations`
--
ALTER TABLE `sell_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sell_products`
--
ALTER TABLE `sell_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sell_product_images`
--
ALTER TABLE `sell_product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_users`
--
ALTER TABLE `subscription_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `traning_videos`
--
ALTER TABLE `traning_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_password_resets`
--
ALTER TABLE `user_password_resets`
  ADD KEY `user_password_resets_email_index` (`email`),
  ADD KEY `user_password_resets_token_index` (`token`);

--
-- Indexes for table `verify_numbers`
--
ALTER TABLE `verify_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_categories`
--
ALTER TABLE `video_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ewaste_categories`
--
ALTER TABLE `ewaste_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ewaste_products`
--
ALTER TABLE `ewaste_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ewaste_product_images`
--
ALTER TABLE `ewaste_product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ewaste_users`
--
ALTER TABLE `ewaste_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `file_categories`
--
ALTER TABLE `file_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `mobile_brands`
--
ALTER TABLE `mobile_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mobile_feature_labels`
--
ALTER TABLE `mobile_feature_labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mobile_issues`
--
ALTER TABLE `mobile_issues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mobile_models`
--
ALTER TABLE `mobile_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mobile_model_images`
--
ALTER TABLE `mobile_model_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mobile_model_labels`
--
ALTER TABLE `mobile_model_labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `premium_today_files`
--
ALTER TABLE `premium_today_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repairing_quotations`
--
ALTER TABLE `repairing_quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `repair_quotation_amounts`
--
ALTER TABLE `repair_quotation_amounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_categories`
--
ALTER TABLE `sell_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sell_locations`
--
ALTER TABLE `sell_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_products`
--
ALTER TABLE `sell_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=726;

--
-- AUTO_INCREMENT for table `sell_product_images`
--
ALTER TABLE `sell_product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=718;

--
-- AUTO_INCREMENT for table `subscription_users`
--
ALTER TABLE `subscription_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `traning_videos`
--
ALTER TABLE `traning_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `verify_numbers`
--
ALTER TABLE `verify_numbers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `video_categories`
--
ALTER TABLE `video_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
