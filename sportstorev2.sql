-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2024 at 11:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sportstoree`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mota` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `mota`) VALUES
(1, 'Louis Vuitton', 'Elegant'),
(2, 'Dior', 'Classic'),
(3, 'Chanel', 'Luxury');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` varchar(50) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'ĐỒ BÓNG ĐÁ'),
(2, 'TẬP GYM'),
(4, 'THẢM TẬP YOGA'),
(5, 'ÁO BRA'),
(6, 'QUẦN LEGGING'),
(7, 'PHỤ KIỆN'),
(8, 'THỰC PHẨM');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `address` varchar(250) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `note` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `fname`, `email`, `phone_number`, `address`, `subject_name`, `note`, `created_at`, `updated_at`, `status`) VALUES
(8, 'Vũ Duy Quang', 'quangtest@gmail.com', '0815461162', 'Vĩnh Phúc', 'Không đặt được hàng', 'Tôi gặp vấn đề về phương thức thanh toán', '2024-11-13 12:27:45', '2024-11-13 12:27:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `thumbnail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `note` varchar(100) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `total_money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `email`, `phone_number`, `address`, `note`, `order_date`, `status`, `total_money`) VALUES
(43, 0, 'Vũ Duy Quang', 'quangtest@gmail.com', '0815461162', 'Vĩnh Phúc', '', '2024-11-17 18:38:05', 1, 190000),
(44, 0, 'Vũ Duy Quang', 'quangtest@gmail.com', '0815461162', 'Vĩnh Phúc', '', '2024-11-17 18:39:22', 1, 2490000),
(45, 0, 'Vũ Duy Quang', 'quangtest@gmail.com', '0815461162', 'Vĩnh Phúc', '', '2024-11-17 18:40:34', 0, 1360000),
(46, 0, 'Vũ Duy Quang', 'quangtest@gmail.com', '0815461162', 'Vĩnh Phúc', '', '2024-11-17 18:40:52', 2, 650000);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `total_money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `num`, `total_money`) VALUES
(16, 43, 81, 190000, 1, 190000),
(17, 44, 52, 200000, 2, 400000),
(18, 44, 85, 190000, 1, 190000),
(19, 44, 34, 1900000, 1, 1900000),
(20, 45, 58, 270000, 1, 270000),
(21, 45, 52, 200000, 1, 200000),
(22, 45, 35, 890000, 1, 890000),
(23, 46, 33, 650000, 1, 650000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(100) NOT NULL,
  `discount` int(255) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0 COMMENT 'Xoá mềm ( mặc định là 0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `discount`, `image`, `brand`, `description`, `quantity`, `active`, `created_at`, `updated_at`, `deleted`) VALUES
(2, 2, 'Áo thun thể thao Design ', '280000', 175000, 'assets/photos/Ao-thun-the-thao-design-mau-den-1-300x300.jpg', '', '<p>&Aacute;o thun thể thao&nbsp;<strong>Design m&agrave;u đen&nbsp;</strong>l&agrave; một trong những mẫu &aacute;o thể thao Activity 2021 năm nay. &Aacute;o được thiết kế với phong c&aacute;ch thời trang, năng động, c&ugrave;ng với chất liệu co giản 4 chiều. Đ&acirc;y sẽ l&agrave; một trong những mẫu trang phục kh&ocirc;ng thể thiếu khi đồng h&agrave;nh c&ugrave;ng bạn đến ph&ograve;ng tập hay bất cứ m&ocirc;n thể thao n&agrave;o.</p>\r\n\r\n<p><strong>Chất liệu:&nbsp;</strong>88% Polyester &ndash; 12% Spandex</p>\r\n\r\n<p><strong>M&agrave;u sắc:&nbsp;</strong>Đen &ndash; Xanh r&ecirc;u &ndash; Xanh đen</p>\r\n\r\n<p><strong>Kiểu d&aacute;ng:&nbsp;</strong>&Aacute;o thun thể thao nam</p>', 1, 1, NULL, NULL, 0),
(3, 2, 'Áo thun thể thao Poseidon xám', '280000', 175000, 'assets/photos/Ao-poseidon-xam-1-300x300.jpg', '', '<p>&Aacute;o thun thể thao&nbsp;<strong>Poseidon x&aacute;m&nbsp;</strong>l&agrave; một trong những mẫu &aacute;o thể thao &ldquo;Thần Thoại Hy Lạp&rdquo; của 2020 năm nay. &Aacute;o được thiết kế với phong c&aacute;ch thời trang, năng động, c&ugrave;ng với chất liệu co giản 4 chiều. Đ&acirc;y sẽ l&agrave; một trong những mẫu trang phục kh&ocirc;ng thể thiếu khi đồng h&agrave;nh c&ugrave;ng bạn đến ph&ograve;ng tập hay bất cứ m&ocirc;n thể thao n&agrave;o.</p>\r\n\r\n<p><strong>Chất liệu: 80</strong>% Polyester &ndash; 20% Spandex</p>\r\n\r\n<p><strong>M&agrave;u sắc:&nbsp;</strong>Đen &ndash; X&aacute;m &ndash; Xanh đen &ndash; Xanh dương</p>\r\n\r\n<p><strong>Kiểu d&aacute;ng:&nbsp;</strong>&Aacute;o thun thể thao nam</p>', 1, 1, NULL, NULL, 0),
(4, 2, 'Bra 360s Lux màu xanh đen', '300000', 200000, 'assets/photos/Bra-lux-xanh-den-30-300x300.jpg', '', '<p>&Aacute;o&nbsp;<strong>Bras 360s Lux&nbsp;</strong>m&agrave;u xanh đen kiểu d&aacute;ng thể thao, với thiết kế n&acirc;ng đỡ ngực khi tập luyện &ndash; vận động thể thao, gi&uacute;p bảo vệ v&ugrave;ng ngực khỏi xung lực c&oacute; hại đến ngực. Chất liệu co giản 4 chiều của Spandex gi&uacute;p bạn thoải m&aacute;i vận động, di chuyển trong từng động t&aacute;c v&agrave; ph&ugrave; hợp với mọi bộ m&ocirc;n thể thao.</p>\r\n\r\n<p><strong>Chất liệu:&nbsp;</strong>94% Polyester &ndash; 6% Spandex</p>\r\n\r\n<p><strong>M&agrave;u sắc:&nbsp;</strong>Đen &ndash; Nude &ndash; Cam &ndash; V&agrave;ng &ndash; Xanh đen &ndash; Xanh l&aacute;</p>\r\n\r\n<p><strong>Kiểu d&aacute;ng:&nbsp;</strong>Crop-top</p>', 14, 1, NULL, NULL, 0),
(5, 2, 'Bra 360s Crossfit màu trắng', '250000', 195000, 'assets/photos/Bra-crossfit-trang-30-300x300.jpg', '', '<p>&Aacute;o&nbsp;<strong>Bras 360s Crossfit</strong>&nbsp;m&agrave;u trắng kiểu d&aacute;ng thể thao, với thiết kế n&acirc;ng đỡ ngực khi tập luyện &ndash; vận động thể thao, gi&uacute;p bảo vệ v&ugrave;ng ngực khỏi xung lực c&oacute; hại đến ngực. Chất liệu co giản 4 chiều của Spandex gi&uacute;p bạn thoải m&aacute;i vận động, di chuyển trong từng động t&aacute;c v&agrave; ph&ugrave; hợp với mọi bộ m&ocirc;n thể thao.</p>\r\n\r\n<p><strong>Chất liệu:&nbsp;</strong>90% Polyester &ndash; 10% Spandex</p>\r\n\r\n<p><strong>M&agrave;u sắc:&nbsp;</strong>Đen &ndash; Trắng &ndash; Hồng &ndash; Mint &ndash; Xanh biển</p>\r\n\r\n<p><strong>Kiểu d&aacute;ng:&nbsp;</strong>Crop-top</p>', 14, 1, NULL, NULL, 0),
(6, 2, 'Bra 360s Shine màu cam', '250000', 145000, 'assets/photos/Bra-shine-cam-30-300x300.jpg', '', '<p>&Aacute;o&nbsp;<strong>Bras 360s Shine</strong>&nbsp;m&agrave;u cam kiểu d&aacute;ng thể thao, với thiết kế n&acirc;ng đỡ ngực khi tập luyện &ndash; vận động thể thao, gi&uacute;p bảo vệ v&ugrave;ng ngực khỏi xung lực c&oacute; hại đến ngực. Chất liệu co giản 4 chiều của Spandex gi&uacute;p bạn thoải m&aacute;i vận động, di chuyển trong từng động t&aacute;c v&agrave; ph&ugrave; hợp với mọi bộ m&ocirc;n thể thao.</p>\r\n\r\n<p><strong>Chất liệu:&nbsp;</strong>90% Polyester &ndash; 10% Spandex</p>\r\n\r\n<p><strong>M&agrave;u sắc:&nbsp;</strong>Đen &ndash; X&aacute;m &ndash; Hồng &ndash; Neon &ndash; Cam &ndash; Xanh biển</p>\r\n\r\n<p><strong>Kiểu d&aacute;ng:&nbsp;</strong>Bras thể thao from d&acirc;y X</p>', 14, 1, NULL, '2023-12-18 18:14:18', 0),
(7, 2, 'Bra 360s Zipper màu tím', '250000', 145000, 'assets/photos/Ao-bra-360s-zipper-mau-xanh-duong-1-300x300.jpg', '', '<p>&Aacute;o ngực thể thao (bras) 360s 3D Zipper t&iacute;m. Đ&acirc;y l&agrave; mẫu &aacute;o được thiết kế dựa tr&ecirc;n kiểu d&aacute;ng đẹp hiện đại v&agrave; được xem l&agrave; bộ trang phục thể thao ho&agrave;n hảo mang lại cho bạn cảm gi&aacute;c thoải m&aacute;i v&agrave; dễ chịu khi tập c&aacute;c b&agrave;i tập thể dục&nbsp;từ đơn giản đến phức tạp, mang đến cho bạn sự an to&agrave;n v&agrave; linh hoạt hơn trong ph&ograve;ng tập.</p>\r\n\r\n<p>Mẫu &aacute;o n&agrave;y thường được kết hợp với 1 chiếc &aacute;o tank top ở ngo&agrave;i v&agrave; quần th&igrave; bạn c&oacute; thể phối&nbsp;<strong>quần legging tập Yoga</strong>&nbsp;hoặc&nbsp;<strong>quần lửng</strong>,&nbsp;<strong>quần shorts</strong>&nbsp;đều ph&ugrave; hợp.</p>\r\n\r\n<p>Sản phẩm c&oacute; nhiều m&agrave;u sắc để bạn c&oacute; thể dễ d&agrave;ng chọn lựa.</p>', 14, 1, NULL, '2023-12-18 17:05:06', 0),
(8, 2, 'Áo thun thể thao Ceres đỏ', '280000', 175000, 'assets/photos/Ao-ceres-do-1-300x300.jpg', '', '<p>&Aacute;o thun thể thao&nbsp;<strong>Ceres đỏ&nbsp;</strong>l&agrave; một trong những mẫu &aacute;o thể thao &ldquo;Thần Thoại Hy Lạp&rdquo; của 2020 năm nay. &Aacute;o được thiết kế với phong c&aacute;ch thời trang, năng động, c&ugrave;ng với chất liệu co giản 4 chiều. Đ&acirc;y sẽ l&agrave; một trong những mẫu trang phục kh&ocirc;ng thể thiếu khi đồng h&agrave;nh c&ugrave;ng bạn đến ph&ograve;ng tập hay bất cứ m&ocirc;n thể thao n&agrave;o.</p>\r\n\r\n<p><strong>Chất liệu: 90</strong>% Polyester &ndash;&nbsp;<strong>10</strong>% Spandex</p>\r\n\r\n<p><strong>M&agrave;u sắc:</strong>&nbsp;Đen &ndash; Đỏ &ndash; Trắng</p>\r\n\r\n<p><strong>Kiểu d&aacute;ng:&nbsp;</strong>&Aacute;o thun thể thao nam</p>', 10, 1, NULL, NULL, 0),
(9, 2, 'Áo thun thể thao Running đen', '280000', 175000, 'assets/photos/Ao-thun-the-thao-running-mau-den-1-300x300.jpg', '', '<p>&Aacute;o thun thể thao&nbsp;<strong>Running m&agrave;u đen&nbsp;</strong>l&agrave; một trong những mẫu &aacute;o thể thao Activity 2021 năm nay. &Aacute;o được thiết kế với phong c&aacute;ch thời trang, năng động, c&ugrave;ng với chất liệu co giản 4 chiều. Đ&acirc;y sẽ l&agrave; một trong những mẫu trang phục kh&ocirc;ng thể thiếu khi đồng h&agrave;nh c&ugrave;ng bạn đến ph&ograve;ng tập hay bất cứ m&ocirc;n thể thao n&agrave;o.</p>\r\n\r\n<p><strong>Chất liệu:&nbsp;</strong>88% Polyester &ndash; 12% Spandex</p>\r\n\r\n<p><strong>M&agrave;u sắc:&nbsp;</strong>Đen &ndash; Xanh r&ecirc;u &ndash; Xanh đen &ndash; Xanh dương</p>\r\n\r\n<p><strong>Kiểu d&aacute;ng:&nbsp;</strong>&Aacute;o thun thể thao nam</p>', 20, 1, NULL, NULL, 0),
(10, 1, 'Áo AC Milan sân nhà 2021 – 2022', '250000', 190000, 'assets/photos/Áo AC Milan sân nhà 2021 – 2022.jpg', '', '<p>&Aacute;o b&oacute;ng đ&aacute;&nbsp;<a href=\"https://www.sporter.vn/ao-ac-milan/\"><strong>AC Milan</strong></a>&nbsp;s&acirc;n nh&agrave;:<br />\r\n-H&agrave;ng VN:&nbsp;<strong>90.000</strong>&nbsp;VNĐ /1 bộ<br />\r\n<strong>Từ 10 bộ trở l&ecirc;n: 85.000VNĐ /1 bộ.</strong><br />\r\n-H&agrave;ng Th&aacute;i Lan F1:&nbsp;<strong>260.000</strong>VNĐ /1 &aacute;o &ndash;&nbsp;<strong>330.000</strong>VNĐ /1 bộ<br />\r\n<strong>Gi&aacute; ưu đ&atilde;i từ 10 bộ trở l&ecirc;n: 250,000VNĐ/ 1 &aacute;o &ndash; 320,000VNĐ/ 1 bộ</strong></p>', 10, 1, NULL, '2023-12-18 18:12:49', 0),
(11, 1, 'Áo Chelsea sân nhà 2020-2021', '250000', 190000, 'assets/photos/Áo Chelsea sân nhà 2020-2021.jpg', '', '<p>&Aacute;o b&oacute;ng đ&aacute;&nbsp;<a href=\"https://www.sporter.vn/ao-chelsea/\"><strong>Chelsea</strong></a>&nbsp;s&acirc;n nh&agrave; được giới thiệu v&agrave;o trận Chung Kết FA Cup 20/21 vừa qua.<br />\r\n-H&agrave;ng VN:&nbsp;<strong>90.000</strong>&nbsp;VNĐ /1 bộ<br />\r\n<strong>Từ 10 bộ trở l&ecirc;n: 85.000VNĐ /1 bộ.</strong><br />\r\n-H&agrave;ng Th&aacute;i Lan F1:&nbsp;<strong>260.000</strong>VNĐ /1 &aacute;o &ndash;&nbsp;<strong>330.000</strong>VNĐ /1 bộ<br />\r\n<strong>Gi&aacute; ưu đ&atilde;i từ 10 bộ trở l&ecirc;n: 250,000VNĐ/ 1 &aacute;o &ndash; 320,000VNĐ/ 1 bộ</strong></p>', 12, 1, NULL, '2023-12-18 18:10:37', 0),
(12, 1, 'Áo Dortmund sân nhà 2020-2021', '250000', 190000, 'assets/photos/Áo Dortmund sân nhà 2020-2021.jpg', '', '<p>&Aacute;o b&oacute;ng đ&aacute;&nbsp;<a href=\"https://www.sporter.vn/ao-dortmund/\"><strong>Dortmund</strong></a>&nbsp;s&acirc;n kh&aacute;ch mẫu ba:<br />\r\n-H&agrave;ng VN:&nbsp;<strong>90.000</strong>&nbsp;VNĐ /1 bộ<br />\r\n<strong>Từ 10 bộ trở l&ecirc;n: 85.000VNĐ /1 bộ.</strong><br />\r\n-H&agrave;ng Th&aacute;i Lan F1:&nbsp;<strong>260.000</strong>VNĐ /1 &aacute;o &ndash;&nbsp;<strong>330.000</strong>VNĐ /1 bộ<br />\r\n<strong>Gi&aacute; ưu đ&atilde;i từ 10 bộ trở l&ecirc;n: 250,000VNĐ/ 1 &aacute;o &ndash; 320,000VNĐ/ 1 bộ</strong></p>', 12, 1, NULL, '2023-12-18 18:06:50', 0),
(13, 1, 'Áo MU sân nhà 2020-2021', '250000', 190000, 'assets/photos/Áo MU sân nhà 2020-2021.jpg', '', '<p>&Aacute;o b&oacute;ng đ&aacute;&nbsp;<a href=\"https://www.sporter.vn/ao-mu/\"><strong>Manchester United</strong></a>&nbsp;s&acirc;n nh&agrave; đang khuyến m&atilde;i giảm gi&aacute;:<br />\r\n-H&agrave;ng VN:&nbsp;<strong>90.000</strong>&nbsp;VNĐ /1 bộ<br />\r\n<strong>Từ 10 bộ trở l&ecirc;n: 85.000VNĐ /1 bộ.</strong><br />\r\n-H&agrave;ng Th&aacute;i Lan F1:&nbsp;<strong>260.000</strong>VNĐ /1 &aacute;o &ndash;&nbsp;<strong>330.000</strong>VNĐ /1 bộ<br />\r\n<strong>Gi&aacute; ưu đ&atilde;i từ 10 bộ trở l&ecirc;n: 250,000VNĐ/ 1 &aacute;o &ndash; 320,000VNĐ/ 1 bộ</strong></p>', 12, 1, NULL, '2023-12-18 18:04:10', 0),
(14, 4, 'Thảm TPE 360s Venus 2 lớp 8mm màu hồng', '650000', 380000, 'assets/photos/tham-360s-venus-2-lop-6mm-hong-5-280x280.jpg', '', '<p><strong>Thảm tập Yoga</strong>&nbsp;2 lớp 360s Venus sản xuất từ TPE d&agrave;y 8mm &ndash; cao su non với chất lượng tốt 360s Venus m&agrave;u hồng. Cam kết c&aacute;c loại thảm Sporter cung cấp an to&agrave;n cho người sử dụng v&agrave; kh&ocirc;ng chứa chất g&acirc;y ung thư.</p>\r\n\r\n<p><strong>Bảo h&agrave;nh 12 th&aacute;ng ch&iacute;nh h&atilde;ng 360s</strong></p>\r\n\r\n<p>Được sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại &eacute;p khu&ocirc;n bằng nhiệt, loại bỏ h&oacute;a chất độc hại, th&acirc;n thiện với m&ocirc;i trường (c&oacute; thể t&aacute;i sử dụng) v&agrave; an to&agrave;n khi tiếp x&uacute;c với da, tuyệt đối an to&agrave;n kể cả cho trẻ nhỏ v&agrave; phụ nữ mang thai.</p>\r\n\r\n<p>Thảm được thiết kế 2 lớp c&oacute; độ d&agrave;y 8mm &ndash; đ&acirc;y l&agrave; k&iacute;ch thước l&yacute; tưởng đối với nhiều h&igrave;nh thức tập Yoga.</p>\r\n\r\n<p>C&oacute; nhiều m&agrave;u sắc để c&aacute;c bạn dễ d&agrave;ng lựa chọn.</p>', 20, 1, NULL, NULL, 0),
(15, 4, 'Thảm TPE 6mm 360s Venus 2 lớp màu xanh bích', '450000', 300000, 'assets/photos/tham-360s-venus-2-lop-6mm-xanh-duong-5-280x280.jpg', '', '<p><strong>Thảm tập Yoga</strong>&nbsp;2 lớp sản xuất từ TPE m&agrave;u xanh b&iacute;ch d&agrave;y 6mm &ndash; cao su non với chất lượng cao của thương hiệu 360s Venus. Cam kết c&aacute;c loại thảm Sporter cung cấp an to&agrave;n cho người sử dụng v&agrave; kh&ocirc;ng chứa chất g&acirc;y ung thư.</p>\r\n\r\n<p><strong>Bảo h&agrave;nh 12 th&aacute;ng ch&iacute;nh h&atilde;ng 360s</strong></p>\r\n\r\n<p>Được sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại &eacute;p khu&ocirc;n bằng nhiệt, loại bỏ h&oacute;a chất độc hại, th&acirc;n thiện với m&ocirc;i trường (c&oacute; thể t&aacute;i sử dụng) v&agrave; an to&agrave;n khi tiếp x&uacute;c với da, tuyệt đối an to&agrave;n kể cả cho trẻ nhỏ v&agrave; phụ nữ mang thai.</p>\r\n\r\n<p>Thảm được thiết kế 2 lớp c&oacute; độ d&agrave;y 6mm &ndash; đ&acirc;y l&agrave; k&iacute;ch thước l&yacute; tưởng đối với nhiều h&igrave;nh thức tập Yoga.</p>\r\n\r\n<p>C&oacute; nhiều m&agrave;u sắc để c&aacute;c bạn dễ d&agrave;ng lựa chọn.</p>', 20, 1, NULL, NULL, 0),
(16, 4, 'Thảm TPE 6mm 360s Venus 2 lớp màu xanh lá', '450000', 300000, 'assets/photos/tham-360s-venus-2-lop-6mm-xanh-la-3-280x280.jpg', '', '<p><strong>Thảm tập Yoga</strong>&nbsp;2 lớp 360s Venus m&agrave;u xanh l&aacute; d&agrave;y 6mm sản xuất từ TPE &ndash; cao su non với chất lượng tốt. Cam kết c&aacute;c loại thảm Sporter cung cấp an to&agrave;n cho người sử dụng v&agrave; kh&ocirc;ng chứa chất g&acirc;y ung thư.</p>\r\n\r\n<p><strong>Bảo h&agrave;nh 12 th&aacute;ng ch&iacute;nh h&atilde;ng 360s</strong></p>\r\n\r\n<p>Được sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại &eacute;p khu&ocirc;n bằng nhiệt, loại bỏ h&oacute;a chất độc hại, th&acirc;n thiện với m&ocirc;i trường (c&oacute; thể t&aacute;i sử dụng) v&agrave; an to&agrave;n khi tiếp x&uacute;c với da, tuyệt đối an to&agrave;n kể cả cho trẻ nhỏ v&agrave; phụ nữ mang thai.</p>\r\n\r\n<p>Thảm được thiết kế 2 lớp c&oacute; độ d&agrave;y 6mm &ndash; đ&acirc;y l&agrave; k&iacute;ch thước l&yacute; tưởng đối với nhiều h&igrave;nh thức tập Yoga.</p>\r\n\r\n<p>C&oacute; nhiều m&agrave;u sắc để c&aacute;c bạn dễ d&agrave;ng lựa chọn.</p>', 20, 1, NULL, NULL, 0),
(17, 4, 'Thảm TPE 360s Venus 2 lớp 8mm màu tím', '650000', 450000, 'assets/photos/tham-hummal-cao-su-tim-2-300x300.jpg', '', '<p><strong>Thảm tập Yoga</strong>&nbsp;2 lớp 360s Venus d&agrave;y 8mm sản xuất từ TPE &ndash; cao su non với chất lượng tốt. Cam kết c&aacute;c loại thảm Sporter cung cấp an to&agrave;n cho người sử dụng v&agrave; kh&ocirc;ng chứa chất g&acirc;y ung thư.</p>\r\n\r\n<p><strong>Bảo h&agrave;nh 12 th&aacute;ng.</strong></p>\r\n\r\n<p>Được sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại &eacute;p khu&ocirc;n bằng nhiệt, loại bỏ h&oacute;a chất độc hại, th&acirc;n thiện với m&ocirc;i trường (c&oacute; thể t&aacute;i sử dụng) v&agrave; an to&agrave;n khi tiếp x&uacute;c với da, tuyệt đối an to&agrave;n kể cả cho trẻ nhỏ v&agrave; phụ nữ mang thai.</p>\r\n\r\n<p>Thảm được thiết kế 2 lớp c&oacute; độ d&agrave;y 8mm &ndash; đ&acirc;y l&agrave; k&iacute;ch thước l&yacute; tưởng đối với nhiều h&igrave;nh thức tập Yoga.</p>\r\n\r\n<p>C&oacute; nhiều m&agrave;u sắc để c&aacute;c bạn dễ d&agrave;ng lựa chọn.</p>', 20, 1, NULL, NULL, 0),
(22, 6, 'Quần Legging lửng Power hồng', '250000', 200000, 'assets/photos/Quan-legging-lung-power-hong-1-300x300.jpg', '', '<p>Quần legging lửng<strong>&nbsp;Power hồng phối lưới</strong>&nbsp;hỗ trợ tập Yoga, GYM &amp; Thể dục thẩm mỹ d&agrave;nh cho nữ. Được sản xuất từ chất liệu cotton kết hợp với sợi gi&atilde;n spandex v&agrave; thiết kế kiểu d&aacute;ng đẹp, mang lại cho bạn cảm gi&aacute;c m&aacute;t mẻ v&agrave; dễ chịu khi thực hiện c&aacute;c b&agrave;i tập thể dục.<br />\r\nBạn c&oacute; thể kết hợp quần legging n&agrave;y với&nbsp;<strong>&aacute;o bra</strong>&nbsp;thể thao v&agrave; một chiếc &aacute;o tanktop ở b&ecirc;n ngo&agrave;i rất ph&ugrave; hợp.</p>', 10, 1, NULL, NULL, 0),
(23, 6, 'Quần Legging lửng Power xám', '250000', 200000, 'assets/photos/Quan-legging-lung-power-xam-1-300x300.jpg', '', '<p>Quần legging lửng<strong>&nbsp;Power x&aacute;m phối lưới</strong>&nbsp;hỗ trợ tập Yoga, GYM &amp; Thể dục thẩm mỹ d&agrave;nh cho nữ. Được sản xuất từ chất liệu cotton kết hợp với sợi gi&atilde;n spandex v&agrave; thiết kế kiểu d&aacute;ng đẹp, mang lại cho bạn cảm gi&aacute;c m&aacute;t mẻ v&agrave; dễ chịu khi thực hiện c&aacute;c b&agrave;i tập thể dục.<br />\r\nBạn c&oacute; thể kết hợp quần legging n&agrave;y với&nbsp;<strong>&aacute;o bra</strong>&nbsp;thể thao v&agrave; một chiếc &aacute;o tanktop ở b&ecirc;n ngo&agrave;i rất ph&ugrave; hợp.</p>', 10, 1, NULL, NULL, 0),
(24, 6, 'Quần legging lửng Shaping xám', '350000', 220000, 'assets/photos/Quan-legging-lung-shaping-xam-2-300x300.jpg', '', '<p>Quần legging lửng<strong>&nbsp;Shaping x&aacute;m phối sọc</strong>&nbsp;hỗ trợ tập Yoga, GYM &amp; Thể dục thẩm mỹ d&agrave;nh cho nữ. Được sản xuất từ chất liệu cotton kết hợp với sợi gi&atilde;n spandex v&agrave; thiết kế kiểu d&aacute;ng đẹp, mang lại cho bạn cảm gi&aacute;c m&aacute;t mẻ v&agrave; dễ chịu khi thực hiện c&aacute;c b&agrave;i tập thể dục.<br />\r\nBạn c&oacute; thể kết hợp quần legging n&agrave;y với&nbsp;<strong>&aacute;o bra</strong>&nbsp;thể thao v&agrave; một chiếc &aacute;o tanktop ở b&ecirc;n ngo&agrave;i rất ph&ugrave; hợp.</p>', 10, 1, NULL, NULL, 0),
(25, 6, 'Quần legging 360s Rise màu đen', '280000', 180000, 'assets/photos/quan-legging-det-den-1-300x300.jpg', '', '<p>Quần&nbsp;<strong>legging 360s Rise</strong>&nbsp;m&agrave;u đen với thiết kế trơn đơn giản, dễ d&agrave;ng phối với &aacute;o Bras hay Tanktop khi bạn tham gia tập luyện thể thao. Mẫu quần legging được h&atilde;ng thể thao 360s chọn với phong c&aacute;ch đơn giản v&agrave; chất liệu co giản 4 chiều &ndash; ph&ugrave; hợp khi mặc dạo phố hay đến ph&ograve;ng tập GYM v&agrave; Yoga.</p>\r\n\r\n<p><strong>Chất liệu:&nbsp;</strong>90% Polyester &ndash; 10% Spandex</p>\r\n\r\n<p><strong>M&agrave;u sắc:&nbsp;</strong>Đen</p>\r\n\r\n<p><strong>Kiểu d&aacute;ng:&nbsp;</strong>Legging cạp cao</p>', 10, 1, NULL, NULL, 0),
(26, 5, 'Bra 360s Agless màu tím', '180000', 150000, 'assets/photos/Ao-bras-agless-mau-tim-1-300x300.jpg', '', '<p>&Aacute;o Bras 360s Agless m&agrave;u t&iacute;m kiểu d&aacute;ng thể thao, với thiết kế n&acirc;ng đỡ ngực khi tập luyện &ndash; vận động thể thao, gi&uacute;p bảo vệ v&ugrave;ng ngực khỏi xung lực c&oacute; hại đến ngực. Chất liệu co giản 4 chiều của Spandex gi&uacute;p bạn thoải m&aacute;i vận động, di chuyển trong từng động t&aacute;c v&agrave; ph&ugrave; hợp với mọi bộ m&ocirc;n thể thao.</p>\r\n\r\n<p><strong>Chất liệu:&nbsp;</strong>90% Polyester &ndash; 10% Spandex</p>\r\n\r\n<p><strong>M&agrave;u sắc:&nbsp;</strong>Hồng &ndash; Đen &ndash; Trắng &ndash; Xanh biển &ndash; T&iacute;m &ndash; Hồng phấn</p>\r\n\r\n<p><strong>Kiểu d&aacute;ng:&nbsp;</strong>&Aacute;o bras thể thao &ndash; n&acirc;ng đỡ ngực</p>', 10, 1, NULL, NULL, 0),
(27, 5, 'Bra 360s Dry Soft tím', '280000', 150000, 'assets/photos/Ao-bras-drysoft-mau-tim-2-300x300.jpg', '', '<p>&Aacute;o bra 360s Dry Soft t&iacute;m. Đ&acirc;y l&agrave; mẫu &aacute;o được thiết kế dựa tr&ecirc;n kiểu d&aacute;ng đẹp hiện đại v&agrave; được xem l&agrave; bộ quần &aacute;o thể thao ho&agrave;n hảo mang lại cho bạn cảm gi&aacute;c thoải m&aacute;i v&agrave; dễ chịu khi tập c&aacute;c b&agrave;i tập thể dục&nbsp;từ đơn giản đến phức tạp, mang đến cho bạn sự an to&agrave;n v&agrave; linh hoạt hơn trong ph&ograve;ng tập.</p>\r\n\r\n<p>Mẫu &aacute;o n&agrave;y thường được kết hợp với 1 chiếc &aacute;o tank top ở ngo&agrave;i v&agrave; quần th&igrave; bạn c&oacute; thể phối&nbsp;<strong>quần legging tập Yoga</strong>&nbsp;hoặc&nbsp;<strong>quần lửng</strong>,&nbsp;<strong>quần shorts</strong>&nbsp;thể thao đều ph&ugrave; hợp.</p>\r\n\r\n<p>Sản phẩm c&oacute; nhiều m&agrave;u sắc để bạn c&oacute; thể dễ d&agrave;ng chọn lựa.</p>', 10, 1, NULL, NULL, 0),
(28, 5, 'Bra 360s Galaxy màu đen', '180000', 150000, 'assets/photos/Bra-bufterfly-mau-den-2-300x300.jpg', '', '<p>&Aacute;o&nbsp;<strong>Bras 360s Galaxy&nbsp;</strong>m&agrave;u đen kiểu d&aacute;ng thể thao, với thiết kế n&acirc;ng đỡ ngực khi tập luyện &ndash; vận động thể thao, gi&uacute;p bảo vệ v&ugrave;ng ngực khỏi xung lực c&oacute; hại đến ngực. Chất liệu co giản 4 chiều của Spandex gi&uacute;p bạn thoải m&aacute;i vận động, di chuyển trong từng động t&aacute;c v&agrave; ph&ugrave; hợp với mọi bộ m&ocirc;n thể thao.</p>\r\n\r\n<p><strong>Chất liệu:&nbsp;</strong>90% Polyester &ndash; 10% Spandex</p>\r\n\r\n<p><strong>M&agrave;u sắc:&nbsp;</strong>Đen &ndash; X&aacute;m &ndash; Hồng</p>\r\n\r\n<p><strong>Kiểu d&aacute;ng:&nbsp;</strong>&Aacute;o bras thể thao &ndash; n&acirc;ng đỡ ngực</p>', 10, 1, NULL, NULL, 0),
(29, 5, 'Bra 360s Strappy màu tím', '180000', 150000, 'assets/photos/Bra-strappy-mau-tim-1-300x300.jpg', '', '<p>&Aacute;o&nbsp;<strong>Bras 360s Strappy</strong>&nbsp;m&agrave;u t&iacute;m kiểu d&aacute;ng thể thao, với thiết kế n&acirc;ng đỡ ngực khi tập luyện &ndash; vận động thể thao, gi&uacute;p bảo vệ v&ugrave;ng ngực khỏi xung lực c&oacute; hại đến ngực. Chất liệu co giản 4 chiều của Spandex gi&uacute;p bạn thoải m&aacute;i vận động, di chuyển trong từng động t&aacute;c v&agrave; ph&ugrave; hợp với mọi bộ m&ocirc;n thể thao.</p>\r\n\r\n<p><strong>Chất liệu:&nbsp;</strong>88% Polyester &ndash; 12% Spandex</p>\r\n\r\n<p><strong>M&agrave;u sắc:&nbsp;</strong>Đen &ndash; Trắng &ndash; T&iacute;m &ndash; Hồng &ndash; Xanh Dương</p>\r\n\r\n<p><strong>Kiểu d&aacute;ng:&nbsp;</strong>&Aacute;o bras thể thao &ndash; n&acirc;ng đỡ ngực</p>', 10, 1, NULL, NULL, 0),
(30, 7, 'DÀN TẠ ĐA NĂNG KIM THÀNH KT19', '10000000', 8500000, 'assets/photos/BK-899Pro overall-500x500.jpg', '', '<p>- Ghế tập tạ&nbsp;được thiết kế chắc chắn, bền, tiết kiệm diện t&iacute;ch, c&oacute; thể th&aacute;o rời từng bộ phận cất gọn sau khi tập.</p>\r\n\r\n<p>- Ghế được sơn tĩnh điện n&ecirc;n bảo đảm về độ bền đẹp v&agrave; thẩm mỹ.</p>\r\n\r\n<p>-&nbsp;Ghế tập tạ đa năng&nbsp;Kim Th&agrave;nh KT20&nbsp;chuy&ecirc;n d&ugrave;ng cho c&aacute;c b&agrave;i tập thể lực như: Tập tạ ngang tạo r&atilde;nh ngực, tập ngực tr&ecirc;n, tập cơ vai, đ&aacute; ch&acirc;n, cơ đ&ugrave;i v&agrave; k&eacute;o x&ocirc;, cho bạn một cơ thể săn chắc, khoẻ mạnh.</p>', 10, 1, NULL, NULL, 0),
(31, 7, 'MÁY CHẠY BỘ ĐIỆN CAO CẤP MOFIT PRO910', '12000000', 9500000, 'assets/photos/kungfu-da-nang-500x500.png', '', '<p>M&aacute;y chạy bộ điện cao cấp MOFIT PRO910&nbsp; bản n&acirc;ng cấp từ m&aacute;y chạy bộ điện cao cấp MOFIT MHT 1430&nbsp; với nhiều cải tiến mới v&agrave; những đột ph&aacute; về c&ocirc;ng nghệ gi&uacute;p bạn c&oacute; những trải nghiệm tuyệt vời khi tập luyện tại nh&agrave;.</p>\r\n\r\n<p>M&aacute;y chạy bộ cao cấp MOFIT PRO910&nbsp;được thiết kế rất đặc biệt với những cải tiến mới, gi&uacute;p bạn c&oacute; những trải nghiệm th&uacute; vị với m&ocirc;n thể thao chạy bộ. Bạn c&oacute; thể luyện tập ngay tại nh&agrave; của m&igrave;nh sau những giờ học tập v&agrave; l&agrave;m việc căng thẳng.</p>', 10, 1, NULL, NULL, 0),
(32, 7, 'GHẾ MASSAGE ELIP PLUTONI ĐA NĂNG HỒNG NGOẠI', '32000000', 28000000, 'assets/photos/G46 new-anh avata moi-900x900r-500x500.jpg', '', '<h3><strong>C&ocirc;ng nghệ con lăn massage 5D mạnh mẽ, to&agrave;n diện</strong></h3>\r\n\r\n<p>Ứng dụng&nbsp;hệ thống c&ocirc;ng nghệ con lăn massage 5D uyển chuyển, mạnh mẽ theo trục LLD si&ecirc;u d&agrave;i &ocirc;m s&aacute;t theo đường cong của cột sống gi&uacute;p con lăn massage khắp cơ thể, đồng thời nhấn huyệt kỹ c&agrave;ng tại c&aacute;c điểm đau, mang lại hiệu quả k&eacute;p tạo cảm gi&aacute;c ch&acirc;n thực như thao t&aacute;c của một chuy&ecirc;n vi&ecirc;n trị liệu h&agrave;ng đầu.</p>\r\n\r\n<h3><strong>Hệ thống t&uacute;i kh&iacute; diện rộng</strong></h3>\r\n\r\n<p>Ghế massage&nbsp;ELIP Plutoni được trang bị t&uacute;i kh&iacute; rộng khắp ở v&ugrave;ng vai, tay, bắp ch&acirc;n, b&agrave;n ch&acirc;n,&hellip; lu&acirc;n phi&ecirc;n bơm căng để b&oacute;p c&aacute;c cơ gi&uacute;p lưu th&ocirc;ng m&aacute;u từ đ&oacute; l&agrave;m giảm đau nhức cơ khớp v&agrave; t&ecirc; mỏi ch&acirc;n tay, đặc biệt ph&ugrave; hợp cho người cao tuổi.</p>\r\n\r\n<h3><strong>Chăm s&oacute;c, n&acirc;ng niu b&agrave;n ch&acirc;n, bảo vệ sức khỏe to&agrave;n diện</strong></h3>\r\n\r\n<p>Ghế massage ELIP Plutoni t&iacute;ch hợp c&aacute;c b&agrave;i massage chăm s&oacute;c ch&acirc;n chuy&ecirc;n s&acirc;u từ ng&oacute;n ch&acirc;n cho đến g&oacute;t ch&acirc;n, phối hợp nhịp nh&agrave;ng giữa t&uacute;i kh&iacute; v&agrave; con lăn, k&iacute;ch th&iacute;ch tuần ho&agrave;n m&aacute;u v&agrave; gia tăng lượng m&aacute;u lưu th&ocirc;ng đến tim v&agrave; n&atilde;o, cải thiện hoạt động thể chất lẫn tinh thần.</p>\r\n\r\n<h3><strong>Body Scan d&ograve; t&igrave;m huyệt đạo chuẩn x&aacute;c, tăng hiệu quả b&agrave;i massage</strong></h3>\r\n\r\n<p>Chức năng Body Scan th&ocirc;ng minh của ELIP Plutoni sẽ tự động đo chiều d&agrave;i từ v&ugrave;ng sau g&aacute;y đến m&ocirc;ng để x&aacute;c định c&aacute;c huyệt đạo. Từ đ&oacute; c&aacute;c b&agrave;i massage sẽ k&iacute;ch th&iacute;ch v&agrave;o đ&uacute;ng c&aacute;c vị tr&iacute; đau nhức tr&ecirc;n cơ thể, ph&aacute;t huy tối đa hiệu quả những giờ ph&uacute;t thư gi&atilde;n.</p>\r\n\r\n<h3><strong>Massage kh&ocirc;ng trọng lực, rũ bỏ mọi &aacute;p lực</strong></h3>\r\n\r\n<p>Chức năng kh&ocirc;ng trọng lực với hai g&oacute;c nằm chuy&ecirc;n biệt tr&ecirc;n ghế massage ELIP Plutoni đem đến cho người d&ugrave;ng tư thế thư gi&atilde;n tuyệt vời gi&uacute;p giảm đ&aacute;ng kể trọng lực t&aacute;c động l&ecirc;n cột sống v&agrave; cơ thể. B&ecirc;n cạnh đ&oacute; giảm &aacute;p lực l&ecirc;n c&aacute;c cơ quan ph&iacute;a b&ecirc;n trong, tăng cường khả năng lưu th&ocirc;ng m&aacute;u v&agrave; đả th&ocirc;ng kinh lạc.</p>\r\n\r\n<h3><strong>Nhiệt hồng ngoại đa điểm, thư gi&atilde;n to&agrave;n th&acirc;n</strong></h3>\r\n\r\n<p>Chức năng nhiệt hồng ngoại được thiết kế tại v&ugrave;ng lưng v&agrave; bắp ch&acirc;n gi&uacute;p c&aacute;c b&oacute; cơ được thư gi&atilde;n tối đa. Nhiệt độ 30 - 40 độ C tr&ecirc;n ghế massage ELIP Plutoni l&agrave; nhiệt độ l&yacute; tưởng để cơ thể thư gi&atilde;n, th&uacute;c đẩy qu&aacute; tr&igrave;nh thải độc v&agrave; k&iacute;ch th&iacute;ch tuần ho&agrave;n m&aacute;u, gi&uacute;p cơ thể khỏe khoắn từ s&acirc;u b&ecirc;n trong.</p>\r\n\r\n<h3><strong>Kết nối thế giới số đơn giản, trải nghiệm massage trị liệu bằng &acirc;m nhạc</strong></h3>\r\n\r\n<p>Ghế massge ELIP Plutoni tạo ra một kh&ocirc;ng gian &acirc;m nhạc sống động theo c&aacute; t&iacute;nh của chủ nh&acirc;n với kết nối &ldquo;không dây&rdquo; bằng c&ocirc;ng nghệ Bluetooth. Sự kết hợp độc đ&aacute;o giữa chế độ massage v&agrave; &acirc;m nhạc Hifi đẳng cấp ch&iacute;nh l&agrave; sự kết hợp tuyệt vời cho tinh thần v&agrave; sức khỏe của bạn được thăng hoa.</p>\r\n\r\n<p>&nbsp;</p>', 10, 1, NULL, NULL, 0),
(33, 7, 'Máy Đo Huyết Áp Bắp Tay Omron - HEM-8712 - 100610698', '850000', 650000, 'assets/photos/1_12-500x500.jpg', '', '<h4>M&ocirc; Tả Sản Phẩm</h4>\r\n\r\n<p>C&ocirc;ng nghệ Intellisense mới Lưu kết quả đo mới nhất Kiểu d&aacute;ng nhỏ gọn, sử dụng đơn giản Bơm v&agrave; xả kh&iacute; v&ograve;ng b&iacute;t bằng tay dễ d&agrave;ng, gi&uacute;p bạn thao t&aacute;c nhanh v&agrave; tiện lợi</p>\r\n\r\n<p><strong>M&aacute;y Đo Huyết &Aacute;p Bắp Tay Omron - HEM-8712 - 100610698</strong></p>\r\n\r\n<p><strong>M&aacute;y Đo Huyết &Aacute;p Bắp Tay Omron - HEM-8712 - 100610698</strong>&nbsp;ứng dụng&nbsp;c&ocirc;ng nghệ Intellisense mới cho kết quả đo ch&iacute;nh x&aacute;c cao, lưu kết quả đo mới nhất, b&aacute;o cử động người v&agrave; nhịp tim bất thường. M&aacute;y ho&agrave;n to&agrave;n tự động gi&uacute;p&nbsp;đo huyết &aacute;p đơn giản, nhanh ch&oacute;ng. M&aacute;y l&agrave; sản phẩm cần thiết với mọi gia đ&igrave;nh.</p>\r\n\r\n<p><strong>C&ocirc;ng nghệ Intellisense mới</strong></p>\r\n\r\n<p>M&aacute;y Đo Huyết &Aacute;p Bắp Tay Omron - HEM-8712 - 100610698&nbsp;ứng dụng c&ocirc;ng nghệ Intellisense mới cho&nbsp;kết quả ch&iacute;nh x&aacute;c cao, c&oacute; đ&egrave;n chỉ dẫn c&aacute;ch quấn v&ograve;ng b&iacute;t đ&uacute;ng, b&aacute;o lỗi cử động người khi đo.</p>\r\n\r\n<p><strong>Lưu kết quả đo mới nhất</strong></p>\r\n\r\n<p>Bộ nhớ cho ph&eacute;p lưu kết quả đo mới nhất gi&uacute;p bạn c&oacute; thể so s&aacute;nh với những lần đo sau để nắm r&otilde; được t&igrave;nh h&igrave;nh huyết &aacute;p của m&igrave;nh v&agrave; c&oacute; những điều chỉnh kịp thời trong chế độ ăn uống, thể thao v&agrave; nghỉ ngơi.</p>\r\n\r\n<p><strong>Kiểu d&aacute;ng nhỏ gọn, sử dụng đơn giản</strong></p>\r\n\r\n<p>M&aacute;y Đo Huyết &Aacute;p Bắp Tay Omron - HEM-8712 - 100610698 c&oacute;&nbsp;thiết kế nhỏ gọn tiện lợi để bạn c&oacute; thể mang theo mọi nơi. Hơn nữa c&aacute;ch sử dụng đơn giản v&agrave; cấu h&igrave;nh th&acirc;n thiện với tất cả mọi người sẽ gi&uacute;p bạn sử dụng m&aacute;y một c&aacute;ch dễ d&agrave;ng.</p>\r\n\r\n<p><strong>Dễ sử dụng</strong></p>\r\n\r\n<p>Bơm v&agrave; xả kh&iacute; v&ograve;ng b&iacute;t bằng tay dễ d&agrave;ng, gi&uacute;p bạn thao t&aacute;c nhanh v&agrave; tiện lợi.</p>\r\n\r\n<p><strong>Th&ocirc;ng số kỹ thuật</strong></p>\r\n\r\n<p>Giới hạn đo:</p>\r\n\r\n<p>- Huyết &aacute;p: 0 tới 299 mm Hg</p>\r\n\r\n<p>- Nhịp tim: 40 tới 180 nhịp/ph&uacute;t.</p>\r\n\r\n<p>Độ ch&iacute;nh x&aacute;c:</p>\r\n\r\n<p>- Huyết &aacute;p: &plusmn;3 mm Hg.</p>\r\n\r\n<p>- Nhịp tim: &plusmn;5%.</p>\r\n\r\n<p>Tự động bơm v&agrave; xả kh&iacute;.</p>\r\n\r\n<p>Pin: 4 pin AA hoặc bộ đổi điện Omron</p>\r\n\r\n<p>Phụ kiện k&egrave;m theo:</p>\r\n\r\n<p>- V&ograve;ng b&iacute;t cỡ trung b&igrave;nh.</p>\r\n\r\n<p>- Hướng dẫn sử dụng.</p>\r\n\r\n<p>- Bộ pin.</p>\r\n\r\n<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>', 10, 1, NULL, NULL, 0),
(34, 8, 'Whey Gold Standard 4.5 - Primary Source', '2500000', 1900000, 'assets/photos/upl_whey_gold_standard_10lbs_4_5kg_1618384676_image_1618384676.jpg', '', '<p><em>Whey Gold Standard 100% đem lại cho bạn lượng Whey protein thuần t&uacute;y, kh&ocirc;ng pha trộn, đem đến cho bạn việc ph&aacute;t triển cơ bắp một c&aacute;ch hiệu quả nhất cho người tập Gym.</em></p>\r\n\r\n<p>Kết hợp giữa protein tăng cơ v&agrave; bổ sung th&ecirc;m cho cơ thể của bạn c&aacute;c nguồn EPA/DHA tinh khiết l&agrave; rất cần thiết, gi&uacute;p cơ thể bạn khỏe mạnh hơn, tăng cao hiệu quả tập luyện.</p>\r\n\r\n<p>Whey Gold c&ugrave;ng với Super Nova . Cung cấp cho bạn nguồn protein nguy&ecirc;n chất dễ d&agrave;ng hấp thụ v&agrave; sức mạnh để đột ph&aacute; mọi giới hạn của bản th&acirc;n. Tăng cao hiệu quả x&acirc;y dụng cơ bắp.</p>\r\n\r\n<p>Whey Gold cung cấp nguồn protein chất lượng v&agrave; Xtend BCAA, tươi m&aacute;t, kh&ocirc;ng đường hỗ trợ chăm s&oacute;c cơ bắp gi&uacute;p bạn vượt qua những buổi tập cường độ cao trong thời gian d&agrave;i m&agrave; kh&ocirc;ng thấy mệt mỏi.</p>\r\n\r\n<p>&nbsp;</p>', 10, 1, NULL, '2023-12-29 16:36:02', 0),
(35, 8, 'Omega 3 newblance - Molecularly Distilled', '1000000', 890000, 'assets/photos/129_image_catalog_now_omega-3_200_vien_image_catalog_1587722784.jpg', '', '<p>+ Loại sản phẩm : Thực phẩm bảo vệ sức khỏe</p>\r\n\r\n<p>+ Khối lượng tịnh : 600mg x 120 vi&ecirc;n nang (72g)/2 th&aacute;ng</p>\r\n\r\n<p>+ Liều lượng v&agrave; c&aacute;ch d&ugrave;ng: ng&agrave;y d&ugrave;ng 2 lần, mỗi lần uống 1 vi&ecirc;n với nước.</p>\r\n\r\n<p>+ Th&agrave;nh phần chức năng: dầu c&aacute; tinh chế ( EPA + DHA ) 700mg, Tocopherol</p>\r\n\r\n<h2>C&ocirc;ng dụng:</h2>\r\n\r\n<ul>\r\n	<li>Ức chế sự hấp thụ axit b&eacute;o v&agrave; glucose trong tế b&agrave;o gan</li>\r\n	<li>Cải thiện lưu th&ocirc;ng m&aacute;u</li>\r\n	<li>Giảm phản ứng vi&ecirc;m</li>\r\n	<li>Cải thiện chứng kh&ocirc; mắt</li>\r\n	<li>Bảo vệ da khỏi c&aacute;c chất oxy h&oacute;a</li>\r\n</ul>', 10, 1, NULL, '2023-12-29 16:35:22', 0),
(36, 8, 'NitroTech Whey Mutant 4.5 kg - ISO SURGE', '2800000', 2000000, 'assets/photos/upl_mutant_iso_surge_5lbs_2_27kg_1620788574_image_1620788574.jpg', '', '<p><em>MuscleTech NitroTech 10Lbs l&agrave; sản phẩm gi&uacute;p ph&aacute;t triển cơ bắp cung cấp nhiều protein nhất,v&agrave; kh&ocirc;ng pha trộn nhiều chất b&eacute;o, đường carbs cũng như tạp chất giống c&aacute;c loại protein kh&aacute;c.</em></p>\r\n\r\n<p>Whey Gold gi&uacute;p đẩy nhanh khả năng hấp thụ protein cũng như l&agrave; cắt giảm lượng mỡ kết hợp c&ugrave;ng với Semtex -&quot;khối thuốc nổ&quot; ph&aacute; tan mọi nh&agrave; kho chất b&eacute;o. Đặc biệt Semtex d&ugrave;ng tốt cho cả nam v&agrave; nữ</p>\r\n\r\n<p>Sự kết hợp mạnh mẽ trong việc tăng cơ,giảm mỡ, tăng sức mạnh khi m&agrave; hai d&ograve;ng sản phẩm n&agrave;y đều hỗ trợ giảm lượng mỡ thừa v&agrave; đốt mỡ. Bạn sẽ kh&ocirc;ng c&ograve;n lo lắng về khối lượng mỡ thừa trong cơ thể nữa, tăng cơ nạc hiệu quả hơn</p>\r\n\r\n<p>Sử dụng Mutant ISO Surge c&ugrave;ng với Lean Body , những buổi tập của bạn sẽ lu&ocirc;n tr&agrave;n đầy năng lượng .C&ugrave;ng với đ&oacute; Lean Body với t&aacute;c dụng cắt cơ sắt n&eacute;t sẽ đem lại cho bạn một body ho&agrave;n to&agrave;n l&yacute; tưởng.</p>', 10, 1, NULL, '2023-12-29 16:34:22', 0),
(37, 8, 'Combo 3 bánh bổ sung protein - ZERO BAR', '200000', 100000, 'assets/photos/upl_biotech_zero_bar_1593678290_image_1593678290.png', '', '<p><strong>Protein Zero Bar</strong>&nbsp;chất lượng cao dễ d&ugrave;ng v&agrave; v&ocirc; c&ugrave;ng thuận tiện:</p>\r\n\r\n<ul>\r\n	<li>177 calo thay thế bữa phụ ho&agrave;n hảo.</li>\r\n	<li>Protein dễ ph&acirc;n hủy, tốc độ hấp thu nhanh ch&oacute;ng.</li>\r\n	<li>Gi&agrave;u protein hỗ trợ ph&aacute;t triển v&agrave; phục hồi cơ bắp hiệu quả.</li>\r\n	<li>Gi&agrave;u chất xơ, h&agrave;m lượng Carbohydrate thấp.</li>\r\n	<li>Bổ sung chất b&eacute;o tốt cho sức khỏe.</li>\r\n	<li>Kh&ocirc;ng đường, chất l&agrave;m ngọt nh&acirc;n tạo, Lactose, Gluten, Aspartame.</li>\r\n	<li>Hương vị thơm ngon, ăn liền.</li>\r\n	<li>Thanh b&aacute;nh nhỏ gọn, tiện lợi.</li>\r\n</ul>\r\n\r\n<h3><strong>C&aacute;ch bổ sung hiệu quả Biotech Zero Bar:</strong></h3>\r\n\r\n<p>Một hộp bao gồm 20 thanh sử dụng tiết kiệm. Bạn sử dụng&nbsp;<strong>Biotech Zero Bar</strong>&nbsp;v&agrave;o c&aacute;c thời điểm sau:</p>\r\n\r\n<ul>\r\n	<li>Thời điểm s&aacute;ng sớm</li>\r\n	<li>Trước mỗi buổi tập</li>\r\n	<li>Thời điểm sau buổi tập</li>\r\n</ul>', 100, 1, NULL, '2023-12-04 15:27:18', 0),
(38, 7, 'Xe đạp tập thể dục Aerobic model mới nhất', '15000000', 12000000, 'assets/photos/48114ac4511c1ecc2a8cb2a5650e9170.png_720x720q80.png', '', '<p>- Đường chuyển động h&igrave;nh elip giảm tối đa chấn thương đầu gối ch&acirc;n.</p>\r\n\r\n<p>- Mặt đồng hồ hiển thị c&aacute;c chức năng, th&ocirc;ng số khi tập luyện.</p>\r\n\r\n<p>- Xe được cấu tạo từ bộ khung ống th&eacute;p cao cấp kh&ocirc;ng gỉ n&ecirc;n v&ocirc; c&ugrave;ng bền v&agrave; vững chắc cho người sử dụng khi tập luyện.</p>\r\n\r\n<p>- Y&ecirc;n xe điều chỉnh l&ecirc;n xuống, n&acirc;ng hạ đơn giản.Khung v&agrave; ch&acirc;n chống trượt để an to&agrave;n v&agrave; hiệu quả.</p>\r\n\r\n<p>- B&agrave;n đạp xe: được l&agrave;m từ cao su chất lượng cao v&agrave; c&oacute; quai cố định ch&acirc;n &ecirc;m &aacute;i v&agrave; chắc chắn hơn trong qu&aacute; tr&igrave;nh luyện tập.</p>\r\n\r\n<p>- Khung v&agrave; ch&acirc;n chống trượt để an to&agrave;n v&agrave; hiệu quả.</p>\r\n\r\n<p>- L&yacute; tưởng cho cơ thể, tập thể dục v&agrave; cơ thể thon gọn.</p>\r\n\r\n<p>- Tuyệt vời để sử dụng tại nh&agrave;, văn ph&ograve;ng v&agrave; ph&ograve;ng tập thể dục.</p>', 12, 1, NULL, '2023-12-04 17:01:17', 0),
(39, 1, 'Áo Bóng Đá Đội CLB Chelsea Xanh Ngọc 2023-2024', '200000', 100000, 'assets/photos/Áo Bóng Đá Đội CLB Chelsea Xanh Ngọc 2023-2024.jpg', '', '<p>*M&ocirc; tả chi tiết về sản phẩm bao gồm:</p>\r\n\r\n<p>+ Chất liệu : Thun cao cấp, bền đẹp với thời gian</p>\r\n\r\n<p>+ Vải co gi&atilde;n tốt, tho&aacute;ng m&aacute;t, Tho&aacute;t mồ h&ocirc;i khi hoạt động thể thao</p>\r\n\r\n<p>+ Đường may tỉ mỉ - gia c&ocirc;ng chi tiết</p>\r\n\r\n<p>+ Sản xuất tại Việt Nam</p>\r\n\r\n<p>+ Kh&ocirc;ng bị biến dạng khi giặt</p>\r\n\r\n<p>+ Size :S, M, L, XL (Vui l&ograve;ng đăng k&yacute; size khi đặt h&agrave;ng)</p>\r\n\r\n<p>+ Thương hiệu : Sportslink</p>\r\n\r\n<p>+ Nơi sản xuất : Việt Nam</p>\r\n\r\n<p>+ Bảo h&agrave;nh 1 đổi 1 trong 7 ng&agrave;y</p>\r\n\r\n<p>*Chi tiết c&aacute;c đặc điểm v&agrave; lợi &iacute;ch của sản phẩm&nbsp;:</p>\r\n\r\n<p>+ Chất liệu : Thun cao cấp, bền đẹp với thời gian</p>\r\n\r\n<p>+ Vải co gi&atilde;n tốt, tho&aacute;ng m&aacute;t, Tho&aacute;t mồ h&ocirc;i khi hoạt động thể thao</p>\r\n\r\n<p>+ Đường may tỉ mỉ - gia c&ocirc;ng chi tiết</p>\r\n\r\n<p>+ Sản xuất tại Việt Nam</p>\r\n\r\n<p>+ Kh&ocirc;ng bị biến dạng khi giặt</p>\r\n\r\n<p>*Điều khoản bảo h&agrave;nh v&agrave; thời hạn :</p>\r\n\r\n<p>+ Bảo h&agrave;nh 1 đổi 1 trong 7 ng&agrave;y</p>\r\n\r\n<p>+ Điều kiện đổi trả : do lỗi nh&agrave; sản xuất hoặc lỗi kỹ thuật</p>', 30, 1, '2023-12-23 16:43:31', '2023-12-23 16:56:30', 0),
(41, 1, 'Áo Bóng Đá Đội Tuyển Đức Xanh Đen Hồng 2024', '200000', 150000, 'assets/photos/Áo Bóng Đá Đội Tuyển Đức Xanh Đen Hồng 2024.jpg', '', '<p>*M&ocirc; tả chi tiết về sản phẩm bao gồm:</p>\r\n\r\n<p>+ Chất liệu : Thun cao cấp, bền đẹp với thời gian</p>\r\n\r\n<p>+ Vải co gi&atilde;n tốt, tho&aacute;ng m&aacute;t, Tho&aacute;t mồ h&ocirc;i khi hoạt động thể thao</p>\r\n\r\n<p>+ Đường may tỉ mỉ - gia c&ocirc;ng chi tiết</p>\r\n\r\n<p>+ Sản xuất tại Việt Nam</p>\r\n\r\n<p>+ Kh&ocirc;ng bị biến dạng khi giặt</p>\r\n\r\n<p>+ Size :S, M, L, XL (Vui l&ograve;ng đăng k&yacute; size khi đặt h&agrave;ng)</p>\r\n\r\n<p>+ Thương hiệu : Sportslink</p>\r\n\r\n<p>+ Nơi sản xuất : Việt Nam</p>\r\n\r\n<p>+ Bảo h&agrave;nh 1 đổi 1 trong 7 ng&agrave;y</p>\r\n\r\n<p>*Chi tiết c&aacute;c đặc điểm v&agrave; lợi &iacute;ch của sản phẩm&nbsp;:</p>\r\n\r\n<p>+ Chất liệu : Thun cao cấp, bền đẹp với thời gian</p>\r\n\r\n<p>+ Vải co gi&atilde;n tốt, tho&aacute;ng m&aacute;t, Tho&aacute;t mồ h&ocirc;i khi hoạt động thể thao</p>\r\n\r\n<p>+ Đường may tỉ mỉ - gia c&ocirc;ng chi tiết</p>\r\n\r\n<p>+ Sản xuất tại Việt Nam</p>\r\n\r\n<p>+ Kh&ocirc;ng bị biến dạng khi giặt</p>\r\n\r\n<p>*Điều khoản bảo h&agrave;nh v&agrave; thời hạn :</p>\r\n\r\n<p>+ Bảo h&agrave;nh 1 đổi 1 trong 7 ng&agrave;y</p>\r\n\r\n<p>+ Điều kiện đổi trả : do lỗi nh&agrave; sản xuất hoặc lỗi kỹ thuật</p>', 50, 1, '2023-12-23 16:56:05', '2023-12-23 16:56:05', 0),
(42, 1, 'Áo Bóng Đá CLB Man City Đen Loang 2023-2024', '250000', 200000, 'assets/photos/Áo Bóng Đá CLB Man City Đen Loang 2023-2024.jpg', '', '<p>✨ Chất liệu 95% Poly &ndash; 5% Spandex tạo cảm gi&aacute;c mềm mại, chống nhăn hiệu quả, thấm h&uacute;t mồ h&ocirc;i tốt v&agrave; co gi&atilde;n thoải m&aacute;i, ph&ugrave; hợp khi chơi thể thao.&nbsp;</p>\r\n\r\n<p>✨ &Aacute;p dụng c&ocirc;ng nghệ Moisture - Wicking gi&uacute;p những chiếc &aacute;o đấu Kamito c&oacute; khả năng h&uacute;t ẩm cao v&agrave; bay hơi nhanh. Người mặc sẽ lu&ocirc;n cảm thấy nhẹ nh&agrave;ng v&agrave; kh&ocirc; tho&aacute;ng, hạn chế những m&ugrave;i ph&aacute;t sinh trong qu&aacute; tr&igrave;nh vận động cường độ cao.</p>\r\n\r\n<p>✨ Form &aacute;o body fit hiện đại, t&ocirc;n d&aacute;ng, năng động, gi&uacute;p người mặc lu&ocirc;n tự tin khi sử dụng.</p>\r\n\r\n<p>✨ Đặc biệt đa dạng m&agrave;u sắc v&agrave; ph&ugrave; hợp cho cả nam v&agrave; nữ với bảng size linh hoạt.&nbsp;</p>', 70, 1, '2023-12-23 17:05:41', '2023-12-29 16:11:40', 0),
(43, 1, 'Áo Bóng Đá Đội Tuyển Anh Xanh Đen 2023-2024', '280000', 200000, 'assets/photos/Áo Bóng Đá Đội Tuyển Anh Xanh Đen 2023-2024.jpg', '', '<p>✨ Chất liệu 95% Poly &ndash; 5% Spandex tạo cảm gi&aacute;c mềm mại, chống nhăn hiệu quả, thấm h&uacute;t mồ h&ocirc;i tốt v&agrave; co gi&atilde;n thoải m&aacute;i, ph&ugrave; hợp khi chơi thể thao.&nbsp;</p>\r\n\r\n<p>✨ &Aacute;p dụng c&ocirc;ng nghệ Moisture - Wicking gi&uacute;p những chiếc &aacute;o đấu Kamito c&oacute; khả năng h&uacute;t ẩm cao v&agrave; bay hơi nhanh. Người mặc sẽ lu&ocirc;n cảm thấy nhẹ nh&agrave;ng v&agrave; kh&ocirc; tho&aacute;ng, hạn chế những m&ugrave;i ph&aacute;t sinh trong qu&aacute; tr&igrave;nh vận động cường độ cao.</p>\r\n\r\n<p>✨ Form &aacute;o body fit hiện đại, t&ocirc;n d&aacute;ng, năng động, gi&uacute;p người mặc lu&ocirc;n tự tin khi sử dụng.</p>\r\n\r\n<p>✨ Đặc biệt đa dạng m&agrave;u sắc v&agrave; ph&ugrave; hợp cho cả nam v&agrave; nữ với bảng size linh hoạt.&nbsp;</p>', 60, 1, '2023-12-23 17:11:27', '2023-12-29 16:10:45', 0),
(44, 1, 'Áo Bóng Đá Đội Tuyển Nhật Trắng Hồng 2023', '200000', 100000, 'assets/photos/Áo Bóng Đá Đội Tuyển Nhật Trắng Hồng 2023.jpg', '', '<p>CH&Iacute;NH S&Aacute;CH BẢO H&Agrave;NH</p>\r\n\r\n<p>- Đổi mới: 7 ng&agrave;y kể từ ng&agrave;y mua h&agrave;ng ghi tr&ecirc;n phiếu bảo h&agrave;nh</p>\r\n\r\n<p>-Sửa chữa: 90 ng&agrave;y kể từ ng&agrave;y mua h&agrave;ng ghi tr&ecirc;n phiếu bảo h&agrave;nh</p>\r\n\r\n<p>Bảo h&agrave;nh sản phẩm trong trường hợp gi&agrave;y bong keo, g&atilde;y, nứt đế gi&agrave;y do lỗi nh&agrave; sản xuất</p>\r\n\r\n<p>Tất cả sản phẩm tu&acirc;n theo điều khoản bảo h&agrave;nh tại thời điểm xuất h&oacute;a đơn cho mỗi kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p>TẠI SAO KH&Aacute;CH H&Agrave;NG LỰA CHỌN KAMITO</p>\r\n\r\n<p>Kamito đem đến những sản phẩm thể thao mang dấu ấn Nhật Bản.</p>\r\n\r\n<p>Chất liệu cao cấp, sử dụng c&ocirc;ng nghệ mới nhất v&agrave; sự tỉ mỉ qua từng chi tiết.</p>\r\n\r\n<p>Đến với Kamito, bạn dễ d&agrave;ng c&oacute; thể t&igrave;m được sản phẩm thể thao ưng &yacute; nhất bao gồm: trang phục, gi&agrave;y, balo, b&oacute;ng,.. ho&agrave;n to&agrave;n ph&ugrave; hợp với t&uacute;i tiền.</p>', 68, 1, '2023-12-23 17:13:56', '2023-12-23 17:13:56', 0),
(45, 1, 'Áo Bóng Đá Đội Tuyển Tây Ban Nha Xanh Ngọc 2023-2024', '290000', 200000, 'assets/photos/Áo Bóng Đá Đội Tuyển Tây Ban Nha Xanh Ngọc 2023-2024.jpg', '', '<p>Một d&acirc;n tộc đo&agrave;n kết. Được tạo ra từ DNA b&oacute;ng đ&aacute; đặc trưng của đội tuyển T&acirc;y Ban Nha, chiếc &aacute;o đấu s&acirc;n nh&agrave; kinh điển n&agrave;y nổi bật với m&agrave;u đỏ nổi tiếng của đội tuyển n&agrave;y. Tr&ecirc;n ngực &aacute;o l&agrave; c&aacute;c phi&ecirc;n bản dệt thoi của huy hiệu tuyển T&acirc;y Ban Nha mới c&ugrave;ng logo adidas 3 Bar nổi bật đầy tự h&agrave;o. C&ocirc;ng nghệ AEROREADY thấm h&uacute;t ẩm gi&uacute;p người h&acirc;m mộ lu&ocirc;n thoải m&aacute;i khi họ theo d&otilde;i từng pha b&oacute;ng tr&ecirc;n s&acirc;n khấu b&oacute;ng đ&aacute; lớn nhất. - D&aacute;ng slim fit - Cổ chữ V c&oacute; g&acirc;n sọc - Vải dệt tricot l&agrave;m từ 100% polyester t&aacute;i chế - C&ocirc;ng nghệ AEROREADY thấm h&uacute;t ẩm - C&aacute;c mảng phối lưới hai b&ecirc;n - Vạt sau d&agrave;i hơn</p>', 80, 1, '2023-12-23 17:16:08', '2023-12-23 17:16:08', 0),
(46, 1, 'Áo Bóng Đá CLB AI Nassr Trắng 2023-2024', '270000', 250000, 'assets/photos/Áo Bóng Đá CLB AI Nassr Trắng 2023-2024.jpg', '', '<p>TH&Ocirc;NG TIN SẢN PHẨM</p>\r\n\r\n<p>- Thương hiệu: KAMITO</p>\r\n\r\n<p>- Xuất xứ: Việt Nam</p>\r\n\r\n<p>- M&agrave;u sắc: T&iacute;m đen, Trắng đen, Xanh r&ecirc;u đen, Xanh b&iacute;ch, Xanh ngọc</p>\r\n\r\n<p>ƯU ĐIỂM NỔI TRỘI</p>\r\n\r\n<p>- Thiết kế ấn tượng với những vệt &aacute;nh s&aacute;ng nhiều m&agrave;u sắc tạo n&ecirc;n những chiếc &aacute;o đấu nổi bật tr&ecirc;n s&acirc;n cỏ.</p>\r\n\r\n<p>- Chất vải Polyester mềm mại, giảm nhăn hiệu quả, bền m&agrave;u v&agrave; tho&aacute;ng kh&iacute;,</p>\r\n\r\n<p>- &Aacute;p dụng c&ocirc;ng nghệ Moisture-Wicking gi&uacute;p những chiếc &aacute;o đấu Kamito c&oacute; khả năng h&uacute;t ẩm cao v&agrave; bay hơi nhanh. Người mặc sẽ lu&ocirc;n cảm thấy nhẹ nh&agrave;ng v&agrave; kh&ocirc; tho&aacute;ng, hạn chế những m&ugrave;i ph&aacute;t sinh trong qu&aacute; tr&igrave;nh vận động cường độ cao.</p>\r\n\r\n<p>- An to&agrave;n cho người ti&ecirc;u d&ugrave;ng, được chứng nhận bởi Viện Dệt may Việt Nam, kh&ocirc;ng chứa c&aacute;c chất g&acirc;y hại cho sức khỏe, vượt qua c&aacute;c thử nghiệm trong lồng giặt c&ocirc;ng suất cao, đảm bảo sự bền bỉ của từng sợi vải.</p>\r\n\r\n<p>- Thiết kế body fit hiện đại, t&ocirc;n d&aacute;ng, năng động, gi&uacute;p người mặc lu&ocirc;n tự tin khi sử dụng.</p>', 90, 1, '2023-12-23 17:17:51', '2023-12-23 17:17:51', 0),
(47, 1, 'Áo Bóng Đá CLB Fullham Trắng 2023-2024', '270000', 240000, 'assets/photos/Áo Bóng Đá CLB Fullham Trắng 2023-2024.jpg', '', '<p>* Chi tiết sản phẩm quần</p>\r\n\r\n<p>+ Chất thun lạnh co gi&atilde;n 4 chiều, thấm h&uacute;t mồ h&ocirc;i tốt, kh&ocirc; nhanh gấp 4 lần, mặc l&agrave; m&aacute;t.</p>\r\n\r\n<p>+ Trọng lượng nhẹ 200g, tập trung mang đến sự thoải m&aacute;i, kh&ocirc;ng bị co r&uacute;t, mềm mại theo từng cử động.</p>\r\n\r\n<p>+ Thiết kế chuy&ecirc;n đ&aacute; b&oacute;ng, cổ b&oacute;ng ch&agrave;y trẻ trung, năng động, thời thượng c&aacute; t&iacute;nh.</p>\r\n\r\n<p>+ Ấn tượng, thu h&uacute;t &aacute;nh nh&igrave;n với logo th&ecirc;u, mặc nh&agrave; ra ph&ograve;ng gym, đi đ&aacute; b&oacute;ng, chạy bộ hay xuống phố đều được ạ.</p>\r\n\r\n<p>+ Xuất xứ: Việt Nam</p>\r\n\r\n<p>ƯU ĐIỂM</p>\r\n\r\n<p>- Đường may tinh tế sắc sảo</p>\r\n\r\n<p>- Sản phẩm c&oacute; mức gi&aacute; trung b&igrave;nh, chất liệu đường may v&agrave; c&aacute;c chi tiết được thiết kế v&agrave; may tỉ mỉ.</p>\r\n\r\n<p>- &Aacute;o được thiết kế đẹp với đội ngũ design d&agrave;y dặn kinh nghiệm, chuẩn form, vải d&agrave;y, mịn, thấm h&uacute;t mồ h&ocirc;i tạo sự thoải m&aacute;i khi mặc!</p>\r\n\r\n<p>- Sản phẩm được gia c&ocirc;ng bởi những thợ may l&agrave;nh nghề, m&aacute;y m&oacute;c c&ocirc;ng nghệ hiện đại, sản phẩm đ&atilde; được đ&ocirc;ng đảo kh&aacute;ch h&agrave;ng tin d&ugrave;ng.</p>\r\n\r\n<p>- Những Sản phẩm được gấp hộp cẩn thận n&ecirc;n C&oacute; thể mặc hoặc l&agrave;m qu&agrave; tặng.</p>\r\n\r\n<p>✪ Hướng dẫn chọn size Bộ quần &aacute;o b&oacute;ng đ&aacute;</p>\r\n\r\n<p>&bull; Size S: 45-53kg,</p>\r\n\r\n<p>&bull; Size M : 54-62kg</p>\r\n\r\n<p>&bull; Size L : 63-70kg</p>\r\n\r\n<p>&bull; Size XL : 71-79kg</p>\r\n\r\n<p>&bull; Size XXL : 80-86kg</p>', 100, 1, '2023-12-23 17:20:02', '2023-12-23 17:20:02', 0),
(48, 1, 'Áo Bóng Đá CLB Inter Miami Trắng 2023-2024', '260000', 200000, 'assets/photos/Áo Bóng Đá CLB Inter Miami Trắng 2023-2024.jpg', '', '<p>* Chi tiết sản phẩm&nbsp;</p>\r\n\r\n<p>+ Chất thun lạnh co gi&atilde;n 4 chiều, thấm h&uacute;t mồ h&ocirc;i tốt, kh&ocirc; nhanh gấp 4 lần, mặc l&agrave; m&aacute;t.</p>\r\n\r\n<p>+ Trọng lượng nhẹ 200g, tập trung mang đến sự thoải m&aacute;i, kh&ocirc;ng bị co r&uacute;t, mềm mại theo từng cử động.</p>\r\n\r\n<p>+ Thiết kế chuy&ecirc;n đ&aacute; b&oacute;ng, cổ b&oacute;ng ch&agrave;y trẻ trung, năng động, thời thượng c&aacute; t&iacute;nh.</p>\r\n\r\n<p>+ Ấn tượng, thu h&uacute;t &aacute;nh nh&igrave;n với logo th&ecirc;u, mặc nh&agrave; ra ph&ograve;ng gym, đi đ&aacute; b&oacute;ng, chạy bộ hay xuống phố đều được ạ.</p>\r\n\r\n<p>+ Xuất xứ: Việt Nam</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ƯU ĐIỂM</p>\r\n\r\n<p>- Đường may tinh tế sắc sảo</p>\r\n\r\n<p>- Sản phẩm c&oacute; mức gi&aacute; trung b&igrave;nh, chất liệu đường may v&agrave; c&aacute;c chi tiết được thiết kế v&agrave; may tỉ mỉ.</p>\r\n\r\n<p>- &Aacute;o được thiết kế đẹp với đội ngũ design d&agrave;y dặn kinh nghiệm, chuẩn form, vải d&agrave;y, mịn, thấm h&uacute;t mồ h&ocirc;i tạo sự thoải m&aacute;i khi mặc!</p>\r\n\r\n<p>- Sản phẩm được gia c&ocirc;ng bởi những thợ may l&agrave;nh nghề, m&aacute;y m&oacute;c c&ocirc;ng nghệ hiện đại, sản phẩm đ&atilde; được đ&ocirc;ng đảo kh&aacute;ch h&agrave;ng tin d&ugrave;ng.</p>\r\n\r\n<p>- Những Sản phẩm được gấp hộp cẩn thận n&ecirc;n C&oacute; thể mặc hoặc l&agrave;m qu&agrave; tặng.</p>\r\n\r\n<p>✪ Hướng dẫn chọn size Bộ quần &aacute;o b&oacute;ng đ&aacute;</p>\r\n\r\n<p>&bull; Size S: 45-53kg,</p>\r\n\r\n<p>&bull; Size M : 54-62kg</p>\r\n\r\n<p>&bull; Size L : 63-70kg</p>\r\n\r\n<p>&bull; Size XL : 71-79kg</p>\r\n\r\n<p>&bull; Size XXL : 80-86kg</p>', 74, 1, '2023-12-23 17:22:01', '2023-12-23 17:22:01', 0),
(49, 1, 'Áo Bóng Đá Không Logo JustPlay JSX Cam', '260000', 200000, 'assets/photos/Áo Bóng Đá Không Logo JustPlay JSX Cam.jpg', '', '<p>* Chi tiết sản phẩm&nbsp;</p>\r\n\r\n<p>+ Chất thun lạnh co gi&atilde;n 4 chiều, thấm h&uacute;t mồ h&ocirc;i tốt, kh&ocirc; nhanh gấp 4 lần, mặc l&agrave; m&aacute;t.</p>\r\n\r\n<p>+ Trọng lượng nhẹ 200g, tập trung mang đến sự thoải m&aacute;i, kh&ocirc;ng bị co r&uacute;t, mềm mại theo từng cử động.</p>\r\n\r\n<p>+ Thiết kế chuy&ecirc;n đ&aacute; b&oacute;ng, cổ b&oacute;ng ch&agrave;y trẻ trung, năng động, thời thượng c&aacute; t&iacute;nh.</p>\r\n\r\n<p>+ Ấn tượng, thu h&uacute;t &aacute;nh nh&igrave;n với logo th&ecirc;u, mặc nh&agrave; ra ph&ograve;ng gym, đi đ&aacute; b&oacute;ng, chạy bộ hay xuống phố đều được ạ.</p>\r\n\r\n<p>+ Xuất xứ: Việt Nam</p>\r\n\r\n<p>ƯU ĐIỂM</p>\r\n\r\n<p>- Đường may tinh tế sắc sảo</p>\r\n\r\n<p>- Sản phẩm c&oacute; mức gi&aacute; trung b&igrave;nh, chất liệu đường may v&agrave; c&aacute;c chi tiết được thiết kế v&agrave; may tỉ mỉ.</p>\r\n\r\n<p>- &Aacute;o được thiết kế đẹp với đội ngũ design d&agrave;y dặn kinh nghiệm, chuẩn form, vải d&agrave;y, mịn, thấm h&uacute;t mồ h&ocirc;i tạo sự thoải m&aacute;i khi mặc!</p>\r\n\r\n<p>- Sản phẩm được gia c&ocirc;ng bởi những thợ may l&agrave;nh nghề, m&aacute;y m&oacute;c c&ocirc;ng nghệ hiện đại, sản phẩm đ&atilde; được đ&ocirc;ng đảo kh&aacute;ch h&agrave;ng tin d&ugrave;ng.</p>\r\n\r\n<p>- Những Sản phẩm được gấp hộp cẩn thận n&ecirc;n C&oacute; thể mặc hoặc l&agrave;m qu&agrave; tặng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>✪ Hướng dẫn chọn size Bộ quần &aacute;o b&oacute;ng đ&aacute;</p>\r\n\r\n<p>&bull; Size S: 45-53kg,</p>\r\n\r\n<p>&bull; Size M : 54-62kg</p>\r\n\r\n<p>&bull; Size L : 63-70kg</p>\r\n\r\n<p>&bull; Size XL : 71-79kg</p>\r\n\r\n<p>&bull; Size XXL : 80-86kg</p>', 100, 1, '2023-12-23 17:23:03', '2023-12-23 17:23:03', 0);
INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `discount`, `image`, `brand`, `description`, `quantity`, `active`, `created_at`, `updated_at`, `deleted`) VALUES
(50, 1, 'Áo Bóng Đá Không Logo JustPlay JSX Trắng Đỏ', '260000', 230000, 'assets/photos/Áo Bóng Đá Không Logo JustPlay JSX Trắng Đỏ.jpg', '', '<p>Chi tiết sản phẩm</p>\r\n\r\n<p>+ Chất thun lạnh co gi&atilde;n 4 chiều, thấm h&uacute;t mồ h&ocirc;i tốt, kh&ocirc; nhanh gấp 4 lần, mặc l&agrave; m&aacute;t.</p>\r\n\r\n<p>+ Trọng lượng nhẹ 200g, tập trung mang đến sự thoải m&aacute;i, kh&ocirc;ng bị co r&uacute;t, mềm mại theo từng cử động.</p>\r\n\r\n<p>+ Thiết kế chuy&ecirc;n đ&aacute; b&oacute;ng, cổ b&oacute;ng ch&agrave;y trẻ trung, năng động, thời thượng c&aacute; t&iacute;nh.</p>\r\n\r\n<p>+ Ấn tượng, thu h&uacute;t &aacute;nh nh&igrave;n với logo th&ecirc;u, mặc nh&agrave; ra ph&ograve;ng gym, đi đ&aacute; b&oacute;ng, chạy bộ hay xuống phố đều được ạ.</p>\r\n\r\n<p>+ Xuất xứ: Việt Nam</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ƯU ĐIỂM</p>\r\n\r\n<p>- Đường may tinh tế sắc sảo</p>\r\n\r\n<p>- Sản phẩm c&oacute; mức gi&aacute; trung b&igrave;nh, chất liệu đường may v&agrave; c&aacute;c chi tiết được thiết kế v&agrave; may tỉ mỉ.</p>\r\n\r\n<p>- &Aacute;o được thiết kế đẹp với đội ngũ design d&agrave;y dặn kinh nghiệm, chuẩn form, vải d&agrave;y, mịn, thấm h&uacute;t mồ h&ocirc;i tạo sự thoải m&aacute;i khi mặc!</p>\r\n\r\n<p>- Sản phẩm được gia c&ocirc;ng bởi những thợ may l&agrave;nh nghề, m&aacute;y m&oacute;c c&ocirc;ng nghệ hiện đại, sản phẩm đ&atilde; được đ&ocirc;ng đảo kh&aacute;ch h&agrave;ng tin d&ugrave;ng.</p>\r\n\r\n<p>- Những Sản phẩm được gấp hộp cẩn thận n&ecirc;n C&oacute; thể mặc hoặc l&agrave;m qu&agrave; tặng.</p>\r\n\r\n<p>✪ Hướng dẫn chọn size Bộ quần &aacute;o b&oacute;ng đ&aacute;</p>\r\n\r\n<p>&bull; Size S: 45-53kg,</p>\r\n\r\n<p>&bull; Size M : 54-62kg</p>\r\n\r\n<p>&bull; Size L : 63-70kg</p>\r\n\r\n<p>&bull; Size XL : 71-79kg</p>\r\n\r\n<p>&bull; Size XXL : 80-86kg</p>', 120, 1, '2023-12-23 17:24:03', '2023-12-23 17:24:03', 0),
(51, 1, 'Áo Bóng Đá Không Logo JustPlay JSX Trắng Kem', '300000', 250000, 'assets/photos/Áo Bóng Đá Không Logo JustPlay JSX Trắng Kem.jpg', '', '<p>* Chi tiết sản phẩm&nbsp;</p>\r\n\r\n<p>+ Chất thun lạnh co gi&atilde;n 4 chiều, thấm h&uacute;t mồ h&ocirc;i tốt, kh&ocirc; nhanh gấp 4 lần, mặc l&agrave; m&aacute;t.</p>\r\n\r\n<p>+ Trọng lượng nhẹ 200g, tập trung mang đến sự thoải m&aacute;i, kh&ocirc;ng bị co r&uacute;t, mềm mại theo từng cử động.</p>\r\n\r\n<p>+ Thiết kế chuy&ecirc;n đ&aacute; b&oacute;ng, cổ b&oacute;ng ch&agrave;y trẻ trung, năng động, thời thượng c&aacute; t&iacute;nh.</p>\r\n\r\n<p>+ Ấn tượng, thu h&uacute;t &aacute;nh nh&igrave;n với logo th&ecirc;u, mặc nh&agrave; ra ph&ograve;ng gym, đi đ&aacute; b&oacute;ng, chạy bộ hay xuống phố đều được ạ.</p>\r\n\r\n<p>+ Xuất xứ: Việt Nam</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ƯU ĐIỂM</p>\r\n\r\n<p>- Đường may tinh tế sắc sảo</p>\r\n\r\n<p>- Sản phẩm c&oacute; mức gi&aacute; trung b&igrave;nh, chất liệu đường may v&agrave; c&aacute;c chi tiết được thiết kế v&agrave; may tỉ mỉ.</p>\r\n\r\n<p>- &Aacute;o được thiết kế đẹp với đội ngũ design d&agrave;y dặn kinh nghiệm, chuẩn form, vải d&agrave;y, mịn, thấm h&uacute;t mồ h&ocirc;i tạo sự thoải m&aacute;i khi mặc!</p>\r\n\r\n<p>- Sản phẩm được gia c&ocirc;ng bởi những thợ may l&agrave;nh nghề, m&aacute;y m&oacute;c c&ocirc;ng nghệ hiện đại, sản phẩm đ&atilde; được đ&ocirc;ng đảo kh&aacute;ch h&agrave;ng tin d&ugrave;ng.</p>\r\n\r\n<p>- Những Sản phẩm được gấp hộp cẩn thận n&ecirc;n C&oacute; thể mặc hoặc l&agrave;m qu&agrave; tặng.</p>\r\n\r\n<p>✪ Hướng dẫn chọn size Bộ quần &aacute;o b&oacute;ng đ&aacute;</p>\r\n\r\n<p>&bull; Size S: 45-53kg,</p>\r\n\r\n<p>&bull; Size M : 54-62kg</p>\r\n\r\n<p>&bull; Size L : 63-70kg</p>\r\n\r\n<p>&bull; Size XL : 71-79kg</p>\r\n\r\n<p>&bull; Size XXL : 80-86kg</p>', 148, 1, '2023-12-23 17:24:54', '2023-12-23 17:24:54', 0),
(52, 1, 'Áo Bóng Đá Không Logo JustPlay JSX Trắng Xanh', '240000', 200000, 'assets/photos/Áo Bóng Đá Không Logo JustPlay JSX Trắng Xanh.jpg', '', '<p>* Chi tiết sản phẩm</p>\r\n\r\n<p>+ Chất thun lạnh co gi&atilde;n 4 chiều, thấm h&uacute;t mồ h&ocirc;i tốt, kh&ocirc; nhanh gấp 4 lần, mặc l&agrave; m&aacute;t.</p>\r\n\r\n<p>+ Trọng lượng nhẹ 200g, tập trung mang đến sự thoải m&aacute;i, kh&ocirc;ng bị co r&uacute;t, mềm mại theo từng cử động.</p>\r\n\r\n<p>+ Thiết kế chuy&ecirc;n đ&aacute; b&oacute;ng, cổ b&oacute;ng ch&agrave;y trẻ trung, năng động, thời thượng c&aacute; t&iacute;nh.</p>\r\n\r\n<p>+ Ấn tượng, thu h&uacute;t &aacute;nh nh&igrave;n với logo th&ecirc;u, mặc nh&agrave; ra ph&ograve;ng gym, đi đ&aacute; b&oacute;ng, chạy bộ hay xuống phố đều được ạ.</p>\r\n\r\n<p>+ Xuất xứ: Việt Nam</p>\r\n\r\n<p>ƯU ĐIỂM</p>\r\n\r\n<p>- Đường may tinh tế sắc sảo</p>\r\n\r\n<p>- Sản phẩm c&oacute; mức gi&aacute; trung b&igrave;nh, chất liệu đường may v&agrave; c&aacute;c chi tiết được thiết kế v&agrave; may tỉ mỉ.</p>\r\n\r\n<p>- &Aacute;o được thiết kế đẹp với đội ngũ design d&agrave;y dặn kinh nghiệm, chuẩn form, vải d&agrave;y, mịn, thấm h&uacute;t mồ h&ocirc;i tạo sự thoải m&aacute;i khi mặc!</p>\r\n\r\n<p>- Sản phẩm được gia c&ocirc;ng bởi những thợ may l&agrave;nh nghề, m&aacute;y m&oacute;c c&ocirc;ng nghệ hiện đại, sản phẩm đ&atilde; được đ&ocirc;ng đảo kh&aacute;ch h&agrave;ng tin d&ugrave;ng.</p>\r\n\r\n<p>- Những Sản phẩm được gấp hộp cẩn thận n&ecirc;n C&oacute; thể mặc hoặc l&agrave;m qu&agrave; tặng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>✪ Hướng dẫn chọn size Bộ quần &aacute;o b&oacute;ng đ&aacute;</p>\r\n\r\n<p>&bull; Size S: 45-53kg,</p>\r\n\r\n<p>&bull; Size M : 54-62kg</p>\r\n\r\n<p>&bull; Size L : 63-70kg</p>\r\n\r\n<p>&bull; Size XL : 71-79kg</p>\r\n\r\n<p>&bull; Size XXL : 80-86kg</p>', 180, 1, '2023-12-23 17:25:43', '2023-12-23 17:25:43', 0),
(53, 1, 'Áo Bóng Đá Không Logo JustPlay JSX Xám Hồng', '300000', 270000, 'assets/photos/Áo Bóng Đá Không Logo JustPlay JSX Xám Hồng.jpg', '', '<p>* Chi tiết sản phẩm&nbsp;</p>\r\n\r\n<p>+ Chất thun lạnh co gi&atilde;n 4 chiều, thấm h&uacute;t mồ h&ocirc;i tốt, kh&ocirc; nhanh gấp 4 lần, mặc l&agrave; m&aacute;t.</p>\r\n\r\n<p>+ Trọng lượng nhẹ 200g, tập trung mang đến sự thoải m&aacute;i, kh&ocirc;ng bị co r&uacute;t, mềm mại theo từng cử động.</p>\r\n\r\n<p>+ Thiết kế chuy&ecirc;n đ&aacute; b&oacute;ng, cổ b&oacute;ng ch&agrave;y trẻ trung, năng động, thời thượng c&aacute; t&iacute;nh.</p>\r\n\r\n<p>+ Ấn tượng, thu h&uacute;t &aacute;nh nh&igrave;n với logo th&ecirc;u, mặc nh&agrave; ra ph&ograve;ng gym, đi đ&aacute; b&oacute;ng, chạy bộ hay xuống phố đều được ạ.</p>\r\n\r\n<p>+ Xuất xứ: Việt Nam</p>\r\n\r\n<p>ƯU ĐIỂM</p>\r\n\r\n<p>- Đường may tinh tế sắc sảo</p>\r\n\r\n<p>- Sản phẩm c&oacute; mức gi&aacute; trung b&igrave;nh, chất liệu đường may v&agrave; c&aacute;c chi tiết được thiết kế v&agrave; may tỉ mỉ.</p>\r\n\r\n<p>- &Aacute;o được thiết kế đẹp với đội ngũ design d&agrave;y dặn kinh nghiệm, chuẩn form, vải d&agrave;y, mịn, thấm h&uacute;t mồ h&ocirc;i tạo sự thoải m&aacute;i khi mặc!</p>\r\n\r\n<p>- Sản phẩm được gia c&ocirc;ng bởi những thợ may l&agrave;nh nghề, m&aacute;y m&oacute;c c&ocirc;ng nghệ hiện đại, sản phẩm đ&atilde; được đ&ocirc;ng đảo kh&aacute;ch h&agrave;ng tin d&ugrave;ng.</p>\r\n\r\n<p>- Những Sản phẩm được gấp hộp cẩn thận n&ecirc;n C&oacute; thể mặc hoặc l&agrave;m qu&agrave; tặng.</p>\r\n\r\n<p>✪ Hướng dẫn chọn size Bộ quần &aacute;o b&oacute;ng đ&aacute;</p>\r\n\r\n<p>&bull; Size S: 45-53kg,</p>\r\n\r\n<p>&bull; Size M : 54-62kg</p>\r\n\r\n<p>&bull; Size L : 63-70kg</p>\r\n\r\n<p>&bull; Size XL : 71-79kg</p>\r\n\r\n<p>&bull; Size XXL : 80-86kg</p>', 145, 1, '2023-12-23 17:26:33', '2023-12-23 17:26:33', 0),
(54, 2, 'Áo tập gym nữ ngắn tay T05', '159000', 150000, 'assets/photos/Áo tập gym nữ ngắn tay T05.jpg', '', '<p>1. TH&Ocirc;NG TIN SẢN PHẨM</p>\r\n\r\n<p>- Chất liệu: 80% polyeste, 10% spandex, 10% elastine</p>\r\n\r\n<p>- Đặc điểm thiết kế: ngắn tay, &ocirc;m s&aacute;t cơ thể, t&ocirc;n l&ecirc;n v&ograve;ng 1 v&agrave; v&ograve;ng 2</p>\r\n\r\n<p>- Size: S, M, L</p>\r\n\r\n<p>2. BẢNG SIZE</p>\r\n\r\n<p>Size S: dưới 48kg</p>\r\n\r\n<p>Size M: 49~56kg</p>\r\n\r\n<p>Size L: 57~64kg</p>\r\n\r\n<p>3. CH&Iacute;NH S&Aacute;CH B&Aacute;N H&Agrave;NG</p>\r\n\r\n<p>SHOP cam kết với kh&aacute;ch h&agrave;ng về sản phẩm:&nbsp;</p>\r\n\r\n<p>- Sản phẩm thật cam kết 100% như m&ocirc; tả</p>\r\n\r\n<p>- Tư vấn nhiệt t&igrave;nh, chu đ&aacute;o lu&ocirc;n lắng nghe kh&aacute;ch h&agrave;ng</p>\r\n\r\n<p>- Giao h&agrave;ng nhanh nhất c&oacute; thể</p>\r\n\r\n<p>- Sản phẩm được kiểm tra kỹ c&agrave;ng, cẩn thận trước khi g&oacute;i giao h&agrave;ng cho Qu&yacute; kh&aacute;ch.</p>\r\n\r\n<p>- H&agrave;ng c&oacute; sẵn, giao ngay khi ph&aacute;t sinh đơn.</p>\r\n\r\n<p>- Cam kết 100% đổi size nếu sản phẩm kh&aacute;ch đặt kh&ocirc;ng vừa (hỗ trợ đổi size trong v&ograve;ng 7 ng&agrave;y).</p>\r\n\r\n<p>- Đổi trả theo quy định ch&iacute;nh s&aacute;ch của Shopee.</p>\r\n\r\n<p>- Giao h&agrave;ng to&agrave;n quốc, nhận h&agrave;ng thanh to&aacute;n.</p>\r\n\r\n<p>- Hotline hỗ trợ: 0987.855.580</p>\r\n\r\n<p>4. CH&Iacute;NH S&Aacute;CH ĐỔI TRẢ</p>\r\n\r\n<p>- C&aacute;c trường hợp được chấp nhận đổi trả</p>\r\n\r\n<p>+ H&agrave;ng ho&aacute; vẫn c&ograve;n mới nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng.</p>\r\n\r\n<p>+ H&agrave;ng ho&aacute; bị lỗi hoặc hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>- C&aacute;c trường hợp kh&ocirc;ng được đổi trả:</p>\r\n\r\n<p>+ Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng từ shopee.</p>\r\n\r\n<p>+ Gửi lại h&agrave;ng kh&ocirc;ng đ&uacute;ng mẫu m&atilde;, kh&ocirc;ng phải sản phẩm của shop.</p>', 190, 1, '2023-12-23 17:41:05', '2023-12-23 17:41:05', 0),
(55, 2, 'Áo tập gym nữ T03', '380000', 340000, 'assets/photos/Áo tập gym nữ T03.jpg', '', '<p>1. TH&Ocirc;NG TIN SẢN PHẨM</p>\r\n\r\n<p>- Chất liệu: 80% polyeste, 10% spandex, 10% elastine</p>\r\n\r\n<p>- Đặc điểm thiết kế: ngắn tay, &ocirc;m s&aacute;t cơ thể, t&ocirc;n l&ecirc;n v&ograve;ng 1 v&agrave; v&ograve;ng 2</p>\r\n\r\n<p>- Size: S, M, L</p>\r\n\r\n<p>2. BẢNG SIZE</p>\r\n\r\n<p>Size S: dưới 48kg</p>\r\n\r\n<p>Size M: 49~56kg</p>\r\n\r\n<p>Size L: 57~64kg</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>3. CH&Iacute;NH S&Aacute;CH B&Aacute;N H&Agrave;NG</p>\r\n\r\n<p>SHOP cam kết với kh&aacute;ch h&agrave;ng về sản phẩm</p>\r\n\r\n<p>- Sản phẩm thật cam kết 100% như m&ocirc; tả</p>\r\n\r\n<p>- Tư vấn nhiệt t&igrave;nh, chu đ&aacute;o lu&ocirc;n lắng nghe kh&aacute;ch h&agrave;ng</p>\r\n\r\n<p>- Giao h&agrave;ng nhanh nhất c&oacute; thể</p>\r\n\r\n<p>- Sản phẩm được kiểm tra kỹ c&agrave;ng, cẩn thận trước khi g&oacute;i giao h&agrave;ng cho Qu&yacute; kh&aacute;ch.</p>\r\n\r\n<p>- H&agrave;ng c&oacute; sẵn, giao ngay khi ph&aacute;t sinh đơn.</p>\r\n\r\n<p>- Cam kết 100% đổi size nếu sản phẩm kh&aacute;ch đặt kh&ocirc;ng vừa (hỗ trợ đổi size trong v&ograve;ng 7 ng&agrave;y).</p>\r\n\r\n<p>- Đổi trả theo quy định ch&iacute;nh s&aacute;ch của Shopee.</p>\r\n\r\n<p>- Giao h&agrave;ng to&agrave;n quốc, nhận h&agrave;ng thanh to&aacute;n.</p>\r\n\r\n<p>- Hotline hỗ trợ: 0987.855.580</p>\r\n\r\n<p>4. CH&Iacute;NH S&Aacute;CH ĐỔI TRẢ</p>\r\n\r\n<p>- C&aacute;c trường hợp được chấp nhận đổi trả</p>\r\n\r\n<p>+ H&agrave;ng ho&aacute; vẫn c&ograve;n mới nguy&ecirc;n tem m&aacute;c, chưa qua sử dụng.</p>\r\n\r\n<p>+ H&agrave;ng ho&aacute; bị lỗi hoặc hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>- C&aacute;c trường hợp kh&ocirc;ng được đổi trả:</p>\r\n\r\n<p>+ Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng từ shopee.</p>\r\n\r\n<p>+ Gửi lại h&agrave;ng kh&ocirc;ng đ&uacute;ng mẫu m&atilde;, kh&ocirc;ng phải sản phẩm của shop.</p>', 200, 1, '2023-12-23 17:42:33', '2023-12-23 17:42:33', 0),
(56, 2, 'Quần short tập gym nữ Q02', '300000', 260000, 'assets/photos/Quần short tập gym nữ Q02.jpg', '', '<p>Vải polyester tho&aacute;ng kh&iacute;, giữ cho bạn m&aacute;t mẻ trong khi tập thể dục.</p>\r\n\r\n<p>Thắt lưng đ&agrave;n hồi với d&acirc;y r&uacute;t b&ecirc;n trong c&oacute; thể điều chỉnh cho ph&ugrave; hợp t&ugrave;y chỉnh v&agrave; thoải m&aacute;i.</p>\r\n\r\n<p>Lớp l&oacute;t tạo sự thoải m&aacute;i tối ưu v&agrave; bảo vệ ri&ecirc;ng tư.</p>\r\n\r\n<p>Lưng thun c&oacute; d&acirc;y r&uacute;t cho ph&ugrave; hợp thoải m&aacute;i.</p>\r\n\r\n<p>Trọng lượng nhẹ v&agrave; cực kỳ mềm mại.</p>\r\n\r\n<p>H&uacute;t ẩm, tho&aacute;ng kh&iacute;, nhanh kh&ocirc;.</p>\r\n\r\n<p>T&uacute;i c&oacute; kh&oacute;a k&eacute;o để lưu trữ ch&igrave;a kh&oacute;a, m&aacute;y nghe nhạc MP</p>\r\n\r\n<p>Th&iacute;ch hợp cho nhiều m&ocirc;n thể thao ngo&agrave;i trời, chẳng hạn như chạy, cắm trại, đi xe đạp, đi bộ đường d&agrave;i</p>', 230, 1, '2023-12-23 17:43:54', '2023-12-23 17:43:54', 0),
(57, 2, 'Quần short 2 lớp ASRV Z200', '310000', 270000, 'assets/photos/Quần short 2 lớp ASRV Z200.jpg', '', '<p>Vải polyester tho&aacute;ng kh&iacute;, giữ cho bạn m&aacute;t mẻ trong khi tập thể dục.</p>\r\n\r\n<p>Thắt lưng đ&agrave;n hồi với d&acirc;y r&uacute;t b&ecirc;n trong c&oacute; thể điều chỉnh cho ph&ugrave; hợp t&ugrave;y chỉnh v&agrave; thoải m&aacute;i.</p>\r\n\r\n<p>Lớp l&oacute;t tạo sự thoải m&aacute;i tối ưu v&agrave; bảo vệ ri&ecirc;ng tư.</p>\r\n\r\n<p>Lưng thun c&oacute; d&acirc;y r&uacute;t cho ph&ugrave; hợp thoải m&aacute;i.</p>\r\n\r\n<p>Trọng lượng nhẹ v&agrave; cực kỳ mềm mại.</p>\r\n\r\n<p>H&uacute;t ẩm, tho&aacute;ng kh&iacute;, nhanh kh&ocirc;.</p>\r\n\r\n<p>T&uacute;i c&oacute; kh&oacute;a k&eacute;o để lưu trữ ch&igrave;a kh&oacute;a, m&aacute;y nghe nhạc MP</p>\r\n\r\n<p>Th&iacute;ch hợp cho nhiều m&ocirc;n thể thao ngo&agrave;i trời, chẳng hạn như chạy, cắm trại, đi xe đạp, đi bộ đường d&agrave;i</p>', 230, 1, '2023-12-23 17:44:36', '2023-12-23 17:44:36', 0),
(58, 2, 'Quần short tập gym nam 2 lớp Z267', '300000', 270000, 'assets/photos/Quần short tập gym nam 2 lớp Z267.jpg', '', '<p>Vải polyester tho&aacute;ng kh&iacute;, giữ cho bạn m&aacute;t mẻ trong khi tập thể dục.</p>\r\n\r\n<p>Thắt lưng đ&agrave;n hồi với d&acirc;y r&uacute;t b&ecirc;n trong c&oacute; thể điều chỉnh cho ph&ugrave; hợp t&ugrave;y chỉnh v&agrave; thoải m&aacute;i.</p>\r\n\r\n<p>Lớp l&oacute;t tạo sự thoải m&aacute;i tối ưu v&agrave; bảo vệ ri&ecirc;ng tư.</p>\r\n\r\n<p>Lưng thun c&oacute; d&acirc;y r&uacute;t cho ph&ugrave; hợp thoải m&aacute;i.</p>\r\n\r\n<p>Trọng lượng nhẹ v&agrave; cực kỳ mềm mại.</p>\r\n\r\n<p>H&uacute;t ẩm, tho&aacute;ng kh&iacute;, nhanh kh&ocirc;.</p>\r\n\r\n<p>T&uacute;i c&oacute; kh&oacute;a k&eacute;o để lưu trữ ch&igrave;a kh&oacute;a, m&aacute;y nghe nhạc MP</p>\r\n\r\n<p>Th&iacute;ch hợp cho nhiều m&ocirc;n thể thao ngo&agrave;i trời, chẳng hạn như chạy, cắm trại, đi xe đạp, đi bộ đường d&agrave;i</p>', 300, 1, '2023-12-23 17:45:55', '2023-12-23 17:45:55', 0),
(59, 2, 'Quần short tập gym nam ASRV Z201', '320000', 290000, 'assets/photos/Quần short tập gym nam ASRV Z201.jpg', '', '<p>Vải polyester tho&aacute;ng kh&iacute;, giữ cho bạn m&aacute;t mẻ trong khi tập thể dục.</p>\r\n\r\n<p>Thắt lưng đ&agrave;n hồi với d&acirc;y r&uacute;t b&ecirc;n trong c&oacute; thể điều chỉnh cho ph&ugrave; hợp t&ugrave;y chỉnh v&agrave; thoải m&aacute;i.</p>\r\n\r\n<p>Lớp l&oacute;t tạo sự thoải m&aacute;i tối ưu v&agrave; bảo vệ ri&ecirc;ng tư.</p>\r\n\r\n<p>Lưng thun c&oacute; d&acirc;y r&uacute;t cho ph&ugrave; hợp thoải m&aacute;i.</p>\r\n\r\n<p>Trọng lượng nhẹ v&agrave; cực kỳ mềm mại.</p>\r\n\r\n<p>H&uacute;t ẩm, tho&aacute;ng kh&iacute;, nhanh kh&ocirc;.</p>\r\n\r\n<p>T&uacute;i c&oacute; kh&oacute;a k&eacute;o để lưu trữ ch&igrave;a kh&oacute;a, m&aacute;y nghe nhạc MP</p>\r\n\r\n<p>Th&iacute;ch hợp cho nhiều m&ocirc;n thể thao ngo&agrave;i trời, chẳng hạn như chạy, cắm trại, đi xe đạp, đi bộ đường d&agrave;i</p>', 389, 1, '2023-12-23 17:46:38', '2023-12-23 17:46:38', 0),
(60, 2, 'Quần Squat Shorts tập gym 2 lớp ASRV Z203', '340000', 310000, 'assets/photos/Quần Squat Shorts tập gym 2 lớp ASRV Z203.jpg', '', '<p>Vải polyester tho&aacute;ng kh&iacute;, giữ cho bạn m&aacute;t mẻ trong khi tập thể dục.</p>\r\n\r\n<p>Thắt lưng đ&agrave;n hồi với d&acirc;y r&uacute;t b&ecirc;n trong c&oacute; thể điều chỉnh cho ph&ugrave; hợp t&ugrave;y chỉnh v&agrave; thoải m&aacute;i.</p>\r\n\r\n<p>Lớp l&oacute;t tạo sự thoải m&aacute;i tối ưu v&agrave; bảo vệ ri&ecirc;ng tư.</p>\r\n\r\n<p>Lưng thun c&oacute; d&acirc;y r&uacute;t cho ph&ugrave; hợp thoải m&aacute;i.</p>\r\n\r\n<p>Trọng lượng nhẹ v&agrave; cực kỳ mềm mại.</p>\r\n\r\n<p>H&uacute;t ẩm, tho&aacute;ng kh&iacute;, nhanh kh&ocirc;.</p>\r\n\r\n<p>T&uacute;i c&oacute; kh&oacute;a k&eacute;o để lưu trữ ch&igrave;a kh&oacute;a, m&aacute;y nghe nhạc MP</p>\r\n\r\n<p>Th&iacute;ch hợp cho nhiều m&ocirc;n thể thao ngo&agrave;i trời, chẳng hạn như chạy, cắm trại, đi xe đạp, đi bộ đường d&agrave;i</p>', 310, 1, '2023-12-23 17:47:22', '2023-12-23 17:47:22', 0),
(61, 4, 'Khăn Trải Thảm Tập Yoga just gently', '600000', 590000, 'assets/photos/Khăn Trải Thảm Tập Yoga.jpg', '', '<p>- Đ&ocirc;̣ nhám: Mặt cao su &ocirc;m s&aacute;t thảm gi&uacute;p bạn kh&ocirc;ng bị trượt trong khi luyện tập.</p>\r\n\r\n<p>- Đ&ocirc;̣ th&acirc;́m hút: Một mặt bằng vi sợi gi&uacute;p thấm h&uacute;t mồ h&ocirc;i tạo đ&ocirc;̣ bám t&ocirc;́i đa.</p>\r\n\r\n<p>- D&ecirc;̃ bảo quản: Giặt máy ở 30&deg;C. Phơi tr&ecirc;n bề mặt phẳng.Kh&ocirc;ng d&ugrave;ng nước xả vải.</p>\r\n\r\n<p>- D&ecirc;̃ học: Đường thẳng ở giữa để bạn căn chỉnh động t&aacute;c.</p>\r\n\r\n<p>- D&ecirc;̃ v&acirc;̣n chuy&ecirc;̉n: Gấp hay cuộn lại để mang đi bất cứ đ&acirc;u.</p>\r\n\r\n<p>- Độ thoải m&aacute;i người d&ugrave;ng: Khăn dùng đ&ecirc;̉ đặt phía tr&ecirc;n thảm yoga.TH&Ocirc;NG TIN CHI TIẾT SẢN PHẨM</p>\r\n\r\n<p>- Cỡ: Khăn d&agrave;i 183 cm v&agrave; rộng 61 cm.</p>', 1000, 1, '2023-12-23 17:56:54', '2023-12-23 19:05:59', 0),
(62, 4, 'Thảm Yoga Định Tuyến TPE 8mm -  luxury', '1500000', 1260000, 'assets/photos/Thảm Yoga Định Tuyến TPE 8mm.jpg', '', '<p>- K&iacute;ch thước thảm rộng thoải m&aacute;i thực hiện nhiều tư thế kh&aacute;c nhau. Cho d&ugrave; bạn thực h&agrave;nh Hatha, Ashtanga, Vinyasa Flow, Jivamukti hay Iyengar, thảm lu&ocirc;n đảm bảo được sự đ&agrave;n hồi, tối ưu khung xương.</p>\r\n\r\n<p>- Thảm c&oacute; độ đ&agrave;n hồi cao, &ecirc;m &aacute;i, bảo vệ tối ưu khung xương khi tập c&aacute;c động t&aacute;c g&acirc;y &aacute;p lực cho xương, kh&ocirc;ng chứa bất kỳ &ldquo;kim loại nặng&rdquo; c&oacute; hại n&agrave;o như ch&igrave; v&agrave; cadmium.</p>\r\n\r\n<p>- Khả năng chống trơn trượt tốt tạo điều kiện tốt cho bạn trong l&uacute;c tập luyện hay vệ sinh thảm.</p>\r\n\r\n<p>Th&ocirc;ng Tin Chi Tiết Thảm Yoga 2 Lớp Định Tuyến TPE :</p>\r\n\r\n<p>- Th&ocirc;ng số kỹ thuật: D&agrave;i 1,83m; Rộng 0,61m; D&agrave;y 0.8mm</p>\r\n\r\n<p>- Chất liệu: TPE cao cấp</p>\r\n\r\n<p>- M&agrave;u sắc: Nhiều m&agrave;u</p>\r\n\r\n<p>Hướng Dẫn Sử Dụng Thảm Yoga 2 Lớp Định Tuyến TPE:</p>\r\n\r\n<p>- Bốn điểm đảo chiều định vị sẵn tr&ecirc;n thảm hỗ trợ định tuyến tay, ch&acirc;n khi tập động t&aacute;c ngửa người ra ph&iacute;a sau.</p>\r\n\r\n<p>- Đường kẻ trung t&acirc;m định tuyến c&acirc;n bằng chiều rộng hai b&ecirc;n thảm, c&oacute; định vị trung t&acirc;m thảm bằng vị tr&iacute; hoa sen.</p>\r\n\r\n<p>- C&aacute;c đường kẻ tr&ecirc;n thảm gi&uacute;p tay v&agrave; ch&acirc;n đều nhau khi tập luyện c&aacute;c tư thế, bảo vệ cho xương sống của bạn.</p>\r\n\r\n<p>Bảo Quản Thảm Yoga 2 Lớp Định Tuyến TPE:</p>\r\n\r\n<p>- Đầu ti&ecirc;n, bạn h&atilde;y cho một giọt x&agrave; ph&ograve;ng l&ecirc;n miếng bọt biển v&agrave; l&agrave;m ướt n&oacute; bằng nước ấm</p>\r\n\r\n<p>- Ch&agrave; x&aacute;t thảm yoga với bề mặt mềm mại của bọt biển để kh&ocirc;ng l&agrave;m hỏng bề mặt thảm</p>\r\n\r\n<p>- Sau đ&oacute; d&ugrave;ng chiếc khăn lau để lau lại thảm yoga</p>\r\n\r\n<p>- Lưu &yacute; l&agrave; phải để thảm kh&ocirc; tự nhi&ecirc;n trong kh&ocirc;ng kh&iacute;, kh&ocirc;ng phơi thảm dưới &aacute;nh nắng mặt trời.</p>\r\n\r\n<p>- Tuổi thọ l&acirc;u d&agrave;i của thảm tập yoga TPE được sử dụng l&agrave; 3-5 năm.</p>', 1800, 1, '2023-12-23 17:58:30', '2023-12-23 19:05:16', 0),
(63, 4, 'Thảm Yoga Cao Su Pu Cao Cấp Adidas ADYG - 10820VC', '2000000', 1920000, 'assets/photos/Thảm Yoga Cao Su Pu Cao Cấp Adidas ADYG - 10820VC.jpg', '', '<p>1. TH&Ocirc;NG TIN</p>\r\n\r\n<p>- Chất liệu: Cao su tự nhi&ecirc;n + PU cao cấp</p>\r\n\r\n<p>- K&iacute;ch thước thảm: D&agrave;i 1m83 x rộng 68cm x d&agrave;y 5mm</p>\r\n\r\n<p>- C&acirc;ng nặng: ~3kg</p>\r\n\r\n<p>2. ĐẶC T&Iacute;NH:</p>\r\n\r\n<p>- B&aacute;m s&agrave;n, chống trượt kể cả khi ra mồ h&ocirc;i.</p>\r\n\r\n<p>- Cao su tự nhi&ecirc;n c&oacute; mật độ cao, độ đ&agrave;i hồi v&agrave; b&aacute;m s&agrave;n tuyệt vời. Lớp mặt thảm PU c&oacute; khả năng chống trượt tốt nh&acirc;t trong c&aacute;c loại thảm tập cao cấp hiện nay, đồng thời c&oacute; khả năng thấm h&uacute;t mồ h&ocirc;i, nước để tăng cường chống trượt tuyệt đối ngay cả khi cơ thể ra mồ h&ocirc;i.</p>\r\n\r\n<p>- Chất lượng an to&agrave;n, kh&ocirc;ng m&ugrave;i, kh&ocirc;ng độc hại. Chứng chỉ chất lượng SGS to&agrave;n cầu.</p>\r\n\r\n<p>Đ&acirc;y l&agrave; d&ograve;ng sản phẩm cao cấp nhưng lại c&oacute; gi&aacute; th&agrave;nh rẻ hơn hẳn c&aacute;c loại thảm c&ugrave;ng ph&acirc;n kh&uacute;c tr&ecirc;n thị trường,lu&ocirc;n đồng h&agrave;ng c&ugrave;ng c&aacute;c Yogis Việt, để c&aacute;c anh chị được sử dụng sản phẩm chất lượng nhất với mức gi&aacute; phải chăng nhất!</p>', 130, 1, '2023-12-23 18:01:46', '2023-12-23 18:01:46', 0),
(64, 4, 'Thảm Yoga Adidas 10mm ADMT - 11015BL', '1800000', 1720000, 'assets/photos/Thảm Yoga Adidas 10mm ADMT - 11015BL.jpg', '', '<p>1. TH&Ocirc;NG TIN</p>\r\n\r\n<p>- Chất liệu: Cao su tự nhi&ecirc;n + PU cao cấp</p>\r\n\r\n<p>- K&iacute;ch thước thảm: D&agrave;i 1m83 x rộng 68cm x d&agrave;y 5mm</p>\r\n\r\n<p>- C&acirc;ng nặng: ~3kg</p>\r\n\r\n<p>2. ĐẶC T&Iacute;NH:</p>\r\n\r\n<p>- B&aacute;m s&agrave;n, chống trượt kể cả khi ra mồ h&ocirc;i.</p>\r\n\r\n<p>- Cao su tự nhi&ecirc;n c&oacute; mật độ cao, độ đ&agrave;i hồi v&agrave; b&aacute;m s&agrave;n tuyệt vời. Lớp mặt thảm PU c&oacute; khả năng chống trượt tốt nh&acirc;t trong c&aacute;c loại thảm tập cao cấp hiện nay, đồng thời c&oacute; khả năng thấm h&uacute;t mồ h&ocirc;i, nước để tăng cường chống trượt tuyệt đối ngay cả khi cơ thể ra mồ h&ocirc;i.</p>\r\n\r\n<p>- Chất lượng an to&agrave;n, kh&ocirc;ng m&ugrave;i, kh&ocirc;ng độc hại. Chứng chỉ chất lượng SGS to&agrave;n cầu.</p>\r\n\r\n<p>Đ&acirc;y l&agrave; d&ograve;ng sản phẩm cao cấp nhưng lại c&oacute; gi&aacute; th&agrave;nh rẻ hơn hẳn c&aacute;c loại thảm c&ugrave;ng ph&acirc;n kh&uacute;c tr&ecirc;n thị trường,lu&ocirc;n đồng h&agrave;ng c&ugrave;ng c&aacute;c Yogis Việt, để c&aacute;c anh chị được sử dụng sản phẩm chất lượng nhất với mức gi&aacute; phải chăng nhất!</p>', 289, 1, '2023-12-23 18:03:19', '2023-12-23 18:03:19', 0),
(65, 4, 'Thảm Yoga Adidas 5mm ADYG- 19000BK', '1700000', 1620000, 'assets/photos/Thảm Yoga Adidas 5mm ADYG- 19000BK.jpg', '', '<p>1. TH&Ocirc;NG TIN</p>\r\n\r\n<p>- Chất liệu: Cao su tự nhi&ecirc;n + PU cao cấp</p>\r\n\r\n<p>- K&iacute;ch thước thảm: D&agrave;i 1m83 x rộng 68cm x d&agrave;y 5mm</p>\r\n\r\n<p>- C&acirc;ng nặng: ~3kg</p>\r\n\r\n<p>2. ĐẶC T&Iacute;NH:</p>\r\n\r\n<p>- B&aacute;m s&agrave;n, chống trượt kể cả khi ra mồ h&ocirc;i.</p>\r\n\r\n<p>- Cao su tự nhi&ecirc;n c&oacute; mật độ cao, độ đ&agrave;i hồi v&agrave; b&aacute;m s&agrave;n tuyệt vời. Lớp mặt thảm PU c&oacute; khả năng chống trượt tốt nh&acirc;t trong c&aacute;c loại thảm tập cao cấp hiện nay, đồng thời c&oacute; khả năng thấm h&uacute;t mồ h&ocirc;i, nước để tăng cường chống trượt tuyệt đối ngay cả khi cơ thể ra mồ h&ocirc;i.</p>\r\n\r\n<p>- Chất lượng an to&agrave;n, kh&ocirc;ng m&ugrave;i, kh&ocirc;ng độc hại. Chứng chỉ chất lượng SGS to&agrave;n cầu.</p>\r\n\r\n<p>Đ&acirc;y l&agrave; d&ograve;ng sản phẩm cao cấp nhưng lại c&oacute; gi&aacute; th&agrave;nh rẻ hơn hẳn c&aacute;c loại thảm c&ugrave;ng ph&acirc;n kh&uacute;c tr&ecirc;n thị trường,lu&ocirc;n đồng h&agrave;ng c&ugrave;ng c&aacute;c Yogis Việt, để c&aacute;c anh chị được sử dụng sản phẩm chất lượng nhất với mức gi&aacute; phải chăng nhất!</p>', 280, 1, '2023-12-23 18:05:38', '2023-12-23 18:05:38', 0),
(66, 4, 'Thảm Tập Yoga Pido trơn - elegant - luxury', '860000', 760000, 'assets/photos/Thảm Tập Yoga Pido trơn.jpg', '', '<p>1. TH&Ocirc;NG TIN</p>\r\n\r\n<p>- Chất liệu: Cao su tự nhi&ecirc;n + PU cao cấp</p>\r\n\r\n<p>- K&iacute;ch thước thảm: D&agrave;i 1m83 x rộng 68cm x d&agrave;y 5mm</p>\r\n\r\n<p>- C&acirc;ng nặng: ~3kg</p>\r\n\r\n<p>2. ĐẶC T&Iacute;NH:</p>\r\n\r\n<p>- B&aacute;m s&agrave;n, chống trượt kể cả khi ra mồ h&ocirc;i.</p>\r\n\r\n<p>- Cao su tự nhi&ecirc;n c&oacute; mật độ cao, độ đ&agrave;i hồi v&agrave; b&aacute;m s&agrave;n tuyệt vời. Lớp mặt thảm PU c&oacute; khả năng chống trượt tốt nh&acirc;t trong c&aacute;c loại thảm tập cao cấp hiện nay, đồng thời c&oacute; khả năng thấm h&uacute;t mồ h&ocirc;i, nước để tăng cường chống trượt tuyệt đối ngay cả khi cơ thể ra mồ h&ocirc;i.</p>\r\n\r\n<p>- Chất lượng an to&agrave;n, kh&ocirc;ng m&ugrave;i, kh&ocirc;ng độc hại. Chứng chỉ chất lượng SGS to&agrave;n cầu.</p>\r\n\r\n<p>Đ&acirc;y l&agrave; d&ograve;ng sản phẩm cao cấp nhưng lại c&oacute; gi&aacute; th&agrave;nh rẻ hơn hẳn c&aacute;c loại thảm c&ugrave;ng ph&acirc;n kh&uacute;c tr&ecirc;n thị trường,lu&ocirc;n đồng h&agrave;ng c&ugrave;ng c&aacute;c Yogis Việt, để c&aacute;c anh chị được sử dụng sản phẩm chất lượng nhất với mức gi&aacute; phải chăng nhất!</p>', 300, 1, '2023-12-23 18:06:53', '2023-12-23 19:04:38', 0),
(67, 4, 'Thảm Tập Yoga Pido Định Tuyến - luxury', '1100000', 900000, 'assets/photos/Thảm Tập Yoga Pido Định Tuyến.jpg', '', '<p>Chất liệu : Đế cao su tự nhi&ecirc;n v&agrave; bề mặt tr&ecirc;n bằng polyurethane sinh th&aacute;i độc đ&aacute;o .</p>\r\n\r\n<p>C&acirc;n nặng : Khoảng 2,5kg</p>\r\n\r\n<p>K&iacute;ch thước : D&agrave;i 185cm x rộng 68cm</p>\r\n\r\n<p>Độ d&agrave;y : Khoảng 4,2mm</p>\r\n\r\n<p>Xuất xứ : Anh Quốc (UK)</p>\r\n\r\n<p>Bộ sản phẩm ch&iacute;nh h&atilde;ng gồm : Thảm + T&uacute;i + hộp đựng</p>\r\n\r\n<p>Mang phong c&aacute;ch &Aacute; Đ&ocirc;ng đường kẻ định tuyến &amp; hoa văn&nbsp;Phoenix</p>\r\n\r\n<p>Đ&acirc;y l&agrave; thiết kế đặc biệt từ Liforme biểu tượng cho sự may mắn</p>\r\n\r\n<p>Bề mặt thảm lấy tone m&agrave;u đỏ rực rỡ v&agrave; nổi bật hơn hết l&agrave; đường kẻ định tuyến &amp; hoa văn được in bằng mực v&agrave;ng &aacute;nh kim ; tạo sự kh&aacute;c biệt v&agrave; độc đ&aacute;o - nhưng vẫn rất an to&agrave;n với người tập &amp; m&ocirc;i trường sống.</p>\r\n\r\n<p>Thảm yoga từ Liforme ch&iacute;nh h&atilde;ng lu&ocirc;n lu&ocirc;n đảm bảo độ bền, b&aacute;m s&agrave;n &amp; chống trơn trượt nhờ chất liệu cao su tự nhi&ecirc;n 100% - n&oacute; rất th&acirc;n thiện với m&ocirc;i sinh.</p>', 390, 1, '2023-12-23 18:09:00', '2023-12-23 19:04:22', 0),
(68, 4, 'Thảm tập Yoga 1009 - elegant - luxury', '250000', 195000, 'assets/photos/Thảm tập Yoga 1009.jpg', '', '<p>+ Thảm d&agrave;y 5mm, nhẹ 1kg, k&iacute;ch thước 172 x 68cm.</p>\r\n\r\n<p>+ Chất liệu: ThermoPlastic Elastomer (TPE) sinh th&aacute;i cao cấp.</p>\r\n\r\n<p>+ Bề mặt kết cấu b&aacute;m chặt.</p>\r\n\r\n<p>+ Đường căn chỉnh gi&uacute;p đặt vị tr&iacute; ch&iacute;nh x&aacute;c.</p>\r\n\r\n<p>+ Bề mặt tế b&agrave;o kh&eacute;p k&iacute;n ngăn mồ h&ocirc;i thấm s&acirc;u v&agrave;o thảm.</p>\r\n\r\n<p>+ Sản xuất với c&ocirc;ng nghệ th&acirc;n thiện m&ocirc;i trường, hiệu quả về năng lượng.</p>\r\n\r\n<p>+ Kh&ocirc;ng chứa chất dung m&ocirc;i hoặc chất keo độc hại.</p>', 2000, 1, '2023-12-23 18:10:45', '2023-12-23 19:03:50', 0),
(69, 4, 'Thảm Tập Cork Yoga Mat 4 ly - elegant', '900000', 820000, 'assets/photos/Thảm Tập Cork Yoga Mat 4 ly.jpg', '', '<p>+ Thảm d&agrave;y 5mm, nhẹ 1kg, k&iacute;ch thước 172 x 68cm.</p>\r\n\r\n<p>+ Chất liệu: ThermoPlastic Elastomer (TPE) sinh th&aacute;i cao cấp.</p>\r\n\r\n<p>+ Bề mặt kết cấu b&aacute;m chặt.</p>\r\n\r\n<p>+ Đường căn chỉnh gi&uacute;p đặt vị tr&iacute; ch&iacute;nh x&aacute;c.</p>\r\n\r\n<p>+ Bề mặt tế b&agrave;o kh&eacute;p k&iacute;n ngăn mồ h&ocirc;i thấm s&acirc;u v&agrave;o thảm.</p>\r\n\r\n<p>+ Sản xuất với c&ocirc;ng nghệ th&acirc;n thiện m&ocirc;i trường, hiệu quả về năng lượng.</p>\r\n\r\n<p>+ Kh&ocirc;ng chứa chất dung m&ocirc;i hoặc chất keo độc hại.</p>', 420, 1, '2023-12-23 18:11:36', '2023-12-23 19:02:56', 0),
(70, 4, 'Thảm Tập Thể Dục Adidas ADMT - 13232GR', '2500000', 1920000, 'assets/photos/Thảm Tập Thể Dục Adidas ADMT - 13232GR.jpg', '', '<p>Thương hiệu: Adidas</p>\r\n\r\n<p>&nbsp;Chất liệu : POE (Chất đ&agrave;n hồi polyolefin)</p>\r\n\r\n<p>K&iacute;ch thước : 180 x 58 x 0.9 cm</p>\r\n\r\n<p>C&acirc;n nặng : 0.9kg</p>\r\n\r\n<p>Thiết kế l&otilde;m s&oacute;ng độc đ&aacute;o để cải thiện sự c&acirc;n bằng v&agrave; ổn định Thảm tập thể dục Adidas ADMT-13232GR được l&agrave;m từ chất đ&agrave;n hồi polyolefin mềm v&agrave; chất lượng rất cao (POE), sẽ cung cấp cho vận động vi&ecirc;n tư thế thoải m&aacute;i nhất khi thực hiện c&aacute;c b&agrave;i tập nhấn, đẩy v&agrave; k&eacute;o d&agrave;i. Một tấm thảm như thế n&agrave;y l&agrave; ho&agrave;n hảo để sử dụng ở nh&agrave;, v&agrave; để đ&agrave;o tạo, trong c&ocirc;ng vi&ecirc;n hoặc ph&ograve;ng tập thể dục với thiết kế độc đ&aacute;o dạng lồi l&otilde;m nhằm gi&uacute;p cải thiện sự c&acirc;n bằng v&agrave; n&acirc;ng cao độ ổn định trong tập luyện. Độ d&agrave;y vượt trội tạo n&ecirc;n sự &ecirc;m &aacute;i thoải m&aacute;i trong tất cả c&aacute;c động t&aacute;c tập luyện, cơ thể bạn sẽ được an to&agrave;n hơn với chiếc thảm n&agrave;y. Do trọng lượng rất nhẹ (0.9kg) v&agrave; k&iacute;ch thước nhỏ gọn, thảm thuận tiện để mang theo bất kỳ đ&acirc;u. C&aacute;c vật liệu mịn cung cấp sự ổn định trong qu&aacute; tr&igrave;nh tập luyện. Sản phẩm kh&ocirc;ng bao gồm t&uacute;i v&agrave; d&acirc;y đeo.</p>', 400, 1, '2023-12-23 18:13:24', '2023-12-23 18:13:24', 0),
(71, 5, 'Áo Bra tập Yoga', '1200000', 820000, 'assets/photos/Áo Bra tập Yoga.jpg', '', '<p>- Một thiết kế mới s&agrave;nh điệu v&agrave; tinh tế. Đến ph&ograve;ng tập, mặc đi chơi... đều rất stylish, rất đẹp</p>\r\n\r\n<p>- Chất thun lạnh bamboo 100% tự nhi&ecirc;n</p>\r\n\r\n<p>- Si&ecirc;u đ&agrave;n hồi, h&uacute;t ẩm, nhanh kh&ocirc;, tho&aacute;ng kh&iacute;</p>\r\n\r\n<p>- Thoải m&aacute;i vận động, kh&ocirc;ng oi bức, kh&ocirc;ng g&ograve; b&oacute;</p>\r\n\r\n<p>- Ph&ugrave; hợp tập Yoga, gym, dance, hoạt động ngo&agrave;i trời...</p>', 4000, 1, '2023-12-23 18:24:31', '2023-12-23 18:26:30', 0),
(72, 5, 'Áo Bra chạy bộ classic', '430000', 399000, 'assets/photos/Áo bra.jpg', '', '<p>- Một thiết kế mới s&agrave;nh điệu v&agrave; tinh tế. Đến ph&ograve;ng tập, mặc đi chơi... đều rất stylish, rất đẹp</p>\r\n\r\n<p>- Chất thun lạnh bamboo 100% tự nhi&ecirc;n</p>\r\n\r\n<p>- Si&ecirc;u đ&agrave;n hồi, h&uacute;t ẩm, nhanh kh&ocirc;, tho&aacute;ng kh&iacute;</p>\r\n\r\n<p>- Thoải m&aacute;i vận động, kh&ocirc;ng oi bức, kh&ocirc;ng g&ograve; b&oacute;</p>\r\n\r\n<p>- Ph&ugrave; hợp tập Yoga, gym, dance, hoạt động ngo&agrave;i trời...</p>', 380, 1, '2023-12-23 18:27:09', '2023-12-23 18:35:13', 0),
(73, 5, 'Áo Bra tập Yoga dáng dài', '320000', 290000, 'assets/photos/Áo dáng dài.jpg', '', '<p>- Một thiết kế mới s&agrave;nh điệu v&agrave; tinh tế. Đến ph&ograve;ng tập, mặc đi chơi... đều rất stylish, rất đẹp</p>\r\n\r\n<p>- Chất thun lạnh bamboo 100% tự nhi&ecirc;n</p>\r\n\r\n<p>- Si&ecirc;u đ&agrave;n hồi, h&uacute;t ẩm, nhanh kh&ocirc;, tho&aacute;ng kh&iacute;</p>\r\n\r\n<p>- Thoải m&aacute;i vận động, kh&ocirc;ng oi bức, kh&ocirc;ng g&ograve; b&oacute;</p>\r\n\r\n<p>- Ph&ugrave; hợp tập Yoga, gym, dance, hoạt động ngo&agrave;i trời...</p>', 820, 1, '2023-12-23 18:27:52', '2023-12-23 18:30:45', 0),
(74, 6, 'QuầnLegging lửng Grid đen cao cấp', '310000', 240000, 'assets/photos/Quấn Legging lửng Grid đen.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 300, 1, '2023-12-23 18:39:40', '2023-12-23 18:57:19', 0),
(75, 6, 'Quần Legging lửng Shaping xanh đen', '310000', 210000, 'assets/photos/Quần Legging lửng Shaping xanh đen.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 279, 1, '2023-12-23 18:45:39', '2023-12-23 18:45:39', 0),
(76, 6, 'Quần Legging lửng Shaping xám mint', '310000', 210000, 'assets/photos/Quần Legging lửng Shaping xám.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 270, 1, '2023-12-23 18:46:17', '2023-12-23 18:58:29', 0),
(77, 6, 'Quần Legging lửng Shaping hồng', '310000', 240000, 'assets/photos/Quần Legging lửng Shaping hồng.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 300, 1, '2023-12-23 18:46:57', '2023-12-23 18:46:57', 0),
(78, 6, 'Quần Legging lửng cao cấp Shaping đen', '320000', 200000, 'assets/photos/Quần Legging lửng Shaping đen.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 4000, 1, '2023-12-23 18:47:31', '2023-12-23 18:59:43', 0),
(79, 6, 'Quần Legging lửng Power xanh rêu', '300000', 190000, 'assets/photos/Quần Legging lửng Power xanh rêu.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 540, 1, '2023-12-23 18:48:09', '2023-12-23 18:48:09', 0),
(80, 6, 'Quần Legging lửng Power xanh đen', '290000', 180000, 'assets/photos/Quần Legging lửng Power xanh đen.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 2000, 1, '2023-12-23 18:48:56', '2023-12-23 18:48:56', 0),
(81, 6, 'Quần Legging lửng Power xám mint', '310000', 190000, 'assets/photos/Quần Legging lửng Power xám.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 300, 1, '2023-12-23 18:49:47', '2023-12-23 18:59:03', 0);
INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `discount`, `image`, `brand`, `description`, `quantity`, `active`, `created_at`, `updated_at`, `deleted`) VALUES
(82, 6, 'Quần Legging lửng Power hồng mint', '320000', 220000, 'assets/photos/Quần Legging lửng Power hồng.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 300, 1, '2023-12-23 18:50:23', '2023-12-23 19:01:18', 0),
(83, 6, 'Quần Legging lửng cao cấp Power đen', '270000', 200000, 'assets/photos/Quần Legging lửng Power đen.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 489, 1, '2023-12-23 18:51:08', '2023-12-23 19:00:12', 0),
(84, 6, 'Quần Legging lửng Grid xanh mint rêu', '310000', 200000, 'assets/photos/Quần Legging lửng Grid xanh rêu.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 290, 1, '2023-12-23 18:52:28', '2023-12-23 19:00:33', 0),
(85, 6, 'Quần Legging lửng Grid xanh đen', '340000', 190000, 'assets/photos/Quần Legging lửng Grid xanh đen.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 797, 1, '2023-12-23 18:53:11', '2023-12-23 18:53:11', 0),
(86, 6, 'Quần Legging lửng Grid xám mint', '290000', 180000, 'assets/photos/Quần Legging lửng Grid xám.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 6000, 1, '2023-12-23 18:53:53', '2023-12-23 18:58:02', 0),
(87, 6, 'Quấn Legging lửng Grid đen cao cấp', '310000', 240000, 'assets/photos/Quấn Legging lửng Grid đen.jpg', '', '<p>*Shop mang tới cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng</p>\r\n\r\n<p>- Thời trang nữ theo xu hướng hiện đại, trẻ trung, phong c&aacute;ch</p>\r\n\r\n<p>- Sản phẩm sản xuất tại Việt Nam, tr&ecirc;n d&acirc;y chuyền hiện đại</p>\r\n\r\n<p>* Quần đủ size từ S đến 6XL:</p>\r\n\r\n<p>- Size S ( 38-45kg ): Eo &lt; 73, M&ocirc;ng &lt; 90, Đ&ugrave;i &lt; 52</p>\r\n\r\n<p>- Size M ( 45-50kg ): Eo &lt;76, M&ocirc;ng &lt; 93, Đ&ugrave;i &lt; 54</p>\r\n\r\n<p>- Size L ( 50-55kg ): Eo &lt; 80, M&ocirc;ng &lt; 96, Đ&ugrave;i &lt; 56</p>\r\n\r\n<p>- Size XL ( 55-58kg ): Eo &lt; 83, M&ocirc;ng &lt; 99, Đ&ugrave;i &lt; 58</p>\r\n\r\n<p>- Size XXL(58-63kg ): Eo&lt;86, M&ocirc;ng &lt; 102, Đ&ugrave;i &lt; 60</p>\r\n\r\n<p>- Size 3XL(63-67kg): Eo&lt; 90, M&ocirc;ng&lt;105, Đ&ugrave;i &lt;62</p>\r\n\r\n<p>- Size 4XL(67-72kg) Eo&lt; 93, M&ocirc;ng &lt; 108, Đ&ugrave;i &lt;64</p>\r\n\r\n<p>- Size 5XL(72-76g) Eo&lt; 96, M&ocirc;ng &lt; 111, Đ&Ugrave;i &lt; 66</p>\r\n\r\n<p>-Size 6XL(76-80kg)Eo&lt; 99, M&ocirc;ng &lt; 114, Đ&ugrave;i&lt; 68</p>\r\n\r\n<p>* Bảng size chỉ mang t&iacute;nh chất tham khảo, t&ugrave;y thuộc v&agrave;o số đo cơ thể v&agrave; chất liệu vải kh&aacute;c nhau sẽ c&oacute; sự ch&ecirc;nh lệch nhất định.</p>\r\n\r\n<p>* Đổi trả theo đ&uacute;ng quy định shop</p>\r\n\r\n<p>1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm):</p>\r\n\r\n<p>- H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng</p>\r\n\r\n<p>- H&agrave;ng h&oacute;a hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất.</p>\r\n\r\n<p>2. Trường hợp được chấp nhận:</p>\r\n\r\n<p>- H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng</p>\r\n\r\n<p>- Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng</p>\r\n\r\n<p>3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch:</p>\r\n\r\n<p>- Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng</p>\r\n\r\n<p>- Đặt nhầm sản phẩm, chủng loại, kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp,...</p>', 2000, 1, '2023-12-23 18:54:54', '2023-12-29 16:17:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Nhân viên'),
(3, 'Khách hàng');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(11) NOT NULL,
  `size` varchar(10) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`, `soluong`) VALUES
(1, 'S', 1000),
(2, 'M', 1000),
(3, 'L', 1000),
(4, 'XL', 1000),
(5, 'XXL', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `title` varchar(70) NOT NULL,
  `content` varchar(100) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `title`, `content`, `active`) VALUES
(1, 'assets/photos/newBanner.jpg', '', '', 1),
(5, 'assets/photos/newBanner2.jpg', '', '', 1),
(6, 'assets/photos/newBanner3.jpg', '', '', 1),
(7, 'assets/photos/newBanner4.jpg', '', '', 1),
(8, 'assets/photos/newBanner5.jpg', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `user_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`user_id`, `token`, `created_at`) VALUES
(0, 'aeccc3fda6f6729b30ff2ffd7401bf3e', '2023-06-19 06:54:11'),
(1, '1237dcbb05c58ee8dc34b7457d8ebab4', '2023-08-28 19:32:33'),
(1, '19288408c788054155ab1ac10fba5c71', '2021-10-28 08:16:31'),
(1, '1d552c60d420aca09b97ced942bfa207', '2021-10-31 07:18:09'),
(1, '20a2031fc6dea52852b51c8e2d276071', '2021-11-01 05:55:18'),
(1, '2c2f8d5e5af7ad2918a82f3e5eac9f8d', '2021-10-30 12:45:11'),
(1, '2e67ec3c097d8b82e9e814ba1153621c', '2023-08-28 19:24:37'),
(1, '321041b0d1dda05369393d53d906edf3', '2021-10-29 06:30:00'),
(1, '4a49d22fb0ef171b33ba287f9fb831a1', '2021-10-29 08:56:01'),
(1, '5cfdf014aa983bc6a3247ff189ca57ce', '2021-11-01 05:48:32'),
(1, '637916d54f596007609ea7a5f44949c4', '2021-10-28 14:05:47'),
(1, '6706726d68bce3855dfa21b2e5084a4a', '2021-10-28 09:36:05'),
(1, '69824cff9e02af15308328f9ccbfa1eb', '2021-10-28 09:36:12'),
(1, '6a9574d3a1053bf3bdda0f4bfc6d4ce1', '2023-08-28 19:22:50'),
(1, '6da120980accbdd4574c1f6b6989237a', '2021-10-29 07:14:28'),
(1, '6f6a1da2c6d3b42378f2322046c8c2ab', '2023-08-28 19:36:24'),
(1, 'a399c3cd78ecd71ab9c67ca329544a05', '2021-11-01 06:33:24'),
(1, 'a9e284d5bffd656afceb2f0c7072976c', '2021-10-30 14:24:12'),
(1, 'b711b8299b4721b2917b2b9d3c6635fd', '2021-10-28 09:30:38'),
(1, 'c2d7301408f0c58faa6453529e68cd87', '2021-10-28 09:16:54'),
(1, 'cb7d23d0441f849337efed0c22c17830', '2021-10-30 03:18:05'),
(1, 'ee4738999d0e3ea199fb871bc96340c1', '2021-10-28 14:08:47'),
(1, 'fb78230c3c129a0c5e22099339a4abd5', '2021-10-29 09:05:21'),
(2, '119a3d4554ce347f5531e697d13e17f1', '2023-06-19 07:12:13'),
(3, '037a359ae20f7a018f90cb9d66c17c39', '2023-08-27 15:50:55'),
(3, '513853497fda9243faa8924f8a1cde5d', '2023-08-28 12:28:01'),
(3, '8b36facbd1e76ab5dc5928a297e7ff4c', '2023-08-28 19:33:20'),
(3, 'b33f279c8e491b7d9a8963ab50335884', '2023-08-28 12:32:21'),
(3, 'b6c008987d2b7e21c32e3eedd3a7d742', '2023-08-28 18:04:46'),
(3, 'fd5d9bc2360fe599f7c8aba26366f264', '2023-08-28 19:27:18'),
(6, '20b5914906ff7c8ff63154a54529739c', '2023-12-04 16:55:08'),
(6, '2fccb6c20e8c8ad51550f1e66d07477f', '2023-12-24 03:30:40'),
(6, '42adbe3f41f4b2278b1bdcbec62b9a38', '2023-12-04 18:32:30'),
(6, '4ba5551ec7471ba56b5a25a10fa79c43', '2023-12-04 17:05:46'),
(6, '5059d957641776f182827d93dacfb325', '2023-12-04 16:58:07'),
(6, '5d225603808fd00d68b32a9c33fb9f24', '2023-12-17 10:05:00'),
(6, '71c5c83b4222fcf59239c8952a048416', '2023-12-18 17:11:53'),
(6, '76f66b80362ec879302c9841f9b432bb', '2023-12-04 17:27:37'),
(6, '83980ae62494f2836e2e6f87ef332fcf', '2023-12-18 16:44:10'),
(6, '8945b729517f0feb86377f80d4e67b83', '2022-06-21 07:35:52'),
(6, '9ee6ebce6fac35e4f60f21f1ef1387a4', '2023-12-04 18:06:39'),
(6, 'a87137642343947832e92588e78daab0', '2023-12-05 08:33:01'),
(6, 'b408685202ac315a983548811c5c23bf', '2023-12-30 14:53:20'),
(6, 'cb5d859c8a9f20af79d4fe3fc669e18d', '2023-12-18 18:02:08'),
(6, 'cd74608b49143cb3b43ae5adbc256b1e', '2023-12-18 18:16:05'),
(6, 'e135f83c74aa23929c02a09916107363', '2023-12-31 11:09:03'),
(6, 'e3831634568e737097bee8648f995b17', '2023-12-04 15:17:14'),
(6, 'e925e76fad5716bdb5b13f59dc782304', '2023-12-07 04:50:00'),
(6, 'ece27c0c13fc63b1c30558b3c484577a', '2023-12-04 17:03:49'),
(6, 'f24401950f5d1ed96102b8f5535cd806', '2023-12-20 11:31:44'),
(6, 'f92907d5fe1c0fa6f7d7ccf3c2573cab', '2023-12-06 04:47:43'),
(7, '15d872a23fdb9a8101f2cde0959b7b18', '2022-06-21 07:47:19'),
(8, '1af22f5f0a96e1d6a8f57a161c8f1644', '2023-12-17 10:46:20'),
(8, '8c5f26fb29e5cf672dfeb47638d34443', '2023-12-17 10:40:24'),
(9, '3d03cda66271d354669cb3be2984f018', '2023-12-17 15:25:12'),
(9, '82d957919078003bda51e31a5aecdd32', '2023-12-17 10:47:24'),
(10, 'c56143fcd6ed4e5dca418b0a2df3424d', '2023-12-20 11:04:05'),
(12, '181078a30af3f528869514b78f40bb2b', '2021-10-30 14:24:41'),
(13, 'af08e39cb4fb5f11417b6bc89eef6114', '2021-10-30 14:25:14'),
(14, '1a132baaba888eec623ead92e2a8da96', '2024-11-11 14:39:00'),
(14, '2df00d724375ec76509dc83cdec8b8fe', '2024-11-11 14:13:38'),
(14, '3376a6f958ff33b3483eaadabe5efea0', '2024-11-11 14:55:04'),
(14, '37a292559e9f023cb9561bcaada18f4e', '2024-11-12 14:54:31'),
(14, '4a01654c9d73d7609a0938beb3411b49', '2024-11-11 14:39:31'),
(14, '4eefa684dbe7bef5911f137006054959', '2024-11-13 08:41:37'),
(14, '5a2572d8e29975665f52ae89ee0923e0', '2024-11-11 14:58:56'),
(14, '8679f5c9c22c42e91cc8f65d2692d0b1', '2024-11-11 14:11:17'),
(14, 'bd96e6fe3b2924dc60b2e93a041cdc7d', '2024-11-16 20:28:11'),
(15, '463d15ae36b5deda07d258a98582611b', '2021-11-10 15:17:36'),
(15, '48e7e95f60f703f0e91e30c001b42f42', '2021-11-05 01:19:47'),
(16, '5d3c283c7c7fa562ed0b2407f2260e88', '2021-11-05 17:09:42'),
(17, 'f16fd3ddd04bf996c9136bfd25d5b009', '2021-11-08 06:45:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `phone_number`, `address`, `password`, `role_id`, `created_at`, `updated_at`, `deleted`, `avatar`) VALUES
(14, 'Vũ Duy Quang', 'vuduyquang362003@gmail.com', '0815461162', 'Vĩnh Tường- Vĩnh Phúc', 'e6a109a81bb3c1c4a7f63fbfe4f1c48f', 1, '2024-11-11 14:11:12', '2024-11-12 14:54:25', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `users_khach`
--

CREATE TABLE `users_khach` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_khach`
--

INSERT INTO `users_khach` (`id`, `name`, `email`, `phone`, `address`, `password`, `role`) VALUES
(3, 'Vũ Duy Quang', 'quangtest@gmail.com', '0815461162', 'Vĩnh Phúc', '123456', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_user` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orderdetail_order` (`order_id`),
  ADD KEY `fk_orderdetail_product` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_category` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`user_id`,`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_role` (`role_id`);

--
-- Indexes for table `users_khach`
--
ALTER TABLE `users_khach`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_usk_roles` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users_khach`
--
ALTER TABLE `users_khach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_khach`
--
ALTER TABLE `users_khach`
  ADD CONSTRAINT `fk_usk_roles` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
