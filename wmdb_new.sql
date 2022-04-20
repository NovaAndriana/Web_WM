-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2022 at 02:45 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wmdb_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(4) NOT NULL,
  `id_shop` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `about_language`
--

CREATE TABLE `about_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_about` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_lang` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `longtitude` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `default` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL,
  `offline` int(11) DEFAULT NULL,
  `is_requested` int(11) DEFAULT NULL,
  `is_confirmed` int(11) DEFAULT 1,
  `push_token` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT 1,
  `id_shop` int(10) UNSIGNED DEFAULT NULL,
  `id_role` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `surname`, `image_url`, `email`, `phone`, `password`, `active`, `offline`, `is_requested`, `is_confirmed`, `push_token`, `gender`, `id_shop`, `id_role`, `created_at`, `updated_at`) VALUES
(1, 'Admin55', 'Admin', NULL, 'admin@gmail.com', NULL, '$2y$10$q86eiGfSYgOlRayfheKhOOsnWBk8a8WJAVLBh16Qu5LvTUgX367wO', 1, NULL, NULL, 1, NULL, 1, NULL, 1, '2022-04-19 22:51:05', '2022-04-19 22:51:05'),
(2, 'Nova Andriana', 'nova', '1650442796_FB_IMG_1560790704495.jpg', 'novaandriana.kartawijaya@gmail.com', '081317005340', '$2y$10$LepZVEG0THpAuEXkPVfmOObsjOHwIUq0RebVLA8CnH08vEyEhwdTe', 0, NULL, 1, 0, NULL, 1, NULL, 2, '2022-04-20 01:20:00', '2022-04-20 01:20:00'),
(3, 'Nova Andriana', 'nova', '1650442796_FB_IMG_1560790704495.jpg', 'novaandriana.kartawijaya@gmail.com', '081317005340', '$2y$10$q86eiGfSYgOlRayfheKhOOsnWBk8a8WJAVLBh16Qu5LvTUgX367wO', 1, NULL, NULL, 1, NULL, 1, NULL, 1, '2022-04-20 01:21:06', '2022-04-20 01:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `admin_balances`
--

CREATE TABLE `admin_balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `balance` double(22,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_balances`
--

INSERT INTO `admin_balances` (`id`, `admin_id`, `balance`, `currency`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 0.00, NULL, 1, '2022-04-20 01:20:01', '2022-04-20 01:20:01'),
(2, 3, 0.00, NULL, 1, '2022-04-20 01:21:06', '2022-04-20 01:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_shop` int(11) NOT NULL DEFAULT 0,
  `id_own` int(11) NOT NULL DEFAULT 0,
  `message` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indicator_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners_language`
--

CREATE TABLE `banners_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_banner` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners_products`
--

CREATE TABLE `banners_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_banner` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL,
  `id_brand_category` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand_categories`
--

CREATE TABLE `brand_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_categories`
--

INSERT INTO `brand_categories` (`id`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-04-20 02:10:42', '2022-04-20 02:10:42');

-- --------------------------------------------------------

--
-- Table structure for table `brand_categories_language`
--

CREATE TABLE `brand_categories_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_brand_category` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_categories_language`
--

INSERT INTO `brand_categories_language` (`id`, `name`, `id_brand_category`, `id_lang`) VALUES
(1, 'Wardah', 1, 1),
(2, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` int(11) NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories_language`
--

CREATE TABLE `categories_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_category` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_type` int(11) NOT NULL,
  `gender` int(11) DEFAULT 1,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_token` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` tinyint(4) NOT NULL DEFAULT 1,
  `active` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `surname`, `phone`, `email`, `image_url`, `auth_type`, `gender`, `password`, `social_id`, `token`, `push_token`, `device_type`, `active`, `created_at`, `updated_at`) VALUES
(13, 'Frank', 'Antonio', '+998993148000', 'client@gmail.com', NULL, 1, 1, '$2y$10$IK7zmKm7XITEqhH3qg9NaulByBHnnzdY3UQdx/YeUuenBnmhNii6S', NULL, 'werwerwerw', NULL, 1, 1, '2022-04-19 22:51:44', '2022-04-19 22:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `client_balances`
--

CREATE TABLE `client_balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `balance` double(22,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `point` decimal(9,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_cards`
--

CREATE TABLE `client_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `card_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_shops`
--

CREATE TABLE `client_shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` tinyint(4) NOT NULL,
  `discount` double NOT NULL,
  `usage_time` int(11) NOT NULL DEFAULT 0,
  `valid_until` datetime NOT NULL,
  `active` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_details`
--

CREATE TABLE `coupon_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `used_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_language`
--

CREATE TABLE `coupon_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_coupon` int(10) UNSIGNED DEFAULT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_products`
--

CREATE TABLE `coupon_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_coupon` int(10) UNSIGNED DEFAULT NULL,
  `id_product` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `rate` decimal(9,2) NOT NULL DEFAULT 1.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency_language`
--

CREATE TABLE `currency_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_currency` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_orders`
--

CREATE TABLE `delivery_boy_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_payouts`
--

CREATE TABLE `delivery_boy_payouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `value` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_payout_histories`
--

CREATE TABLE `delivery_payout_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(9,2) DEFAULT NULL,
  `status` enum('success','cancel','processing') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_routes`
--

CREATE TABLE `delivery_routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `origin_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` double NOT NULL,
  `duration` double NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'driving-car',
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`properties`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_transports`
--

CREATE TABLE `delivery_transports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_transport_languages`
--

CREATE TABLE `delivery_transport_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_transport_id` bigint(20) UNSIGNED NOT NULL,
  `lang_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_types`
--

CREATE TABLE `delivery_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_types`
--

INSERT INTO `delivery_types` (`id`, `status`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_type_languages`
--

CREATE TABLE `delivery_type_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_type_id` bigint(20) UNSIGNED NOT NULL,
  `lang_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_type_languages`
--

INSERT INTO `delivery_type_languages` (`id`, `name`, `description`, `delivery_type_id`, `lang_id`) VALUES
(1, 'Free', 'Free type description', 1, 2),
(2, 'Free', 'Free type description', 1, 1),
(3, 'Standard', 'Standard type description', 2, 2),
(4, 'Standard', 'Standard type description', 2, 1),
(5, 'Express', 'Express type description', 3, 2),
(6, 'Express', 'Express type description', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dialogs`
--

CREATE TABLE `dialogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_id` int(11) NOT NULL DEFAULT 0,
  `second_id` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_count_down` tinyint(4) NOT NULL DEFAULT 0,
  `discount_type` tinyint(4) NOT NULL DEFAULT 0,
  `discount_amount` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_products`
--

CREATE TABLE `discount_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED DEFAULT 0,
  `id_discount` int(10) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(4) NOT NULL,
  `id_shop` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_language`
--

CREATE TABLE `faq_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_faq` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_lang` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `question` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_orders`
--

CREATE TABLE `favorite_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `delivery_day` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1
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
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `default` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `name`, `short_name`, `image_url`, `active`, `default`) VALUES
(1, 'English', 'en', 'unnamed.png', 1, 1),
(2, 'Russian', 'ru', 'logo.jpg', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `live_tracking`
--

CREATE TABLE `live_tracking` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `coordinates` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_type` int(11) NOT NULL DEFAULT 0,
  `dialog_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `text` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_08_13_000000_create_clients_table', 1),
(7, '2021_08_13_000001_create_shops_table', 1),
(8, '2021_08_13_000002_create_roles_table', 1),
(9, '2021_08_13_000010_create_order_status_table', 1),
(10, '2021_08_13_000011_create_payment_status_table', 1),
(11, '2021_08_13_000012_create_addresses_table', 1),
(12, '2021_08_13_000013_create_admins_table', 1),
(13, '2021_08_13_000014_create_payment_method_table', 1),
(14, '2021_08_13_112423_create_brand_categories_table', 1),
(15, '2021_08_14_0000020_create_orders_table', 1),
(16, '2021_08_14_000003_create_language_table', 1),
(17, '2021_08_14_000005_create_units_table', 1),
(18, '2021_08_14_000006_create_brands_table', 1),
(19, '2021_08_14_000007_create_categories_table', 1),
(20, '2021_08_14_000008_create_products_table', 1),
(21, '2021_08_14_000009_create_product_extra_input_types_table', 1),
(22, '2021_08_14_000021_create_order_comments_table', 1),
(23, '2021_08_14_053900_create_banners_table', 1),
(24, '2021_08_14_053911_create_banners_language_table', 1),
(25, '2021_08_14_053926_create_banners_products_table', 1),
(26, '2021_08_14_053959_create_categories_language_table', 1),
(27, '2021_08_14_054021_create_coupon_table', 1),
(28, '2021_08_14_054032_create_coupon_language_table', 1),
(29, '2021_08_14_054044_create_coupon_products_table', 1),
(30, '2021_08_14_054054_create_currency_table', 1),
(31, '2021_08_14_054108_create_currency_language_table', 1),
(32, '2021_08_14_054119_create_discount_table', 1),
(33, '2021_08_14_054130_create_discount_products_table', 1),
(34, '2021_08_14_054155_create_mobile_params_table', 1),
(35, '2021_08_14_054206_create_mobile_params_lang_table', 1),
(36, '2021_08_14_054218_create_notifications_table', 1),
(37, '2021_08_14_054242_create_order_details_table', 1),
(38, '2021_08_14_054334_create_permissions_table', 1),
(39, '2021_08_14_054345_create_product_extra_groups_table', 1),
(40, '2021_08_14_054403_create_product_extra_groups_language_table', 1),
(41, '2021_08_14_054439_create_product_extras_table', 1),
(42, '2021_08_14_054453_create_product_extras_language_table', 1),
(43, '2021_08_14_054517_create_products_comments_table', 1),
(44, '2021_08_14_054541_create_products_images_table', 1),
(45, '2021_08_14_054552_create_products_language_table', 1),
(46, '2021_08_14_054612_create_roles_permissions_table', 1),
(47, '2021_08_14_054623_create_shop_categories_table', 1),
(48, '2021_08_14_054635_create_shop_categories_language_table', 1),
(49, '2021_08_14_054658_create_shops_curriencies_table', 1),
(50, '2021_08_14_054710_create_shops_language_table', 1),
(51, '2021_08_14_054721_create_shops_rating_table', 1),
(52, '2021_08_14_054731_create_time_units_table', 1),
(53, '2021_08_14_054756_create_units_language_table', 1),
(54, '2021_08_16_112447_create_brand_categories_language_table', 1),
(55, '2021_08_16_135121_create_payments_table', 1),
(56, '2021_08_16_135217_create_payment_language_table', 1),
(57, '2021_08_16_135235_create_shop_payment_table', 1),
(58, '2021_08_19_113200_create_products_characterics_table', 1),
(59, '2021_08_19_113217_create_products_characterics_language_table', 1),
(60, '2021_08_22_194710_create_client_cards_table', 1),
(61, '2021_08_22_195327_create_transactions_table', 1),
(62, '2021_08_25_125410_create_faq_table', 1),
(63, '2021_08_25_125427_create_faq_language_table', 1),
(64, '2021_08_26_053211_create_about_table', 1),
(65, '2021_08_26_053241_create_about_language_table', 1),
(66, '2021_08_26_053305_create_privacy_table', 1),
(67, '2021_08_26_053314_create_privacy_language_table', 1),
(68, '2021_08_26_053330_create_terms_table', 1),
(69, '2021_08_26_053339_create_terms_language_table', 1),
(70, '2021_08_26_112200_create_admin_notifications_table', 1),
(71, '2021_08_27_121821_create_dialogs_table', 1),
(72, '2021_08_27_121842_create_messages_table', 1),
(73, '2021_08_28_135212_create_order_points_table', 1),
(74, '2021_08_28_135235_create_order_points_history_table', 1),
(75, '2021_08_28_135252_create_order_points_rule_table', 1),
(76, '2021_08_28_135317_create_order_points_rule_language_table', 1),
(77, '2021_10_01_121553_create_order_detail_extra_table', 1),
(78, '2021_10_25_105243_phone_prefix_table', 1),
(79, '2021_10_25_152201_create_delivery_routes_table', 1),
(80, '2021_10_26_134225_create_live_tracking_table', 1),
(81, '2021_10_28_192740_create_admin_balances_table', 1),
(82, '2021_10_28_192815_create_client_balances_table', 1),
(83, '2021_10_28_192954_create_delivery_boy_orders_table', 1),
(84, '2021_11_03_201717_create_favorite_orders_table', 1),
(85, '2021_11_04_195022_create_delivery_types_table', 1),
(86, '2021_11_04_201012_create_delivery_type_languages_table', 1),
(87, '2021_11_04_213412_create_shop_deliveries_table', 1),
(88, '2021_11_07_180816_create_coupon_details_table', 1),
(89, '2021_12_03_122728_add_amount_limit_to_shop', 1),
(90, '2021_12_13_175828_create_taxes_table', 1),
(91, '2021_12_13_183313_create_tax_categories_table', 1),
(92, '2021_12_15_191124_create_delivery_transports_table', 1),
(93, '2021_12_15_191210_create_delivery_transport_languages_table', 1),
(94, '2021_12_16_113337_create_shop_transports_table', 1),
(95, '2021_12_16_185132_create_shipping_boxes_table', 1),
(96, '2021_12_16_185641_create_shipping_box_languages_table', 1),
(97, '2021_12_16_195600_create_shop_shipping_boxes_table', 1),
(98, '2021_12_21_065841_create_payment_attributes_table', 1),
(99, '2021_12_21_065858_create_payment_attribute_languages_table', 1),
(100, '2021_12_21_141222_remove_weight_and_dicount_price_from_posts_table', 1),
(101, '2021_12_21_181134_remove_tax_from_shops_table', 1),
(102, '2021_12_23_184900_add_tag_to_payments', 1),
(103, '2021_12_23_192039_drop_orders_payment_method_and_status', 1),
(104, '2021_12_25_161850_create_order_shipping_details_table', 1),
(105, '2021_12_30_182119_create_client_shops_table', 1),
(106, '2022_01_04_191720_add_uuid_to_client_shops', 1),
(107, '2022_01_05_182722_add_new_columns_to_shop_payment', 1),
(108, '2022_01_06_201431_add_new_columns_for_shop_deliveries', 1),
(109, '2022_01_12_145039_add_type_to_payments', 1),
(110, '2022_01_12_145925_add_key_title_to_payments', 1),
(111, '2022_01_12_174940_add_commission_to_orders', 1),
(112, '2022_01_16_190632_add_commission_price_to_order_details', 1),
(113, '2022_01_21_191318_create_tickets_table', 1),
(114, '2022_01_22_135711_create_socials_table', 1),
(115, '2022_01_22_140215_create_shop_socials_table', 1),
(116, '2022_01_22_163503_add_coupon_amount_to_orders', 1),
(117, '2022_01_24_201400_create_jobs_table', 1),
(118, '2022_01_26_185206_add_id_extras_group_to_order_details_extras', 1),
(119, '2022_01_28_155458_create_points_table', 1),
(120, '2022_01_28_160118_create_point_languages_table', 1),
(121, '2022_01_28_161656_create_point_rates_table', 1),
(122, '2022_01_29_165828_add_point_to_client_balances', 1),
(123, '2022_01_31_185308_add_default_and_rate_to_currency', 1),
(124, '2022_02_01_200216_add_currency_and_rate_to_orders', 1),
(125, '2022_02_01_200801_create_delivery_boy_payouts_table', 1),
(126, '2022_02_02_163112_create_delivery_payout_histories_table', 1),
(127, '2022_02_09_182950_add_star_to_order_comments', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_params`
--

CREATE TABLE `mobile_params` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_params`
--

INSERT INTO `mobile_params` (`id`, `name`, `default`) VALUES
(1, 'About', 'About'),
(2, 'check out our website ', 'check out our website '),
(3, 'Share friends', 'Share friends'),
(4, 'Search products', 'Search products'),
(5, 'No products', 'No products'),
(6, 'Brands', 'Brands'),
(7, 'Search brands', 'Search brands'),
(8, 'Cart', 'Cart'),
(9, 'My order', 'My order'),
(10, 'No products in cart', 'No products in cart'),
(11, 'Total amount', 'Total amount'),
(12, 'Checkout', 'Checkout'),
(13, 'Categories', 'Categories'),
(14, 'Manager', 'Manager'),
(15, 'Driver', 'Driver'),
(16, 'Online', 'Online'),
(17, 'Type  something', 'Type  something'),
(18, 'Completed your order', 'Completed your order'),
(19, 'Shipping', 'Shipping'),
(20, 'Payment', 'Payment'),
(21, 'Verify', 'Verify'),
(22, 'Delivery type', 'Delivery type'),
(23, 'Delivery', 'Delivery'),
(24, 'Pickup', 'Pickup'),
(25, 'Default address', 'Default address'),
(26, 'Full name', 'Full name'),
(27, 'Phone number', 'Phone number'),
(28, 'Payment method', 'Payment method'),
(29, 'Add new card', 'Add new card'),
(30, 'Delivery date', 'Delivery date'),
(31, 'Change', 'Change'),
(32, 'Comment', 'Comment'),
(33, 'Your order', 'Your order'),
(34, 'Total product price', 'Total product price'),
(35, 'Discount', 'Discount'),
(36, 'Continue', 'Continue'),
(37, 'Cash on delivery', 'Cash on delivery'),
(38, 'Confirm & Pay', 'Confirm & Pay'),
(39, 'Currency', 'Currency'),
(40, 'Sign Up', 'Sign Up'),
(41, 'Forgot password', 'Forgot password'),
(42, 'Submit', 'Submit'),
(43, 'Back to login', 'Back to login'),
(44, 'Next', 'Next'),
(45, 'Select language', 'Select language'),
(46, 'Search language', 'Search language'),
(47, 'Language', 'Language'),
(48, 'Liked products', 'Liked products'),
(49, 'No liked products', 'No liked products'),
(50, 'Address list', 'Address list'),
(51, 'Add address', 'Add address'),
(52, 'Saved addresses are not available.', 'Saved addresses are not available.'),
(53, 'Enter location', 'Enter location'),
(54, 'Internet connection is not available.', 'Internet connection is not available.'),
(55, 'Home', 'Home'),
(56, 'Category', 'Category'),
(57, 'Saved', 'Saved'),
(58, 'Clear all', 'Clear all'),
(59, 'Notifications', 'Notifications'),
(60, 'No notification found', 'No notification found'),
(61, 'My orders', 'My orders'),
(62, 'Completed', 'Completed'),
(63, 'Open', 'Open'),
(64, 'Cancelled', 'Cancelled'),
(65, 'No completed orders', 'No completed orders'),
(66, 'No uncompleted orders', 'No uncompleted orders'),
(67, 'No canceled orders', 'No canceled orders'),
(68, 'Details', 'Details'),
(69, 'Sale', 'Sale'),
(70, 'off', 'off'),
(71, 'reviews', 'reviews'),
(72, 'Availability', 'Availability'),
(73, 'In stock', 'In stock'),
(74, 'Description', 'Description'),
(75, 'Add comment', 'Add comment'),
(76, 'Related products', 'Related products'),
(77, 'product price', 'product price'),
(78, 'Buy now', 'Buy now'),
(79, 'Profile settings', 'Profile settings'),
(80, 'Enter data', 'Enter data'),
(81, 'Upload new image', 'Upload new image'),
(82, 'Name', 'Name'),
(83, 'Surname', 'Surname'),
(84, 'Email', 'Email'),
(85, 'Password', 'Password'),
(86, 'Gender', 'Gender'),
(87, 'Male', 'Male'),
(88, 'Female', 'Female'),
(89, 'Save', 'Save'),
(90, 'Balance', 'Balance'),
(91, 'ball', 'ball'),
(92, 'Order history', 'Order history'),
(93, 'Setting', 'Setting'),
(94, 'Q&A', 'Q&A'),
(95, 'Exit', 'Exit'),
(96, 'FAQ', 'FAQ'),
(97, 'Savings', 'Savings'),
(98, 'Discounts', 'Discounts'),
(99, 'Coupons', 'Coupons'),
(100, 'No discount products', 'No discount products'),
(101, 'No coupon products', 'No coupon products'),
(102, 'UI Theme', 'UI Theme'),
(103, 'Dark', 'Dark'),
(104, 'Light', 'Light'),
(105, 'Saved location', 'Saved location'),
(106, 'Sign In', 'Sign In'),
(107, 'Login with', 'Login with'),
(108, 'Sign Up with', 'Sign Up with'),
(109, 'Fast, reliable and saves time', 'Fast, reliable and saves time'),
(110, 'The World’s first platform', 'The World’s first platform'),
(111, 'Live, eat and shopping', 'Live, eat and shopping'),
(112, 'Skip', 'Skip'),
(113, 'Login', 'Login'),
(114, 'or', 'or'),
(115, 'January', 'January'),
(116, 'February', 'February'),
(117, 'March', 'March'),
(118, 'April', 'April'),
(119, 'May', 'May'),
(120, 'June', 'June'),
(121, 'July', 'July'),
(122, 'August', 'August'),
(123, 'September', 'September'),
(124, 'October', 'October'),
(125, 'November', 'November'),
(126, 'December', 'December'),
(127, 'Market info', 'Market info'),
(128, 'Delivery times', 'Delivery times'),
(129, 'Address', 'Address'),
(130, 'Working hours', 'Working hours'),
(131, 'Delivery fee', 'Delivery fee'),
(132, 'Info', 'Info'),
(133, 'Today', 'Today'),
(134, 'Tomorrow', 'Tomorrow'),
(135, 'Search', 'Search'),
(136, 'Delivery address', 'Delivery address'),
(137, 'Search stores', 'Search stores'),
(138, 'Verify phone', 'Verify phone'),
(139, 'Code is sent to ', 'Code is sent to '),
(140, 'Didn’t receive code?', 'Didn’t receive code?'),
(141, 'Request again', 'Request again'),
(142, 'Verify and Create account', 'Verify and Create account'),
(143, 'Please add title', 'Please add title'),
(144, 'Card number', 'Card number'),
(145, 'Expiry date', 'Expiry date'),
(146, 'CVC', 'CVC'),
(147, 'Add card', 'Add card'),
(148, 'View all', 'View all'),
(149, 'Less', 'Less'),
(150, 'Cancel', 'Cancel'),
(151, 'Order now', 'Order now'),
(152, 'Cart summary', 'Cart summary'),
(153, 'Edit', 'Edit'),
(154, 'Add review', 'Add review'),
(155, 'Save review', 'Save review'),
(156, 'Get Discount', 'Get Discount'),
(157, 'Error', 'Error'),
(158, 'Close', 'Close'),
(159, 'Sort by price', 'Sort by price'),
(160, 'Sort by low price', 'Sort by low price'),
(161, 'Sort by high price', 'Sort by high price'),
(162, 'Confirm filter', 'Confirm filter'),
(163, 'Delivery time', 'Delivery time'),
(164, 'Location title', 'Location title'),
(165, 'Enter location title', 'Enter location title'),
(166, 'Save location', 'Save location'),
(167, 'Delete', 'Delete'),
(168, 'Delivery boy', 'Delivery boy'),
(169, 'Call', 'Call'),
(170, 'Date purchased', 'Date purchased'),
(171, 'Order accepted', 'Order accepted'),
(172, 'Order processing', 'Order processing'),
(173, 'Out for delivery', 'Out for delivery'),
(174, 'Delivered to customer', 'Delivered to customer'),
(175, 'Products', 'Products'),
(176, 'items', 'items'),
(177, 'Cancel order', 'Cancel order'),
(178, 'ID', 'ID'),
(179, 'Shop', 'Shop'),
(180, 'Order', 'Order'),
(181, 'Date', 'Date'),
(182, 'Order amount', 'Order amount'),
(183, 'Current password', 'Current password'),
(184, 'New password', 'New password'),
(185, 'Confirm password', 'Confirm password'),
(186, 'Password length should be at least 6 characters', 'Password length should be at least 6 characters'),
(187, 'Current password is wrong', 'Current password is wrong'),
(188, 'New password and New password confirm mismatch', 'New password and New password confirm mismatch'),
(189, 'Update password', 'Update password'),
(190, 'All', 'All'),
(191, 'Saved shop', 'Saved shop'),
(192, 'All shops', 'All shops'),
(193, 'View on map', 'View on map'),
(194, 'No shops', 'No shops'),
(195, 'Success', 'Success'),
(196, 'Successfully updated', 'Successfully updated'),
(197, 'New', 'New'),
(198, 'Recommended', 'Recommended'),
(199, 'Popular', 'Popular'),
(200, 'No client found in system', 'No client found in system'),
(201, 'Welcome', 'Welcome'),
(202, 'Error occured in login', 'Error occured in login'),
(203, 'Successfully registered', 'Successfully registered'),
(204, 'You are already registered', 'You are already registered'),
(205, 'Error occured in registration', 'Error occured in registration'),
(206, 'Password and confirm password mismatch', 'Password and confirm password mismatch'),
(207, 'Name length should be at least 4 characters', 'Name length should be at least 4 characters'),
(208, 'Surname length should be at least 4 characters', 'Surname length should be at least 4 characters'),
(209, 'Phone length should be at least 4 characters', 'Phone length should be at least 4 characters'),
(210, 'Phone number is not valid', 'Phone number is not valid'),
(211, 'Sms code is invalid', 'Sms code is invalid'),
(212, 'Email or password wrong', 'Email or password wrong'),
(213, 'Some products are not enough in stock', 'Some products are not enough in stock'),
(214, 'Sign in as Guest', 'Sign in as Guest'),
(215, 'Languages', 'Languages'),
(216, 'Currencies', 'Currencies'),
(217, 'Terms & Conditions', 'Terms & Conditions'),
(218, 'Privacy', 'Privacy'),
(219, 'Social media', 'Social media');

-- --------------------------------------------------------

--
-- Table structure for table `mobile_params_lang`
--

CREATE TABLE `mobile_params_lang` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_param` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_image` tinyint(4) NOT NULL DEFAULT 0,
  `image_url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `is_sent` tinyint(4) NOT NULL,
  `send_time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `tax` double(22,2) NOT NULL,
  `delivery_fee` double(22,2) NOT NULL,
  `total_sum` double(22,2) NOT NULL,
  `total_discount` double(22,2) NOT NULL,
  `delivery_mark` int(11) DEFAULT NULL,
  `delivery_date` date NOT NULL,
  `processing_date` datetime NOT NULL,
  `ready_date` datetime NOT NULL,
  `delivered_date` datetime NOT NULL,
  `cancel_date` datetime NOT NULL,
  `delivery_time_id` int(11) NOT NULL DEFAULT 0,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checklist` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_delivery_boy` int(10) UNSIGNED DEFAULT NULL,
  `order_status` int(10) UNSIGNED NOT NULL,
  `id_review` int(10) UNSIGNED DEFAULT NULL,
  `id_delivery_address` int(10) UNSIGNED DEFAULT NULL,
  `id_shop` int(10) UNSIGNED DEFAULT NULL,
  `id_shop_shipping` int(10) UNSIGNED DEFAULT NULL,
  `commission` double(22,2) NOT NULL DEFAULT 0.00,
  `coupon_amount` decimal(10,2) NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `currency_rate` decimal(9,2) NOT NULL DEFAULT 1.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_comments`
--

CREATE TABLE `order_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment_text` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_order` int(10) UNSIGNED NOT NULL,
  `star` decimal(3,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` double(22,2) NOT NULL DEFAULT 0.00,
  `price` double(22,2) NOT NULL,
  `coupon_amount` double(22,2) DEFAULT NULL,
  `is_replaced` tinyint(4) NOT NULL DEFAULT 0,
  `is_replacement_product` tinyint(4) NOT NULL DEFAULT 0,
  `id_order` int(10) UNSIGNED NOT NULL,
  `id_replace_product` int(10) UNSIGNED DEFAULT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_coupon` int(10) UNSIGNED DEFAULT NULL,
  `origin_price` double(22,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details_extras`
--

CREATE TABLE `order_details_extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_order_detail` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_extras` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` double(22,2) NOT NULL,
  `id_extras_group` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_points`
--

CREATE TABLE `order_points` (
  `id` int(10) UNSIGNED NOT NULL,
  `point` int(11) NOT NULL DEFAULT 0,
  `id_shop` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_points_history`
--

CREATE TABLE `order_points_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_order_points` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `point` int(11) NOT NULL DEFAULT 0,
  `id_client` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_points_rule`
--

CREATE TABLE `order_points_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_points_rule_language`
--

CREATE TABLE `order_points_rule_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_order_points_rule` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_shipping_details`
--

CREATE TABLE `order_shipping_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_type_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `delivery_transport_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `shipping_box_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Processing', 1, '2022-04-19 22:51:43', '2022-04-19 22:51:43'),
(2, 'Ready', 1, '2022-04-19 22:51:43', '2022-04-19 22:51:43'),
(3, 'On a Way', 1, '2022-04-19 22:51:44', '2022-04-19 22:51:44'),
(4, 'Delivered', 1, '2022-04-19 22:51:44', '2022-04-19 22:51:44'),
(5, 'Canceled', 1, '2022-04-19 22:51:44', '2022-04-19 22:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 2,
  `active` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tag` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `type`, `active`, `created_at`, `updated_at`, `tag`, `method`) VALUES
(1, 0, 1, '2022-04-19 22:51:46', '2022-04-19 22:51:46', 'cash_money', '1'),
(2, 0, 1, '2022-04-19 22:51:46', '2022-04-19 22:51:46', 'terminal_money', '2'),
(3, 2, 1, '2022-04-19 22:51:46', '2022-04-19 22:51:46', 'stripe', '3'),
(4, 2, 1, '2022-04-19 22:51:46', '2022-04-19 22:51:46', 'paystack', '4'),
(5, 2, 1, '2022-04-19 22:51:46', '2022-04-19 22:51:46', 'flutterwave', '4'),
(6, 2, 1, '2022-04-19 22:51:46', '2022-04-19 22:51:46', 'razorpay', '4'),
(8, 2, 1, '2022-04-19 22:51:46', '2022-04-19 22:51:46', 'paypal', '4'),
(99, 0, 1, '2022-04-19 22:51:46', '2022-04-19 22:51:46', 'balance', '1');

-- --------------------------------------------------------

--
-- Table structure for table `payment_attributes`
--

CREATE TABLE `payment_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(4) DEFAULT NULL,
  `mask` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_attributes`
--

INSERT INTO `payment_attributes` (`id`, `payment_id`, `tag`, `position`, `mask`, `validation`, `active`, `created_at`, `updated_at`) VALUES
(1, 3, 'card_number', 1, NULL, NULL, 1, '2022-04-19 22:51:47', '2022-04-19 22:51:47'),
(2, 3, 'card_expired', 2, NULL, NULL, 1, '2022-04-19 22:51:47', '2022-04-19 22:51:47'),
(3, 3, 'card_cvv', 3, NULL, NULL, 1, '2022-04-19 22:51:47', '2022-04-19 22:51:47'),
(4, 3, 'card_holder', 4, NULL, NULL, 1, '2022-04-19 22:51:47', '2022-04-19 22:51:47'),
(5, 4, 'email', 1, NULL, NULL, 1, '2022-04-19 22:51:47', '2022-04-19 22:51:47'),
(6, 5, 'email', 1, NULL, NULL, 1, '2022-04-19 22:51:47', '2022-04-19 22:51:47'),
(7, 6, 'email', 1, NULL, NULL, 1, '2022-04-19 22:51:47', '2022-04-19 22:51:47'),
(10, 8, 'email', 1, NULL, NULL, 1, '2022-04-19 22:51:47', '2022-04-19 22:51:47');

-- --------------------------------------------------------

--
-- Table structure for table `payment_attribute_languages`
--

CREATE TABLE `payment_attribute_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_attribute_id` bigint(20) UNSIGNED NOT NULL,
  `lang_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_attribute_languages`
--

INSERT INTO `payment_attribute_languages` (`id`, `name`, `payment_attribute_id`, `lang_id`) VALUES
(1, 'Card number', 1, 1),
(2, 'Expire Date', 2, 1),
(3, 'CVV', 3, 1),
(4, 'Card holder name', 4, 1),
(5, 'Email address', 5, 1),
(6, 'Email address', 6, 1),
(7, 'Email address', 7, 1),
(10, 'Email address', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_language`
--

CREATE TABLE `payment_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_lang` int(10) UNSIGNED DEFAULT NULL,
  `id_payment` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_language`
--

INSERT INTO `payment_language` (`id`, `name`, `key_title`, `secret_title`, `id_lang`, `id_payment`) VALUES
(1, 'Cash', NULL, NULL, 1, 1),
(2, 'Terminal', NULL, NULL, 1, 2),
(3, 'Stripe', 'Public Key', 'Secret Key', 1, 3),
(4, 'Paystack', 'Public Key', 'Secret Key', 1, 4),
(5, 'Flutterwave', 'Public Key', 'Secret Key', 1, 5),
(6, 'Balance', NULL, NULL, 1, 99),
(7, 'Razorpay', 'Key ID', 'Secret ID', 1, 6),
(8, 'PayPal', 'Client ID', 'Secret', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`id`, `name`, `active`, `created_at`, `updated_at`) VALUES
(1, 'cash', 1, '2022-04-19 22:51:45', '2022-04-19 22:51:45'),
(2, 'terminal', 1, '2022-04-19 22:51:45', '2022-04-19 22:51:45'),
(3, 'card', 1, '2022-04-19 22:51:45', '2022-04-19 22:51:45'),
(4, 'url', 1, '2022-04-19 22:51:45', '2022-04-19 22:51:45'),
(5, 'method', 1, '2022-04-19 22:51:45', '2022-04-19 22:51:45');

-- --------------------------------------------------------

--
-- Table structure for table `payment_status`
--

CREATE TABLE `payment_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_status`
--

INSERT INTO `payment_status` (`id`, `name`, `active`, `created_at`, `updated_at`) VALUES
(1, 'In process', 1, '2022-04-19 22:51:44', '2022-04-19 22:51:44'),
(2, 'Successful', 1, '2022-04-19 22:51:44', '2022-04-19 22:51:44'),
(3, 'Canceled', 1, '2022-04-19 22:51:44', '2022-04-19 22:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `url`, `type`) VALUES
(1, 'dashboard', '/', 1),
(2, 'shops', '/shops', 1),
(3, 'shops.add', '/shops/add', 1),
(4, 'shops.edit', '/shops/edit', 1),
(5, 'shops.delete', '/shops/delete', 1),
(6, 'shops-categories', '/shops-categories', 1),
(7, 'shops-categories.add', '/shops-categories/add', 1),
(8, 'shops-categories.edit', '/shops-categories/edit', 1),
(9, 'shops-categories.delete', '/shops-categories/delete', 1),
(10, 'shops-currencies', '/shops-currencies', 1),
(11, 'shops-currencies.add', '/shops-currencies/add', 1),
(12, 'shops-currencies.edit', '/shops-currencies/edit', 1),
(13, 'shops-currencies.delete', '/shops-currencies/delete', 1),
(14, 'brands', '/brands', 1),
(15, 'brands.add', '/brands/add', 1),
(16, 'brands.edit', '/brands/edit', 1),
(17, 'brands.delete', '/brands/delete', 1),
(18, 'brands-categories', '/brands-categories', 1),
(19, 'brands-categories.add', '/brands-categories/add', 1),
(20, 'brands-categories.edit', '/brands-categories/edit', 1),
(21, 'brands-categories.delete', '/brands-categories/delete', 1),
(22, 'categories', '/categories', 1),
(23, 'categories.add', '/categories/add', 1),
(24, 'categories.edit', '/categories/edit', 1),
(25, 'categories.delete', '/categories/delete', 1),
(26, 'products', '/products', 1),
(27, 'products.add', '/products/add', 1),
(28, 'products.edit', '/products/edit', 1),
(29, 'products.delete', '/products/delete', 1),
(30, 'product-comments', '/product-comments', 1),
(31, 'product-comments.add', '/product-comments/add', 1),
(32, 'product-comments.edit', '/product-comments/edit', 1),
(33, 'product-comments.delete', '/product-comments/delete', 1),
(34, 'discounts', '/discounts', 1),
(35, 'discounts.add', '/discounts/add', 1),
(36, 'discounts.edit', '/discounts/edit', 1),
(37, 'discounts.delete', '/discounts/delete', 1),
(38, 'orders', '/orders', 1),
(39, 'orders.add', '/orders/add', 1),
(40, 'orders.edit', '/orders/edit', 1),
(41, 'orders.delete', '/orders/delete', 1),
(42, 'order-statuses', '/order-statuses', 1),
(43, 'order-statuses.add', '/order-statuses/add', 1),
(44, 'order-statuses.edit', '/order-statuses/edit', 1),
(45, 'order-statuses.delete', '/order-statuses/delete', 1),
(46, 'order-comments', '/order-comments', 1),
(47, 'order-comments.add', '/order-comments/add', 1),
(48, 'order-comments.edit', '/order-comments/edit', 1),
(49, 'order-comments.delete', '/order-comments/delete', 1),
(50, 'payment-methods', '/payment-methods', 1),
(51, 'payment-methods.add', '/payment-methods/add', 1),
(52, 'payment-methods.edit', '/payment-methods/edit', 1),
(53, 'payment-methods.delete', '/payment-methods/delete', 1),
(54, 'payment-statuses', '/payment-statuses', 1),
(55, 'payment-statuses.add', '/payment-statuses/add', 1),
(56, 'payment-statuses.edit', '/payment-statuses/edit', 1),
(57, 'payment-statuses.delete', '/payment-statuses/delete', 1),
(58, 'payments', '/payments', 1),
(59, 'payments.add', '/payments/add', 1),
(60, 'payments.edit', '/payments/edit', 1),
(61, 'payments.delete', '/payments/delete', 1),
(62, 'coupons', '/coupons', 1),
(63, 'coupons.add', '/coupons/add', 1),
(64, 'coupons.edit', '/coupons/edit', 1),
(65, 'coupons.delete', '/coupons/delete', 1),
(66, 'banners', '/banners', 1),
(67, 'banners.add', '/banners/add', 1),
(68, 'banners.edit', '/banners/edit', 1),
(69, 'banners.delete', '/banners/delete', 1),
(70, 'notifications', '/notifications', 1),
(71, 'notifications.add', '/notifications/add', 1),
(72, 'notifications.edit', '/notifications/edit', 1),
(73, 'notifications.delete', '/notifications/delete', 1),
(74, 'languages', '/languages', 1),
(75, 'languages.add', '/languages/add', 1),
(76, 'languages.edit', '/languages/edit', 1),
(77, 'languages.delete', '/languages/delete', 1),
(78, 'languages.default', '/languages/default', 1),
(79, 'units', '/units', 1),
(80, 'units.add', '/units/add', 1),
(81, 'units.edit', '/units/edit', 1),
(82, 'units.delete', '/units/delete', 1),
(83, 'currencies', '/currencies', 1),
(84, 'currencies.add', '/currencies/add', 1),
(85, 'currencies.edit', '/currencies/edit', 1),
(86, 'currencies.delete', '/currencies/delete', 1),
(87, 'time-units', '/time-units', 1),
(88, 'time-units.add', '/time-units/add', 1),
(89, 'time-units.edit', '/time-units/edit', 1),
(90, 'time-units.delete', '/time-units/delete', 1),
(91, 'clients', '/clients', 1),
(92, 'clients.delete', '/clients/delete', 1),
(93, 'client-addresses', '/client-addresses', 1),
(94, 'client-addresses.delete', '/client-addresses/delete', 1),
(95, 'admins', '/admins', 1),
(96, 'admins.add', '/admins/add', 1),
(97, 'admins.edit', '/admins/edit', 1),
(98, 'admins.delete', '/admins/delete', 1),
(99, 'roles', '/roles', 1),
(100, 'permissions', '/permissions', 1),
(101, 'app-language', '/app-language', 1),
(102, 'medias', '/medias', 1),
(103, 'medias.delete', '/medias/delete', 1),
(104, 'terms', '/terms', 1),
(105, 'terms.edit', '/terms/edit', 1),
(106, 'faq', '/faq', 1),
(107, 'faq.edit', '/faq/edit', 1),
(108, 'about', '/about', 1),
(109, 'about.edit', '/about/edit', 1),
(110, 'privacy', '/privacy', 1),
(111, 'privacy.edit', '/privacy/edit', 1),
(112, 'app-language.edit', '/app-language/edit', 1),
(113, 'faq.add', '/faq/add', 1),
(114, 'faq.delete', '/faq/delete', 1),
(115, 'client-addresses.add', '/client-addresses/add', 1),
(116, 'chat', '/chat', 1),
(117, 'phone-prefix', '/phone-prefix', 1),
(118, 'phone-prefix.add', '/phone-prefix/add', 1),
(119, 'phone-prefix.edit', '/phone-prefix/edit', 1),
(120, 'phone-prefix.delete', '/phone-prefix/delete', 1),
(121, 'manager-requests', '/manager-requests', 1),
(122, 'manager-requests.edit', '/manager-requests/edit', 1),
(123, 'about.delete', '/about/delete', 1),
(128, 'shop-delivery-type', '/shop-delivery-type', 1),
(129, 'shop-delivery-type.add', '/shop-delivery-type/add', 1),
(130, 'shop-delivery-type.edit', '/shop-delivery-type/edit', 1),
(131, 'shop-delivery-type.delete', '/shop-delivery-type/delete', 1),
(132, 'shops.deliveries', '/shops/deliveries', 1),
(133, 'shops.deliveries.add', '/shops/deliveries/add', 1),
(134, 'shops.deliveries.edit', '/shops/deliveries/edit', 1),
(135, 'shops.deliveries.delete', '/shops/deliveries/delete', 1),
(136, 'delivery-boy', '/delivery-boy', 1),
(137, 'delivery-map', '/delivery-map', 1),
(138, 'delivery-orders-status', '/delivery-orders-status', 1),
(139, 'pos-system', '/pos-system', 1),
(140, 'taxes', '/taxes', 1),
(141, 'taxes.add', '/taxes/add', 1),
(142, 'taxes.edit', '/taxes/edit', 1),
(143, 'taxes.delete', '/taxes/delete', 1),
(144, 'shipping-transports', '/shipping-transports', 1),
(145, 'shipping-transports.add', '/shipping-transports/add', 1),
(146, 'shipping-transports.edit', '/shipping-transports/edit', 1),
(147, 'shipping-transports.delete', '/shipping-transports/delete', 1),
(148, 'shipping-box', '/shipping-box', 1),
(149, 'shipping-box.add', '/shipping-box/add', 1),
(150, 'shipping-box.edit', '/shipping-box/edit', 1),
(151, 'shipping-box.delete', '/shipping-box/delete', 1),
(152, 'category-taxes', '/category-taxes', 1),
(153, 'category-taxes.add', '/category-taxes/add', 1),
(154, 'category-taxes.delete', '/category-taxes/delete', 1),
(155, 'category-taxes.edit', '/category-taxes/edit', 1),
(156, 'clients.add', '/clients/add', 1),
(157, 'clients.edit', '/clients/edit', 1),
(158, 'import', '/import', 1),
(159, 'transactions', '/transactions', 1),
(160, 'export', '/export', 1),
(161, 'server', '/server', 1),
(162, 'update', '/update', 1);

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
-- Table structure for table `phone_prefix`
--

CREATE TABLE `phone_prefix` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prefix` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) DEFAULT NULL,
  `amount` decimal(9,2) NOT NULL DEFAULT 0.00,
  `range` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `point_languages`
--

CREATE TABLE `point_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `point_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `point_rates`
--

CREATE TABLE `point_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rate` decimal(9,2) NOT NULL,
  `amount` decimal(9,2) NOT NULL DEFAULT 1.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privacy`
--

CREATE TABLE `privacy` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(4) NOT NULL,
  `id_shop` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privacy_language`
--

CREATE TABLE `privacy_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_privacy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_lang` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `pack_quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `show_type` tinyint(4) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_unit` int(10) UNSIGNED DEFAULT NULL,
  `id_category` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED DEFAULT NULL,
  `id_brand` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_characterics`
--

CREATE TABLE `products_characterics` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_characterics_language`
--

CREATE TABLE `products_characterics_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product_characteristic` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_lang` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `key` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_comments`
--

CREATE TABLE `products_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment_text` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `star` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_images`
--

CREATE TABLE `products_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main` int(11) NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_language`
--

CREATE TABLE `products_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_extras`
--

CREATE TABLE `product_extras` (
  `id` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL,
  `id_extra_group` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_extras_language`
--

CREATE TABLE `product_extras_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_extras` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_extra_groups`
--

CREATE TABLE `product_extra_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` int(11) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL,
  `type` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_extra_groups_language`
--

CREATE TABLE `product_extra_groups_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_extra_group` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_extra_input_types`
--

CREATE TABLE `product_extra_input_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_extra_input_types`
--

INSERT INTO `product_extra_input_types` (`id`, `name`, `active`) VALUES
(1, 'Button with image', 1),
(2, 'Button with color', 1),
(3, 'Button with title', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `active`) VALUES
(1, 'Superadmin', 1),
(2, 'Manager', 1),
(3, 'Delivery boy', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `id_permission` int(10) UNSIGNED NOT NULL,
  `id_role` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`id_permission`, `id_role`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-04-19 22:51:06', '2022-04-19 22:51:06'),
(2, 1, '2022-04-19 22:51:06', '2022-04-19 22:51:06'),
(3, 1, '2022-04-19 22:51:06', '2022-04-19 22:51:06'),
(4, 1, '2022-04-19 22:51:06', '2022-04-19 22:51:06'),
(5, 1, '2022-04-19 22:51:06', '2022-04-19 22:51:06'),
(6, 1, '2022-04-19 22:51:06', '2022-04-19 22:51:06'),
(7, 1, '2022-04-19 22:51:06', '2022-04-19 22:51:06'),
(8, 1, '2022-04-19 22:51:07', '2022-04-19 22:51:07'),
(9, 1, '2022-04-19 22:51:07', '2022-04-19 22:51:07'),
(10, 1, '2022-04-19 22:51:07', '2022-04-19 22:51:07'),
(11, 1, '2022-04-19 22:51:07', '2022-04-19 22:51:07'),
(12, 1, '2022-04-19 22:51:07', '2022-04-19 22:51:07'),
(13, 1, '2022-04-19 22:51:07', '2022-04-19 22:51:07'),
(14, 1, '2022-04-19 22:51:07', '2022-04-19 22:51:07'),
(15, 1, '2022-04-19 22:51:07', '2022-04-19 22:51:07'),
(16, 1, '2022-04-19 22:51:08', '2022-04-19 22:51:08'),
(17, 1, '2022-04-19 22:51:08', '2022-04-19 22:51:08'),
(18, 1, '2022-04-19 22:51:08', '2022-04-19 22:51:08'),
(19, 1, '2022-04-19 22:51:08', '2022-04-19 22:51:08'),
(20, 1, '2022-04-19 22:51:08', '2022-04-19 22:51:08'),
(21, 1, '2022-04-19 22:51:09', '2022-04-19 22:51:09'),
(22, 1, '2022-04-19 22:51:09', '2022-04-19 22:51:09'),
(23, 1, '2022-04-19 22:51:09', '2022-04-19 22:51:09'),
(24, 1, '2022-04-19 22:51:09', '2022-04-19 22:51:09'),
(25, 1, '2022-04-19 22:51:09', '2022-04-19 22:51:09'),
(26, 1, '2022-04-19 22:51:09', '2022-04-19 22:51:09'),
(27, 1, '2022-04-19 22:51:09', '2022-04-19 22:51:09'),
(28, 1, '2022-04-19 22:51:09', '2022-04-19 22:51:09'),
(29, 1, '2022-04-19 22:51:10', '2022-04-19 22:51:10'),
(30, 1, '2022-04-19 22:51:10', '2022-04-19 22:51:10'),
(31, 1, '2022-04-19 22:51:10', '2022-04-19 22:51:10'),
(32, 1, '2022-04-19 22:51:10', '2022-04-19 22:51:10'),
(33, 1, '2022-04-19 22:51:10', '2022-04-19 22:51:10'),
(34, 1, '2022-04-19 22:51:10', '2022-04-19 22:51:10'),
(35, 1, '2022-04-19 22:51:11', '2022-04-19 22:51:11'),
(36, 1, '2022-04-19 22:51:11', '2022-04-19 22:51:11'),
(37, 1, '2022-04-19 22:51:11', '2022-04-19 22:51:11'),
(38, 1, '2022-04-19 22:51:11', '2022-04-19 22:51:11'),
(39, 1, '2022-04-19 22:51:11', '2022-04-19 22:51:11'),
(40, 1, '2022-04-19 22:51:11', '2022-04-19 22:51:11'),
(41, 1, '2022-04-19 22:51:12', '2022-04-19 22:51:12'),
(42, 1, '2022-04-19 22:51:12', '2022-04-19 22:51:12'),
(43, 1, '2022-04-19 22:51:12', '2022-04-19 22:51:12'),
(44, 1, '2022-04-19 22:51:12', '2022-04-19 22:51:12'),
(45, 1, '2022-04-19 22:51:12', '2022-04-19 22:51:12'),
(46, 1, '2022-04-19 22:51:12', '2022-04-19 22:51:12'),
(47, 1, '2022-04-19 22:51:12', '2022-04-19 22:51:12'),
(48, 1, '2022-04-19 22:51:12', '2022-04-19 22:51:12'),
(49, 1, '2022-04-19 22:51:13', '2022-04-19 22:51:13'),
(50, 1, '2022-04-19 22:51:13', '2022-04-19 22:51:13'),
(51, 1, '2022-04-19 22:51:13', '2022-04-19 22:51:13'),
(52, 1, '2022-04-19 22:51:13', '2022-04-19 22:51:13'),
(53, 1, '2022-04-19 22:51:13', '2022-04-19 22:51:13'),
(54, 1, '2022-04-19 22:51:13', '2022-04-19 22:51:13'),
(55, 1, '2022-04-19 22:51:13', '2022-04-19 22:51:13'),
(56, 1, '2022-04-19 22:51:13', '2022-04-19 22:51:13'),
(57, 1, '2022-04-19 22:51:14', '2022-04-19 22:51:14'),
(58, 1, '2022-04-19 22:51:14', '2022-04-19 22:51:14'),
(59, 1, '2022-04-19 22:51:14', '2022-04-19 22:51:14'),
(60, 1, '2022-04-19 22:51:14', '2022-04-19 22:51:14'),
(61, 1, '2022-04-19 22:51:14', '2022-04-19 22:51:14'),
(62, 1, '2022-04-19 22:51:14', '2022-04-19 22:51:14'),
(63, 1, '2022-04-19 22:51:14', '2022-04-19 22:51:14'),
(64, 1, '2022-04-19 22:51:15', '2022-04-19 22:51:15'),
(65, 1, '2022-04-19 22:51:15', '2022-04-19 22:51:15'),
(66, 1, '2022-04-19 22:51:15', '2022-04-19 22:51:15'),
(67, 1, '2022-04-19 22:51:15', '2022-04-19 22:51:15'),
(68, 1, '2022-04-19 22:51:15', '2022-04-19 22:51:15'),
(69, 1, '2022-04-19 22:51:15', '2022-04-19 22:51:15'),
(70, 1, '2022-04-19 22:51:15', '2022-04-19 22:51:15'),
(71, 1, '2022-04-19 22:51:16', '2022-04-19 22:51:16'),
(72, 1, '2022-04-19 22:51:16', '2022-04-19 22:51:16'),
(73, 1, '2022-04-19 22:51:16', '2022-04-19 22:51:16'),
(74, 1, '2022-04-19 22:51:16', '2022-04-19 22:51:16'),
(75, 1, '2022-04-19 22:51:17', '2022-04-19 22:51:17'),
(76, 1, '2022-04-19 22:51:17', '2022-04-19 22:51:17'),
(77, 1, '2022-04-19 22:51:17', '2022-04-19 22:51:17'),
(78, 1, '2022-04-19 22:51:17', '2022-04-19 22:51:17'),
(79, 1, '2022-04-19 22:51:17', '2022-04-19 22:51:17'),
(80, 1, '2022-04-19 22:51:17', '2022-04-19 22:51:17'),
(81, 1, '2022-04-19 22:51:17', '2022-04-19 22:51:17'),
(82, 1, '2022-04-19 22:51:18', '2022-04-19 22:51:18'),
(83, 1, '2022-04-19 22:51:18', '2022-04-19 22:51:18'),
(84, 1, '2022-04-19 22:51:18', '2022-04-19 22:51:18'),
(85, 1, '2022-04-19 22:51:18', '2022-04-19 22:51:18'),
(86, 1, '2022-04-19 22:51:18', '2022-04-19 22:51:18'),
(87, 1, '2022-04-19 22:51:18', '2022-04-19 22:51:18'),
(88, 1, '2022-04-19 22:51:18', '2022-04-19 22:51:18'),
(89, 1, '2022-04-19 22:51:19', '2022-04-19 22:51:19'),
(90, 1, '2022-04-19 22:51:19', '2022-04-19 22:51:19'),
(91, 1, '2022-04-19 22:51:19', '2022-04-19 22:51:19'),
(92, 1, '2022-04-19 22:51:19', '2022-04-19 22:51:19'),
(93, 1, '2022-04-19 22:51:19', '2022-04-19 22:51:19'),
(94, 1, '2022-04-19 22:51:19', '2022-04-19 22:51:19'),
(95, 1, '2022-04-19 22:51:19', '2022-04-19 22:51:19'),
(96, 1, '2022-04-19 22:51:19', '2022-04-19 22:51:19'),
(97, 1, '2022-04-19 22:51:19', '2022-04-19 22:51:19'),
(98, 1, '2022-04-19 22:51:20', '2022-04-19 22:51:20'),
(99, 1, '2022-04-19 22:51:20', '2022-04-19 22:51:20'),
(100, 1, '2022-04-19 22:51:20', '2022-04-19 22:51:20'),
(101, 1, '2022-04-19 22:51:20', '2022-04-19 22:51:20'),
(102, 1, '2022-04-19 22:51:20', '2022-04-19 22:51:20'),
(103, 1, '2022-04-19 22:51:20', '2022-04-19 22:51:20'),
(104, 1, '2022-04-19 22:51:20', '2022-04-19 22:51:20'),
(105, 1, '2022-04-19 22:51:20', '2022-04-19 22:51:20'),
(106, 1, '2022-04-19 22:51:20', '2022-04-19 22:51:20'),
(107, 1, '2022-04-19 22:51:21', '2022-04-19 22:51:21'),
(108, 1, '2022-04-19 22:51:21', '2022-04-19 22:51:21'),
(109, 1, '2022-04-19 22:51:21', '2022-04-19 22:51:21'),
(110, 1, '2022-04-19 22:51:21', '2022-04-19 22:51:21'),
(111, 1, '2022-04-19 22:51:21', '2022-04-19 22:51:21'),
(112, 1, '2022-04-19 22:51:22', '2022-04-19 22:51:22'),
(113, 1, '2022-04-19 22:51:22', '2022-04-19 22:51:22'),
(114, 1, '2022-04-19 22:51:22', '2022-04-19 22:51:22'),
(115, 1, '2022-04-19 22:51:22', '2022-04-19 22:51:22'),
(116, 1, '2022-04-19 22:51:22', '2022-04-19 22:51:22'),
(117, 1, '2022-04-19 22:51:22', '2022-04-19 22:51:22'),
(118, 1, '2022-04-19 22:51:22', '2022-04-19 22:51:22'),
(119, 1, '2022-04-19 22:51:22', '2022-04-19 22:51:22'),
(120, 1, '2022-04-19 22:51:23', '2022-04-19 22:51:23'),
(121, 1, '2022-04-19 22:51:23', '2022-04-19 22:51:23'),
(122, 1, '2022-04-19 22:51:23', '2022-04-19 22:51:23'),
(123, 1, '2022-04-19 22:51:23', '2022-04-19 22:51:23'),
(128, 1, '2022-04-19 22:51:23', '2022-04-19 22:51:23'),
(129, 1, '2022-04-19 22:51:23', '2022-04-19 22:51:23'),
(130, 1, '2022-04-19 22:51:23', '2022-04-19 22:51:23'),
(131, 1, '2022-04-19 22:51:24', '2022-04-19 22:51:24'),
(132, 1, '2022-04-19 22:51:24', '2022-04-19 22:51:24'),
(133, 1, '2022-04-19 22:51:24', '2022-04-19 22:51:24'),
(134, 1, '2022-04-19 22:51:24', '2022-04-19 22:51:24'),
(135, 1, '2022-04-19 22:51:24', '2022-04-19 22:51:24'),
(136, 1, '2022-04-19 22:51:24', '2022-04-19 22:51:24'),
(137, 1, '2022-04-19 22:51:24', '2022-04-19 22:51:24'),
(138, 1, '2022-04-19 22:51:24', '2022-04-19 22:51:24'),
(139, 1, '2022-04-19 22:51:25', '2022-04-19 22:51:25'),
(140, 1, '2022-04-19 22:51:25', '2022-04-19 22:51:25'),
(141, 1, '2022-04-19 22:51:25', '2022-04-19 22:51:25'),
(142, 1, '2022-04-19 22:51:25', '2022-04-19 22:51:25'),
(143, 1, '2022-04-19 22:51:25', '2022-04-19 22:51:25'),
(144, 1, '2022-04-19 22:51:25', '2022-04-19 22:51:25'),
(145, 1, '2022-04-19 22:51:25', '2022-04-19 22:51:25'),
(146, 1, '2022-04-19 22:51:25', '2022-04-19 22:51:25'),
(147, 1, '2022-04-19 22:51:25', '2022-04-19 22:51:25'),
(148, 1, '2022-04-19 22:51:26', '2022-04-19 22:51:26'),
(149, 1, '2022-04-19 22:51:26', '2022-04-19 22:51:26'),
(150, 1, '2022-04-19 22:51:26', '2022-04-19 22:51:26'),
(151, 1, '2022-04-19 22:51:26', '2022-04-19 22:51:26'),
(152, 1, '2022-04-19 22:51:26', '2022-04-19 22:51:26'),
(153, 1, '2022-04-19 22:51:26', '2022-04-19 22:51:26'),
(154, 1, '2022-04-19 22:51:26', '2022-04-19 22:51:26'),
(155, 1, '2022-04-19 22:51:27', '2022-04-19 22:51:27'),
(156, 1, '2022-04-19 22:51:27', '2022-04-19 22:51:27'),
(157, 1, '2022-04-19 22:51:27', '2022-04-19 22:51:27'),
(158, 1, '2022-04-19 22:51:27', '2022-04-19 22:51:27'),
(159, 1, '2022-04-19 22:51:27', '2022-04-19 22:51:27'),
(160, 1, '2022-04-19 22:51:27', '2022-04-19 22:51:27'),
(161, 1, '2022-04-19 22:51:27', '2022-04-19 22:51:27'),
(162, 1, '2022-04-19 22:51:27', '2022-04-19 22:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_boxes`
--

CREATE TABLE `shipping_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_box_languages`
--

CREATE TABLE `shipping_box_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipping_box_id` bigint(20) UNSIGNED NOT NULL,
  `lang_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(10) UNSIGNED NOT NULL,
  `logo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backimage_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_type` int(11) NOT NULL,
  `delivery_price` double NOT NULL,
  `delivery_range` int(11) NOT NULL,
  `admin_percentage` double NOT NULL,
  `latitude` double NOT NULL,
  `longtitude` double NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_type` tinyint(4) NOT NULL,
  `is_closed` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `open_hour` time NOT NULL,
  `close_hour` time NOT NULL,
  `id_shop_category` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount_limit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops_curriencies`
--

CREATE TABLE `shops_curriencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_currency` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `value` decimal(10,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops_language`
--

CREATE TABLE `shops_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops_rating`
--

CREATE TABLE `shops_rating` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_client` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_shop` int(10) UNSIGNED NOT NULL,
  `rating` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_categories`
--

CREATE TABLE `shop_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_categories_language`
--

CREATE TABLE `shop_categories_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_shop_category` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_deliveries`
--

CREATE TABLE `shop_deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(22,2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_type_id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `start` int(11) DEFAULT NULL,
  `end` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_payment`
--

CREATE TABLE `shop_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED DEFAULT NULL,
  `id_payment` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_shipping_boxes`
--

CREATE TABLE `shop_shipping_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_box_id` bigint(20) UNSIGNED NOT NULL,
  `start` int(11) NOT NULL DEFAULT 0,
  `end` int(11) DEFAULT NULL,
  `price` double(22,2) NOT NULL DEFAULT 0.00,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_socials`
--

CREATE TABLE `shop_socials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `social_id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_transports`
--

CREATE TABLE `shop_transports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_transport_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(22,2) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socials`
--

INSERT INTO `socials` (`id`, `tag`, `name`, `active`, `created_at`, `updated_at`) VALUES
(1, 'facebook', 'Facebook', 1, '2022-04-19 22:51:49', '2022-04-19 22:51:49'),
(2, 'instagram', 'Instagram', 1, '2022-04-19 22:51:49', '2022-04-19 22:51:49'),
(3, 'telegram', 'Telegram', 1, '2022-04-19 22:51:49', '2022-04-19 22:51:49'),
(4, 'tik-tok', 'Tik Tok', 1, '2022-04-19 22:51:49', '2022-04-19 22:51:49'),
(5, 'twitter', 'Twitter', 1, '2022-04-19 22:51:49', '2022-04-19 22:51:49');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percent` double(22,2) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_categories`
--

CREATE TABLE `tax_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(4) NOT NULL,
  `id_shop` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms_language`
--

CREATE TABLE `terms_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_terms` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_lang` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) NOT NULL DEFAULT 0,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'question',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('created','accepted','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'created',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_units`
--

CREATE TABLE `time_units` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `sort` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `shop_id` bigint(20) NOT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_sys_trans_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shop',
  `payment_sys_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'credit',
  `amount` bigint(20) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perform_time` timestamp NULL DEFAULT NULL,
  `refund_time` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units_language`
--

CREATE TABLE `units_language` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_unit` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_language`
--
ALTER TABLE `about_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `about_language_id_about_foreign` (`id_about`),
  ADD KEY `about_language_id_lang_foreign` (`id_lang`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_id_user_foreign` (`id_user`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_id_shop_foreign` (`id_shop`),
  ADD KEY `admins_id_role_foreign` (`id_role`);

--
-- Indexes for table `admin_balances`
--
ALTER TABLE `admin_balances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_id_shop_foreign` (`id_shop`);

--
-- Indexes for table `banners_language`
--
ALTER TABLE `banners_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_language_id_banner_foreign` (`id_banner`),
  ADD KEY `banners_language_id_lang_foreign` (`id_lang`);

--
-- Indexes for table `banners_products`
--
ALTER TABLE `banners_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_products_id_banner_foreign` (`id_banner`),
  ADD KEY `banners_products_id_product_foreign` (`id_product`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_id_shop_foreign` (`id_shop`),
  ADD KEY `brands_id_brand_category_foreign` (`id_brand_category`);

--
-- Indexes for table `brand_categories`
--
ALTER TABLE `brand_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_categories_language`
--
ALTER TABLE `brand_categories_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_categories_language_id_lang_foreign` (`id_lang`),
  ADD KEY `brand_categories_language_id_brand_category_foreign` (`id_brand_category`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id_shop_foreign` (`id_shop`);

--
-- Indexes for table `categories_language`
--
ALTER TABLE `categories_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_language_id_category_foreign` (`id_category`),
  ADD KEY `categories_language_id_lang_foreign` (`id_lang`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_balances`
--
ALTER TABLE `client_balances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_cards`
--
ALTER TABLE `client_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_shops`
--
ALTER TABLE `client_shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_id_shop_foreign` (`id_shop`);

--
-- Indexes for table `coupon_details`
--
ALTER TABLE `coupon_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_language`
--
ALTER TABLE `coupon_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_language_id_coupon_foreign` (`id_coupon`),
  ADD KEY `coupon_language_id_lang_foreign` (`id_lang`);

--
-- Indexes for table `coupon_products`
--
ALTER TABLE `coupon_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_products_id_coupon_foreign` (`id_coupon`),
  ADD KEY `coupon_products_id_product_foreign` (`id_product`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_language`
--
ALTER TABLE `currency_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_language_id_currency_foreign` (`id_currency`),
  ADD KEY `currency_language_id_lang_foreign` (`id_lang`);

--
-- Indexes for table `delivery_boy_orders`
--
ALTER TABLE `delivery_boy_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy_payouts`
--
ALTER TABLE `delivery_boy_payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_payout_histories`
--
ALTER TABLE `delivery_payout_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_routes`
--
ALTER TABLE `delivery_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_transports`
--
ALTER TABLE `delivery_transports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_transport_languages`
--
ALTER TABLE `delivery_transport_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_transport_languages_delivery_transport_id_foreign` (`delivery_transport_id`);

--
-- Indexes for table `delivery_types`
--
ALTER TABLE `delivery_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_type_languages`
--
ALTER TABLE `delivery_type_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_type_languages_delivery_type_id_foreign` (`delivery_type_id`);

--
-- Indexes for table `dialogs`
--
ALTER TABLE `dialogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id_shop_foreign` (`id_shop`);

--
-- Indexes for table `discount_products`
--
ALTER TABLE `discount_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_products_id_discount_foreign` (`id_discount`),
  ADD KEY `discount_products_id_product_foreign` (`id_product`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_language`
--
ALTER TABLE `faq_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_language_id_faq_foreign` (`id_faq`),
  ADD KEY `faq_language_id_lang_foreign` (`id_lang`);

--
-- Indexes for table `favorite_orders`
--
ALTER TABLE `favorite_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_tracking`
--
ALTER TABLE `live_tracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_dialog_id_foreign` (`dialog_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_params`
--
ALTER TABLE `mobile_params`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_params_lang`
--
ALTER TABLE `mobile_params_lang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile_params_lang_id_lang_foreign` (`id_lang`),
  ADD KEY `mobile_params_lang_id_param_foreign` (`id_param`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_id_user_foreign` (`id_user`),
  ADD KEY `notifications_id_shop_foreign` (`id_shop`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `REL_fe1a7dd16f1ecb55b516f1753f` (`id_review`),
  ADD KEY `orders_id_user_foreign` (`id_user`),
  ADD KEY `orders_order_status_foreign` (`order_status`),
  ADD KEY `orders_id_delivery_address_foreign` (`id_delivery_address`),
  ADD KEY `orders_id_delivery_boy_foreign` (`id_delivery_boy`),
  ADD KEY `orders_id_shop_foreign` (`id_shop`);

--
-- Indexes for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_comments_id_order_unique` (`id_order`),
  ADD KEY `order_comments_id_user_foreign` (`id_user`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_id_product_foreign` (`id_product`),
  ADD KEY `order_details_id_replace_product_foreign` (`id_replace_product`),
  ADD KEY `order_details_id_order_foreign` (`id_order`),
  ADD KEY `order_details_id_coupon_foreign` (`id_coupon`);

--
-- Indexes for table `order_details_extras`
--
ALTER TABLE `order_details_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_extras_id_order_detail_foreign` (`id_order_detail`),
  ADD KEY `order_details_extras_id_extras_foreign` (`id_extras`);

--
-- Indexes for table `order_points`
--
ALTER TABLE `order_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_points_id_shop_foreign` (`id_shop`);

--
-- Indexes for table `order_points_history`
--
ALTER TABLE `order_points_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_points_history_id_order_points_foreign` (`id_order_points`),
  ADD KEY `order_points_history_id_order_foreign` (`id_order`);

--
-- Indexes for table `order_points_rule`
--
ALTER TABLE `order_points_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_points_rule_language`
--
ALTER TABLE `order_points_rule_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_points_rule_language_id_lang_foreign` (`id_lang`),
  ADD KEY `order_points_rule_language_id_order_points_rule_foreign` (`id_order_points_rule`);

--
-- Indexes for table `order_shipping_details`
--
ALTER TABLE `order_shipping_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_attributes`
--
ALTER TABLE `payment_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_attribute_languages`
--
ALTER TABLE `payment_attribute_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_attribute_languages_payment_attribute_id_foreign` (`payment_attribute_id`);

--
-- Indexes for table `payment_language`
--
ALTER TABLE `payment_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_language_id_lang_foreign` (`id_lang`),
  ADD KEY `payment_language_id_payment_foreign` (`id_payment`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_prefix`
--
ALTER TABLE `phone_prefix`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `point_languages`
--
ALTER TABLE `point_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `point_languages_point_id_foreign` (`point_id`);

--
-- Indexes for table `point_rates`
--
ALTER TABLE `point_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privacy`
--
ALTER TABLE `privacy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privacy_language`
--
ALTER TABLE `privacy_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `privacy_language_id_privacy_foreign` (`id_privacy`),
  ADD KEY `privacy_language_id_lang_foreign` (`id_lang`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_unit_foreign` (`id_unit`),
  ADD KEY `products_id_brand_foreign` (`id_brand`),
  ADD KEY `products_id_shop_foreign` (`id_shop`),
  ADD KEY `products_id_category_foreign` (`id_category`);

--
-- Indexes for table `products_characterics`
--
ALTER TABLE `products_characterics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_characterics_id_product_foreign` (`id_product`);

--
-- Indexes for table `products_characterics_language`
--
ALTER TABLE `products_characterics_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_characterics_language_id_lang_foreign` (`id_lang`),
  ADD KEY `products_characterics_language_id_product_characteristic_foreign` (`id_product_characteristic`);

--
-- Indexes for table `products_comments`
--
ALTER TABLE `products_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_comments_id_product_foreign` (`id_product`),
  ADD KEY `products_comments_id_user_foreign` (`id_user`);

--
-- Indexes for table `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_images_id_product_foreign` (`id_product`);

--
-- Indexes for table `products_language`
--
ALTER TABLE `products_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_language_id_lang_foreign` (`id_lang`),
  ADD KEY `products_language_id_product_foreign` (`id_product`);

--
-- Indexes for table `product_extras`
--
ALTER TABLE `product_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_extras_id_extra_group_foreign` (`id_extra_group`);

--
-- Indexes for table `product_extras_language`
--
ALTER TABLE `product_extras_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_extras_language_id_lang_foreign` (`id_lang`),
  ADD KEY `product_extras_language_id_extras_foreign` (`id_extras`);

--
-- Indexes for table `product_extra_groups`
--
ALTER TABLE `product_extra_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_extra_groups_type_foreign` (`type`);

--
-- Indexes for table `product_extra_groups_language`
--
ALTER TABLE `product_extra_groups_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_extra_groups_language_id_extra_group_foreign` (`id_extra_group`),
  ADD KEY `product_extra_groups_language_id_lang_foreign` (`id_lang`);

--
-- Indexes for table `product_extra_input_types`
--
ALTER TABLE `product_extra_input_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`id_role`,`id_permission`),
  ADD KEY `roles_permissions_id_permission_foreign` (`id_permission`);

--
-- Indexes for table `shipping_boxes`
--
ALTER TABLE `shipping_boxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_box_languages`
--
ALTER TABLE `shipping_box_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_box_languages_shipping_box_id_foreign` (`shipping_box_id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops_curriencies`
--
ALTER TABLE `shops_curriencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_curriencies_id_currency_foreign` (`id_currency`),
  ADD KEY `shops_curriencies_id_shop_foreign` (`id_shop`);

--
-- Indexes for table `shops_language`
--
ALTER TABLE `shops_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_language_id_lang_foreign` (`id_lang`),
  ADD KEY `shops_language_id_shop_foreign` (`id_shop`);

--
-- Indexes for table `shops_rating`
--
ALTER TABLE `shops_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_rating_id_client_foreign` (`id_client`),
  ADD KEY `shops_rating_id_shop_foreign` (`id_shop`);

--
-- Indexes for table `shop_categories`
--
ALTER TABLE `shop_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_categories_language`
--
ALTER TABLE `shop_categories_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_categories_language_id_lang_foreign` (`id_lang`),
  ADD KEY `shop_categories_language_id_shop_category_foreign` (`id_shop_category`);

--
-- Indexes for table `shop_deliveries`
--
ALTER TABLE `shop_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_payment`
--
ALTER TABLE `shop_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_payment_id_shop_foreign` (`id_shop`),
  ADD KEY `shop_payment_id_payment_foreign` (`id_payment`);

--
-- Indexes for table `shop_shipping_boxes`
--
ALTER TABLE `shop_shipping_boxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_socials`
--
ALTER TABLE `shop_socials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_socials_social_id_foreign` (`social_id`);

--
-- Indexes for table `shop_transports`
--
ALTER TABLE `shop_transports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_categories`
--
ALTER TABLE `tax_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_language`
--
ALTER TABLE `terms_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `terms_language_id_terms_foreign` (`id_terms`),
  ADD KEY `terms_language_id_lang_foreign` (`id_lang`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_units`
--
ALTER TABLE `time_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_units_id_shop_foreign` (`id_shop`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units_language`
--
ALTER TABLE `units_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_language_id_lang_foreign` (`id_lang`),
  ADD KEY `units_language_id_unit_foreign` (`id_unit`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `about_language`
--
ALTER TABLE `about_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_balances`
--
ALTER TABLE `admin_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners_language`
--
ALTER TABLE `banners_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners_products`
--
ALTER TABLE `banners_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand_categories`
--
ALTER TABLE `brand_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brand_categories_language`
--
ALTER TABLE `brand_categories_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories_language`
--
ALTER TABLE `categories_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `client_balances`
--
ALTER TABLE `client_balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_cards`
--
ALTER TABLE `client_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_shops`
--
ALTER TABLE `client_shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_details`
--
ALTER TABLE `coupon_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_language`
--
ALTER TABLE `coupon_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_products`
--
ALTER TABLE `coupon_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency_language`
--
ALTER TABLE `currency_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boy_orders`
--
ALTER TABLE `delivery_boy_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boy_payouts`
--
ALTER TABLE `delivery_boy_payouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_payout_histories`
--
ALTER TABLE `delivery_payout_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_routes`
--
ALTER TABLE `delivery_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_transports`
--
ALTER TABLE `delivery_transports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_transport_languages`
--
ALTER TABLE `delivery_transport_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_types`
--
ALTER TABLE `delivery_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivery_type_languages`
--
ALTER TABLE `delivery_type_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dialogs`
--
ALTER TABLE `dialogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_products`
--
ALTER TABLE `discount_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_language`
--
ALTER TABLE `faq_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite_orders`
--
ALTER TABLE `favorite_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `live_tracking`
--
ALTER TABLE `live_tracking`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `mobile_params`
--
ALTER TABLE `mobile_params`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `mobile_params_lang`
--
ALTER TABLE `mobile_params_lang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_comments`
--
ALTER TABLE `order_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details_extras`
--
ALTER TABLE `order_details_extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_points`
--
ALTER TABLE `order_points`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_points_history`
--
ALTER TABLE `order_points_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_points_rule`
--
ALTER TABLE `order_points_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_points_rule_language`
--
ALTER TABLE `order_points_rule_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_shipping_details`
--
ALTER TABLE `order_shipping_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `payment_attributes`
--
ALTER TABLE `payment_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment_attribute_languages`
--
ALTER TABLE `payment_attribute_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment_language`
--
ALTER TABLE `payment_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_status`
--
ALTER TABLE `payment_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_prefix`
--
ALTER TABLE `phone_prefix`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `point_languages`
--
ALTER TABLE `point_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `point_rates`
--
ALTER TABLE `point_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `privacy`
--
ALTER TABLE `privacy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `privacy_language`
--
ALTER TABLE `privacy_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_characterics`
--
ALTER TABLE `products_characterics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_characterics_language`
--
ALTER TABLE `products_characterics_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_comments`
--
ALTER TABLE `products_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_language`
--
ALTER TABLE `products_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_extras`
--
ALTER TABLE `product_extras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_extras_language`
--
ALTER TABLE `product_extras_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_extra_groups`
--
ALTER TABLE `product_extra_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_extra_groups_language`
--
ALTER TABLE `product_extra_groups_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_extra_input_types`
--
ALTER TABLE `product_extra_input_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipping_boxes`
--
ALTER TABLE `shipping_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_box_languages`
--
ALTER TABLE `shipping_box_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops_curriencies`
--
ALTER TABLE `shops_curriencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops_language`
--
ALTER TABLE `shops_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops_rating`
--
ALTER TABLE `shops_rating`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_categories`
--
ALTER TABLE `shop_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_categories_language`
--
ALTER TABLE `shop_categories_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_deliveries`
--
ALTER TABLE `shop_deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_payment`
--
ALTER TABLE `shop_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_shipping_boxes`
--
ALTER TABLE `shop_shipping_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_socials`
--
ALTER TABLE `shop_socials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_transports`
--
ALTER TABLE `shop_transports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_categories`
--
ALTER TABLE `tax_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms_language`
--
ALTER TABLE `terms_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_units`
--
ALTER TABLE `time_units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units_language`
--
ALTER TABLE `units_language`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `about_language`
--
ALTER TABLE `about_language`
  ADD CONSTRAINT `about_language_id_about_foreign` FOREIGN KEY (`id_about`) REFERENCES `about` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `about_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admins_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `banners_language`
--
ALTER TABLE `banners_language`
  ADD CONSTRAINT `banners_language_id_banner_foreign` FOREIGN KEY (`id_banner`) REFERENCES `banners` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banners_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`);

--
-- Constraints for table `banners_products`
--
ALTER TABLE `banners_products`
  ADD CONSTRAINT `banners_products_id_banner_foreign` FOREIGN KEY (`id_banner`) REFERENCES `banners` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banners_products_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_id_brand_category_foreign` FOREIGN KEY (`id_brand_category`) REFERENCES `brand_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brand_categories_language`
--
ALTER TABLE `brand_categories_language`
  ADD CONSTRAINT `brand_categories_language_id_brand_category_foreign` FOREIGN KEY (`id_brand_category`) REFERENCES `brand_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brand_categories_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories_language`
--
ALTER TABLE `categories_language`
  ADD CONSTRAINT `categories_language_id_category_foreign` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `coupon_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_language`
--
ALTER TABLE `coupon_language`
  ADD CONSTRAINT `coupon_language_id_coupon_foreign` FOREIGN KEY (`id_coupon`) REFERENCES `coupon` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`);

--
-- Constraints for table `coupon_products`
--
ALTER TABLE `coupon_products`
  ADD CONSTRAINT `coupon_products_id_coupon_foreign` FOREIGN KEY (`id_coupon`) REFERENCES `coupon` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_products_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `currency_language`
--
ALTER TABLE `currency_language`
  ADD CONSTRAINT `currency_language_id_currency_foreign` FOREIGN KEY (`id_currency`) REFERENCES `currency` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `currency_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`);

--
-- Constraints for table `delivery_transport_languages`
--
ALTER TABLE `delivery_transport_languages`
  ADD CONSTRAINT `delivery_transport_languages_delivery_transport_id_foreign` FOREIGN KEY (`delivery_transport_id`) REFERENCES `delivery_transports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_type_languages`
--
ALTER TABLE `delivery_type_languages`
  ADD CONSTRAINT `delivery_type_languages_delivery_type_id_foreign` FOREIGN KEY (`delivery_type_id`) REFERENCES `delivery_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `discount_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discount_products`
--
ALTER TABLE `discount_products`
  ADD CONSTRAINT `discount_products_id_discount_foreign` FOREIGN KEY (`id_discount`) REFERENCES `discount` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discount_products_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faq_language`
--
ALTER TABLE `faq_language`
  ADD CONSTRAINT `faq_language_id_faq_foreign` FOREIGN KEY (`id_faq`) REFERENCES `faq` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `faq_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_dialog_id_foreign` FOREIGN KEY (`dialog_id`) REFERENCES `dialogs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mobile_params_lang`
--
ALTER TABLE `mobile_params_lang`
  ADD CONSTRAINT `mobile_params_lang_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`),
  ADD CONSTRAINT `mobile_params_lang_id_param_foreign` FOREIGN KEY (`id_param`) REFERENCES `mobile_params` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_id_delivery_address_foreign` FOREIGN KEY (`id_delivery_address`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_id_delivery_boy_foreign` FOREIGN KEY (`id_delivery_boy`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_order_status_foreign` FOREIGN KEY (`order_status`) REFERENCES `order_status` (`id`);

--
-- Constraints for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD CONSTRAINT `order_comments_id_order_foreign` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_comments_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_id_coupon_foreign` FOREIGN KEY (`id_coupon`) REFERENCES `coupon` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_id_order_foreign` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_id_replace_product_foreign` FOREIGN KEY (`id_replace_product`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details_extras`
--
ALTER TABLE `order_details_extras`
  ADD CONSTRAINT `order_details_extras_id_extras_foreign` FOREIGN KEY (`id_extras`) REFERENCES `product_extras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_extras_id_order_detail_foreign` FOREIGN KEY (`id_order_detail`) REFERENCES `order_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_points`
--
ALTER TABLE `order_points`
  ADD CONSTRAINT `order_points_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_points_history`
--
ALTER TABLE `order_points_history`
  ADD CONSTRAINT `order_points_history_id_order_foreign` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_points_history_id_order_points_foreign` FOREIGN KEY (`id_order_points`) REFERENCES `order_points` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_points_rule_language`
--
ALTER TABLE `order_points_rule_language`
  ADD CONSTRAINT `order_points_rule_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_points_rule_language_id_order_points_rule_foreign` FOREIGN KEY (`id_order_points_rule`) REFERENCES `order_points_rule` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_attribute_languages`
--
ALTER TABLE `payment_attribute_languages`
  ADD CONSTRAINT `payment_attribute_languages_payment_attribute_id_foreign` FOREIGN KEY (`payment_attribute_id`) REFERENCES `payment_attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_language`
--
ALTER TABLE `payment_language`
  ADD CONSTRAINT `payment_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`),
  ADD CONSTRAINT `payment_language_id_payment_foreign` FOREIGN KEY (`id_payment`) REFERENCES `payments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `point_languages`
--
ALTER TABLE `point_languages`
  ADD CONSTRAINT `point_languages_point_id_foreign` FOREIGN KEY (`point_id`) REFERENCES `points` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `privacy_language`
--
ALTER TABLE `privacy_language`
  ADD CONSTRAINT `privacy_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `privacy_language_id_privacy_foreign` FOREIGN KEY (`id_privacy`) REFERENCES `privacy` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_brand_foreign` FOREIGN KEY (`id_brand`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_id_category_foreign` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_id_unit_foreign` FOREIGN KEY (`id_unit`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products_characterics`
--
ALTER TABLE `products_characterics`
  ADD CONSTRAINT `products_characterics_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products_characterics_language`
--
ALTER TABLE `products_characterics_language`
  ADD CONSTRAINT `products_characterics_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_characterics_language_id_product_characteristic_foreign` FOREIGN KEY (`id_product_characteristic`) REFERENCES `products_characterics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products_comments`
--
ALTER TABLE `products_comments`
  ADD CONSTRAINT `products_comments_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_comments_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products_images`
--
ALTER TABLE `products_images`
  ADD CONSTRAINT `products_images_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products_language`
--
ALTER TABLE `products_language`
  ADD CONSTRAINT `products_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_language_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_extras`
--
ALTER TABLE `product_extras`
  ADD CONSTRAINT `product_extras_id_extra_group_foreign` FOREIGN KEY (`id_extra_group`) REFERENCES `product_extra_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_extras_language`
--
ALTER TABLE `product_extras_language`
  ADD CONSTRAINT `product_extras_language_id_extras_foreign` FOREIGN KEY (`id_extras`) REFERENCES `product_extras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_extras_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`);

--
-- Constraints for table `product_extra_groups`
--
ALTER TABLE `product_extra_groups`
  ADD CONSTRAINT `product_extra_groups_type_foreign` FOREIGN KEY (`type`) REFERENCES `product_extra_input_types` (`id`);

--
-- Constraints for table `product_extra_groups_language`
--
ALTER TABLE `product_extra_groups_language`
  ADD CONSTRAINT `product_extra_groups_language_id_extra_group_foreign` FOREIGN KEY (`id_extra_group`) REFERENCES `product_extra_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_extra_groups_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`);

--
-- Constraints for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD CONSTRAINT `roles_permissions_id_permission_foreign` FOREIGN KEY (`id_permission`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_permissions_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipping_box_languages`
--
ALTER TABLE `shipping_box_languages`
  ADD CONSTRAINT `shipping_box_languages_shipping_box_id_foreign` FOREIGN KEY (`shipping_box_id`) REFERENCES `shipping_boxes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shops_curriencies`
--
ALTER TABLE `shops_curriencies`
  ADD CONSTRAINT `shops_curriencies_id_currency_foreign` FOREIGN KEY (`id_currency`) REFERENCES `currency` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shops_curriencies_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shops_language`
--
ALTER TABLE `shops_language`
  ADD CONSTRAINT `shops_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shops_language_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shops_rating`
--
ALTER TABLE `shops_rating`
  ADD CONSTRAINT `shops_rating_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shops_rating_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_categories_language`
--
ALTER TABLE `shop_categories_language`
  ADD CONSTRAINT `shop_categories_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_categories_language_id_shop_category_foreign` FOREIGN KEY (`id_shop_category`) REFERENCES `shop_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_payment`
--
ALTER TABLE `shop_payment`
  ADD CONSTRAINT `shop_payment_id_payment_foreign` FOREIGN KEY (`id_payment`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `shop_payment_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_socials`
--
ALTER TABLE `shop_socials`
  ADD CONSTRAINT `shop_socials_social_id_foreign` FOREIGN KEY (`social_id`) REFERENCES `socials` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `terms_language`
--
ALTER TABLE `terms_language`
  ADD CONSTRAINT `terms_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `terms_language_id_terms_foreign` FOREIGN KEY (`id_terms`) REFERENCES `terms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `time_units`
--
ALTER TABLE `time_units`
  ADD CONSTRAINT `time_units_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units_language`
--
ALTER TABLE `units_language`
  ADD CONSTRAINT `units_language_id_lang_foreign` FOREIGN KEY (`id_lang`) REFERENCES `language` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_language_id_unit_foreign` FOREIGN KEY (`id_unit`) REFERENCES `units` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
