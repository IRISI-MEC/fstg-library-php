-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2022 at 09:57 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `bookID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `bookcategoryID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `isbnno` varchar(100) NOT NULL,
  `coverphoto` varchar(200) NOT NULL,
  `codeno` varchar(100) NOT NULL,
  `rackID` int(11) DEFAULT NULL,
  `editionnumber` varchar(100) NOT NULL,
  `editiondate` datetime DEFAULT NULL,
  `publisher` varchar(100) NOT NULL,
  `publisheddate` datetime DEFAULT NULL,
  `notes` text NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0= Book Available, 1= Book Not Available',
  `deleted_at` tinyint(4) NOT NULL COMMENT '0= Book Available, 1=Book Deleted ',
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bookID`, `name`, `author`, `bookcategoryID`, `quantity`, `price`, `isbnno`, `coverphoto`, `codeno`, `rackID`, `editionnumber`, `editiondate`, `publisher`, `publisheddate`, `notes`, `status`, `deleted_at`, `create_date`, `create_memberID`, `create_roleID`, `modify_date`, `modify_memberID`, `modify_roleID`) VALUES
(1, 'book 1', 'book 1', 1, 12, '23.00', '120', 'aefc5754e459044ecf4edc0f5d23dbdb1e9620185c8ee8f17295568f67cb02495bf43cb7666e1b9d79f374ff09eae22903a6f2447793b741a8858ed5ad789e87.jpg', '125', 1, '123', '2022-02-07 00:00:00', 'Pratham Books', '2022-02-23 00:00:00', 'notes', 0, 0, '2022-02-03 15:41:52', 1, 1, '2022-02-03 15:41:52', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookcategory`
--

CREATE TABLE `bookcategory` (
  `bookcategoryID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `coverphoto` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookcategory`
--

INSERT INTO `bookcategory` (`bookcategoryID`, `name`, `description`, `coverphoto`, `status`, `create_date`, `create_memberID`, `create_roleID`, `modify_date`, `modify_memberID`, `modify_roleID`) VALUES
(1, 'Action and Adventure', 'Action and Adventure', 'd39a363b6e73757a0d9c646fabe337b63f28d6719603bcf8f631a30ac0501b89bf5bcdfcf348bc001d021f4a670eb91bf6e9046f2a189f0994f4c360760183bb.jpg', 1, '2022-02-03 15:41:12', 1, 1, '2022-02-03 15:41:12', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookissue`
--

CREATE TABLE `bookissue` (
  `bookissueID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `bookcategoryID` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  `bookno` int(11) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `issue_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  `renewed` tinyint(4) NOT NULL,
  `max_renewed_limit` tinyint(4) NOT NULL,
  `book_fine_per_day` decimal(10,2) NOT NULL,
  `fineamount` decimal(10,2) NOT NULL,
  `paymentamount` decimal(10,2) NOT NULL,
  `discountamount` decimal(10,2) NOT NULL,
  `paidstatus` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = due,  1 = partial, 2 = Paid',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Issued,  1 = Return, 2 = Lost',
  `deleted_at` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Not Deleted, 1 = Deleted',
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bookitem`
--

CREATE TABLE `bookitem` (
  `bookitemID` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  `bookno` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0= Book Available, 1= Book Issued, 2=Book Lost',
  `deleted_at` tinyint(4) NOT NULL COMMENT '0= Book Available, 1= Book Not Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookitem`
--

INSERT INTO `bookitem` (`bookitemID`, `bookID`, `bookno`, `status`, `deleted_at`) VALUES
(1, 1, 1, 0, 0),
(2, 1, 2, 0, 0),
(3, 1, 3, 0, 0),
(4, 1, 4, 0, 0),
(5, 1, 5, 0, 0),
(6, 1, 6, 0, 0),
(7, 1, 7, 0, 0),
(8, 1, 8, 0, 0),
(9, 1, 9, 0, 0),
(10, 1, 10, 0, 0),
(11, 1, 11, 0, 0),
(12, 1, 12, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `chatID` int(11) NOT NULL,
  `message` text NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ebook`
--

CREATE TABLE `ebook` (
  `ebookID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `coverphoto` varchar(200) NOT NULL,
  `file` varchar(200) NOT NULL,
  `file_original_name` varchar(200) NOT NULL,
  `notes` text NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ebook`
--

INSERT INTO `ebook` (`ebookID`, `name`, `author`, `coverphoto`, `file`, `file_original_name`, `notes`, `create_date`, `create_memberID`, `create_roleID`, `modify_date`, `modify_memberID`, `modify_roleID`) VALUES
(1, 'Rich dad Poor Dad', 'Robert Kiyosaki', '500a5e0194f10ab289406229051eef89780a21377ee0c8d70de372cf5be4cba59e293769973fb0fd29dc69298afbeba9b3de8a90f1f0aaa798c4968ea6f648b9.jpg', '26abf815d35e010af8eb530e45f6ecede5c77f272009f34fd6a396c13a16fc76b2d139f5971c00b71c37b6019f57c27417c47b64e0c95db3c3a393f0bdd0b4d3.pdf', 'Rich-Dad-Poor-Dad-eBook.pdf', 'Rich dad Poor Dad', '2022-02-04 15:09:00', 1, 1, '2022-02-04 15:09:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emailsend`
--

CREATE TABLE `emailsend` (
  `emailsendID` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `sender_name` text NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sender_memberID` int(11) NOT NULL,
  `sender_roleID` int(11) NOT NULL,
  `emailtemplateID` int(11) NOT NULL DEFAULT 0,
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `on_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=show, 1=delete'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emailsetting`
--

CREATE TABLE `emailsetting` (
  `optionkey` varchar(100) NOT NULL,
  `optionvalue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emailsetting`
--

INSERT INTO `emailsetting` (`optionkey`, `optionvalue`) VALUES
('mail_driver', ''),
('mail_encryption', ''),
('mail_host', ''),
('mail_password', ''),
('mail_port', ''),
('mail_username', '');

-- --------------------------------------------------------

--
-- Table structure for table `emailtemplate`
--

CREATE TABLE `emailtemplate` (
  `emailtemplateID` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `template` text NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `expenseID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `file` varchar(200) DEFAULT NULL,
  `fileoriginalname` varchar(200) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finehistory`
--

CREATE TABLE `finehistory` (
  `finehistoryID` int(11) NOT NULL,
  `bookissueID` int(11) NOT NULL,
  `bookstatusID` int(11) NOT NULL COMMENT '0 = Issued,  1 = Return, 2 = Lost',
  `renewed` tinyint(4) NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `fineamount` decimal(10,2) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `generalsetting`
--

CREATE TABLE `generalsetting` (
  `optionkey` varchar(100) NOT NULL,
  `optionvalue` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `generalsetting`
--

INSERT INTO `generalsetting` (`optionkey`, `optionvalue`) VALUES
('address', '112 Bd Abdelkrim Al Khattabi, Marrakech 40000'),
('copyright_by', 'by Chekroun Soulaimane, Mekmassi Mohamed Ali et Elghazi Elyass'),
('delivery_charge', '0'),
('ebook_download', '1'),
('email', 'lms@fstg.ma'),
('frontend', '1'),
('logo', '5816b44d5c1900c141e9eb8407c247a1688169b4620f9af9949081bdcf567b882cafdae981c8cdf21844a069f9262818260f25d5d49ad679a68e725c3f26417a.png'),
('paypal_payment_method', '1'),
('phone', '069999999'),
('registration', '1'),
('settheme', 'mytheme'),
('sitename', 'fstg LMS'),
('stripe_key', ''),
('stripe_payment_method', '1'),
('stripe_secret', ''),
('web_address', 'lms.fstg.com');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `incomeID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `file` varchar(200) DEFAULT NULL,
  `fileoriginalname` varchar(200) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `libraryconfigure`
--

CREATE TABLE `libraryconfigure` (
  `libraryconfigureID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL,
  `max_issue_book` int(11) NOT NULL,
  `max_renewed_limit` int(11) NOT NULL,
  `per_renew_limit_day` int(11) NOT NULL,
  `book_fine_per_day` decimal(11,0) NOT NULL,
  `issue_off_limit_amount` decimal(11,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `libraryconfigure`
--

INSERT INTO `libraryconfigure` (`libraryconfigureID`, `roleID`, `max_issue_book`, `max_renewed_limit`, `per_renew_limit_day`, `book_fine_per_day`, `issue_off_limit_amount`) VALUES
(1, 1, 20, 20, 20, '20', '200'),
(2, 2, 15, 15, 15, '15', '150'),
(3, 3, 10, 10, 10, '10', '100'),
(4, 4, 5, 5, 5, '5', '50');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `memberID` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `dateofbirth` datetime DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `religion` varchar(30) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `bloodgroup` varchar(20) NOT NULL,
  `address` text DEFAULT NULL,
  `joinningdate` datetime DEFAULT NULL,
  `photo` varchar(200) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(128) NOT NULL,
  `roleID` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=New, 1=active, 2=Block',
  `deleted_at` tinyint(4) DEFAULT 0 COMMENT '0 = Not Deleted, 1 = Deleted',
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`memberID`, `name`, `dateofbirth`, `gender`, `religion`, `email`, `phone`, `bloodgroup`, `address`, `joinningdate`, `photo`, `username`, `password`, `roleID`, `status`, `deleted_at`, `create_date`, `create_memberID`, `create_roleID`, `modify_date`, `modify_memberID`, `modify_roleID`) VALUES
(1, 'lms admin', '2021-12-21 00:00:00', 'Male', 'Unknown', 'admin@lms.ma', '', '', '', '2021-12-21 00:00:00', '', 'lms_admin', '9d7aa7243e9da7440af93a2a02b1e21fe3f0e8006676926fdad320ea204d1a67e16ff2500917a0ee946d8507f09e501131c184618105f66082fd3ff833a8c072', 1, 1, 0, '2021-12-21 03:45:11', 1, 1, '2021-12-21 03:45:11', 1, 0),
(2, 'soulaimane', '1970-01-01 00:00:00', '0', '', 'soulaimanech2@gmail.com', '0688888888', '0', '', '2021-12-20 00:00:00', 'c1cffcacf3d74ad1d89c55e912c99ad9a146a5d322ea4fa33b87a3f7b02ac309af13471df733290c8a4d578d7c51a1d9a6f52aad3f8f1367f94c61e90fc87c65.jpg', 'soulaimane', '9d7aa7243e9da7440af93a2a02b1e21fe3f0e8006676926fdad320ea204d1a67e16ff2500917a0ee946d8507f09e501131c184618105f66082fd3ff833a8c072', 4, 1, 0, '2021-12-21 04:29:24', 0, 0, '2022-01-14 19:17:32', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menuID` int(11) NOT NULL,
  `menuname` varchar(128) NOT NULL,
  `menulink` varchar(128) NOT NULL,
  `menuicon` varchar(128) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 500,
  `parentmenuID` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menuID`, `menuname`, `menulink`, `menuicon`, `priority`, `parentmenuID`, `status`) VALUES
(1, 'dashboard', 'dashboard', 'fa fa-dashboard', 500, 0, 1),
(2, 'bookissue', 'bookissue', 'fa lms-educational-book', 500, 0, 1),
(3, 'member', 'member', 'fa fa-user-plus', 500, 0, 1),
(4, 'ebook', 'ebook', 'fa lms-study', 500, 0, 1),
(5, 'books', '#', 'fa lms-book', 500, 0, 1),
(6, 'book', 'book', 'fa fa-book', 500, 5, 1),
(7, 'rack', 'rack', 'fa lms-bookshelf', 500, 5, 1),
(8, 'bookcategory', 'bookcategory', 'fa lms-notebook', 500, 5, 1),
(9, 'bookbarcode', 'bookbarcode', 'fa fa-barcode', 500, 5, 1),
(10, 'requestbook', 'requestbook', 'fa lms-professor', 500, 0, 1),
(11, 'storemanagement', '#', 'fa fa-shopping-cart', 500, 0, 1),
(12, 'order', 'order', 'fa fa-first-order', 500, 11, 1),
(13, 'storebook', 'storebook', 'fa fa-book', 0, 11, 1),
(14, 'storebookcategory', 'storebookcategory', 'fa lms-notebook', 0, 11, 1),
(15, 'emailsend', 'emailsend', 'fa fa-envelope', 500, 0, 1),
(16, 'account', '#', 'fa lms-merchant', 500, 0, 0),
(17, 'income', 'income', 'fa lms-incomes', 500, 16, 0),
(18, 'expense', 'expense', 'fa lms-salary', 500, 16, 0),
(19, 'reports', '#', 'fa fa-clipboard', 500, 0, 1),
(20, 'bookreport', 'bookreport', 'fa lms-library', 500, 19, 1),
(21, 'bookissuereport', 'bookissuereport', 'fa lms-writing', 500, 19, 1),
(22, 'memberreport', 'memberreport', 'fa lms-community', 500, 19, 1),
(23, 'idcardreport', 'idcardreport', 'fa lms-id-card', 500, 19, 1),
(24, 'transactionreport', 'transactionreport', 'fa fa-credit-card', 500, 19, 0),
(25, 'bookbarcodereport', 'bookbarcodereport', 'fa fa-barcode', 0, 19, 1),
(26, 'administrator', '#', 'fa fa-lock', 500, 0, 1),
(27, 'menu', 'menu', 'fa fa-bars', 500, 26, 1),
(28, 'role', 'role', 'fa fa-users', 500, 26, 1),
(29, 'emailtemplate', 'emailtemplate', 'fa lms-template-design', 500, 26, 1),
(30, 'permissions', 'permissions', 'fa fa-balance-scale', 500, 26, 1),
(31, 'permissionlog', 'permissionlog', 'fa fa-key', 500, 26, 0),
(32, 'update', 'update', 'fa fa-upload', 0, 26, 0),
(33, 'backup', 'backup', 'fa fa-download', 0, 26, 1),
(34, 'settings', '#', 'fa fa-cogs', 500, 0, 1),
(35, 'generalsetting', 'generalsetting', 'fa fa-cog', 500, 34, 1),
(36, 'emailsetting', 'emailsetting', 'fa lms-open-envelope', 500, 34, 1),
(37, 'libraryconfigure', 'libraryconfigure', 'fa lms-settings', 500, 34, 0),
(38, 'themesetting', 'themesetting', 'fa fa-paint-brush', 0, 34, 1),
(39, 'paymentsetting', 'paymentsetting', 'fa fa-credit-card-alt', 0, 34, 0),
(40, 'Liste des retardataires', 'list', 'fa fa-exclamation', 500, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `newsletterID` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `verify` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `orderitemID` bigint(20) UNSIGNED NOT NULL,
  `orderID` bigint(20) UNSIGNED NOT NULL,
  `storebookID` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `unit_price` double(13,2) UNSIGNED NOT NULL,
  `subtotal` double(13,2) UNSIGNED NOT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`orderitemID`, `orderID`, `storebookID`, `quantity`, `unit_price`, `subtotal`, `create_date`, `modify_date`) VALUES
(1, 1, 3, 1, 0.00, 0.00, '2022-02-04 14:26:15', '2022-02-04 14:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` bigint(20) UNSIGNED NOT NULL,
  `memberID` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_charge` double(13,2) UNSIGNED NOT NULL,
  `subtotal` double(13,2) UNSIGNED NOT NULL,
  `total` double(13,2) UNSIGNED NOT NULL,
  `payment_status` tinyint(3) UNSIGNED NOT NULL COMMENT 'PAID=5, UNPAID=10',
  `payment_method` tinyint(3) UNSIGNED NOT NULL COMMENT 'CASH_ON_DELIVERY=5',
  `paid_amount` double(13,2) UNSIGNED NOT NULL,
  `discounted_price` double(13,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `misc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT 'PENDING = 5, CANCEL = 10, REJECT = 15, ACCEPT = 20, PROCESS = 25, ON_THE_WAY = 30, COMPLETED = 35',
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `memberID`, `name`, `address`, `mobile`, `email`, `delivery_charge`, `subtotal`, `total`, `payment_status`, `payment_method`, `paid_amount`, `discounted_price`, `misc`, `status`, `notes`, `create_date`, `modify_date`) VALUES
(1, 2, 'soulaimane', '', '0688888888', 'soulaimanech2@gmail.com', 0.00, 0.00, 0.00, 5, 0, 0.00, 0.00, NULL, 5, '', '2022-02-04 14:26:15', '2022-02-04 14:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `paymentanddiscount`
--

CREATE TABLE `paymentanddiscount` (
  `paymentanddiscountID` int(11) NOT NULL,
  `bookissueID` int(11) NOT NULL,
  `paymentamount` decimal(10,2) NOT NULL,
  `discountamount` decimal(10,2) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permissionlog`
--

CREATE TABLE `permissionlog` (
  `permissionlogID` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `active` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissionlog`
--

INSERT INTO `permissionlog` (`permissionlogID`, `name`, `description`, `active`) VALUES
(1, 'dashboard', 'Dashboard', 'yes'),
(2, 'bookissue', 'Book Issue', 'yes'),
(3, 'bookissue_add', 'Book Issue Add', 'yes'),
(4, 'bookissue_edit', 'Book Issue Edit', 'yes'),
(5, 'bookissue_view', 'Book Issue View', 'yes'),
(6, 'bookissue_delete', 'Book Issue Delete', 'yes'),
(7, 'member', 'Member', 'yes'),
(8, 'member_add', 'Member Add', 'yes'),
(9, 'member_edit', 'Member Edit', 'yes'),
(10, 'member_view', 'Member View', 'yes'),
(11, 'member_delete', 'Member Delete', 'yes'),
(12, 'ebook', 'Ebook', 'yes'),
(13, 'ebook_add', 'Ebook Add', 'yes'),
(14, 'ebook_edit', 'Ebook Edit', 'yes'),
(15, 'ebook_view', 'Ebook View', 'yes'),
(16, 'ebook_delete', 'Ebook Delete', 'yes'),
(17, 'book', 'Book', 'yes'),
(18, 'book_add', 'Book Add', 'yes'),
(19, 'book_edit', 'Book Edit', 'yes'),
(20, 'book_delete', 'Book Delete', 'yes'),
(21, 'book_view', 'Book View', 'yes'),
(22, 'rack', 'Rack', 'yes'),
(23, 'rack_add', 'Rack Add', 'yes'),
(24, 'rack_edit', 'Rack Edit', 'yes'),
(25, 'rack_delete', 'Rack Delete', 'yes'),
(26, 'bookcategory', 'Bool Category', 'yes'),
(27, 'bookcategory_add', 'Book Category Add', 'yes'),
(28, 'bookcategory_edit', 'Book Category Edit', 'yes'),
(29, 'bookcategory_delete', 'Book Category Delete', 'yes'),
(30, 'requestbook', 'Request Book', 'yes'),
(31, 'requestbook_add', 'Request Book Add', 'yes'),
(32, 'requestbook_edit', 'Request Book Edit', 'yes'),
(33, 'requestbook_view', 'Request Book View', 'yes'),
(34, 'requestbook_delete', 'Request Book Delete', 'yes'),
(35, 'emailsend', 'emailsend', 'yes'),
(36, 'emailsend_add', 'Emailsend Add', 'yes'),
(37, 'emailsend_view', 'Emailsend View', 'yes'),
(38, 'emailsend_delete', 'Emailsend Delete', 'yes'),
(39, 'income', 'Income', 'yes'),
(40, 'income_add', 'Income Add', 'yes'),
(41, 'income_edit', 'Income Edit', 'yes'),
(42, 'income_delete', 'Income Delete', 'yes'),
(43, 'expense', 'Expense', 'yes'),
(44, 'expense_add', 'Expense Add', 'yes'),
(45, 'expense_edit', 'Expense Edit', 'yes'),
(46, 'expense_delete', 'Expense Delete', 'yes'),
(47, 'bookreport', 'Book Report', 'yes'),
(48, 'bookissuereport', 'Book Issue Report', 'yes'),
(49, 'memberreport', 'Member Report', 'yes'),
(50, 'idcardreport', 'ID Card Report', 'yes'),
(51, 'transactionreport', 'Transaction Report', 'yes'),
(52, 'menu', 'Menu', 'yes'),
(53, 'menu_add', 'Menu Add', 'yes'),
(54, 'menu_edit', 'Menu Edit', 'yes'),
(55, 'menu_delete', 'Menu Delete', 'yes'),
(56, 'role', 'Role', 'yes'),
(57, 'role_add', 'Role Add', 'yes'),
(58, 'role_edit', 'Role Edit', 'yes'),
(59, 'role_delete', 'Role Delete', 'yes'),
(60, 'emailsetting', 'Email Setting', 'yes'),
(61, 'emailtemplate', 'Email template', 'yes'),
(62, 'emailtemplate_add', 'Email Template Add', 'yes'),
(63, 'emailtemplate_edit', 'Email Template Edit', 'yes'),
(64, 'emailtemplate_delete', 'Email Template Delete', 'yes'),
(65, 'emailtemplate_view', 'Email Template', 'yes'),
(66, 'permissions', 'Permissions', 'yes'),
(67, 'permissionlog', 'Permissionlog', 'yes'),
(68, 'permissionlog_add', 'Permissionlog', 'yes'),
(69, 'permissionlog_edit', 'Permissionlog', 'yes'),
(70, 'permissionlog_delete', 'Permissionlog', 'yes'),
(71, 'generalsetting', 'General Setting', 'yes'),
(73, 'libraryconfigure', 'Library Configure', 'yes'),
(74, 'libraryconfigure_add', 'Library Configure Add', 'yes'),
(75, 'libraryconfigure_edit', 'Library Configure Edit', 'yes'),
(76, 'libraryconfigure_delete', 'Library Configure Delete', 'yes'),
(77, 'themesetting', 'Theme Setting', 'yes'),
(78, 'backup', 'Backup', 'yes'),
(79, 'update', 'Update', 'yes'),
(80, 'bookbarcodereport', 'Book Barcode Report', 'yes'),
(81, 'bookbarcode', 'Book Barcode', 'yes'),
(82, 'smssetting', 'SMS Setting', 'yes'),
(83, 'storebookcategory', 'Store Book Category', 'yes'),
(84, 'storebookcategory_add', 'Store Book Category Add', 'yes'),
(85, 'storebookcategory_edit', 'Store Book Category Edit', 'yes'),
(86, 'storebookcategory_view', 'Store Book Category View', 'yes'),
(87, 'storebookcategory_delete', 'Store Book Category Delete', 'yes'),
(88, 'storebook', 'Store Book', 'yes'),
(89, 'storebook_add', 'Store Book Add', 'yes'),
(90, 'storebook_edit', 'Store Book Edit', 'yes'),
(91, 'storebook_view', 'Store Book View', 'yes'),
(92, 'storebook_delete', 'Store Book Delete', 'yes'),
(93, 'order', 'Order', 'yes'),
(94, 'order_view', 'Order View', 'yes'),
(95, 'order_edit', 'Order Edit', 'yes'),
(96, 'paymentsetting', 'Payment Setting', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permissionlogID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permissionlogID`, `roleID`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(6, 2),
(5, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(12, 2),
(13, 2),
(14, 2),
(16, 2),
(15, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(34, 2),
(33, 2),
(35, 2),
(36, 2),
(38, 2),
(37, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(80, 2),
(81, 2),
(83, 2),
(84, 2),
(85, 2),
(87, 2),
(86, 2),
(88, 2),
(89, 2),
(90, 2),
(92, 2),
(91, 2),
(93, 2),
(95, 2),
(94, 2),
(1, 3),
(2, 3),
(5, 3),
(7, 3),
(10, 3),
(12, 3),
(15, 3),
(17, 3),
(21, 3),
(22, 3),
(26, 3),
(30, 3),
(31, 3),
(32, 3),
(34, 3),
(33, 3),
(35, 3),
(36, 3),
(37, 3),
(81, 3),
(83, 3),
(86, 3),
(88, 3),
(91, 3),
(93, 3),
(94, 3),
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(6, 1),
(5, 1),
(7, 1),
(8, 1),
(9, 1),
(11, 1),
(10, 1),
(12, 1),
(13, 1),
(14, 1),
(16, 1),
(15, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(34, 1),
(33, 1),
(35, 1),
(36, 1),
(38, 1),
(37, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(87, 1),
(86, 1),
(88, 1),
(89, 1),
(90, 1),
(92, 1),
(91, 1),
(93, 1),
(95, 1),
(94, 1),
(96, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rack`
--

CREATE TABLE `rack` (
  `rackID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rack`
--

INSERT INTO `rack` (`rackID`, `name`, `description`, `create_date`, `create_memberID`, `create_roleID`, `modify_date`, `modify_memberID`, `modify_roleID`) VALUES
(1, 'C1', 'case 1', '2022-01-14 20:49:31', 1, 1, '2022-01-14 20:49:31', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `requestbook`
--

CREATE TABLE `requestbook` (
  `requestbookID` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `coverphoto` varchar(200) NOT NULL,
  `bookcategoryID` int(11) NOT NULL,
  `isbnno` varchar(100) DEFAULT NULL,
  `editionnumber` varchar(50) DEFAULT NULL,
  `editiondate` date DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `publisheddate` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0= Request Book, 1= Request Book Accepet, 2= Request Book Rejected',
  `deleted_at` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0= Request Book Not Deleted, 1=Request Book Deleted ',
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resetpassword`
--

CREATE TABLE `resetpassword` (
  `resetpasswordID` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `code` varchar(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleID` int(11) UNSIGNED NOT NULL,
  `role` varchar(30) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL,
  `modify_roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleID`, `role`, `create_date`, `create_memberID`, `create_roleID`, `modify_date`, `modify_memberID`, `modify_roleID`) VALUES
(1, 'Admin', '2019-09-25 20:19:22', 1, 1, '2019-09-25 20:19:22', 1, 1),
(2, 'Librarian', '2019-09-25 20:19:32', 1, 1, '2020-01-29 23:32:27', 1, 1),
(3, 'Member', '2019-09-25 20:19:39', 1, 1, '2019-11-03 00:03:22', 1, 1),
(4, 'Etudiant', '2019-12-10 20:38:31', 1, 1, '2022-02-04 15:34:06', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `storebook`
--

CREATE TABLE `storebook` (
  `storebookID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `storebookcategoryID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `isbnno` varchar(100) NOT NULL,
  `coverphoto` varchar(200) NOT NULL,
  `codeno` varchar(100) NOT NULL,
  `editionnumber` varchar(100) NOT NULL,
  `editiondate` datetime DEFAULT NULL,
  `publisher` varchar(100) NOT NULL,
  `publisheddate` datetime DEFAULT NULL,
  `notes` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0= Book Available, 1= Book Not Available',
  `deleted_at` tinyint(4) NOT NULL COMMENT '0= Book Available, 1=Book Deleted ',
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `storebook`
--

INSERT INTO `storebook` (`storebookID`, `name`, `author`, `storebookcategoryID`, `quantity`, `price`, `isbnno`, `coverphoto`, `codeno`, `editionnumber`, `editiondate`, `publisher`, `publisheddate`, `notes`, `description`, `status`, `deleted_at`, `create_date`, `create_memberID`, `modify_date`, `modify_memberID`) VALUES
(1, 'Dinaben and the Lions', 'Meera Sriram & Praba Ram', 1, 25, '120.00', '120', '7de598b95e9e4d311c2b6189f5b818b693b8b01671e829e2e4b96a36dc4a9d0069b841a75e836d86ad4cd5da7647b704c83573d563be3ad8026341e84f56020f.png', '5545', '123', '2004-06-16 00:00:00', 'Tulika', '2011-02-10 00:00:00', '', 'Dinaben and the Lions of Gir', 0, 0, '2022-01-14 20:12:30', 1, '2022-01-14 20:31:39', 1),
(2, 'Gola ka Ghar Kahan?', 'Chitra Soundar', 1, 25, '80.00', '15155', '083f70b3586b47b7f611aa9381e73578831cc651494e5a1224b483f0fbc6e0d46fcf9632d36df0381005586390f3c466112f71e17a0afc51fe8e39a51b58ede7.jpg', '88798', '44', '2012-02-14 00:00:00', 'Tulika', '2009-08-20 00:00:00', '', 'Gola ka Ghar Kahan? ', 0, 0, '2022-01-14 20:23:59', 1, '2022-01-14 20:23:59', 1),
(3, 'Choon Choon', 'Lubaina Bandukwala', 3, 25, '56.00', '120', '5e658262be72dc797606e72e138880ac22da0217b6ecf4fdc1bcb4659b7eb19387653ee332fe039577dd6b576f9421557c16679bd26d76d87f1b6f4127fca067.jpg', '1235', '150', '2011-03-09 00:00:00', 'Pratham Books', '2009-02-11 00:00:00', '', 'Choon Choon ', 0, 0, '2022-01-14 20:30:47', 1, '2022-01-14 20:30:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `storebookcategory`
--

CREATE TABLE `storebookcategory` (
  `storebookcategoryID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `coverphoto` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int(11) NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `storebookcategory`
--

INSERT INTO `storebookcategory` (`storebookcategoryID`, `name`, `description`, `coverphoto`, `status`, `create_date`, `create_memberID`, `modify_date`, `modify_memberID`) VALUES
(1, 'Bilingual Picture Book', 'Bilingual Picture Book E', '07f3eb5e36f62b112e8c1584b8c5aaa09f2831e38327e1e892372801b5748e03bad774837f60ec748453dab53d096f9e36ad5ee1a011fdc4cdb890f5d5f099a4.jpg', 1, '2022-01-14 19:57:07', 1, '2022-01-14 19:57:07', 1),
(2, 'Picture Book', 'Picture Book', 'e183c9332567b0a691ca2fa547330841c0585110daaae01987c2c7f9d0aa8563744df931d2d0380bc8ae77d5865b53d92ed86e1c5575e9664b6196fe1f812489.jpg', 1, '2022-01-14 19:58:52', 1, '2022-01-14 19:58:52', 1),
(3, 'Early Reader', 'Early Reader', '5c1358e4dfde82d9ef3c9309f03afd8dc3e6885e7e0120ef06ce91c8dc4b291dd1d2837e2e79c3e892d92fd449725fdae91e010bba60784d0459bb64686f048c.jpg', 1, '2022-01-14 20:00:06', 1, '2022-01-14 20:00:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `storebookimage`
--

CREATE TABLE `storebookimage` (
  `storebookimageID` int(11) NOT NULL,
  `storebookID` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `meta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `updateID` int(11) NOT NULL,
  `version` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `memberID` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bookID`);

--
-- Indexes for table `bookcategory`
--
ALTER TABLE `bookcategory`
  ADD PRIMARY KEY (`bookcategoryID`);

--
-- Indexes for table `bookissue`
--
ALTER TABLE `bookissue`
  ADD PRIMARY KEY (`bookissueID`);

--
-- Indexes for table `bookitem`
--
ALTER TABLE `bookitem`
  ADD PRIMARY KEY (`bookitemID`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chatID`);

--
-- Indexes for table `ebook`
--
ALTER TABLE `ebook`
  ADD PRIMARY KEY (`ebookID`);

--
-- Indexes for table `emailsend`
--
ALTER TABLE `emailsend`
  ADD PRIMARY KEY (`emailsendID`);

--
-- Indexes for table `emailsetting`
--
ALTER TABLE `emailsetting`
  ADD UNIQUE KEY `frontendkey` (`optionkey`);

--
-- Indexes for table `emailtemplate`
--
ALTER TABLE `emailtemplate`
  ADD PRIMARY KEY (`emailtemplateID`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`expenseID`);

--
-- Indexes for table `finehistory`
--
ALTER TABLE `finehistory`
  ADD PRIMARY KEY (`finehistoryID`);

--
-- Indexes for table `generalsetting`
--
ALTER TABLE `generalsetting`
  ADD UNIQUE KEY `frontendkey` (`optionkey`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`incomeID`);

--
-- Indexes for table `libraryconfigure`
--
ALTER TABLE `libraryconfigure`
  ADD PRIMARY KEY (`libraryconfigureID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`memberID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menuID`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`newsletterID`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`orderitemID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `paymentanddiscount`
--
ALTER TABLE `paymentanddiscount`
  ADD PRIMARY KEY (`paymentanddiscountID`);

--
-- Indexes for table `permissionlog`
--
ALTER TABLE `permissionlog`
  ADD PRIMARY KEY (`permissionlogID`);

--
-- Indexes for table `rack`
--
ALTER TABLE `rack`
  ADD PRIMARY KEY (`rackID`);

--
-- Indexes for table `requestbook`
--
ALTER TABLE `requestbook`
  ADD PRIMARY KEY (`requestbookID`);

--
-- Indexes for table `resetpassword`
--
ALTER TABLE `resetpassword`
  ADD PRIMARY KEY (`resetpasswordID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleID`);

--
-- Indexes for table `storebook`
--
ALTER TABLE `storebook`
  ADD PRIMARY KEY (`storebookID`);

--
-- Indexes for table `storebookcategory`
--
ALTER TABLE `storebookcategory`
  ADD PRIMARY KEY (`storebookcategoryID`);

--
-- Indexes for table `storebookimage`
--
ALTER TABLE `storebookimage`
  ADD PRIMARY KEY (`storebookimageID`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`updateID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `bookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookcategory`
--
ALTER TABLE `bookcategory`
  MODIFY `bookcategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookissue`
--
ALTER TABLE `bookissue`
  MODIFY `bookissueID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookitem`
--
ALTER TABLE `bookitem`
  MODIFY `bookitemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `chatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ebook`
--
ALTER TABLE `ebook`
  MODIFY `ebookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emailsend`
--
ALTER TABLE `emailsend`
  MODIFY `emailsendID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emailtemplate`
--
ALTER TABLE `emailtemplate`
  MODIFY `emailtemplateID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `expenseID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finehistory`
--
ALTER TABLE `finehistory`
  MODIFY `finehistoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `incomeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `libraryconfigure`
--
ALTER TABLE `libraryconfigure`
  MODIFY `libraryconfigureID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `memberID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `newsletterID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `orderitemID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paymentanddiscount`
--
ALTER TABLE `paymentanddiscount`
  MODIFY `paymentanddiscountID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissionlog`
--
ALTER TABLE `permissionlog`
  MODIFY `permissionlogID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `rack`
--
ALTER TABLE `rack`
  MODIFY `rackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `requestbook`
--
ALTER TABLE `requestbook`
  MODIFY `requestbookID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resetpassword`
--
ALTER TABLE `resetpassword`
  MODIFY `resetpasswordID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `storebook`
--
ALTER TABLE `storebook`
  MODIFY `storebookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `storebookcategory`
--
ALTER TABLE `storebookcategory`
  MODIFY `storebookcategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `storebookimage`
--
ALTER TABLE `storebookimage`
  MODIFY `storebookimageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `updateID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
