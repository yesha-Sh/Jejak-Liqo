-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20250718.d42db65a1e
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 22, 2025 at 03:11 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jejak_liqo`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `meeting_id` bigint UNSIGNED NOT NULL,
  `mentee_id` bigint UNSIGNED NOT NULL,
  `status` enum('Hadir','Izin','Sakit','Alfa') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Hadir',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `meeting_id`, `mentee_id`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Hadir', 'Officia ea aliquid quisquam exercitationem laudantium ab repudiandae.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(2, 1, 5, 'Alfa', 'Corrupti illum quia incidunt omnis quo non.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(3, 1, 6, 'Sakit', 'Qui doloremque quidem totam dolor id.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(4, 1, 8, 'Alfa', 'Quos harum nesciunt et eligendi non recusandae consectetur sit.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(5, 1, 10, 'Sakit', 'Laborum dicta dolores velit exercitationem.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(6, 1, 14, 'Hadir', 'Cum voluptatem voluptatum amet sit a sequi.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(7, 1, 16, 'Hadir', 'Perspiciatis et consequatur cumque eaque voluptates quo.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(8, 1, 17, 'Alfa', 'Aperiam illo autem nihil deleniti.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(9, 1, 20, 'Hadir', 'Dolor qui commodi eligendi molestiae ut itaque.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(10, 1, 24, 'Sakit', 'Rem quos voluptas omnis voluptatem eligendi aperiam earum.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(11, 1, 35, 'Sakit', 'Sequi et qui eligendi velit architecto aut.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(12, 1, 38, 'Izin', 'Voluptatibus inventore at incidunt reprehenderit similique aut est.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(13, 1, 43, 'Alfa', 'Tempora veritatis minus nihil molestiae.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(14, 1, 46, 'Izin', 'Ea rem et et porro distinctio et placeat.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(15, 1, 48, 'Hadir', 'Voluptatibus unde illum voluptas recusandae eos aut minima.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(16, 1, 50, 'Alfa', 'Hic debitis et qui officiis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(17, 2, 3, 'Izin', 'Molestiae non facere dolores.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(18, 2, 5, 'Alfa', 'Natus non magnam non ratione delectus qui.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(19, 2, 6, 'Sakit', 'Dignissimos beatae unde eum veniam.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(20, 2, 8, 'Alfa', 'Iure expedita ut iusto nostrum qui.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(21, 2, 10, 'Hadir', 'Consequuntur ratione quis quia provident expedita quasi.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(22, 2, 14, 'Hadir', 'In accusamus ab officia animi molestiae est magnam.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(23, 2, 16, 'Hadir', 'Sed et ducimus debitis quia consequatur non nesciunt.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(24, 2, 17, 'Sakit', 'Est omnis magni dolore ea reiciendis necessitatibus qui placeat.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(25, 2, 20, 'Alfa', 'Maxime quos quasi esse corporis velit.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(26, 2, 24, 'Hadir', 'Commodi asperiores velit ea repudiandae labore esse ipsam sit.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(27, 2, 35, 'Alfa', 'Eum sint fugit recusandae atque autem.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(28, 2, 38, 'Hadir', 'Veritatis impedit animi doloribus praesentium sed voluptates.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(29, 2, 43, 'Hadir', 'Esse qui et autem exercitationem mollitia.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(30, 2, 46, 'Alfa', 'Eaque quisquam repellendus totam odit consectetur.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(31, 2, 48, 'Hadir', 'Quia voluptas iste consequatur.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(32, 2, 50, 'Alfa', 'Rerum totam quis nobis voluptas.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(33, 3, 3, 'Hadir', 'Necessitatibus soluta sit rerum sed.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(34, 3, 5, 'Alfa', 'Cumque consectetur sunt accusamus voluptate quia.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(35, 3, 6, 'Hadir', 'Exercitationem iste sit ea autem est aut soluta.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(36, 3, 8, 'Alfa', 'Modi provident dicta error id eos debitis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(37, 3, 10, 'Hadir', 'Ex quia eos aut.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(38, 3, 14, 'Sakit', 'Est nobis quam veritatis explicabo ratione sit.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(39, 3, 16, 'Alfa', 'Eos animi sint nemo optio aut fuga quis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(40, 3, 17, 'Sakit', 'Veritatis voluptas rem exercitationem ut quas illum.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(41, 3, 20, 'Hadir', 'Voluptatum tempore dolor delectus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(42, 3, 24, 'Alfa', 'Id omnis corporis reprehenderit hic possimus consequatur.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(43, 3, 35, 'Alfa', 'Ut necessitatibus ut doloremque.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(44, 3, 38, 'Hadir', 'Et et dolores harum quam.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(45, 3, 43, 'Izin', 'Inventore laudantium eos eius sit corrupti doloribus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(46, 3, 46, 'Hadir', 'Vel fuga commodi quae assumenda consequatur.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(47, 3, 48, 'Izin', 'Dolorum ipsa numquam repellat eum vitae numquam.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(48, 3, 50, 'Alfa', 'Quia odit et rem nobis repudiandae omnis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(49, 4, 3, 'Hadir', 'In aperiam quibusdam velit nesciunt est.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(50, 4, 5, 'Alfa', 'Distinctio et architecto dolores et culpa.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(51, 4, 6, 'Sakit', 'Commodi natus sunt odio atque non sint incidunt.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(52, 4, 8, 'Izin', 'Aut ad cupiditate ut asperiores ipsa.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(53, 4, 10, 'Sakit', 'Asperiores magnam autem ut dicta accusantium possimus accusamus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(54, 4, 14, 'Sakit', 'Dignissimos occaecati est in qui doloremque.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(55, 4, 16, 'Alfa', 'Recusandae non cumque dolor.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(56, 4, 17, 'Alfa', 'Corrupti voluptatem facilis fugiat.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(57, 4, 20, 'Hadir', 'Et eum libero cupiditate similique quis est.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(58, 4, 24, 'Hadir', 'Ut nihil magni at qui minima et voluptatibus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(59, 4, 35, 'Sakit', 'Laboriosam maiores architecto magnam qui aperiam.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(60, 4, 38, 'Izin', 'Non nisi sunt repellat ipsa maxime ducimus eum tempore.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(61, 4, 43, 'Hadir', 'Ullam qui autem eum expedita possimus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(62, 4, 46, 'Sakit', 'Laudantium mollitia est expedita.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(63, 4, 48, 'Hadir', 'Officia eos illum voluptas impedit.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(64, 4, 50, 'Hadir', 'Consectetur autem numquam sunt reprehenderit minus adipisci tenetur blanditiis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(65, 5, 3, 'Alfa', 'Blanditiis est qui expedita qui qui debitis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(66, 5, 5, 'Izin', 'Dicta et blanditiis illo qui ducimus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(67, 5, 6, 'Hadir', 'Quia maxime ad fugit dicta.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(68, 5, 8, 'Sakit', 'Delectus quod similique veniam quasi.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(69, 5, 10, 'Hadir', 'Odit eos sit et aliquam recusandae.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(70, 5, 14, 'Sakit', 'Eligendi repellendus labore optio.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(71, 5, 16, 'Hadir', 'Consequuntur minus omnis minus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(72, 5, 17, 'Hadir', 'Veniam incidunt libero voluptas libero laboriosam.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(73, 5, 20, 'Alfa', 'Molestias ipsam esse qui.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(74, 5, 24, 'Alfa', 'Est ex nobis qui qui dolorem ut vel qui.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(75, 5, 35, 'Izin', 'Atque numquam exercitationem omnis quibusdam deleniti adipisci.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(76, 5, 38, 'Izin', 'Autem vero nemo consequatur vel explicabo ut.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(77, 5, 43, 'Sakit', 'Eius aut quos qui expedita praesentium.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(78, 5, 46, 'Alfa', 'Sapiente quo et et mollitia temporibus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(79, 5, 48, 'Hadir', 'Nobis at nemo perferendis qui.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(80, 5, 50, 'Alfa', 'Odit saepe quisquam sit tempora exercitationem fugiat voluptatibus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(81, 6, 3, 'Alfa', 'Omnis quas qui suscipit corporis eligendi voluptates atque.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(82, 6, 5, 'Izin', 'Ratione quisquam laborum excepturi similique voluptatem.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(83, 6, 6, 'Hadir', 'Cumque commodi dolorem ab reiciendis optio quisquam sit.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(84, 6, 8, 'Sakit', 'Provident incidunt et non quaerat non.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(85, 6, 10, 'Izin', 'Non eos blanditiis sed.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(86, 6, 14, 'Hadir', 'Assumenda dolores velit velit consequatur earum corrupti accusantium.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(87, 6, 16, 'Sakit', 'Est pariatur quia accusamus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(88, 6, 17, 'Hadir', 'Nostrum aut qui voluptatem.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(89, 6, 20, 'Alfa', 'Error qui qui et adipisci.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(90, 6, 24, 'Izin', 'Itaque et id a nemo.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(91, 6, 35, 'Izin', 'Distinctio iusto saepe sit sit rerum.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(92, 6, 38, 'Alfa', 'Eaque ut quam animi iure quisquam quia nisi minus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(93, 6, 43, 'Izin', 'Excepturi expedita perspiciatis qui occaecati et non quia.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(94, 6, 46, 'Izin', 'Et dicta repellendus omnis quae aut.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(95, 6, 48, 'Sakit', 'Ipsam facere a iure sint.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(96, 6, 50, 'Sakit', 'Praesentium consequuntur dignissimos possimus consequatur et illo.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(97, 7, 3, 'Hadir', 'Inventore officiis ad natus est a id.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(98, 7, 5, 'Izin', 'Aut nobis animi a.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(99, 7, 6, 'Sakit', 'Vero rerum distinctio sunt quia molestiae debitis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(100, 7, 8, 'Sakit', 'Molestias voluptas ullam sit aperiam dolores dolores.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(101, 7, 10, 'Hadir', 'Commodi cupiditate totam suscipit ducimus laborum et magnam.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(102, 7, 14, 'Hadir', 'Laboriosam et aut aut sunt molestiae ad.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(103, 7, 16, 'Hadir', 'Illo facilis omnis aut fuga officia et vel inventore.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(104, 7, 17, 'Izin', 'Nulla repellat tenetur assumenda voluptates quis nemo.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(105, 7, 20, 'Hadir', 'Omnis enim ex consequatur expedita ut veritatis deleniti.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(106, 7, 24, 'Sakit', 'Adipisci molestiae quisquam velit assumenda iste adipisci accusamus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(107, 7, 35, 'Alfa', 'Est sint possimus voluptas fugiat dolor omnis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(108, 7, 38, 'Izin', 'Illo omnis et nihil deleniti quam est id.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(109, 7, 43, 'Alfa', 'Ducimus odit non deserunt nemo adipisci accusantium sit.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(110, 7, 46, 'Hadir', 'Id doloremque incidunt labore et.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(111, 7, 48, 'Hadir', 'Adipisci aliquid asperiores recusandae dicta.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(112, 7, 50, 'Izin', 'Repellendus cupiditate esse quisquam quidem qui similique necessitatibus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(113, 8, 3, 'Sakit', 'Repellat culpa aut libero veniam atque.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(114, 8, 5, 'Izin', 'Perferendis aut vel consequuntur sint temporibus cumque.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(115, 8, 6, 'Izin', 'Tempore illum ut velit.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(116, 8, 8, 'Alfa', 'Ea iusto consequatur aut eum.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(117, 8, 10, 'Sakit', 'Adipisci est et molestiae accusamus quam.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(118, 8, 14, 'Izin', 'Qui voluptate magni sunt quia et perferendis pariatur nihil.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(119, 8, 16, 'Alfa', 'Fugiat repellendus recusandae fugit voluptate.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(120, 8, 17, 'Izin', 'Consequatur qui adipisci pariatur.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(121, 8, 20, 'Alfa', 'Sunt ut quaerat sequi aut tempore asperiores.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(122, 8, 24, 'Izin', 'Illum quia enim quibusdam.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(123, 8, 35, 'Hadir', 'Et aperiam ratione porro soluta.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(124, 8, 38, 'Hadir', 'Mollitia quisquam reprehenderit est.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(125, 8, 43, 'Alfa', 'Voluptatem ut aut est.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(126, 8, 46, 'Izin', 'Et reprehenderit sunt exercitationem et.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(127, 8, 48, 'Sakit', 'Architecto repudiandae doloremque veniam aut veniam dolor expedita.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(128, 8, 50, 'Izin', 'Aspernatur temporibus omnis vel deleniti in exercitationem est.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(129, 9, 3, 'Alfa', 'Nemo eum qui sequi tempore perferendis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(130, 9, 5, 'Hadir', 'Est et provident et temporibus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(131, 9, 6, 'Sakit', 'Totam id vitae recusandae id quaerat dolorum et.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(132, 9, 8, 'Alfa', 'Voluptatem quo fuga vel sit hic.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(133, 9, 10, 'Alfa', 'Aliquid qui necessitatibus modi magnam quo.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(134, 9, 14, 'Alfa', 'Quis non doloremque esse hic maiores quo modi.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(135, 9, 16, 'Sakit', 'Eos fuga ut ullam veritatis sit vero tempore quis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(136, 9, 17, 'Alfa', 'Quaerat quae et magni pariatur.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(137, 9, 20, 'Sakit', 'Ipsa officiis est quis iure doloribus voluptas.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(138, 9, 24, 'Alfa', 'Quas consequatur praesentium minima perferendis ut.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(139, 9, 35, 'Izin', 'Recusandae dolore dolor dolores autem optio velit enim.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(140, 9, 38, 'Alfa', 'Ipsam id voluptatibus exercitationem recusandae.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(141, 9, 43, 'Izin', 'Libero ullam illo vero est.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(142, 9, 46, 'Hadir', 'Accusamus corrupti ab delectus molestiae voluptatem quia eos.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(143, 9, 48, 'Izin', 'Quasi nostrum dolore est incidunt repudiandae voluptatem natus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(144, 9, 50, 'Sakit', 'Repudiandae explicabo vero ea est quidem quae aut.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(145, 10, 3, 'Sakit', 'Ex quia modi voluptas.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(146, 10, 5, 'Sakit', 'Quae eveniet aut distinctio autem assumenda sunt.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(147, 10, 6, 'Hadir', 'Dolores perspiciatis beatae similique accusantium facilis quod explicabo.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(148, 10, 8, 'Sakit', 'Omnis ut illo nihil sit.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(149, 10, 10, 'Sakit', 'Laudantium qui enim nemo occaecati nihil accusantium vero at.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(150, 10, 14, 'Sakit', 'Ut ea voluptas quos sit.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(151, 10, 16, 'Hadir', 'Sapiente illo a ex modi perspiciatis necessitatibus tempore.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(152, 10, 17, 'Izin', 'Natus reiciendis nihil quam repellendus.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(153, 10, 20, 'Hadir', 'Quia et et porro vel et.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(154, 10, 24, 'Alfa', 'Expedita unde eum eum non tempore qui quia.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(155, 10, 35, 'Hadir', 'Est cum eos rerum nisi velit.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(156, 10, 38, 'Alfa', 'Esse eum modi maxime error aut inventore aut ex.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(157, 10, 43, 'Hadir', 'Hic consequatur voluptatum qui maxime iusto placeat voluptates.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(158, 10, 46, 'Alfa', 'Ipsum esse enim omnis velit amet at quasi.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(159, 10, 48, 'Alfa', 'Aut tempora nam nihil molestiae asperiores corporis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(160, 10, 50, 'Alfa', 'Molestiae voluptatem animi saepe harum facilis et sed itaque.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(161, 11, 7, 'Hadir', 'Eius cupiditate nihil nesciunt earum provident.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(162, 11, 12, 'Izin', 'Fuga nostrum est repudiandae illo rerum.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(163, 11, 13, 'Sakit', 'Possimus dolore veniam id recusandae sed enim.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(164, 11, 18, 'Izin', 'Velit reiciendis totam non fuga quo dicta consequuntur.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(165, 11, 25, 'Sakit', 'Illum non ullam autem nam earum ea vero.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(166, 11, 30, 'Izin', 'Ea omnis doloribus optio et deserunt magnam quis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(167, 11, 34, 'Hadir', 'Aut voluptatem inventore qui mollitia repellat et.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(168, 11, 39, 'Alfa', 'Voluptates vero aut accusamus repellat architecto.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(169, 11, 42, 'Hadir', 'Nemo est perferendis et at laboriosam laboriosam non.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(170, 11, 45, 'Izin', 'Rerum ea tempora cum dicta quidem.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(171, 12, 7, 'Alfa', 'Id quisquam eos consequatur molestiae.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(172, 12, 12, 'Alfa', 'Expedita non doloribus voluptas impedit aliquid et.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(173, 12, 13, 'Izin', 'Voluptate consectetur aliquam quibusdam a.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(174, 12, 18, 'Hadir', 'In dolor consectetur qui voluptas aut eos rerum.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(175, 12, 25, 'Izin', 'Nam quam vel dolorum.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(176, 12, 30, 'Sakit', 'Voluptatem earum enim quasi in qui.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(177, 12, 34, 'Hadir', 'Molestiae aut consectetur dolore est nam mollitia consequatur.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(178, 12, 39, 'Hadir', 'Nihil eius quia voluptas laudantium deleniti minima.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(179, 12, 42, 'Izin', 'Exercitationem eum nulla aut dolorum distinctio commodi.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(180, 12, 45, 'Izin', 'Voluptatem ut rerum omnis deleniti error.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(181, 13, 7, 'Hadir', 'Corrupti voluptatem optio et excepturi voluptas.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(182, 13, 12, 'Alfa', 'Laudantium laudantium dolorem quam aut itaque.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(183, 13, 13, 'Izin', 'Id doloremque mollitia et tempore.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(184, 13, 18, 'Hadir', 'Incidunt neque quod non fugiat asperiores repellendus distinctio.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(185, 13, 25, 'Alfa', 'Dicta sed tempore error porro autem.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(186, 13, 30, 'Izin', 'Quo magnam similique harum.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(187, 13, 34, 'Alfa', 'Assumenda atque hic laboriosam.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(188, 13, 39, 'Sakit', 'Sit sed enim deserunt et reiciendis et.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(189, 13, 42, 'Izin', 'Perspiciatis iste vitae id voluptatem id ut cumque.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(190, 13, 45, 'Sakit', 'Voluptatem dolorem voluptatibus sit neque est accusamus optio.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(191, 14, 7, 'Sakit', 'Atque nobis eum sunt eius officia perspiciatis qui molestias.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(192, 14, 12, 'Izin', 'Voluptatem dignissimos ut aut distinctio magni repellat temporibus maiores.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(193, 14, 13, 'Izin', 'Quidem quisquam molestias quasi earum perferendis quo voluptas.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(194, 14, 18, 'Izin', 'Ad fugiat itaque quibusdam rem tempora quis quibusdam non.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(195, 14, 25, 'Hadir', 'Molestias pariatur qui et debitis consequuntur.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(196, 14, 30, 'Izin', 'Distinctio nobis deleniti ut consequatur in eos.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(197, 14, 34, 'Hadir', 'Eos eligendi rerum architecto id iusto iure qui.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(198, 14, 39, 'Izin', 'Et ad dicta fuga pariatur dolorem ipsa aliquid.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(199, 14, 42, 'Alfa', 'Sunt molestias labore sunt iusto.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(200, 14, 45, 'Izin', 'Velit fugiat neque vitae pariatur.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(201, 15, 7, 'Sakit', 'Voluptatem similique ducimus voluptas rerum mollitia.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(202, 15, 12, 'Hadir', 'Et sint ut vitae.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(203, 15, 13, 'Hadir', 'Tempora aut est illo quia voluptas reiciendis quisquam.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(204, 15, 18, 'Sakit', 'Quisquam nihil at exercitationem neque enim nihil nobis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(205, 15, 25, 'Izin', 'Praesentium quia unde et voluptas commodi voluptatum debitis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(206, 15, 30, 'Alfa', 'Repellat perspiciatis consequuntur dignissimos accusamus non quis.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(207, 15, 34, 'Alfa', 'Cum ab atque impedit minima.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(208, 15, 39, 'Izin', 'Dolore consequatur numquam et occaecati sunt necessitatibus qui odio.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(209, 15, 42, 'Sakit', 'Sequi qui aut voluptatem quia aut voluptate.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(210, 15, 45, 'Sakit', 'Et ratione sunt delectus et autem.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(211, 16, 7, 'Sakit', 'Qui rerum sed quibusdam.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(212, 16, 12, 'Alfa', 'Voluptatibus quae quia voluptatum mollitia quasi.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(213, 16, 13, 'Alfa', 'Ut asperiores facere magni quia ut sunt mollitia.', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(214, 16, 18, 'Izin', 'Dolor necessitatibus sed qui.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(215, 16, 25, 'Alfa', 'Itaque tenetur iusto doloribus corrupti non.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(216, 16, 30, 'Sakit', 'Culpa perferendis placeat similique sed quis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(217, 16, 34, 'Alfa', 'Placeat qui harum similique asperiores et nam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(218, 16, 39, 'Hadir', 'Maxime aut et nulla ab.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(219, 16, 42, 'Alfa', 'Id quia odit explicabo exercitationem harum eum voluptatem.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(220, 16, 45, 'Hadir', 'Perspiciatis amet nesciunt excepturi dolores asperiores.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(221, 17, 7, 'Izin', 'Rerum quasi itaque tenetur quisquam et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(222, 17, 12, 'Alfa', 'Possimus iste et hic libero laudantium rerum et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(223, 17, 13, 'Sakit', 'Illum tenetur voluptatem sed natus quisquam non.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(224, 17, 18, 'Izin', 'Corrupti dolore ipsum unde ut sint perspiciatis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(225, 17, 25, 'Izin', 'Recusandae corrupti illum eum est at magni inventore dignissimos.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(226, 17, 30, 'Izin', 'Ad aliquam est sint autem aut.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(227, 17, 34, 'Hadir', 'Omnis et consequatur ut rerum neque culpa voluptatem.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(228, 17, 39, 'Izin', 'Dolore esse officiis ab odio.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(229, 17, 42, 'Izin', 'Consequatur labore modi aut aliquam voluptatem incidunt aperiam et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(230, 17, 45, 'Sakit', 'Est sit voluptatem quia modi laborum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(231, 18, 7, 'Hadir', 'Ab deleniti ipsa molestias et corrupti libero qui assumenda.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(232, 18, 12, 'Izin', 'Aut quasi quam laudantium nam et quisquam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(233, 18, 13, 'Sakit', 'Temporibus est odio exercitationem praesentium ducimus voluptas adipisci.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(234, 18, 18, 'Sakit', 'Quibusdam occaecati molestiae quis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(235, 18, 25, 'Sakit', 'Blanditiis dicta in officiis in delectus sed.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(236, 18, 30, 'Hadir', 'At quasi qui id et laborum et dolor.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(237, 18, 34, 'Sakit', 'Repellat animi impedit deleniti laboriosam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(238, 18, 39, 'Hadir', 'Id voluptatem quo in est voluptas.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(239, 18, 42, 'Sakit', 'Aut in accusantium possimus ut.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(240, 18, 45, 'Hadir', 'Dicta in nemo et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(241, 19, 7, 'Izin', 'Aut quo ut doloremque libero illum rerum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(242, 19, 12, 'Hadir', 'Ullam voluptatem provident consequuntur voluptate voluptatem atque voluptas.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(243, 19, 13, 'Izin', 'Voluptates soluta inventore ad facilis atque voluptatem.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(244, 19, 18, 'Sakit', 'Magni harum eligendi dolore reiciendis omnis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(245, 19, 25, 'Alfa', 'Laboriosam quae nam minus quod excepturi.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(246, 19, 30, 'Alfa', 'Eos occaecati aut nostrum id.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(247, 19, 34, 'Izin', 'Voluptates rerum debitis qui autem et quis ab.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(248, 19, 39, 'Alfa', 'Enim ipsam eos natus libero commodi adipisci fugiat.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(249, 19, 42, 'Sakit', 'Molestiae aut ab non laborum quisquam magni quia.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(250, 19, 45, 'Izin', 'Qui nam vero aut quia commodi.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(251, 20, 7, 'Sakit', 'Voluptas modi veritatis quam temporibus nam saepe eum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(252, 20, 12, 'Hadir', 'Numquam aut modi delectus non.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(253, 20, 13, 'Alfa', 'Est dolor in deserunt optio qui alias.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(254, 20, 18, 'Sakit', 'Explicabo dolore recusandae qui voluptate.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(255, 20, 25, 'Sakit', 'Eum voluptas sunt maxime.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(256, 20, 30, 'Alfa', 'Doloremque voluptas deserunt facere reprehenderit cum est nesciunt numquam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(257, 20, 34, 'Izin', 'Expedita quis eum voluptas debitis quae voluptatem quo.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(258, 20, 39, 'Hadir', 'Ducimus suscipit facilis asperiores aut provident.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(259, 20, 42, 'Sakit', 'Et commodi repudiandae autem ea quia reprehenderit perferendis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(260, 20, 45, 'Hadir', 'Numquam voluptatibus rem voluptatum rerum qui aliquam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(261, 21, 1, 'Alfa', 'Natus unde esse ipsa sit nihil quam voluptates.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(262, 21, 9, 'Sakit', 'Aut incidunt voluptatem ut omnis et dolores delectus explicabo.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(263, 21, 32, 'Hadir', 'Qui repudiandae ipsum ipsa et dolores officiis alias.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(264, 21, 33, 'Alfa', 'Velit officiis sit tempora voluptatibus sed natus cumque ipsum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(265, 21, 37, 'Hadir', 'Debitis ullam veritatis temporibus.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(266, 21, 47, 'Alfa', 'Consequatur consequatur blanditiis voluptatum sit sequi impedit.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(267, 22, 1, 'Hadir', 'Officia a aspernatur voluptatem.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(268, 22, 9, 'Sakit', 'Ipsum inventore atque laudantium aliquid fugit doloribus.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(269, 22, 32, 'Hadir', 'Ducimus tenetur explicabo exercitationem error veniam quia dolor et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(270, 22, 33, 'Hadir', 'Quidem porro quae id qui sit nihil amet.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(271, 22, 37, 'Hadir', 'Quasi est labore et rem accusantium.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(272, 22, 47, 'Sakit', 'Et earum expedita voluptas laudantium ea sit.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(273, 23, 1, 'Hadir', 'Porro consequatur optio et eligendi.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(274, 23, 9, 'Izin', 'Et fugit expedita quas rerum voluptate.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(275, 23, 32, 'Sakit', 'Et dolor ratione accusamus sint et officia voluptates.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(276, 23, 33, 'Hadir', 'Magnam doloremque itaque esse quia eius sed asperiores.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(277, 23, 37, 'Sakit', 'Quo soluta veritatis eaque aut.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(278, 23, 47, 'Alfa', 'Ut distinctio ab non voluptatibus laborum nihil ratione.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(279, 24, 1, 'Hadir', 'Omnis et tenetur et est omnis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(280, 24, 9, 'Alfa', 'Rerum fugit qui et totam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(281, 24, 32, 'Alfa', 'Quo dolore atque harum vel culpa.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(282, 24, 33, 'Izin', 'Ipsam ut velit praesentium tempora.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(283, 24, 37, 'Izin', 'Aut rerum expedita quia qui vero nobis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(284, 24, 47, 'Sakit', 'Nemo consequatur numquam cum ratione.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(285, 25, 1, 'Izin', 'Voluptatum et aspernatur voluptatem nisi tenetur consequatur.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(286, 25, 9, 'Sakit', 'Facilis ratione soluta ab similique debitis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(287, 25, 32, 'Sakit', 'Nemo vel reprehenderit rerum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(288, 25, 33, 'Hadir', 'Blanditiis aut deleniti sed quod porro.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(289, 25, 37, 'Hadir', 'Ab voluptas accusantium et illo consequatur.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(290, 25, 47, 'Sakit', 'Rerum hic assumenda accusantium harum labore.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(291, 26, 1, 'Hadir', 'Dicta omnis rerum sint veniam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(292, 26, 9, 'Izin', 'Eum nulla est aut tempora aut omnis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(293, 26, 32, 'Izin', 'Praesentium quisquam libero in.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(294, 26, 33, 'Izin', 'Quam odio quia est ipsa voluptatem.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(295, 26, 37, 'Alfa', 'Magnam ad neque a reiciendis nobis omnis quaerat eligendi.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(296, 26, 47, 'Alfa', 'Quia suscipit tenetur non dolorum provident pariatur sit.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(297, 27, 1, 'Izin', 'Ut odio perspiciatis ad perferendis enim nihil.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(298, 27, 9, 'Hadir', 'Quos ea non ducimus laboriosam eius repudiandae.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(299, 27, 32, 'Hadir', 'Sint iure temporibus enim omnis ut alias.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(300, 27, 33, 'Hadir', 'Qui mollitia officiis quia architecto.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(301, 27, 37, 'Izin', 'Animi recusandae et dolore facilis quae.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(302, 27, 47, 'Alfa', 'Praesentium quaerat error quisquam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(303, 28, 1, 'Hadir', 'Molestias et ut quo ipsa ipsa in.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(304, 28, 9, 'Alfa', 'Molestiae mollitia quo possimus odio aut nobis qui.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(305, 28, 32, 'Hadir', 'Et molestiae earum numquam voluptatem voluptatem iure sint.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(306, 28, 33, 'Sakit', 'Qui recusandae exercitationem blanditiis optio omnis sunt omnis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(307, 28, 37, 'Izin', 'Facilis eum et adipisci.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(308, 28, 47, 'Izin', 'Minima ipsum ipsa porro optio.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(309, 29, 1, 'Hadir', 'Esse sed vitae aut enim numquam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(310, 29, 9, 'Hadir', 'Officia et aut ex.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(311, 29, 32, 'Alfa', 'Sed dolorem pariatur facilis doloremque iusto a.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(312, 29, 33, 'Alfa', 'Quod nisi nam tempora ad.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(313, 29, 37, 'Izin', 'Quia vel voluptas est autem est quae dolores eum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(314, 29, 47, 'Sakit', 'Cum et eum reprehenderit itaque.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(315, 30, 1, 'Hadir', 'Delectus harum qui temporibus dolorum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(316, 30, 9, 'Sakit', 'Ut omnis fugiat laborum et quibusdam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(317, 30, 32, 'Hadir', 'Vero voluptatem rerum voluptatem minima id laudantium eos deleniti.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(318, 30, 33, 'Izin', 'Earum possimus velit qui aut fugiat esse consequatur.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(319, 30, 37, 'Alfa', 'Accusamus rem enim possimus dicta sit.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(320, 30, 47, 'Izin', 'Soluta occaecati libero architecto ut repellendus.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(321, 31, 2, 'Alfa', 'Reprehenderit vel quaerat quisquam ex aut nihil.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(322, 31, 15, 'Sakit', 'Temporibus aliquam doloribus dicta ut consectetur fugit facere.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(323, 31, 21, 'Sakit', 'Hic rem dolore sed voluptates eum quasi.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(324, 31, 22, 'Sakit', 'Ad sit molestias reiciendis quibusdam sequi amet itaque qui.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(325, 31, 27, 'Izin', 'Facilis ratione dolores error assumenda in quibusdam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(326, 31, 29, 'Hadir', 'Asperiores consequuntur explicabo doloribus et totam enim ut.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(327, 31, 31, 'Alfa', 'Recusandae magni voluptates incidunt vel numquam et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(328, 31, 40, 'Hadir', 'Mollitia sint repellat tempora occaecati in sed sed est.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(329, 31, 41, 'Alfa', 'Et distinctio neque repellat a quo voluptas totam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(330, 32, 2, 'Alfa', 'Facere non aut similique cupiditate voluptatem sint inventore.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(331, 32, 15, 'Hadir', 'Excepturi quia et repellat ut dolorem nihil.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(332, 32, 21, 'Sakit', 'Exercitationem excepturi ullam vel culpa veritatis dolorem.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(333, 32, 22, 'Sakit', 'Ex quia sequi non facere ut quasi.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(334, 32, 27, 'Izin', 'Ut ipsum rem dolorem et incidunt ab.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(335, 32, 29, 'Alfa', 'Sint voluptatem et dolores enim.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(336, 32, 31, 'Sakit', 'Soluta commodi quidem voluptatem libero.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(337, 32, 40, 'Sakit', 'Harum voluptas quis temporibus id eos ut.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(338, 32, 41, 'Hadir', 'Omnis maiores esse iusto dolore sed maiores.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(339, 33, 2, 'Hadir', 'Qui atque id iusto vel et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(340, 33, 15, 'Sakit', 'Dolor ut et nulla molestiae a est.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(341, 33, 21, 'Izin', 'Aut vero incidunt quo vitae corporis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(342, 33, 22, 'Alfa', 'Voluptatem earum voluptatem velit molestiae est nihil ducimus.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(343, 33, 27, 'Sakit', 'Ipsum tenetur qui sit consectetur.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(344, 33, 29, 'Sakit', 'Cum repudiandae ipsum molestiae ullam praesentium nihil sit fugiat.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(345, 33, 31, 'Hadir', 'Possimus esse quasi incidunt consequatur eligendi sint quod.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(346, 33, 40, 'Hadir', 'Quidem in est accusamus totam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(347, 33, 41, 'Hadir', 'Error dolores molestiae deserunt et rerum ut.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(348, 34, 2, 'Hadir', 'Numquam et consequatur repellat perspiciatis repellendus.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(349, 34, 15, 'Alfa', 'Excepturi assumenda esse sit et dignissimos aperiam sunt.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(350, 34, 21, 'Alfa', 'Nulla sed tempora minima voluptas temporibus reiciendis doloribus.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(351, 34, 22, 'Sakit', 'Dolorem amet vel quasi tenetur odio doloremque consequatur.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(352, 34, 27, 'Sakit', 'Molestiae eligendi aperiam et nostrum et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(353, 34, 29, 'Sakit', 'Impedit veritatis hic iusto reiciendis accusamus accusamus quisquam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(354, 34, 31, 'Sakit', 'Velit ipsum et sit enim est voluptate.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(355, 34, 40, 'Sakit', 'Dignissimos sunt sunt occaecati.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(356, 34, 41, 'Hadir', 'Sed qui hic porro ducimus.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(357, 35, 2, 'Izin', 'Debitis quia repellendus porro quae esse nam sint.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(358, 35, 15, 'Alfa', 'Quisquam labore dolorem ipsa deserunt.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(359, 35, 21, 'Sakit', 'Vel laboriosam maiores aut.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(360, 35, 22, 'Alfa', 'Eum quis maiores praesentium et perspiciatis consequatur.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(361, 35, 27, 'Alfa', 'Voluptatibus quis sed similique tempora.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(362, 35, 29, 'Hadir', 'Provident neque amet quia esse tempore voluptatem esse.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(363, 35, 31, 'Sakit', 'Accusamus tempore excepturi reiciendis reprehenderit rerum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(364, 35, 40, 'Alfa', 'Sint quis libero eligendi impedit ad et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(365, 35, 41, 'Izin', 'Iure sunt expedita non sequi.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(366, 36, 2, 'Hadir', 'Vero accusamus et voluptatem aut eligendi.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(367, 36, 15, 'Sakit', 'Autem hic quia non modi voluptatem.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(368, 36, 21, 'Izin', 'Enim cumque aut odit rerum in.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(369, 36, 22, 'Izin', 'Deleniti repellat adipisci ex et blanditiis quisquam enim in.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(370, 36, 27, 'Izin', 'Aperiam dolore perferendis vero et optio eum autem.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(371, 36, 29, 'Izin', 'Voluptas quas amet repellendus earum nisi.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(372, 36, 31, 'Sakit', 'Sint nostrum ipsum aut iste incidunt sapiente.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(373, 36, 40, 'Sakit', 'Et ipsum et aliquid consequuntur possimus esse eius expedita.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(374, 36, 41, 'Izin', 'Quia magnam id recusandae.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(375, 37, 2, 'Izin', 'Et voluptatem reiciendis sit.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(376, 37, 15, 'Izin', 'Et occaecati minima dolorum sunt animi.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(377, 37, 21, 'Sakit', 'Repellendus quae numquam repellat voluptatum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(378, 37, 22, 'Sakit', 'Excepturi quam explicabo omnis temporibus non.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(379, 37, 27, 'Sakit', 'Soluta aut cum quas eos commodi consequatur et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(380, 37, 29, 'Alfa', 'Sapiente et autem tenetur.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(381, 37, 31, 'Izin', 'Rem ducimus aut illum laboriosam id.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(382, 37, 40, 'Sakit', 'Fugiat minima quasi aut aliquid enim.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(383, 37, 41, 'Hadir', 'Nam delectus atque neque odio sit.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(384, 38, 2, 'Alfa', 'Neque fugiat velit sint voluptas.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(385, 38, 15, 'Hadir', 'Itaque dicta dolores accusantium quaerat et labore.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(386, 38, 21, 'Izin', 'Et tempore labore accusantium ipsa nesciunt similique voluptatibus.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(387, 38, 22, 'Alfa', 'Totam impedit occaecati vel illum necessitatibus soluta.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(388, 38, 27, 'Sakit', 'Deserunt perspiciatis tempore qui voluptates reiciendis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(389, 38, 29, 'Sakit', 'Dolores minus molestiae qui qui explicabo ut.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(390, 38, 31, 'Sakit', 'Veritatis ratione soluta non molestiae dolores aut minus.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(391, 38, 40, 'Sakit', 'Inventore ut esse amet est eos odit.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(392, 38, 41, 'Sakit', 'Dolorum architecto iusto enim magni.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(393, 39, 2, 'Izin', 'Quia nesciunt voluptatem sapiente doloremque quia repudiandae ad.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(394, 39, 15, 'Izin', 'Aut vitae quisquam sint voluptate nesciunt qui.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(395, 39, 21, 'Izin', 'Alias aliquid dolor doloremque delectus aliquid maiores.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(396, 39, 22, 'Izin', 'Reprehenderit quia et consequuntur eos.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(397, 39, 27, 'Sakit', 'Voluptatem eos suscipit repellendus dicta et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(398, 39, 29, 'Sakit', 'Dolor ut repellat porro asperiores reiciendis assumenda.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(399, 39, 31, 'Hadir', 'Necessitatibus eos sit itaque praesentium rerum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(400, 39, 40, 'Alfa', 'Et nobis repudiandae totam et non.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(401, 39, 41, 'Hadir', 'Quod nesciunt non est cupiditate.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(402, 40, 2, 'Izin', 'Quos qui deserunt voluptas aut totam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(403, 40, 15, 'Alfa', 'Impedit rerum porro perferendis est dolor architecto qui nulla.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(404, 40, 21, 'Alfa', 'Consequuntur quasi in deserunt fugit sint.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(405, 40, 22, 'Hadir', 'Minima mollitia qui voluptatum ea dignissimos quia sunt saepe.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(406, 40, 27, 'Sakit', 'Sit dolore qui praesentium.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(407, 40, 29, 'Izin', 'Quam eligendi voluptatem eum laborum amet incidunt.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(408, 40, 31, 'Sakit', 'Molestias vel tempore ea nesciunt sit excepturi ea.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(409, 40, 40, 'Hadir', 'Nisi dolorum corporis soluta libero.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(410, 40, 41, 'Hadir', 'Sint in quaerat aut aut veniam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(411, 41, 4, 'Hadir', 'Incidunt atque corporis magni voluptates.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(412, 41, 11, 'Hadir', 'Sapiente aut illum magni libero repellendus eaque.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(413, 41, 19, 'Alfa', 'Est incidunt quaerat odit quia quasi.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(414, 41, 23, 'Hadir', 'Voluptate minus dolorem praesentium natus ea impedit numquam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(415, 41, 26, 'Alfa', 'Eum et est aut qui.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(416, 41, 28, 'Izin', 'In sint vel voluptatem quia quia excepturi cupiditate nihil.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(417, 41, 36, 'Sakit', 'Ipsa est esse esse dolorem.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(418, 41, 44, 'Sakit', 'Magni ut et ex maiores delectus.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(419, 41, 49, 'Alfa', 'Facere consequuntur deserunt et sint natus quae.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(420, 42, 4, 'Alfa', 'Sunt cum rerum rerum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(421, 42, 11, 'Sakit', 'Numquam optio nesciunt mollitia delectus.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(422, 42, 19, 'Alfa', 'Incidunt et quibusdam modi quaerat corrupti.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(423, 42, 23, 'Alfa', 'Quia facere hic nihil veniam pariatur facere debitis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(424, 42, 26, 'Sakit', 'Optio nisi commodi architecto maiores reiciendis neque.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(425, 42, 28, 'Sakit', 'Quia error sed quo quasi est vel enim consequatur.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(426, 42, 36, 'Alfa', 'Ad error ipsam qui qui est hic aperiam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(427, 42, 44, 'Sakit', 'Vel iste et dolorem maxime.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(428, 42, 49, 'Hadir', 'Dolor dolor quo quo et expedita est.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(429, 43, 4, 'Hadir', 'Distinctio facilis laborum voluptas consequatur sit quae.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(430, 43, 11, 'Hadir', 'Adipisci porro aut perspiciatis eos sed.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(431, 43, 19, 'Alfa', 'Cumque necessitatibus est corporis ea minima odit.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(432, 43, 23, 'Alfa', 'Et officiis sed et vel perferendis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36');
INSERT INTO `attendances` (`id`, `meeting_id`, `mentee_id`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(433, 43, 26, 'Hadir', 'Animi inventore aut vitae esse quidem vitae ut sint.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(434, 43, 28, 'Izin', 'Voluptatem commodi perferendis ipsum excepturi autem ut soluta.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(435, 43, 36, 'Izin', 'Fugit officiis ullam nihil voluptas quod.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(436, 43, 44, 'Alfa', 'Aliquid quo maxime sint consequatur reiciendis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(437, 43, 49, 'Hadir', 'Omnis expedita aliquid quasi quis similique quis facere voluptatum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(438, 44, 4, 'Sakit', 'Enim possimus et id omnis et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(439, 44, 11, 'Izin', 'Deserunt assumenda architecto temporibus voluptatum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(440, 44, 19, 'Sakit', 'Dolorem voluptates nihil est qui.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(441, 44, 23, 'Hadir', 'Ea nostrum aut consequatur eveniet nemo possimus.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(442, 44, 26, 'Sakit', 'Omnis velit sed quae et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(443, 44, 28, 'Izin', 'Rerum non rerum velit recusandae temporibus quae.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(444, 44, 36, 'Hadir', 'Suscipit aut consequuntur architecto consequatur in.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(445, 44, 44, 'Sakit', 'Repudiandae eveniet suscipit aperiam dolorum quam est.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(446, 44, 49, 'Sakit', 'Eum excepturi asperiores in veritatis alias excepturi ad.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(447, 45, 4, 'Alfa', 'Voluptas ducimus dicta et autem ratione nobis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(448, 45, 11, 'Izin', 'Saepe vel quia veniam consequatur aperiam neque suscipit.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(449, 45, 19, 'Alfa', 'Et non voluptatem aut eveniet nam est odio.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(450, 45, 23, 'Alfa', 'Illum dolore corporis ut velit asperiores fugiat amet.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(451, 45, 26, 'Alfa', 'Non molestiae beatae cupiditate praesentium sed.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(452, 45, 28, 'Alfa', 'Qui tenetur adipisci enim itaque ipsam recusandae et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(453, 45, 36, 'Sakit', 'Numquam rerum nam quia et placeat.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(454, 45, 44, 'Sakit', 'Aliquam dignissimos non qui repellendus soluta aut earum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(455, 45, 49, 'Hadir', 'Voluptatem soluta quia quia sit dicta.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(456, 46, 4, 'Sakit', 'Sunt dignissimos voluptatem est in earum impedit dolore.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(457, 46, 11, 'Izin', 'Molestias eos quos ut sed.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(458, 46, 19, 'Hadir', 'Dignissimos omnis in repellendus eos fugiat.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(459, 46, 23, 'Hadir', 'At at et earum omnis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(460, 46, 26, 'Hadir', 'Deserunt et quos consectetur et quo distinctio vel.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(461, 46, 28, 'Hadir', 'Repellendus dolorem quam laboriosam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(462, 46, 36, 'Izin', 'Facere autem corrupti hic nihil nulla.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(463, 46, 44, 'Izin', 'Repellendus cumque iure et eum ipsam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(464, 46, 49, 'Izin', 'Aliquid optio ipsum ratione odio dolorem ut.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(465, 47, 4, 'Izin', 'Modi quo aut magni pariatur sed debitis non.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(466, 47, 11, 'Izin', 'Non nobis aut perspiciatis odio.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(467, 47, 19, 'Izin', 'Et minima aut beatae saepe ut laborum similique.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(468, 47, 23, 'Izin', 'Veniam saepe quia deserunt quam omnis blanditiis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(469, 47, 26, 'Sakit', 'Vel quia inventore in unde.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(470, 47, 28, 'Sakit', 'Consequatur dolorum rerum quod iste quas rerum reiciendis.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(471, 47, 36, 'Sakit', 'Repellat id omnis impedit maxime ipsam enim.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(472, 47, 44, 'Alfa', 'Reiciendis porro aliquam nihil aut cupiditate ut error.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(473, 47, 49, 'Sakit', 'Nam sit ipsum qui molestiae.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(474, 48, 4, 'Sakit', 'Atque quis voluptatem recusandae vel inventore voluptas.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(475, 48, 11, 'Sakit', 'Qui exercitationem veritatis repellat porro.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(476, 48, 19, 'Alfa', 'Nihil numquam at dolor odit alias.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(477, 48, 23, 'Izin', 'Omnis minima libero quod consequuntur.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(478, 48, 26, 'Sakit', 'Quis quasi voluptas quaerat id.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(479, 48, 28, 'Izin', 'Suscipit deserunt sit aliquam quaerat atque quia.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(480, 48, 36, 'Sakit', 'Ipsum pariatur blanditiis voluptate ullam doloribus vitae.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(481, 48, 44, 'Sakit', 'Quia consequuntur commodi ea a.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(482, 48, 49, 'Alfa', 'Iste ullam vel ea.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(483, 49, 4, 'Sakit', 'Laborum ipsa corrupti eum quisquam laboriosam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(484, 49, 11, 'Izin', 'Facere reiciendis aut minima commodi labore.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(485, 49, 19, 'Sakit', 'Rerum quos dolorem error culpa.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(486, 49, 23, 'Sakit', 'Aperiam corporis commodi culpa eum magni sint ratione.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(487, 49, 26, 'Izin', 'Fugiat beatae a aut ea et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(488, 49, 28, 'Sakit', 'Sequi architecto aliquid hic libero illo.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(489, 49, 36, 'Hadir', 'Corporis quas dolores velit.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(490, 49, 44, 'Alfa', 'Et doloremque et magni ipsum.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(491, 49, 49, 'Hadir', 'Quibusdam est et beatae in.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(492, 50, 4, 'Alfa', 'Officia reprehenderit eaque distinctio error totam sapiente qui.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(493, 50, 11, 'Alfa', 'Magni culpa ut sit optio.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(494, 50, 19, 'Alfa', 'Enim assumenda ut rem harum dolores.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(495, 50, 23, 'Sakit', 'Blanditiis perferendis fugiat sint et.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(496, 50, 26, 'Sakit', 'Rerum eaque illum sit voluptas id.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(497, 50, 28, 'Sakit', 'Dolores minima et ullam dignissimos eum accusamus deserunt.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(498, 50, 36, 'Sakit', 'Asperiores est ea tenetur perspiciatis iste.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(499, 50, 44, 'Izin', 'Exercitationem est animi quam eum qui sint.', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(500, 50, 49, 'Sakit', 'At ea minima aut omnis sapiente ullam.', '2025-10-22 09:56:36', '2025-10-22 09:56:36');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('jejakliqo-cache-5c785c036466adea360111aa28563bfd556b5fba', 'i:1;', 1761102281),
('jejakliqo-cache-5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1761102281;', 1761102281);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint UNSIGNED NOT NULL,
  `group_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `mentor_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `description`, `mentor_id`, `created_at`, `updated_at`) VALUES
(1, 'Kelompok eos', 'Itaque dolorem vel vitae facilis optio tempora.', 5, '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(2, 'Kelompok iusto', 'Fuga labore eum inventore dolores reprehenderit non voluptatem.', 7, '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(3, 'Kelompok sed', 'Nesciunt consequatur consequatur cumque.', 3, '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(4, 'Kelompok vitae', 'Asperiores earum unde saepe laboriosam.', 11, '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(5, 'Kelompok incidunt', 'Et rerum ipsa totam inventore expedita rerum velit.', 6, '2025-10-22 09:56:35', '2025-10-22 09:56:35');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `mentor_id` bigint UNSIGNED NOT NULL,
  `meeting_date` date NOT NULL,
  `place` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topic` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `meeting_type` enum('Online','Offline') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Offline',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`id`, `group_id`, `mentor_id`, `meeting_date`, `place`, `topic`, `notes`, `meeting_type`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '2025-06-18', '100 Beahan Fields Apt. 548\nBerenicechester, WA 94196-8480', 'Materi: Voluptatem minus vero quos.', 'Beatae magnam temporibus cumque necessitatibus vitae vel. Sint libero et laborum. Ipsum quos quia sit corporis. Voluptatum quam ut asperiores culpa.', 'Offline', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(2, 1, 5, '2025-06-13', '41256 Waylon Flats\nNorth Vivienne, PA 42278', 'Materi: Expedita est autem autem unde.', 'Numquam autem aspernatur atque illo odit. Est rerum unde suscipit nobis quia dignissimos. Et qui unde aut officiis.', 'Online', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(3, 1, 5, '2024-11-18', '944 Brock Junctions\nLake Pansy, CO 62201-5496', 'Materi: Natus aut veniam et.', 'Rerum porro sunt doloribus commodi nihil reprehenderit. Necessitatibus est officia ex eum et aliquid sapiente. Adipisci necessitatibus et recusandae velit dignissimos veritatis.', 'Offline', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(4, 1, 5, '2024-10-28', '50057 Darby Harbors\nSouth Monserrat, WI 16688-0829', 'Materi: Vel aut odit.', 'Est dicta sunt adipisci quia. Quis non unde nostrum et eos et vel.', 'Online', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(5, 1, 5, '2025-01-24', '40338 Katlynn Centers Suite 429\nEdmundchester, SD 82135', 'Materi: Omnis atque dolore tempora.', 'Officiis velit est provident officia. In cum sed voluptatum ut temporibus consequatur. Voluptatibus culpa voluptatem facere deleniti. Maxime quia tempora molestias vel.', 'Offline', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(6, 1, 5, '2025-01-24', '514 Grady Roads Apt. 862\nBertramton, TN 56953-5204', 'Materi: Eveniet et beatae rerum.', 'Ratione saepe suscipit ut est qui eos non. Qui officiis blanditiis numquam repellendus quo a hic. Quia eum temporibus incidunt molestias. Tenetur incidunt voluptatem sint aut cupiditate rerum asperiores qui.', 'Online', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(7, 1, 5, '2025-06-13', '4267 Thiel Plaza\nNew Guy, VA 90721-5573', 'Materi: Libero aut soluta.', 'Fugit similique rerum magnam et est et repellendus. Quae fuga voluptatibus alias laboriosam fugiat dolore. Libero ut in sunt sunt eum minima et.', 'Online', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(8, 1, 5, '2024-12-06', '37767 Ernser Parkway Suite 442\nReynoldsmouth, HI 29489', 'Materi: Quidem corporis iusto.', 'Autem velit harum aspernatur eum molestias. Est in ipsum tempore aut. Sequi tenetur tenetur voluptates ullam. Ut et eligendi et assumenda officia consequatur blanditiis adipisci.', 'Online', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(9, 1, 5, '2025-07-25', '8712 Viva Stravenue Apt. 547\nPriceside, CT 38909', 'Materi: Reprehenderit nemo modi nobis et.', 'Molestiae odit voluptatibus delectus vero. Est maxime voluptatem est est sit.', 'Offline', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(10, 1, 5, '2025-09-30', '1663 Gleason Terrace Suite 519\nConnmouth, IA 68398', 'Materi: Aliquam repellendus voluptatem.', 'Et voluptas est ea magnam perspiciatis. Voluptates ea omnis et dolores necessitatibus et odio. Omnis alias libero officia. Consequuntur nihil iusto commodi dolor eius.', 'Offline', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(11, 2, 7, '2025-07-19', '315 Jonathan Via Apt. 212\nNorth Ofelia, AL 87263', 'Materi: Expedita ratione.', 'Tenetur labore totam odio ut. Corrupti hic rerum nulla provident odit qui voluptas. Tempora omnis qui odio et.', 'Offline', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(12, 2, 7, '2025-05-10', '9510 Raynor Freeway Apt. 760\nJaquelinmouth, NC 11208-4565', 'Materi: Autem fuga quis iusto est.', 'Ut soluta quos molestias omnis. Fuga in sunt est sit exercitationem dolor eligendi unde. Sed porro itaque quo qui.', 'Online', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(13, 2, 7, '2025-08-19', '20199 Feeney Ferry Apt. 256\nSouth Melodychester, NM 28820', 'Materi: Inventore molestiae nam.', 'Eaque corporis qui dolorem dolorum aut aut. Nisi quia error dolore rem soluta. Quisquam odit aut adipisci aliquid.', 'Online', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(14, 2, 7, '2024-11-04', '8610 Rolfson Mountain\nLogantown, GA 29123-6765', 'Materi: Consequuntur dolorum architecto in.', 'Et magnam quia dolor non ex id dicta odio. Cupiditate omnis necessitatibus dolor quod maiores repellat. Est vel possimus fugit dolores.', 'Online', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(15, 2, 7, '2025-02-11', '676 Carlee Plaza\nEast Dorothea, CA 26350-9836', 'Materi: Similique ut autem.', 'Voluptas quis et quos ut eaque rem et officiis. Praesentium facilis dicta pariatur omnis in aperiam voluptatem. Quae et nesciunt eius mollitia.', 'Online', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(16, 2, 7, '2025-05-01', '25193 Johnpaul Junction\nLuiston, KS 24422-1154', 'Materi: Tenetur tempore nihil.', 'Eveniet mollitia sapiente sit ea veritatis. Libero corrupti quia et animi. Facilis cumque vero deserunt quo quia quisquam eos. Provident illo ut illum ut quo in dolores consequatur. Occaecati quo a mollitia ipsum.', 'Offline', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(17, 2, 7, '2025-01-08', '2601 Torphy Highway\nLetitiatown, KS 94664', 'Materi: Neque ullam molestiae ea.', 'Id qui exercitationem facilis nobis natus. Iste eligendi excepturi rerum voluptas eaque. Sapiente ullam beatae suscipit ut dolores qui animi eius. Sunt tempore pariatur temporibus.', 'Offline', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(18, 2, 7, '2025-06-14', '816 O\'Connell Stravenue Apt. 784\nNew Rahulstad, TN 77260-4792', 'Materi: Odio minus vel.', 'Sunt et delectus explicabo animi consequatur. Similique ratione ut autem voluptatem ut aut perferendis. Mollitia illo enim et ea odit. Rerum qui atque ut ullam ipsa. Et quo sunt consequatur incidunt.', 'Online', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(19, 2, 7, '2025-01-21', '4486 Alanna Vista Suite 229\nAshahaven, AK 37716-9732', 'Materi: Eligendi provident.', 'Beatae numquam adipisci dolorem consequatur ipsum. Ut consequatur sunt deserunt suscipit. Consequatur harum commodi soluta qui. Quaerat sed vel architecto vel ut doloribus laboriosam.', 'Offline', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(20, 2, 7, '2025-09-27', '50003 Greg Gateway Suite 434\nSouth Markstad, LA 51533', 'Materi: Omnis veniam laborum.', 'Voluptatibus et nemo nam velit nihil mollitia aut. Ratione voluptatibus aut omnis assumenda aliquid omnis nihil. Fugiat consequatur ipsam nam. Et voluptas earum qui culpa vel repudiandae error.', 'Offline', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(21, 3, 3, '2025-01-14', '43279 Rath Valleys\nNorth Marinaton, ND 31539-5936', 'Materi: Molestiae et facilis ut.', 'Dolorem qui provident dolor omnis. Iusto assumenda quidem ratione.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(22, 3, 3, '2025-06-17', '80789 Carroll Shoal\nPort Brooksfort, FL 24760', 'Materi: Voluptas sint dolor.', 'Qui enim molestiae dolore est dolor nesciunt. Voluptatem repellat temporibus ut labore dicta omnis cum. Explicabo et eligendi at qui. Blanditiis ipsam unde iure unde placeat ducimus impedit. Eum voluptatum quia ea qui.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(23, 3, 3, '2025-01-13', '2567 Carmel Lodge\nWest Dominique, MD 40813', 'Materi: Rem sapiente non dolor.', 'Accusamus est omnis eum dolore laborum molestias. Voluptatem quasi dicta quibusdam quos ut amet sequi delectus. Sit qui magni ratione explicabo impedit veniam voluptas.', 'Online', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(24, 3, 3, '2025-04-30', '69774 Enoch Parkway Apt. 766\nChadrickland, IA 76684', 'Materi: Odit animi repellendus.', 'Et ut et enim sit iure. Pariatur quia qui cupiditate perspiciatis. Quia hic beatae dolores.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(25, 3, 3, '2025-04-08', '240 Bosco Neck Apt. 219\nPort Alexanne, WV 07503-3451', 'Materi: Officiis eos alias eos.', 'Et tempore tempore magni aut in laudantium. Iure tempore totam doloribus qui quidem. Repellat commodi inventore sit assumenda ut et.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(26, 3, 3, '2024-10-22', '550 Volkman Expressway Apt. 106\nNorth Daishastad, IA 63048-2163', 'Materi: Aut repellendus.', 'Autem quod itaque eos. Consequuntur sit et voluptas sed deserunt illum. Excepturi odit autem sed molestiae pariatur et.', 'Online', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(27, 3, 3, '2025-03-22', '57966 Giovani Extension\nVerdietown, GA 03285', 'Materi: Perspiciatis fugiat officia.', 'Harum sunt quod ea deleniti. Voluptates voluptate velit et. Quia et molestiae ipsam laborum repellendus. Vero nihil nostrum non quod harum rerum et quis.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(28, 3, 3, '2025-10-16', '582 Gottlieb Isle Suite 805\nGloverside, WA 58270', 'Materi: Id dignissimos nostrum.', 'Temporibus consectetur ad qui sit repellat iste. Blanditiis amet blanditiis reprehenderit in explicabo. Veritatis voluptas culpa nobis fuga eaque est aliquid.', 'Online', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(29, 3, 3, '2025-06-22', '58503 Lubowitz Crossing Suite 619\nMohamedburgh, DC 46967-7258', 'Materi: Odit odio quaerat.', 'Omnis quia numquam placeat deleniti sed est beatae. Est temporibus aperiam ullam ut ea. Dolorem adipisci magni quia explicabo. Ab ab et quasi tempore sit.', 'Online', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(30, 3, 3, '2025-06-28', '14567 Christelle Points\nNew Connie, WV 19478', 'Materi: Vero non quae beatae.', 'Modi sit quia totam consectetur quo nobis. Reiciendis maxime vel sit impedit. Blanditiis veritatis facere neque quos aliquam distinctio aliquam. Consequatur quas vero quia sint saepe.', 'Online', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(31, 4, 11, '2025-01-25', '6643 Tillman Street\nGabrielbury, IL 43173-5677', 'Materi: A cumque fugiat a.', 'Voluptatem rem provident totam ut enim aut. Et nesciunt porro non et error. Reiciendis expedita quidem quidem culpa ipsam impedit. Sit ab libero ut vitae.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(32, 4, 11, '2025-08-19', '863 Nyasia Park\nRaymondfort, AL 61937-9977', 'Materi: Aut dolorem minima optio esse.', 'Modi quo et cum est quia est necessitatibus. Neque sit sed saepe saepe quae. Ut quia id consequatur in neque. Ut tempore vel quis accusamus consequatur quae.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(33, 4, 11, '2025-06-06', '817 Tremayne Roads Apt. 513\nPort Gus, ME 59391', 'Materi: Id exercitationem fugiat vero.', 'Omnis placeat quod possimus. Dignissimos quia natus eveniet perspiciatis. Ad quam velit unde corporis ut neque.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(34, 4, 11, '2025-05-03', '27554 Shany Parks Apt. 761\nCristmouth, WI 83536-7398', 'Materi: At aliquam sequi.', 'Molestiae magni dolor ut aut laborum dolor sed. In voluptas vero tenetur voluptas asperiores assumenda. Sint laborum blanditiis molestias tenetur modi.', 'Online', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(35, 4, 11, '2025-04-23', '32096 Denesik Plain\nHegmannbury, AL 57802-7076', 'Materi: Ipsum aut aspernatur et.', 'Alias asperiores quasi non molestias. Aut ex beatae cumque inventore. Voluptatem at amet quaerat reiciendis.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(36, 4, 11, '2025-08-04', '37575 Beer Forge\nPort Lavada, IA 03605-0277', 'Materi: Iure commodi quidem.', 'Mollitia rerum maxime et rerum aut. Enim soluta molestias distinctio reiciendis aut perspiciatis. Ea aliquam veniam magni quo sunt omnis. Asperiores qui est omnis molestiae.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(37, 4, 11, '2025-03-20', '691 Yasmine Court Suite 922\nNorth Hoytview, NM 93320', 'Materi: Quasi possimus omnis cumque.', 'Debitis illum ratione non. Qui et qui facere et voluptatem dolor dignissimos.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(38, 4, 11, '2025-03-05', '126 Gerhold Spurs\nReynoldsberg, UT 84389-9924', 'Materi: Consequatur nesciunt quam autem.', 'Nostrum veritatis quo dolores sed qui ut. Asperiores labore quos dolorum. Et quis dolorem aut sint unde. Atque libero porro cumque expedita fuga neque.', 'Online', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(39, 4, 11, '2025-06-15', '34223 Chaz Roads Suite 233\nEast Jarenberg, IN 39765', 'Materi: Iusto placeat fuga fugit.', 'Quia natus impedit quaerat nam in a quia. Saepe earum dolor totam quia. Sed omnis doloribus culpa impedit. Voluptas aperiam a et dolorum quibusdam.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(40, 4, 11, '2025-08-03', '33561 Arch Terrace\nNitzscheville, AR 96368', 'Materi: Repellendus velit illo aut.', 'Voluptatum est maxime minus natus. Maxime quis itaque repellendus id esse est. Dolore dolores minus perspiciatis aspernatur. Exercitationem corporis vel nobis suscipit vero ut et.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(41, 5, 6, '2025-04-22', '96176 Hegmann Gateway\nNew Alphonso, KS 27274', 'Materi: Veritatis quod omnis.', 'Id corporis soluta sequi consequatur qui doloribus aperiam labore. Non quia et autem non quasi eveniet est. Eos in maiores aut et praesentium amet esse tempore.', 'Online', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(42, 5, 6, '2025-10-04', '60600 Corrine Manor Apt. 324\nSouth Frederick, KY 36242-8393', 'Materi: Qui enim non aut.', 'Porro mollitia voluptas vel harum id optio. Quo laborum aut ea neque. Itaque praesentium ex maxime quas. Ducimus quia quasi consectetur.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(43, 5, 6, '2024-12-10', '4269 Gusikowski Corners\nJoannechester, MN 80073-4278', 'Materi: Quibusdam incidunt perspiciatis laborum.', 'Est optio ipsum quae possimus voluptate perspiciatis deleniti. Voluptatem quos est iusto et tempore dicta ad. Laudantium ea voluptas consectetur. Deserunt dolorum eum odio quasi aliquid.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(44, 5, 6, '2025-07-24', '34012 Pacocha Streets\nNorth Mohamedfort, NH 76005', 'Materi: Consequuntur in ullam ducimus.', 'Eius praesentium recusandae aliquid non maiores sit voluptatem. Minus cumque error veniam est vel aut consequuntur. Molestiae perspiciatis dolorem omnis laborum sapiente impedit voluptas. Est doloribus sunt exercitationem non.', 'Online', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(45, 5, 6, '2025-01-04', '10615 Reichert Unions\nPort Demarcusport, IA 76899', 'Materi: Non vitae aut.', 'Possimus labore ipsam est quae. Sunt error est autem dolorum facilis. Provident voluptatem fugit porro vel. Itaque et quia labore quia.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(46, 5, 6, '2024-12-13', '852 Demarcus Cliffs\nMullermouth, WY 41010-9914', 'Materi: Ratione ducimus magnam eos.', 'Iusto vero dolore ipsum est dignissimos. Consequuntur quam facere porro modi maiores aut. Laudantium et laudantium quis vitae. Omnis suscipit rem fugiat facere eligendi.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(47, 5, 6, '2025-09-21', '6696 Ryan Flats\nEast Gretaton, NC 22305', 'Materi: Neque adipisci earum id.', 'Aliquam sint quasi quae quisquam consectetur. Ea corporis similique consectetur minima aliquam. Sint accusamus sed ea quia non quidem voluptate. Sed voluptatum dolorem quo totam voluptatibus.', 'Online', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(48, 5, 6, '2025-06-09', '80660 Jasmin Rest\nLednerside, MA 25571-8739', 'Materi: Qui deserunt laborum.', 'Corrupti est molestias quasi nisi. Repudiandae sit ad saepe suscipit.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(49, 5, 6, '2024-10-30', '748 Vincent Union Suite 411\nSimoneport, IN 93446', 'Materi: Dolores voluptate dicta quibusdam perspiciatis.', 'Reprehenderit omnis eum rem qui eius non quia. Nisi adipisci occaecati a voluptate alias. Harum velit earum perspiciatis.', 'Offline', '2025-10-22 09:56:36', '2025-10-22 09:56:36'),
(50, 5, 6, '2025-10-19', '9083 Nader Plains\nBlandastad, CT 45227-7551', 'Materi: Expedita quisquam ipsa ipsum.', 'Maxime velit sequi officia sed. Aut velit sit nemo et. Aut in sed sapiente rerum.', 'Online', '2025-10-22 09:56:36', '2025-10-22 09:56:36');

-- --------------------------------------------------------

--
-- Table structure for table `mentees`
--

CREATE TABLE `mentees` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity_class` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hobby` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Aktif','Lulus','Nonaktif') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mentees`
--

INSERT INTO `mentees` (`id`, `group_id`, `full_name`, `nickname`, `birth_date`, `phone_number`, `activity_class`, `hobby`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Dr. Roy Wiegand Sr.', 'Golda', '2003-06-24', '+1 (302) 254-4342', 'Kelas 2 Liqo', 'officiis', '63977 Marques Hill Suite 131\nWebsterborough, KY 77035', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(2, 4, 'Rusty Becker III', 'Manuel', '1979-06-10', '212-505-8030', 'Kelas 3 Liqo', 'vitae', '577 Okuneva Rest\nNew Waltonberg, SC 39411-7535', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(3, 1, 'Prof. Coy Runolfsdottir Sr.', 'Rebekah', '2004-06-30', '+1.541.309.4397', 'Kelas 2 Liqo', 'dolore', '3099 Iva Garden\nEast Kaylahaven, NJ 76510-0966', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(4, 5, 'Florine Christiansen', 'Modesto', '2014-07-19', '361-799-0439', 'Kelas 1 Liqo', 'rerum', '24791 Runolfsdottir Shoals Suite 195\nLake Alysonfort, OK 66370-0182', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(5, 1, 'Lonny Rutherford', 'Sherwood', '1982-04-06', '(856) 477-1544', 'Kelas 1 Liqo', 'reprehenderit', '236 Laney Radial\nSouth Jarvisshire, UT 20609-8224', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(6, 1, 'Chad Hagenes', 'Georgianna', '1984-04-27', '+1.830.696.7665', 'Kelas 2 Liqo', 'nihil', '106 Orville Rue Apt. 047\nBaileyfort, OH 85423', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(7, 2, 'Tre Cremin', 'Jon', '2001-09-25', '+1-419-700-4762', 'Kelas 3 Liqo', 'vero', '8706 Trantow Forge Suite 203\nRosaliaton, KY 03832', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(8, 1, 'Cassandra Towne', 'Morgan', '1996-07-17', '+1-480-272-8312', 'Kelas 2 Liqo', 'eligendi', '7240 Lebsack Views\nKilbackton, WV 98977-0881', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(9, 3, 'Mrs. Myrna Bartell Sr.', 'Alvera', '2014-08-04', '386.331.5614', 'Kelas 1 Liqo', 'ex', '1748 Kitty Street Suite 823\nPort Cordie, MO 87696-2829', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(10, 1, 'Alanna Fritsch', 'Quentin', '2025-08-30', '(231) 373-3490', 'Kelas 3 Liqo', 'nulla', '482 Keagan Pines Suite 622\nWest Daveberg, VA 17580', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(11, 5, 'Constance Hessel', 'Rosa', '2019-06-23', '(262) 233-9714', 'Kelas 1 Liqo', 'fugit', '8958 Sincere Expressway\nPort Isomborough, GA 41211-2637', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(12, 2, 'Prof. Brady Keebler', 'Orrin', '2006-06-26', '534-222-5483', 'Kelas 2 Liqo', 'minima', '22115 Swift Hill\nSouth Owenshire, MN 88198', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(13, 2, 'Robbie Conroy', 'Walton', '2012-05-04', '1-458-749-7847', 'Kelas 1 Liqo', 'dolor', '233 Judy Center Suite 923\nSouth Alana, CT 97923-6139', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(14, 1, 'Jarrett Ritchie Sr.', 'Tommie', '1989-01-06', '+1.228.238.5387', 'Kelas 2 Liqo', 'reiciendis', '8919 Homenick Freeway Suite 648\nWatershaven, DC 76164', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(15, 4, 'Alyce Metz', 'Billy', '1985-08-14', '434-506-3796', 'Kelas 2 Liqo', 'iusto', '7791 Robel Passage Apt. 196\nLubowitzville, MD 97562-1525', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(16, 1, 'Dr. Lula Smitham Jr.', 'Stanley', '2013-02-02', '(848) 628-0967', 'Kelas 1 Liqo', 'aut', '42890 Pfannerstill Extensions\nNorth Isaias, DE 97613', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(17, 1, 'Fernando Rolfson Jr.', 'Nakia', '1979-09-27', '+1.478.653.8162', 'Kelas 1 Liqo', 'inventore', '969 Joanny Road Apt. 911\nNorth Jazminport, AL 82745-7248', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(18, 2, 'Dr. Craig Buckridge Jr.', 'Ignacio', '1998-09-29', '+1-863-842-9729', 'Kelas 1 Liqo', 'doloribus', '1087 Cormier Trail Apt. 555\nLefflerborough, UT 46498', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(19, 5, 'Manley Dickens', 'Ona', '2003-01-24', '+13419432924', 'Kelas 1 Liqo', 'eum', '866 Margot Stravenue Suite 495\nWest Christopherland, HI 23299-0234', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(20, 1, 'Jeff Walker I', 'Tianna', '2018-09-25', '1-934-967-4735', 'Kelas 1 Liqo', 'perspiciatis', '49212 Dietrich Ridge\nTurnerstad, TX 34909', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(21, 4, 'Assunta Thompson', 'Vaughn', '2020-01-10', '+1.909.335.3615', 'Kelas 2 Liqo', 'reprehenderit', '65625 Collier Ville\nPort Wymanside, IN 18418', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(22, 4, 'Prof. Cassidy Padberg', 'Josh', '2007-04-04', '928.626.0876', 'Kelas 1 Liqo', 'et', '10034 Strosin Burgs Suite 765\nGrimesstad, ME 37343', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(23, 5, 'Miss Hildegard Gorczany', 'Vincenzo', '1988-10-06', '623.494.8672', 'Kelas 2 Liqo', 'veritatis', '9276 Mraz Ranch\nPort Terrillfurt, GA 75707', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(24, 1, 'Florida Gislason', 'Darian', '1992-01-02', '772-898-9743', 'Kelas 2 Liqo', 'corrupti', '9175 Lee Haven Suite 472\nEast Shemar, TN 85738-9823', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(25, 2, 'Shawna Stanton', 'Yessenia', '2015-04-12', '(229) 947-5959', 'Kelas 1 Liqo', 'est', '837 Sophia Route\nMilomouth, KY 21776-0712', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(26, 5, 'Mrs. Ardella Bahringer V', 'Sandy', '1990-05-01', '(737) 274-1403', 'Kelas 1 Liqo', 'accusamus', '880 Hartmann Circle Apt. 313\nPort Greenstad, IN 74343', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(27, 4, 'Dr. Wilburn Schinner', 'Alta', '1975-07-05', '+1 (253) 613-8607', 'Kelas 1 Liqo', 'nam', '60191 Wintheiser Lodge\nPort Gerardhaven, PA 35102-8773', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(28, 5, 'Prof. Brown Ebert DDS', 'Bianka', '1999-02-17', '207.287.4424', 'Kelas 2 Liqo', 'ut', '997 Nelle Radial Apt. 831\nDonnachester, CO 15391-8458', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(29, 4, 'Adell O\'Reilly', 'Enid', '1995-07-13', '628.929.1552', 'Kelas 2 Liqo', 'ut', '898 Kassulke Glens\nReingerborough, PA 25984-3225', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(30, 2, 'Santa Morissette', 'Brice', '2008-03-19', '+1.412.670.4645', 'Kelas 3 Liqo', 'aut', '167 O\'Reilly Causeway Suite 879\nWest Hilma, VA 12342-1960', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(31, 4, 'Mrs. Flavie Considine DVM', 'Lulu', '1995-01-22', '+17697690127', 'Kelas 3 Liqo', 'et', '6395 Berge Mission Suite 487\nMayertburgh, GA 99833-8226', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(32, 3, 'Harvey McGlynn', 'Abelardo', '2022-07-09', '484.668.0845', 'Kelas 1 Liqo', 'tempora', '85029 Kameron Brook Apt. 534\nEast Victor, VT 49310', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(33, 3, 'Irma Pollich', 'Elenora', '2024-12-30', '662.437.0429', 'Kelas 1 Liqo', 'facilis', '9359 Abbott Crest Apt. 660\nLake Marjory, IA 31471-4644', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(34, 2, 'Grant Osinski', 'Leanne', '1970-07-28', '1-337-994-5947', 'Kelas 3 Liqo', 'voluptatibus', '6011 Polly Plaza Suite 928\nHegmanntown, LA 09238-4930', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(35, 1, 'Alysa Bruen', 'Soledad', '2021-07-23', '+1.985.920.7154', 'Kelas 2 Liqo', 'quos', '57574 Marjorie Rapids\nEast Kennedybury, ND 74071-0278', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(36, 5, 'Anthony Leffler', 'Devonte', '1998-04-07', '(667) 540-9638', 'Kelas 3 Liqo', 'optio', '2268 Jacinthe Rapids Apt. 312\nNorth Mavisborough, OK 33797-3800', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(37, 3, 'Dr. Kaden Denesik III', 'Cleveland', '2021-11-17', '(724) 365-9901', 'Kelas 3 Liqo', 'quisquam', '92725 Eliseo Springs Suite 738\nMillstown, WY 98083', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(38, 1, 'Daphnee Wilkinson II', 'Winona', '1992-02-09', '+14342839825', 'Kelas 3 Liqo', 'et', '856 Theo Way Apt. 594\nAdalinemouth, WV 12242-0990', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(39, 2, 'Cloyd Waters Sr.', 'Otha', '1979-01-03', '+15757770313', 'Kelas 1 Liqo', 'error', '4014 Thiel Vista Suite 895\nSouth Michelborough, MD 85823', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(40, 4, 'Justus Fisher', 'Dorcas', '1991-03-03', '+1 (878) 812-5076', 'Kelas 1 Liqo', 'dolore', '14475 Spencer Extensions\nPearliebury, PA 95592', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(41, 4, 'Colby Hudson', 'Kody', '1973-09-02', '(386) 817-7245', 'Kelas 3 Liqo', 'ut', '31587 Erin Common Apt. 465\nLindgrenland, MN 59622', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(42, 2, 'Mrs. Celia Stokes I', 'Vivienne', '1993-10-18', '+18202521265', 'Kelas 3 Liqo', 'qui', '73273 Jany Squares\nArianeland, WV 37264-6489', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(43, 1, 'Yessenia Fadel', 'Margarett', '2015-02-22', '+1.682.807.0079', 'Kelas 1 Liqo', 'aspernatur', '678 Cooper Place Suite 166\nO\'Connellland, TN 39045', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(44, 5, 'Daphne Abernathy', 'Giles', '2007-01-02', '719.837.2897', 'Kelas 2 Liqo', 'qui', '3910 Niko Shore Apt. 862\nEast Ashtynhaven, NJ 69113', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(45, 2, 'Marcel Kemmer', 'Josianne', '2013-06-02', '+1-615-928-5542', 'Kelas 1 Liqo', 'harum', '2809 Robel Parkways\nPort Sheilaland, AZ 35007-0444', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(46, 1, 'Gwen Schumm', 'Mozelle', '2014-04-16', '1-351-917-5751', 'Kelas 2 Liqo', 'magni', '23433 Austyn Keys\nPort Verntown, VA 90924', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(47, 3, 'Andre Lynch', 'Zella', '1985-04-20', '+1-678-302-3449', 'Kelas 3 Liqo', 'animi', '721 Lindgren Canyon\nDennisfort, TN 12216', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(48, 1, 'Carmela Hoppe', 'Anastasia', '2004-02-09', '351.307.2126', 'Kelas 2 Liqo', 'consequatur', '4154 Nienow Summit Apt. 593\nNorth Perrymouth, NM 62532-3956', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(49, 5, 'Seamus Hintz', 'Vivien', '1994-10-07', '(320) 509-4616', 'Kelas 2 Liqo', 'molestiae', '44697 Vickie Bridge\nHintzshire, OH 84029-0840', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35'),
(50, 1, 'Maryjane Keebler', 'Fredy', '2018-12-15', '681.720.3659', 'Kelas 1 Liqo', 'voluptatem', '88018 Morissette Way Suite 307\nEast Naomie, LA 10631', 'Aktif', '2025-10-22 09:56:35', '2025-10-22 09:56:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_13_034919_create_personal_access_tokens_table', 1),
(5, '2025_10_13_045057_create_groups_table', 1),
(6, '2025_10_13_045103_create_mentees_table', 1),
(7, '2025_10_13_045109_create_meetings_table', 1),
(8, '2025_10_13_045114_create_attendances_table', 1),
(9, '2025_10_13_045121_create_announcements_table', 1),
(10, '2025_10_13_045133_create_reports_table', 1),
(11, '2025_10_13_045407_create_activity_logs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'api-token', '77a1d0d157bdc8dd461f08798fca17fea798713ae67ef3322b854e0c2e2b4302', '[\"*\"]', '2025-10-22 10:04:23', NULL, '2025-10-22 10:03:41', '2025-10-22 10:04:23');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` enum('admin_summary','mentor_activity','attendance_report') COLLATE utf8mb4_unicode_ci NOT NULL,
  `filters` json DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','completed','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('super_admin','admin','mentor') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mentor',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `email_verified_at`, `password`, `phone_number`, `role`, `status`, `profile_picture`, `last_login_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'superadmin@jejakliqo.com', NULL, '$2y$12$HbxDrg6wtrzKqxjxcwmmx.OZeoruEFGoY.zXAOLydmIyzTShSwnky', NULL, 'super_admin', 'active', NULL, NULL, NULL, '2025-10-22 09:56:31', '2025-10-22 09:56:31'),
(2, 'Admin JejakLiqo', 'admin@jejakliqo.com', NULL, '$2y$12$Z/klWKM6vYyJZOe7kw0EceMaYvRMh6vwIKZN0W9IOY2Dn090p6wla', NULL, 'admin', 'active', NULL, '2025-10-22 03:03:41', NULL, '2025-10-22 09:56:32', '2025-10-22 10:03:41'),
(3, 'Cletus Marquardt', 'emmerich.ray@example.net', '2025-10-22 09:56:34', '$2y$12$T208Dj9cMgj6rW3ZH0nBgu/LHZOniDHh3lmust4TRtaBg9somqzv2', '212-637-0172', 'mentor', 'active', NULL, NULL, 'X8zRcWJ1nD', '2025-10-22 09:56:34', '2025-10-22 09:56:34'),
(4, 'Arianna Gislason', 'brent27@example.com', '2025-10-22 09:56:34', '$2y$12$T208Dj9cMgj6rW3ZH0nBgu/LHZOniDHh3lmust4TRtaBg9somqzv2', '+1-380-781-4050', 'mentor', 'active', NULL, NULL, 'CMRW5HVPmk', '2025-10-22 09:56:34', '2025-10-22 09:56:34'),
(5, 'Laney Smitham', 'jailyn.walsh@example.net', '2025-10-22 09:56:34', '$2y$12$T208Dj9cMgj6rW3ZH0nBgu/LHZOniDHh3lmust4TRtaBg9somqzv2', '1-615-312-1729', 'mentor', 'active', NULL, NULL, 'FpwbUWOFIj', '2025-10-22 09:56:34', '2025-10-22 09:56:34'),
(6, 'Wilmer Bergstrom', 'virginie98@example.org', '2025-10-22 09:56:34', '$2y$12$T208Dj9cMgj6rW3ZH0nBgu/LHZOniDHh3lmust4TRtaBg9somqzv2', '(820) 413-7329', 'mentor', 'active', NULL, NULL, 'GBNoQcGCdk', '2025-10-22 09:56:34', '2025-10-22 09:56:34'),
(7, 'Prof. Julianne Schoen DVM', 'shany78@example.net', '2025-10-22 09:56:34', '$2y$12$T208Dj9cMgj6rW3ZH0nBgu/LHZOniDHh3lmust4TRtaBg9somqzv2', '309.459.8923', 'mentor', 'active', NULL, NULL, 'cx9JZGXOOB', '2025-10-22 09:56:34', '2025-10-22 09:56:34'),
(8, 'Prof. Daryl Crist MD', 'mccullough.alia@example.com', '2025-10-22 09:56:34', '$2y$12$T208Dj9cMgj6rW3ZH0nBgu/LHZOniDHh3lmust4TRtaBg9somqzv2', '646.207.7299', 'mentor', 'active', NULL, NULL, 'bf3dPtr6sJ', '2025-10-22 09:56:34', '2025-10-22 09:56:34'),
(9, 'Elaina Cormier', 'katherine19@example.org', '2025-10-22 09:56:34', '$2y$12$T208Dj9cMgj6rW3ZH0nBgu/LHZOniDHh3lmust4TRtaBg9somqzv2', '+13143655360', 'mentor', 'active', NULL, NULL, 'DA8rGWIwJs', '2025-10-22 09:56:34', '2025-10-22 09:56:34'),
(10, 'Elissa Kub', 'schultz.theodore@example.net', '2025-10-22 09:56:34', '$2y$12$T208Dj9cMgj6rW3ZH0nBgu/LHZOniDHh3lmust4TRtaBg9somqzv2', '283.800.9040', 'mentor', 'active', NULL, NULL, 'eQUz4aGUGb', '2025-10-22 09:56:34', '2025-10-22 09:56:34'),
(11, 'Mr. Ole Bergnaum MD', 'oharris@example.com', '2025-10-22 09:56:34', '$2y$12$T208Dj9cMgj6rW3ZH0nBgu/LHZOniDHh3lmust4TRtaBg9somqzv2', '1-731-326-1263', 'mentor', 'active', NULL, NULL, 'tCjB82vdk5', '2025-10-22 09:56:34', '2025-10-22 09:56:34'),
(12, 'Carlee Mraz Jr.', 'halvorson.dixie@example.net', '2025-10-22 09:56:34', '$2y$12$T208Dj9cMgj6rW3ZH0nBgu/LHZOniDHh3lmust4TRtaBg9somqzv2', '(520) 350-1160', 'mentor', 'active', NULL, NULL, 'uJcQrc0mxq', '2025-10-22 09:56:34', '2025-10-22 09:56:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_created_by_foreign` (`created_by`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attendances_meeting_id_mentee_id_unique` (`meeting_id`,`mentee_id`),
  ADD KEY `attendances_mentee_id_foreign` (`mentee_id`);

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
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_mentor_id_foreign` (`mentor_id`);

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
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meetings_group_id_foreign` (`group_id`),
  ADD KEY `meetings_mentor_id_foreign` (`mentor_id`);

--
-- Indexes for table `mentees`
--
ALTER TABLE `mentees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mentees_group_id_foreign` (`group_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `mentees`
--
ALTER TABLE `mentees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_mentee_id_foreign` FOREIGN KEY (`mentee_id`) REFERENCES `mentees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_mentor_id_foreign` FOREIGN KEY (`mentor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meetings_mentor_id_foreign` FOREIGN KEY (`mentor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mentees`
--
ALTER TABLE `mentees`
  ADD CONSTRAINT `mentees_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
