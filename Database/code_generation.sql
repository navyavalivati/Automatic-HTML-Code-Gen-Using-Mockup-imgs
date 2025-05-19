-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 25, 2019 at 04:53 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `code_generation`
--
CREATE DATABASE IF NOT EXISTS `code_generation` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `code_generation`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add check model', 7, 'add_checkmodel'),
(20, 'Can change check model', 7, 'change_checkmodel'),
(21, 'Can delete check model', 7, 'delete_checkmodel'),
(22, 'Can add register model', 8, 'add_registermodel'),
(23, 'Can change register model', 8, 'change_registermodel'),
(24, 'Can delete register model', 8, 'delete_registermodel'),
(25, 'Can add upload model', 9, 'add_uploadmodel'),
(26, 'Can change upload model', 9, 'change_uploadmodel'),
(27, 'Can delete upload model', 9, 'delete_uploadmodel'),
(28, 'Can add html_ page', 10, 'add_html_page'),
(29, 'Can change html_ page', 10, 'change_html_page'),
(30, 'Can delete html_ page', 10, 'delete_html_page');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `compiler_checkmodel`
--

CREATE TABLE IF NOT EXISTS `compiler_checkmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_tile` varchar(200) NOT NULL,
  `check_des` varchar(500) NOT NULL,
  `img_path` varchar(200) NOT NULL,
  `txt_filed` varchar(1000) NOT NULL,
  `cate_list` varchar(200) NOT NULL,
  `check_imgid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compiler_checkmodel_check_imgid_id_6066ee9d_fk_compiler_` (`check_imgid_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `compiler_checkmodel`
--

INSERT INTO `compiler_checkmodel` (`id`, `check_tile`, `check_des`, `img_path`, `txt_filed`, `cate_list`, `check_imgid_id`) VALUES
(1, '', '', 'D:\\velmurugan\\code_generation\\asset/media/0DF671EC-7BD9-4142-8A9D-5B438DD37323_YHGkRwc.png', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `compiler_html_page`
--

CREATE TABLE IF NOT EXISTS `compiler_html_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `htmlfile` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `compiler_html_page`
--

INSERT INTO `compiler_html_page` (`id`, `htmlfile`) VALUES
(1, 'D:/velmurugan/praga/code_generation/datasets/web/training_set/FECC1897-8B91-426B-96F3-29DA91E30721.h'),
(2, 'D:/velmurugan/praga/code_generation/datasets/web/training_set/0CB4C774-0D32-4DAD-9551-F849AA7C7B95.h'),
(3, 'D:/velmurugan/praga/code_generation/datasets/web/training_set/ABCA9D93-7C22-4F41-81F4-E9ED7C15E6B5.h'),
(4, 'D:/velmurugan/praga/code_generation/datasets/web/training_set/0B660875-60B4-4E65-9793-3C7EB6C8AFD0.h');

-- --------------------------------------------------------

--
-- Table structure for table `compiler_registermodel`
--

CREATE TABLE IF NOT EXISTS `compiler_registermodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(300) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `password_confirmation` varchar(200) NOT NULL,
  `userid` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `compiler_registermodel`
--

INSERT INTO `compiler_registermodel` (`id`, `first_name`, `last_name`, `email`, `password`, `password_confirmation`, `userid`) VALUES
(1, 'vel', 'murugan', 'velu@gmail.com', '123', '123', '1'),
(2, 'vel', 'murugan', 'velu@gmail.com', '123', '123', '2'),
(3, 'vel', 'david', 'veludavid@gmail.com', '333', '333', '3'),
(4, 'praga', 'waran', 'pragatheswaran@gmail.com', '123456', '123456', '5'),
(5, 'ram', 'kumar', 'ram@gmail.com', '123', '123', '5'),
(6, 'vel', 'david', 'david@gmail.com', '123', '123', '6'),
(7, 'vel', 'david', 'velu@gmail.com', '123', '123', '56');

-- --------------------------------------------------------

--
-- Table structure for table `compiler_uploadmodel`
--

CREATE TABLE IF NOT EXISTS `compiler_uploadmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `compiler_uploadmodel`
--

INSERT INTO `compiler_uploadmodel` (`id`, `image`) VALUES
(1, '0DF671EC-7BD9-4142-8A9D-5B438DD37323.png'),
(2, '1c111a83-6f50-4c61-8dc4-d2f672049f80_4ZNPQKO.png'),
(3, '1B00773F-70CF-442E-8557-CAD507624FD0.png'),
(4, '1B00773F-70CF-442E-8557-CAD507624FD0.gui'),
(5, '1EA2A9DA-E8A6-4011-9841-A7758E979F77_yOmttjW.png'),
(6, '1BA91062-45AA-41BA-A295-F3B2E2088E2E.gui'),
(7, '1B780AA6-20D0-481F-976F-C951B0D0F57E.png'),
(8, '1B780AA6-20D0-481F-976F-C951B0D0F57E.gui'),
(9, '0D864C09-F659-47FE-A0EA-7347E2963397.png'),
(10, '01D23C26-B39F-475F-9961-9DAFF0B987A3.png'),
(11, '0D289613-FC00-4D1E-8259-E093EBBA39E9.png'),
(12, '5A6471C8-4ABA-47FF-949E-F796540DF448.gui'),
(13, '5A6471C8-4ABA-47FF-949E-F796540DF448.png'),
(14, '0DF671EC-7BD9-4142-8A9D-5B438DD37323.gui'),
(15, '0DF671EC-7BD9-4142-8A9D-5B438DD37323.png'),
(16, '1D3BE75B-3F8F-4004-A562-2B784AF8D1EC.png'),
(17, '0BA2A4B4-4193-4506-8818-31564225EF8B_cUWHxdm.png'),
(18, '5A6471C8-4ABA-47FF-949E-F796540DF448.gui'),
(19, '0D289613-FC00-4D1E-8259-E093EBBA39E9.png'),
(20, '0D864C09-F659-47FE-A0EA-7347E2963397.png'),
(21, '5A6471C8-4ABA-47FF-949E-F796540DF448_qzDEStw.png');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'compiler', 'checkmodel'),
(10, 'compiler', 'html_page'),
(8, 'compiler', 'registermodel'),
(9, 'compiler', 'uploadmodel'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-10-19 10:15:17.644946'),
(2, 'auth', '0001_initial', '2019-10-19 10:15:57.974017'),
(3, 'admin', '0001_initial', '2019-10-19 10:16:04.512429'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-10-19 10:16:04.574829'),
(5, 'contenttypes', '0002_remove_content_type_name', '2019-10-19 10:16:09.067637'),
(6, 'auth', '0002_alter_permission_name_max_length', '2019-10-19 10:16:09.769638'),
(7, 'auth', '0003_alter_user_email_max_length', '2019-10-19 10:16:10.705640'),
(8, 'auth', '0004_alter_user_username_opts', '2019-10-19 10:16:10.736840'),
(9, 'auth', '0005_alter_user_last_login_null', '2019-10-19 10:16:11.298441'),
(10, 'auth', '0006_require_contenttypes_0002', '2019-10-19 10:16:11.329641'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2019-10-19 10:16:11.376441'),
(12, 'auth', '0008_alter_user_username_max_length', '2019-10-19 10:16:17.772452'),
(13, 'compiler', '0001_initial', '2019-10-19 10:16:22.825063'),
(14, 'sessions', '0001_initial', '2019-10-19 10:16:29.410275'),
(15, 'compiler', '0002_registermodel_userid', '2019-10-19 11:06:39.063522'),
(16, 'compiler', '0003_remove_checkmodel_check_userid', '2019-10-25 12:32:11.566847'),
(17, 'compiler', '0003_html_page', '2019-10-25 13:59:09.692701');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

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
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `compiler_checkmodel`
--
ALTER TABLE `compiler_checkmodel`
  ADD CONSTRAINT `compiler_checkmodel_check_imgid_id_6066ee9d_fk_compiler_` FOREIGN KEY (`check_imgid_id`) REFERENCES `compiler_uploadmodel` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
