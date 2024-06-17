-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2024 at 03:11 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `invoice_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','paid','overdue') NOT NULL DEFAULT 'pending',
  `due_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `invoice_date`, `total_amount`, `balance`, `paid`, `user_id`, `status`, `due_date`, `created_at`, `updated_at`) VALUES
(1, '408843527', '2002-11-14', 43.71, 868.56, 232.79, 3, 'pending', '2024-02-19 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(2, '204621813', '1973-12-04', 589.43, 600.62, 690.32, 9, 'overdue', '1971-10-04 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(3, '357037588', '2017-10-16', 734.45, 859.72, 696.80, 4, 'paid', '1997-09-19 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(4, '258944269', '2013-01-06', 707.82, 342.33, 412.03, 1, 'paid', '1987-05-05 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(5, '518852283', '1998-05-17', 309.07, 396.92, 528.84, 6, 'overdue', '1970-02-28 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(6, '236302487', '1983-05-01', 66.34, 500.77, 66.87, 5, 'paid', '1976-05-16 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(7, '545493756', '1994-05-27', 722.12, 148.51, 437.12, 5, 'overdue', '1990-07-21 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(8, '915321515', '2006-01-25', 669.63, 753.95, 277.75, 10, 'paid', '2016-02-12 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(9, '189520433', '1982-09-26', 622.53, 311.83, 411.19, 10, 'pending', '1985-12-21 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(10, '930985257', '2015-12-18', 638.96, 689.79, 617.82, 4, 'paid', '2018-09-18 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(11, '963647285', '1984-06-07', 664.47, 450.30, 465.84, 10, 'pending', '1980-09-04 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(12, '313826599', '2004-09-25', 998.50, 227.60, 70.06, 1, 'overdue', '2023-09-27 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(13, '314551000', '1977-05-25', 541.66, 52.57, 409.95, 8, 'pending', '2016-11-13 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(14, '626782240', '1990-05-27', 385.97, 493.28, 592.38, 4, 'overdue', '2020-08-23 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(15, '287697235', '1989-07-13', 414.01, 416.36, 249.55, 1, 'overdue', '1996-02-11 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(16, '759127091', '1971-08-28', 214.87, 816.01, 166.63, 2, 'paid', '2023-04-24 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(17, '393814929', '1999-08-12', 481.13, 123.72, 738.29, 4, 'paid', '2018-10-31 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(18, '245951783', '1997-08-18', 601.63, 413.71, 593.85, 9, 'paid', '2004-04-27 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(19, '946916083', '2011-06-14', 67.21, 540.38, 319.54, 6, 'pending', '1993-12-21 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(20, '400389533', '2022-10-22', 71.75, 571.37, 180.50, 10, 'overdue', '2013-03-22 21:00:00', '2024-06-13 14:14:39', '2024-06-13 14:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
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
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
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
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2024_06_13_150311_create_transactions_table', 1),
(8, '0001_01_01_0000004_create_users_table', 2),
(9, '0001_01_01_000001_create_cache_table', 2),
(10, '0001_01_01_000002_create_jobs_table', 2),
(11, '2024_06_13_100138_create_personal_access_tokens_table', 2),
(12, '2024_06_13_150249_create_invoices_table', 2),
(13, '2024_06_13_150312_create_transactions_table', 2),
(14, '2024_06_15_084725_create_mpesa_transaction_table', 3),
(15, '2024_06_15_084726_create_mpesa_transaction_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_transactions`
--

CREATE TABLE `mpesa_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Order ID',
  `request_date_time` datetime NOT NULL COMMENT 'Date/Time request was initiated',
  `merchant_request_id` varchar(255) NOT NULL COMMENT 'Merchant Request ID',
  `checkout_request_id` varchar(255) NOT NULL COMMENT 'Checkout Request ID',
  `response_code` varchar(255) NOT NULL COMMENT 'Request''s response code',
  `response_desc` varchar(255) NOT NULL COMMENT 'Request''s response description',
  `customer_msg` varchar(255) NOT NULL COMMENT 'Request''s customer message',
  `response_date_time` datetime DEFAULT NULL COMMENT 'Date/Time payment response was received',
  `result_code` varchar(255) DEFAULT NULL,
  `result_desc` varchar(255) DEFAULT NULL,
  `txn_amount` decimal(8,2) DEFAULT NULL COMMENT 'Transaction Amount',
  `mpesa_receipt_no` varchar(255) DEFAULT NULL COMMENT 'MPESA Confirmation Code',
  `sender_phone_no` varchar(255) DEFAULT NULL COMMENT 'Customer/Sender''s phone number',
  `txn_status` varchar(255) NOT NULL DEFAULT 'Open' COMMENT 'Open/Closed/Failed/Cancelled - Transaction Status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` varchar(255) DEFAULT '0' COMMENT 'Invoice ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpesa_transactions`
--

INSERT INTO `mpesa_transactions` (`id`, `order_id`, `request_date_time`, `merchant_request_id`, `checkout_request_id`, `response_code`, `response_desc`, `customer_msg`, `response_date_time`, `result_code`, `result_desc`, `txn_amount`, `mpesa_receipt_no`, `sender_phone_no`, `txn_status`, `created_at`, `updated_at`, `invoice_id`) VALUES
(1, 1, '2024-06-15 08:54:03', 'f1e2-4b95-a71d-b30d3cdbb7a7378320', 'ws_CO_15062024115405782114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, '0', 'The service request is processed successfully.', 1.00, 'NLJ7RT61SV', '254708374149', 'Open', '2024-06-15 05:54:03', '2024-06-16 13:23:37', '123'),
(2, 123, '2024-06-15 08:58:59', 'f1e2-4b95-a71d-b30d3cdbb7a7378362', 'ws_CO_15062024115901606114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, NULL, NULL, NULL, 'Open', '2024-06-15 05:58:59', NULL, '123'),
(3, 123, '2024-06-15 08:59:15', '53e3-4aa8-9fe0-8fb5e4092cdd3092835', 'ws_CO_15062024120233029114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, NULL, NULL, NULL, 'Open', '2024-06-15 05:59:15', NULL, '123'),
(4, 123, '2024-06-15 09:36:56', '1c5b-4ba8-815c-ac45c57a3db01091555', 'ws_CO_15062024123659310114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, NULL, NULL, NULL, 'Open', '2024-06-15 06:36:56', NULL, '123'),
(5, 1, '2024-06-15 09:44:31', '1c5b-4ba8-815c-ac45c57a3db01091632', 'ws_CO_15062024124748671114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, NULL, NULL, NULL, 'Open', '2024-06-15 06:44:31', NULL, '123'),
(6, 1, '2024-06-15 09:46:33', 'c0d2-4b9a-a71a-12bae346ef6e2745468', 'ws_CO_15062024124635369114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 1.00, NULL, NULL, 'Open', '2024-06-15 06:46:33', NULL, '123'),
(7, 1, '2024-06-15 10:06:20', '7071-4170-a0e4-8345632bad441088925', 'ws_CO_15062024130622525114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 1.00, NULL, NULL, 'Open', '2024-06-15 07:06:20', NULL, '123'),
(8, 1, '2024-06-15 11:26:54', 'f1e2-4b95-a71d-b30d3cdbb7a7379793', 'ws_CO_15062024143011997114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 1.00, NULL, NULL, 'Open', '2024-06-15 08:26:54', NULL, '123'),
(9, 1, '2024-06-16 15:55:45', '7071-4170-a0e4-8345632bad441105995', 'ws_CO_16062024185548031114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 1.00, NULL, NULL, 'Open', '2024-06-16 12:55:45', NULL, '123'),
(10, 1, '2024-06-16 15:58:39', 'f1e2-4b95-a71d-b30d3cdbb7a7396182', 'ws_CO_16062024185842259114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 1.00, NULL, NULL, 'Open', '2024-06-16 12:58:39', NULL, '123'),
(11, 1, '2024-06-16 16:06:23', 'f1e2-4b95-a71d-b30d3cdbb7a7396279', 'ws_CO_16062024190619251114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 1.00, NULL, NULL, 'Open', '2024-06-16 13:06:23', NULL, '123'),
(12, 1, '2024-06-16 16:09:52', 'f1e2-4b95-a71d-b30d3cdbb7a7396316', 'ws_CO_16062024191310886114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 1.00, NULL, NULL, 'Open', '2024-06-16 13:09:52', NULL, '123'),
(13, 1, '2024-06-16 16:12:05', 'f1e2-4b95-a71d-b30d3cdbb7a7396323', 'ws_CO_16062024191208186114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 1.00, NULL, NULL, 'Open', '2024-06-16 13:12:05', NULL, '123'),
(14, 1, '2024-06-16 16:14:49', '53e3-4aa8-9fe0-8fb5e4092cdd3118363', 'ws_CO_16062024191451681114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 1.00, NULL, NULL, 'Open', '2024-06-16 13:14:49', NULL, '123'),
(15, 1, '2024-06-16 16:15:37', 'f1e2-4b95-a71d-b30d3cdbb7a7396359', 'ws_CO_16062024191539593114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 1.00, NULL, NULL, 'Open', '2024-06-16 13:15:37', NULL, '123'),
(16, 1, '2024-06-16 16:17:58', 'f1e2-4b95-a71d-b30d3cdbb7a7396379', 'ws_CO_16062024191801120114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 1.00, NULL, NULL, 'Open', '2024-06-16 13:17:58', NULL, '123'),
(17, 1, '2024-06-16 16:23:51', 'f1e2-4b95-a71d-b30d3cdbb7a7396426', 'ws_CO_16062024192709755114340314', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 1.00, NULL, NULL, 'Open', '2024-06-16 13:23:51', NULL, '123'),
(18, 1, '2024-06-16 23:45:54', 'c0d2-4b9a-a71a-12bae346ef6e2776630', 'ws_CO_17062024024913897702820251', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 10.00, NULL, NULL, 'Open', '2024-06-16 20:45:54', NULL, '1'),
(19, 1, '2024-06-17 00:35:16', '53e3-4aa8-9fe0-8fb5e4092cdd3125327', 'ws_CO_17062024033836170702820251', '0', 'Success. Request accepted for processing', 'Success. Request accepted for processing', NULL, NULL, NULL, 10.00, NULL, NULL, 'Open', '2024-06-16 21:35:16', NULL, '12');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'API Token', '0060af0028c8de1e6c8a5bece50ef95c2da2fd2470de4fb694ac3ffe6ba2b36f', '[\"*\"]', '2024-06-16 21:52:42', NULL, '2024-06-13 14:17:32', '2024-06-16 21:52:42'),
(2, 'App\\Models\\User', 1, 'API Token', '6efc632430c20fdf3f82c5bc0ed0809ba57b01839e686b2de6c06c741584e795', '[\"*\"]', '2024-06-16 21:35:14', NULL, '2024-06-16 20:44:17', '2024-06-16 21:35:14');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5BcDidDgd2fko9HEwvCdk611r0iRWQJcq2GIfpVu', NULL, '127.0.0.1', 'PostmanRuntime/7.39.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2N6Z0hyQlRJRVVHS0htd0wyQVdHWjRpSDg4TkpNSDFvSFM4OHo0cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8wYTkyLTEwNS0xNjMtMTU2LTEwNS5uZ3Jvay1mcmVlLmFwcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1718585537),
('aoJgPikzu3Wi8urjbqoe7fRWq4Xf2SbzskM7HYXn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0NMUUJYYlo0dHNQNmxNR1lpS2xjb2xDVFNUSmVINzFwYmtHV29VRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8wYTkyLTEwNS0xNjMtMTU2LTEwNS5uZ3Jvay1mcmVlLmFwcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1718552629);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','success','cancelled','failed') NOT NULL DEFAULT 'pending',
  `date_paid` date DEFAULT '2024-06-13',
  `payer_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `invoice_id`, `transaction_id`, `amount`, `status`, `date_paid`, `payer_name`, `created_at`, `updated_at`) VALUES
(1, 5, 6, 'o2WppT6X7x', 11202.00, 'cancelled', '1987-03-30', 'Kenya Harber II', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(2, 1, 10, 'AFmzyemFxa', 13897.00, 'failed', '1999-10-20', 'Perry Koch', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(3, 5, 5, 'RWjriU6np1', 2099.00, 'pending', '1983-03-22', 'Prof. Mellie Wolff', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(4, 4, 17, '9im5CNeKYm', 15404.00, 'success', '2004-05-26', 'Miss Maudie Ziemann Sr.', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(5, 5, 2, 'Fjna88yesE', 8074.00, 'cancelled', '1984-06-23', 'Dahlia Leannon', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(6, 5, 4, 'jI6X45k7p3', 8312.00, 'pending', '2017-11-06', 'Jesse Schroeder', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(7, 9, 8, '5qC709caOU', 13504.00, 'success', '1972-06-17', 'Prof. Keara Tillman DDS', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(8, 6, 19, 'gBLniyNCf3', 13154.00, 'cancelled', '1992-04-15', 'Mrs. Alicia Berge', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(9, 3, 13, '5HHBA9Gjko', 15500.00, 'success', '1977-02-26', 'Anahi Stehr V', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(10, 9, 6, '8ivzmrqdJ7', 19397.00, 'success', '2020-12-07', 'Maurine Rutherford', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(11, 12, 18, '2u6ago7BRx', 17383.00, 'failed', '2022-01-25', 'Prof. Kaycee Stroman I', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(12, 12, 12, 'gMmhQ5Crm5', 10644.00, 'success', '1996-03-08', 'Chelsea McClure', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(13, 10, 14, 'b9gewkHQtf', 8325.00, 'success', '1975-08-08', 'Freida Conroy', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(14, 2, 8, 'bL97yVeXdX', 4795.00, 'pending', '2007-01-26', 'Jordy Little DVM', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(15, 10, 2, '6lTiwox80y', 12988.00, 'success', '2012-11-12', 'Princess Daniel', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(16, 11, 1, 'wHi4sMs4S4', 11323.00, 'pending', '1986-12-15', 'Verdie Hudson', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(17, 6, 4, 'vJS0hSy3wa', 15162.00, 'failed', '2015-11-06', 'Jayden Olson', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(18, 10, 9, 'jODq2373pM', 4168.00, 'failed', '2011-12-19', 'Dr. Anissa O\'Hara', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(19, 12, 7, 'EccPzch4QQ', 9683.00, 'cancelled', '2002-03-18', 'Patience Douglas', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(20, 7, 9, 'gzuz1d0kxB', 5817.00, 'pending', '2008-04-23', 'Dr. Emily Hudson', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(21, 1, 123, 'NLJ7RT61SV', 1.00, 'success', '2019-12-19', 'Lawrence Bii', '2024-06-16 13:23:37', '2024-06-16 13:23:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Lawrence Bii', 'biikipkemoialex@gmail.com', '254114340314', 'Nairobi', 'super-admin', '2024-06-13 14:14:39', '$2y$12$sZhRzl4laTkdbqHQ7nICHeuYfTwp2d3RIaIBb0lytOu17dz5fN1xS', 'JSfyRRrzIo', '2024-06-13 14:14:39', '2024-06-13 17:54:45'),
(2, 'Prof. Randal Parisian IV', 'theresa06@example.org', '+1-463-387-9522', '37997 Dare Brook\nOlsonland, ID 34619-6737', 'admin', '2024-06-13 14:14:39', '$2y$12$sZhRzl4laTkdbqHQ7nICHeuYfTwp2d3RIaIBb0lytOu17dz5fN1xS', 'sXsCaHXbtW', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(3, 'Laurence Brown', 'athena05@example.com', '1-689-279-8412', '2915 Fausto Glens\nSelinaborough, OH 15425-8319', 'user', '2024-06-13 14:14:39', '$2y$12$sZhRzl4laTkdbqHQ7nICHeuYfTwp2d3RIaIBb0lytOu17dz5fN1xS', 'H2xz45gbdQ', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(4, 'Prof. King Johns Sr.', 'camilla05@example.net', '+1.561.482.0768', '9758 Eldred Dale Suite 291\nWest Rebeca, UT 32689-5925', 'user', '2024-06-13 14:14:39', '$2y$12$sZhRzl4laTkdbqHQ7nICHeuYfTwp2d3RIaIBb0lytOu17dz5fN1xS', 'tzW3l60qo1', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(5, 'Mr. Elian O\'Conner', 'katheryn.runolfsson@example.org', '+1-786-343-1934', '2233 Nader Forks\nWest Rowenaburgh, MS 01901', 'user', '2024-06-13 14:14:39', '$2y$12$sZhRzl4laTkdbqHQ7nICHeuYfTwp2d3RIaIBb0lytOu17dz5fN1xS', 'GIh58ldYvg', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(6, 'Ms. Rachelle Russel', 'dandre.bednar@example.net', '1-631-486-2139', '2470 Hagenes Spring\nMcKenziemouth, IL 08986-0165', 'admin', '2024-06-13 14:14:39', '$2y$12$sZhRzl4laTkdbqHQ7nICHeuYfTwp2d3RIaIBb0lytOu17dz5fN1xS', 'Z01wudgam9', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(7, 'Mrs. Ellie Reichert', 'mcglynn.walter@example.org', '(928) 739-2374', '63194 Ransom Heights\nNew Carloville, MD 99391', 'admin', '2024-06-13 14:14:39', '$2y$12$sZhRzl4laTkdbqHQ7nICHeuYfTwp2d3RIaIBb0lytOu17dz5fN1xS', 'dtFLmZoNsk', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(8, 'Oleta Sipes', 'aconn@example.org', '+1-870-444-5548', '38245 Bartoletti Parks\nPort Lillyside, RI 11015', 'admin', '2024-06-13 14:14:39', '$2y$12$sZhRzl4laTkdbqHQ7nICHeuYfTwp2d3RIaIBb0lytOu17dz5fN1xS', 'Wnc8bmbO7k', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(9, 'Dr. Gust Torphy V', 'mckenzie.veda@example.org', '+15742075093', '39085 Wallace Neck Suite 494\nRicefort, HI 77967', 'admin', '2024-06-13 14:14:39', '$2y$12$sZhRzl4laTkdbqHQ7nICHeuYfTwp2d3RIaIBb0lytOu17dz5fN1xS', 'YFiXwnD1CK', '2024-06-13 14:14:39', '2024-06-13 14:14:39'),
(10, 'Vallie Morar', 'kutch.paige@example.com', '+1-279-702-5116', '989 Abshire Summit\nEuniceport, IL 36838', 'user', '2024-06-13 14:14:39', '$2y$12$sZhRzl4laTkdbqHQ7nICHeuYfTwp2d3RIaIBb0lytOu17dz5fN1xS', 'Fm2G8O85Sr', '2024-06-13 14:14:39', '2024-06-13 14:14:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

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
-- Indexes for table `mpesa_transactions`
--
ALTER TABLE `mpesa_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mpesa_transactions`
--
ALTER TABLE `mpesa_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
