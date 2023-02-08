-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2023 at 10:27 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bazar_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `app1_adminregister_tb`
--

CREATE TABLE `app1_adminregister_tb` (
  `id` bigint(20) NOT NULL,
  `adminname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app1_adminregister_tb`
--

INSERT INTO `app1_adminregister_tb` (`id`, `adminname`, `email`, `password`, `contact`, `image`) VALUES
(1, 'admin1', 'admin1@abc.com', '123', '111111', 'register/wow-expression-resized-600.jpg.png'),
(2, 'admin2', 'admin2@abc.com', '123', '222222', 'register/ed3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `app1_cart_tb`
--

CREATE TABLE `app1_cart_tb` (
  `id` bigint(20) NOT NULL,
  `Quantity` varchar(255) NOT NULL,
  `Total` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Prodid_id` bigint(20) NOT NULL,
  `Userid_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app1_cart_tb`
--

INSERT INTO `app1_cart_tb` (`id`, `Quantity`, `Total`, `Status`, `Prodid_id`, `Userid_id`) VALUES
(2, '2', '67.2', 'paid', 5, 1),
(3, '3', '145700.0', 'paid', 3, 1),
(5, '1', '1087', 'pending', 20, 1),
(6, '1', '244', 'pending', 23, 1),
(7, '1', '488', 'pending', 22, 2),
(8, '1', '353', 'pending', 19, 2),
(9, '1', '22', 'pending', 6, 7),
(10, '1', '35', 'pending', 5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `app1_payment_tb`
--

CREATE TABLE `app1_payment_tb` (
  `id` bigint(20) NOT NULL,
  `status` varchar(225) NOT NULL,
  `total` varchar(225) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `uid_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app1_payment_tb`
--

INSERT INTO `app1_payment_tb` (`id`, `status`, `total`, `date`, `time`, `uid_id`) VALUES
(1, 'paid', '145767.2', '2023-01-19', '14:07:08.736849', 1),
(2, 'paid', '145767.2', '2023-01-19', '14:10:33.875457', 1),
(3, 'paid', '145767.2', '2023-01-19', '14:15:17.461321', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app1_product_tb`
--

CREATE TABLE `app1_product_tb` (
  `id` bigint(20) NOT NULL,
  `Productname` varchar(255) NOT NULL,
  `Oldprice` varchar(255) NOT NULL,
  `Newprice` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Catagory` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app1_product_tb`
--

INSERT INTO `app1_product_tb` (`id`, `Productname`, `Oldprice`, `Newprice`, `Description`, `Image`, `Catagory`) VALUES
(1, 'Tomato', '24', '20', '..........', 'product/Tomato_je_U59DFWJ.jpg', 'Grocery'),
(3, 'tv', '50000', '47000', '..........', 'product/tv.jpg', 'Electronics'),
(4, ' refrig', '30000', '25000', 'sony', 'product/e2.png', 'Electronics'),
(5, 'mobile ', '103', '32', 'nokia', 'product/e3.png', 'Entertainment'),
(6, 'wheat', '24', '20', 'healthy', 'product/of24.png', 'Grocery'),
(7, 'cream', '45', '34', '@@@@@@@@@@@@@', 'product/ki4.jpg', 'HealthBeauty'),
(9, 'vehicle', '56000', '45000', '%%%%%%', 'product/cac.jpg', 'Automotive'),
(10, 'beauty', '34', '35', 'nail', 'product/b4.png', 'HealthBeauty'),
(11, 'camera', '900000', '1L', 'camera', 'product/e4.png', 'Electronics'),
(13, 'sports', '34', '40', 'sports', 'product/s3_rdfv33W.png', 'Sports'),
(14, 'banana', '38', '35', 'healthy', 'product/of8.png', 'Grocery'),
(17, 'dhal', '24', '20', 'healthy', 'product/of_pWWxWdx.png', 'Grocery'),
(18, 'chappal', '300', '259', '*******', 'product/f2.png', 'Fashionstore'),
(19, 'tshirt', '322', '321', '@@@@@@@', 'product/f1.png', 'Fashionstore'),
(20, 'home decor', '1000', '989', '##', 'product/h1.png', 'HomeFurniture'),
(21, 'GIFT', '344', '223', '%%%', 'product/bg2.jpg', 'Photogifts'),
(22, 'NUTS', '555', '444', '^', 'product/g5.png', 'HealthBeauty'),
(23, 'books', '234', '222', 'novel', 'product/ini-nijan-1.jpg', 'Entertainment');

-- --------------------------------------------------------

--
-- Table structure for table `app1_register_tb`
--

CREATE TABLE `app1_register_tb` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app1_register_tb`
--

INSERT INTO `app1_register_tb` (`id`, `username`, `email`, `password`) VALUES
(1, 'ramya', 'ramyaganesh08@gmail.com', '1234'),
(2, 'user1', 'user1@abc.com', '123'),
(3, 'user3', 'user3@abc.com', '123'),
(4, 'user123', 'user123@abc.com', '123'),
(5, 'user2', 'user2@abc.comn', '123'),
(6, 'user4', 'user4@abc.com', '123'),
(7, '123', '123@abc.com', '123'),
(8, '1234', '1234@abc.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add register_tb', 7, 'add_register_tb'),
(26, 'Can change register_tb', 7, 'change_register_tb'),
(27, 'Can delete register_tb', 7, 'delete_register_tb'),
(28, 'Can view register_tb', 7, 'view_register_tb'),
(29, 'Can add adminregister_tb', 8, 'add_adminregister_tb'),
(30, 'Can change adminregister_tb', 8, 'change_adminregister_tb'),
(31, 'Can delete adminregister_tb', 8, 'delete_adminregister_tb'),
(32, 'Can view adminregister_tb', 8, 'view_adminregister_tb'),
(33, 'Can add product_tb', 9, 'add_product_tb'),
(34, 'Can change product_tb', 9, 'change_product_tb'),
(35, 'Can delete product_tb', 9, 'delete_product_tb'),
(36, 'Can view product_tb', 9, 'view_product_tb'),
(37, 'Can add cart_tb', 10, 'add_cart_tb'),
(38, 'Can change cart_tb', 10, 'change_cart_tb'),
(39, 'Can delete cart_tb', 10, 'delete_cart_tb'),
(40, 'Can view cart_tb', 10, 'view_cart_tb'),
(41, 'Can add payment_tb', 11, 'add_payment_tb'),
(42, 'Can change payment_tb', 11, 'change_payment_tb'),
(43, 'Can delete payment_tb', 11, 'delete_payment_tb'),
(44, 'Can view payment_tb', 11, 'view_payment_tb');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(8, 'app1', 'adminregister_tb'),
(10, 'app1', 'cart_tb'),
(11, 'app1', 'payment_tb'),
(9, 'app1', 'product_tb'),
(7, 'app1', 'register_tb'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-01-11 07:40:46.330407'),
(2, 'auth', '0001_initial', '2023-01-11 07:40:49.711644'),
(3, 'admin', '0001_initial', '2023-01-11 07:40:51.425806'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-01-11 07:40:51.485180'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-01-11 07:40:51.526400'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-01-11 07:40:51.929794'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-01-11 07:40:52.331541'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-01-11 07:40:52.453561'),
(9, 'auth', '0004_alter_user_username_opts', '2023-01-11 07:40:52.509652'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-01-11 07:40:52.861789'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-01-11 07:40:52.892790'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-01-11 07:40:52.936118'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-01-11 07:40:53.038840'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-01-11 07:40:53.137615'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-01-11 07:40:53.278177'),
(16, 'auth', '0011_update_proxy_permissions', '2023-01-11 07:40:53.363076'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-01-11 07:40:53.492700'),
(18, 'sessions', '0001_initial', '2023-01-11 07:40:53.739252'),
(19, 'app1', '0001_initial', '2023-01-11 08:31:47.459546'),
(20, 'app1', '0002_adminregister_tb', '2023-01-12 07:39:13.810944'),
(21, 'app1', '0003_product_tb', '2023-01-16 07:47:34.508731'),
(22, 'app1', '0004_cart_tb', '2023-01-18 09:00:01.444565'),
(23, 'app1', '0005_payment_tb', '2023-01-19 08:34:24.917026');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('00gto7s2xx0zby731lxu9zo6vd6543mg', 'eyJhZG1pbmlkIjoxLCJhZG1pbm5hbWUiOiJhZG1pbjEifQ:1pJr70:73pUqso6UvLxphmOQIdIKIXGP1Dne14UuveAQ_eHi6Q', '2023-02-06 07:19:26.815456'),
('0c42iumg6hmnnd6dlnz20r1zg12j9a3f', 'eyJ1c2VyaWQiOjIsInVzZXJuYW1lIjoidXNlcjEifQ:1pKbXC:XoBCV9XcctTwvOezmFdOnNjhzw8gFJi9hnTVqobgECs', '2023-02-08 08:53:34.177326'),
('5x09psprza8lwoq5lk9w58yqczr7xf1r', '.eJyrVkpMyc3My0xRsjLUgbDzEnNTlawgbEMlHaXS4tQiqDyICZUuSsytTFSqBQCr-RUf:1pI3Ot:wm8-kMuL48tO1t5EWrPkYo1w2MC_5it6TNIl95TOM0w', '2023-02-01 08:02:27.740295'),
('772zt2qbgt7hrsncf8e1wis3pphxqon9', 'eyJhZG1pbmlkIjoxLCJhZG1pbm5hbWUiOiJhZG1pbjEifQ:1pKZWU:X7IFh9vFBZ6QBHI3RXM9gEpKKPpmqQ2GrUNuAj-ruBM', '2023-02-08 06:44:42.663811'),
('8n7rrkbug96ntovlkkpvpy7a8ovzv3rt', 'eyJ1c2VyaWQiOjEsInVzZXJuYW1lIjoicmFteWEifQ:1pIQCC:ypcHNpf8mDCmluO0IWnaX9VXvmAiPgwPOG4YRPz5XO0', '2023-02-02 08:22:52.493632'),
('e99nh6wtcgdzjmv5j38e5cq5pdyvstso', 'eyJ1c2VyaWQiOjEsInVzZXJuYW1lIjoicmFteWEifQ:1pIPfp:TSu3-gy0O1k63OGnidb9KihNm3PxA74n43t7P7jL0n8', '2023-02-02 07:49:25.707041'),
('muzu5romrjkrkhpf3t969zjwrw75rvx7', 'eyJ1c2VyaWQiOjEsInVzZXJuYW1lIjoicmFteWEifQ:1pIOub:P7aVSpb3UmlnY5ASfgRxHfXgJa5PIBz83qu9pDrR-0E', '2023-02-02 07:00:38.002763'),
('q75ebng6pseggo2d3lubgjhcbrd7mbdr', 'e30:1pLK6S:uHZywJBtgp_6xYuu1jRrwzoMNUTEjKfjc6UZxKit1fU', '2023-02-10 08:28:56.437894'),
('qsgb6vkm0vg7unuq2lbzf5bllpptff1v', 'eyJ1c2VyaWQiOjEsInVzZXJuYW1lIjoicmFteWEifQ:1pI4JE:Dis7o0OI5R8B9_IRK1nl6lazCY5eTbychnLvwD1f8r0', '2023-02-01 09:00:40.020648'),
('rxrq47p2wjrm72twzmksvc5ep0vk6uzy', 'eyJhZG1pbmlkIjoxLCJhZG1pbm5hbWUiOiJhZG1pbjEifQ:1pJsPG:PqIT83letg5lSf9H3nDCpVWD_ZuxpzgceABBi5dtEVY', '2023-02-06 08:42:22.548135');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app1_adminregister_tb`
--
ALTER TABLE `app1_adminregister_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app1_cart_tb`
--
ALTER TABLE `app1_cart_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app1_cart_tb_Prodid_id_678e58fe_fk_app1_product_tb_id` (`Prodid_id`),
  ADD KEY `app1_cart_tb_Userid_id_d2af9912_fk_app1_register_tb_id` (`Userid_id`);

--
-- Indexes for table `app1_payment_tb`
--
ALTER TABLE `app1_payment_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app1_payment_tb_uid_id_76b3fbaa_fk_app1_register_tb_id` (`uid_id`);

--
-- Indexes for table `app1_product_tb`
--
ALTER TABLE `app1_product_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app1_register_tb`
--
ALTER TABLE `app1_register_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app1_adminregister_tb`
--
ALTER TABLE `app1_adminregister_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app1_cart_tb`
--
ALTER TABLE `app1_cart_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `app1_payment_tb`
--
ALTER TABLE `app1_payment_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app1_product_tb`
--
ALTER TABLE `app1_product_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `app1_register_tb`
--
ALTER TABLE `app1_register_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app1_cart_tb`
--
ALTER TABLE `app1_cart_tb`
  ADD CONSTRAINT `app1_cart_tb_Prodid_id_678e58fe_fk_app1_product_tb_id` FOREIGN KEY (`Prodid_id`) REFERENCES `app1_product_tb` (`id`),
  ADD CONSTRAINT `app1_cart_tb_Userid_id_d2af9912_fk_app1_register_tb_id` FOREIGN KEY (`Userid_id`) REFERENCES `app1_register_tb` (`id`);

--
-- Constraints for table `app1_payment_tb`
--
ALTER TABLE `app1_payment_tb`
  ADD CONSTRAINT `app1_payment_tb_uid_id_76b3fbaa_fk_app1_register_tb_id` FOREIGN KEY (`uid_id`) REFERENCES `app1_register_tb` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
