SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


-- Cơ sở dữ liệu: `arvila`
CREATE DATABASE IF NOT EXISTS `arvila` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `arvila`;

-- Bảng `banners`
CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `banners`
INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(2, '.', 'lorem-ipsum', 'uploads/banners/Screenshot 2025-05-21 230011.jpg', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Giảm tới 30%</span></h2>', 'active', '2025-08-14 01:50:23', '2025-05-21 09:01:16'),
(4, '.', 'banner', 'uploads/banners/Screenshot 2025-05-21 225925.jpg', '<blockquote><h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Miễn phí giao hàng cho đơn trên 1.000.000đ</span></h2><h6><span style=\"font-family: &quot;Arial Black&quot;;\">﻿</span></h6></blockquote><h2><span style=\"color: rgb(156, 0, 255);\"></span></h2>', 'active', '2025-08-17 20:46:59', '2025-05-21 09:01:03'),
(5, 'Công sở lịch lãm', 'banner-test', 'uploads/banners/Vest.jpg', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Giảm tới 10%</span></h2>', 'active', '2025-04-10 09:30:00', '2025-04-28 01:37:55');


-- Bảng `brands`
CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `brands`
INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', 'adidas', 'active', '2025-08-14 04:23:00', '2025-08-14 04:23:00'),
(2, 'Nike', 'nike', 'active', '2025-08-14 04:23:08', '2025-08-14 04:23:08'),
(3, 'Kappa', 'kappa', 'active', '2025-08-14 04:23:48', '2025-08-14 04:23:48'),
(4, 'Prada', 'prada', 'active', '2025-08-14 04:24:08', '2025-08-14 04:24:08'),
(7, 'Việt Tiến', 'viet-tien', 'active', '2025-04-25 11:12:56', '2025-04-25 11:12:56');


-- Bảng `carts`
CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `carts`
INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 11, 1, 2, 1600000.00, 'new', 1, 1600000.00, '2025-01-20 10:30:00', '2025-01-20 10:30:00'),
(2, 12, 2, 3, 540000.00, 'delivered', 1, 540000.00, '2025-01-20 14:20:00', '2025-01-21 15:00:00'),
(3, 13, 3, 4, 352000.00, 'progress', 1, 352000.00, '2025-01-21 09:15:00', '2025-01-21 16:30:00'),
(4, 14, 4, 5, 180000.00, 'new', 1, 180000.00, '2025-01-21 11:45:00', '2025-01-21 11:45:00'),
(5, 16, 5, 2, 180000.00, 'new', 1, 180000.00, '2025-01-22 08:30:00', '2025-01-22 08:30:00'),
(6, 17, 5, 2, 360000.00, 'new', 1, 360000.00, '2025-01-22 08:30:00', '2025-01-22 08:30:00'),
(7, 15, NULL, 3, 135000.00, 'new', 1, 135000.00, '2025-01-22 10:00:00', '2025-01-22 10:00:00'),
(8, 18, NULL, 4, 382500.00, 'new', 1, 382500.00, '2025-01-22 14:15:00', '2025-01-22 14:15:00');

-- Bảng `categories`
CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `categories`
INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(9, 'Đồ công sở nam', 'vest-cong-so-nam', '<p>Vest công sở nam</p>', 'uploads/categories/mini-banner1.jpg', 1, NULL, NULL, 'active', '2025-04-25 09:27:30', '2025-04-25 10:19:50'),
(10, 'Đồng hồ nam', 'dong-ho-nam', '<p>Đồng hồ nam</p>', NULL, 0, 9, NULL, 'active', '2025-04-25 09:27:48', '2025-04-25 09:30:18'),
(11, 'Đồ công sở nữ', 'dam-cong-so-nu', '<p>Đầm công sở nữ....</p>', 'uploads/categories/mini-banner1.jpg', 1, NULL, NULL, 'active', '2025-04-25 09:28:07', '2025-06-30 08:55:36'),
(14, 'Áo sơ mi nam', 'ao-so-mi-nam', '<p>Áo sơ mi nam</p>', 'uploads/categories/aa423-mpd012t.jpg', 0, 9, NULL, 'active', '2025-04-25 09:29:11', '2025-04-28 10:33:45'),
(15, 'Quần âu', 'quan-au', '<p>Quần âu</p>', 'uploads/categories/6cb7c-pmo002b.jpg', 0, 9, NULL, 'active', '2025-04-25 09:32:55', '2025-04-28 10:34:05'),
(17, 'Đầm công sở nữ', 'dam-cong-so-nu-2204253440-907', '<p>Đầm công sở nữ<br></p>', 'uploads/categories/0122b-wsd000t.jpg', 0, 11, NULL, 'active', '2025-04-25 09:34:40', '2025-04-28 10:34:17'),
(18, 'Đồ thể thao nam', 'do-the-thao-nam', '<p>Đồ thể thao nam</p>', 'uploads/categories/mini-banner1.jpg', 1, NULL, NULL, 'active', '2025-04-25 09:39:45', '2025-04-25 10:19:36'),
(19, 'Đồ thể thao nữ', 'do-the-thao-nu', '<p>Đồ thể thao nữ<br></p>', 'uploads/categories/mini-banner1.jpg', 1, NULL, NULL, 'active', '2025-04-25 09:39:54', '2025-04-28 10:35:31'),
(22, 'Áo Vest nam', 'ao-vest-nam', '<p>Áo Vest nam<br></p>', 'uploads/categories/3a815-pmo002a.jpg', 0, 9, NULL, 'active', '2025-04-25 10:24:10', '2025-04-28 10:35:45'),
(23, 'Áo phông', 'ao-phong', '<p>Áo phông<br></p>', 'uploads/categories/c2ae6-n1.jpg', 0, 18, NULL, 'active', '2025-04-25 11:04:33', '2025-04-28 10:35:56'),
(24, 'Áo chạy bộ nữ', 'ao-chay-bo-nu', '<p>Áo chạy bộ nữ<br></p>', 'uploads/categories/d3fdb-image2xxl-4-.jpg', 0, 19, NULL, 'active', '2025-04-25 11:06:50', '2025-04-28 10:36:06'),
(25, 'Áo thể thao', 'ao-the-thao', '<p>Áo thể thao</p>', 'uploads/categories/bo_the_thao_tap_gym.jpg', 0, 18, NULL, 'active', '2025-04-28 02:06:45', '2025-04-28 10:36:36');


-- Bảng `coupons`
CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `coupons`
INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(6, 'GIAMGIAT4', 'percent', '11.00', 'active', '2025-04-25 11:42:51', '2025-04-25 11:43:59'),
(7, 'LOVE-JELLY', 'percent', '20.00', 'active', '2025-04-25 11:43:49', '2025-04-25 11:43:49');


-- Bảng `failed_jobs`
CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Bảng `messages`
CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Bảng `migrations`
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `migrations`
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2025_07_10_021010_create_brands_table', 1),
(5, '2025_07_10_025334_create_banners_table', 1),
(6, '2025_07_10_112147_create_categories_table', 1),
(7, '2025_07_11_063857_create_products_table', 1),
(8, '2025_07_12_073132_create_post_categories_table', 1),
(9, '2025_07_12_073701_create_post_tags_table', 1),
(10, '2025_07_12_083638_create_posts_table', 1),
(11, '2025_07_13_151329_create_messages_table', 1),
(12, '2025_07_14_023748_create_shippings_table', 1),
(13, '2025_07_15_054356_create_orders_table', 1),
(14, '2025_07_15_102626_create_carts_table', 1),
(15, '2025_07_16_041623_create_notifications_table', 1),
(16, '2025_07_16_053240_create_coupons_table', 1),
(17, '2025_07_23_143757_create_wishlists_table', 1),
(18, '2025_07_24_074930_create_product_reviews_table', 1),
(19, '2025_07_24_131727_create_post_comments_table', 1),
(20, '2025_08_01_143408_create_settings_table', 1);


-- Bảng `notifications`
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `notifications`
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"Có đơn hàng mới\",\"actionURL\":\"http:\\/\\/arvila.vtest:85\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2025-01-20 10:30:00', '2025-01-20 10:30:00'),
('b2c3d4e5-f6a7-8901-bcde-f12345678901', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"Có đơn hàng mới\",\"actionURL\":\"http:\\/\\/arvila.vtest:85\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2025-01-20 15:00:00', '2025-01-20 14:20:00', '2025-01-20 15:00:00'),
('c3d4e5f6-a7b8-9012-cdef-123456789012', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"Có đơn hàng mới\",\"actionURL\":\"http:\\/\\/arvila.vtest:85\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2025-01-21 09:15:00', '2025-01-21 09:15:00'),
('d4e5f6a7-b8c9-0123-def0-234567890123', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"Có đơn hàng mới\",\"actionURL\":\"http:\\/\\/arvila.vtest:85\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2025-01-21 11:45:00', '2025-01-21 11:45:00'),
('e5f6a7b8-c9d0-1234-ef01-345678901234', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"Có đơn hàng mới\",\"actionURL\":\"http:\\/\\/arvila.vtest:85\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2025-01-22 08:30:00', '2025-01-22 08:30:00'),
('f6a7b8c9-d0e1-2345-f012-456789012345', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"Có đánh giá sản phẩm mới!\",\"actionURL\":\"http:\\/\\/arvila.vtest:85\\/product-detail\\/ao-vest\",\"fas\":\"fa-star\"}', NULL, '2025-01-20 10:00:00', '2025-01-20 10:00:00'),
('a7b8c9d0-e1f2-3456-0123-567890123456', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"Có bình luận mới được tạo\",\"actionURL\":\"http:\\/\\/arvila.vtest:85\\/blog-detail\\/xu-huong-thoi-trang-2025-phong-cach-arvila\",\"fas\":\"fas fa-comment\"}', NULL, '2025-01-16 15:30:00', '2025-01-16 15:30:00');


-- Bảng `orders`
CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(10,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(10,2) DEFAULT NULL,
  `total_amount` double(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Dữ liệu cho bảng `orders`
INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(1, 'ORD-ARV2025001', 2, 1600000.00, 1, NULL, 1640000.00, 1, 'cod', 'unpaid', 'new', 'Nguyễn', 'Văn An', 'nguyenvanan@arvila.com', '0912345678', 'VN', '100000', '123 Đường Láng, Quận Đống Đa', 'Hà Nội', '2025-01-20 10:30:00', '2025-01-20 10:30:00'),
(2, 'ORD-ARV2025002', 3, 540000.00, 1, NULL, 580000.00, 1, 'cod', 'paid', 'delivered', 'Trần', 'Thị Bình', 'tranthibinh@arvila.com', '0923456789', 'VN', '100000', '456 Phố Huế, Quận Hai Bà Trưng', 'Hà Nội', '2025-01-20 14:20:00', '2025-01-21 15:00:00'),
(3, 'ORD-ARV2025003', 4, 360000.00, 2, NULL, 390000.00, 1, 'paypal', 'paid', 'process', 'Lê', 'Minh Cường', 'leminhcuong@arvila.com', '0934567890', 'VN', '350000', '789 Đường Trần Phú, Thành phố Vinh', 'Nghệ An', '2025-01-21 09:15:00', '2025-01-21 16:30:00'),
(4, 'ORD-ARV2025004', 5, 180000.00, 1, NULL, 220000.00, 1, 'cod', 'unpaid', 'new', 'Phạm', 'Thị Dung', 'phamthidung@arvila.com', '0945678901', 'VN', '100000', '321 Nguyễn Trãi, Quận Thanh Xuân', 'Hà Nội', '2025-01-21 11:45:00', '2025-01-21 11:45:00'),
(5, 'ORD-ARV2025005', 2, 720000.00, 1, NULL, 760000.00, 2, 'cod', 'unpaid', 'new', 'Nguyễn', 'Văn An', 'nguyenvanan@arvila.com', '0912345678', 'VN', '100000', '123 Đường Láng, Quận Đống Đa', 'Hà Nội', '2025-01-22 08:30:00', '2025-01-22 08:30:00');


-- Bảng `password_resets`
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `password_resets`
INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('nguyenvanan@arvila.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2025-01-20 08:00:00'),
('tranthibinh@arvila.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2025-01-21 10:30:00');


-- Bảng `posts`
CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `posts`
INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Xu hướng thời trang 2025 - Phong cách Arvila', 'xu-huong-thoi-trang-2025-phong-cach-arvila', '<p>Khám phá những xu hướng thời trang mới nhất năm 2025 với phong cách Arvila</p>', '<p>Năm 2025 mang đến những xu hướng thời trang đầy sáng tạo và hiện đại. Arvila tự hào giới thiệu bộ sưu tập mới với những thiết kế độc đáo, phù hợp với mọi phong cách từ công sở đến thể thao.</p>', '<p>Innovate & Create - Sáng tạo không ngừng</p>', 'uploads/posts/blog1.jpg', 'thời trang, xu hướng, 2025', 7, NULL, 1, 'active', '2025-01-16 09:00:00', '2025-01-16 09:00:00'),
(2, 'Hướng dẫn chọn size quần áo phù hợp', 'huong-dan-chon-size-quan-ao-phu-hop', '<p>Bí quyết chọn size quần áo phù hợp với vóc dáng của bạn</p>', '<p>Việc chọn size quần áo phù hợp không chỉ giúp bạn tự tin hơn mà còn tôn lên vóc dáng. Hãy cùng Arvila tìm hiểu cách đo size và chọn trang phục phù hợp nhất.</p>', '<p>Mỗi người đều có vóc dáng riêng, hãy chọn size phù hợp</p>', 'uploads/posts/blog2.jpg', 'hướng dẫn, size, quần áo', 9, NULL, 2, 'active', '2025-01-17 10:30:00', '2025-01-17 10:30:00'),
(3, 'Bảo quản quần áo đúng cách để bền lâu', 'bao-quan-quan-ao-dung-cach-de-ben-lau', '<p>Các mẹo bảo quản quần áo để giữ được độ mới và bền lâu</p>', '<p>Quần áo chất lượng tốt cần được bảo quản đúng cách. Bài viết này sẽ hướng dẫn bạn cách giặt, phơi và cất giữ quần áo để chúng luôn như mới.</p>', '<p>Chăm sóc tốt, quần áo bền lâu</p>', 'uploads/posts/blog3.jpg', 'bảo quản, chăm sóc', 8, NULL, 3, 'active', '2025-01-18 14:20:00', '2025-01-18 14:20:00'),
(4, 'Thời trang thể thao - Phong cách năng động', 'thoi-trang-the-thao-phong-cach-nang-dong', '<p>Khám phá bộ sưu tập thời trang thể thao mới nhất của Arvila</p>', '<p>Thời trang thể thao không chỉ dành cho phòng gym mà còn là phong cách thời thượng cho cuộc sống hàng ngày. Arvila mang đến những thiết kế thể thao hiện đại, thoải mái và phong cách.</p>', '<p>Năng động, khỏe khoắn, tự tin</p>', 'uploads/posts/blog1.jpg', 'thể thao, năng động', 6, NULL, 4, 'active', '2025-01-19 11:15:00', '2025-01-19 11:15:00');


-- Bảng `post_categories`
CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `post_categories`
INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Thể thao', 'the-thao', 'active', '2025-04-25 11:20:11', '2025-04-25 11:20:11'),
(7, 'Công sở', 'cong-so', 'active', '2025-04-25 11:20:18', '2025-04-25 11:20:18'),
(8, 'Bảo quản quần áo', 'bao-quan-quan-ao', 'active', '2025-04-25 11:20:27', '2025-04-25 11:20:27'),
(9, 'Cách chọn quần áo', 'cach-chon-quan-ao', 'active', '2025-04-25 11:27:59', '2025-04-25 11:27:59');


-- Bảng `post_comments`
CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dữ liệu cho bảng `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Bài viết rất hay và hữu ích! Tôi rất thích phong cách Arvila.', 'active', NULL, NULL, '2025-01-16 15:30:00', '2025-01-16 15:30:00'),
(2, 3, 1, 'Cảm ơn bạn đã chia sẻ. Tôi sẽ thử phong cách này.', 'active', NULL, 1, '2025-01-16 16:00:00', '2025-01-16 16:00:00'),
(3, 4, 2, 'Hướng dẫn rất chi tiết, giúp tôi chọn size chính xác hơn.', 'active', NULL, NULL, '2025-01-17 14:20:00', '2025-01-17 14:20:00'),
(4, 5, 3, 'Mẹo bảo quản rất hữu ích, quần áo của tôi giờ bền hơn nhiều!', 'active', NULL, NULL, '2025-01-18 18:45:00', '2025-01-18 18:45:00'),
(5, 2, 4, 'Thời trang thể thao của Arvila thật sự rất đẹp và chất lượng tốt.', 'active', NULL, NULL, '2025-01-19 13:10:00', '2025-01-19 13:10:00');


-- Bảng `post_tags`
CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `post_tags`
INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Công sở', 'cong-so', 'active', '2025-04-25 11:34:58', '2025-04-25 11:34:58'),
(6, 'Thể thao', 'the-thao', 'active', '2025-04-25 11:35:05', '2025-04-25 11:35:05'),
(7, 'Bảo quản quần áo', 'bao-quan-quan-ao', 'active', '2025-04-25 11:35:17', '2025-04-25 11:35:17');


-- Bảng `products`
CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '1',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(20,2) NOT NULL,
  `discount` double(10,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `products`
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(11, 'Áo Vest', 'ao-vest', '<p>Áo Vest<br></p>', '<p>Áo Vest<br></p>', 'uploads/products/3a815-pmo002a.jpg', 17, 'L,XL', 'new', 'active', 2000000.00, 20.00, 0, 9, 22, 4, '2025-04-25 10:28:25', '2025-05-19 11:35:17'),
(12, 'Đầm công sở nữ', 'dam-cong-so-nu', '<p>Đầm công sở nữ<br></p>', '<p>Đầm công sở nữ<br></p>', 'uploads/products/0122b-wsd000t.jpg', 19, 'S,M,L', 'hot', 'active', 600000.00, 10.00, 1, 11, 17, 4, '2025-04-25 10:51:20', '2025-05-09 09:37:12'),
(13, 'Áo sơ mi nam', 'ao-so-mi-nam', '<p>Áo sơ mi nam<br></p>', '<p>Áo sơ mi nam<br></p>', 'uploads/products/aa423-mpd012t.jpg', 40, 'M,L,XL', 'hot', 'active', 400000.00, 12.00, 1, 9, 14, 2, '2025-04-25 10:59:53', '2025-04-25 10:59:53'),
(14, 'Áo phông Kappa', 'ao-phong-kappa', '<p>Áo phông Kappa<br></p>', '<p>Áo phông Kappa<br></p>', 'uploads/products/c2ae6-n1.jpg', 50, 'M,L,XL', 'hot', 'active', 200000.00, 10.00, 0, 18, 23, 3, '2025-04-25 11:06:08', '2025-04-25 11:06:08'),
(15, 'Áo chạy bộ nữ Prada', 'ao-chay-bo-nu-prada', '<p>Áo chạy bộ nữ Prada<br></p>', '<p>Áo chạy bộ nữ Prada<br></p>', 'uploads/products/d3fdb-image2xxl-4-.jpg', 30, 'S,M,L', 'new', 'active', 150000.00, 10.00, 0, 19, 24, 4, '2025-04-25 11:07:53', '2025-04-25 11:07:53'),
(16, 'Áo Tee Tank', 'ao-tee-tank', '<p>Áo Tee Tank<br></p>', '<p>Áo Tee Tank<br></p>', 'uploads/products/ao_tee_tank.jpg', 27, 'M,L,XL', 'hot', 'active', 200000.00, 10.00, 1, 18, 23, 4, '2025-04-28 02:05:09', '2025-05-19 11:35:17'),
(17, 'Bộ đồ tập Gym', 'bo-do-tap-gym', '<p>Bộ đồ tập Gym&nbsp;<br></p>', '<p>Bộ đồ tập Gym&nbsp;<br></p>', 'uploads/products/bo_the_thao_tap_gym.jpg', 36, 'M,L,XL', 'hot', 'active', 400000.00, 10.00, 1, 18, 25, 4, '2025-04-28 02:10:00', '2025-05-21 07:31:45'),
(18, 'Bộ tập Gym nữ', 'bo-tap-gym-nu', 'Bộ tập Gym nữ', '<p>Bộ tập Gym nữ<br></p>', 'uploads/products/bo_tap_gym_nu.jpg', 49, 'S,M,L,XL', 'default', 'active', 450000.00, 15.00, 1, 19, NULL, 3, '2025-04-28 02:13:47', '2025-05-21 09:10:06'),
(19, 'Áo đen', 'ao-den', '<p>Áo đen</p>', '<p>Áo đen siêu đẹp</p>', 'uploads/products/ao_tee_tank.jpg', 69, '', 'new', 'active', 190000.00, 10.00, 0, 18, NULL, 3, '2025-05-21 07:27:08', '2025-05-21 18:29:26'),
(20, 'Áo đen thể thao', 'ao-den-the-thao', '<p>áo đẹp</p>', '<p>áo siêu đẹp</p>', 'uploads/products/ao_tee_tank.jpg', 20, 'S,M,L,XL', 'new', 'active', 290000.00, 6.00, 1, 18, 25, 4, '2025-05-21 18:30:58', '2025-05-21 18:30:58');


-- Bảng `product_reviews`
CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `product_reviews`
INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 11, 5, 'Áo Vest rất đẹp và chất lượng tốt. Vải mềm mại, form dáng chuẩn. Rất hài lòng với sản phẩm của Arvila!', 'active', '2025-01-20 10:00:00', '2025-01-20 10:00:00'),
(2, 3, 12, 5, 'Đầm công sở nữ rất đẹp, phù hợp với công việc. Chất liệu tốt, không bị nhăn. Giao hàng nhanh.', 'active', '2025-01-20 11:30:00', '2025-01-20 11:30:00'),
(3, 4, 13, 4, 'Áo sơ mi nam đẹp, form dáng tốt. Giá cả hợp lý. Sẽ mua thêm màu khác.', 'active', '2025-01-21 09:15:00', '2025-01-21 09:15:00'),
(4, 5, 14, 5, 'Áo phông Kappa rất thoải mái, chất liệu cotton mềm mại. Thích hợp cho mùa hè.', 'active', '2025-01-21 14:20:00', '2025-01-21 14:20:00'),
(5, 2, 17, 5, 'Bộ đồ tập Gym rất tốt, thấm hút mồ hôi tốt. Tập luyện rất thoải mái. Đáng mua!', 'active', '2025-01-22 08:30:00', '2025-01-22 08:30:00'),
(6, 3, 18, 4, 'Bộ tập Gym nữ đẹp, chất lượng ổn. Giá hơi cao một chút nhưng đáng đồng tiền.', 'active', '2025-01-22 16:45:00', '2025-01-22 16:45:00');


-- Bảng `settings`
CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `settings`
INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Mong muốn đáp ứng nhu cầu của khách hàng.', 'Mong muốn đáp ứng nhu cầu của khách hàng.', 'uploads/settings/LOGO_1.jpg', 'uploads/settings/LOGO_1.jpg', 'Cầu Giấy - Hà Nội', '123456789', 'arvila@gmail.com', NULL, '2025-05-17 01:44:47');



-- Bảng `shippings`
CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `shippings`
INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hà Nội', '40000.00', 'active', '2025-08-14 04:22:17', '2025-04-25 11:14:54'),
(2, 'Phú Thọ', '30000.00', 'active', '2025-08-14 04:22:41', '2025-04-25 11:15:11'),
(3, 'Vĩnh Phúc', '40000.00', 'active', '2025-08-15 06:54:04', '2025-04-25 11:15:27'),
(4, 'Ninh Bình', '35000.00', 'active', '2025-08-17 20:50:48', '2025-04-25 11:15:47');


-- Bảng `users`
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8 NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `users`
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Arvila', 'admin@arvila.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'admin', NULL, NULL, 'active', NULL, '2025-01-15 10:00:00', '2025-01-15 10:00:00'),
(2, 'Nguyễn Văn An', 'nguyenvanan@arvila.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', NULL, '2025-01-15 10:05:00', '2025-01-15 10:05:00'),
(3, 'Trần Thị Bình', 'tranthibinh@arvila.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', NULL, '2025-01-15 10:10:00', '2025-01-15 10:10:00'),
(4, 'Lê Minh Cường', 'leminhcuong@arvila.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', NULL, '2025-01-15 10:15:00', '2025-01-15 10:15:00'),
(5, 'Phạm Thị Dung', 'phamthidung@arvila.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', NULL, '2025-01-15 10:20:00', '2025-01-15 10:20:00');


-- Bảng `wishlists`
CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Dữ liệu cho bảng `wishlists`
INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 11, NULL, 2, 1600000.00, 1, 1600000.00, '2025-01-19 09:00:00', '2025-01-19 09:00:00'),
(2, 12, NULL, 3, 540000.00, 1, 540000.00, '2025-01-19 10:30:00', '2025-01-19 10:30:00'),
(3, 17, NULL, 4, 360000.00, 1, 360000.00, '2025-01-19 14:20:00', '2025-01-19 14:20:00'),
(4, 18, NULL, 5, 382500.00, 1, 382500.00, '2025-01-19 16:45:00', '2025-01-19 16:45:00'),
(5, 13, NULL, 2, 352000.00, 1, 352000.00, '2025-01-20 08:15:00', '2025-01-20 08:15:00'),
(6, 16, NULL, 3, 180000.00, 1, 180000.00, '2025-01-20 11:00:00', '2025-01-20 11:00:00');


ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);


ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);


ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);


ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);


ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);


ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);


ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);


ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);


ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);


ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);


ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);


ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);


ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);


ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);


ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);


ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);


-- AUTO_INCREMENT cho bảng `banners`
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


-- AUTO_INCREMENT cho bảng `brands`
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


-- AUTO_INCREMENT cho bảng `carts`
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


-- AUTO_INCREMENT cho bảng `categories`
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;


-- AUTO_INCREMENT cho bảng `coupons`
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


-- AUTO_INCREMENT cho bảng `failed_jobs`
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT cho bảng `messages`
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT cho bảng `migrations`
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

-- AUTO_INCREMENT cho bảng `orders`
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


-- AUTO_INCREMENT cho bảng `posts`
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

-- AUTO_INCREMENT cho bảng `post_categories`
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


-- AUTO_INCREMENT cho bảng `post_comments`
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

-- AUTO_INCREMENT cho bảng `post_tags`
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


-- AUTO_INCREMENT cho bảng `products`
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;


-- AUTO_INCREMENT cho bảng `product_reviews`
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


-- AUTO_INCREMENT cho bảng `settings`
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


-- AUTO_INCREMENT cho bảng `shippings`
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


-- AUTO_INCREMENT cho bảng `users`
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

-- AUTO_INCREMENT cho bảng `wishlists`
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


-- Các ràng buộc cho bảng `carts`
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;


-- Các ràng buộc cho bảng `categories`
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;


-- Các ràng buộc cho bảng `orders`
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;


-- Các ràng buộc cho bảng `posts`
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;


-- Các ràng buộc cho bảng `post_comments`
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;


-- Các ràng buộc cho bảng `products`
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;


-- Các ràng buộc cho bảng `product_reviews`
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;


-- Các ràng buộc cho bảng `wishlists`
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

