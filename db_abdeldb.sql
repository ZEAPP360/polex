-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2023 at 05:30 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_abdeldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads_campaigns`
--

CREATE TABLE `ads_campaigns` (
  `campaign_id` int NOT NULL,
  `campaign_user_id` int UNSIGNED NOT NULL,
  `campaign_title` varchar(256) NOT NULL,
  `campaign_start_date` datetime NOT NULL,
  `campaign_end_date` datetime NOT NULL,
  `campaign_budget` double NOT NULL,
  `campaign_spend` double NOT NULL DEFAULT '0',
  `campaign_bidding` enum('click','view') NOT NULL,
  `audience_countries` mediumtext NOT NULL,
  `audience_gender` varchar(32) NOT NULL,
  `audience_relationship` varchar(64) NOT NULL,
  `ads_title` varchar(255) DEFAULT NULL,
  `ads_description` mediumtext,
  `ads_type` varchar(32) NOT NULL,
  `ads_url` varchar(256) DEFAULT NULL,
  `ads_page` int UNSIGNED DEFAULT NULL,
  `ads_group` int UNSIGNED DEFAULT NULL,
  `ads_event` int UNSIGNED DEFAULT NULL,
  `ads_placement` enum('newsfeed','sidebar') NOT NULL,
  `ads_image` varchar(256) NOT NULL,
  `campaign_created_date` datetime NOT NULL,
  `campaign_is_active` enum('0','1') NOT NULL DEFAULT '1',
  `campaign_is_approved` enum('0','1') NOT NULL DEFAULT '0',
  `campaign_is_declined` enum('0','1') NOT NULL DEFAULT '0',
  `campaign_views` int UNSIGNED NOT NULL DEFAULT '0',
  `campaign_clicks` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `ads_system`
--

CREATE TABLE `ads_system` (
  `ads_id` int NOT NULL,
  `title` varchar(256) NOT NULL,
  `place` varchar(32) NOT NULL,
  `code` mediumtext NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `affiliates_payments`
--

CREATE TABLE `affiliates_payments` (
  `payment_id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `amount` varchar(32) NOT NULL,
  `method` varchar(64) NOT NULL,
  `method_value` text NOT NULL,
  `time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` int NOT NULL,
  `name` varchar(256) NOT NULL,
  `title` varchar(256) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` mediumtext NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `announcements_users`
--

CREATE TABLE `announcements_users` (
  `id` int UNSIGNED NOT NULL,
  `announcement_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `auto_connect`
--

CREATE TABLE `auto_connect` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(32) NOT NULL,
  `country_id` int UNSIGNED NOT NULL,
  `nodes_ids` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `bank_transfers`
--

CREATE TABLE `bank_transfers` (
  `transfer_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `handle` varchar(32) NOT NULL,
  `package_id` int UNSIGNED DEFAULT NULL,
  `post_id` int UNSIGNED DEFAULT NULL,
  `node_id` int UNSIGNED DEFAULT NULL,
  `node_type` varchar(256) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `bank_receipt` varchar(256) NOT NULL,
  `time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE `blacklist` (
  `node_id` int UNSIGNED NOT NULL,
  `node_type` enum('ip','email','username') NOT NULL,
  `node_value` varchar(64) NOT NULL,
  `created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_categories`
--

CREATE TABLE `blogs_categories` (
  `category_id` int UNSIGNED NOT NULL,
  `category_parent_id` int UNSIGNED NOT NULL,
  `category_name` varchar(256) NOT NULL,
  `category_description` text NOT NULL,
  `category_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `blogs_categories`
--

INSERT INTO `blogs_categories` (`category_id`, `category_parent_id`, `category_name`, `category_description`, `category_order`) VALUES
(2, 0, 'Causes', '', 2),
(3, 0, 'Crafts', '', 3),
(4, 0, 'Dance', '', 4),
(5, 0, 'Drinks', '', 5),
(6, 0, 'Film', '', 6),
(7, 0, 'Fitness', '', 7),
(8, 0, 'Food', '', 8),
(9, 0, 'Games', '', 9),
(10, 0, 'Gardening', '', 10),
(11, 0, 'Health', '', 11),
(12, 0, 'Home', '', 12),
(13, 0, 'Literature', '', 13),
(14, 0, 'Music', '', 14),
(15, 0, 'Networking', '', 15),
(16, 0, 'Other', '', 16),
(17, 0, 'Party', '', 17),
(18, 0, 'Religion', '', 18),
(19, 0, 'Shopping', '', 19),
(20, 0, 'Sports', '', 20),
(21, 0, 'Theater', '', 21),
(22, 0, 'Wellness', '', 22);

-- --------------------------------------------------------

--
-- Table structure for table `coinpayments_transactions`
--

CREATE TABLE `coinpayments_transactions` (
  `transaction_id` int UNSIGNED NOT NULL,
  `transaction_txn_id` text,
  `user_id` int UNSIGNED NOT NULL,
  `amount` varchar(32) NOT NULL,
  `product` text NOT NULL,
  `created_at` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `status_message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `conversation_id` int UNSIGNED NOT NULL,
  `last_message_id` int UNSIGNED NOT NULL,
  `color` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`conversation_id`, `last_message_id`, `color`) VALUES
(1, 2, NULL),
(2, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `conversations_calls_audio`
--

CREATE TABLE `conversations_calls_audio` (
  `call_id` int UNSIGNED NOT NULL,
  `from_user_id` int UNSIGNED NOT NULL,
  `from_user_token` mediumtext NOT NULL,
  `to_user_id` int UNSIGNED NOT NULL,
  `to_user_token` mediumtext NOT NULL,
  `room` varchar(64) NOT NULL,
  `answered` enum('0','1') NOT NULL DEFAULT '0',
  `declined` enum('0','1') NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `conversations_calls_video`
--

CREATE TABLE `conversations_calls_video` (
  `call_id` int UNSIGNED NOT NULL,
  `from_user_id` int UNSIGNED NOT NULL,
  `from_user_token` text NOT NULL,
  `to_user_id` int UNSIGNED NOT NULL,
  `to_user_token` text NOT NULL,
  `room` varchar(64) NOT NULL,
  `answered` enum('0','1') NOT NULL DEFAULT '0',
  `declined` enum('0','1') NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `conversations_messages`
--

CREATE TABLE `conversations_messages` (
  `message_id` int UNSIGNED NOT NULL,
  `conversation_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `message` longtext NOT NULL,
  `image` varchar(256) NOT NULL,
  `voice_note` varchar(256) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `conversations_messages`
--

INSERT INTO `conversations_messages` (`message_id`, `conversation_id`, `user_id`, `message`, `image`, `voice_note`, `time`) VALUES
(1, 1, 1, 'كيفك ', '', '', '2023-01-15 14:40:32'),
(2, 1, 1, 'ههل ', '', '', '2023-01-15 14:42:30'),
(3, 2, 75, 'سلام', '', '', '2023-01-20 00:02:08'),
(4, 2, 1, 'وعليكم السلام ', '', '', '2023-01-20 00:10:12');

-- --------------------------------------------------------

--
-- Table structure for table `conversations_users`
--

CREATE TABLE `conversations_users` (
  `id` int UNSIGNED NOT NULL,
  `conversation_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `seen` enum('0','1') NOT NULL DEFAULT '0',
  `typing` enum('0','1') NOT NULL DEFAULT '0',
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `conversations_users`
--

INSERT INTO `conversations_users` (`id`, `conversation_id`, `user_id`, `seen`, `typing`, `deleted`) VALUES
(1, 1, 1, '1', '0', '0'),
(2, 1, 2, '1', '0', '0'),
(3, 2, 75, '1', '0', '0'),
(4, 2, 1, '1', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `field_id` int UNSIGNED NOT NULL,
  `field_for` varchar(64) NOT NULL,
  `type` varchar(32) NOT NULL,
  `select_options` mediumtext NOT NULL,
  `label` varchar(256) NOT NULL,
  `description` mediumtext NOT NULL,
  `place` varchar(32) NOT NULL,
  `length` int NOT NULL DEFAULT '32',
  `field_order` int NOT NULL DEFAULT '1',
  `is_link` enum('0','1') NOT NULL DEFAULT '0',
  `mandatory` enum('0','1') NOT NULL DEFAULT '0',
  `in_registration` enum('0','1') NOT NULL DEFAULT '0',
  `in_profile` enum('0','1') NOT NULL DEFAULT '0',
  `in_search` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_values`
--

CREATE TABLE `custom_fields_values` (
  `value_id` int UNSIGNED NOT NULL,
  `value` mediumtext NOT NULL,
  `field_id` int UNSIGNED NOT NULL,
  `node_id` int UNSIGNED NOT NULL,
  `node_type` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `developers_apps`
--

CREATE TABLE `developers_apps` (
  `app_id` int UNSIGNED NOT NULL,
  `app_user_id` int UNSIGNED NOT NULL,
  `app_category_id` int UNSIGNED NOT NULL,
  `app_auth_id` varchar(128) NOT NULL,
  `app_auth_secret` varchar(128) NOT NULL,
  `app_name` varchar(256) NOT NULL,
  `app_domain` varchar(256) NOT NULL,
  `app_redirect_url` varchar(256) NOT NULL,
  `app_description` mediumtext NOT NULL,
  `app_icon` varchar(256) NOT NULL,
  `app_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `developers_apps_categories`
--

CREATE TABLE `developers_apps_categories` (
  `category_id` int UNSIGNED NOT NULL,
  `category_parent_id` int UNSIGNED NOT NULL,
  `category_name` varchar(256) NOT NULL,
  `category_description` text NOT NULL,
  `category_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `developers_apps_categories`
--

INSERT INTO `developers_apps_categories` (`category_id`, `category_parent_id`, `category_name`, `category_description`, `category_order`) VALUES
(1, 0, 'Business and Pages', '', 1),
(2, 0, 'Community &amp; Government', '', 2),
(3, 0, 'Education', '', 3),
(4, 0, 'Entertainment', '', 4),
(5, 0, 'Entertainment', '', 5),
(6, 0, 'Games', '', 6),
(7, 0, 'Lifestyle', '', 7),
(8, 0, 'Messaging', '', 8),
(9, 0, 'News', '', 9),
(10, 0, 'Shopping', '', 10),
(11, 0, 'Social Networks &amp; Dating', '', 11),
(12, 0, 'Utility &amp; Productivity', '', 12);

-- --------------------------------------------------------

--
-- Table structure for table `developers_apps_users`
--

CREATE TABLE `developers_apps_users` (
  `id` int UNSIGNED NOT NULL,
  `app_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `auth_key` varchar(128) NOT NULL,
  `access_token` varchar(128) DEFAULT NULL,
  `access_token_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `emojis`
--

CREATE TABLE `emojis` (
  `emoji_id` int UNSIGNED NOT NULL,
  `unicode_char` varchar(256) NOT NULL,
  `pattern` varchar(256) NOT NULL,
  `class` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `emojis`
--

INSERT INTO `emojis` (`emoji_id`, `unicode_char`, `pattern`, `class`) VALUES
(1, '😀', ':grinning-face:', 'grinning-face'),
(2, '😃', ':grinning-face-with-big-eyes:', 'grinning-face-with-big-eyes'),
(3, '😄', ':grinning-face-with-smiling-eyes:', 'grinning-face-with-smiling-eyes'),
(4, '😁', ':beaming-face-with-smiling-eyes:', 'beaming-face-with-smiling-eyes'),
(5, '😆', ':grinning-squinting-face:', 'grinning-squinting-face'),
(6, '😅', ':grinning-face-with-sweat:', 'grinning-face-with-sweat'),
(7, '🤣', ':rolling-on-the-floor-laughing:', 'rolling-on-the-floor-laughing'),
(8, '😂', ':face-with-tears-of-joy:', 'face-with-tears-of-joy'),
(9, '🙂', ':slightly-smiling-face:', 'slightly-smiling-face'),
(10, '🙃', ':upside-down-face:', 'upside-down-face'),
(11, '😉', ':winking-face:', 'winking-face'),
(12, '😊', ':smiling-face-with-smiling-eyes:', 'smiling-face-with-smiling-eyes'),
(13, '😇', ':smiling-face-with-halo:', 'smiling-face-with-halo'),
(14, '🥰', ':smiling-face-with-hearts:', 'smiling-face-with-hearts'),
(15, '😍', ':smiling-face-with-heart-eyes:', 'smiling-face-with-heart-eyes'),
(16, '🤩', ':star-struck:', 'star-struck'),
(17, '😘', ':face-blowing-a-kiss:', 'face-blowing-a-kiss'),
(18, '😗', ':kissing-face:', 'kissing-face'),
(19, '☺️', ':smiling-face:', 'smiling-face'),
(20, '😚', ':kissing-face-with-closed-eyes:', 'kissing-face-with-closed-eyes'),
(21, '😙', ':kissing-face-with-smiling-eyes:', 'kissing-face-with-smiling-eyes'),
(22, '🥲', ':smiling-face-with-tear:', 'smiling-face-with-tear'),
(23, '😋', ':face-savoring-food:', 'face-savoring-food'),
(24, '😛', ':face-with-tongue:', 'face-with-tongue'),
(25, '😜', ':winking-face-with-tongue:', 'winking-face-with-tongue'),
(26, '🤪', ':zany-face:', 'zany-face'),
(27, '😝', ':squinting-face-with-tongue:', 'squinting-face-with-tongue'),
(28, '🤑', ':money-mouth-face:', 'money-mouth-face'),
(29, '🤗', ':hugging-face:', 'hugging-face'),
(30, '🤭', ':face-with-hand-over-mouth:', 'face-with-hand-over-mouth'),
(31, '🤫', ':shushing-face:', 'shushing-face'),
(32, '🤔', ':thinking-face:', 'thinking-face'),
(33, '🤐', ':zipper-mouth-face:', 'zipper-mouth-face'),
(34, '🤨', ':face-with-raised-eyebrow:', 'face-with-raised-eyebrow'),
(35, '😐', ':neutral-face:', 'neutral-face'),
(36, '😑', ':expressionless-face:', 'expressionless-face'),
(37, '😶', ':face-without-mouth:', 'face-without-mouth'),
(39, '😏', ':smirking-face:', 'smirking-face'),
(40, '😒', ':unamused-face:', 'unamused-face'),
(41, '🙄', ':face-with-rolling-eyes:', 'face-with-rolling-eyes'),
(42, '😬', ':grimacing-face:', 'grimacing-face'),
(44, '🤥', ':lying-face:', 'lying-face'),
(45, '😌', ':relieved-face:', 'relieved-face'),
(46, '😔', ':pensive-face:', 'pensive-face'),
(47, '😪', ':sleepy-face:', 'sleepy-face'),
(48, '🤤', ':drooling-face:', 'drooling-face'),
(49, '😴', ':sleeping-face:', 'sleeping-face'),
(50, '😷', ':face-with-medical-mask:', 'face-with-medical-mask'),
(51, '🤒', ':face-with-thermometer:', 'face-with-thermometer'),
(52, '🤕', ':face-with-head-bandage:', 'face-with-head-bandage'),
(53, '🤢', ':nauseated-face:', 'nauseated-face'),
(54, '🤮', ':face-vomiting:', 'face-vomiting'),
(55, '🤧', ':sneezing-face:', 'sneezing-face'),
(56, '🥵', ':hot-face:', 'hot-face'),
(57, '🥶', ':cold-face:', 'cold-face'),
(58, '🥴', ':woozy-face:', 'woozy-face'),
(59, '😵', ':knocked-out-face:', 'knocked-out-face'),
(61, '🤯', ':exploding-head:', 'exploding-head'),
(62, '🤠', ':cowboy-hat-face:', 'cowboy-hat-face'),
(63, '🥳', ':partying-face:', 'partying-face'),
(64, '🥸', ':disguised-face:', 'disguised-face'),
(65, '😎', ':smiling-face-with-sunglasses:', 'smiling-face-with-sunglasses'),
(66, '🤓', ':nerd-face:', 'nerd-face'),
(67, '🧐', ':face-with-monocle:', 'face-with-monocle'),
(68, '😕', ':confused-face:', 'confused-face'),
(69, '😟', ':worried-face:', 'worried-face'),
(70, '🙁', ':slightly-frowning-face:', 'slightly-frowning-face'),
(71, '☹️', ':frowning-face:', 'frowning-face'),
(72, '😮', ':face-with-open-mouth:', 'face-with-open-mouth'),
(73, '😯', ':hushed-face:', 'hushed-face'),
(74, '😲', ':astonished-face:', 'astonished-face'),
(75, '😳', ':flushed-face:', 'flushed-face'),
(76, '🥺', ':pleading-face:', 'pleading-face'),
(77, '😦', ':frowning-face-with-open-mouth:', 'frowning-face-with-open-mouth'),
(78, '😧', ':anguished-face:', 'anguished-face'),
(79, '😨', ':fearful-face:', 'fearful-face'),
(80, '😰', ':anxious-face-with-sweat:', 'anxious-face-with-sweat'),
(81, '😥', ':sad-but-relieved-face:', 'sad-but-relieved-face'),
(82, '😢', ':crying-face:', 'crying-face'),
(83, '😭', ':loudly-crying-face:', 'loudly-crying-face'),
(84, '😱', ':face-screaming-in-fear:', 'face-screaming-in-fear'),
(85, '😖', ':confounded-face:', 'confounded-face'),
(86, '😣', ':persevering-face:', 'persevering-face'),
(87, '😞', ':disappointed-face:', 'disappointed-face'),
(88, '😓', ':downcast-face-with-sweat:', 'downcast-face-with-sweat'),
(89, '😩', ':weary-face:', 'weary-face'),
(90, '😫', ':tired-face:', 'tired-face'),
(91, '🥱', ':yawning-face:', 'yawning-face'),
(92, '😤', ':face-with-steam-from-nose:', 'face-with-steam-from-nose'),
(93, '😡', ':pouting-face:', 'pouting-face'),
(94, '😠', ':angry-face:', 'angry-face'),
(95, '🤬', ':face-with-symbols-on-mouth:', 'face-with-symbols-on-mouth'),
(96, '😈', ':smiling-face-with-horns:', 'smiling-face-with-horns'),
(97, '👿', ':angry-face-with-horns:', 'angry-face-with-horns'),
(98, '💀', ':skull:', 'skull'),
(99, '☠️', ':skull-and-crossbones:', 'skull-and-crossbones'),
(100, '💩', ':pile-of-poo:', 'pile-of-poo'),
(101, '🤡', ':clown-face:', 'clown-face'),
(102, '👹', ':ogre:', 'ogre'),
(103, '👺', ':goblin:', 'goblin'),
(104, '👻', ':ghost:', 'ghost'),
(105, '👽', ':alien:', 'alien'),
(106, '👾', ':alien-monster:', 'alien-monster'),
(107, '🤖', ':robot:', 'robot'),
(108, '😺', ':grinning-cat:', 'grinning-cat'),
(109, '😸', ':grinning-cat-with-smiling-eyes:', 'grinning-cat-with-smiling-eyes'),
(110, '😹', ':cat-with-tears-of-joy:', 'cat-with-tears-of-joy'),
(111, '😻', ':smiling-cat-with-heart-eyes:', 'smiling-cat-with-heart-eyes'),
(112, '😼', ':cat-with-wry-smile:', 'cat-with-wry-smile'),
(113, '😽', ':kissing-cat:', 'kissing-cat'),
(114, '🙀', ':weary-cat:', 'weary-cat'),
(115, '😿', ':crying-cat:', 'crying-cat'),
(116, '😾', ':pouting-cat:', 'pouting-cat'),
(117, '🙈', ':see-no-evil-monkey:', 'see-no-evil-monkey'),
(118, '🙉', ':hear-no-evil-monkey:', 'hear-no-evil-monkey'),
(119, '🙊', ':speak-no-evil-monkey:', 'speak-no-evil-monkey'),
(120, '💋', ':kiss-mark:', 'kiss-mark'),
(121, '💌', ':love-letter:', 'love-letter'),
(122, '💘', ':heart-with-arrow:', 'heart-with-arrow'),
(123, '💝', ':heart-with-ribbon:', 'heart-with-ribbon'),
(124, '💖', ':sparkling-heart:', 'sparkling-heart'),
(125, '💗', ':growing-heart:', 'growing-heart'),
(126, '💓', ':beating-heart:', 'beating-heart'),
(127, '💞', ':revolving-hearts:', 'revolving-hearts'),
(128, '💕', ':two-hearts:', 'two-hearts'),
(129, '💟', ':heart-decoration:', 'heart-decoration'),
(130, '❣️', ':heart-exclamation:', 'heart-exclamation'),
(131, '💔', ':broken-heart:', 'broken-heart'),
(132, '❤️‍🔥', ':heart-on-fire:', 'heart-on-fire'),
(133, '❤️‍🩹', ':mending-heart:', 'mending-heart'),
(134, '❤️', ':red-heart:', 'red-heart'),
(135, '🧡', ':orange-heart:', 'orange-heart'),
(136, '💛', ':yellow-heart:', 'yellow-heart'),
(137, '💚', ':green-heart:', 'green-heart'),
(138, '💙', ':blue-heart:', 'blue-heart'),
(139, '💜', ':purple-heart:', 'purple-heart'),
(140, '🤎', ':brown-heart:', 'brown-heart'),
(141, '🖤', ':black-heart:', 'black-heart'),
(142, '🤍', ':white-heart:', 'white-heart'),
(143, '💯', ':hundred-points:', 'hundred-points'),
(144, '💢', ':anger-symbol:', 'anger-symbol'),
(145, '💥', ':collision:', 'collision'),
(146, '💫', ':dizzy:', 'dizzy'),
(147, '💦', ':sweat-droplets:', 'sweat-droplets'),
(148, '💨', ':dashing-away:', 'dashing-away'),
(149, '🕳️', ':hole:', 'hole'),
(150, '💣', ':bomb:', 'bomb'),
(151, '💬', ':speech-balloon:', 'speech-balloon'),
(153, '🗨️', ':left-speech-bubble:', 'left-speech-bubble'),
(154, '🗯️', ':right-anger-bubble:', 'right-anger-bubble'),
(155, '💭', ':thought-balloon:', 'thought-balloon'),
(156, '💤', ':zzz:', 'zzz'),
(157, '👋', ':waving-hand:', 'waving-hand'),
(158, '🤚', ':raised-back-of-hand:', 'raised-back-of-hand'),
(159, '🖐️', ':hand-with-fingers-splayed:', 'hand-with-fingers-splayed'),
(160, '✋', ':raised-hand:', 'raised-hand'),
(161, '🖖', ':vulcan-salute:', 'vulcan-salute'),
(162, '👌', ':ok-hand:', 'ok-hand'),
(163, '🤌', ':pinched-fingers:', 'pinched-fingers'),
(164, '🤏', ':pinching-hand:', 'pinching-hand'),
(165, '✌️', ':victory-hand:', 'victory-hand'),
(166, '🤞', ':crossed-fingers:', 'crossed-fingers'),
(167, '🤟', ':love-you-gesture:', 'love-you-gesture'),
(168, '🤘', ':sign-of-the-horns:', 'sign-of-the-horns'),
(169, '🤙', ':call-me-hand:', 'call-me-hand'),
(170, '👈', ':backhand-index-pointing-left:', 'backhand-index-pointing-left'),
(171, '👉', ':backhand-index-pointing-right:', 'backhand-index-pointing-right'),
(172, '👆', ':backhand-index-pointing-up:', 'backhand-index-pointing-up'),
(173, '🖕', ':middle-finger:', 'middle-finger'),
(174, '👇', ':backhand-index-pointing-down:', 'backhand-index-pointing-down'),
(175, '☝️', ':index-pointing-up:', 'index-pointing-up'),
(176, '👍', ':thumbs-up:', 'thumbs-up'),
(177, '👎', ':thumbs-down:', 'thumbs-down'),
(178, '✊', ':raised-fist:', 'raised-fist'),
(179, '👊', ':oncoming-fist:', 'oncoming-fist'),
(180, '🤛', ':left-facing-fist:', 'left-facing-fist'),
(181, '🤜', ':right-facing-fist:', 'right-facing-fist'),
(182, '👏', ':clapping-hands:', 'clapping-hands'),
(183, '🙌', ':raising-hands:', 'raising-hands'),
(184, '👐', ':open-hands:', 'open-hands'),
(185, '🤲', ':palms-up-together:', 'palms-up-together'),
(186, '🤝', ':handshake:', 'handshake'),
(187, '🙏', ':folded-hands:', 'folded-hands'),
(188, '✍️', ':writing-hand:', 'writing-hand'),
(189, '💅', ':nail-polish:', 'nail-polish'),
(190, '🤳', ':selfie:', 'selfie'),
(191, '💪', ':flexed-biceps:', 'flexed-biceps'),
(192, '🦾', ':mechanical-arm:', 'mechanical-arm'),
(193, '🦿', ':mechanical-leg:', 'mechanical-leg'),
(194, '🦵', ':leg:', 'leg'),
(195, '🦶', ':foot:', 'foot'),
(196, '👂', ':ear:', 'ear'),
(197, '🦻', ':ear-with-hearing-aid:', 'ear-with-hearing-aid'),
(198, '👃', ':nose:', 'nose'),
(199, '🧠', ':brain:', 'brain'),
(200, '🫀', ':anatomical-heart:', 'anatomical-heart'),
(201, '🫁', ':lungs:', 'lungs'),
(202, '🦷', ':tooth:', 'tooth'),
(203, '🦴', ':bone:', 'bone'),
(204, '👀', ':eyes:', 'eyes'),
(205, '👁️', ':eye:', 'eye'),
(206, '👅', ':tongue:', 'tongue'),
(207, '👄', ':mouth:', 'mouth'),
(208, '👶', ':baby:', 'baby'),
(209, '🧒', ':child:', 'child'),
(210, '👦', ':boy:', 'boy'),
(211, '👧', ':girl:', 'girl'),
(212, '🧑', ':person:', 'person'),
(213, '👱', ':person-blond-hair:', 'person-blond-hair'),
(214, '👨', ':man:', 'man'),
(215, '🧔', ':person-beard:', 'person-beard'),
(216, '🧔‍♂️', ':man-beard:', 'man-beard'),
(217, '🧔‍♀️', ':woman-beard:', 'woman-beard'),
(218, '👨‍🦰', ':man-red-hair:', 'man-red-hair'),
(219, '👨‍🦱', ':man-curly-hair:', 'man-curly-hair'),
(220, '👨‍🦳', ':man-white-hair:', 'man-white-hair'),
(221, '👨‍🦲', ':man-bald:', 'man-bald'),
(222, '👩', ':woman:', 'woman'),
(223, '👩‍🦰', ':woman-red-hair:', 'woman-red-hair'),
(224, '🧑‍🦰', ':person-red-hair:', 'person-red-hair'),
(225, '👩‍🦱', ':woman-curly-hair:', 'woman-curly-hair'),
(226, '🧑‍🦱', ':person-curly-hair:', 'person-curly-hair'),
(227, '👩‍🦳', ':woman-white-hair:', 'woman-white-hair'),
(228, '🧑‍🦳', ':person-white-hair:', 'person-white-hair'),
(229, '👩‍🦲', ':woman-bald:', 'woman-bald'),
(230, '🧑‍🦲', ':person-bald:', 'person-bald'),
(231, '👱‍♀️', ':woman-blond-hair:', 'woman-blond-hair'),
(232, '👱‍♂️', ':man-blond-hair:', 'man-blond-hair'),
(233, '🧓', ':older-person:', 'older-person'),
(234, '👴', ':old-man:', 'old-man'),
(235, '👵', ':old-woman:', 'old-woman'),
(236, '🙍', ':person-frowning:', 'person-frowning'),
(237, '🙍‍♂️', ':man-frowning:', 'man-frowning'),
(238, '🙍‍♀️', ':woman-frowning:', 'woman-frowning'),
(239, '🙎', ':person-pouting:', 'person-pouting'),
(240, '🙎‍♂️', ':man-pouting:', 'man-pouting'),
(241, '🙎‍♀️', ':woman-pouting:', 'woman-pouting'),
(242, '🙅', ':person-gesturing-no:', 'person-gesturing-no'),
(243, '🙅‍♂️', ':man-gesturing-no:', 'man-gesturing-no'),
(244, '🙅‍♀️', ':woman-gesturing-no:', 'woman-gesturing-no'),
(245, '🙆', ':person-gesturing-ok:', 'person-gesturing-ok'),
(246, '🙆‍♂️', ':man-gesturing-ok:', 'man-gesturing-ok'),
(247, '🙆‍♀️', ':woman-gesturing-ok:', 'woman-gesturing-ok'),
(248, '💁', ':person-tipping-hand:', 'person-tipping-hand'),
(249, '💁‍♂️', ':man-tipping-hand:', 'man-tipping-hand'),
(250, '💁‍♀️', ':woman-tipping-hand:', 'woman-tipping-hand'),
(251, '🙋', ':person-raising-hand:', 'person-raising-hand'),
(252, '🙋‍♂️', ':man-raising-hand:', 'man-raising-hand'),
(253, '🙋‍♀️', ':woman-raising-hand:', 'woman-raising-hand'),
(254, '🧏', ':deaf-person:', 'deaf-person'),
(255, '🧏‍♂️', ':deaf-man:', 'deaf-man'),
(256, '🧏‍♀️', ':deaf-woman:', 'deaf-woman'),
(257, '🙇', ':person-bowing:', 'person-bowing'),
(258, '🙇‍♂️', ':man-bowing:', 'man-bowing'),
(259, '🙇‍♀️', ':woman-bowing:', 'woman-bowing'),
(260, '🤦', ':person-facepalming:', 'person-facepalming'),
(261, '🤦‍♂️', ':man-facepalming:', 'man-facepalming'),
(262, '🤦‍♀️', ':woman-facepalming:', 'woman-facepalming'),
(263, '🤷', ':person-shrugging:', 'person-shrugging'),
(264, '🤷‍♂️', ':man-shrugging:', 'man-shrugging'),
(265, '🤷‍♀️', ':woman-shrugging:', 'woman-shrugging'),
(266, '🧑‍⚕️', ':health-worker:', 'health-worker'),
(267, '👨‍⚕️', ':man-health-worker:', 'man-health-worker'),
(268, '👩‍⚕️', ':woman-health-worker:', 'woman-health-worker'),
(269, '🧑‍🎓', ':student:', 'student'),
(270, '👨‍🎓', ':man-student:', 'man-student'),
(271, '👩‍🎓', ':woman-student:', 'woman-student'),
(272, '🧑‍🏫', ':teacher:', 'teacher'),
(273, '👨‍🏫', ':man-teacher:', 'man-teacher'),
(274, '👩‍🏫', ':woman-teacher:', 'woman-teacher'),
(275, '🧑‍⚖️', ':judge:', 'judge'),
(276, '👨‍⚖️', ':man-judge:', 'man-judge'),
(277, '👩‍⚖️', ':woman-judge:', 'woman-judge'),
(278, '🧑‍🌾', ':farmer:', 'farmer'),
(279, '👨‍🌾', ':man-farmer:', 'man-farmer'),
(280, '👩‍🌾', ':woman-farmer:', 'woman-farmer'),
(281, '🧑‍🍳', ':cook:', 'cook'),
(282, '👨‍🍳', ':man-cook:', 'man-cook'),
(283, '👩‍🍳', ':woman-cook:', 'woman-cook'),
(284, '🧑‍🔧', ':mechanic:', 'mechanic'),
(285, '👨‍🔧', ':man-mechanic:', 'man-mechanic'),
(286, '👩‍🔧', ':woman-mechanic:', 'woman-mechanic'),
(287, '🧑‍🏭', ':factory-worker:', 'factory-worker'),
(288, '👨‍🏭', ':man-factory-worker:', 'man-factory-worker'),
(289, '👩‍🏭', ':woman-factory-worker:', 'woman-factory-worker'),
(290, '🧑‍💼', ':office-worker:', 'office-worker'),
(291, '👨‍💼', ':man-office-worker:', 'man-office-worker'),
(292, '👩‍💼', ':woman-office-worker:', 'woman-office-worker'),
(293, '🧑‍🔬', ':scientist:', 'scientist'),
(294, '👨‍🔬', ':man-scientist:', 'man-scientist'),
(295, '👩‍🔬', ':woman-scientist:', 'woman-scientist'),
(296, '🧑‍💻', ':technologist:', 'technologist'),
(297, '👨‍💻', ':man-technologist:', 'man-technologist'),
(298, '👩‍💻', ':woman-technologist:', 'woman-technologist'),
(299, '🧑‍🎤', ':singer:', 'singer'),
(300, '👨‍🎤', ':man-singer:', 'man-singer'),
(301, '👩‍🎤', ':woman-singer:', 'woman-singer'),
(302, '🧑‍🎨', ':artist:', 'artist'),
(303, '👨‍🎨', ':man-artist:', 'man-artist'),
(304, '👩‍🎨', ':woman-artist:', 'woman-artist'),
(305, '🧑‍✈️', ':pilot:', 'pilot'),
(306, '👨‍✈️', ':man-pilot:', 'man-pilot'),
(307, '👩‍✈️', ':woman-pilot:', 'woman-pilot'),
(308, '🧑‍🚀', ':astronaut:', 'astronaut'),
(309, '👨‍🚀', ':man-astronaut:', 'man-astronaut'),
(310, '👩‍🚀', ':woman-astronaut:', 'woman-astronaut'),
(311, '🧑‍🚒', ':firefighter:', 'firefighter'),
(312, '👨‍🚒', ':man-firefighter:', 'man-firefighter'),
(313, '👩‍🚒', ':woman-firefighter:', 'woman-firefighter'),
(314, '👮', ':police-officer:', 'police-officer'),
(315, '👮‍♂️', ':man-police-officer:', 'man-police-officer'),
(316, '👮‍♀️', ':woman-police-officer:', 'woman-police-officer'),
(317, '🕵️', ':detective:', 'detective'),
(318, '🕵️‍♂️', ':man-detective:', 'man-detective'),
(319, '🕵️‍♀️', ':woman-detective:', 'woman-detective'),
(320, '💂', ':guard:', 'guard'),
(321, '💂‍♂️', ':man-guard:', 'man-guard'),
(322, '💂‍♀️', ':woman-guard:', 'woman-guard'),
(323, '🥷', ':ninja:', 'ninja'),
(324, '👷', ':construction-worker:', 'construction-worker'),
(325, '👷‍♂️', ':man-construction-worker:', 'man-construction-worker'),
(326, '👷‍♀️', ':woman-construction-worker:', 'woman-construction-worker'),
(327, '🤴', ':prince:', 'prince'),
(328, '👸', ':princess:', 'princess'),
(329, '👳', ':person-wearing-turban:', 'person-wearing-turban'),
(330, '👳‍♂️', ':man-wearing-turban:', 'man-wearing-turban'),
(331, '👳‍♀️', ':woman-wearing-turban:', 'woman-wearing-turban'),
(332, '👲', ':person-with-skullcap:', 'person-with-skullcap'),
(333, '🧕', ':woman-with-headscarf:', 'woman-with-headscarf'),
(334, '🤵', ':person-in-tuxedo:', 'person-in-tuxedo'),
(335, '🤵‍♂️', ':man-in-tuxedo:', 'man-in-tuxedo'),
(336, '🤵‍♀️', ':woman-in-tuxedo:', 'woman-in-tuxedo'),
(337, '👰', ':person-with-veil:', 'person-with-veil'),
(338, '👰‍♂️', ':man-with-veil:', 'man-with-veil'),
(339, '👰‍♀️', ':woman-with-veil:', 'woman-with-veil'),
(340, '🤰', ':pregnant-woman:', 'pregnant-woman'),
(341, '🤱', ':breast-feeding:', 'breast-feeding'),
(342, '👩‍🍼', ':woman-feeding-baby:', 'woman-feeding-baby'),
(343, '👨‍🍼', ':man-feeding-baby:', 'man-feeding-baby'),
(344, '🧑‍🍼', ':person-feeding-baby:', 'person-feeding-baby'),
(345, '👼', ':baby-angel:', 'baby-angel'),
(346, '🎅', ':santa-claus:', 'santa-claus'),
(348, '🧑‍🎄', ':mx-claus:', 'mx-claus'),
(349, '🦸', ':superhero:', 'superhero'),
(350, '🦸‍♂️', ':man-superhero:', 'man-superhero'),
(351, '🦸‍♀️', ':woman-superhero:', 'woman-superhero'),
(352, '🦹', ':supervillain:', 'supervillain'),
(353, '🦹‍♂️', ':man-supervillain:', 'man-supervillain'),
(354, '🦹‍♀️', ':woman-supervillain:', 'woman-supervillain'),
(355, '🧙', ':mage:', 'mage'),
(356, '🧙‍♂️', ':man-mage:', 'man-mage'),
(357, '🧙‍♀️', ':woman-mage:', 'woman-mage'),
(358, '🧚', ':fairy:', 'fairy'),
(359, '🧚‍♂️', ':man-fairy:', 'man-fairy'),
(360, '🧚‍♀️', ':woman-fairy:', 'woman-fairy'),
(361, '🧛', ':vampire:', 'vampire'),
(362, '🧛‍♂️', ':man-vampire:', 'man-vampire'),
(363, '🧛‍♀️', ':woman-vampire:', 'woman-vampire'),
(364, '🧜', ':merperson:', 'merperson'),
(365, '🧜‍♂️', ':merman:', 'merman'),
(366, '🧜‍♀️', ':mermaid:', 'mermaid'),
(367, '🧝', ':elf:', 'elf'),
(368, '🧝‍♂️', ':man-elf:', 'man-elf'),
(369, '🧝‍♀️', ':woman-elf:', 'woman-elf'),
(370, '🧞', ':genie:', 'genie'),
(371, '🧞‍♂️', ':man-genie:', 'man-genie'),
(372, '🧞‍♀️', ':woman-genie:', 'woman-genie'),
(373, '🧟', ':zombie:', 'zombie'),
(374, '🧟‍♂️', ':man-zombie:', 'man-zombie'),
(375, '🧟‍♀️', ':woman-zombie:', 'woman-zombie'),
(376, '💆', ':person-getting-massage:', 'person-getting-massage'),
(377, '💆‍♂️', ':man-getting-massage:', 'man-getting-massage'),
(378, '💆‍♀️', ':woman-getting-massage:', 'woman-getting-massage'),
(379, '💇', ':person-getting-haircut:', 'person-getting-haircut'),
(380, '💇‍♂️', ':man-getting-haircut:', 'man-getting-haircut'),
(381, '💇‍♀️', ':woman-getting-haircut:', 'woman-getting-haircut'),
(382, '🚶', ':person-walking:', 'person-walking'),
(383, '🚶‍♂️', ':man-walking:', 'man-walking'),
(384, '🚶‍♀️', ':woman-walking:', 'woman-walking'),
(385, '🧍', ':person-standing:', 'person-standing'),
(386, '🧍‍♂️', ':man-standing:', 'man-standing'),
(387, '🧍‍♀️', ':woman-standing:', 'woman-standing'),
(388, '🧎', ':person-kneeling:', 'person-kneeling'),
(389, '🧎‍♂️', ':man-kneeling:', 'man-kneeling'),
(390, '🧎‍♀️', ':woman-kneeling:', 'woman-kneeling'),
(391, '🧑‍🦯', ':person-with-white-cane:', 'person-with-white-cane'),
(392, '👨‍🦯', ':man-with-white-cane:', 'man-with-white-cane'),
(393, '👩‍🦯', ':woman-with-white-cane:', 'woman-with-white-cane'),
(394, '🧑‍🦼', ':person-in-motorized-wheelchair:', 'person-in-motorized-wheelchair'),
(395, '👨‍🦼', ':man-in-motorized-wheelchair:', 'man-in-motorized-wheelchair'),
(396, '👩‍🦼', ':woman-in-motorized-wheelchair:', 'woman-in-motorized-wheelchair'),
(397, '🧑‍🦽', ':person-in-manual-wheelchair:', 'person-in-manual-wheelchair'),
(398, '👨‍🦽', ':man-in-manual-wheelchair:', 'man-in-manual-wheelchair'),
(399, '👩‍🦽', ':woman-in-manual-wheelchair:', 'woman-in-manual-wheelchair'),
(400, '🏃', ':person-running:', 'person-running'),
(401, '🏃‍♂️', ':man-running:', 'man-running'),
(402, '🏃‍♀️', ':woman-running:', 'woman-running'),
(403, '💃', ':woman-dancing:', 'woman-dancing'),
(404, '🕺', ':man-dancing:', 'man-dancing'),
(405, '🕴️', ':person-in-suit-levitating:', 'person-in-suit-levitating'),
(406, '👯', ':people-with-bunny-ears:', 'people-with-bunny-ears'),
(407, '👯‍♂️', ':men-with-bunny-ears:', 'men-with-bunny-ears'),
(408, '👯‍♀️', ':women-with-bunny-ears:', 'women-with-bunny-ears'),
(409, '🧖', ':person-in-steamy-room:', 'person-in-steamy-room'),
(410, '🧖‍♂️', ':man-in-steamy-room:', 'man-in-steamy-room'),
(411, '🧖‍♀️', ':woman-in-steamy-room:', 'woman-in-steamy-room'),
(412, '🧗', ':person-climbing:', 'person-climbing'),
(413, '🧗‍♂️', ':man-climbing:', 'man-climbing'),
(414, '🧗‍♀️', ':woman-climbing:', 'woman-climbing'),
(415, '🤺', ':person-fencing:', 'person-fencing'),
(416, '🏇', ':horse-racing:', 'horse-racing'),
(417, '⛷️', ':skier:', 'skier'),
(418, '🏂', ':snowboarder:', 'snowboarder'),
(419, '🏌️', ':person-golfing:', 'person-golfing'),
(420, '🏌️‍♂️', ':man-golfing:', 'man-golfing'),
(421, '🏌️‍♀️', ':woman-golfing:', 'woman-golfing'),
(422, '🏄', ':person-surfing:', 'person-surfing'),
(423, '🏄‍♂️', ':man-surfing:', 'man-surfing'),
(424, '🏄‍♀️', ':woman-surfing:', 'woman-surfing'),
(425, '🚣', ':person-rowing-boat:', 'person-rowing-boat'),
(426, '🚣‍♂️', ':man-rowing-boat:', 'man-rowing-boat'),
(427, '🚣‍♀️', ':woman-rowing-boat:', 'woman-rowing-boat'),
(428, '🏊', ':person-swimming:', 'person-swimming'),
(429, '🏊‍♂️', ':man-swimming:', 'man-swimming'),
(430, '🏊‍♀️', ':woman-swimming:', 'woman-swimming'),
(431, '⛹️', ':person-bouncing-ball:', 'person-bouncing-ball'),
(432, '⛹️‍♂️', ':man-bouncing-ball:', 'man-bouncing-ball'),
(433, '⛹️‍♀️', ':woman-bouncing-ball:', 'woman-bouncing-ball'),
(434, '🏋️', ':person-lifting-weights:', 'person-lifting-weights'),
(435, '🏋️‍♂️', ':man-lifting-weights:', 'man-lifting-weights'),
(436, '🏋️‍♀️', ':woman-lifting-weights:', 'woman-lifting-weights'),
(437, '🚴', ':person-biking:', 'person-biking'),
(438, '🚴‍♂️', ':man-biking:', 'man-biking'),
(439, '🚴‍♀️', ':woman-biking:', 'woman-biking'),
(440, '🚵', ':person-mountain-biking:', 'person-mountain-biking'),
(441, '🚵‍♂️', ':man-mountain-biking:', 'man-mountain-biking'),
(442, '🚵‍♀️', ':woman-mountain-biking:', 'woman-mountain-biking'),
(443, '🤸', ':person-cartwheeling:', 'person-cartwheeling'),
(444, '🤸‍♂️', ':man-cartwheeling:', 'man-cartwheeling'),
(445, '🤸‍♀️', ':woman-cartwheeling:', 'woman-cartwheeling'),
(446, '🤼', ':people-wrestling:', 'people-wrestling'),
(447, '🤼‍♂️', ':men-wrestling:', 'men-wrestling'),
(448, '🤼‍♀️', ':women-wrestling:', 'women-wrestling'),
(449, '🤽', ':person-playing-water-polo:', 'person-playing-water-polo'),
(450, '🤽‍♂️', ':man-playing-water-polo:', 'man-playing-water-polo'),
(451, '🤽‍♀️', ':woman-playing-water-polo:', 'woman-playing-water-polo'),
(452, '🤾', ':person-playing-handball:', 'person-playing-handball'),
(453, '🤾‍♂️', ':man-playing-handball:', 'man-playing-handball'),
(454, '🤾‍♀️', ':woman-playing-handball:', 'woman-playing-handball'),
(455, '🤹', ':person-juggling:', 'person-juggling'),
(456, '🤹‍♂️', ':man-juggling:', 'man-juggling'),
(457, '🤹‍♀️', ':woman-juggling:', 'woman-juggling'),
(458, '🧘', ':person-in-lotus-position:', 'person-in-lotus-position'),
(459, '🧘‍♂️', ':man-in-lotus-position:', 'man-in-lotus-position'),
(460, '🧘‍♀️', ':woman-in-lotus-position:', 'woman-in-lotus-position'),
(461, '🛀', ':person-taking-bath:', 'person-taking-bath'),
(462, '🛌', ':person-in-bed:', 'person-in-bed'),
(463, '🧑‍🤝‍🧑', ':people-holding-hands:', 'people-holding-hands'),
(464, '👭', ':women-holding-hands:', 'women-holding-hands'),
(465, '👫', ':woman-and-man-holding-hands:', 'woman-and-man-holding-hands'),
(466, '👬', ':men-holding-hands:', 'men-holding-hands'),
(467, '💏', ':kiss:', 'kiss'),
(468, '👩‍❤️‍💋‍👨', ':kiss-woman-man:', 'kiss-woman-man'),
(469, '👨‍❤️‍💋‍👨', ':kiss-man-man:', 'kiss-man-man'),
(470, '👩‍❤️‍💋‍👩', ':kiss-woman-woman:', 'kiss-woman-woman'),
(471, '💑', ':couple-with-heart:', 'couple-with-heart'),
(472, '👩‍❤️‍👨', ':couple-with-heart-woman-man:', 'couple-with-heart-woman-man'),
(473, '👨‍❤️‍👨', ':couple-with-heart-man-man:', 'couple-with-heart-man-man'),
(474, '👩‍❤️‍👩', ':couple-with-heart-woman-woman:', 'couple-with-heart-woman-woman'),
(475, '👪', ':family:', 'family'),
(476, '👨‍👩‍👦', ':family-man-woman-boy:', 'family-man-woman-boy'),
(477, '👨‍👩‍👧', ':family-man-woman-girl:', 'family-man-woman-girl'),
(478, '👨‍👩‍👧‍👦', ':family-man-woman-girl-boy:', 'family-man-woman-girl-boy'),
(479, '👨‍👩‍👦‍👦', ':family-man-woman-boy-boy:', 'family-man-woman-boy-boy'),
(480, '👨‍👩‍👧‍👧', ':family-man-woman-girl-girl:', 'family-man-woman-girl-girl'),
(481, '👨‍👨‍👦', ':family-man-man-boy:', 'family-man-man-boy'),
(482, '👨‍👨‍👧', ':family-man-man-girl:', 'family-man-man-girl'),
(483, '👨‍👨‍👧‍👦', ':family-man-man-girl-boy:', 'family-man-man-girl-boy'),
(484, '👨‍👨‍👦‍👦', ':family-man-man-boy-boy:', 'family-man-man-boy-boy'),
(485, '👨‍👨‍👧‍👧', ':family-man-man-girl-girl:', 'family-man-man-girl-girl'),
(486, '👩‍👩‍👦', ':family-woman-woman-boy:', 'family-woman-woman-boy'),
(487, '👩‍👩‍👧', ':family-woman-woman-girl:', 'family-woman-woman-girl'),
(488, '👩‍👩‍👧‍👦', ':family-woman-woman-girl-boy:', 'family-woman-woman-girl-boy'),
(489, '👩‍👩‍👦‍👦', ':family-woman-woman-boy-boy:', 'family-woman-woman-boy-boy'),
(490, '👩‍👩‍👧‍👧', ':family-woman-woman-girl-girl:', 'family-woman-woman-girl-girl'),
(491, '👨‍👦', ':family-man-boy:', 'family-man-boy'),
(492, '👨‍👦‍👦', ':family-man-boy-boy:', 'family-man-boy-boy'),
(493, '👨‍👧', ':family-man-girl:', 'family-man-girl'),
(494, '👨‍👧‍👦', ':family-man-girl-boy:', 'family-man-girl-boy'),
(495, '👨‍👧‍👧', ':family-man-girl-girl:', 'family-man-girl-girl'),
(496, '👩‍👦', ':family-woman-boy:', 'family-woman-boy'),
(497, '👩‍👦‍👦', ':family-woman-boy-boy:', 'family-woman-boy-boy'),
(498, '👩‍👧', ':family-woman-girl:', 'family-woman-girl'),
(499, '👩‍👧‍👦', ':family-woman-girl-boy:', 'family-woman-girl-boy'),
(500, '👩‍👧‍👧', ':family-woman-girl-girl:', 'family-woman-girl-girl'),
(501, '🗣️', ':speaking-head:', 'speaking-head'),
(502, '👤', ':bust-in-silhouette:', 'bust-in-silhouette'),
(503, '👥', ':busts-in-silhouette:', 'busts-in-silhouette'),
(504, '🫂', ':people-hugging:', 'people-hugging'),
(505, '👣', ':footprints:', 'footprints'),
(506, '🦰', ':red-hair:', 'red-hair'),
(507, '🦱', ':curly-hair:', 'curly-hair'),
(508, '🦳', ':white-hair:', 'white-hair'),
(509, '🦲', ':bald:', 'bald'),
(510, '🐵', ':monkey-face:', 'monkey-face'),
(511, '🐒', ':monkey:', 'monkey'),
(512, '🦍', ':gorilla:', 'gorilla'),
(513, '🦧', ':orangutan:', 'orangutan'),
(514, '🐶', ':dog-face:', 'dog-face'),
(515, '🐕', ':dog:', 'dog'),
(516, '🦮', ':guide-dog:', 'guide-dog'),
(517, '🐕‍🦺', ':service-dog:', 'service-dog'),
(518, '🐩', ':poodle:', 'poodle'),
(519, '🐺', ':wolf:', 'wolf'),
(520, '🦊', ':fox:', 'fox'),
(521, '🦝', ':raccoon:', 'raccoon'),
(522, '🐱', ':cat-face:', 'cat-face'),
(523, '🐈', ':cat:', 'cat'),
(524, '🐈‍⬛', ':black-cat:', 'black-cat'),
(525, '🦁', ':lion:', 'lion'),
(526, '🐯', ':tiger-face:', 'tiger-face'),
(527, '🐅', ':tiger:', 'tiger'),
(528, '🐆', ':leopard:', 'leopard'),
(529, '🐴', ':horse-face:', 'horse-face'),
(530, '🐎', ':horse:', 'horse'),
(531, '🦄', ':unicorn:', 'unicorn'),
(532, '🦓', ':zebra:', 'zebra'),
(533, '🦌', ':deer:', 'deer'),
(534, '🦬', ':bison:', 'bison'),
(535, '🐮', ':cow-face:', 'cow-face'),
(536, '🐂', ':ox:', 'ox'),
(537, '🐃', ':water-buffalo:', 'water-buffalo'),
(538, '🐄', ':cow:', 'cow'),
(539, '🐷', ':pig-face:', 'pig-face'),
(540, '🐖', ':pig:', 'pig'),
(541, '🐗', ':boar:', 'boar'),
(542, '🐽', ':pig-nose:', 'pig-nose'),
(543, '🐏', ':ram:', 'ram'),
(544, '🐑', ':ewe:', 'ewe'),
(545, '🐐', ':goat:', 'goat'),
(546, '🐪', ':camel:', 'camel'),
(547, '🐫', ':two-hump-camel:', 'two-hump-camel'),
(548, '🦙', ':llama:', 'llama'),
(549, '🦒', ':giraffe:', 'giraffe'),
(550, '🐘', ':elephant:', 'elephant'),
(551, '🦣', ':mammoth:', 'mammoth'),
(552, '🦏', ':rhinoceros:', 'rhinoceros'),
(553, '🦛', ':hippopotamus:', 'hippopotamus'),
(554, '🐭', ':mouse-face:', 'mouse-face'),
(555, '🐁', ':mouse:', 'mouse'),
(556, '🐀', ':rat:', 'rat'),
(557, '🐹', ':hamster:', 'hamster'),
(558, '🐰', ':rabbit-face:', 'rabbit-face'),
(559, '🐇', ':rabbit:', 'rabbit'),
(560, '🐿️', ':chipmunk:', 'chipmunk'),
(561, '🦫', ':beaver:', 'beaver'),
(562, '🦔', ':hedgehog:', 'hedgehog'),
(563, '🦇', ':bat:', 'bat'),
(564, '🐻', ':bear:', 'bear'),
(565, '🐻‍❄️', ':polar-bear:', 'polar-bear'),
(566, '🐨', ':koala:', 'koala'),
(567, '🐼', ':panda:', 'panda'),
(568, '🦥', ':sloth:', 'sloth'),
(569, '🦦', ':otter:', 'otter'),
(570, '🦨', ':skunk:', 'skunk'),
(571, '🦘', ':kangaroo:', 'kangaroo'),
(572, '🦡', ':badger:', 'badger'),
(573, '🐾', ':paw-prints:', 'paw-prints'),
(574, '🦃', ':turkey:', 'turkey'),
(575, '🐔', ':chicken:', 'chicken'),
(576, '🐓', ':rooster:', 'rooster'),
(577, '🐣', ':hatching-chick:', 'hatching-chick'),
(578, '🐤', ':baby-chick:', 'baby-chick'),
(579, '🐥', ':front-facing-baby-chick:', 'front-facing-baby-chick'),
(580, '🐦', ':bird:', 'bird'),
(581, '🐧', ':penguin:', 'penguin'),
(582, '🕊️', ':dove:', 'dove'),
(583, '🦅', ':eagle:', 'eagle'),
(584, '🦆', ':duck:', 'duck'),
(585, '🦢', ':swan:', 'swan'),
(586, '🦉', ':owl:', 'owl'),
(587, '🦤', ':dodo:', 'dodo'),
(588, '🪶', ':feather:', 'feather'),
(589, '🦩', ':flamingo:', 'flamingo'),
(590, '🦚', ':peacock:', 'peacock'),
(591, '🦜', ':parrot:', 'parrot'),
(592, '🐸', ':frog:', 'frog'),
(593, '🐊', ':crocodile:', 'crocodile'),
(594, '🐢', ':turtle:', 'turtle'),
(595, '🦎', ':lizard:', 'lizard'),
(596, '🐍', ':snake:', 'snake'),
(597, '🐲', ':dragon-face:', 'dragon-face'),
(598, '🐉', ':dragon:', 'dragon'),
(599, '🦕', ':sauropod:', 'sauropod'),
(600, '🦖', ':t-rex:', 't-rex'),
(601, '🐳', ':spouting-whale:', 'spouting-whale'),
(602, '🐋', ':whale:', 'whale'),
(603, '🐬', ':dolphin:', 'dolphin'),
(604, '🦭', ':seal:', 'seal'),
(605, '🐟', ':fish:', 'fish'),
(606, '🐠', ':tropical-fish:', 'tropical-fish'),
(607, '🐡', ':blowfish:', 'blowfish'),
(608, '🦈', ':shark:', 'shark'),
(609, '🐙', ':octopus:', 'octopus'),
(610, '🐚', ':spiral-shell:', 'spiral-shell'),
(611, '🐌', ':snail:', 'snail'),
(612, '🦋', ':butterfly:', 'butterfly'),
(613, '🐛', ':bug:', 'bug'),
(614, '🐜', ':ant:', 'ant'),
(615, '🐝', ':honeybee:', 'honeybee'),
(616, '🪲', ':beetle:', 'beetle'),
(617, '🐞', ':lady-beetle:', 'lady-beetle'),
(618, '🦗', ':cricket:', 'cricket'),
(619, '🪳', ':cockroach:', 'cockroach'),
(620, '🕷️', ':spider:', 'spider'),
(621, '🕸️', ':spider-web:', 'spider-web'),
(622, '🦂', ':scorpion:', 'scorpion'),
(623, '🦟', ':mosquito:', 'mosquito'),
(624, '🪰', ':fly:', 'fly'),
(625, '🪱', ':worm:', 'worm'),
(626, '🦠', ':microbe:', 'microbe'),
(627, '💐', ':bouquet:', 'bouquet'),
(628, '🌸', ':cherry-blossom:', 'cherry-blossom'),
(629, '💮', ':white-flower:', 'white-flower'),
(630, '🏵️', ':rosette:', 'rosette'),
(631, '🌹', ':rose:', 'rose'),
(632, '🥀', ':wilted-flower:', 'wilted-flower'),
(633, '🌺', ':hibiscus:', 'hibiscus'),
(634, '🌻', ':sunflower:', 'sunflower'),
(635, '🌼', ':blossom:', 'blossom'),
(636, '🌷', ':tulip:', 'tulip'),
(637, '🌱', ':seedling:', 'seedling'),
(638, '🪴', ':potted-plant:', 'potted-plant'),
(639, '🌲', ':evergreen-tree:', 'evergreen-tree'),
(640, '🌳', ':deciduous-tree:', 'deciduous-tree'),
(641, '🌴', ':palm-tree:', 'palm-tree'),
(642, '🌵', ':cactus:', 'cactus'),
(643, '🌾', ':sheaf-of-rice:', 'sheaf-of-rice'),
(644, '🌿', ':herb:', 'herb'),
(645, '☘️', ':shamrock:', 'shamrock'),
(646, '🍀', ':four-leaf-clover:', 'four-leaf-clover'),
(647, '🍁', ':maple-leaf:', 'maple-leaf'),
(648, '🍂', ':fallen-leaf:', 'fallen-leaf'),
(649, '🍃', ':leaf-fluttering-in-wind:', 'leaf-fluttering-in-wind'),
(650, '🍇', ':grapes:', 'grapes'),
(651, '🍈', ':melon:', 'melon'),
(652, '🍉', ':watermelon:', 'watermelon'),
(653, '🍊', ':tangerine:', 'tangerine'),
(654, '🍋', ':lemon:', 'lemon'),
(655, '🍌', ':banana:', 'banana'),
(656, '🍍', ':pineapple:', 'pineapple'),
(657, '🥭', ':mango:', 'mango'),
(658, '🍎', ':red-apple:', 'red-apple'),
(659, '🍏', ':green-apple:', 'green-apple'),
(660, '🍐', ':pear:', 'pear'),
(661, '🍑', ':peach:', 'peach'),
(662, '🍒', ':cherries:', 'cherries'),
(663, '🍓', ':strawberry:', 'strawberry'),
(664, '🫐', ':blueberries:', 'blueberries'),
(665, '🥝', ':kiwi-fruit:', 'kiwi-fruit'),
(666, '🍅', ':tomato:', 'tomato'),
(667, '🫒', ':olive:', 'olive'),
(668, '🥥', ':coconut:', 'coconut'),
(669, '🥑', ':avocado:', 'avocado'),
(670, '🍆', ':eggplant:', 'eggplant'),
(671, '🥔', ':potato:', 'potato'),
(672, '🥕', ':carrot:', 'carrot'),
(673, '🌽', ':ear-of-corn:', 'ear-of-corn'),
(674, '🌶️', ':hot-pepper:', 'hot-pepper'),
(675, '🫑', ':bell-pepper:', 'bell-pepper'),
(676, '🥒', ':cucumber:', 'cucumber'),
(677, '🥬', ':leafy-green:', 'leafy-green'),
(678, '🥦', ':broccoli:', 'broccoli'),
(679, '🧄', ':garlic:', 'garlic'),
(680, '🧅', ':onion:', 'onion'),
(681, '🍄', ':mushroom:', 'mushroom'),
(682, '🥜', ':peanuts:', 'peanuts'),
(683, '🌰', ':chestnut:', 'chestnut'),
(684, '🍞', ':bread:', 'bread'),
(685, '🥐', ':croissant:', 'croissant'),
(686, '🥖', ':baguette-bread:', 'baguette-bread'),
(687, '🫓', ':flatbread:', 'flatbread'),
(688, '🥨', ':pretzel:', 'pretzel'),
(689, '🥯', ':bagel:', 'bagel'),
(690, '🥞', ':pancakes:', 'pancakes'),
(691, '🧇', ':waffle:', 'waffle'),
(692, '🧀', ':cheese-wedge:', 'cheese-wedge'),
(693, '🍖', ':meat-on-bone:', 'meat-on-bone'),
(694, '🍗', ':poultry-leg:', 'poultry-leg'),
(695, '🥩', ':cut-of-meat:', 'cut-of-meat'),
(696, '🥓', ':bacon:', 'bacon'),
(697, '🍔', ':hamburger:', 'hamburger'),
(698, '🍟', ':french-fries:', 'french-fries'),
(699, '🍕', ':pizza:', 'pizza'),
(700, '🌭', ':hot-dog:', 'hot-dog'),
(701, '🥪', ':sandwich:', 'sandwich'),
(702, '🌮', ':taco:', 'taco'),
(703, '🌯', ':burrito:', 'burrito'),
(704, '🫔', ':tamale:', 'tamale'),
(705, '🥙', ':stuffed-flatbread:', 'stuffed-flatbread'),
(706, '🧆', ':falafel:', 'falafel'),
(707, '🥚', ':egg:', 'egg'),
(708, '🍳', ':cooking:', 'cooking'),
(709, '🥘', ':shallow-pan-of-food:', 'shallow-pan-of-food'),
(710, '🍲', ':pot-of-food:', 'pot-of-food'),
(711, '🫕', ':fondue:', 'fondue'),
(712, '🥣', ':bowl-with-spoon:', 'bowl-with-spoon'),
(713, '🥗', ':green-salad:', 'green-salad'),
(714, '🍿', ':popcorn:', 'popcorn'),
(715, '🧈', ':butter:', 'butter'),
(716, '🧂', ':salt:', 'salt'),
(717, '🥫', ':canned-food:', 'canned-food'),
(718, '🍱', ':bento-box:', 'bento-box'),
(719, '🍘', ':rice-cracker:', 'rice-cracker'),
(720, '🍙', ':rice-ball:', 'rice-ball'),
(721, '🍚', ':cooked-rice:', 'cooked-rice'),
(722, '🍛', ':curry-rice:', 'curry-rice'),
(723, '🍜', ':steaming-bowl:', 'steaming-bowl'),
(724, '🍝', ':spaghetti:', 'spaghetti'),
(725, '🍠', ':roasted-sweet-potato:', 'roasted-sweet-potato'),
(726, '🍢', ':oden:', 'oden'),
(727, '🍣', ':sushi:', 'sushi'),
(728, '🍤', ':fried-shrimp:', 'fried-shrimp'),
(729, '🍥', ':fish-cake-with-swirl:', 'fish-cake-with-swirl'),
(730, '🥮', ':moon-cake:', 'moon-cake'),
(731, '🍡', ':dango:', 'dango'),
(732, '🥟', ':dumpling:', 'dumpling'),
(733, '🥠', ':fortune-cookie:', 'fortune-cookie'),
(734, '🥡', ':takeout-box:', 'takeout-box'),
(735, '🦀', ':crab:', 'crab'),
(736, '🦞', ':lobster:', 'lobster'),
(737, '🦐', ':shrimp:', 'shrimp'),
(738, '🦑', ':squid:', 'squid'),
(739, '🦪', ':oyster:', 'oyster'),
(740, '🍦', ':soft-ice-cream:', 'soft-ice-cream'),
(741, '🍧', ':shaved-ice:', 'shaved-ice'),
(742, '🍨', ':ice-cream:', 'ice-cream'),
(743, '🍩', ':doughnut:', 'doughnut'),
(744, '🍪', ':cookie:', 'cookie'),
(745, '🎂', ':birthday-cake:', 'birthday-cake'),
(746, '🍰', ':shortcake:', 'shortcake'),
(747, '🧁', ':cupcake:', 'cupcake'),
(748, '🥧', ':pie:', 'pie'),
(749, '🍫', ':chocolate-bar:', 'chocolate-bar'),
(750, '🍬', ':candy:', 'candy'),
(751, '🍭', ':lollipop:', 'lollipop'),
(752, '🍮', ':custard:', 'custard'),
(753, '🍯', ':honey-pot:', 'honey-pot'),
(754, '🍼', ':baby-bottle:', 'baby-bottle'),
(755, '🥛', ':glass-of-milk:', 'glass-of-milk'),
(756, '☕', ':hot-beverage:', 'hot-beverage'),
(757, '🫖', ':teapot:', 'teapot'),
(758, '🍵', ':teacup-without-handle:', 'teacup-without-handle'),
(759, '🍶', ':sake:', 'sake'),
(760, '🍾', ':bottle-with-popping-cork:', 'bottle-with-popping-cork'),
(761, '🍷', ':wine-glass:', 'wine-glass'),
(762, '🍸', ':cocktail-glass:', 'cocktail-glass'),
(763, '🍹', ':tropical-drink:', 'tropical-drink'),
(764, '🍺', ':beer-mug:', 'beer-mug'),
(765, '🍻', ':clinking-beer-mugs:', 'clinking-beer-mugs'),
(766, '🥂', ':clinking-glasses:', 'clinking-glasses'),
(767, '🥃', ':tumbler-glass:', 'tumbler-glass'),
(768, '🥤', ':cup-with-straw:', 'cup-with-straw'),
(769, '🧋', ':bubble-tea:', 'bubble-tea'),
(770, '🧃', ':beverage-box:', 'beverage-box'),
(771, '🧉', ':mate:', 'mate'),
(772, '🧊', ':ice:', 'ice'),
(773, '🥢', ':chopsticks:', 'chopsticks'),
(774, '🍽️', ':fork-and-knife-with-plate:', 'fork-and-knife-with-plate'),
(775, '🍴', ':fork-and-knife:', 'fork-and-knife'),
(776, '🥄', ':spoon:', 'spoon'),
(777, '🔪', ':kitchen-knife:', 'kitchen-knife'),
(778, '🏺', ':amphora:', 'amphora'),
(779, '🌍', ':globe-showing-europe-africa:', 'globe-showing-europe-africa'),
(780, '🌎', ':globe-showing-americas:', 'globe-showing-americas'),
(781, '🌏', ':globe-showing-asia-australia:', 'globe-showing-asia-australia'),
(782, '🌐', ':globe-with-meridians:', 'globe-with-meridians'),
(783, '🗺️', ':world-map:', 'world-map'),
(784, '🗾', ':map-of-japan:', 'map-of-japan'),
(785, '🧭', ':compass:', 'compass'),
(786, '🏔️', ':snow-capped-mountain:', 'snow-capped-mountain'),
(787, '⛰️', ':mountain:', 'mountain'),
(788, '🌋', ':volcano:', 'volcano'),
(789, '🗻', ':mount-fuji:', 'mount-fuji'),
(790, '🏕️', ':camping:', 'camping'),
(791, '🏖️', ':beach-with-umbrella:', 'beach-with-umbrella'),
(792, '🏜️', ':desert:', 'desert'),
(793, '🏝️', ':desert-island:', 'desert-island'),
(794, '🏞️', ':national-park:', 'national-park'),
(795, '🏟️', ':stadium:', 'stadium'),
(796, '🏛️', ':classical-building:', 'classical-building'),
(797, '🏗️', ':building-construction:', 'building-construction'),
(798, '🧱', ':brick:', 'brick'),
(799, '🪨', ':rock:', 'rock'),
(800, '🪵', ':wood:', 'wood'),
(801, '🛖', ':hut:', 'hut'),
(802, '🏘️', ':houses:', 'houses'),
(803, '🏚️', ':derelict-house:', 'derelict-house'),
(804, '🏠', ':house:', 'house'),
(805, '🏡', ':house-with-garden:', 'house-with-garden'),
(806, '🏢', ':office-building:', 'office-building'),
(807, '🏣', ':japanese-post-office:', 'japanese-post-office'),
(808, '🏤', ':post-office:', 'post-office'),
(809, '🏥', ':hospital:', 'hospital'),
(810, '🏦', ':bank:', 'bank'),
(811, '🏨', ':hotel:', 'hotel'),
(812, '🏩', ':love-hotel:', 'love-hotel'),
(813, '🏪', ':convenience-store:', 'convenience-store'),
(814, '🏫', ':school:', 'school'),
(815, '🏬', ':department-store:', 'department-store'),
(816, '🏭', ':factory:', 'factory'),
(817, '🏯', ':japanese-castle:', 'japanese-castle'),
(818, '🏰', ':castle:', 'castle'),
(819, '💒', ':wedding:', 'wedding'),
(820, '🗼', ':tokyo-tower:', 'tokyo-tower'),
(821, '🗽', ':statue-of-liberty:', 'statue-of-liberty'),
(822, '⛪', ':church:', 'church'),
(823, '🕌', ':mosque:', 'mosque'),
(824, '🛕', ':hindu-temple:', 'hindu-temple'),
(825, '🕍', ':synagogue:', 'synagogue'),
(826, '⛩️', ':shinto-shrine:', 'shinto-shrine'),
(827, '🕋', ':kaaba:', 'kaaba'),
(828, '⛲', ':fountain:', 'fountain'),
(829, '⛺', ':tent:', 'tent'),
(830, '🌁', ':foggy:', 'foggy'),
(831, '🌃', ':night-with-stars:', 'night-with-stars'),
(832, '🏙️', ':cityscape:', 'cityscape'),
(833, '🌄', ':sunrise-over-mountains:', 'sunrise-over-mountains'),
(834, '🌅', ':sunrise:', 'sunrise'),
(835, '🌆', ':cityscape-at-dusk:', 'cityscape-at-dusk'),
(836, '🌇', ':sunset:', 'sunset'),
(837, '🌉', ':bridge-at-night:', 'bridge-at-night'),
(838, '♨️', ':hot-springs:', 'hot-springs'),
(839, '🎠', ':carousel-horse:', 'carousel-horse'),
(840, '🎡', ':ferris-wheel:', 'ferris-wheel'),
(841, '🎢', ':roller-coaster:', 'roller-coaster'),
(842, '💈', ':barber-pole:', 'barber-pole'),
(843, '🎪', ':circus-tent:', 'circus-tent'),
(844, '🚂', ':locomotive:', 'locomotive'),
(845, '🚃', ':railway-car:', 'railway-car'),
(846, '🚄', ':high-speed-train:', 'high-speed-train'),
(847, '🚅', ':bullet-train:', 'bullet-train'),
(848, '🚆', ':train:', 'train'),
(849, '🚇', ':metro:', 'metro'),
(850, '🚈', ':light-rail:', 'light-rail'),
(851, '🚉', ':station:', 'station'),
(852, '🚊', ':tram:', 'tram'),
(853, '🚝', ':monorail:', 'monorail'),
(854, '🚞', ':mountain-railway:', 'mountain-railway'),
(855, '🚋', ':tram-car:', 'tram-car'),
(856, '🚌', ':bus:', 'bus'),
(857, '🚍', ':oncoming-bus:', 'oncoming-bus'),
(858, '🚎', ':trolleybus:', 'trolleybus'),
(859, '🚐', ':minibus:', 'minibus'),
(860, '🚑', ':ambulance:', 'ambulance'),
(861, '🚒', ':fire-engine:', 'fire-engine'),
(862, '🚓', ':police-car:', 'police-car'),
(863, '🚔', ':oncoming-police-car:', 'oncoming-police-car'),
(864, '🚕', ':taxi:', 'taxi'),
(865, '🚖', ':oncoming-taxi:', 'oncoming-taxi'),
(866, '🚗', ':automobile:', 'automobile'),
(867, '🚘', ':oncoming-automobile:', 'oncoming-automobile'),
(868, '🚙', ':sport-utility-vehicle:', 'sport-utility-vehicle'),
(869, '🛻', ':pickup-truck:', 'pickup-truck'),
(870, '🚚', ':delivery-truck:', 'delivery-truck'),
(871, '🚛', ':articulated-lorry:', 'articulated-lorry'),
(872, '🚜', ':tractor:', 'tractor'),
(873, '🏎️', ':racing-car:', 'racing-car'),
(874, '🏍️', ':motorcycle:', 'motorcycle'),
(875, '🛵', ':motor-scooter:', 'motor-scooter'),
(876, '🦽', ':manual-wheelchair:', 'manual-wheelchair'),
(877, '🦼', ':motorized-wheelchair:', 'motorized-wheelchair'),
(878, '🛺', ':auto-rickshaw:', 'auto-rickshaw'),
(879, '🚲', ':bicycle:', 'bicycle'),
(880, '🛴', ':kick-scooter:', 'kick-scooter'),
(881, '🛹', ':skateboard:', 'skateboard'),
(882, '🛼', ':roller-skate:', 'roller-skate'),
(883, '🚏', ':bus-stop:', 'bus-stop'),
(884, '🛣️', ':motorway:', 'motorway'),
(885, '🛤️', ':railway-track:', 'railway-track'),
(886, '🛢️', ':oil-drum:', 'oil-drum'),
(887, '⛽', ':fuel-pump:', 'fuel-pump'),
(888, '🚨', ':police-car-light:', 'police-car-light'),
(889, '🚥', ':horizontal-traffic-light:', 'horizontal-traffic-light'),
(890, '🚦', ':vertical-traffic-light:', 'vertical-traffic-light'),
(891, '🛑', ':stop-sign:', 'stop-sign'),
(892, '🚧', ':construction:', 'construction'),
(893, '⚓', ':anchor:', 'anchor'),
(894, '⛵', ':sailboat:', 'sailboat'),
(895, '🛶', ':canoe:', 'canoe'),
(896, '🚤', ':speedboat:', 'speedboat'),
(897, '🛳️', ':passenger-ship:', 'passenger-ship'),
(898, '⛴️', ':ferry:', 'ferry'),
(899, '🛥️', ':motor-boat:', 'motor-boat'),
(900, '🚢', ':ship:', 'ship'),
(901, '✈️', ':airplane:', 'airplane'),
(902, '🛩️', ':small-airplane:', 'small-airplane'),
(903, '🛫', ':airplane-departure:', 'airplane-departure'),
(904, '🛬', ':airplane-arrival:', 'airplane-arrival'),
(905, '🪂', ':parachute:', 'parachute'),
(906, '💺', ':seat:', 'seat'),
(907, '🚁', ':helicopter:', 'helicopter'),
(908, '🚟', ':suspension-railway:', 'suspension-railway'),
(909, '🚠', ':mountain-cableway:', 'mountain-cableway'),
(910, '🚡', ':aerial-tramway:', 'aerial-tramway'),
(911, '🛰️', ':satellite:', 'satellite'),
(912, '🚀', ':rocket:', 'rocket'),
(913, '🛸', ':flying-saucer:', 'flying-saucer'),
(914, '🛎️', ':bellhop-bell:', 'bellhop-bell'),
(915, '🧳', ':luggage:', 'luggage'),
(916, '⌛', ':hourglass-done:', 'hourglass-done'),
(917, '⏳', ':hourglass-not-done:', 'hourglass-not-done'),
(918, '⌚', ':watch:', 'watch'),
(919, '⏰', ':alarm-clock:', 'alarm-clock'),
(920, '⏱️', ':stopwatch:', 'stopwatch'),
(921, '⏲️', ':timer-clock:', 'timer-clock'),
(922, '🕰️', ':mantelpiece-clock:', 'mantelpiece-clock'),
(923, '🕛', ':twelve-o-clock:', 'twelve-o-clock'),
(924, '🕧', ':twelve-thirty:', 'twelve-thirty'),
(925, '🕐', ':one-o-clock:', 'one-o-clock'),
(926, '🕜', ':one-thirty:', 'one-thirty'),
(927, '🕑', ':two-o-clock:', 'two-o-clock'),
(928, '🕝', ':two-thirty:', 'two-thirty'),
(929, '🕒', ':three-o-clock:', 'three-o-clock'),
(930, '🕞', ':three-thirty:', 'three-thirty'),
(931, '🕓', ':four-o-clock:', 'four-o-clock'),
(932, '🕟', ':four-thirty:', 'four-thirty'),
(933, '🕔', ':five-o-clock:', 'five-o-clock'),
(934, '🕠', ':five-thirty:', 'five-thirty'),
(935, '🕕', ':six-o-clock:', 'six-o-clock'),
(936, '🕡', ':six-thirty:', 'six-thirty'),
(937, '🕖', ':seven-o-clock:', 'seven-o-clock'),
(938, '🕢', ':seven-thirty:', 'seven-thirty'),
(939, '🕗', ':eight-o-clock:', 'eight-o-clock'),
(940, '🕣', ':eight-thirty:', 'eight-thirty'),
(941, '🕘', ':nine-o-clock:', 'nine-o-clock'),
(942, '🕤', ':nine-thirty:', 'nine-thirty'),
(943, '🕙', ':ten-o-clock:', 'ten-o-clock'),
(944, '🕥', ':ten-thirty:', 'ten-thirty'),
(945, '🕚', ':eleven-o-clock:', 'eleven-o-clock'),
(946, '🕦', ':eleven-thirty:', 'eleven-thirty'),
(947, '🌑', ':new-moon:', 'new-moon'),
(948, '🌒', ':waxing-crescent-moon:', 'waxing-crescent-moon'),
(949, '🌓', ':first-quarter-moon:', 'first-quarter-moon'),
(950, '🌔', ':waxing-gibbous-moon:', 'waxing-gibbous-moon'),
(951, '🌕', ':full-moon:', 'full-moon'),
(952, '🌖', ':waning-gibbous-moon:', 'waning-gibbous-moon'),
(953, '🌗', ':last-quarter-moon:', 'last-quarter-moon'),
(954, '🌘', ':waning-crescent-moon:', 'waning-crescent-moon'),
(955, '🌙', ':crescent-moon:', 'crescent-moon'),
(956, '🌚', ':new-moon-face:', 'new-moon-face'),
(957, '🌛', ':first-quarter-moon-face:', 'first-quarter-moon-face'),
(958, '🌜', ':last-quarter-moon-face:', 'last-quarter-moon-face'),
(959, '🌡️', ':thermometer:', 'thermometer'),
(960, '☀️', ':sun:', 'sun'),
(961, '🌝', ':full-moon-face:', 'full-moon-face'),
(962, '🌞', ':sun-with-face:', 'sun-with-face'),
(963, '🪐', ':ringed-planet:', 'ringed-planet'),
(964, '⭐', ':star:', 'star'),
(965, '🌟', ':glowing-star:', 'glowing-star'),
(966, '🌠', ':shooting-star:', 'shooting-star'),
(967, '🌌', ':milky-way:', 'milky-way'),
(968, '☁️', ':cloud:', 'cloud'),
(969, '⛅', ':sun-behind-cloud:', 'sun-behind-cloud'),
(970, '⛈️', ':cloud-with-lightning-and-rain:', 'cloud-with-lightning-and-rain'),
(971, '🌤️', ':sun-behind-small-cloud:', 'sun-behind-small-cloud'),
(972, '🌥️', ':sun-behind-large-cloud:', 'sun-behind-large-cloud'),
(973, '🌦️', ':sun-behind-rain-cloud:', 'sun-behind-rain-cloud'),
(974, '🌧️', ':cloud-with-rain:', 'cloud-with-rain'),
(975, '🌨️', ':cloud-with-snow:', 'cloud-with-snow'),
(976, '🌩️', ':cloud-with-lightning:', 'cloud-with-lightning'),
(977, '🌪️', ':tornado:', 'tornado'),
(978, '🌫️', ':fog:', 'fog'),
(979, '🌬️', ':wind-face:', 'wind-face'),
(980, '🌀', ':cyclone:', 'cyclone'),
(981, '🌈', ':rainbow:', 'rainbow'),
(982, '🌂', ':closed-umbrella:', 'closed-umbrella'),
(983, '☂️', ':umbrella:', 'umbrella'),
(984, '☔', ':umbrella-with-rain-drops:', 'umbrella-with-rain-drops'),
(985, '⛱️', ':umbrella-on-ground:', 'umbrella-on-ground'),
(986, '⚡', ':high-voltage:', 'high-voltage'),
(987, '❄️', ':snowflake:', 'snowflake'),
(988, '☃️', ':snowman:', 'snowman'),
(989, '⛄', ':snowman-without-snow:', 'snowman-without-snow'),
(990, '☄️', ':comet:', 'comet'),
(991, '🔥', ':fire:', 'fire'),
(992, '💧', ':droplet:', 'droplet'),
(993, '🌊', ':water-wave:', 'water-wave'),
(994, '🎃', ':jack-o-lantern:', 'jack-o-lantern'),
(995, '🎄', ':christmas-tree:', 'christmas-tree'),
(996, '🎆', ':fireworks:', 'fireworks'),
(997, '🎇', ':sparkler:', 'sparkler'),
(998, '🧨', ':firecracker:', 'firecracker'),
(999, '✨', ':sparkles:', 'sparkles'),
(1000, '🎈', ':balloon:', 'balloon'),
(1001, '🎉', ':party-popper:', 'party-popper'),
(1002, '🎊', ':confetti-ball:', 'confetti-ball'),
(1003, '🎋', ':tanabata-tree:', 'tanabata-tree'),
(1004, '🎍', ':pine-decoration:', 'pine-decoration'),
(1005, '🎎', ':japanese-dolls:', 'japanese-dolls'),
(1006, '🎏', ':carp-streamer:', 'carp-streamer'),
(1007, '🎐', ':wind-chime:', 'wind-chime'),
(1008, '🎑', ':moon-viewing-ceremony:', 'moon-viewing-ceremony'),
(1009, '🧧', ':red-envelope:', 'red-envelope'),
(1010, '🎀', ':ribbon:', 'ribbon'),
(1011, '🎁', ':wrapped-gift:', 'wrapped-gift'),
(1012, '🎗️', ':reminder-ribbon:', 'reminder-ribbon'),
(1013, '🎟️', ':admission-tickets:', 'admission-tickets'),
(1014, '🎫', ':ticket:', 'ticket'),
(1015, '🎖️', ':military-medal:', 'military-medal'),
(1016, '🏆', ':trophy:', 'trophy'),
(1017, '🏅', ':sports-medal:', 'sports-medal'),
(1018, '🥇', ':1st-place-medal:', '1st-place-medal'),
(1019, '🥈', ':2nd-place-medal:', '2nd-place-medal'),
(1020, '🥉', ':3rd-place-medal:', '3rd-place-medal'),
(1021, '⚽', ':soccer-ball:', 'soccer-ball'),
(1022, '⚾', ':baseball:', 'baseball'),
(1023, '🥎', ':softball:', 'softball'),
(1024, '🏀', ':basketball:', 'basketball'),
(1025, '🏐', ':volleyball:', 'volleyball'),
(1026, '🏈', ':american-football:', 'american-football'),
(1027, '🏉', ':rugby-football:', 'rugby-football'),
(1028, '🎾', ':tennis:', 'tennis'),
(1029, '🥏', ':flying-disc:', 'flying-disc'),
(1030, '🎳', ':bowling:', 'bowling'),
(1031, '🏏', ':cricket-game:', 'cricket-game'),
(1032, '🏑', ':field-hockey:', 'field-hockey'),
(1033, '🏒', ':ice-hockey:', 'ice-hockey'),
(1034, '🥍', ':lacrosse:', 'lacrosse'),
(1035, '🏓', ':ping-pong:', 'ping-pong'),
(1036, '🏸', ':badminton:', 'badminton'),
(1037, '🥊', ':boxing-glove:', 'boxing-glove'),
(1038, '🥋', ':martial-arts-uniform:', 'martial-arts-uniform'),
(1039, '🥅', ':goal-net:', 'goal-net'),
(1040, '⛳', ':flag-in-hole:', 'flag-in-hole'),
(1041, '⛸️', ':ice-skate:', 'ice-skate'),
(1042, '🎣', ':fishing-pole:', 'fishing-pole'),
(1043, '🤿', ':diving-mask:', 'diving-mask'),
(1044, '🎽', ':running-shirt:', 'running-shirt'),
(1045, '🎿', ':skis:', 'skis'),
(1046, '🛷', ':sled:', 'sled'),
(1047, '🥌', ':curling-stone:', 'curling-stone'),
(1048, '🎯', ':bullseye:', 'bullseye'),
(1049, '🪀', ':yo-yo:', 'yo-yo'),
(1050, '🪁', ':kite:', 'kite'),
(1051, '🎱', ':pool-8-ball:', 'pool-8-ball'),
(1052, '🔮', ':crystal-ball:', 'crystal-ball'),
(1053, '🪄', ':magic-wand:', 'magic-wand'),
(1054, '🧿', ':nazar-amulet:', 'nazar-amulet'),
(1055, '🎮', ':video-game:', 'video-game'),
(1056, '🕹️', ':joystick:', 'joystick'),
(1057, '🎰', ':slot-machine:', 'slot-machine'),
(1058, '🎲', ':game-die:', 'game-die'),
(1059, '🧩', ':puzzle-piece:', 'puzzle-piece'),
(1060, '🧸', ':teddy-bear:', 'teddy-bear'),
(1062, '🪆', ':nesting-dolls:', 'nesting-dolls'),
(1063, '♠️', ':spade-suit:', 'spade-suit'),
(1064, '♥️', ':heart-suit:', 'heart-suit'),
(1065, '♦️', ':diamond-suit:', 'diamond-suit'),
(1066, '♣️', ':club-suit:', 'club-suit'),
(1067, '♟️', ':chess-pawn:', 'chess-pawn'),
(1068, '🃏', ':joker:', 'joker'),
(1069, '🀄', ':mahjong-red-dragon:', 'mahjong-red-dragon'),
(1070, '🎴', ':flower-playing-cards:', 'flower-playing-cards'),
(1071, '🎭', ':performing-arts:', 'performing-arts'),
(1072, '🖼️', ':framed-picture:', 'framed-picture'),
(1073, '🎨', ':artist-palette:', 'artist-palette'),
(1074, '🧵', ':thread:', 'thread'),
(1075, '🪡', ':sewing-needle:', 'sewing-needle'),
(1076, '🧶', ':yarn:', 'yarn'),
(1077, '🪢', ':knot:', 'knot'),
(1078, '👓', ':glasses:', 'glasses'),
(1079, '🕶️', ':sunglasses:', 'sunglasses'),
(1080, '🥽', ':goggles:', 'goggles'),
(1081, '🥼', ':lab-coat:', 'lab-coat'),
(1082, '🦺', ':safety-vest:', 'safety-vest'),
(1083, '👔', ':necktie:', 'necktie'),
(1084, '👕', ':t-shirt:', 't-shirt'),
(1085, '👖', ':jeans:', 'jeans'),
(1086, '🧣', ':scarf:', 'scarf'),
(1087, '🧤', ':gloves:', 'gloves'),
(1088, '🧥', ':coat:', 'coat'),
(1089, '🧦', ':socks:', 'socks'),
(1090, '👗', ':dress:', 'dress'),
(1091, '👘', ':kimono:', 'kimono'),
(1092, '🥻', ':sari:', 'sari'),
(1093, '🩱', ':one-piece-swimsuit:', 'one-piece-swimsuit'),
(1094, '🩲', ':briefs:', 'briefs'),
(1095, '🩳', ':shorts:', 'shorts'),
(1096, '👙', ':bikini:', 'bikini'),
(1097, '👚', ':woman-s-clothes:', 'woman-s-clothes'),
(1098, '👛', ':purse:', 'purse'),
(1099, '👜', ':handbag:', 'handbag'),
(1100, '👝', ':clutch-bag:', 'clutch-bag'),
(1101, '🛍️', ':shopping-bags:', 'shopping-bags'),
(1102, '🎒', ':backpack:', 'backpack'),
(1103, '🩴', ':thong-sandal:', 'thong-sandal'),
(1104, '👞', ':man-s-shoe:', 'man-s-shoe'),
(1105, '👟', ':running-shoe:', 'running-shoe'),
(1106, '🥾', ':hiking-boot:', 'hiking-boot'),
(1107, '🥿', ':flat-shoe:', 'flat-shoe'),
(1108, '👠', ':high-heeled-shoe:', 'high-heeled-shoe'),
(1109, '👡', ':woman-s-sandal:', 'woman-s-sandal'),
(1110, '🩰', ':ballet-shoes:', 'ballet-shoes'),
(1111, '👢', ':woman-s-boot:', 'woman-s-boot'),
(1112, '👑', ':crown:', 'crown'),
(1113, '👒', ':woman-s-hat:', 'woman-s-hat'),
(1114, '🎩', ':top-hat:', 'top-hat'),
(1115, '🎓', ':graduation-cap:', 'graduation-cap'),
(1116, '🧢', ':billed-cap:', 'billed-cap'),
(1117, '🪖', ':military-helmet:', 'military-helmet');
INSERT INTO `emojis` (`emoji_id`, `unicode_char`, `pattern`, `class`) VALUES
(1118, '⛑️', ':rescue-worker-s-helmet:', 'rescue-worker-s-helmet'),
(1119, '📿', ':prayer-beads:', 'prayer-beads'),
(1120, '💄', ':lipstick:', 'lipstick'),
(1121, '💍', ':ring:', 'ring'),
(1122, '💎', ':gem-stone:', 'gem-stone'),
(1123, '🔇', ':muted-speaker:', 'muted-speaker'),
(1124, '🔈', ':speaker-low-volume:', 'speaker-low-volume'),
(1125, '🔉', ':speaker-medium-volume:', 'speaker-medium-volume'),
(1126, '🔊', ':speaker-high-volume:', 'speaker-high-volume'),
(1127, '📢', ':loudspeaker:', 'loudspeaker'),
(1128, '📣', ':megaphone:', 'megaphone'),
(1129, '📯', ':postal-horn:', 'postal-horn'),
(1130, '🔔', ':bell:', 'bell'),
(1131, '🔕', ':bell-with-slash:', 'bell-with-slash'),
(1132, '🎼', ':musical-score:', 'musical-score'),
(1133, '🎵', ':musical-note:', 'musical-note'),
(1134, '🎶', ':musical-notes:', 'musical-notes'),
(1135, '🎙️', ':studio-microphone:', 'studio-microphone'),
(1136, '🎚️', ':level-slider:', 'level-slider'),
(1137, '🎛️', ':control-knobs:', 'control-knobs'),
(1138, '🎤', ':microphone:', 'microphone'),
(1139, '🎧', ':headphone:', 'headphone'),
(1140, '📻', ':radio:', 'radio'),
(1141, '🎷', ':saxophone:', 'saxophone'),
(1142, '🪗', ':accordion:', 'accordion'),
(1143, '🎸', ':guitar:', 'guitar'),
(1144, '🎹', ':musical-keyboard:', 'musical-keyboard'),
(1145, '🎺', ':trumpet:', 'trumpet'),
(1146, '🎻', ':violin:', 'violin'),
(1147, '🪕', ':banjo:', 'banjo'),
(1148, '🥁', ':drum:', 'drum'),
(1149, '🪘', ':long-drum:', 'long-drum'),
(1150, '📱', ':mobile-phone:', 'mobile-phone'),
(1151, '📲', ':mobile-phone-with-arrow:', 'mobile-phone-with-arrow'),
(1152, '☎️', ':telephone:', 'telephone'),
(1153, '📞', ':telephone-receiver:', 'telephone-receiver'),
(1154, '📟', ':pager:', 'pager'),
(1155, '📠', ':fax-machine:', 'fax-machine'),
(1156, '🔋', ':battery:', 'battery'),
(1157, '🔌', ':electric-plug:', 'electric-plug'),
(1158, '💻', ':laptop:', 'laptop'),
(1159, '🖥️', ':desktop-computer:', 'desktop-computer'),
(1160, '🖨️', ':printer:', 'printer'),
(1161, '⌨️', ':keyboard:', 'keyboard'),
(1162, '🖱️', ':computer-mouse:', 'computer-mouse'),
(1163, '🖲️', ':trackball:', 'trackball'),
(1164, '💽', ':computer-disk:', 'computer-disk'),
(1165, '💾', ':floppy-disk:', 'floppy-disk'),
(1166, '💿', ':optical-disk:', 'optical-disk'),
(1167, '📀', ':dvd:', 'dvd'),
(1168, '🧮', ':abacus:', 'abacus'),
(1169, '🎥', ':movie-camera:', 'movie-camera'),
(1170, '🎞️', ':film-frames:', 'film-frames'),
(1171, '📽️', ':film-projector:', 'film-projector'),
(1172, '🎬', ':clapper-board:', 'clapper-board'),
(1173, '📺', ':television:', 'television'),
(1174, '📷', ':camera:', 'camera'),
(1175, '📸', ':camera-with-flash:', 'camera-with-flash'),
(1176, '📹', ':video-camera:', 'video-camera'),
(1177, '📼', ':videocassette:', 'videocassette'),
(1178, '🔍', ':magnifying-glass-tilted-left:', 'magnifying-glass-tilted-left'),
(1179, '🔎', ':magnifying-glass-tilted-right:', 'magnifying-glass-tilted-right'),
(1180, '🕯️', ':candle:', 'candle'),
(1181, '💡', ':light-bulb:', 'light-bulb'),
(1182, '🔦', ':flashlight:', 'flashlight'),
(1183, '🏮', ':red-paper-lantern:', 'red-paper-lantern'),
(1184, '🪔', ':diya-lamp:', 'diya-lamp'),
(1185, '📔', ':notebook-with-decorative-cover:', 'notebook-with-decorative-cover'),
(1186, '📕', ':closed-book:', 'closed-book'),
(1187, '📖', ':open-book:', 'open-book'),
(1188, '📗', ':green-book:', 'green-book'),
(1189, '📘', ':blue-book:', 'blue-book'),
(1190, '📙', ':orange-book:', 'orange-book'),
(1191, '📚', ':books:', 'books'),
(1192, '📓', ':notebook:', 'notebook'),
(1193, '📒', ':ledger:', 'ledger'),
(1194, '📃', ':page-with-curl:', 'page-with-curl'),
(1195, '📜', ':scroll:', 'scroll'),
(1196, '📄', ':page-facing-up:', 'page-facing-up'),
(1197, '📰', ':newspaper:', 'newspaper'),
(1198, '🗞️', ':rolled-up-newspaper:', 'rolled-up-newspaper'),
(1199, '📑', ':bookmark-tabs:', 'bookmark-tabs'),
(1200, '🔖', ':bookmark:', 'bookmark'),
(1201, '🏷️', ':label:', 'label'),
(1202, '💰', ':money-bag:', 'money-bag'),
(1203, '🪙', ':coin:', 'coin'),
(1204, '💴', ':yen-banknote:', 'yen-banknote'),
(1205, '💵', ':dollar-banknote:', 'dollar-banknote'),
(1206, '💶', ':euro-banknote:', 'euro-banknote'),
(1207, '💷', ':pound-banknote:', 'pound-banknote'),
(1208, '💸', ':money-with-wings:', 'money-with-wings'),
(1209, '💳', ':credit-card:', 'credit-card'),
(1210, '🧾', ':receipt:', 'receipt'),
(1211, '💹', ':chart-increasing-with-yen:', 'chart-increasing-with-yen'),
(1212, '✉️', ':envelope:', 'envelope'),
(1213, '📧', ':e-mail:', 'e-mail'),
(1214, '📨', ':incoming-envelope:', 'incoming-envelope'),
(1215, '📩', ':envelope-with-arrow:', 'envelope-with-arrow'),
(1216, '📤', ':outbox-tray:', 'outbox-tray'),
(1217, '📥', ':inbox-tray:', 'inbox-tray'),
(1218, '📦', ':package:', 'package'),
(1219, '📫', ':closed-mailbox-with-raised-flag:', 'closed-mailbox-with-raised-flag'),
(1220, '📪', ':closed-mailbox-with-lowered-flag:', 'closed-mailbox-with-lowered-flag'),
(1221, '📬', ':open-mailbox-with-raised-flag:', 'open-mailbox-with-raised-flag'),
(1222, '📭', ':open-mailbox-with-lowered-flag:', 'open-mailbox-with-lowered-flag'),
(1223, '📮', ':postbox:', 'postbox'),
(1224, '🗳️', ':ballot-box-with-ballot:', 'ballot-box-with-ballot'),
(1225, '✏️', ':pencil:', 'pencil'),
(1226, '✒️', ':black-nib:', 'black-nib'),
(1227, '🖋️', ':fountain-pen:', 'fountain-pen'),
(1228, '🖊️', ':pen:', 'pen'),
(1229, '🖌️', ':paintbrush:', 'paintbrush'),
(1230, '🖍️', ':crayon:', 'crayon'),
(1231, '📝', ':memo:', 'memo'),
(1232, '💼', ':briefcase:', 'briefcase'),
(1233, '📁', ':file-folder:', 'file-folder'),
(1234, '📂', ':open-file-folder:', 'open-file-folder'),
(1235, '🗂️', ':card-index-dividers:', 'card-index-dividers'),
(1236, '📅', ':calendar:', 'calendar'),
(1237, '📆', ':tear-off-calendar:', 'tear-off-calendar'),
(1238, '🗒️', ':spiral-notepad:', 'spiral-notepad'),
(1239, '🗓️', ':spiral-calendar:', 'spiral-calendar'),
(1240, '📇', ':card-index:', 'card-index'),
(1241, '📈', ':chart-increasing:', 'chart-increasing'),
(1242, '📉', ':chart-decreasing:', 'chart-decreasing'),
(1243, '📊', ':bar-chart:', 'bar-chart'),
(1244, '📋', ':clipboard:', 'clipboard'),
(1245, '📌', ':pushpin:', 'pushpin'),
(1246, '📍', ':round-pushpin:', 'round-pushpin'),
(1247, '📎', ':paperclip:', 'paperclip'),
(1248, '🖇️', ':linked-paperclips:', 'linked-paperclips'),
(1249, '📏', ':straight-ruler:', 'straight-ruler'),
(1250, '📐', ':triangular-ruler:', 'triangular-ruler'),
(1251, '✂️', ':scissors:', 'scissors'),
(1252, '🗃️', ':card-file-box:', 'card-file-box'),
(1253, '🗄️', ':file-cabinet:', 'file-cabinet'),
(1254, '🗑️', ':wastebasket:', 'wastebasket'),
(1255, '🔒', ':locked:', 'locked'),
(1256, '🔓', ':unlocked:', 'unlocked'),
(1257, '🔏', ':locked-with-pen:', 'locked-with-pen'),
(1258, '🔐', ':locked-with-key:', 'locked-with-key'),
(1259, '🔑', ':key:', 'key'),
(1260, '🗝️', ':old-key:', 'old-key'),
(1261, '🔨', ':hammer:', 'hammer'),
(1262, '🪓', ':axe:', 'axe'),
(1263, '⛏️', ':pick:', 'pick'),
(1264, '⚒️', ':hammer-and-pick:', 'hammer-and-pick'),
(1265, '🛠️', ':hammer-and-wrench:', 'hammer-and-wrench'),
(1266, '🗡️', ':dagger:', 'dagger'),
(1267, '⚔️', ':crossed-swords:', 'crossed-swords'),
(1268, '🔫', ':water-pistol:', 'water-pistol'),
(1269, '🪃', ':boomerang:', 'boomerang'),
(1270, '🏹', ':bow-and-arrow:', 'bow-and-arrow'),
(1271, '🛡️', ':shield:', 'shield'),
(1272, '🪚', ':carpentry-saw:', 'carpentry-saw'),
(1273, '🔧', ':wrench:', 'wrench'),
(1274, '🪛', ':screwdriver:', 'screwdriver'),
(1275, '🔩', ':nut-and-bolt:', 'nut-and-bolt'),
(1276, '⚙️', ':gear:', 'gear'),
(1277, '🗜️', ':clamp:', 'clamp'),
(1278, '⚖️', ':balance-scale:', 'balance-scale'),
(1279, '🦯', ':white-cane:', 'white-cane'),
(1280, '🔗', ':link:', 'link'),
(1281, '⛓️', ':chains:', 'chains'),
(1282, '🪝', ':hook:', 'hook'),
(1283, '🧰', ':toolbox:', 'toolbox'),
(1284, '🧲', ':magnet:', 'magnet'),
(1285, '🪜', ':ladder:', 'ladder'),
(1286, '⚗️', ':alembic:', 'alembic'),
(1287, '🧪', ':test-tube:', 'test-tube'),
(1288, '🧫', ':petri-dish:', 'petri-dish'),
(1289, '🧬', ':dna:', 'dna'),
(1290, '🔬', ':microscope:', 'microscope'),
(1291, '🔭', ':telescope:', 'telescope'),
(1292, '📡', ':satellite-antenna:', 'satellite-antenna'),
(1293, '💉', ':syringe:', 'syringe'),
(1294, '🩸', ':drop-of-blood:', 'drop-of-blood'),
(1295, '💊', ':pill:', 'pill'),
(1296, '🩹', ':adhesive-bandage:', 'adhesive-bandage'),
(1297, '🩺', ':stethoscope:', 'stethoscope'),
(1298, '🚪', ':door:', 'door'),
(1299, '🛗', ':elevator:', 'elevator'),
(1300, '🪞', ':mirror:', 'mirror'),
(1301, '🪟', ':window:', 'window'),
(1302, '🛏️', ':bed:', 'bed'),
(1303, '🛋️', ':couch-and-lamp:', 'couch-and-lamp'),
(1304, '🪑', ':chair:', 'chair'),
(1305, '🚽', ':toilet:', 'toilet'),
(1306, '🪠', ':plunger:', 'plunger'),
(1307, '🚿', ':shower:', 'shower'),
(1308, '🛁', ':bathtub:', 'bathtub'),
(1309, '🪤', ':mouse-trap:', 'mouse-trap'),
(1310, '🪒', ':razor:', 'razor'),
(1311, '🧴', ':lotion-bottle:', 'lotion-bottle'),
(1312, '🧷', ':safety-pin:', 'safety-pin'),
(1313, '🧹', ':broom:', 'broom'),
(1314, '🧺', ':basket:', 'basket'),
(1315, '🧻', ':roll-of-paper:', 'roll-of-paper'),
(1316, '🪣', ':bucket:', 'bucket'),
(1317, '🧼', ':soap:', 'soap'),
(1318, '🪥', ':toothbrush:', 'toothbrush'),
(1319, '🧽', ':sponge:', 'sponge'),
(1320, '🧯', ':fire-extinguisher:', 'fire-extinguisher'),
(1321, '🛒', ':shopping-cart:', 'shopping-cart'),
(1322, '🚬', ':cigarette:', 'cigarette'),
(1323, '⚰️', ':coffin:', 'coffin'),
(1324, '🪦', ':headstone:', 'headstone'),
(1325, '⚱️', ':funeral-urn:', 'funeral-urn'),
(1326, '🗿', ':moai:', 'moai'),
(1327, '🪧', ':placard:', 'placard'),
(1328, '🏧', ':atm-sign:', 'atm-sign'),
(1329, '🚮', ':litter-in-bin-sign:', 'litter-in-bin-sign'),
(1330, '🚰', ':potable-water:', 'potable-water'),
(1331, '♿', ':wheelchair-symbol:', 'wheelchair-symbol'),
(1332, '🚹', ':men-s-room:', 'men-s-room'),
(1333, '🚺', ':women-s-room:', 'women-s-room'),
(1334, '🚻', ':restroom:', 'restroom'),
(1335, '🚼', ':baby-symbol:', 'baby-symbol'),
(1336, '🚾', ':water-closet:', 'water-closet'),
(1337, '🛂', ':passport-control:', 'passport-control'),
(1338, '🛃', ':customs:', 'customs'),
(1339, '🛄', ':baggage-claim:', 'baggage-claim'),
(1340, '🛅', ':left-luggage:', 'left-luggage'),
(1341, '⚠️', ':warning:', 'warning'),
(1342, '🚸', ':children-crossing:', 'children-crossing'),
(1343, '⛔', ':no-entry:', 'no-entry'),
(1344, '🚫', ':prohibited:', 'prohibited'),
(1345, '🚳', ':no-bicycles:', 'no-bicycles'),
(1346, '🚭', ':no-smoking:', 'no-smoking'),
(1347, '🚯', ':no-littering:', 'no-littering'),
(1348, '🚱', ':non-potable-water:', 'non-potable-water'),
(1349, '🚷', ':no-pedestrians:', 'no-pedestrians'),
(1350, '📵', ':no-mobile-phones:', 'no-mobile-phones'),
(1351, '🔞', ':no-one-under-eighteen:', 'no-one-under-eighteen'),
(1352, '☢️', ':radioactive:', 'radioactive'),
(1353, '☣️', ':biohazard:', 'biohazard'),
(1354, '⬆️', ':up-arrow:', 'up-arrow'),
(1355, '↗️', ':up-right-arrow:', 'up-right-arrow'),
(1356, '➡️', ':right-arrow:', 'right-arrow'),
(1357, '↘️', ':down-right-arrow:', 'down-right-arrow'),
(1358, '⬇️', ':down-arrow:', 'down-arrow'),
(1359, '↙️', ':down-left-arrow:', 'down-left-arrow'),
(1360, '⬅️', ':left-arrow:', 'left-arrow'),
(1361, '↖️', ':up-left-arrow:', 'up-left-arrow'),
(1362, '↕️', ':up-down-arrow:', 'up-down-arrow'),
(1363, '↔️', ':left-right-arrow:', 'left-right-arrow'),
(1364, '↩️', ':right-arrow-curving-left:', 'right-arrow-curving-left'),
(1365, '↪️', ':left-arrow-curving-right:', 'left-arrow-curving-right'),
(1366, '⤴️', ':right-arrow-curving-up:', 'right-arrow-curving-up'),
(1367, '⤵️', ':right-arrow-curving-down:', 'right-arrow-curving-down'),
(1368, '🔃', ':clockwise-vertical-arrows:', 'clockwise-vertical-arrows'),
(1369, '🔄', ':counterclockwise-arrows-button:', 'counterclockwise-arrows-button'),
(1370, '🔙', ':back-arrow:', 'back-arrow'),
(1371, '🔚', ':end-arrow:', 'end-arrow'),
(1372, '🔛', ':on-arrow:', 'on-arrow'),
(1373, '🔜', ':soon-arrow:', 'soon-arrow'),
(1374, '🔝', ':top-arrow:', 'top-arrow'),
(1375, '🛐', ':place-of-worship:', 'place-of-worship'),
(1376, '⚛️', ':atom-symbol:', 'atom-symbol'),
(1377, '🕉️', ':om:', 'om'),
(1378, '✡️', ':star-of-david:', 'star-of-david'),
(1379, '☸️', ':wheel-of-dharma:', 'wheel-of-dharma'),
(1380, '☯️', ':yin-yang:', 'yin-yang'),
(1381, '✝️', ':latin-cross:', 'latin-cross'),
(1382, '☦️', ':orthodox-cross:', 'orthodox-cross'),
(1383, '☪️', ':star-and-crescent:', 'star-and-crescent'),
(1384, '☮️', ':peace-symbol:', 'peace-symbol'),
(1385, '🕎', ':menorah:', 'menorah'),
(1386, '🔯', ':dotted-six-pointed-star:', 'dotted-six-pointed-star'),
(1387, '♈', ':aries:', 'aries'),
(1388, '♉', ':taurus:', 'taurus'),
(1389, '♊', ':gemini:', 'gemini'),
(1390, '♋', ':cancer:', 'cancer'),
(1391, '♌', ':leo:', 'leo'),
(1392, '♍', ':virgo:', 'virgo'),
(1393, '♎', ':libra:', 'libra'),
(1394, '♏', ':scorpio:', 'scorpio'),
(1395, '♐', ':sagittarius:', 'sagittarius'),
(1396, '♑', ':capricorn:', 'capricorn'),
(1397, '♒', ':aquarius:', 'aquarius'),
(1398, '♓', ':pisces:', 'pisces'),
(1399, '⛎', ':ophiuchus:', 'ophiuchus'),
(1400, '🔀', ':shuffle-tracks-button:', 'shuffle-tracks-button'),
(1401, '🔁', ':repeat-button:', 'repeat-button'),
(1402, '🔂', ':repeat-single-button:', 'repeat-single-button'),
(1403, '▶️', ':play-button:', 'play-button'),
(1404, '⏩', ':fast-forward-button:', 'fast-forward-button'),
(1405, '⏭️', ':next-track-button:', 'next-track-button'),
(1406, '⏯️', ':play-or-pause-button:', 'play-or-pause-button'),
(1407, '◀️', ':reverse-button:', 'reverse-button'),
(1408, '⏪', ':fast-reverse-button:', 'fast-reverse-button'),
(1409, '⏮️', ':last-track-button:', 'last-track-button'),
(1410, '🔼', ':upwards-button:', 'upwards-button'),
(1411, '⏫', ':fast-up-button:', 'fast-up-button'),
(1412, '🔽', ':downwards-button:', 'downwards-button'),
(1413, '⏬', ':fast-down-button:', 'fast-down-button'),
(1414, '⏸️', ':pause-button:', 'pause-button'),
(1415, '⏹️', ':stop-button:', 'stop-button'),
(1416, '⏺️', ':record-button:', 'record-button'),
(1417, '⏏️', ':eject-button:', 'eject-button'),
(1418, '🎦', ':cinema:', 'cinema'),
(1419, '🔅', ':dim-button:', 'dim-button'),
(1420, '🔆', ':bright-button:', 'bright-button'),
(1421, '📶', ':antenna-bars:', 'antenna-bars'),
(1422, '📳', ':vibration-mode:', 'vibration-mode'),
(1423, '📴', ':mobile-phone-off:', 'mobile-phone-off'),
(1424, '♀️', ':female-sign:', 'female-sign'),
(1425, '♂️', ':male-sign:', 'male-sign'),
(1426, '⚧️', ':transgender-symbol:', 'transgender-symbol'),
(1427, '✖️', ':multiply:', 'multiply'),
(1428, '➕', ':plus:', 'plus'),
(1429, '➖', ':minus:', 'minus'),
(1430, '➗', ':divide:', 'divide'),
(1431, '♾️', ':infinity:', 'infinity'),
(1432, '‼️', ':double-exclamation-mark:', 'double-exclamation-mark'),
(1433, '⁉️', ':exclamation-question-mark:', 'exclamation-question-mark'),
(1434, '❓', ':red-question-mark:', 'red-question-mark'),
(1435, '❔', ':white-question-mark:', 'white-question-mark'),
(1436, '❕', ':white-exclamation-mark:', 'white-exclamation-mark'),
(1437, '❗', ':red-exclamation-mark:', 'red-exclamation-mark'),
(1438, '〰️', ':wavy-dash:', 'wavy-dash'),
(1439, '💱', ':currency-exchange:', 'currency-exchange'),
(1440, '💲', ':heavy-dollar-sign:', 'heavy-dollar-sign'),
(1441, '⚕️', ':medical-symbol:', 'medical-symbol'),
(1442, '♻️', ':recycling-symbol:', 'recycling-symbol'),
(1443, '⚜️', ':fleur-de-lis:', 'fleur-de-lis'),
(1444, '🔱', ':trident-emblem:', 'trident-emblem'),
(1445, '📛', ':name-badge:', 'name-badge'),
(1446, '🔰', ':japanese-symbol-for-beginner:', 'japanese-symbol-for-beginner'),
(1447, '⭕', ':hollow-red-circle:', 'hollow-red-circle'),
(1448, '✅', ':check-mark-button:', 'check-mark-button'),
(1449, '☑️', ':check-box-with-check:', 'check-box-with-check'),
(1450, '✔️', ':check-mark:', 'check-mark'),
(1451, '❌', ':cross-mark:', 'cross-mark'),
(1452, '❎', ':cross-mark-button:', 'cross-mark-button'),
(1453, '➰', ':curly-loop:', 'curly-loop'),
(1454, '➿', ':double-curly-loop:', 'double-curly-loop'),
(1455, '〽️', ':part-alternation-mark:', 'part-alternation-mark'),
(1456, '✳️', ':eight-spoked-asterisk:', 'eight-spoked-asterisk'),
(1457, '✴️', ':eight-pointed-star:', 'eight-pointed-star'),
(1458, '❇️', ':sparkle:', 'sparkle'),
(1459, '©️', ':copyright:', 'copyright'),
(1460, '®️', ':registered:', 'registered'),
(1461, '™️', ':trade-mark:', 'trade-mark'),
(1462, '0️⃣', ':keycap-0:', 'keycap-0'),
(1463, '1️⃣', ':keycap-1:', 'keycap-1'),
(1464, '2️⃣', ':keycap-2:', 'keycap-2'),
(1465, '3️⃣', ':keycap-3:', 'keycap-3'),
(1466, '4️⃣', ':keycap-4:', 'keycap-4'),
(1467, '5️⃣', ':keycap-5:', 'keycap-5'),
(1468, '6️⃣', ':keycap-6:', 'keycap-6'),
(1469, '7️⃣', ':keycap-7:', 'keycap-7'),
(1470, '8️⃣', ':keycap-8:', 'keycap-8'),
(1471, '9️⃣', ':keycap-9:', 'keycap-9'),
(1472, '🔟', ':keycap-10:', 'keycap-10'),
(1473, '🔠', ':input-latin-uppercase:', 'input-latin-uppercase'),
(1474, '🔡', ':input-latin-lowercase:', 'input-latin-lowercase'),
(1475, '🔢', ':input-numbers:', 'input-numbers'),
(1476, '🔣', ':input-symbols:', 'input-symbols'),
(1477, '🔤', ':input-latin-letters:', 'input-latin-letters'),
(1478, '🅰️', ':a-button-blood-type:', 'a-button-blood-type'),
(1479, '🆎', ':ab-button-blood-type:', 'ab-button-blood-type'),
(1480, '🅱️', ':b-button-blood-type:', 'b-button-blood-type'),
(1481, '🆑', ':cl-button:', 'cl-button'),
(1482, '🆒', ':cool-button:', 'cool-button'),
(1483, '🆓', ':free-button:', 'free-button'),
(1484, 'ℹ️', ':information:', 'information'),
(1485, '🆔', ':id-button:', 'id-button'),
(1486, 'Ⓜ️', ':circled-m:', 'circled-m'),
(1487, '🆕', ':new-button:', 'new-button'),
(1488, '🆖', ':ng-button:', 'ng-button'),
(1489, '🅾️', ':o-button-blood-type:', 'o-button-blood-type'),
(1490, '🆗', ':ok-button:', 'ok-button'),
(1491, '🅿️', ':p-button:', 'p-button'),
(1492, '🆘', ':sos-button:', 'sos-button'),
(1493, '🆙', ':up-button:', 'up-button'),
(1494, '🆚', ':vs-button:', 'vs-button'),
(1495, '🈁', ':japanese-here-button:', 'japanese-here-button'),
(1496, '🈂️', ':japanese-service-charge-button:', 'japanese-service-charge-button'),
(1497, '🈷️', ':japanese-monthly-amount-button:', 'japanese-monthly-amount-button'),
(1498, '🈶', ':japanese-not-free-of-charge-button:', 'japanese-not-free-of-charge-button'),
(1499, '🈯', ':japanese-reserved-button:', 'japanese-reserved-button'),
(1500, '🉐', ':japanese-bargain-button:', 'japanese-bargain-button'),
(1501, '🈹', ':japanese-discount-button:', 'japanese-discount-button'),
(1502, '🈚', ':japanese-free-of-charge-button:', 'japanese-free-of-charge-button'),
(1503, '🈲', ':japanese-prohibited-button:', 'japanese-prohibited-button'),
(1504, '🉑', ':japanese-acceptable-button:', 'japanese-acceptable-button'),
(1505, '🈸', ':japanese-application-button:', 'japanese-application-button'),
(1506, '🈴', ':japanese-passing-grade-button:', 'japanese-passing-grade-button'),
(1507, '🈳', ':japanese-vacancy-button:', 'japanese-vacancy-button'),
(1508, '㊗️', ':japanese-congratulations-button:', 'japanese-congratulations-button'),
(1509, '㊙️', ':japanese-secret-button:', 'japanese-secret-button'),
(1510, '🈺', ':japanese-open-for-business-button:', 'japanese-open-for-business-button'),
(1511, '🈵', ':japanese-no-vacancy-button:', 'japanese-no-vacancy-button'),
(1512, '🔴', ':red-circle:', 'red-circle'),
(1513, '🟠', ':orange-circle:', 'orange-circle'),
(1514, '🟡', ':yellow-circle:', 'yellow-circle'),
(1515, '🟢', ':green-circle:', 'green-circle'),
(1516, '🔵', ':blue-circle:', 'blue-circle'),
(1517, '🟣', ':purple-circle:', 'purple-circle'),
(1518, '🟤', ':brown-circle:', 'brown-circle'),
(1519, '⚫', ':black-circle:', 'black-circle'),
(1520, '⚪', ':white-circle:', 'white-circle'),
(1521, '🟥', ':red-square:', 'red-square'),
(1522, '🟧', ':orange-square:', 'orange-square'),
(1523, '🟨', ':yellow-square:', 'yellow-square'),
(1524, '🟩', ':green-square:', 'green-square'),
(1525, '🟦', ':blue-square:', 'blue-square'),
(1526, '🟪', ':purple-square:', 'purple-square'),
(1527, '🟫', ':brown-square:', 'brown-square'),
(1528, '⬛', ':black-large-square:', 'black-large-square'),
(1529, '⬜', ':white-large-square:', 'white-large-square'),
(1530, '◼️', ':black-medium-square:', 'black-medium-square'),
(1531, '◻️', ':white-medium-square:', 'white-medium-square'),
(1532, '◾', ':black-medium-small-square:', 'black-medium-small-square'),
(1533, '◽', ':white-medium-small-square:', 'white-medium-small-square'),
(1534, '▪️', ':black-small-square:', 'black-small-square'),
(1535, '▫️', ':white-small-square:', 'white-small-square'),
(1536, '🔶', ':large-orange-diamond:', 'large-orange-diamond'),
(1537, '🔷', ':large-blue-diamond:', 'large-blue-diamond'),
(1538, '🔸', ':small-orange-diamond:', 'small-orange-diamond'),
(1539, '🔹', ':small-blue-diamond:', 'small-blue-diamond'),
(1540, '🔺', ':red-triangle-pointed-up:', 'red-triangle-pointed-up'),
(1541, '🔻', ':red-triangle-pointed-down:', 'red-triangle-pointed-down'),
(1542, '💠', ':diamond-with-a-dot:', 'diamond-with-a-dot'),
(1543, '🔘', ':radio-button:', 'radio-button'),
(1544, '🔳', ':white-square-button:', 'white-square-button'),
(1545, '🔲', ':black-square-button:', 'black-square-button'),
(1546, '🏁', ':chequered-flag:', 'chequered-flag'),
(1547, '🚩', ':triangular-flag:', 'triangular-flag'),
(1548, '🎌', ':crossed-flags:', 'crossed-flags'),
(1549, '🏴', ':black-flag:', 'black-flag'),
(1550, '🏳️', ':white-flag:', 'white-flag'),
(1551, '🏳️‍🌈', ':rainbow-flag:', 'rainbow-flag'),
(1552, '🏳️‍⚧️', ':transgender-flag:', 'transgender-flag'),
(1553, '🏴‍☠️', ':pirate-flag:', 'pirate-flag'),
(1554, '🇦🇨', ':flag-ascension-island:', 'flag-ascension-island'),
(1555, '🇦🇩', ':flag-andorra:', 'flag-andorra'),
(1556, '🇦🇪', ':flag-united-arab-emirates:', 'flag-united-arab-emirates'),
(1557, '🇦🇫', ':flag-afghanistan:', 'flag-afghanistan'),
(1558, '🇦🇬', ':flag-antigua-barbuda:', 'flag-antigua-barbuda'),
(1559, '🇦🇮', ':flag-anguilla:', 'flag-anguilla'),
(1560, '🇦🇱', ':flag-albania:', 'flag-albania'),
(1561, '🇦🇲', ':flag-armenia:', 'flag-armenia'),
(1562, '🇦🇴', ':flag-angola:', 'flag-angola'),
(1563, '🇦🇶', ':flag-antarctica:', 'flag-antarctica'),
(1564, '🇦🇷', ':flag-argentina:', 'flag-argentina'),
(1565, '🇦🇸', ':flag-american-samoa:', 'flag-american-samoa'),
(1566, '🇦🇹', ':flag-austria:', 'flag-austria'),
(1567, '🇦🇺', ':flag-australia:', 'flag-australia'),
(1568, '🇦🇼', ':flag-aruba:', 'flag-aruba'),
(1569, '🇦🇿', ':flag-azerbaijan:', 'flag-azerbaijan'),
(1570, '🇧🇦', ':flag-bosnia-herzegovina:', 'flag-bosnia-herzegovina'),
(1571, '🇧🇧', ':flag-barbados:', 'flag-barbados'),
(1572, '🇧🇩', ':flag-bangladesh:', 'flag-bangladesh'),
(1573, '🇧🇪', ':flag-belgium:', 'flag-belgium'),
(1574, '🇧🇫', ':flag-burkina-faso:', 'flag-burkina-faso'),
(1575, '🇧🇬', ':flag-bulgaria:', 'flag-bulgaria'),
(1576, '🇧🇭', ':flag-bahrain:', 'flag-bahrain'),
(1577, '🇧🇮', ':flag-burundi:', 'flag-burundi'),
(1578, '🇧🇯', ':flag-benin:', 'flag-benin'),
(1579, '🇧🇲', ':flag-bermuda:', 'flag-bermuda'),
(1580, '🇧🇳', ':flag-brunei:', 'flag-brunei'),
(1581, '🇧🇴', ':flag-bolivia:', 'flag-bolivia'),
(1582, '🇧🇶', ':flag-caribbean-netherlands:', 'flag-caribbean-netherlands'),
(1583, '🇧🇷', ':flag-brazil:', 'flag-brazil'),
(1584, '🇧🇸', ':flag-bahamas:', 'flag-bahamas'),
(1585, '🇧🇹', ':flag-bhutan:', 'flag-bhutan'),
(1586, '🇧🇻', ':flag-bouvet-island:', 'flag-bouvet-island'),
(1587, '🇧🇼', ':flag-botswana:', 'flag-botswana'),
(1588, '🇧🇾', ':flag-belarus:', 'flag-belarus'),
(1589, '🇧🇿', ':flag-belize:', 'flag-belize'),
(1590, '🇨🇦', ':flag-canada:', 'flag-canada'),
(1591, '🇨🇨', ':flag-cocos-keeling-islands:', 'flag-cocos-keeling-islands'),
(1592, '🇨🇩', ':flag-congo-kinshasa:', 'flag-congo-kinshasa'),
(1593, '🇨🇫', ':flag-central-african-republic:', 'flag-central-african-republic'),
(1594, '🇨🇬', ':flag-congo-brazzaville:', 'flag-congo-brazzaville'),
(1595, '🇨🇭', ':flag-switzerland:', 'flag-switzerland'),
(1596, '🇨🇰', ':flag-cook-islands:', 'flag-cook-islands'),
(1597, '🇨🇱', ':flag-chile:', 'flag-chile'),
(1598, '🇨🇲', ':flag-cameroon:', 'flag-cameroon'),
(1599, '🇨🇳', ':flag-china:', 'flag-china'),
(1600, '🇨🇴', ':flag-colombia:', 'flag-colombia'),
(1601, '🇨🇵', ':flag-clipperton-island:', 'flag-clipperton-island'),
(1602, '🇨🇷', ':flag-costa-rica:', 'flag-costa-rica'),
(1603, '🇨🇺', ':flag-cuba:', 'flag-cuba'),
(1604, '🇨🇻', ':flag-cape-verde:', 'flag-cape-verde'),
(1605, '🇨🇽', ':flag-christmas-island:', 'flag-christmas-island'),
(1606, '🇨🇾', ':flag-cyprus:', 'flag-cyprus'),
(1607, '🇨🇿', ':flag-czechia:', 'flag-czechia'),
(1608, '🇩🇪', ':flag-germany:', 'flag-germany'),
(1609, '🇩🇬', ':flag-diego-garcia:', 'flag-diego-garcia'),
(1610, '🇩🇯', ':flag-djibouti:', 'flag-djibouti'),
(1611, '🇩🇰', ':flag-denmark:', 'flag-denmark'),
(1612, '🇩🇲', ':flag-dominica:', 'flag-dominica'),
(1613, '🇩🇴', ':flag-dominican-republic:', 'flag-dominican-republic'),
(1614, '🇩🇿', ':flag-algeria:', 'flag-algeria'),
(1615, '🇪🇦', ':flag-ceuta-melilla:', 'flag-ceuta-melilla'),
(1616, '🇪🇨', ':flag-ecuador:', 'flag-ecuador'),
(1617, '🇪🇪', ':flag-estonia:', 'flag-estonia'),
(1618, '🇪🇬', ':flag-egypt:', 'flag-egypt'),
(1619, '🇪🇭', ':flag-western-sahara:', 'flag-western-sahara'),
(1620, '🇪🇷', ':flag-eritrea:', 'flag-eritrea'),
(1621, '🇪🇸', ':flag-spain:', 'flag-spain'),
(1622, '🇪🇹', ':flag-ethiopia:', 'flag-ethiopia'),
(1623, '🇪🇺', ':flag-european-union:', 'flag-european-union'),
(1624, '🇫🇮', ':flag-finland:', 'flag-finland'),
(1625, '🇫🇯', ':flag-fiji:', 'flag-fiji'),
(1626, '🇫🇰', ':flag-falkland-islands:', 'flag-falkland-islands'),
(1627, '🇫🇲', ':flag-micronesia:', 'flag-micronesia'),
(1628, '🇫🇴', ':flag-faroe-islands:', 'flag-faroe-islands'),
(1629, '🇫🇷', ':flag-france:', 'flag-france'),
(1630, '🇬🇦', ':flag-gabon:', 'flag-gabon'),
(1631, '🇬🇧', ':flag-united-kingdom:', 'flag-united-kingdom'),
(1632, '🇬🇩', ':flag-grenada:', 'flag-grenada'),
(1633, '🇬🇪', ':flag-georgia:', 'flag-georgia'),
(1634, '🇬🇫', ':flag-french-guiana:', 'flag-french-guiana'),
(1635, '🇬🇬', ':flag-guernsey:', 'flag-guernsey'),
(1636, '🇬🇭', ':flag-ghana:', 'flag-ghana'),
(1637, '🇬🇮', ':flag-gibraltar:', 'flag-gibraltar'),
(1638, '🇬🇱', ':flag-greenland:', 'flag-greenland'),
(1639, '🇬🇲', ':flag-gambia:', 'flag-gambia'),
(1640, '🇬🇳', ':flag-guinea:', 'flag-guinea'),
(1641, '🇬🇵', ':flag-guadeloupe:', 'flag-guadeloupe'),
(1642, '🇬🇶', ':flag-equatorial-guinea:', 'flag-equatorial-guinea'),
(1643, '🇬🇷', ':flag-greece:', 'flag-greece'),
(1644, '🇬🇸', ':flag-south-georgia-south-sandwich-islands:', 'flag-south-georgia-south-sandwich-islands'),
(1645, '🇬🇹', ':flag-guatemala:', 'flag-guatemala'),
(1646, '🇬🇺', ':flag-guam:', 'flag-guam'),
(1647, '🇬🇼', ':flag-guinea-bissau:', 'flag-guinea-bissau'),
(1648, '🇬🇾', ':flag-guyana:', 'flag-guyana'),
(1649, '🇭🇰', ':flag-hong-kong-sar-china:', 'flag-hong-kong-sar-china'),
(1650, '🇭🇲', ':flag-heard-mcdonald-islands:', 'flag-heard-mcdonald-islands'),
(1651, '🇭🇳', ':flag-honduras:', 'flag-honduras'),
(1652, '🇭🇷', ':flag-croatia:', 'flag-croatia'),
(1653, '🇭🇹', ':flag-haiti:', 'flag-haiti'),
(1654, '🇭🇺', ':flag-hungary:', 'flag-hungary'),
(1655, '🇮🇨', ':flag-canary-islands:', 'flag-canary-islands'),
(1656, '🇮🇩', ':flag-indonesia:', 'flag-indonesia'),
(1657, '🇮🇪', ':flag-ireland:', 'flag-ireland'),
(1658, '🇮🇱', ':flag-israel:', 'flag-israel'),
(1659, '🇮🇲', ':flag-isle-of-man:', 'flag-isle-of-man'),
(1660, '🇮🇳', ':flag-india:', 'flag-india'),
(1661, '🇮🇴', ':flag-british-indian-ocean-territory:', 'flag-british-indian-ocean-territory'),
(1662, '🇮🇶', ':flag-iraq:', 'flag-iraq'),
(1663, '🇮🇷', ':flag-iran:', 'flag-iran'),
(1664, '🇮🇸', ':flag-iceland:', 'flag-iceland'),
(1665, '🇮🇹', ':flag-italy:', 'flag-italy'),
(1666, '🇯🇪', ':flag-jersey:', 'flag-jersey'),
(1667, '🇯🇲', ':flag-jamaica:', 'flag-jamaica'),
(1668, '🇯🇴', ':flag-jordan:', 'flag-jordan'),
(1669, '🇯🇵', ':flag-japan:', 'flag-japan'),
(1670, '🇰🇪', ':flag-kenya:', 'flag-kenya'),
(1671, '🇰🇬', ':flag-kyrgyzstan:', 'flag-kyrgyzstan'),
(1672, '🇰🇭', ':flag-cambodia:', 'flag-cambodia'),
(1673, '🇰🇮', ':flag-kiribati:', 'flag-kiribati'),
(1674, '🇰🇲', ':flag-comoros:', 'flag-comoros'),
(1675, '🇰🇵', ':flag-north-korea:', 'flag-north-korea'),
(1676, '🇰🇷', ':flag-south-korea:', 'flag-south-korea'),
(1677, '🇰🇼', ':flag-kuwait:', 'flag-kuwait'),
(1678, '🇰🇾', ':flag-cayman-islands:', 'flag-cayman-islands'),
(1679, '🇰🇿', ':flag-kazakhstan:', 'flag-kazakhstan'),
(1680, '🇱🇦', ':flag-laos:', 'flag-laos'),
(1681, '🇱🇧', ':flag-lebanon:', 'flag-lebanon'),
(1682, '🇱🇮', ':flag-liechtenstein:', 'flag-liechtenstein'),
(1683, '🇱🇰', ':flag-sri-lanka:', 'flag-sri-lanka'),
(1684, '🇱🇷', ':flag-liberia:', 'flag-liberia'),
(1685, '🇱🇸', ':flag-lesotho:', 'flag-lesotho'),
(1686, '🇱🇹', ':flag-lithuania:', 'flag-lithuania'),
(1687, '🇱🇺', ':flag-luxembourg:', 'flag-luxembourg'),
(1688, '🇱🇻', ':flag-latvia:', 'flag-latvia'),
(1689, '🇱🇾', ':flag-libya:', 'flag-libya'),
(1690, '🇲🇦', ':flag-morocco:', 'flag-morocco'),
(1691, '🇲🇨', ':flag-monaco:', 'flag-monaco'),
(1692, '🇲🇩', ':flag-moldova:', 'flag-moldova'),
(1693, '🇲🇪', ':flag-montenegro:', 'flag-montenegro'),
(1694, '🇲🇬', ':flag-madagascar:', 'flag-madagascar'),
(1695, '🇲🇭', ':flag-marshall-islands:', 'flag-marshall-islands'),
(1696, '🇲🇰', ':flag-north-macedonia:', 'flag-north-macedonia'),
(1697, '🇲🇱', ':flag-mali:', 'flag-mali'),
(1698, '🇲🇲', ':flag-myanmar-burma:', 'flag-myanmar-burma'),
(1699, '🇲🇳', ':flag-mongolia:', 'flag-mongolia'),
(1700, '🇲🇴', ':flag-macao-sar-china:', 'flag-macao-sar-china'),
(1701, '🇲🇵', ':flag-northern-mariana-islands:', 'flag-northern-mariana-islands'),
(1702, '🇲🇶', ':flag-martinique:', 'flag-martinique'),
(1703, '🇲🇷', ':flag-mauritania:', 'flag-mauritania'),
(1704, '🇲🇸', ':flag-montserrat:', 'flag-montserrat'),
(1705, '🇲🇹', ':flag-malta:', 'flag-malta'),
(1706, '🇲🇺', ':flag-mauritius:', 'flag-mauritius'),
(1707, '🇲🇻', ':flag-maldives:', 'flag-maldives'),
(1708, '🇲🇼', ':flag-malawi:', 'flag-malawi'),
(1709, '🇲🇽', ':flag-mexico:', 'flag-mexico'),
(1710, '🇲🇾', ':flag-malaysia:', 'flag-malaysia'),
(1711, '🇲🇿', ':flag-mozambique:', 'flag-mozambique'),
(1712, '🇳🇦', ':flag-namibia:', 'flag-namibia'),
(1713, '🇳🇨', ':flag-new-caledonia:', 'flag-new-caledonia'),
(1714, '🇳🇪', ':flag-niger:', 'flag-niger'),
(1715, '🇳🇫', ':flag-norfolk-island:', 'flag-norfolk-island'),
(1716, '🇳🇬', ':flag-nigeria:', 'flag-nigeria'),
(1717, '🇳🇮', ':flag-nicaragua:', 'flag-nicaragua'),
(1718, '🇳🇱', ':flag-netherlands:', 'flag-netherlands'),
(1719, '🇳🇴', ':flag-norway:', 'flag-norway'),
(1720, '🇳🇵', ':flag-nepal:', 'flag-nepal'),
(1721, '🇳🇷', ':flag-nauru:', 'flag-nauru'),
(1722, '🇳🇺', ':flag-niue:', 'flag-niue'),
(1723, '🇳🇿', ':flag-new-zealand:', 'flag-new-zealand'),
(1724, '🇴🇲', ':flag-oman:', 'flag-oman'),
(1725, '🇵🇦', ':flag-panama:', 'flag-panama'),
(1726, '🇵🇪', ':flag-peru:', 'flag-peru'),
(1727, '🇵🇫', ':flag-french-polynesia:', 'flag-french-polynesia'),
(1728, '🇵🇬', ':flag-papua-new-guinea:', 'flag-papua-new-guinea'),
(1729, '🇵🇭', ':flag-philippines:', 'flag-philippines'),
(1730, '🇵🇰', ':flag-pakistan:', 'flag-pakistan'),
(1731, '🇵🇱', ':flag-poland:', 'flag-poland'),
(1732, '🇵🇳', ':flag-pitcairn-islands:', 'flag-pitcairn-islands'),
(1733, '🇵🇷', ':flag-puerto-rico:', 'flag-puerto-rico'),
(1734, '🇵🇸', ':flag-palestinian-territories:', 'flag-palestinian-territories'),
(1735, '🇵🇹', ':flag-portugal:', 'flag-portugal'),
(1736, '🇵🇼', ':flag-palau:', 'flag-palau'),
(1737, '🇵🇾', ':flag-paraguay:', 'flag-paraguay'),
(1738, '🇶🇦', ':flag-qatar:', 'flag-qatar'),
(1739, '🇷🇴', ':flag-romania:', 'flag-romania'),
(1740, '🇷🇸', ':flag-serbia:', 'flag-serbia'),
(1741, '🇷🇺', ':flag-russia:', 'flag-russia'),
(1742, '🇷🇼', ':flag-rwanda:', 'flag-rwanda'),
(1743, '🇸🇦', ':flag-saudi-arabia:', 'flag-saudi-arabia'),
(1744, '🇸🇧', ':flag-solomon-islands:', 'flag-solomon-islands'),
(1745, '🇸🇨', ':flag-seychelles:', 'flag-seychelles'),
(1746, '🇸🇩', ':flag-sudan:', 'flag-sudan'),
(1747, '🇸🇪', ':flag-sweden:', 'flag-sweden'),
(1748, '🇸🇬', ':flag-singapore:', 'flag-singapore'),
(1749, '🇸🇮', ':flag-slovenia:', 'flag-slovenia'),
(1750, '🇸🇯', ':flag-svalbard-jan-mayen:', 'flag-svalbard-jan-mayen'),
(1751, '🇸🇰', ':flag-slovakia:', 'flag-slovakia'),
(1752, '🇸🇱', ':flag-sierra-leone:', 'flag-sierra-leone'),
(1753, '🇸🇲', ':flag-san-marino:', 'flag-san-marino'),
(1754, '🇸🇳', ':flag-senegal:', 'flag-senegal'),
(1755, '🇸🇴', ':flag-somalia:', 'flag-somalia'),
(1756, '🇸🇷', ':flag-suriname:', 'flag-suriname'),
(1757, '🇸🇸', ':flag-south-sudan:', 'flag-south-sudan'),
(1758, '🇸🇻', ':flag-el-salvador:', 'flag-el-salvador'),
(1759, '🇸🇽', ':flag-sint-maarten:', 'flag-sint-maarten'),
(1760, '🇸🇾', ':flag-syria:', 'flag-syria'),
(1761, '🇸🇿', ':flag-eswatini:', 'flag-eswatini'),
(1762, '🇹🇦', ':flag-tristan-da-cunha:', 'flag-tristan-da-cunha'),
(1763, '🇹🇨', ':flag-turks-caicos-islands:', 'flag-turks-caicos-islands'),
(1764, '🇹🇩', ':flag-chad:', 'flag-chad'),
(1765, '🇹🇫', ':flag-french-southern-territories:', 'flag-french-southern-territories'),
(1766, '🇹🇬', ':flag-togo:', 'flag-togo'),
(1767, '🇹🇭', ':flag-thailand:', 'flag-thailand'),
(1768, '🇹🇯', ':flag-tajikistan:', 'flag-tajikistan'),
(1769, '🇹🇰', ':flag-tokelau:', 'flag-tokelau'),
(1770, '🇹🇱', ':flag-timor-leste:', 'flag-timor-leste'),
(1771, '🇹🇲', ':flag-turkmenistan:', 'flag-turkmenistan'),
(1772, '🇹🇳', ':flag-tunisia:', 'flag-tunisia'),
(1773, '🇹🇴', ':flag-tonga:', 'flag-tonga'),
(1774, '🇹🇷', ':flag-turkey:', 'flag-turkey'),
(1775, '🇹🇹', ':flag-trinidad-tobago:', 'flag-trinidad-tobago'),
(1776, '🇹🇻', ':flag-tuvalu:', 'flag-tuvalu'),
(1777, '🇹🇼', ':flag-taiwan:', 'flag-taiwan'),
(1778, '🇹🇿', ':flag-tanzania:', 'flag-tanzania'),
(1779, '🇺🇦', ':flag-ukraine:', 'flag-ukraine'),
(1780, '🇺🇬', ':flag-uganda:', 'flag-uganda'),
(1782, '🇺🇳', ':flag-united-nations:', 'flag-united-nations'),
(1783, '🇺🇸', ':flag-united-states:', 'flag-united-states'),
(1784, '🇺🇾', ':flag-uruguay:', 'flag-uruguay'),
(1785, '🇺🇿', ':flag-uzbekistan:', 'flag-uzbekistan'),
(1786, '🇻🇦', ':flag-vatican-city:', 'flag-vatican-city'),
(1787, '🇻🇪', ':flag-venezuela:', 'flag-venezuela'),
(1788, '🇻🇬', ':flag-british-virgin-islands:', 'flag-british-virgin-islands'),
(1790, '🇻🇳', ':flag-vietnam:', 'flag-vietnam'),
(1791, '🇻🇺', ':flag-vanuatu:', 'flag-vanuatu'),
(1792, '🇼🇫', ':flag-wallis-futuna:', 'flag-wallis-futuna'),
(1793, '🇼🇸', ':flag-samoa:', 'flag-samoa'),
(1794, '🇽🇰', ':flag-kosovo:', 'flag-kosovo'),
(1795, '🇾🇪', ':flag-yemen:', 'flag-yemen'),
(1796, '🇾🇹', ':flag-mayotte:', 'flag-mayotte'),
(1797, '🇿🇦', ':flag-south-africa:', 'flag-south-africa'),
(1798, '🇿🇲', ':flag-zambia:', 'flag-zambia'),
(1799, '🇿🇼', ':flag-zimbabwe:', 'flag-zimbabwe'),
(1800, '🏴󠁧󠁢󠁥󠁮󠁧󠁿', ':flag-england:', 'flag-england'),
(1801, '🏴󠁧󠁢󠁳󠁣󠁴󠁿', ':flag-scotland:', 'flag-scotland'),
(1802, '🏴󠁧󠁢󠁷󠁬󠁳󠁿', ':flag-wales:', 'flag-wales');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int UNSIGNED NOT NULL,
  `event_privacy` enum('secret','closed','public') DEFAULT 'public',
  `event_admin` int UNSIGNED NOT NULL,
  `event_category` int UNSIGNED NOT NULL,
  `event_title` varchar(256) NOT NULL,
  `event_location` varchar(256) DEFAULT NULL,
  `event_description` mediumtext NOT NULL,
  `event_start_date` datetime NOT NULL,
  `event_end_date` datetime NOT NULL,
  `event_publish_enabled` enum('0','1') NOT NULL DEFAULT '1',
  `event_publish_approval_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `event_cover` varchar(256) DEFAULT NULL,
  `event_cover_id` int UNSIGNED DEFAULT NULL,
  `event_cover_position` varchar(256) DEFAULT NULL,
  `event_album_covers` int DEFAULT NULL,
  `event_album_timeline` int DEFAULT NULL,
  `event_pinned_post` int DEFAULT NULL,
  `event_invited` int UNSIGNED NOT NULL DEFAULT '0',
  `event_interested` int UNSIGNED NOT NULL DEFAULT '0',
  `event_going` int UNSIGNED NOT NULL DEFAULT '0',
  `event_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `events_categories`
--

CREATE TABLE `events_categories` (
  `category_id` int UNSIGNED NOT NULL,
  `category_parent_id` int UNSIGNED NOT NULL,
  `category_name` varchar(256) NOT NULL,
  `category_description` text NOT NULL,
  `category_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `events_categories`
--

INSERT INTO `events_categories` (`category_id`, `category_parent_id`, `category_name`, `category_description`, `category_order`) VALUES
(1, 0, 'Art', '', 1),
(2, 0, 'Causes', '', 2),
(3, 0, 'Crafts', '', 3),
(4, 0, 'Dance', '', 4),
(5, 0, 'Drinks', '', 5),
(6, 0, 'Film', '', 6),
(7, 0, 'Fitness', '', 7),
(8, 0, 'Food', '', 8),
(9, 0, 'Games', '', 9),
(10, 0, 'Gardening', '', 10),
(11, 0, 'Health', '', 11),
(12, 0, 'Home', '', 12),
(13, 0, 'Literature', '', 13),
(14, 0, 'Music', '', 14),
(15, 0, 'Networking', '', 15),
(16, 0, 'Other', '', 16),
(17, 0, 'Party', '', 17),
(18, 0, 'Religion', '', 18),
(19, 0, 'Shopping', '', 19),
(20, 0, 'Sports', '', 20),
(21, 0, 'Theater', '', 21),
(22, 0, 'Wellness', '', 22);

-- --------------------------------------------------------

--
-- Table structure for table `events_members`
--

CREATE TABLE `events_members` (
  `id` int UNSIGNED NOT NULL,
  `event_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `is_invited` enum('0','1') DEFAULT '0',
  `is_interested` enum('0','1') DEFAULT '0',
  `is_going` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `followings`
--

CREATE TABLE `followings` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `following_id` int UNSIGNED NOT NULL,
  `points_earned` enum('0','1') NOT NULL DEFAULT '0',
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `followings`
--

INSERT INTO `followings` (`id`, `user_id`, `following_id`, `points_earned`, `time`) VALUES
(3, 3, 57, '0', '2023-01-15 14:52:09'),
(5, 1, 39, '0', '2023-01-16 06:49:04'),
(6, 1, 38, '0', '2023-01-16 06:49:14'),
(7, 1, 30, '0', '2023-01-16 06:52:15'),
(8, 1, 29, '0', '2023-01-16 06:52:16'),
(9, 1, 31, '0', '2023-01-16 06:52:17'),
(10, 1, 32, '0', '2023-01-16 06:52:17'),
(13, 75, 1, '0', '2023-01-20 00:06:24'),
(14, 1, 75, '0', '2023-01-20 00:11:20'),
(15, 4, 75, '0', '2023-01-25 23:54:03'),
(16, 4, 77, '0', '2023-01-25 23:54:04'),
(17, 77, 3, '0', '2023-01-25 23:58:56'),
(18, 77, 1, '0', '2023-01-25 23:58:59'),
(19, 77, 75, '0', '2023-01-25 23:59:05'),
(20, 75, 4, '0', '2023-01-25 23:59:28'),
(21, 75, 77, '0', '2023-01-25 23:59:29'),
(22, 1, 77, '0', '2023-01-25 23:59:56'),
(23, 77, 4, '0', '2023-01-26 00:31:56'),
(24, 80, 77, '0', '2023-02-06 22:38:32'),
(25, 81, 52, '0', '2023-03-06 10:09:12'),
(26, 81, 55, '0', '2023-03-06 10:09:58'),
(27, 81, 54, '0', '2023-03-06 10:10:02'),
(28, 81, 51, '0', '2023-03-06 10:10:45');

-- --------------------------------------------------------

--
-- Table structure for table `forums`
--

CREATE TABLE `forums` (
  `forum_id` int UNSIGNED NOT NULL,
  `forum_section` int UNSIGNED NOT NULL,
  `forum_name` varchar(256) NOT NULL,
  `forum_description` mediumtext,
  `forum_order` int UNSIGNED NOT NULL DEFAULT '1',
  `forum_threads` int UNSIGNED NOT NULL DEFAULT '0',
  `forum_replies` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `forums_replies`
--

CREATE TABLE `forums_replies` (
  `reply_id` int UNSIGNED NOT NULL,
  `thread_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `text` longtext NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `forums_threads`
--

CREATE TABLE `forums_threads` (
  `thread_id` int UNSIGNED NOT NULL,
  `forum_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `title` varchar(256) NOT NULL,
  `text` longtext NOT NULL,
  `replies` int UNSIGNED NOT NULL DEFAULT '0',
  `views` int UNSIGNED NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  `last_reply` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int UNSIGNED NOT NULL,
  `user_one_id` int UNSIGNED NOT NULL,
  `user_two_id` int UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `user_one_id`, `user_two_id`, `status`) VALUES
(2, 1, 2, 0),
(3, 1, 38, 0),
(4, 1, 39, 0),
(5, 1, 30, 0),
(6, 1, 29, 0),
(7, 1, 31, 0),
(8, 1, 32, 0),
(11, 75, 1, 1),
(12, 4, 75, 1),
(13, 4, 77, 1),
(14, 77, 3, 0),
(15, 77, 1, 1),
(16, 77, 75, 1),
(17, 80, 77, 0),
(18, 81, 52, 0),
(19, 81, 55, 0),
(20, 81, 54, 0),
(21, 81, 51, 0);

-- --------------------------------------------------------

--
-- Table structure for table `funding_payments`
--

CREATE TABLE `funding_payments` (
  `payment_id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `amount` varchar(32) NOT NULL,
  `method` varchar(64) NOT NULL,
  `method_value` text NOT NULL,
  `time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `game_id` int NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` mediumtext NOT NULL,
  `source` mediumtext NOT NULL,
  `thumbnail` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `games_players`
--

CREATE TABLE `games_players` (
  `id` int UNSIGNED NOT NULL,
  `game_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `last_played_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `gift_id` int UNSIGNED NOT NULL,
  `image` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` int UNSIGNED NOT NULL,
  `group_privacy` enum('secret','closed','public') DEFAULT 'public',
  `group_admin` int UNSIGNED NOT NULL,
  `group_category` int UNSIGNED NOT NULL,
  `group_name` varchar(64) NOT NULL,
  `group_title` varchar(256) NOT NULL,
  `group_description` mediumtext NOT NULL,
  `group_publish_enabled` enum('0','1') NOT NULL DEFAULT '1',
  `group_publish_approval_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `group_picture` varchar(256) DEFAULT NULL,
  `group_picture_id` int UNSIGNED DEFAULT NULL,
  `group_cover` varchar(256) DEFAULT NULL,
  `group_cover_id` int UNSIGNED DEFAULT NULL,
  `group_cover_position` varchar(256) DEFAULT NULL,
  `group_album_pictures` int DEFAULT NULL,
  `group_album_covers` int DEFAULT NULL,
  `group_album_timeline` int DEFAULT NULL,
  `group_pinned_post` int DEFAULT NULL,
  `group_members` int UNSIGNED NOT NULL DEFAULT '0',
  `group_monetization_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `group_monetization_price` float NOT NULL DEFAULT '0',
  `group_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `group_privacy`, `group_admin`, `group_category`, `group_name`, `group_title`, `group_description`, `group_publish_enabled`, `group_publish_approval_enabled`, `group_picture`, `group_picture_id`, `group_cover`, `group_cover_id`, `group_cover_position`, `group_album_pictures`, `group_album_covers`, `group_album_timeline`, `group_pinned_post`, `group_members`, `group_monetization_enabled`, `group_monetization_price`, `group_date`) VALUES
(1, 'public', 1, 9, 'pkanaan_BznT', 'عبدالباسط', 'عبدالباسط', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '0', 0, '2023-01-15 14:02:13'),
(2, 'public', 1, 9, 'samer_qasem_zq11', 'محسن', 'محسن', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:13'),
(3, 'public', 1, 9, 'vqawasmee_7nbs', 'بشير', 'بشير', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:13'),
(4, 'public', 1, 9, 'onimry_1Cqt', 'مشهور', 'مشهور', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:13'),
(5, 'public', 1, 9, 'yazan_shami_qeva', 'رامين', 'رامين', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:13'),
(6, 'public', 1, 9, 'mrabee_ESbq', 'جبير', 'جبير', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:13'),
(7, 'public', 1, 9, 'karam_mutaz_CRWJ', 'توفيق', 'توفيق', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:13'),
(8, 'public', 1, 9, 'hamad_ahmad_Be69', 'كاظم', 'كاظم', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:13'),
(9, 'public', 1, 9, 'fnimry_mpUJ', 'أكثم', 'أكثم', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:13'),
(10, 'public', 1, 9, 'hamad_samer_NcEF', 'مؤيد', 'مؤيد', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:13'),
(11, 'public', 1, 9, 'fadi06_hkTO', 'غسان', 'غسان', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:19'),
(12, 'public', 1, 9, 'abdullah_qasem_e9Is', 'اسماعيل', 'اسماعيل', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:19'),
(13, 'public', 1, 9, 'zaloum_sami_OIdi', 'يونس', 'يونس', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:19'),
(14, 'public', 1, 9, 'maanee_akram_1sqR', 'غانم', 'غانم', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:19'),
(15, 'public', 1, 9, 'yazan_obaisi_Sgej', 'منصف', 'منصف', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:19'),
(16, 'public', 1, 9, 'abd69_YJ8u', 'زاهر', 'زاهر', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:19'),
(17, 'public', 1, 9, 'mhasan_vbAN', 'شاهر', 'شاهر', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:19'),
(18, 'public', 1, 9, 'akanaan_UEDe', 'أوس', 'أوس', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:19'),
(19, 'public', 1, 9, 'rami_karam_OqfB', 'يسار', 'يسار', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:19'),
(20, 'public', 1, 9, 'abbad_mutaz_HOzW', 'اشراف', 'اشراف', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-01-15 14:02:19');

-- --------------------------------------------------------

--
-- Table structure for table `groups_admins`
--

CREATE TABLE `groups_admins` (
  `id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `groups_admins`
--

INSERT INTO `groups_admins` (`id`, `group_id`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `groups_categories`
--

CREATE TABLE `groups_categories` (
  `category_id` int UNSIGNED NOT NULL,
  `category_parent_id` int UNSIGNED NOT NULL,
  `category_name` varchar(256) NOT NULL,
  `category_description` text NOT NULL,
  `category_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `groups_categories`
--

INSERT INTO `groups_categories` (`category_id`, `category_parent_id`, `category_name`, `category_description`, `category_order`) VALUES
(1, 0, 'Cars and Vehicles', '', 1),
(2, 0, 'Comedy', '', 2),
(3, 0, 'Economics and Trade', '', 3),
(4, 0, 'Education', '', 4),
(5, 0, 'Entertainment', '', 5),
(6, 0, 'Movies and Animation', '', 6),
(7, 0, 'Gaming', '', 7),
(8, 0, 'History and Facts', '', 8),
(9, 0, 'Live Style', '', 9),
(10, 0, 'Natural', '', 10),
(11, 0, 'News and Politics', '', 11),
(12, 0, 'People and Nations', '', 12),
(13, 0, 'Pets and Animals', '', 13),
(14, 0, 'Places and Regions', '', 14),
(15, 0, 'Science and Technology', '', 15),
(16, 0, 'Sport', '', 16),
(17, 0, 'Travel and Events', '', 17),
(18, 0, 'Other', '', 18);

-- --------------------------------------------------------

--
-- Table structure for table `groups_members`
--

CREATE TABLE `groups_members` (
  `id` int UNSIGNED NOT NULL,
  `group_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `approved` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `groups_members`
--

INSERT INTO `groups_members` (`id`, `group_id`, `user_id`, `approved`) VALUES
(1, 1, 1, '1'),
(2, 2, 1, '1'),
(3, 3, 1, '1'),
(4, 4, 1, '1'),
(5, 5, 1, '1'),
(6, 6, 1, '1'),
(7, 7, 1, '1'),
(8, 8, 1, '1'),
(9, 9, 1, '1'),
(10, 10, 1, '1'),
(11, 11, 1, '1'),
(12, 12, 1, '1'),
(13, 13, 1, '1'),
(14, 14, 1, '1'),
(15, 15, 1, '1'),
(16, 16, 1, '1'),
(17, 17, 1, '1'),
(18, 18, 1, '1'),
(19, 19, 1, '1'),
(20, 20, 1, '1'),
(21, 1, 75, '1');

-- --------------------------------------------------------

--
-- Table structure for table `hashtags`
--

CREATE TABLE `hashtags` (
  `hashtag_id` int UNSIGNED NOT NULL,
  `hashtag` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hashtags_posts`
--

CREATE TABLE `hashtags_posts` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `hashtag_id` int UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `invitation_codes`
--

CREATE TABLE `invitation_codes` (
  `code_id` int UNSIGNED NOT NULL,
  `code` varchar(64) NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `created_date` datetime NOT NULL,
  `used_by` int UNSIGNED DEFAULT NULL,
  `used_date` datetime DEFAULT NULL,
  `used` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `invitation_codes`
--

INSERT INTO `invitation_codes` (`code_id`, `code`, `created_by`, `created_date`, `used_by`, `used_date`, `used`) VALUES
(1, 'LhR664JE', 75, '2023-01-21 00:04:24', 76, '2023-01-24 23:39:52', '1'),
(2, 'L0MO712D', 75, '2023-01-21 00:06:02', 77, '2023-01-25 23:51:50', '1'),
(3, 'IoWQ419y', 75, '2023-01-24 23:11:19', NULL, NULL, '0'),
(4, 'K8s6jwBS', 75, '2023-01-24 23:12:48', NULL, NULL, '0'),
(5, 'FRnJmSQD', 75, '2023-01-24 23:19:28', NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `jobs_categories`
--

CREATE TABLE `jobs_categories` (
  `category_id` int UNSIGNED NOT NULL,
  `category_parent_id` int UNSIGNED NOT NULL,
  `category_name` varchar(256) NOT NULL,
  `category_description` text NOT NULL,
  `category_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jobs_categories`
--

INSERT INTO `jobs_categories` (`category_id`, `category_parent_id`, `category_name`, `category_description`, `category_order`) VALUES
(1, 0, 'Admin &amp; Office', '', 1),
(2, 0, 'Art &amp; Design', '', 2),
(3, 0, 'Business Operations', '', 3),
(4, 0, 'Cleaning &amp; Facilities', '', 4),
(5, 0, 'Community &amp; Social Services', '', 5),
(6, 0, 'Computer &amp; Data', '', 6),
(7, 0, 'Construction &amp; Mining', '', 7),
(8, 0, 'Education', '', 8),
(9, 0, 'Farming &amp; Forestry', '', 9),
(10, 0, 'Healthcare', '', 10),
(11, 0, 'Installation, Maintenance &amp; Repair', '', 11),
(12, 0, 'Legal', '', 12),
(13, 0, 'Management', '', 13),
(14, 0, 'Manufacturing', '', 14),
(15, 0, 'Media &amp; Communication', '', 15),
(16, 0, 'Personal Care', '', 16),
(17, 0, 'Protective Services', '', 17),
(18, 0, 'Restaurant &amp; Hospitality', '', 18),
(19, 0, 'Retail &amp; Sales', '', 19),
(20, 0, 'Science &amp; Engineering', '', 20),
(21, 0, 'Sports &amp; Entertainment', '', 21),
(22, 0, 'Transportation', '', 22),
(23, 0, 'Other', '', 23);

-- --------------------------------------------------------

--
-- Table structure for table `market_categories`
--

CREATE TABLE `market_categories` (
  `category_id` int UNSIGNED NOT NULL,
  `category_parent_id` int UNSIGNED NOT NULL,
  `category_name` varchar(256) NOT NULL,
  `category_description` text NOT NULL,
  `category_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `market_categories`
--

INSERT INTO `market_categories` (`category_id`, `category_parent_id`, `category_name`, `category_description`, `category_order`) VALUES
(1, 0, 'Apparel &amp; Accessories', '', 1),
(2, 0, 'Autos &amp; Vehicles', '', 2),
(3, 0, 'Baby &amp; Children&#039;s Products', '', 3),
(4, 0, 'Beauty Products &amp; Services', '', 4),
(5, 0, 'Computers &amp; Peripherals', '', 5),
(6, 0, 'Consumer Electronics', '', 6),
(7, 0, 'Dating Services', '', 7),
(8, 0, 'Financial Services', '', 8),
(9, 0, 'Gifts &amp; Occasions', '', 9),
(10, 0, 'Home &amp; Garden', '', 10),
(11, 0, 'Other', '', 11);

-- --------------------------------------------------------

--
-- Table structure for table `monetization_payments`
--

CREATE TABLE `monetization_payments` (
  `payment_id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `amount` varchar(32) NOT NULL,
  `method` varchar(64) NOT NULL,
  `method_value` text NOT NULL,
  `time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int UNSIGNED NOT NULL,
  `source` text NOT NULL,
  `source_type` varchar(64) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` text,
  `imdb_url` text,
  `stars` text,
  `release_year` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `genres` mediumtext,
  `poster` varchar(256) DEFAULT NULL,
  `views` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `movies_genres`
--

CREATE TABLE `movies_genres` (
  `genre_id` int UNSIGNED NOT NULL,
  `genre_name` varchar(256) NOT NULL,
  `genre_description` text NOT NULL,
  `genre_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `movies_genres`
--

INSERT INTO `movies_genres` (`genre_id`, `genre_name`, `genre_description`, `genre_order`) VALUES
(1, 'Action', '', 1),
(2, 'Adventure', '', 2),
(3, 'Animation', '', 3),
(4, 'Comedy', '', 4),
(5, 'Crime', '', 5),
(6, 'Documentary', '', 6),
(7, 'Drama', '', 7),
(8, 'Family', '', 8),
(9, 'Fantasy', '', 9),
(10, 'History', '', 10),
(11, 'Horror', '', 11),
(12, 'Musical', '', 12),
(13, 'Mythological', '', 13),
(14, 'Romance', '', 14),
(15, 'Sport', '', 15),
(16, 'TV Show', '', 16),
(17, 'Thriller', '', 17),
(18, 'War', '', 18);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int UNSIGNED NOT NULL,
  `to_user_id` int UNSIGNED NOT NULL,
  `from_user_id` int UNSIGNED NOT NULL,
  `from_user_type` enum('user','page') NOT NULL DEFAULT 'user',
  `action` varchar(256) NOT NULL,
  `node_type` varchar(256) NOT NULL,
  `node_url` varchar(256) NOT NULL,
  `notify_id` varchar(256) DEFAULT NULL,
  `message` mediumtext,
  `time` datetime DEFAULT NULL,
  `seen` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `to_user_id`, `from_user_id`, `from_user_type`, `action`, `node_type`, `node_url`, `notify_id`, `message`, `time`, `seen`) VALUES
(1, 1, 1, 'user', 'async_request', '', '', '', '10 الملفات التي تم تحميلها بنجاح', '2023-01-15 14:01:31', '1'),
(2, 1, 1, 'user', 'async_request', '', '', '', '10 الملفات التي تم تحميلها بنجاح', '2023-01-15 14:02:13', '1'),
(3, 1, 1, 'user', 'async_request', '', '', '', '10 الملفات التي تم تحميلها بنجاح', '2023-01-15 14:02:19', '1'),
(4, 1, 1, 'user', 'async_request', '', '', '', '10 الملفات التي تم تحميلها بنجاح', '2023-01-15 14:02:32', '1'),
(5, 1, 1, 'user', 'async_request', '', '', '', '50 الملفات التي تم تحميلها بنجاح', '2023-01-15 14:02:54', '1'),
(8, 2, 1, 'user', 'friend_add', '', 'alahdal262', '', '', '2023-01-15 14:40:26', '1'),
(10, 57, 3, 'user', 'follow', '', '', '', '', '2023-01-15 14:52:09', '0'),
(11, 38, 1, 'user', 'friend_add', '', 'alahdal262', '', '', '2023-01-16 06:48:59', '0'),
(13, 39, 1, 'user', 'friend_add', '', 'alahdal262', '', '', '2023-01-16 06:49:04', '0'),
(14, 39, 1, 'user', 'follow', '', '', '', '', '2023-01-16 06:49:04', '0'),
(15, 38, 1, 'user', 'profile_visit', '', '', '', '', '2023-01-16 06:49:06', '0'),
(16, 38, 1, 'user', 'follow', '', '', '', '', '2023-01-16 06:49:14', '0'),
(17, 38, 1, 'user', 'profile_visit', '', '', '', '', '2023-01-16 06:49:58', '0'),
(18, 30, 1, 'user', 'friend_add', '', 'alahdal262', '', '', '2023-01-16 06:52:15', '0'),
(19, 30, 1, 'user', 'follow', '', '', '', '', '2023-01-16 06:52:15', '0'),
(20, 29, 1, 'user', 'friend_add', '', 'alahdal262', '', '', '2023-01-16 06:52:16', '0'),
(21, 29, 1, 'user', 'follow', '', '', '', '', '2023-01-16 06:52:16', '0'),
(22, 31, 1, 'user', 'friend_add', '', 'alahdal262', '', '', '2023-01-16 06:52:17', '0'),
(23, 31, 1, 'user', 'follow', '', '', '', '', '2023-01-16 06:52:17', '0'),
(24, 32, 1, 'user', 'friend_add', '', 'alahdal262', '', '', '2023-01-16 06:52:17', '0'),
(25, 32, 1, 'user', 'follow', '', '', '', '', '2023-01-16 06:52:17', '0'),
(26, 1, 3, 'user', 'profile_visit', '', '', '', '', '2023-01-16 15:59:07', '1'),
(27, 1, 1, 'user', 'async_request', '', '', '', 'New backup has been generated', '2023-01-16 17:17:03', '1'),
(28, 75, 1, 'user', 'profile_visit', '', '', '', '', '2023-01-19 23:44:19', '1'),
(29, 1, 75, 'user', 'profile_visit', '', '', '', '', '2023-01-20 00:01:48', '1'),
(32, 1, 75, 'user', 'profile_visit', '', '', '', '', '2023-01-20 00:02:21', '1'),
(35, 1, 75, 'user', 'friend_add', '', 'ez77', '', '', '2023-01-20 00:06:24', '1'),
(36, 1, 75, 'user', 'follow', '', '', '', '', '2023-01-20 00:06:24', '1'),
(37, 1, 75, 'user', 'vote', 'post', '14', '', '', '2023-01-20 00:09:32', '1'),
(38, 75, 1, 'user', 'friend_accept', '', 'alahdal262', '', '', '2023-01-20 00:11:20', '1'),
(39, 75, 1, 'user', 'follow', '', '', '', '', '2023-01-20 00:11:20', '1'),
(40, 75, 1, 'user', 'page_invitation', 'مركز صنعاء للابحاث', 'sanaacenter', '', '', '2023-01-20 00:12:39', '1'),
(41, 2, 1, 'user', 'profile_visit', '', '', '', '', '2023-01-25 23:51:51', '1'),
(42, 75, 4, 'user', 'friend_add', '', 'sama', '', '', '2023-01-25 23:54:03', '1'),
(43, 75, 4, 'user', 'follow', '', '', '', '', '2023-01-25 23:54:03', '1'),
(44, 77, 4, 'user', 'friend_add', '', 'sama', '', '', '2023-01-25 23:54:04', '1'),
(45, 77, 4, 'user', 'follow', '', '', '', '', '2023-01-25 23:54:04', '1'),
(46, 75, 4, 'user', 'profile_visit', '', '', '', '', '2023-01-25 23:54:06', '1'),
(47, 1, 4, 'user', 'report', '', '', '', '', '2023-01-25 23:54:51', '1'),
(48, 3, 4, 'user', 'report', '', '', '', '', '2023-01-25 23:54:51', '0'),
(49, 75, 4, 'user', 'report', '', '', '', '', '2023-01-25 23:54:51', '1'),
(50, 3, 77, 'user', 'friend_add', '', 'ezzatmustafa', '', '', '2023-01-25 23:58:56', '0'),
(51, 3, 77, 'user', 'follow', '', '', '', '', '2023-01-25 23:58:56', '0'),
(52, 1, 77, 'user', 'friend_add', '', 'ezzatmustafa', '', '', '2023-01-25 23:58:59', '1'),
(53, 1, 77, 'user', 'follow', '', '', '', '', '2023-01-25 23:58:59', '1'),
(54, 75, 77, 'user', 'friend_add', '', 'ezzatmustafa', '', '', '2023-01-25 23:59:05', '1'),
(55, 75, 77, 'user', 'follow', '', '', '', '', '2023-01-25 23:59:05', '1'),
(56, 77, 1, 'user', 'profile_visit', '', '', '', '', '2023-01-25 23:59:10', '1'),
(57, 4, 75, 'user', 'friend_accept', '', 'ez77', '', '', '2023-01-25 23:59:28', '0'),
(58, 4, 75, 'user', 'follow', '', '', '', '', '2023-01-25 23:59:28', '0'),
(59, 77, 75, 'user', 'friend_accept', '', 'ez77', '', '', '2023-01-25 23:59:29', '1'),
(60, 77, 75, 'user', 'follow', '', '', '', '', '2023-01-25 23:59:29', '1'),
(61, 77, 1, 'user', 'profile_visit', '', '', '', '', '2023-01-25 23:59:51', '1'),
(62, 77, 1, 'user', 'friend_accept', '', 'alahdal262', '', '', '2023-01-25 23:59:56', '1'),
(63, 77, 1, 'user', 'follow', '', '', '', '', '2023-01-25 23:59:56', '1'),
(64, 77, 1, 'user', 'profile_visit', '', '', '', '', '2023-01-26 00:00:00', '1'),
(65, 77, 1, 'user', 'profile_visit', '', '', '', '', '2023-01-26 00:00:05', '1'),
(66, 4, 77, 'user', 'friend_accept', '', 'ezzatmustafa', '', '', '2023-01-26 00:31:56', '0'),
(67, 4, 77, 'user', 'follow', '', '', '', '', '2023-01-26 00:31:56', '0'),
(68, 3, 77, 'user', 'vote', 'post', '13', '', '', '2023-01-26 00:32:14', '0'),
(69, 77, 75, 'user', 'profile_visit', '', '', '', '', '2023-01-26 00:39:13', '1'),
(70, 77, 75, 'user', 'page_invitation', 'Sana&amp;aacute; Center for Researchs', 'sanaacenter', '', '', '2023-01-27 20:08:17', '1'),
(71, 1, 75, 'user', 'page_invitation', 'Fanar', 'fan', '', '', '2023-01-28 02:19:10', '1'),
(73, 1, 75, 'user', 'report', '', '', '', '', '2023-02-06 22:28:19', '1'),
(74, 3, 75, 'user', 'report', '', '', '', '', '2023-02-06 22:28:19', '0'),
(75, 77, 75, 'user', 'report', '', '', '', '', '2023-02-06 22:28:19', '1'),
(76, 1, 75, 'user', 'report', '', '', '', '', '2023-02-06 22:31:39', '1'),
(77, 3, 75, 'user', 'report', '', '', '', '', '2023-02-06 22:31:39', '0'),
(78, 77, 75, 'user', 'report', '', '', '', '', '2023-02-06 22:31:39', '1'),
(79, 1, 80, 'user', 'report', '', '', '', '', '2023-02-06 22:31:49', '1'),
(80, 3, 80, 'user', 'report', '', '', '', '', '2023-02-06 22:31:49', '0'),
(81, 77, 80, 'user', 'report', '', '', '', '', '2023-02-06 22:31:49', '1'),
(82, 1, 75, 'user', 'report', '', '', '', '', '2023-02-06 22:35:20', '1'),
(83, 3, 75, 'user', 'report', '', '', '', '', '2023-02-06 22:35:20', '0'),
(84, 77, 75, 'user', 'report', '', '', '', '', '2023-02-06 22:35:20', '1'),
(86, 3, 1, 'user', 'vote', 'post', '13', '', '', '2023-02-06 22:37:50', '0'),
(87, 77, 80, 'user', 'friend_add', '', 'nada', '', '', '2023-02-06 22:38:32', '1'),
(88, 77, 80, 'user', 'follow', '', '', '', '', '2023-02-06 22:38:32', '1'),
(89, 1, 2, 'user', 'profile_visit', '', '', '', '', '2023-02-28 06:13:39', '1'),
(90, 5, 2, 'user', 'profile_visit', '', '', '', '', '2023-02-28 06:14:53', '0'),
(91, 52, 81, 'user', 'friend_add', '', 'test', '', '', '2023-03-06 10:09:12', '0'),
(92, 52, 81, 'user', 'follow', '', '', '', '', '2023-03-06 10:09:12', '0'),
(93, 55, 81, 'user', 'friend_add', '', 'test', '', '', '2023-03-06 10:09:58', '0'),
(94, 55, 81, 'user', 'follow', '', '', '', '', '2023-03-06 10:09:58', '0'),
(95, 54, 81, 'user', 'friend_add', '', 'test', '', '', '2023-03-06 10:10:02', '0'),
(96, 54, 81, 'user', 'follow', '', '', '', '', '2023-03-06 10:10:02', '0'),
(97, 51, 81, 'user', 'friend_add', '', 'test', '', '', '2023-03-06 10:10:45', '0'),
(98, 51, 81, 'user', 'follow', '', '', '', '', '2023-03-06 10:10:45', '0');

-- --------------------------------------------------------

--
-- Table structure for table `offers_categories`
--

CREATE TABLE `offers_categories` (
  `category_id` int UNSIGNED NOT NULL,
  `category_parent_id` int UNSIGNED NOT NULL,
  `category_name` varchar(256) NOT NULL,
  `category_description` text NOT NULL,
  `category_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `offers_categories`
--

INSERT INTO `offers_categories` (`category_id`, `category_parent_id`, `category_name`, `category_description`, `category_order`) VALUES
(1, 0, 'Apparel &amp; Accessories', '', 1),
(2, 0, 'Autos &amp; Vehicles', '', 2),
(3, 0, 'Baby &amp; Children&#039;s Products', '', 3),
(4, 0, 'Beauty Products &amp; Services', '', 4),
(5, 0, 'Computers &amp; Peripherals', '', 5),
(6, 0, 'Consumer Electronics', '', 6),
(7, 0, 'Dating Services', '', 7),
(8, 0, 'Financial Services', '', 8),
(9, 0, 'Gifts &amp; Occasions', '', 9),
(10, 0, 'Home &amp; Garden', '', 10),
(11, 0, 'Other', '', 11);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `package_id` int NOT NULL,
  `name` varchar(256) NOT NULL,
  `price` varchar(32) NOT NULL,
  `period_num` int UNSIGNED NOT NULL,
  `period` varchar(32) NOT NULL,
  `color` varchar(32) NOT NULL,
  `icon` varchar(256) NOT NULL,
  `verification_badge_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `boost_posts_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `boost_posts` int UNSIGNED NOT NULL,
  `boost_pages_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `boost_pages` int UNSIGNED NOT NULL,
  `custom_description` text,
  `package_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `packages_payments`
--

CREATE TABLE `packages_payments` (
  `payment_id` int NOT NULL,
  `payment_date` datetime NOT NULL,
  `package_name` varchar(256) NOT NULL,
  `package_price` float UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int UNSIGNED NOT NULL,
  `page_admin` int UNSIGNED NOT NULL,
  `page_category` int UNSIGNED NOT NULL,
  `page_name` varchar(64) NOT NULL,
  `page_title` varchar(256) NOT NULL,
  `page_picture` varchar(256) DEFAULT NULL,
  `page_picture_id` int UNSIGNED DEFAULT NULL,
  `page_cover` varchar(256) DEFAULT NULL,
  `page_cover_id` int UNSIGNED DEFAULT NULL,
  `page_cover_position` varchar(256) DEFAULT NULL,
  `page_album_pictures` int UNSIGNED DEFAULT NULL,
  `page_album_covers` int UNSIGNED DEFAULT NULL,
  `page_album_timeline` int UNSIGNED DEFAULT NULL,
  `page_pinned_post` int UNSIGNED DEFAULT NULL,
  `page_verified` enum('0','1') NOT NULL DEFAULT '0',
  `page_boosted` enum('0','1') NOT NULL DEFAULT '0',
  `page_boosted_by` int UNSIGNED DEFAULT NULL,
  `page_company` varchar(256) DEFAULT NULL,
  `page_phone` varchar(256) DEFAULT NULL,
  `page_website` varchar(256) DEFAULT NULL,
  `page_location` varchar(256) DEFAULT NULL,
  `page_country` int UNSIGNED NOT NULL,
  `page_description` mediumtext NOT NULL,
  `page_action_text` varchar(32) DEFAULT NULL,
  `page_action_color` varchar(32) DEFAULT NULL,
  `page_action_url` varchar(256) DEFAULT NULL,
  `page_social_facebook` varchar(256) DEFAULT NULL,
  `page_social_twitter` varchar(256) DEFAULT NULL,
  `page_social_youtube` varchar(256) DEFAULT NULL,
  `page_social_instagram` varchar(256) DEFAULT NULL,
  `page_social_linkedin` varchar(256) DEFAULT NULL,
  `page_social_vkontakte` varchar(256) DEFAULT NULL,
  `page_likes` int UNSIGNED NOT NULL DEFAULT '0',
  `page_monetization_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `page_monetization_price` float NOT NULL DEFAULT '0',
  `page_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page_admin`, `page_category`, `page_name`, `page_title`, `page_picture`, `page_picture_id`, `page_cover`, `page_cover_id`, `page_cover_position`, `page_album_pictures`, `page_album_covers`, `page_album_timeline`, `page_pinned_post`, `page_verified`, `page_boosted`, `page_boosted_by`, `page_company`, `page_phone`, `page_website`, `page_location`, `page_country`, `page_description`, `page_action_text`, `page_action_color`, `page_action_url`, `page_social_facebook`, `page_social_twitter`, `page_social_youtube`, `page_social_instagram`, `page_social_linkedin`, `page_social_vkontakte`, `page_likes`, `page_monetization_enabled`, `page_monetization_price`, `page_date`) VALUES
(1, 1, 11, 'sanaacenter', 'Sana&aacute; Center for Researchs', 'photos/2023/01/Polex_e2bd788f0e3862a0b56aaa0c23cd1dd6_cropped.png', 12, 'photos/2023/01/Polex_864cfd7938dc19f436783122f41fdaa4_cropped.jpg', 13, '-245px', 3, 4, NULL, NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, 242, 'مركز صنعاء للدراسات والابحاث يهتم بالبحوث السياسية والاجتماعية ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, '0', 0, '2023-01-15 14:24:51'),
(2, 1, 4, 'IRAQCENTER', 'IRAQ CENTER FOR RESEARCH', 'photos/2023/01/Polex_4a461bb035199e5ed54932d73f73fcc4_cropped.png', 14, NULL, NULL, '0px', 5, 6, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, 103, 'IRAQ FOR RESEARCH ABOUT EDUCATION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '0', 0, '2023-01-16 09:43:45'),
(3, 75, 4, 'fan', 'Fanar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, 242, 'مركز فنار', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '0', 0, '2023-01-28 02:17:59'),
(4, 1, 4, 'human', 'الحقوق والحريات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, 242, 'مركز يهتم بالحقوق والحريات ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0', 0, '2023-02-06 13:55:18');

-- --------------------------------------------------------

--
-- Table structure for table `pages_admins`
--

CREATE TABLE `pages_admins` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pages_admins`
--

INSERT INTO `pages_admins` (`id`, `page_id`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 75),
(5, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages_categories`
--

CREATE TABLE `pages_categories` (
  `category_id` int UNSIGNED NOT NULL,
  `category_parent_id` int UNSIGNED NOT NULL,
  `category_name` varchar(256) NOT NULL,
  `category_description` text NOT NULL,
  `category_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pages_categories`
--

INSERT INTO `pages_categories` (`category_id`, `category_parent_id`, `category_name`, `category_description`, `category_order`) VALUES
(1, 0, 'Cars and Vehicles', '', 1),
(2, 0, 'Comedy', '', 2),
(3, 0, 'Economics and Trade', '', 3),
(4, 0, 'Education', '', 4),
(5, 0, 'Entertainment', '', 5),
(6, 0, 'Movies and Animation', '', 6),
(7, 0, 'Gaming', '', 7),
(8, 0, 'History and Facts', '', 8),
(9, 0, 'Live Style', '', 9),
(10, 0, 'Natural', '', 10),
(11, 0, 'News and Politics', '', 11),
(12, 0, 'People and Nations', '', 12),
(13, 0, 'Pets and Animals', '', 13),
(14, 0, 'Places and Regions', '', 14),
(15, 0, 'Science and Technology', '', 15),
(16, 0, 'Sport', '', 16),
(17, 0, 'Travel and Events', '', 17),
(18, 0, 'Other', '', 18);

-- --------------------------------------------------------

--
-- Table structure for table `pages_invites`
--

CREATE TABLE `pages_invites` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `from_user_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pages_invites`
--

INSERT INTO `pages_invites` (`id`, `page_id`, `user_id`, `from_user_id`) VALUES
(1, 1, 75, 1),
(2, 1, 77, 75),
(3, 3, 1, 75);

-- --------------------------------------------------------

--
-- Table structure for table `pages_likes`
--

CREATE TABLE `pages_likes` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pages_likes`
--

INSERT INTO `pages_likes` (`id`, `page_id`, `user_id`) VALUES
(1, 1, 1),
(2, 1, 3),
(6, 1, 4),
(4, 1, 75),
(3, 2, 1),
(5, 2, 4),
(8, 3, 75),
(10, 3, 77),
(11, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `points_payments`
--

CREATE TABLE `points_payments` (
  `payment_id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `amount` varchar(32) NOT NULL,
  `method` varchar(64) NOT NULL,
  `method_value` text NOT NULL,
  `time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `user_type` enum('user','page') NOT NULL,
  `in_group` enum('0','1') NOT NULL DEFAULT '0',
  `group_id` int UNSIGNED DEFAULT NULL,
  `group_approved` enum('0','1') NOT NULL DEFAULT '1',
  `in_event` enum('0','1') NOT NULL DEFAULT '0',
  `event_id` int UNSIGNED DEFAULT NULL,
  `event_approved` enum('0','1') NOT NULL DEFAULT '1',
  `in_wall` enum('0','1') NOT NULL DEFAULT '0',
  `wall_id` int UNSIGNED DEFAULT NULL,
  `post_type` varchar(32) NOT NULL,
  `colored_pattern` int UNSIGNED DEFAULT NULL,
  `origin_id` int UNSIGNED DEFAULT NULL,
  `time` datetime NOT NULL,
  `location` varchar(256) DEFAULT NULL,
  `privacy` varchar(32) NOT NULL,
  `text` longtext,
  `feeling_action` varchar(32) DEFAULT NULL,
  `feeling_value` varchar(256) DEFAULT NULL,
  `boosted` enum('0','1') NOT NULL DEFAULT '0',
  `boosted_by` int UNSIGNED DEFAULT NULL,
  `comments_disabled` enum('0','1') NOT NULL DEFAULT '0',
  `is_hidden` enum('0','1') NOT NULL DEFAULT '0',
  `is_anonymous` enum('0','1') NOT NULL DEFAULT '0',
  `reaction_like_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_love_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_haha_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_yay_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_wow_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_sad_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_angry_count` int UNSIGNED NOT NULL DEFAULT '0',
  `comments` int UNSIGNED NOT NULL DEFAULT '0',
  `shares` int UNSIGNED NOT NULL DEFAULT '0',
  `views` int UNSIGNED NOT NULL DEFAULT '0',
  `points_earned` enum('0','1') NOT NULL DEFAULT '0',
  `processing` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `user_type`, `in_group`, `group_id`, `group_approved`, `in_event`, `event_id`, `event_approved`, `in_wall`, `wall_id`, `post_type`, `colored_pattern`, `origin_id`, `time`, `location`, `privacy`, `text`, `feeling_action`, `feeling_value`, `boosted`, `boosted_by`, `comments_disabled`, `is_hidden`, `is_anonymous`, `reaction_like_count`, `reaction_love_count`, `reaction_haha_count`, `reaction_yay_count`, `reaction_wow_count`, `reaction_sad_count`, `reaction_angry_count`, `comments`, `shares`, `views`, `points_earned`, `processing`) VALUES
(6, 3, 'user', '0', 0, '0', '0', 0, '0', '0', 0, 'link', 0, NULL, '2023-01-15 14:18:55', '', 'public', '', '', '', '0', NULL, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 154, '0', '0'),
(12, 1, 'user', '0', 0, '0', '0', 0, '0', '0', 0, '', 0, NULL, '2023-01-15 14:39:36', '', 'public', 'بحب ان اعيش حياه جميلة ', 'Listening To', 'ام كلثوم ', '0', NULL, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 274, '0', '0'),
(13, 3, 'user', '0', 0, '0', '0', 0, '0', '0', 0, 'poll', 0, NULL, '2023-01-15 14:56:06', '', 'public', 'هل تتوقع نجاح الجهود الأممية في تمديد الهدنة في اليمن؟', '', '', '0', NULL, '0', '0', '0', 0, 1, 0, 0, 0, 0, 0, 0, 0, 187, '0', '0'),
(14, 1, 'user', '0', 0, '0', '0', 0, '0', '0', 0, 'poll', 0, NULL, '2023-01-16 06:26:01', '', 'public', 'كبف تقراء الوضع السياسي في سوريا', '', '', '0', NULL, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 316, '0', '0'),
(15, 1, 'user', '0', NULL, '1', '0', NULL, '1', '0', NULL, 'article', NULL, NULL, '2023-01-16 06:44:39', NULL, 'public', NULL, NULL, NULL, '0', NULL, '0', '0', '0', 1, 0, 0, 0, 0, 0, 0, 0, 0, 366, '0', '0'),
(16, 1, 'page', '0', NULL, '1', '0', NULL, '1', '0', NULL, 'article', NULL, NULL, '2023-01-16 06:48:34', NULL, 'public', NULL, NULL, NULL, '0', NULL, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 387, '0', '0'),
(20, 3, 'user', '0', 0, '0', '0', 0, '0', '0', 0, '', 0, NULL, '2023-01-16 16:07:59', '', 'public', 'سلام', '', '', '0', NULL, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 427, '0', '0'),
(21, 1, 'user', '0', 0, '0', '0', 0, '0', '0', 0, 'media', 0, NULL, '2023-01-19 23:43:05', '', 'public', 'شاهد ميسي ورونالدو', '', '', '0', NULL, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 519, '0', '0'),
(23, 1, 'user', '0', 0, '0', '0', 0, '0', '0', 0, 'link', 0, NULL, '2023-01-19 23:44:44', '', 'public', '', '', '', '0', NULL, '1', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 517, '0', '0'),
(24, 75, 'user', '0', 0, '0', '0', 0, '0', '0', 0, 'link', 0, NULL, '2023-01-19 23:45:25', '', 'public', 'https://alarab.news/%D8%B9%D9%8A%D9%88%D8%A8-%D9%81%D9%8A-%D8%A7%D8%AA%D9%81%D8%A7%D9%82-%D8%AA%D8%A8%D8%A7%D8%AF%D9%84-%D8%A7%D9%84%D8%A3%D8%B3%D8%B1%D9%89-%D8%AA%D9%82%D9%84%D9%84-%D8%A3%D8%AB%D8%B1%D9%87-%D8%B9%D9%84%D9%89-%D8%A7%D9%84%D8%B3%D9%84%D8%A7%D9%85-%D9%81%D9%8A-%D8%A7%D9%84%D9%8A%D9%85%D9%86', '', '', '0', NULL, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 504, '0', '0'),
(25, 75, 'user', '0', 0, '0', '0', 0, '0', '0', 0, 'link', 0, NULL, '2023-01-19 23:46:02', '', 'public', 'https://alarab.news/%D8%B9%D9%8A%D9%88%D8%A8-%D9%81%D9%8A-%D8%A7%D8%AA%D9%81%D8%A7%D9%82-%D8%AA%D8%A8%D8%A7%D8%AF%D9%84-%D8%A7%D9%84%D8%A3%D8%B3%D8%B1%D9%89-%D8%AA%D9%82%D9%84%D9%84-%D8%A3%D8%AB%D8%B1%D9%87-%D8%B9%D9%84%D9%89-%D8%A7%D9%84%D8%B3%D9%84%D8%A7%D9%85-%D9%81%D9%8A-%D8%A7%D9%84%D9%8A%D9%85%D9%86', '', '', '0', NULL, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 501, '0', '0'),
(26, 75, 'user', '0', NULL, '1', '0', NULL, '1', '0', NULL, 'article', NULL, NULL, '2023-01-20 23:03:01', NULL, 'public', NULL, NULL, NULL, '0', NULL, '1', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 511, '0', '0'),
(27, 75, 'user', '0', 0, '0', '0', 0, '0', '0', 0, 'link', 0, NULL, '2023-01-24 23:19:03', '', 'public', 'https://rasanah-iiis.org/%d9%85%d8%b1%d9%83%d8%b2-%d8%a7%d9%84%d8%af%d8%b1%d8%a7%d8%b3%d8%a7%d8%aa-%d9%88-%d8%a7%d9%84%d8%a8%d8%ad%d9%88%d8%ab/%d8%ad%d8%b1%d8%a8-%d8%a7%d9%84%d9%85%d8%b9%d9%84%d9%88%d9%85%d8%a7%d8%aa-%d9%81%d9%8a-%d8%a7%d9%84%d8%a3%d8%b2%d9%85%d8%a9-%d8%a7%d9%84%d8%a3%d9%88%d9%83%d8%b1%d8%a7%d9%86%d9%8a%d8%a9/', '', '', '0', NULL, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 416, '0', '0'),
(28, 1, 'page', '0', NULL, '1', '0', NULL, '1', '0', NULL, 'page_picture', NULL, NULL, '2023-01-26 13:25:49', NULL, 'public', NULL, NULL, NULL, '0', NULL, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 362, '0', '0'),
(29, 1, 'page', '0', NULL, '1', '0', NULL, '1', '0', NULL, 'page_cover', NULL, NULL, '2023-01-26 13:26:04', NULL, 'public', NULL, NULL, NULL, '0', NULL, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 361, '0', '0'),
(30, 2, 'page', '0', NULL, '1', '0', NULL, '1', '0', NULL, 'page_picture', NULL, NULL, '2023-01-26 13:26:59', NULL, 'public', NULL, NULL, NULL, '0', NULL, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 1, 0, 352, '0', '0'),
(31, 1, 'user', '0', 0, '0', '0', 0, '0', '0', 0, '', 0, NULL, '2023-02-28 02:41:58', '', 'public', 'how are you ', '', '', '0', NULL, '0', '0', '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 79, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `posts_articles`
--

CREATE TABLE `posts_articles` (
  `article_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `cover` varchar(256) NOT NULL,
  `title` varchar(256) NOT NULL,
  `text` longtext NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `tags` mediumtext NOT NULL,
  `views` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts_articles`
--

INSERT INTO `posts_articles` (`article_id`, `post_id`, `cover`, `title`, `text`, `category_id`, `tags`, `views`) VALUES
(1, 15, 'photos/2023/01/Polex_e6d08adfb680fd1e80ad1e758b1bf47f.jpg', 'رئيس مجلس القيادة الرئاسي الدكتور رشاد العليمي يجتمع بمحافظ المهرة', '&lt;p&gt;اجتمع فخامة الرئيس الدكتور رشاد محمد العليمي، رئيس مجلس القيادة الرئاسي، اليوم الاحد، مع محافظ محافظة المهرة محمد علي ياسر، للاطلاع على اوضاع المحافظة، وهموم المواطنين والمشاريع التنموية المنفذة وتلك المخطط تنفيذها خلال العام الجاري.&lt;/p&gt;\n&lt;p&gt;واستمع رئيس مجلس القيادة الرئاسي من محافظ المهرة، الى تقرير بشأن مستوى الانجاز للمشاريع الممولة من السلطة المحلية، والاشقاء بدول تحالف دعم الشرعية، والشركاء الاقليميين والدوليين..مثمناً على وجه الخصوص التدخلات المقدرة عالياً للبرنامج السعودي لتنمية واعمار اليمن.&lt;/p&gt;\n&lt;p&gt;واشاد فخامة الرئيس، بدور السلطة المحلية في محافظة المهرة، والدعم الشعبي المعهود من كافة ابنائها لبرامج التنمية المستدامة والنأي بها عن اي خلافات جانبية، كما اشاد بدور الاجهزة الامنية والعسكرية في تعزيز الامن والاستقرار، ومكافحة التهريب بما في ذلك الاسلحة الايرانية المهربة للمليشيات الحوثية الارهابية.&lt;/p&gt;\n&lt;p&gt;ووجه رئيس مجلس القيادة الرئاسي، الحكومة والسلطة المحلية في محافظة المهرة بمضاعفة الجهود لتعزيز حضور الدولة، وتقديم كافة التسهيلات لدعم مبادرات القطاع الخاص والصناديق والمبادرات الخلاقة لتحسين الظروف المعيشية، واستثمار الطاقات المجتمعية في كافة المجالات.&lt;/p&gt;\n&lt;p&gt;حضر اللقاء مدير مكتب رئاسة الجمهورية الدكتور يحيى الشعيبي.&lt;/p&gt;', 12, 'الرئيس اليمني', 5),
(2, 16, 'photos/2023/01/Polex_0d183afff84f3742d411aa37a52cd76b.jpg', 'جمود محلي وتفاهمات إقليمية: كيف نفهم حوار الحوثيين مع الرياض وزيارة حزب الإصلاح إلى أبوظبي', '&lt;p&gt;مع بداية العام 2022، انتعشت الآمال بحصول اختراق يفضي إلى حل للصراع اليمني مع إعلان الهدنة الأممية بين الحكومة المعترف بها دوليًا وجماعة الحوثيين وتشكيل مجلس القيادة الرئاسي. اعتُبرت كلا الخطوتين بادرة محتملة لانطلاق محادثات رسمية بين الأطراف المتحاربة، وتحديدًا تشكيل مجلس القيادة الرئاسي باعتباره أحد النماذج الناجحة في تقاسم السلطة التي يمكن توسيعها ضمن حل شامل للأزمة اليمنية.&lt;/p&gt;\n&lt;p&gt;لكن النصف الثاني من العام 2022 حمل العديد من المؤشرات السلبية التي أنذرت بالعودة مجددًا إلى نقطة الصفر؛ إذ انفجرت التناقضات الداخلية في معسكر الشرعية بعد اندلاع معارك شبوة في أغسطس الماضي بين قوات المجلس الانتقالي الجنوبي وألوية العمالقة من جهة والقوات الموالية لحزب الإصلاح من جهة أخرى. تمدد التصعيد السياسي والشعبي لاحقًا نحو محافظة حضرموت (بين نفس الأطراف وكذلك أطراف فاعلة محلية)، ليتفرق أعضاء مجلس القيادة الرئاسي وعاد أغلبهم لممارسة مجمل نشاطه من خارج العاصمة المؤقتة عدن. في المقابل، رفض الحوثيون تمديد الهدنة الأممية وأقدموا على خطوة تصعيدية غير مسبوقة بضرب الموانئ النفطية في جنوب شرقي اليمن في شهري أكتوبر/ تشرين الأول ونوفمبر/ تشرين الثاني، إضافة إلى تحضيراتهم البرية لخوض جولات صراع محتملة في لحج ومأرب وتعز.&lt;/p&gt;\n&lt;p&gt;ورغم قتامة هذا المشهد، ثمة من لا يزال متفائلًا بإمكانية إنهاء الأزمة في القريب العاجل، ومبعث هذا التفاؤل هو وجود مسارين لمحادثات جارية -حوار ثنائي بين السعودية والسلطات الحوثية من جهة وحوار بين حزب الإصلاح والإمارات من جهة أخرى بناء على ثلاثة مصادر تحدثت مع مركز صنعاء. لكن يبقى من المهم تحليل هذه الحوارات في سياق الديناميكيات السياسية المحلية والإقليمية الحالية والجهود السابقة للحوار بين أطراف الصراع المتناحرة في اليمن. ومع الأخذ بهذه الحقائق في الاعتبار، يتعيّن توخي الحذر، عوضًا عن التفاؤل باحتمال حدوث اختراقات وشيكة.&lt;/p&gt;\n&lt;p&gt;المحادثات السعودية الحوثية تتبع النمط المعتاد&lt;/p&gt;\n&lt;p&gt;يصعب الركون إلى الحوار بين الرياض والحوثيين كمؤشر على الانفراج السياسي، فهي ليست الأولى في تاريخ الصراع اليمني. فرغم التقارير المتداولة عن تقديم الرياض دعوة شبه رسمية إلى مهدي المشاط لزيارة الرياض والانخراط في محادثات مباشرة، لم يُحرز تقدم ملموس حتى الآن. في الواقع، سبق وأن جرت محادثات أكثر نجاحًا في العام 2016 وعلى إثرها سلم الحوثيون خرائط الألغام التي زرعوها في الحدود مع السعودية، كما أن الأمير خالد بن سلمان استهل تسلمه للملف اليمني عام 2019 (بعد تبوئه منصب نائب وزير الدفاع) بالتواصل مع الحوثيين في محاولة لخفض مستوى التصعيد وردع تهديد الطائرات المسيّرة والصواريخ الحوثية العابر للحدود. في كلا المرتين، لم يكن الحوار أكثر من مناورة تكتيكية استغلها الطرفان في إدارة الأزمة بشكل مؤقت دون الانخراط جديًا لإيجاد حل دائم، وحتى إذا ما تمخض عن الحوار إجراءات تهدئة عملية، فسرعان ما تلاشت مع أول موجة تصعيدية عسكرية.&lt;/p&gt;\n&lt;p&gt;تميزت المحادثات الأخيرة بكونها الأقل سرية؛ إذ تعمّد الطرفان إخراج بعض من جوانب الحوار للعلن وتغليف التفاصيل بالغموض. كان ذلك مناسبًا تمامًا للحوثيين؛ حيث الإشاعات عن وجود حوار مع الرياض قد يهز ثقة الأخيرة مع حلفائها المحليين ويعزز من شرعية الحوثيين السياسية كطرف ندي أمام خصومهم الإقليميين (السعودية والإمارات). من هذا المنطلق، سيستغل الحوثيون حاجة السعودية الملحة للهدنة لضمان أمنها؛ كي يرفعوا سقفهم التفاوضي وينتزعوا امتيازات مالية (مثل إدراج أفراد عسكريين في كشوفات رواتب موظفي القطاع العام، وأخذ حصة من عائدات النفط اليمني المصدر)، دون أن يضطروا لتقديم أي التزامات سياسية حول تسوية شاملة.&lt;/p&gt;\n&lt;p&gt;من ناحيتها، تحتاج الرياض إلى التواصل المباشر مع الحوثيين لتعويض التراجع الحاصل في الوساطة الأممية والعمانية، ولكي تضبط مستوى التصعيد في اليمن بحيث لا يتجاوز الخطوط الحمراء، خصوصًا أنها بحاجة ماسة إلى منع أي تصعيد كبير في الصراع خلال هذه الفترة يجعلها في مرمى نيران منتقديها الأمريكيين، على الأقل إلى أن تتجاوز توترها الحاد مع الإدارة الأمريكية على خلفية سياستها النفطية وموقفها من الحرب الروسية-الأوكرانية.&lt;/p&gt;\n&lt;p&gt;وطالما لم يعد المناخ الدولي ولا توازنات القوى محليًا سانحة لكي تشن دول التحالف العربي حملة ضغط عسكرية ضد الحوثيين، فمن الأجدى للسعودية الانخراط في محادثات معهم حول بعض الترتيبات الأمنية مثل وقف العمليات البرية في اليمن ووقف الهجمات الجوية العابرة للحدود والقيام بصفقات تبادل للأسرى، وهي في الوقت نفسه لا تمانع من تسريب أخبار عن المحادثات كي تحرج الحوثيين أمام حاضنتهم الشعبية، وتستكشف بنيتهم الداخلية وإمكانية اللعب على تناقضاتها.&lt;/p&gt;\n&lt;p&gt;من المهم النظر إلى المشاورات السعودية-الحوثية في سياق الحوار &ldquo;السعودي-الإيراني&rdquo; الجاري، والذي شهد تقدمًا ملحوظًا حتى مع ارتفاع النبرة العدائية تجاه الرياض من قِبل بعض قيادات الحرس الثوري الإيراني على خلفية الاحتجاجات التي تشهدها شوارع إيران حاليًا. من يتتبع قنوات التواصل غير الرسمية بين الحوثيين والسعوديين يجدها مقرونه بالأساس مع المبادرة العراقية التي بدأت في سبتمبر ٢٠١٩ للتقريب بين الرياض وطهران. وسيكون من فرط التمني الاعتقاد أن هذه المحادثات ستقنع الحوثيين بالابتعاد عن طهران والتخلي عن الخيار العسكري، حيث إن هذه المحادثات ما كانت لتتم أصلًا إلا بتنسيق إيراني مدروس.&lt;/p&gt;\n&lt;p&gt;حاليًا، يمكن تفسير السلوك الحوثي المزدوج بين التصعيد والتهدئة، كجزء من ازدواجية السياسة الخارجية الإيرانية التي تتنازعها مقاربتين (دبلوماسية وعسكرية): المقاربة الأولى تقودها وزارة الخارجية وهي تجنح إلى التهدئة في اليمن والحوار مع السعودية والعودة للاتفاق النووي مع الغرب، والمقاربة الثانية يقودها الحرس الثوري الذي يستخدم جماعات شبه عسكرية تعمل بالوكالة لانتزاع الهيمنة الإقليمية و يميل الى التصعيد الميداني للضغط على المجتمع الدولي. و من جهتهم، يتكيّف الحوثيون بذكاء مع هذه الديناميكية الإيرانية: يتحاورون بيدهم اليمنى مع السعودية، ويضربون بيدهم اليسرى الموانئ اليمنية في جنوب شرق البلاد. وبقدر ما سيميل ميزان القوى السياسي في إيران لمصلحة إحدى المقاربتين، سيميل سلوك الحوثيين إلى التغيير معه.&lt;/p&gt;\n&lt;p&gt;محادثات بين الإصلاح والإمارات&lt;/p&gt;\n&lt;p&gt;يمكننا أن نجد هذا النمط من الحوارات الاستكشافية يتكرر في اليمن ضمن مسار مختلف، ولذات الأسباب. في بداية نوفمبر من العام 2022 سافر عضوا مجلس القيادة الرئاسي الممثلان لحزب الإصلاح الإسلامي عبدالله العليمي وسلطان العرادة إلى أبوظبي حيث التقيا هناك بعدد من المسؤولين الكبار لبحث الطريقة المثلى لإدارة العلاقة المتوترة بين الإمارات والحزب. هذه ليست المرة الأولى التي تزور فيها القيادات الإصلاحية العاصمة الإماراتية أبوظبي، خصوصًا زيارة سلطان العرادة عام 2015 (الذي كان صديقًا شخصيًا للشيخ محمد بن زايد الحاكم الفعلي آنذاك للإمارات قبل توليه الحكم بداية العام الجاري). كما زار رئيس مجلس شورى الإصلاح محمد اليدومي وأمين عام الحزب عبدالوهاب الآنسي أبوظبي والتقيا ابن زايد عام 2018. ثمة عامل مشترك بين الزيارة السرية الأخيرة وسابقاتها، وهو الضغط السعودي الذي يُمارس دومًا لتخفيض مستوى التوتر داخل المعسكر المناهض للحوثيين، وتوحيد جبهته للتعامل مع القضايا الأكثر إلحاحًا. على سبيل المثال عام 2018، كانت التهدئة ضرورية ضمن التحضير لمعارك الساحل الغربي وعمليات قادتها القوات المدعومة من الإمارات للاستيلاء على الحديدة، واليوم باتت هذه التهدئة ضرورية لتُحييد حضرموت عن التحول لساحة صراع بين حزب الإصلاح وحليف أبوظبي الأبرز في الجنوب، المجلس الانتقالي الجنوبي.&lt;/p&gt;\n&lt;p&gt;سارع حزب الإصلاح إلى التجاوب مع فرصة الحوار مع الإمارات بعد أن اختل ميزان القوى الاستراتيجي داخل المناطق المحررة لصالح أبوظبي وحلفائها المحليين (ألوية العمالقة، وقوات المقاومة الوطنية، والمجلس الانتقالي الجنوبي). وما سبقه من تقارب بين الموقفين السعودي والإماراتي حول ضرورة تحجيم دور حزب الإصلاح نظرًا لفشله في مواجهة الحوثي عسكريًا وإخفاقه في قيادة الشرعية سياسيًا كطرف في حكومة الرئيس السابق عبدربه منصور هادي.&lt;/p&gt;\n&lt;p&gt;ومنذ إقرارهم بخسارة معركة شبوة؛ بدأت قيادة الإصلاح بتبني استراتيجية دفاعية تميل إلى التهدئة للحفاظ على ما تبقى من نفوذ سياسي وعسكري لها داخل معسكر الشرعية، وهي تناور قدر الإمكان كي ترمم تحالفها المتداعي مع السعودية، ولكي تتجنب أي مواجهة مفتوحة مع أبوظبي في ظل الظروف المحلية والإقليمية الراهنة. أما الجانب الإماراتي، ففتح أبوابه مجددًا أمام خصمه اللدود في اليمن، نزولًا عند التفاهمات الثنائية مع السعودية حول خفض مستوى التوتر بين حلفائهم المحليين، حتى لو مؤقتًا. عَمِد كلا البلدين مؤخرًا إلى الوفاء بتعهدات مالية ضخمة للحكومة اليمنية من أجل دعم مجلس القيادة الرئاسي في مواجهة التبعات الاقتصادية لهجمات الحوثيين على الموانئ النفطية.&lt;/p&gt;\n&lt;p&gt;من المحتمل أن تسفر الحوارات الأخيرة في أبوظبي عن تهدئة مؤقتة يحركها عاملان: أولًا جمود المشهد الأمني والسياسي بين الإصلاح والمجلس الانتقالي الجنوبي خصوصًا أنه قد استعصى على أي طرف إنجاز اختراق حقيقي في مناطق حضرموت الوادي طوال الفترة الماضية، وثانيًا وجود تفاهمات سعودية إماراتية تدفع نحو تطبيع العلاقة بين حزب الإصلاح والمجلس الانتقالي مع تحجيم دور الأول وتعزيز نفوذ الثاني في هياكل الشرعية الجديدة، مثل مجلس القيادة الرئاسي. يمكن رؤية قرار مجلس القيادة الرئاسي الصادر في 6 ديسمبر باستبدال رئيس الأركان والقائد الفعلي للمنطقة العسكرية الأولى المتمركزة في سيئون، يحيى أبو عوجا، من هذا المنطلق.&lt;/p&gt;\n&lt;p&gt;يظل من المستبعد أن تخلق هذه المحادثات تغيرًا عميقًا في الديناميكيات السياسية داخل معسكر الحكومة الشرعية، وستظل العلاقة المتبادلة بين حزب الإصلاح من جهة وأبوظبي وحلفائها المحليين من جهة أخرى عند طابعها &ldquo;التنافسي/العدائي&rdquo;، وقد تستمر موجات التصعيد المتبادلة لاسيما في حضرموت وإن بوتيرة منخفضة، ومن ثم تزداد وتيرتها أكثر بمجرد أن يتراجع الضغط السعودي المباشر على الطرفين.&lt;/p&gt;\n&lt;p&gt;آفاق استمرار حالة الجمود&lt;/p&gt;\n&lt;p&gt;قد يدفع انتشار المعلومات القائلة بوجود حوار سعودي حوثي ومباحثات إصلاحية اماراتية الكثيرين للاستنتاج بأن أبرز داعمي الحكومة يحاولان تسوية صراعهما في اليمن بشكل سريع وأحادي، متجاوزين حلفائهما المحليين (محادثات السعودية مع الحوثيين التي تتجاوز مجلس القيادة الرئاسي، ومحادثات الإمارات مع حزب الإصلاح التي تتجاوز المجلس الانتقالي الجنوبي). لكن بمجرد أن توضع هذه المعلومات في سياقها العام، ندرك أنها جزء من المناورات السياسية التقليدية للقوى المحلية والإقليمية الفاعلة في الأزمة اليمنية، التي لطالما تكررت على مدار 8 سنوات. وهي مناورات تعبر عن حجم الجمود في الأزمة أكثر مما قد تشي بمسارات جديدة لحلها.&lt;/p&gt;\n&lt;p&gt;هذا التحليل هو جزء من سلسلة إصدارات ينتجها مركز صنعاء بتمويل من الحكومة الهولندية. تستكشف السلسلة قضايا ذات أبعاد اقتصادية وسياسية وبيئية، بهدف إثراء النقاشات وصنع السياسات التي تعزز السلام المستدام في اليمن. الآراء المعرب عنها في هذا التحليل لا تعكس آراء مركز صنعاء أو الحكومة الهولندية.&lt;/p&gt;\n&lt;p&gt;جمود محلي وتفاهمات إقليمية: كيف نفهم حوار الحوثيين مع الرياض وزيارة حزب الإصلاح إلى أبوظبي - تقرير اليمن، نوفمبر/ تشرين الثاني 2022 - مركز صنعاء للدراسات الإستراتيجية&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;', 16, 'اليمن', 13),
(3, 26, 'photos/2023/01/Polex_b2a02644e6f291bbb5aff0b03786ef9f.jpg', 'محادثات سريّة: هل تقود اليمن نحو سلام أم حرب جديدة؟', '&lt;p&gt;فريدة أحمد/&nbsp;&lt;/p&gt;\n&lt;p&gt;المدير التنفيذي لمركز سوث24 للأخبار والدراسات&lt;/p&gt;\n&lt;p&gt;منذ &nbsp;أن تم إعلان الهدنة في 2 إبريل العام الحالي، أظهر الحوثيون انتشاءً ملحوظاً لشعورهم بتحقيق إنجاز في الضغط بشأن هدنة، غير أنه وبعد خمسة أيام من إعلانها، تفاجأت الجماعة بتغييرات كبيرة في صفوف خصومها، أسفرت عن مشاورات الرياض، وقادت مجلس رئاسي من ثمانية أعضاء أُعلن عنه في السابع إبريل. بالنسبة لدول التحالف الذي تقوده السعودية وكثير من اليمنيين كان هذا التحوّل انتصاراً سياسياً من شأنه أن يقود لتحسين الواقع العسكري، كون الثمان السنوات التي مضت من عمر الحرب ارتبطت بشخصيات سياسية وعسكرية أخفقت في تحقيق إنجاز يذكر في مواجهة الجماعة التي انقلبت على السلطة في صنعاء في 2015.&lt;/p&gt;\n&lt;p&gt;خلال الهدنة التي امتدت لأكثر من 6 أشهر حتى 2 أكتوبر الماضي، توقف إطلاق النار بين أطراف الصراع بشكل واسع، كما استؤنفت عدة رحلات جوية من مطار صنعاء، وبدأ تدفق واردات الوقود من ميناء الحديدة إلى مناطق سيطرة الحوثيين، الأمر الذي عالج أزمة إنسانية كبيرة كانت تواجهها الجماعة. مقابل ذلك، لم ينفّذ الحوثيون أياً من اشتراطات الهدنة، سواء المتعلقة بملف الأسرى، أو فتح معابر تعز والطرق الرئيسية الأخرى بين المحافظات، أو دفع رواتب الموظفين في مناطق سيطرتهم من إيرادات ميناء الحديدة. لكنّ الحوثيين رفضوا تمديد الهدنة ضمن شروط وصفها مسؤولون غربيون بالـ &quot;المستحيلة&quot;، بينها صرف مرتبات جميع الموظفين في مناطق سيطرتهم بما فيها مقاتليهم، من عائدات مبيعات النفط الخام والغاز في مناطق سيطرة المجلس الرئاسي. &nbsp;&lt;/p&gt;\n&lt;p&gt;كان المبعوث الأممي الخاص إلى اليمن &quot;هانز غروندبرغ&quot; قد عبّر عن أسفه لعدم التوصل إلى اتفاق بشأن تمديد الهدنة، وثمّن موقف الحكومة اليمنية للتعاطي مع مقترحه بشكل إيجابي[1]. كما استنكرت الحكومة البريطانية عبر ناطقتها &quot;روزي دياز&quot;، رفض الحوثيين تمديد الهدنة، ووصفته بأنّه يعرّض فرص السلام للخطر[2]. شاركها في ذلك الاتحاد الأوروبي، وهو يصف الرفض الحوثي بالخطأ الاستراتيجي، معبراً عن خيبة أمل عميقة بسبب عدم القدرة على التوصل إلى اتفاق بشأن تمديد الهدنة[3]. مع كل ذلك، أبدى الحوثيون تعنتاً واضحاً من خلال تهديداتهم بضرب منشآت نفطية في السعودية والإمارات[4]، بل وتنفيذ &quot;هجمات&quot; بالطائرات المسيّرة على ثلاثة موانئ استراتيجية في حضرموت وشبوة، خلال أسبوعين فقط، كان آخرها استهداف ميناء الضبة شرقي مدينة المكلا يوم الاثنين الماضي 21 نوفمبر.&lt;/p&gt;\n&lt;p&gt;وتأتي هجمات الجماعة الدينية المدعومة من إيران، بالتوازي مع تهديدات أخرى ببدء مواجهة بحرية وفقاً لرئيس هيئة الاستخبارات الحوثية &quot;عبدالله الحاكم&quot;، الذي هدد بأنها قد تكون من أشد المعارك مع التحالف العربي، داعيا جماعته لتعزيز أنظمة الردع عسكرياً واقتصادياً وعلى كل الصعد[5]. الأمر الذي يُفهم أن التهديدات العسكرية والأمنية مازالت قائمة، وعلى الأرجح أن لدى الحوثيين نوايا بالتصعيد خلال الفترة القريبة القادمة، وإن كان هناك ضغوط بشأن تفاهمات غير معلنة بالتهدئة. وقد أعلنت بالفعل القوات التابعة للحكومة اليمنية، أنّ الحوثيين أطلقوا، من صنعاء، صاروخا مضادا للسفن سقط في المياه الدولية غربي الحديدة[6].&lt;/p&gt;\n&lt;p&gt;عرض سخي&nbsp;&lt;/p&gt;\n&lt;p&gt;وفي تطوّر أثار جدلا واسعا، قدّمت السعودية لرئيس المجلس السياسي الأعلى لجماعة الحوثيين &quot;مهدي المشاط&quot;، وهو الواجهة السياسية للجماعة، دعوة لزيارة الرياض، عبر وفدها الذي أرسلته لصنعاء منتصف أكتوبر الماضي، لمناقشة ملفات عديدة مع الحوثيين أبرزها &quot;ملف الرواتب&quot;. ووفقاً لصحيفة الأخبار اللبنانية المقرّبة من حزب الله[7]، أظهر الوفد مرونة لافتة وعرض ما أسماه بـ &quot;تمويل للحلول&quot; من خلال مبادرة تحت عنوان &quot;مساعدة الأشقاء في اليمن&quot;، لمحاولة تمديد الهدنة. إذ يبدو واضحاً أن السعوديين عرضوا تكفّلهم بدفع مرتبات جميع موظفي الخدمة المدنية المدرجين في كشوفات 2014، بمبلغ يزيد عن 150 مليون دولار شهرياً، وفقاً لمصادر رفيعة تحدثت لمركز سوث24 [8]. وكان رفض الحوثيين للعرض السعودي مرتبطاً بإدراج قواتهم العسكرية والأمنية في مدفوعات رواتب موظفي الخدمة المدنية، وهو ما ذكره مندوب السعودية لدى الأمم المتحدة &quot;عبدالعزيز الواصل&quot;، بأن &quot;الجماعة اشترطت أن يدفع التحالف مرتبات مقاتليها بالدولار الأمريكي، وأن تورد إلى حساب بنكي يخضع لسيطرتهم&quot;.[9]&lt;/p&gt;\n&lt;p&gt;من جهتها، حاولت سلطنة عمان تيسير المحادثات السعودية الحوثية خلال الأسابيع الماضية، وهو ما ساهم بتثبيت الأوضاع العسكرية نسبياً؛ رغم الضربات الحوثية على الموانئ. ذلك جاء في حديث سابق للمشاط[10]، عن وجود تفاهمات غير معلنة مع أطراف إقليمية حول ثبات اتّفاق وقف إطلاق النار، وأن صنعاء تمنح بعض دول ما أسماها بـ &quot;العدوان&quot; فرصة، لإعادة النظر في عدوانها بعد أن اقتنعت بأنها خاسرة. التواصل المباشر مع الحوثيين من قبل السعوديين والعمانيين جاء بمعزل عن وساطة المبعوث الأممي &quot;هانز غروندبرغ&quot;، الأمر الذي على ما يبدو أزعج الهيئة الأممية، وهو ما ظهر في حديث الأخير لدى مجلس الأمن، عندما شدد على أنّ &quot;التوصل إلى حل مستدام لن يكون ممكناً إلا ضمن سياق تسوية شاملة للنزاع&quot;.[11]&lt;/p&gt;\n&lt;p&gt;في الوقت الحالي، قد ترى السعودية أنّ المقاربة الأفضل هي تهدئة الأوضاع عبر تقديم عروض ممكنة للحوثيين، يمكن فهمها ظاهرياً بأنها إذعاناً أو تنازلا من المملكة، غير أنها، من منظور آخر، قد تبدو كحلول أخيرة تقدّمها الرياض للجماعة الحوثية، قبل أن تغلق الأخيرة كل الأبواب والمبررات في ملف السلام كما جرت العادة. فالحوثيون يريدون أن يبرهنوا أن باستطاعتهم، ليس فقط المحافظة على المكاسب العسكرية والأمنية وتطوير منظومة أسلحتهم المهربة من إيران، بل انتزاع الرواتب من عائدات النفط والغاز التي تخضع لسيطرة الحكومة اليمنية، وإعادة صياغة المفاوضات وفق شروطهم وحسب.&lt;/p&gt;\n&lt;p&gt;قد يمثّل تكّفل السعودية بدفع رواتب الموظفين في مناطق سيطرة الحوثيين انتصاراً إنسانياً للأخيرة، سواء قبِل الحوثيون أو لم يقبلوا. فهذه الخطوة على المستوى الشعبي ستكون ناجحة لكسب تعاطف شعبي لصالح السعودية، إذا ما قررت &ndash; وهو أمر مستبعد &ndash; العودة إلى المواجهات العسكرية باتجاه صنعاء.&lt;/p&gt;\n&lt;p&gt;ترى بعض المصادر التي تحدّثت لمركز سوث24 أنّ الخطوة السعودية جاءت بهدف الدفع نحو تمديد الهدنة بأي ثمن، خصوصا مع رفض المجلس الرئاسي اشتراطات الحوثيين الجديدة، ومعارضة أطراف داخل المجلس، كالانتقالي الجنوبي، للاستجابة لهذه الشروط على حساب السكان في جنوب اليمن، الذي يعانون من أزمة مرتبات طويلة الأمد.&lt;/p&gt;\n&lt;p&gt;بعيداً عن الرئاسي&nbsp;&lt;/p&gt;\n&lt;p&gt;من الواضح أن المحادثات الأخيرة بين السعودية والحوثيين تمّت بدون مشاورة المجلس الرئاسي، وهي صفعة غير متوقعة فاجأت الأطراف السياسية داخل المجلس.&lt;/p&gt;\n&lt;p&gt;يعدّ رئيس المجلس &quot;رشاد العليمي&quot;، هو أحد أكثر المقربين من الرياض، والأخيرة تحاول إظهاره بصورة منفردة في معظم المحافل الدولية والمشاركات الخارجية، وربما تسعى لتحضير &quot;العليمي&quot; لما هو أكبر من ذلك، خاصة وأنّه لا يملك وزناً عسكرياً على الأرض مقارنة بأعضاء آخرين. ترى الرياض أن إعادة تخلّق &quot;الشرعية&quot; في شخصية واحدة أسهل بالنسبة لها لاتخاذ القرارات في الشأن اليمني.&lt;/p&gt;\n&lt;p&gt;من المهم القول، أنّه منذ التغيير في بنية الرئاسة اليمنية، حاولت عدة أطراف منها مراكز بحثية يمنية وكذلك أطراف سياسية كحزب الإصلاح الإسلامي، أن تقلّل من شأن &quot;رشاد العليمي&quot; كرئيس، واجتهدت في إظهاره كرجل ثانٍ بعد عضو الرئاسي ورئيس الانتقالي الجنوبي &quot;عيدروس الزبيدي&quot;. يقيناً، لم تكن هذه اللغة عبثية، بل نجحت في التأثير على توافق الرئاسي وقد تساهم بتزايد الفجوة بين أعضائه في المستقبل القريب. لا سيّما وأن ذات اللغة نجحت سابقاً في إحداث حساسية ضمن التحالف، بين السعودية والإمارات، لبعض الوقت في ميدان الحرب اليمنية، الأمر الذي ساهم في تقليل فرص التعاون العسكري الثنائي بينهما، وسمح لمعسكر تنظيم &quot;الإخوان المسلمين&quot; بالسيطرة على القرار العسكري في عدة محافظات شمالية، ما نتج عن ذلك فشلاً وتراجعاً عسكرياً عزز، بالمحصلة، من سيطرة ونفوذ الحوثيين.&lt;/p&gt;\n&lt;p&gt;من الناحية الواقعية، ستنتهي مهمة المجلس الرئاسي بمجرد الدخول في تسوية سياسية مع الحوثيين، ذلك ما جاء في بيان نقل السلطة. إذ ستنتهي ولاية المجلس وفقاً للحل السياسي الشامل وإقرار السلام، أو عند إجراء انتخابات عامة وفقاً للدستور الجديد[12]. يُفهم من عبارة الانتخابات أنه خيار الحرب بدلاً عن السلام، لأنه من الناحية الفنية لا يمكن إجراء انتخابات عامة في عموم الجمهورية، إلا بتحرير المناطق الخاضعة لسيطرة الحوثيين. &nbsp;&lt;/p&gt;\n&lt;p&gt;سيناريوهات محتملة&nbsp;&lt;/p&gt;\n&lt;p&gt;استناداً للمعطيات السابقة، لا تبدو الخيارات كثيرة أمام الأطراف الإقليمية أو المحلية في اليمن، فإما سيناريو يذهب نحو هدنة جديدة مع الحوثيين بتنفيذ اشتراطاتهم، أو اللجوء لخيار الحسم العسكري، في ظل تصاعد اعتداءاتهم على الأعيان المدنية والمنشآت النفطية. خطاب التنديد الصادر عن الخارجية السعودية، ودعوة مندوبها لدى الأمم المتحدة إلى تصنيف &quot;الحوثيين&quot; كـ &quot;جماعة إرهابية&quot;، إشارة إلى أنّ المحادثات السعودية الحوثية ليست مضمونة النتائج، وأن الرياض، ربما، قد تذهب لخيارات أخرى.&lt;/p&gt;\n&lt;p&gt;واقع الأمر، سيبدو الحوثيون برفضهم المتواصل لأي مبادرات تعالج أزمات إنسانية عالقة بأنهم معرقلون. وهو موقف ربما تستغله السعودية لرفع الحرج عن نفسها فيما إذا قررت ومعها دول التحالف الأخرى شن حرب عسكرية شاملة. ذلك بالمحصّلة ظهر في تصريح سابق لوزير الدفاع اليمني &quot;محسن الداعري&quot;، بأنه في حال انهيار الهدنة الأممية، ستكون لديهم خططاً بديلة وغير تقليدية[13]. ما يُفهم أن الأهداف القادمة ستكون سريّة وغير واضحة بالنسبة لخصومهم. مع ذلك، لا يمكن التنبؤ بسياسات المملكة أو التفاؤل الجازم بشأن خطواتها القادمة، في ضوء مساعيها لتأمين أجواءها من أي هجمات تهدد مصادر الطاقة العالمية.&lt;/p&gt;\n&lt;p&gt;مهما كانت النتيجة، فإن أسلوب المحادثات الثنائي بين السعودية والحوثيين في المرحلة الحالية بمعزل عن الأطراف اليمنية الأخرى بما في ذلك الجنوبيين، على الأرجح سيزعزع الثقة بين المملكة وأطراف المجلس الرئاسي. حتى وإن كانت مبررات هذه المحادثات تنطلق من الظروف العالمية المحيطة كأزمة الطاقة وفعاليات كأس العالم 2022 في قطر.&lt;/p&gt;\n&lt;p&gt;في المحصّلة، سيؤدي تعنّت الحوثيين بشأن الهدنة واتخاذهم اجراءات متصاعدة تستهدف السفن والموانئ، إلى جر البلاد نحو سيناريو أكثر خطورة، خاصة وأنّ ذلك يتعارض مع الدعم الدولي لجهود السلام الذي تقوده الأمم المتحدة. وهي مخاوف عبّرت عنها الأطراف الدولية في جلسة خاصة لمجلس الأمن الثلاثاء[14]، وحذّرت خلالها من إغراق البلاد مرة أخرى في الصراع. ورغم ذلك مازالت السيناريوهات المتوقعة مفتوحة على كل الاحتمالات، وجلّها مرتبط برؤى السعوديين والحوثيين المرحلية للأزمة، ورؤى الأطراف السياسية اليمنية الأخرى التي لا زالت غائبة حتى الآن.&lt;/p&gt;', 1, 'السعودية, اليمن, الحوثي, الحرب, السلام saudi, Yemen,', 13);

-- --------------------------------------------------------

--
-- Table structure for table `posts_audios`
--

CREATE TABLE `posts_audios` (
  `audio_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `source` varchar(256) NOT NULL,
  `views` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts_colored_patterns`
--

CREATE TABLE `posts_colored_patterns` (
  `pattern_id` int UNSIGNED NOT NULL,
  `type` enum('color','image') NOT NULL DEFAULT 'color',
  `background_image` varchar(256) DEFAULT NULL,
  `background_color_1` varchar(32) DEFAULT NULL,
  `background_color_2` varchar(32) DEFAULT NULL,
  `text_color` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts_colored_patterns`
--

INSERT INTO `posts_colored_patterns` (`pattern_id`, `type`, `background_image`, `background_color_1`, `background_color_2`, `text_color`) VALUES
(1, 'image', 'patterns/1.jpg', NULL, NULL, '#FFFFFF'),
(2, 'image', 'patterns/2.jpg', NULL, NULL, '#FFFFFF'),
(3, 'image', 'patterns/3.jpg', NULL, NULL, '#FFFFFF'),
(4, 'image', 'patterns/4.jpg', '', '', '#000000'),
(5, 'image', 'patterns/5.jpg', NULL, NULL, '#FFFFFF'),
(6, 'color', NULL, '#FF00FF', '#030355', '#FFF300'),
(7, 'color', '', '#FF003D', '#D73A3A', '#FFFFFF');

-- --------------------------------------------------------

--
-- Table structure for table `posts_comments`
--

CREATE TABLE `posts_comments` (
  `comment_id` int UNSIGNED NOT NULL,
  `node_id` int UNSIGNED NOT NULL,
  `node_type` enum('post','photo','comment') NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `user_type` enum('user','page') NOT NULL,
  `text` longtext NOT NULL,
  `image` varchar(256) DEFAULT NULL,
  `voice_note` varchar(256) DEFAULT NULL,
  `time` datetime NOT NULL,
  `reaction_like_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_love_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_haha_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_yay_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_wow_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_sad_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_angry_count` int UNSIGNED NOT NULL DEFAULT '0',
  `replies` int UNSIGNED NOT NULL DEFAULT '0',
  `points_earned` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts_comments`
--

INSERT INTO `posts_comments` (`comment_id`, `node_id`, `node_type`, `user_id`, `user_type`, `text`, `image`, `voice_note`, `time`, `reaction_like_count`, `reaction_love_count`, `reaction_haha_count`, `reaction_yay_count`, `reaction_wow_count`, `reaction_sad_count`, `reaction_angry_count`, `replies`, `points_earned`) VALUES
(2, 30, 'post', 2, 'page', 'heel', '', '', '2023-02-06 22:27:04', 0, 0, 0, 0, 0, 0, 0, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `posts_comments_reactions`
--

CREATE TABLE `posts_comments_reactions` (
  `id` int UNSIGNED NOT NULL,
  `comment_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `reaction` varchar(32) DEFAULT 'like',
  `reaction_time` datetime DEFAULT NULL,
  `points_earned` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts_files`
--

CREATE TABLE `posts_files` (
  `file_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `source` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts_funding`
--

CREATE TABLE `posts_funding` (
  `funding_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `title` varchar(256) NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `raised_amount` float NOT NULL DEFAULT '0',
  `total_donations` int NOT NULL DEFAULT '0',
  `cover_image` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts_funding_donors`
--

CREATE TABLE `posts_funding_donors` (
  `donation_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `donation_amount` float UNSIGNED NOT NULL DEFAULT '0',
  `donation_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts_hidden`
--

CREATE TABLE `posts_hidden` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts_jobs`
--

CREATE TABLE `posts_jobs` (
  `job_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `salary_minimum` float UNSIGNED NOT NULL,
  `salary_maximum` float UNSIGNED NOT NULL,
  `pay_salary_per` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `question_1_type` varchar(100) DEFAULT NULL,
  `question_1_title` varchar(256) DEFAULT NULL,
  `question_1_choices` text,
  `question_2_type` varchar(100) DEFAULT NULL,
  `question_2_title` varchar(256) DEFAULT NULL,
  `question_2_choices` text,
  `question_3_type` varchar(100) DEFAULT NULL,
  `question_3_title` varchar(256) DEFAULT NULL,
  `question_3_choices` text,
  `cover_image` varchar(256) NOT NULL,
  `available` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts_jobs_applications`
--

CREATE TABLE `posts_jobs_applications` (
  `application_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `work_place` varchar(100) DEFAULT NULL,
  `work_position` varchar(100) DEFAULT NULL,
  `work_description` text,
  `work_from` varchar(100) DEFAULT NULL,
  `work_to` varchar(100) DEFAULT NULL,
  `work_now` enum('0','1') DEFAULT NULL,
  `question_1_answer` text,
  `question_2_answer` text,
  `question_3_answer` text,
  `applied_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts_links`
--

CREATE TABLE `posts_links` (
  `link_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `source_url` text NOT NULL,
  `source_host` varchar(256) NOT NULL,
  `source_title` varchar(256) NOT NULL,
  `source_text` mediumtext NOT NULL,
  `source_thumbnail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts_links`
--

INSERT INTO `posts_links` (`link_id`, `post_id`, `source_url`, `source_host`, `source_title`, `source_text`, `source_thumbnail`) VALUES
(2, 6, 'https://yementv.tv/2023/01/15/%d8%b1%d8%a6%d9%8a%d8%b3-%d9%85%d8%ac%d9%84%d8%b3-%d8%a7%d9%84%d9%82%d9%8a%d8%a7%d8%af%d8%a9-%d8%a7%d9%84%d8%b1%d8%a6%d8%a7%d8%b3%d9%8a-%d8%a7%d9%84%d8%af%d9%83%d8%aa%d9%88%d8%b1-%d8%b1%d8%b4%d8%a7-3.html', 'yementv.tv', 'رئيس مجلس القيادة الرئاسي الدكتور رشاد العليمي يجتمع بمحافظ المهرة - قناة اليمن الفضائية - الرئيس -', 'اجتمع فخامة الرئيس الدكتور رشاد محمد العليمي، رئيس مجلس القيادة الرئاسي، اليوم الاحد، مع محافظ محافظة المهرة محمد علي ياسر، للاطلاع على اوضاع المحافظة، وهموم المواطنين والمشاريع التنموية المنفذة وتلك المخطط تنفيذها خلال العام الجاري. واستمع رئيس مجلس القيادة الرئاسي من محافظ المهرة، الى تقرير بشأن مستوى الانجاز للمشاريع الممولة من السلطة المحلية، والاشقاء بدول &amp;hellip;', 'https://yementv.tv/wp-content/uploads/2023/01/55545.jpeg'),
(4, 23, 'https://alarab.co.uk/%D8%B9%D9%8A%D9%88%D8%A8-%D9%81%D9%8A-%D8%A7%D8%AA%D9%81%D8%A7%D9%82-%D8%AA%D8%A8%D8%A7%D8%AF%D9%84-%D8%A7%D9%84%D8%A3%D8%B3%D8%B1%D9%89-%D8%AA%D9%82%D9%84%D9%84-%D8%A3%D8%AB%D8%B1%D9%87-%D8%B9%D9%84%D9%89-%D8%A7%D9%84%D8%B3%D9%84%D8%A7%D9%85-%D9%81%D9%8A-%D8%A7%D9%84%D9%8A%D9%85%D9%86', 'alarab.co.uk', 'عيوب في اتفاق تبادل الأسرى تقلل أثره على السلام في اليمن |  | صحيفة العرب', 'الحوثيون والشق الإخواني في الشرعية أبرز المستفيدين من صفقة التبادل', 'https://alarab.co.uk/sites/default/files/styles/article_image_800x450_/public/s3/2020-02/1_60.jpg?h=04611624&amp;itok=TcUwnKij'),
(5, 24, 'https://www.google.com/url?client=internal-element-cse&amp;cx=003408771634441451134:byuzzw2g4t4&amp;q=https://alarab.co.uk/%25D8%25B9%25D9%258A%25D9%2588%25D8%25A8-%25D9%2581%25D9%258A-%25D8%25A7%25D8%25AA%25D9%2581%25D8%25A7%25D9%2582-%25D8%25AA%25D8%25A8%25D8%25A7%25D8%25AF%25D9%2584-%25D8%25A7%25D9%2584%25D8%25A3%25D8%25B3%25D8%25B1%25D9%2589-%25D8%25AA%25D9%2582%25D9%2584%25D9%2584-%25D8%25A3%25D8%25AB%25D8%25B1%25D9%2587-%25D8%25B9%25D9%2584%25D9%2589-%25D8%25A7%25D9%2584%25D8%25B3%25D9%2584%25D8%25A7%25D9%2585-%25D9%2581%25D9%258A-%25D8%25A7%25D9%2584%25D9%258A%25D9%2585%25D9%2586&amp;sa=U&amp;ved=2ahUKEwjL6N7459T8AhXQRvEDHVjRAwsQFnoECAUQAg&amp;usg=AOvVaw0FQ9QweIJHh80j2oaZ6r_h', 'www.google.com', 'Redirect Notice', '', ''),
(6, 25, 'https://alarab.news/%D8%B9%D9%8A%D9%88%D8%A8-%D9%81%D9%8A-%D8%A7%D8%AA%D9%81%D8%A7%D9%82-%D8%AA%D8%A8%D8%A7%D8%AF%D9%84-%D8%A7%D9%84%D8%A3%D8%B3%D8%B1%D9%89-%D8%AA%D9%82%D9%84%D9%84-%D8%A3%D8%AB%D8%B1%D9%87-%D8%B9%D9%84%D9%89-%D8%A7%D9%84%D8%B3%D9%84%D8%A7%D9%85-%D9%81%D9%8A-%D8%A7%D9%84%D9%8A%D9%85%D9%86', 'alarab.news', 'عيوب في اتفاق تبادل الأسرى تقلل أثره على السلام في اليمن |  | صحيفة العرب', 'الحوثيون والشق الإخواني في الشرعية أبرز المستفيدين من صفقة التبادل', 'https://alarab.news/sites/default/files/styles/article_image_800x450_/public/s3/2020-02/1_60.jpg?h=04611624&amp;itok=TcUwnKij'),
(7, 27, 'https://rasanah-iiis.org/%d9%85%d8%b1%d9%83%d8%b2-%d8%a7%d9%84%d8%af%d8%b1%d8%a7%d8%b3%d8%a7%d8%aa-%d9%88-%d8%a7%d9%84%d8%a8%d8%ad%d9%88%d8%ab/%d8%ad%d8%b1%d8%a8-%d8%a7%d9%84%d9%85%d8%b9%d9%84%d9%88%d9%85%d8%a7%d8%aa-%d9%81%d9%8a-%d8%a7%d9%84%d8%a3%d8%b2%d9%85%d8%a9-%d8%a7%d9%84%d8%a3%d9%88%d9%83%d8%b1%d8%a7%d9%86%d9%8a%d8%a9/', 'rasanah-iiis.org', 'حرب المعلومات في الأزمة الأوكرانية', 'تتواصل العمليات العسكرية الروسية على الأراضي الأوكرانية بالتزامن مع حرب إعلامية لا تقِلّ أهمية، تجري بين أطراف الأزمة في الفضاء الإعلامي والإلكتروني، بكل منافذه الإعلامية ومنصات التواصل الاجتماعي. أظهرت هذه الأزمة أن الكلمة والصورة والأرقام يمكن أن تكون سلاحًا فعّالًا يدعم المعارك التي تجري على الأرض، ولها تأثيرها في البِنْية ...', 'https://rasanah-iiis.org/wp-content/uploads/2022/11/%D8%AD%D8%B1%D8%A8-%D8%A7%D9%84%D9%85%D8%B9%D9%84%D9%88%D9%85%D8%A7%D8%AA-%D9%81%D9%8A-%D8%A7%D9%84%D8%A3%D8%B2%D9%85%D8%A9-%D8%A7%D9%84%D8%A3%D9%88%D9%83%D8%B1%D8%A7%D9%86%D9%8A%D8%A9-1-scaled.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `posts_live`
--

CREATE TABLE `posts_live` (
  `live_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `video_thumbnail` varchar(256) NOT NULL,
  `agora_uid` int NOT NULL,
  `agora_channel_name` varchar(256) NOT NULL,
  `agora_resource_id` text,
  `agora_sid` varchar(256) DEFAULT NULL,
  `agora_file` text,
  `live_ended` enum('0','1') NOT NULL DEFAULT '0',
  `live_recorded` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts_live_users`
--

CREATE TABLE `posts_live_users` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts_media`
--

CREATE TABLE `posts_media` (
  `media_id` int UNSIGNED NOT NULL,
  `post_id` int NOT NULL,
  `source_url` mediumtext NOT NULL,
  `source_provider` varchar(256) NOT NULL,
  `source_type` varchar(256) NOT NULL,
  `source_title` varchar(256) DEFAULT NULL,
  `source_text` mediumtext,
  `source_html` mediumtext,
  `source_thumbnail` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts_media`
--

INSERT INTO `posts_media` (`media_id`, `post_id`, `source_url`, `source_provider`, `source_type`, `source_title`, `source_text`, `source_html`, `source_thumbnail`) VALUES
(1, 21, 'https://www.youtube.com/watch?v=O5qcdVPhaR8', 'YouTube', 'video', 'شبكات| رونالدو أم ميسي.. من سيفوز بكأس موسم الرياض؟', 'ينتظر عشاق كرة القدم بفارغ الصبر مباراة &quot;كأس موسم الرياض&quot; المرتقبة بين الفريق المكون من نجوم النصر والهلال ضد نادي باريس سان جيرمان الفرنسي غدا الخميس، في مل...', '&lt;iframe width=&quot;200&quot; height=&quot;113&quot; src=&quot;https://www.youtube.com/embed/O5qcdVPhaR8?feature=oembed&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share&quot; allowfullscreen title=&quot;شبكات| رونالدو أم ميسي.. من سيفوز بكأس موسم الرياض؟&quot;&gt;&lt;/iframe&gt;', 'https://i.ytimg.com/vi/O5qcdVPhaR8/hqdefault.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `posts_offers`
--

CREATE TABLE `posts_offers` (
  `offer_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `discount_type` varchar(32) NOT NULL,
  `discount_percent` int UNSIGNED NOT NULL,
  `discount_amount` varchar(100) NOT NULL,
  `buy_x` varchar(100) NOT NULL,
  `get_y` varchar(100) NOT NULL,
  `spend_x` varchar(100) NOT NULL,
  `amount_y` varchar(100) NOT NULL,
  `end_date` datetime NOT NULL,
  `thumbnail` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts_photos`
--

CREATE TABLE `posts_photos` (
  `photo_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `album_id` int UNSIGNED DEFAULT NULL,
  `source` varchar(256) NOT NULL,
  `blur` enum('0','1') NOT NULL DEFAULT '0',
  `reaction_like_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_love_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_haha_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_yay_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_wow_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_sad_count` int UNSIGNED NOT NULL DEFAULT '0',
  `reaction_angry_count` int UNSIGNED NOT NULL DEFAULT '0',
  `comments` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts_photos`
--

INSERT INTO `posts_photos` (`photo_id`, `post_id`, `album_id`, `source`, `blur`, `reaction_like_count`, `reaction_love_count`, `reaction_haha_count`, `reaction_yay_count`, `reaction_wow_count`, `reaction_sad_count`, `reaction_angry_count`, `comments`) VALUES
(12, 28, 3, 'photos/2023/01/Polex_7d1d53b699f845957bd619d2db8e06b2.png', '0', 0, 0, 0, 0, 0, 0, 0, 0),
(13, 29, 4, 'photos/2023/01/Polex_5879e7f7b8abde384999360d0924b77c.jpg', '0', 0, 0, 0, 0, 0, 0, 0, 0),
(14, 30, 5, 'photos/2023/01/Polex_b72cea8200fe8dd29e0d168cb6df504a.png', '0', 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts_photos_albums`
--

CREATE TABLE `posts_photos_albums` (
  `album_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `user_type` enum('user','page') NOT NULL,
  `in_group` enum('0','1') NOT NULL DEFAULT '0',
  `group_id` int UNSIGNED DEFAULT NULL,
  `in_event` enum('0','1') NOT NULL DEFAULT '0',
  `event_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(256) NOT NULL,
  `privacy` enum('me','friends','public','custom') NOT NULL DEFAULT 'public'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts_photos_albums`
--

INSERT INTO `posts_photos_albums` (`album_id`, `user_id`, `user_type`, `in_group`, `group_id`, `in_event`, `event_id`, `title`, `privacy`) VALUES
(1, 3, 'user', '0', NULL, '0', NULL, 'Profile Pictures', 'public'),
(2, 3, 'user', '0', NULL, '0', NULL, 'Cover Photos', 'public'),
(3, 1, 'page', '0', NULL, '0', NULL, 'Profile Pictures', 'public'),
(4, 1, 'page', '0', NULL, '0', NULL, 'Cover Photos', 'public'),
(5, 2, 'page', '0', NULL, '0', NULL, 'Profile Pictures', 'public'),
(6, 2, 'page', '0', NULL, '0', NULL, 'Cover Photos', 'public');

-- --------------------------------------------------------

--
-- Table structure for table `posts_photos_reactions`
--

CREATE TABLE `posts_photos_reactions` (
  `id` int UNSIGNED NOT NULL,
  `photo_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `reaction` varchar(32) NOT NULL DEFAULT 'like',
  `reaction_time` datetime DEFAULT NULL,
  `points_earned` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts_polls`
--

CREATE TABLE `posts_polls` (
  `poll_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `votes` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts_polls`
--

INSERT INTO `posts_polls` (`poll_id`, `post_id`, `votes`) VALUES
(1, 13, 3),
(2, 14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `posts_polls_options`
--

CREATE TABLE `posts_polls_options` (
  `option_id` int UNSIGNED NOT NULL,
  `poll_id` int UNSIGNED NOT NULL,
  `text` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts_polls_options`
--

INSERT INTO `posts_polls_options` (`option_id`, `poll_id`, `text`) VALUES
(1, 1, 'نعم'),
(2, 1, 'لا'),
(3, 1, 'ستأخذ المشاورات بعض الوقت'),
(4, 2, 'العودة لنظام بشار الاسد'),
(5, 2, 'تحويل النظام لاقاليم'),
(6, 2, 'انتخابات حره باشراف دولي');

-- --------------------------------------------------------

--
-- Table structure for table `posts_polls_options_users`
--

CREATE TABLE `posts_polls_options_users` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `poll_id` int UNSIGNED NOT NULL,
  `option_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts_polls_options_users`
--

INSERT INTO `posts_polls_options_users` (`id`, `user_id`, `poll_id`, `option_id`) VALUES
(4, 3, 1, 2),
(6, 1, 2, 5),
(7, 75, 2, 5),
(12, 77, 1, 2),
(14, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts_products`
--

CREATE TABLE `posts_products` (
  `product_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `name` varchar(256) NOT NULL,
  `price` float UNSIGNED NOT NULL DEFAULT '0',
  `currency_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `status` enum('new','old') NOT NULL DEFAULT 'new',
  `location` varchar(255) NOT NULL,
  `available` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts_reactions`
--

CREATE TABLE `posts_reactions` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `reaction` varchar(32) NOT NULL DEFAULT 'like',
  `reaction_time` datetime DEFAULT NULL,
  `points_earned` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts_reactions`
--

INSERT INTO `posts_reactions` (`id`, `post_id`, `user_id`, `reaction`, `reaction_time`, `points_earned`) VALUES
(1, 13, 3, 'love', '2023-01-15 14:56:38', '0'),
(3, 15, 1, 'like', '2023-01-16 06:53:32', '0');

-- --------------------------------------------------------

--
-- Table structure for table `posts_saved`
--

CREATE TABLE `posts_saved` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts_saved`
--

INSERT INTO `posts_saved` (`id`, `post_id`, `user_id`, `time`) VALUES
(1, 23, 75, '2023-01-27 20:06:30');

-- --------------------------------------------------------

--
-- Table structure for table `posts_videos`
--

CREATE TABLE `posts_videos` (
  `video_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `source` varchar(256) NOT NULL,
  `source_240p` varchar(256) DEFAULT NULL,
  `source_360p` varchar(256) DEFAULT NULL,
  `source_480p` varchar(256) DEFAULT NULL,
  `source_720p` varchar(256) DEFAULT NULL,
  `source_1080p` varchar(256) DEFAULT NULL,
  `source_1440p` varchar(256) DEFAULT NULL,
  `source_2160p` varchar(256) DEFAULT NULL,
  `thumbnail` varchar(256) DEFAULT NULL,
  `views` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `node_id` int UNSIGNED NOT NULL,
  `node_type` varchar(32) NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `reason` text NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `reports_categories`
--

CREATE TABLE `reports_categories` (
  `category_id` int UNSIGNED NOT NULL,
  `category_parent_id` int UNSIGNED NOT NULL,
  `category_name` varchar(256) NOT NULL,
  `category_description` text NOT NULL,
  `category_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `reports_categories`
--

INSERT INTO `reports_categories` (`category_id`, `category_parent_id`, `category_name`, `category_description`, `category_order`) VALUES
(1, 0, 'Nudity', '', 1),
(2, 0, 'Violence', '', 2),
(3, 0, 'Harassment', '', 3),
(4, 0, 'Suicide or Self-Injury', '', 4),
(5, 0, 'False Information', '', 5),
(6, 0, 'Spam', '', 6),
(7, 0, 'Unauthorized Sales', '', 7),
(8, 0, 'Hate Speech', '', 8),
(9, 0, 'Terrorism', '', 9),
(10, 0, 'Something Else', '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `static_pages`
--

CREATE TABLE `static_pages` (
  `page_id` int UNSIGNED NOT NULL,
  `page_url` varchar(64) NOT NULL,
  `page_title` varchar(256) NOT NULL,
  `page_text` mediumtext NOT NULL,
  `page_in_footer` enum('0','1') NOT NULL DEFAULT '1',
  `page_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `static_pages`
--

INSERT INTO `static_pages` (`page_id`, `page_url`, `page_title`, `page_text`, `page_in_footer`, `page_order`) VALUES
(1, 'about', 'About', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;\r\n&lt;h3 class=&quot;text-info&quot;&gt;Big Title&lt;/h3&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;\r\n&lt;h3 class=&quot;text-info&quot;&gt;Big Title&lt;/h3&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;', '1', 1),
(2, 'terms', 'Terms', '&lt;p&gt;The Polex website located at &lt;a href=&quot;https://demo.sngine.com/&quot;&gt;https://polex.world&lt;/a&gt;&amp;nbsp;is a copyrighted work belonging to Polex. Certain features of the Site may be subject to additional guidelines, terms, or rules, which will be posted on the Site in connection with such features.&lt;/p&gt;\r\n&lt;p&gt;All such additional terms, guidelines, and rules are incorporated by reference into these Terms.&lt;/p&gt;\r\n&lt;p&gt;These Terms of Use described the legally binding terms and conditions that oversee your use of the Site.&amp;nbsp;BY LOGGING INTO THE SITE, YOU ARE BEING COMPLIANT THAT THESE TERMS and you represent that you have the authority and capacity to enter into these Terms.&amp;nbsp;YOU SHOULD BE AT LEAST 18 YEARS OF AGE TO ACCESS THE SITE. IF YOU DISAGREE WITH ALL OF THE PROVISION OF THESE TERMS, DO NOT LOG INTO AND/OR USE THE SITE.&lt;/p&gt;\r\n&lt;p&gt;These terms require the use of arbitration Section 10.2 on an individual basis to resolve disputes and also limit the remedies available to you in the event of a dispute.&lt;/p&gt;\r\n&lt;h2&gt;Access to the Site&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Subject to these Terms.&lt;/strong&gt; Company grants you a non-transferable, non-exclusive, revocable, limited license to access the Site solely for your own personal, noncommercial use.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Certain Restrictions.&lt;/strong&gt; The rights approved to you in these Terms are subject to the following restrictions: (a) you shall not sell, rent, lease, transfer, assign, distribute, host, or otherwise commercially exploit the Site; (b) you shall not change, make derivative works of, disassemble, reverse compile or reverse engineer any part of the Site; (c) you shall not access the Site in order to build a similar or competitive website; and (d) except as expressly stated herein, no part of the Site may be copied, reproduced, distributed, republished, downloaded, displayed, posted or transmitted in any form or by any means unless otherwise indicated, any future release, update, or other addition to functionality of the Site shall be subject to these Terms.&amp;nbsp; All copyright and other proprietary notices on the Site must be retained on all copies thereof.&lt;/p&gt;\r\n&lt;p&gt;Company reserves the right to change, suspend, or cease the Site with or without notice to you.&amp;nbsp; You approved that Company will not be held liable to you or any third-party for any change, interruption, or termination of the Site or any part.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;No Support or Maintenance.&lt;/strong&gt; You agree that Company will have no obligation to provide you with any support in connection with the Site.&lt;/p&gt;\r\n&lt;p&gt;Excluding any User Content that you may provide, you are aware that all the intellectual property rights, including copyrights, patents, trademarks, and trade secrets, in the Site and its content are owned by Company or Company&amp;rsquo;s suppliers. Note that these Terms and access to the Site do not give you any rights, title or interest in or to any intellectual property rights, except for the limited access rights expressed in Section 2.1. Company and its suppliers reserve all rights not granted in these Terms.&lt;/p&gt;\r\n&lt;h2&gt;User Content&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;User Content.&lt;/strong&gt; &quot;User Content&quot; means any and all information and content that a user submits to the Site. You are exclusively responsible for your User Content. You bear all risks associated with use of your User Content.&amp;nbsp; You hereby certify that your User Content does not violate our Acceptable Use Policy.&amp;nbsp; You may not represent or imply to others that your User Content is in any way provided, sponsored or endorsed by Company. Because you alone are responsible for your User Content, you may expose yourself to liability. Company is not obliged to backup any User Content that you post; also, your User Content may be deleted at any time without prior notice to you. You are solely responsible for making your own backup copies of your User Content if you desire.&lt;/p&gt;\r\n&lt;p&gt;You hereby grant to Company an irreversible, nonexclusive, royalty-free and fully paid, worldwide license to reproduce, distribute, publicly display and perform, prepare derivative works of, incorporate into other works, and otherwise use and exploit your User Content, and to grant sublicenses of the foregoing rights, solely for the purposes of including your User Content in the Site.&amp;nbsp; You hereby irreversibly waive any claims and assertions of moral rights or attribution with respect to your User Content.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Acceptable Use Policy.&lt;/strong&gt; The following terms constitute our &quot;Acceptable Use Policy&quot;: You agree not to use the Site to collect, upload, transmit, display, or distribute any User Content (i) that violates any third-party right or any intellectual property or proprietary right; (ii) that is unlawful, harassing, abusive, tortious, threatening, harmful, invasive of another&amp;rsquo;s privacy, vulgar, defamatory, false, intentionally misleading, trade libelous, pornographic, obscene, patently offensive, promotes racism, bigotry, hatred, or physical harm of any kind against any group or individual; (iii) that is harmful to minors in any way; or (iv) that is in violation of any law, regulation, or obligations or restrictions imposed by any third party.&lt;/p&gt;\r\n&lt;p&gt;In addition, you agree not to: (i) upload, transmit, or distribute to or through the Site any software intended to damage or alter a computer system or data; (ii) send through the Site unsolicited or unauthorized advertising, promotional materials, junk mail, spam, chain letters, pyramid schemes, or any other form of duplicative or unsolicited messages; (iii) use the Site to harvest, collect, gather or assemble information or data regarding other users without their consent; (iv) interfere with, disrupt, or create an undue burden on servers or networks connected to the Site, or violate the regulations, policies or procedures of such networks; (v) attempt to gain unauthorized access to the Site, whether through password mining or any other means; (vi) harass or interfere with any other user&amp;rsquo;s use and enjoyment of the Site; or (vi) use software or automated agents or scripts to produce multiple accounts on the Site, or to generate automated searches, requests, or queries to the Site.&lt;/p&gt;\r\n&lt;p&gt;We reserve the right to review any User Content, and to investigate and/or take appropriate action against you in our sole discretion if you violate the Acceptable Use Policy or any other provision of these Terms or otherwise create liability for us or any other person. Such action may include removing or modifying your User Content, terminating your Account in accordance with Section 8, and/or reporting you to law enforcement authorities.&lt;/p&gt;\r\n&lt;p&gt;If you provide Company with any feedback or suggestions regarding the Site, you hereby assign to Company all rights in such Feedback and agree that Company shall have the right to use and fully exploit such Feedback and related information in any manner it believes appropriate.&amp;nbsp; Company will treat any Feedback you provide to Company as non-confidential and non-proprietary.&lt;/p&gt;\r\n&lt;p&gt;You agree to indemnify and hold Company and its officers, employees, and agents harmless, including costs and attorneys&amp;rsquo; fees, from any claim or demand made by any third-party due to or arising out of (a) your use of the Site, (b) your violation of these Terms, (c) your violation of applicable laws or regulations or (d) your User Content.&amp;nbsp; Company reserves the right to assume the exclusive defense and control of any matter for which you are required to indemnify us, and you agree to cooperate with our defense of these claims.&amp;nbsp; You agree not to settle any matter without the prior written consent of Company.&amp;nbsp; Company will use reasonable efforts to notify you of any such claim, action or proceeding upon becoming aware of it.&lt;/p&gt;\r\n&lt;h2&gt;Third-Party Links &amp;amp; Ads; Other Users&lt;/h2&gt;\r\n&lt;p&gt;&lt;strong&gt;Third-Party Links &amp;amp; Ads.&lt;/strong&gt; The Site may contain links to third-party websites and services, and/or display advertisements for third-parties.&amp;nbsp; Such Third-Party Links &amp;amp; Ads are not under the control of Company, and Company is not responsible for any Third-Party Links &amp;amp; Ads.&amp;nbsp; Company provides access to these Third-Party Links &amp;amp; Ads only as a convenience to you, and does not review, approve, monitor, endorse, warrant, or make any representations with respect to Third-Party Links &amp;amp; Ads.&amp;nbsp; You use all Third-Party Links &amp;amp; Ads at your own risk, and should apply a suitable level of caution and discretion in doing so. When you click on any of the Third-Party Links &amp;amp; Ads, the applicable third party&amp;rsquo;s terms and policies apply, including the third party&amp;rsquo;s privacy and data gathering practices.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Other Users.&lt;/strong&gt; Each Site user is solely responsible for any and all of its own User Content.&amp;nbsp; Because we do not control User Content, you acknowledge and agree that we are not responsible for any User Content, whether provided by you or by others.&amp;nbsp; You agree that Company will not be responsible for any loss or damage incurred as the result of any such interactions.&amp;nbsp; If there is a dispute between you and any Site user, we are under no obligation to become involved.&lt;/p&gt;\r\n&lt;p&gt;You hereby release and forever discharge the Company and our officers, employees, agents, successors, and assigns from, and hereby waive and relinquish, each and every past, present and future dispute, claim, controversy, demand, right, obligation, liability, action and cause of action of every kind and nature, that has arisen or arises directly or indirectly out of, or that relates directly or indirectly to, the Site. If you are a California resident, you hereby waive California civil code section 1542 in connection with the foregoing, which states: &quot;a general release does not extend to claims which the creditor does not know or suspect to exist in his or her favor at the time of executing the release, which if known by him or her must have materially affected his or her settlement with the debtor.&quot;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Cookies and Web Beacons.&lt;/strong&gt; Like any other website, Polex uses &amp;lsquo;cookies&amp;rsquo;. These cookies are used to store information including visitors&amp;rsquo; preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimize the users&amp;rsquo; experience by customizing our web page content based on visitors&amp;rsquo; browser type and/or other information.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Google DoubleClick DART Cookie.&lt;/strong&gt; Google is one of a third-party vendor on our site. It also uses cookies, known as DART cookies, to serve ads to our site visitors based upon their visit to www.website.com and other sites on the internet. However, visitors may choose to decline the use of DART cookies by visiting the Google ad and content network Privacy Policy at the following URL &amp;ndash; &lt;a href=&quot;https://policies.google.com/technologies/ads&quot;&gt;https://policies.google.com/technologies/ads&lt;/a&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Our Advertising Partners.&lt;/strong&gt; Some of advertisers on our site may use cookies and web beacons. Our advertising partners are listed below. Each of our advertising partners has their own Privacy Policy for their policies on user data. For easier access, we hyperlinked to their Privacy Policies below.&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;\r\n&lt;p&gt;Google&lt;/p&gt;\r\n&lt;p&gt;&lt;a href=&quot;https://policies.google.com/technologies/ads&quot;&gt;https://policies.google.com/technologies/ads&lt;/a&gt;&lt;/p&gt;\r\n&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2&gt;Disclaimers&lt;/h2&gt;\r\n&lt;p&gt;The site is provided on an &quot;as-is&quot; and &quot;as available&quot; basis, and company and our suppliers expressly disclaim any and all warranties and conditions of any kind, whether express, implied, or statutory, including all warranties or conditions of merchantability, fitness for a particular purpose, title, quiet enjoyment, accuracy, or non-infringement.&amp;nbsp; We and our suppliers make not guarantee that the site will meet your requirements, will be available on an uninterrupted, timely, secure, or error-free basis, or will be accurate, reliable, free of viruses or other harmful code, complete, legal, or safe.&amp;nbsp; If applicable law requires any warranties with respect to the site, all such warranties are limited in duration to ninety (90) days from the date of first use.&lt;/p&gt;\r\n&lt;p&gt;Some jurisdictions do not allow the exclusion of implied warranties, so the above exclusion may not apply to you.&amp;nbsp; Some jurisdictions do not allow limitations on how long an implied warranty lasts, so the above limitation may not apply to you.&lt;/p&gt;\r\n&lt;h2&gt;Limitation on Liability&lt;/h2&gt;\r\n&lt;p&gt;To the maximum extent permitted by law, in no event shall company or our suppliers be liable to you or any third-party for any lost profits, lost data, costs of procurement of substitute products, or any indirect, consequential, exemplary, incidental, special or punitive damages arising from or relating to these terms or your use of, or incapability to use the site even if company has been advised of the possibility of such damages.&amp;nbsp; Access to and use of the site is at your own discretion and risk, and you will be solely responsible for any damage to your device or computer system, or loss of data resulting therefrom.&lt;/p&gt;\r\n&lt;p&gt;To the maximum extent permitted by law, notwithstanding anything to the contrary contained herein, our liability to you for any damages arising from or related to this agreement, will at all times be limited to a maximum of fifty U.S. dollars (u.s. $50). The existence of more than one claim will not enlarge this limit.&amp;nbsp; You agree that our suppliers will have no liability of any kind arising from or relating to this agreement.&lt;/p&gt;\r\n&lt;p&gt;Some jurisdictions do not allow the limitation or exclusion of liability for incidental or consequential damages, so the above limitation or exclusion may not apply to you.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Term and Termination.&lt;/strong&gt; Subject to this Section, these Terms will remain in full force and effect while you use the Site.&amp;nbsp; We may suspend or terminate your rights to use the Site at any time for any reason at our sole discretion, including for any use of the Site in violation of these Terms.&amp;nbsp; Upon termination of your rights under these Terms, your Account and right to access and use the Site will terminate immediately.&amp;nbsp; You understand that any termination of your Account may involve deletion of your User Content associated with your Account from our live databases.&amp;nbsp; Company will not have any liability whatsoever to you for any termination of your rights under these Terms.&amp;nbsp; Even after your rights under these Terms are terminated, the following provisions of these Terms will remain in effect: Sections 2 through 2.5, Section 3 and Sections 4 through 10.&lt;/p&gt;\r\n&lt;h2&gt;Copyright Policy.&lt;/h2&gt;\r\n&lt;p&gt;Company respects the intellectual property of others and asks that users of our Site do the same.&amp;nbsp; In connection with our Site, we have adopted and implemented a policy respecting copyright law that provides for the removal of any infringing materials and for the termination of users of our online Site who are repeated infringers of intellectual property rights, including copyrights.&amp;nbsp; If you believe that one of our users is, through the use of our Site, unlawfully infringing the copyright(s) in a work, and wish to have the allegedly infringing material removed, the following information in the form of a written notification (pursuant to 17 U.S.C. &amp;sect; 512(c)) must be provided to our designated Copyright Agent:&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;your physical or electronic signature;&lt;/li&gt;\r\n&lt;li&gt;identification of the copyrighted work(s) that you claim to have been infringed;&lt;/li&gt;\r\n&lt;li&gt;identification of the material on our services that you claim is infringing and that you request us to remove;&lt;/li&gt;\r\n&lt;li&gt;sufficient information to permit us to locate such material;&lt;/li&gt;\r\n&lt;li&gt;your address, telephone number, and e-mail address;&lt;/li&gt;\r\n&lt;li&gt;a statement that you have a good faith belief that use of the objectionable material is not authorized by the copyright owner, its agent, or under the law; and&lt;/li&gt;\r\n&lt;li&gt;a statement that the information in the notification is accurate, and under penalty of perjury, that you are either the owner of the copyright that has allegedly been infringed or that you are authorized to act on behalf of the copyright owner.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;Please note that, pursuant to 17 U.S.C. &amp;sect; 512(f), any misrepresentation of material fact in a written notification automatically subjects the complaining party to liability for any damages, costs and attorney&amp;rsquo;s fees incurred by us in connection with the written notification and allegation of copyright infringement.&lt;/p&gt;\r\n&lt;h2&gt;General&lt;/h2&gt;\r\n&lt;p&gt;These Terms are subject to occasional revision, and if we make any substantial changes, we may notify you by sending you an e-mail to the last e-mail address you provided to us and/or by prominently posting notice of the changes on our Site.&amp;nbsp; You are responsible for providing us with your most current e-mail address.&amp;nbsp; In the event that the last e-mail address that you have provided us is not valid our dispatch of the e-mail containing such notice will nonetheless constitute effective notice of the changes described in the notice.&amp;nbsp; Any changes to these Terms will be effective upon the earliest of thirty (30) calendar days following our dispatch of an e-mail notice to you or thirty (30) calendar days following our posting of notice of the changes on our Site.&amp;nbsp; These changes will be effective immediately for new users of our Site.&amp;nbsp; Continued use of our Site following notice of such changes shall indicate your acknowledgement of such changes and agreement to be bound by the terms and conditions of such changes. Dispute Resolution. Please read this Arbitration Agreement carefully. It is part of your contract with Company and affects your rights.&amp;nbsp; It contains procedures for MANDATORY BINDING ARBITRATION AND A CLASS ACTION WAIVER.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Applicability of Arbitration Agreement.&lt;/strong&gt; All claims and disputes in connection with the Terms or the use of any product or service provided by the Company that cannot be resolved informally or in small claims court shall be resolved by binding arbitration on an individual basis under the terms of this Arbitration Agreement.&amp;nbsp; Unless otherwise agreed to, all arbitration proceedings shall be held in English.&amp;nbsp; This Arbitration Agreement applies to you and the Company, and to any subsidiaries, affiliates, agents, employees, predecessors in interest, successors, and assigns, as well as all authorized or unauthorized users or beneficiaries of services or goods provided under the Terms.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Notice Requirement and Informal Dispute Resolution.&lt;/strong&gt; Before either party may seek arbitration, the party must first send to the other party a written Notice of Dispute describing the nature and basis of the claim or dispute, and the requested relief.&amp;nbsp; A Notice to the Company should be sent to: Polex. After the Notice is received, you and the Company may attempt to resolve the claim or dispute informally.&amp;nbsp; If you and the Company do not resolve the claim or dispute within thirty (30) days after the Notice is received, either party may begin an arbitration proceeding.&amp;nbsp; The amount of any settlement offer made by any party may not be disclosed to the arbitrator until after the arbitrator has determined the amount of the award to which either party is entitled.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Arbitration Rules.&lt;/strong&gt; Arbitration shall be initiated through the American Arbitration Association, an established alternative dispute resolution provider that offers arbitration as set forth in this section.&amp;nbsp; If AAA is not available to arbitrate, the parties shall agree to select an alternative ADR Provider.&amp;nbsp; The rules of the ADR Provider shall govern all aspects of the arbitration except to the extent such rules are in conflict with the Terms.&amp;nbsp; The AAA Consumer Arbitration Rules governing the arbitration are available online at adr.org or by calling the AAA at 1-800-778-7879.&amp;nbsp; The arbitration shall be conducted by a single, neutral arbitrator.&amp;nbsp; Any claims or disputes where the total amount of the award sought is less than Ten Thousand U.S. Dollars (US $10,000.00) may be resolved through binding non-appearance-based arbitration, at the option of the party seeking relief.&amp;nbsp; For claims or disputes where the total amount of the award sought is Ten Thousand U.S. Dollars (US $10,000.00) or more, the right to a hearing will be determined by the Arbitration Rules.&amp;nbsp; Any hearing will be held in a location within 100 miles of your residence, unless you reside outside of the United States, and unless the parties agree otherwise.&amp;nbsp; If you reside outside of the U.S., the arbitrator shall give the parties reasonable notice of the date, time and place of any oral hearings. Any judgment on the award rendered by the arbitrator may be entered in any court of competent jurisdiction.&amp;nbsp; If the arbitrator grants you an award that is greater than the last settlement offer that the Company made to you prior to the initiation of arbitration, the Company will pay you the greater of the award or $2,500.00.&amp;nbsp; Each party shall bear its own costs and disbursements arising out of the arbitration and shall pay an equal share of the fees and costs of the ADR Provider.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Additional Rules for Non-Appearance Based Arbitration.&lt;/strong&gt; If non-appearance based arbitration is elected, the arbitration shall be conducted by telephone, online and/or based solely on written submissions; the specific manner shall be chosen by the party initiating the arbitration.&amp;nbsp; The arbitration shall not involve any personal appearance by the parties or witnesses unless otherwise agreed by the parties.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Time Limits.&lt;/strong&gt; If you or the Company pursues arbitration, the arbitration action must be initiated and/or demanded within the statute of limitations and within any deadline imposed under the AAA Rules for the pertinent claim.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Authority of Arbitrator.&lt;/strong&gt; If arbitration is initiated, the arbitrator will decide the rights and liabilities of you and the Company, and the dispute will not be consolidated with any other matters or joined with any other cases or parties.&amp;nbsp; The arbitrator shall have the authority to grant motions dispositive of all or part of any claim.&amp;nbsp; The arbitrator shall have the authority to award monetary damages, and to grant any non-monetary remedy or relief available to an individual under applicable law, the AAA Rules, and the Terms.&amp;nbsp; The arbitrator shall issue a written award and statement of decision describing the essential findings and conclusions on which the award is based.&amp;nbsp; The arbitrator has the same authority to award relief on an individual basis that a judge in a court of law would have.&amp;nbsp; The award of the arbitrator is final and binding upon you and the Company.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Waiver of Jury Trial.&lt;/strong&gt; THE PARTIES HEREBY WAIVE THEIR CONSTITUTIONAL AND STATUTORY RIGHTS TO GO TO COURT AND HAVE A TRIAL IN FRONT OF A JUDGE OR A JURY, instead electing that all claims and disputes shall be resolved by arbitration under this Arbitration Agreement.&amp;nbsp; Arbitration procedures are typically more limited, more efficient and less expensive than rules applicable in a court and are subject to very limited review by a court.&amp;nbsp; In the event any litigation should arise between you and the Company in any state or federal court in a suit to vacate or enforce an arbitration award or otherwise, YOU AND THE COMPANY WAIVE ALL RIGHTS TO A JURY TRIAL, instead electing that the dispute be resolved by a judge.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Waiver of Class or Consolidated Actions.&lt;/strong&gt; All claims and disputes within the scope of this arbitration agreement must be arbitrated or litigated on an individual basis and not on a class basis, and claims of more than one customer or user cannot be arbitrated or litigated jointly or consolidated with those of any other customer or user.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Confidentiality.&lt;/strong&gt; All aspects of the arbitration proceeding shall be strictly confidential.&amp;nbsp; The parties agree to maintain confidentiality unless otherwise required by law.&amp;nbsp; This paragraph shall not prevent a party from submitting to a court of law any information necessary to enforce this Agreement, to enforce an arbitration award, or to seek injunctive or equitable relief.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Severability.&lt;/strong&gt; If any part or parts of this Arbitration Agreement are found under the law to be invalid or unenforceable by a court of competent jurisdiction, then such specific part or parts shall be of no force and effect and shall be severed and the remainder of the Agreement shall continue in full force and effect.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Right to Waive.&lt;/strong&gt; Any or all of the rights and limitations set forth in this Arbitration Agreement may be waived by the party against whom the claim is asserted.&amp;nbsp; Such waiver shall not waive or affect any other portion of this Arbitration Agreement.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Survival of Agreement.&lt;/strong&gt; This Arbitration Agreement will survive the termination of your relationship with Company.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Small Claims Court.&lt;/strong&gt; Nonetheless the foregoing, either you or the Company may bring an individual action in small claims court.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Emergency Equitable Relief.&lt;/strong&gt; Anyhow the foregoing, either party may seek emergency equitable relief before a state or federal court in order to maintain the status quo pending arbitration.&amp;nbsp; A request for interim measures shall not be deemed a waiver of any other rights or obligations under this Arbitration Agreement.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Claims Not Subject to Arbitration.&lt;/strong&gt; Notwithstanding the foregoing, claims of defamation, violation of the Computer Fraud and Abuse Act, and infringement or misappropriation of the other party&amp;rsquo;s patent, copyright, trademark or trade secrets shall not be subject to this Arbitration Agreement.&lt;/p&gt;\r\n&lt;p&gt;In any circumstances where the foregoing Arbitration Agreement permits the parties to litigate in court, the parties hereby agree to submit to the personal jurisdiction of the courts located within Netherlands County, California, for such purposes.&lt;/p&gt;\r\n&lt;p&gt;The Site may be subject to U.S. export control laws and may be subject to export or import regulations in other countries. You agree not to export, re-export, or transfer, directly or indirectly, any U.S. technical data acquired from Company, or any products utilizing such data, in violation of the United States export laws or regulations.&lt;/p&gt;\r\n&lt;p&gt;Company is located at the address in Section 10.8. If you are a California resident, you may report complaints to the Complaint Assistance Unit of the Division of Consumer Product of the California Department of Consumer Affairs by contacting them in writing at 400 R Street, Sacramento, CA 95814, or by telephone at (800) 952-5210.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Electronic Communications.&lt;/strong&gt; The communications between you and Company use electronic means, whether you use the Site or send us emails, or whether Company posts notices on the Site or communicates with you via email. For contractual purposes, you (a) consent to receive communications from Company in an electronic form; and (b) agree that all terms and conditions, agreements, notices, disclosures, and other communications that Company provides to you electronically satisfy any legal obligation that such communications would satisfy if it were be in a hard copy writing.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Entire Terms.&lt;/strong&gt; These Terms constitute the entire agreement between you and us regarding the use of the Site. Our failure to exercise or enforce any right or provision of these Terms shall not operate as a waiver of such right or provision. The section titles in these Terms are for convenience only and have no legal or contractual effect. The word &quot;including&quot; means &quot;including without limitation&quot;. If any provision of these Terms is held to be invalid or unenforceable, the other provisions of these Terms will be unimpaired and the invalid or unenforceable provision will be deemed modified so that it is valid and enforceable to the maximum extent permitted by law.&amp;nbsp; Your relationship to Company is that of an independent contractor, and neither party is an agent or partner of the other.&amp;nbsp; These Terms, and your rights and obligations herein, may not be assigned, subcontracted, delegated, or otherwise transferred by you without Company&amp;rsquo;s prior written consent, and any attempted assignment, subcontract, delegation, or transfer in violation of the foregoing will be null and void.&amp;nbsp; Company may freely assign these Terms.&amp;nbsp; The terms and conditions set forth in these Terms shall be binding upon assignees.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Your Privacy.&lt;/strong&gt; Please read our Privacy Policy.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Copyright/Trademark Information.&lt;/strong&gt; Copyright &amp;copy;. All rights reserved.&amp;nbsp; All trademarks, logos and service marks displayed on the Site are our property or the property of other third-parties. You are not permitted to use these Marks without our prior written consent or the consent of such third party which may own the Marks.&lt;/p&gt;', '1', 2),
(3, 'privacy', 'Privacy', '&lt;p&gt;At Polex, accessible from &lt;a href=&quot;https://demo.sngine.com/&quot;&gt;https://polex.world/&lt;/a&gt;, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Polex and how we use it.&lt;/p&gt;\r\n&lt;p&gt;If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.&lt;/p&gt;\r\n&lt;p&gt;This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Polex. This policy is not applicable to any information collected offline or via channels other than this website.&lt;/p&gt;\r\n&lt;h2&gt;Consent&lt;/h2&gt;\r\n&lt;p&gt;By using our website, you hereby consent to our Privacy Policy and agree to its terms.&lt;/p&gt;\r\n&lt;h2&gt;Information we collect&lt;/h2&gt;\r\n&lt;p&gt;The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.&lt;/p&gt;\r\n&lt;p&gt;If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.&lt;/p&gt;\r\n&lt;p&gt;When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.&lt;/p&gt;\r\n&lt;h2&gt;How we use your information&lt;/h2&gt;\r\n&lt;p&gt;We use the information we collect in various ways, including to:&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Provide, operate, and maintain our website&lt;/li&gt;\r\n&lt;li&gt;Improve, personalize, and expand our website&lt;/li&gt;\r\n&lt;li&gt;Understand and analyze how you use our website&lt;/li&gt;\r\n&lt;li&gt;Develop new products, services, features, and functionality&lt;/li&gt;\r\n&lt;li&gt;Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes&lt;/li&gt;\r\n&lt;li&gt;Send you emails&lt;/li&gt;\r\n&lt;li&gt;Find and prevent fraud&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2&gt;Log Files&lt;/h2&gt;\r\n&lt;p&gt;Polex follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services&#039; analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users&#039; movement on the website, and gathering demographic information.&lt;/p&gt;\r\n&lt;h2&gt;Cookies and Web Beacons&lt;/h2&gt;\r\n&lt;p&gt;Like any other website, Polex uses &#039;cookies&#039;. These cookies are used to store information including visitors&#039; preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimize the users&#039; experience by customizing our web page content based on visitors&#039; browser type and/or other information.&lt;/p&gt;\r\n&lt;h2&gt;Google DoubleClick DART Cookie&lt;/h2&gt;\r\n&lt;p&gt;Google is one of a third-party vendor on our site. It also uses cookies, known as DART cookies, to serve ads to our site visitors based upon their visit to www.website.com and other sites on the internet. However, visitors may choose to decline the use of DART cookies by visiting the Google ad and content network Privacy Policy at the following URL &amp;ndash;&amp;nbsp;&lt;a href=&quot;https://policies.google.com/technologies/ads&quot;&gt;https://policies.google.com/technologies/ads&lt;/a&gt;&lt;/p&gt;\r\n&lt;h2&gt;Our Advertising Partners&lt;/h2&gt;\r\n&lt;p&gt;Some of advertisers on our site may use cookies and web beacons. Our advertising partners are listed below. Each of our advertising partners has their own Privacy Policy for their policies on user data. For easier access, we hyperlinked to their Privacy Policies below.&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;\r\n&lt;p&gt;Google&lt;/p&gt;\r\n&lt;p&gt;&lt;a href=&quot;https://policies.google.com/technologies/ads&quot;&gt;https://policies.google.com/technologies/ads&lt;/a&gt;&lt;/p&gt;\r\n&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2&gt;Advertising Partners Privacy Policies&lt;/h2&gt;\r\n&lt;p&gt;You may consult this list to find the Privacy Policy for each of the advertising partners of Polex.&lt;/p&gt;\r\n&lt;p&gt;Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Polex, which are sent directly to users&#039; browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.&lt;/p&gt;\r\n&lt;p&gt;Note that Polex has no access to or control over these cookies that are used by third-party advertisers.&lt;/p&gt;\r\n&lt;h2&gt;Third Party Privacy Policies&lt;/h2&gt;\r\n&lt;p&gt;Polex&#039;s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.&lt;/p&gt;\r\n&lt;p&gt;You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers&#039; respective websites.&lt;/p&gt;\r\n&lt;h2&gt;CCPA Privacy Rights (Do Not Sell My Personal Information)&lt;/h2&gt;\r\n&lt;p&gt;Under the CCPA, among other rights, California consumers have the right to:&lt;/p&gt;\r\n&lt;p&gt;Request that a business that collects a consumer&#039;s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.&lt;/p&gt;\r\n&lt;p&gt;Request that a business delete any personal data about the consumer that a business has collected.&lt;/p&gt;\r\n&lt;p&gt;Request that a business that sells a consumer&#039;s personal data, not sell the consumer&#039;s personal data.&lt;/p&gt;\r\n&lt;p&gt;If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.&lt;/p&gt;\r\n&lt;h2&gt;GDPR Data Protection Rights&lt;/h2&gt;\r\n&lt;p&gt;We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:&lt;/p&gt;\r\n&lt;p&gt;The right to access &amp;ndash; You have the right to request copies of your personal data. We may charge you a small fee for this service.&lt;/p&gt;\r\n&lt;p&gt;The right to rectification &amp;ndash; You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.&lt;/p&gt;\r\n&lt;p&gt;The right to erasure &amp;ndash; You have the right to request that we erase your personal data, under certain conditions.&lt;/p&gt;\r\n&lt;p&gt;The right to restrict processing &amp;ndash; You have the right to request that we restrict the processing of your personal data, under certain conditions.&lt;/p&gt;\r\n&lt;p&gt;The right to object to processing &amp;ndash; You have the right to object to our processing of your personal data, under certain conditions.&lt;/p&gt;\r\n&lt;p&gt;The right to data portability &amp;ndash; You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.&lt;/p&gt;\r\n&lt;p&gt;If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.&lt;/p&gt;\r\n&lt;h2&gt;Children&#039;s Information&lt;/h2&gt;\r\n&lt;p&gt;Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.&lt;/p&gt;\r\n&lt;p&gt;Polex does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.&lt;/p&gt;', '1', 3);

-- --------------------------------------------------------

--
-- Table structure for table `stickers`
--

CREATE TABLE `stickers` (
  `sticker_id` int UNSIGNED NOT NULL,
  `image` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `stickers`
--

INSERT INTO `stickers` (`sticker_id`, `image`) VALUES
(1, 'stickers/1.png'),
(2, 'stickers/2.png'),
(3, 'stickers/3.png'),
(4, 'stickers/4.png'),
(5, 'stickers/5.png'),
(6, 'stickers/6.png'),
(7, 'stickers/7.png'),
(8, 'stickers/8.png'),
(9, 'stickers/9.png'),
(10, 'stickers/10.png'),
(11, 'stickers/11.png'),
(12, 'stickers/12.png'),
(13, 'stickers/13.png'),
(14, 'stickers/14.png'),
(15, 'stickers/15.png'),
(16, 'stickers/16.png'),
(17, 'stickers/17.png'),
(18, 'stickers/18.png'),
(19, 'stickers/19.png'),
(20, 'stickers/20.png');

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `story_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `stories_media`
--

CREATE TABLE `stories_media` (
  `media_id` int UNSIGNED NOT NULL,
  `story_id` int UNSIGNED NOT NULL,
  `source` varchar(256) NOT NULL,
  `is_photo` enum('0','1') NOT NULL DEFAULT '1',
  `text` text NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `node_id` int UNSIGNED NOT NULL,
  `node_type` varchar(32) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `user_id`, `node_id`, `node_type`, `time`) VALUES
(2, 3, 1, 'user', '2022-11-11 11:54:53'),
(3, 4, 1, 'user', '2022-11-11 11:54:53'),
(4, 6, 7, 'group', '2022-11-11 11:54:53'),
(5, 3, 7, 'group', '2022-11-11 11:54:53'),
(6, 4, 7, 'group', '2022-11-11 11:54:53'),
(7, 5, 7, 'group', '2022-11-11 11:54:53'),
(9, 3, 8, 'page', '2022-11-11 11:54:53'),
(10, 4, 8, 'page', '2022-11-11 11:54:53'),
(11, 5, 8, 'page', '2022-11-11 11:54:53'),
(12, 6, 8, 'page', '2022-11-11 11:54:53'),
(13, 7, 8, 'page', '2022-11-11 11:54:53');

-- --------------------------------------------------------

--
-- Table structure for table `system_countries`
--

CREATE TABLE `system_countries` (
  `country_id` int UNSIGNED NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `country_name` varchar(64) NOT NULL,
  `phone_code` varchar(8) DEFAULT NULL,
  `default` enum('0','1') NOT NULL,
  `enabled` enum('0','1') NOT NULL DEFAULT '1',
  `country_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `system_countries`
--

INSERT INTO `system_countries` (`country_id`, `country_code`, `country_name`, `phone_code`, `default`, `enabled`, `country_order`) VALUES
(1, 'AF', 'Afghanistan', '+93', '0', '1', 1),
(2, 'AL', 'Albania', '+355', '0', '1', 2),
(3, 'DZ', 'Algeria', '+213', '0', '1', 3),
(4, 'DS', 'American Samoa', '+1684', '0', '1', 4),
(5, 'AD', 'Andorra', '+376', '0', '1', 5),
(6, 'AO', 'Angola', '+244', '0', '1', 6),
(7, 'AI', 'Anguilla', '+1264', '0', '1', 7),
(8, 'AQ', 'Antarctica', '+672', '0', '1', 8),
(9, 'AG', 'Antigua and Barbuda', '+1268', '0', '1', 9),
(10, 'AR', 'Argentina', '+54', '0', '1', 10),
(11, 'AM', 'Armenia', '+374', '0', '1', 11),
(12, 'AW', 'Aruba', '+297', '0', '1', 12),
(13, 'AU', 'Australia', '+61', '0', '1', 13),
(14, 'AT', 'Austria', '+43', '0', '1', 14),
(15, 'AZ', 'Azerbaijan', '+994', '0', '1', 15),
(16, 'BS', 'Bahamas', '+1242', '0', '1', 16),
(17, 'BH', 'Bahrain', '+973', '0', '1', 17),
(18, 'BD', 'Bangladesh', '+880', '0', '1', 18),
(19, 'BB', 'Barbados', '+1246', '0', '1', 19),
(20, 'BY', 'Belarus', '+375', '0', '1', 20),
(21, 'BE', 'Belgium', '+32', '0', '1', 21),
(22, 'BZ', 'Belize', '+501', '0', '1', 22),
(23, 'BJ', 'Benin', '+229', '0', '1', 23),
(24, 'BM', 'Bermuda', '+1441', '0', '1', 24),
(25, 'BT', 'Bhutan', '+975', '0', '1', 25),
(26, 'BO', 'Bolivia', '+591', '0', '1', 26),
(27, 'BA', 'Bosnia and Herzegovina', '+387', '0', '1', 27),
(28, 'BW', 'Botswana', '+267', '0', '1', 28),
(29, 'BV', 'Bouvet Island', '+55', '0', '1', 29),
(30, 'BR', 'Brazil', '+55', '0', '1', 30),
(31, 'IO', 'British Indian Ocean Territory', '+246', '0', '1', 31),
(32, 'BN', 'Brunei Darussalam', '+673', '0', '1', 32),
(33, 'BG', 'Bulgaria', '+359', '0', '1', 33),
(34, 'BF', 'Burkina Faso', '+226', '0', '1', 34),
(35, 'BI', 'Burundi', '+257', '0', '1', 35),
(36, 'KH', 'Cambodia', '+855', '0', '1', 36),
(37, 'CM', 'Cameroon', '+237', '0', '1', 37),
(38, 'CA', 'Canada', '+1', '0', '1', 38),
(39, 'CV', 'Cape Verde', '+238', '0', '1', 39),
(40, 'KY', 'Cayman Islands', '+ 345', '0', '1', 40),
(41, 'CF', 'Central African Republic', '+236', '0', '1', 41),
(42, 'TD', 'Chad', '+235', '0', '1', 42),
(43, 'CL', 'Chile', '+56', '0', '1', 43),
(44, 'CN', 'China', '+86', '0', '1', 44),
(45, 'CX', 'Christmas Island', '+61', '0', '1', 45),
(46, 'CC', 'Cocos (Keeling) Islands', '+61', '0', '1', 46),
(47, 'CO', 'Colombia', '+57', '0', '1', 47),
(48, 'KM', 'Comoros', '+269', '0', '1', 48),
(49, 'CG', 'Congo', '+242', '0', '1', 49),
(50, 'CK', 'Cook Islands', '+682', '0', '1', 50),
(51, 'CR', 'Costa Rica', '+506', '0', '1', 51),
(52, 'HR', 'Croatia (Hrvatska)', '+385', '0', '1', 52),
(53, 'CU', 'Cuba', '+53', '0', '1', 53),
(54, 'CY', 'Cyprus', '+357', '0', '1', 54),
(55, 'CZ', 'Czech Republic', '+420', '0', '1', 55),
(56, 'DK', 'Denmark', '+45', '0', '1', 56),
(57, 'DJ', 'Djibouti', '+253', '0', '1', 57),
(58, 'DM', 'Dominica', '+1767', '0', '1', 58),
(59, 'DO', 'Dominican Republic', '+1849', '0', '1', 59),
(60, 'TP', 'East Timor', NULL, '0', '1', 60),
(61, 'EC', 'Ecuador', '+593', '0', '1', 61),
(62, 'EG', 'Egypt', '+20', '0', '1', 62),
(63, 'SV', 'El Salvador', '+503', '0', '1', 63),
(64, 'GQ', 'Equatorial Guinea', '+240', '0', '1', 64),
(65, 'ER', 'Eritrea', '+291', '0', '1', 65),
(66, 'EE', 'Estonia', '+372', '0', '1', 66),
(67, 'ET', 'Ethiopia', '+251', '0', '1', 67),
(68, 'FK', 'Falkland Islands (Malvinas)', '+500', '0', '1', 68),
(69, 'FO', 'Faroe Islands', '+298', '0', '1', 69),
(70, 'FJ', 'Fiji', '+679', '0', '1', 70),
(71, 'FI', 'Finland', '+358', '0', '1', 71),
(72, 'FR', 'France', '+33', '0', '1', 72),
(73, 'FX', 'France, Metropolitan', NULL, '0', '1', 73),
(74, 'GF', 'French Guiana', '+594', '0', '1', 74),
(75, 'PF', 'French Polynesia', '+689', '0', '1', 75),
(76, 'TF', 'French Southern Territories', '+262', '0', '1', 76),
(77, 'GA', 'Gabon', '+241', '0', '1', 77),
(78, 'GM', 'Gambia', '+220', '0', '1', 78),
(79, 'GE', 'Georgia', '+995', '0', '1', 79),
(80, 'DE', 'Germany', '+49', '0', '1', 80),
(81, 'GH', 'Ghana', '+233', '0', '1', 81),
(82, 'GI', 'Gibraltar', '+350', '0', '1', 82),
(83, 'GK', 'Guernsey', '+44', '0', '1', 83),
(84, 'GR', 'Greece', '+30', '0', '1', 84),
(85, 'GL', 'Greenland', '+299', '0', '1', 85),
(86, 'GD', 'Grenada', '+1473', '0', '1', 86),
(87, 'GP', 'Guadeloupe', '+590', '0', '1', 87),
(88, 'GU', 'Guam', '+1671', '0', '1', 88),
(89, 'GT', 'Guatemala', '+502', '0', '1', 89),
(90, 'GN', 'Guinea', '+224', '0', '1', 90),
(91, 'GW', 'Guinea-Bissau', '+245', '0', '1', 91),
(92, 'GY', 'Guyana', '+595', '0', '1', 92),
(93, 'HT', 'Haiti', '+509', '0', '1', 93),
(94, 'HM', 'Heard and Mc Donald Islands', NULL, '0', '1', 94),
(95, 'HN', 'Honduras', '+504', '0', '1', 95),
(96, 'HK', 'Hong Kong', '+852', '0', '1', 96),
(97, 'HU', 'Hungary', '+36', '0', '1', 97),
(98, 'IS', 'Iceland', '+354', '0', '1', 98),
(99, 'IN', 'India', '+91', '0', '1', 99),
(100, 'IM', 'Isle of Man', '+44', '0', '1', 100),
(101, 'ID', 'Indonesia', '+62', '0', '1', 101),
(102, 'IR', 'Iran (Islamic Republic of)', '+98', '0', '1', 102),
(103, 'IQ', 'Iraq', '+964', '0', '1', 103),
(104, 'IE', 'Ireland', '+353', '0', '1', 104),
(105, 'IL', 'Israel', '+972', '0', '1', 105),
(106, 'IT', 'Italy', '+39', '0', '1', 106),
(107, 'CI', 'Ivory Coast', NULL, '0', '1', 107),
(108, 'JE', 'Jersey', '+44', '0', '1', 108),
(109, 'JM', 'Jamaica', '+1876', '0', '1', 109),
(110, 'JP', 'Japan', '+81', '0', '1', 110),
(111, 'JO', 'Jordan', '+962', '0', '1', 111),
(112, 'KZ', 'Kazakhstan', '+77', '0', '1', 112),
(113, 'KE', 'Kenya', '+254', '0', '1', 113),
(114, 'KI', 'Kiribati', '+686', '0', '1', 114),
(115, 'KP', 'Korea, Democratic People\'s Republic of', '+850', '0', '1', 115),
(116, 'KR', 'Korea, Republic of', '+82', '0', '1', 116),
(117, 'XK', 'Kosovo', '+381', '0', '1', 117),
(118, 'KW', 'Kuwait', '+965', '0', '1', 118),
(119, 'KG', 'Kyrgyzstan', '+996', '0', '1', 119),
(120, 'LA', 'Lao People\'s Democratic Republic', '+856', '0', '1', 120),
(121, 'LV', 'Latvia', '+371', '0', '1', 121),
(122, 'LB', 'Lebanon', '+961', '0', '1', 122),
(123, 'LS', 'Lesotho', '+266', '0', '1', 123),
(124, 'LR', 'Liberia', '+231', '0', '1', 124),
(125, 'LY', 'Libyan Arab Jamahiriya', '+218', '0', '1', 125),
(126, 'LI', 'Liechtenstein', '+423', '0', '1', 126),
(127, 'LT', 'Lithuania', '+370', '0', '1', 127),
(128, 'LU', 'Luxembourg', '+352', '0', '1', 128),
(129, 'MO', 'Macau', '+853', '0', '1', 129),
(130, 'MK', 'Macedonia', '+389', '0', '1', 130),
(131, 'MG', 'Madagascar', '+261', '0', '1', 131),
(132, 'MW', 'Malawi', '+265', '0', '1', 132),
(133, 'MY', 'Malaysia', '+60', '0', '1', 133),
(134, 'MV', 'Maldives', '+960', '0', '1', 134),
(135, 'ML', 'Mali', '+223', '0', '1', 135),
(136, 'MT', 'Malta', '+356', '0', '1', 136),
(137, 'MH', 'Marshall Islands', '+692', '0', '1', 137),
(138, 'MQ', 'Martinique', '+596', '0', '1', 138),
(139, 'MR', 'Mauritania', '+222', '0', '1', 139),
(140, 'MU', 'Mauritius', '+230', '0', '1', 140),
(141, 'TY', 'Mayotte', '+269', '0', '1', 141),
(142, 'MX', 'Mexico', '+52', '0', '1', 142),
(143, 'FM', 'Micronesia, Federated States of', '+691', '0', '1', 143),
(144, 'MD', 'Moldova, Republic of', '+373', '0', '1', 144),
(145, 'MC', 'Monaco', '+377', '0', '1', 145),
(146, 'MN', 'Mongolia', '+976', '0', '1', 146),
(147, 'ME', 'Montenegro', '+382', '0', '1', 147),
(148, 'MS', 'Montserrat', '+1664', '0', '1', 148),
(149, 'MA', 'Morocco', '+212', '0', '1', 149),
(150, 'MZ', 'Mozambique', '+258', '0', '1', 150),
(151, 'MM', 'Myanmar', '+95', '0', '1', 151),
(152, 'NA', 'Namibia', '+264', '0', '1', 152),
(153, 'NR', 'Nauru', '+674', '0', '1', 153),
(154, 'NP', 'Nepal', '+977', '0', '1', 154),
(155, 'NL', 'Netherlands', '+31', '0', '1', 155),
(156, 'AN', 'Netherlands Antilles', '+599', '0', '1', 156),
(157, 'NC', 'New Caledonia', '+687', '0', '1', 157),
(158, 'NZ', 'New Zealand', '+64', '0', '1', 158),
(159, 'NI', 'Nicaragua', '+505', '0', '1', 159),
(160, 'NE', 'Niger', '+227', '0', '1', 160),
(161, 'NG', 'Nigeria', '+234', '0', '1', 161),
(162, 'NU', 'Niue', '+683', '0', '1', 162),
(163, 'NF', 'Norfolk Island', '+672', '0', '1', 163),
(164, 'MP', 'Northern Mariana Islands', '+1670', '0', '1', 164),
(165, 'NO', 'Norway', '+47', '0', '1', 165),
(166, 'OM', 'Oman', '+968', '0', '1', 166),
(167, 'PK', 'Pakistan', '+92', '0', '1', 167),
(168, 'PW', 'Palau', '+680', '0', '1', 168),
(169, 'PS', 'Palestine', '+970', '0', '1', 169),
(170, 'PA', 'Panama', '+507', '0', '1', 170),
(171, 'PG', 'Papua New Guinea', '+675', '0', '1', 171),
(172, 'PY', 'Paraguay', '+595', '0', '1', 172),
(173, 'PE', 'Peru', '+51', '0', '1', 173),
(174, 'PH', 'Philippines', '+63', '0', '1', 174),
(175, 'PN', 'Pitcairn', '+872', '0', '1', 175),
(176, 'PL', 'Poland', '+48', '0', '1', 176),
(177, 'PT', 'Portugal', '+351', '0', '1', 177),
(178, 'PR', 'Puerto Rico', '+1939', '0', '1', 178),
(179, 'QA', 'Qatar', '+974', '0', '1', 179),
(180, 'RE', 'Reunion', '+262', '0', '1', 180),
(181, 'RO', 'Romania', '+40', '0', '1', 181),
(182, 'RU', 'Russian Federation', '+7', '0', '1', 182),
(183, 'RW', 'Rwanda', '+250', '0', '1', 183),
(184, 'KN', 'Saint Kitts and Nevis', '+1869', '0', '1', 184),
(185, 'LC', 'Saint Lucia', '+1758', '0', '1', 185),
(186, 'VC', 'Saint Vincent and the Grenadines', '+1784', '0', '1', 186),
(187, 'WS', 'Samoa', '+685', '0', '1', 187),
(188, 'SM', 'San Marino', '+378', '0', '1', 188),
(189, 'ST', 'Sao Tome and Principe', '+239', '0', '1', 189),
(190, 'SA', 'Saudi Arabia', '+966', '0', '1', 190),
(191, 'SN', 'Senegal', '+221', '0', '1', 191),
(192, 'RS', 'Serbia', '+381', '0', '1', 192),
(193, 'SC', 'Seychelles', '+248', '0', '1', 193),
(194, 'SL', 'Sierra Leone', '+232', '0', '1', 194),
(195, 'SG', 'Singapore', '+65', '0', '1', 195),
(196, 'SK', 'Slovakia', '+421', '0', '1', 196),
(197, 'SI', 'Slovenia', '+386', '0', '1', 197),
(198, 'SB', 'Solomon Islands', '+677', '0', '1', 198),
(199, 'SO', 'Somalia', '+252', '0', '1', 199),
(200, 'ZA', 'South Africa', '+27', '0', '1', 200),
(201, 'GS', 'South Georgia South Sandwich Islands', '+500', '0', '1', 201),
(202, 'ES', 'Spain', '+34', '0', '1', 202),
(203, 'LK', 'Sri Lanka', '+94', '0', '1', 203),
(204, 'SH', 'St. Helena', '+290', '0', '1', 204),
(205, 'PM', 'St. Pierre and Miquelon', '+508', '0', '1', 205),
(206, 'SD', 'Sudan', '+249', '0', '1', 206),
(207, 'SR', 'Suriname', '+597', '0', '1', 207),
(208, 'SJ', 'Svalbard and Jan Mayen Islands', '+47', '0', '1', 208),
(209, 'SZ', 'Swaziland', '+268', '0', '1', 209),
(210, 'SE', 'Sweden', '+46', '0', '1', 210),
(211, 'CH', 'Switzerland', '+41', '0', '1', 211),
(212, 'SY', 'Syrian Arab Republic', '+963', '0', '1', 212),
(213, 'TW', 'Taiwan', '+886', '0', '1', 213),
(214, 'TJ', 'Tajikistan', '+992', '0', '1', 214),
(215, 'TZ', 'Tanzania, United Republic of', '+255', '0', '1', 215),
(216, 'TH', 'Thailand', '+66', '0', '1', 216),
(217, 'TG', 'Togo', '+228', '0', '1', 217),
(218, 'TK', 'Tokelau', '+690', '0', '1', 218),
(219, 'TO', 'Tonga', '+676', '0', '1', 219),
(220, 'TT', 'Trinidad and Tobago', '+1868', '0', '1', 220),
(221, 'TN', 'Tunisia', '+216', '0', '1', 221),
(222, 'TR', 'Turkey', '+90', '0', '1', 222),
(223, 'TM', 'Turkmenistan', '+993', '0', '1', 223),
(224, 'TC', 'Turks and Caicos Islands', '+1649', '0', '1', 224),
(225, 'TV', 'Tuvalu', '+688', '0', '1', 225),
(226, 'UG', 'Uganda', '+256', '0', '1', 226),
(227, 'UA', 'Ukraine', '+380', '0', '1', 227),
(228, 'AE', 'United Arab Emirates', '+971', '0', '1', 228),
(229, 'GB', 'United Kingdom', '+44', '0', '1', 229),
(230, 'US', 'United States', '+1', '1', '1', 230),
(231, 'UM', 'United States minor outlying islands', '+1', '0', '1', 231),
(232, 'UY', 'Uruguay', '+598', '0', '1', 232),
(233, 'UZ', 'Uzbekistan', '+998', '0', '1', 233),
(234, 'VU', 'Vanuatu', '+678', '0', '1', 234),
(235, 'VA', 'Vatican City State', '+379', '0', '1', 235),
(236, 'VE', 'Venezuela', '+58', '0', '1', 236),
(237, 'VN', 'Vietnam', '+84', '0', '1', 237),
(238, 'VG', 'Virgin Islands (British)', '+1284', '0', '1', 238),
(239, 'VI', 'Virgin Islands (U.S.)', '+1340', '0', '1', 239),
(240, 'WF', 'Wallis and Futuna Islands', '+681', '0', '1', 240),
(241, 'EH', 'Western Sahara', '+212', '0', '1', 241),
(242, 'YE', 'Yemen', '+967', '0', '1', 242),
(243, 'ZR', 'Zaire', NULL, '0', '1', 243),
(244, 'ZM', 'Zambia', '+260', '0', '1', 244),
(245, 'ZW', 'Zimbabwe', '+263', '0', '1', 245);

-- --------------------------------------------------------

--
-- Table structure for table `system_currencies`
--

CREATE TABLE `system_currencies` (
  `currency_id` int UNSIGNED NOT NULL,
  `name` varchar(256) NOT NULL,
  `code` varchar(32) NOT NULL,
  `symbol` varchar(32) NOT NULL,
  `dir` enum('left','right') NOT NULL DEFAULT 'left',
  `default` enum('0','1') NOT NULL,
  `enabled` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `system_currencies`
--

INSERT INTO `system_currencies` (`currency_id`, `name`, `code`, `symbol`, `dir`, `default`, `enabled`) VALUES
(1, 'Australia Dollar', 'AUD', '$', 'left', '0', '0'),
(2, 'Brazil Real', 'BRL', 'R$', 'left', '0', '1'),
(3, 'Canada Dollar', 'CAD', '$', 'left', '0', '1'),
(4, 'Czech Republic Koruna', 'CZK', 'Kč', 'left', '0', '1'),
(5, 'Denmark Krone', 'DKK', 'kr', 'left', '0', '1'),
(6, 'Euro', 'EUR', '&euro;', 'left', '0', '1'),
(7, 'Hong Kong Dollar', 'HKD', '$', 'left', '0', '1'),
(8, 'Hungary Forint', 'HUF', 'Ft', 'left', '0', '1'),
(9, 'Israel Shekel', 'ILS', '₪', 'left', '0', '1'),
(10, 'Japan Yen', 'JPY', '&yen;', 'left', '0', '1'),
(11, 'Malaysia Ringgit', 'MYR', 'RM', 'left', '0', '1'),
(12, 'Mexico Peso', 'MXN', '$', 'left', '0', '1'),
(13, 'Norway Krone', 'NOK', 'kr', 'left', '0', '1'),
(14, 'New Zealand Dollar', 'NZD', '$', 'left', '0', '1'),
(15, 'Philippines Peso', 'PHP', '₱', 'left', '0', '1'),
(16, 'Poland Zloty', 'PLN', 'zł', 'left', '0', '1'),
(17, 'United Kingdom Pound', 'GBP', '&pound;', 'left', '0', '1'),
(18, 'Russia Ruble', 'RUB', '₽', 'left', '0', '1'),
(19, 'Singapore Dollar', 'SGD', '$', 'left', '0', '1'),
(20, 'Sweden Krona', 'SEK', 'kr', 'left', '0', '1'),
(21, 'Switzerland Franc', 'CHF', 'CHF', 'left', '0', '1'),
(22, 'Thailand Baht', 'THB', '฿', 'left', '0', '1'),
(23, 'Turkey Lira', 'TRY', 'TRY', 'left', '0', '1'),
(24, 'United States Dollar', 'USD', '$', 'left', '1', '1'),
(25, 'India Rupee', 'INR', '₹', 'right', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `system_genders`
--

CREATE TABLE `system_genders` (
  `gender_id` int UNSIGNED NOT NULL,
  `gender_name` varchar(64) NOT NULL,
  `gender_order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `system_genders`
--

INSERT INTO `system_genders` (`gender_id`, `gender_name`, `gender_order`) VALUES
(1, 'Male', 1),
(2, 'Female', 2),
(3, 'Other', 3);

-- --------------------------------------------------------

--
-- Table structure for table `system_languages`
--

CREATE TABLE `system_languages` (
  `language_id` int UNSIGNED NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(256) NOT NULL,
  `flag` varchar(256) NOT NULL,
  `dir` enum('LTR','RTL') NOT NULL,
  `default` enum('0','1') NOT NULL,
  `enabled` enum('0','1') NOT NULL,
  `language_order` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `system_languages`
--

INSERT INTO `system_languages` (`language_id`, `code`, `title`, `flag`, `dir`, `default`, `enabled`, `language_order`) VALUES
(1, 'en_us', 'English', 'flags/en_us.png', 'LTR', '1', '1', 1),
(2, 'ar_sa', 'Arabic', 'flags/ar_sa.png', 'RTL', '0', '1', 2),
(3, 'fr_fr', 'French', 'flags/fr_fr.png', 'LTR', '0', '1', 3),
(4, 'es_es', 'Spanish', 'flags/es_es.png', 'LTR', '0', '1', 4),
(5, 'pt_pt', 'Portuguese', 'flags/pt_pt.png', 'LTR', '0', '1', 5),
(6, 'de_de', 'Deutsch', 'flags/de_de.png', 'LTR', '0', '1', 6),
(7, 'tr_tr', 'Turkish', 'flags/tr_tr.png', 'LTR', '0', '1', 7),
(8, 'nl_nl', 'Dutch', 'flags/nl_nl.png', 'LTR', '0', '1', 8),
(9, 'it_it', 'Italiano', 'flags/it_it.png', 'LTR', '0', '1', 9),
(10, 'ru_ru', 'Russian', 'flags/ru_ru.png', 'LTR', '0', '1', 10),
(11, 'ro_ro', 'Romaian', 'flags/ro_ro.png', 'LTR', '0', '1', 11),
(12, 'pt_br', 'Portuguese (Brazil)', 'flags/pt_br.png', 'LTR', '0', '1', 12),
(13, 'el_gr', 'Greek', 'flags/el_gr.png', 'LTR', '0', '1', 13);

-- --------------------------------------------------------

--
-- Table structure for table `system_options`
--

CREATE TABLE `system_options` (
  `option_id` int UNSIGNED NOT NULL,
  `option_name` varchar(128) NOT NULL,
  `option_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `system_options`
--

INSERT INTO `system_options` (`option_id`, `option_name`, `option_value`) VALUES
(1, 'system_public', '1'),
(2, 'system_live', '1'),
(3, 'system_message', 'We will Back Soon'),
(4, 'system_title', 'Polex'),
(5, 'system_description', 'Share your memories, connect with others, make new friends'),
(6, 'system_keywords', ''),
(7, 'system_email', 'alahdal262@gmail.com'),
(8, 'system_datetime_format', 'd/m/Y H:i'),
(9, 'contact_enabled', '1'),
(10, 'directory_enabled', '1'),
(11, 'pages_enabled', '1'),
(12, 'groups_enabled', '0'),
(13, 'events_enabled', '1'),
(14, 'blogs_enabled', '1'),
(15, 'users_blogs_enabled', '1'),
(16, 'market_enabled', '0'),
(17, 'movies_enabled', '0'),
(18, 'games_enabled', '0'),
(19, 'daytime_msg_enabled', '0'),
(20, 'pokes_enabled', '0'),
(21, 'gifts_enabled', '0'),
(22, 'profile_notification_enabled', '1'),
(23, 'browser_notifications_enabled', '1'),
(24, 'noty_notifications_enabled', '1'),
(25, 'cookie_consent_enabled', '1'),
(26, 'adblock_detector_enabled', '1'),
(27, 'stories_enabled', '0'),
(28, 'popular_posts_enabled', '1'),
(29, 'discover_posts_enabled', '1'),
(30, 'memories_enabled', '0'),
(31, 'wall_posts_enabled', '0'),
(32, 'activity_posts_enabled', '0'),
(33, 'colored_posts_enabled', '0'),
(34, 'polls_enabled', '1'),
(35, 'geolocation_enabled', '0'),
(36, 'geolocation_key', ''),
(37, 'gif_enabled', '0'),
(38, 'giphy_key', ''),
(39, 'post_translation_enabled', '1'),
(40, 'yandex_key', 'AIzaSyCHzw6ncg0XDPe6CoyXGilTP37cELgs6GM'),
(41, 'smart_yt_player', '1'),
(42, 'social_share_enabled', '1'),
(43, 'max_post_length', '0'),
(44, 'max_comment_length', '300'),
(45, 'max_posts_hour', '0'),
(46, 'max_comments_hour', '0'),
(47, 'default_privacy', 'public'),
(48, 'trending_hashtags_enabled', '1'),
(49, 'trending_hashtags_interval', 'week'),
(50, 'trending_hashtags_limit', '5'),
(51, 'registration_enabled', '1'),
(52, 'registration_type', 'free'),
(53, 'invitation_enabled', '0'),
(56, 'packages_enabled', '0'),
(57, 'packages_wallet_payment_enabled', '0'),
(58, 'activation_enabled', '1'),
(59, 'activation_type', 'email'),
(60, 'verification_requests', '1'),
(61, 'age_restriction', '0'),
(62, 'minimum_age', '13'),
(63, 'getting_started', '1'),
(64, 'delete_accounts_enabled', '1'),
(65, 'download_info_enabled', '1'),
(66, 'newsletter_consent', '1'),
(67, 'max_accounts', '0'),
(68, 'max_friends', '5000'),
(69, 'social_login_enabled', '1'),
(70, 'facebook_login_enabled', '1'),
(71, 'facebook_appid', '1379676892860088'),
(72, 'facebook_secret', '84965afec549d822f0c0bd9cadcbace4'),
(73, 'google_login_enabled', '1'),
(74, 'google_appid', '889636085044-ioq06usbvcueh8flk14i8g2novret9f9.apps.googleusercontent.com'),
(75, 'google_secret', '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'),
(76, 'twitter_login_enabled', '0'),
(77, 'twitter_appid', ''),
(78, 'twitter_secret', ''),
(82, 'linkedin_login_enabled', '0'),
(83, 'linkedin_appid', ''),
(84, 'linkedin_secret', ''),
(85, 'vkontakte_login_enabled', '0'),
(86, 'vkontakte_appid', ''),
(87, 'vkontakte_secret', ''),
(88, 'email_smtp_enabled', '0'),
(89, 'email_smtp_authentication', '0'),
(90, 'email_smtp_ssl', '0'),
(91, 'email_smtp_server', ''),
(92, 'email_smtp_port', ''),
(93, 'email_smtp_username', ''),
(94, 'email_smtp_password', ''),
(95, 'email_smtp_setfrom', ''),
(96, 'email_notifications', '0'),
(97, 'email_post_likes', '0'),
(98, 'email_post_comments', '0'),
(99, 'email_post_shares', '0'),
(100, 'email_wall_posts', '0'),
(101, 'email_mentions', '0'),
(102, 'email_profile_visits', '0'),
(103, 'email_friend_requests', '0'),
(104, 'twilio_sid', ''),
(105, 'twilio_token', ''),
(106, 'twilio_phone', ''),
(107, 'twilio_apisid', ''),
(108, 'twilio_apisecret', ''),
(109, 'system_phone', ''),
(110, 'chat_enabled', '1'),
(111, 'chat_status_enabled', '1'),
(112, 'chat_typing_enabled', '1'),
(113, 'chat_seen_enabled', '1'),
(114, 'video_call_enabled', '0'),
(115, 'audio_call_enabled', '0'),
(116, 'uploads_directory', 'content/uploads'),
(117, 'uploads_prefix', 'Polex'),
(118, 'max_avatar_size', '5120'),
(119, 'max_cover_size', '5120'),
(120, 'photos_enabled', '0'),
(121, 'max_photo_size', '5120'),
(122, 'uploads_quality', 'medium'),
(123, 'videos_enabled', '0'),
(124, 'max_video_size', '5120'),
(125, 'video_extensions', 'mp4, webm, ogg, mov, m4a, 3gp, 3g2, mj2, asf, avi, flv, webm, m4v, mpeg, ogv, mkv'),
(126, 'audio_enabled', '0'),
(127, 'max_audio_size', '5120'),
(128, 'audio_extensions', 'mp3, wav, ogg'),
(129, 'file_enabled', '0'),
(130, 'max_file_size', '5120'),
(131, 'file_extensions', 'txt, zip, json, docx'),
(132, 's3_enabled', '0'),
(133, 's3_bucket', ''),
(134, 's3_region', 'us-east-2'),
(135, 's3_key', ''),
(136, 's3_secret', ''),
(137, 'digitalocean_enabled', '0'),
(138, 'digitalocean_space_name', ''),
(139, 'digitalocean_space_region', 'sfo2'),
(140, 'digitalocean_key', ''),
(141, 'digitalocean_secret', ''),
(142, 'ftp_enabled', '0'),
(143, 'ftp_hostname', ''),
(144, 'ftp_port', ''),
(145, 'ftp_username', ''),
(146, 'ftp_password', ''),
(147, 'ftp_path', './'),
(148, 'ftp_endpoint', ''),
(149, 'session_hash', '6ABPQlZeV-3J6mu-488oB-3vFl7-3a5K8-3b0227261dba'),
(150, 'unusual_login_enabled', '0'),
(151, 'brute_force_detection_enabled', '1'),
(152, 'brute_force_bad_login_limit', '3'),
(153, 'brute_force_lockout_time', '30'),
(154, 'two_factor_enabled', '1'),
(155, 'two_factor_type', 'google'),
(156, 'censored_words_enabled', '1'),
(157, 'censored_words', 'pussy, fuck, shit, asshole, dick, tits, boobs'),
(158, 'reCAPTCHA_enabled', '0'),
(159, 'reCAPTCHA_site_key', ''),
(160, 'reCAPTCHA_secret_key', ''),
(161, 'paypal_enabled', '0'),
(162, 'paypal_mode', 'sandbox'),
(163, 'paypal_id', ''),
(164, 'paypal_secret', ''),
(165, 'creditcard_enabled', '0'),
(166, 'alipay_enabled', '0'),
(167, 'stripe_mode', 'test'),
(168, 'stripe_test_secret', ''),
(169, 'stripe_test_publishable', ''),
(170, 'stripe_live_secret', ''),
(171, 'stripe_live_publishable', ''),
(172, 'coinpayments_enabled', '0'),
(173, 'coinpayments_merchant_id', ''),
(174, 'coinpayments_ipn_secret', ''),
(175, '2checkout_enabled', '0'),
(176, '2checkout_mode', 'sandbox'),
(177, '2checkout_merchant_code', ''),
(178, '2checkout_publishable_key', ''),
(179, '2checkout_private_key', ''),
(180, 'bank_transfers_enabled', '1'),
(181, 'bank_name', 'Test Bank'),
(182, 'bank_account_number', ''),
(183, 'bank_account_name', 'Adam Smith'),
(184, 'bank_account_routing', ''),
(185, 'bank_account_country', ''),
(186, 'bank_transfer_note', 'In order to confirm the bank transfer, you will need to upload a receipt or take a screenshot of your transfer within 1 day from your payment date. If a bank transfer is made but no receipt is uploaded within this period, your order will be cancelled. We will verify and confirm your receipt within 3 working days from the date you upload it.'),
(187, 'data_heartbeat', '5'),
(188, 'chat_heartbeat', '5'),
(189, 'offline_time', '10'),
(190, 'min_results', '5'),
(191, 'max_results', '10'),
(192, 'min_results_even', '6'),
(193, 'max_results_even', '1'),
(194, 'analytics_code', ''),
(195, 'system_theme_night_on', '0'),
(196, 'system_theme_mode_select', '1'),
(197, 'system_profile_background_enabled', '1'),
(198, 'system_logo', 'photos/2023/01/Polex_7a1e5f44fc8f06f0db5ef9a4386e2aef.png'),
(199, 'system_wallpaper_default', '1'),
(200, 'system_wallpaper', ''),
(201, 'system_favicon_default', '0'),
(202, 'system_favicon', 'photos/2023/01/sngine_bee11345b861271083c5cc835e135df9.png'),
(203, 'system_ogimage_default', '0'),
(204, 'system_ogimage', 'photos/2023/01/sngine_58dd74cef14fea47afa5177add22b435.jpg'),
(205, 'css_customized', '0'),
(206, 'css_background', ''),
(207, 'css_link_color', ''),
(208, 'css_header', ''),
(209, 'css_header_search', ''),
(210, 'css_header_search_color', ''),
(211, 'css_btn_primary', ''),
(212, 'css_custome_css', '/* \r\n\r\nAdd here your custom css styles \r\nExample:\r\np { text-align: center; color: red; }\r\n\r\n*/'),
(213, 'custome_js_header', '/* \r\nYou can add your JavaScript code here\r\n\r\nExample:\r\n\r\nvar x, y, z;\r\nx = 1;\r\ny = 2;\r\nz = x + y;\r\n*/'),
(214, 'custome_js_footer', '/* \r\nYou can add your JavaScript code here\r\n\r\nExample:\r\n\r\nvar x, y, z;\r\nx = 1;\r\ny = 2;\r\nz = x + y;\r\n*/'),
(215, 'forums_enabled', '0'),
(216, 'forums_online_enabled', '1'),
(217, 'forums_statistics_enabled', '1'),
(218, 'affiliates_enabled', '0'),
(219, 'affiliate_type', 'registration'),
(220, 'affiliate_payment_method', 'paypal,skrill'),
(221, 'affiliate_payment_method_custom', ''),
(222, 'affiliates_min_withdrawal', '50'),
(223, 'affiliate_payment_type', 'fixed'),
(224, 'affiliates_per_user', '0.10'),
(225, 'affiliates_percentage', '1'),
(226, 'points_enabled', '0'),
(227, 'points_money_withdraw_enabled', '1'),
(228, 'points_payment_method', 'paypal,skrill'),
(229, 'points_payment_method_custom', ''),
(230, 'points_min_withdrawal', '50'),
(231, 'points_money_transfer_enabled', '0'),
(232, 'points_per_currency', '100'),
(233, 'points_per_post', '0'),
(234, 'points_per_comment', '5'),
(235, 'points_per_reaction', '5'),
(236, 'points_limit_user', '1000'),
(237, 'points_limit_pro', '2000'),
(238, 'ads_enabled', '0'),
(239, 'ads_cost_click', '0.05'),
(240, 'ads_cost_view', '0.01'),
(241, 'developers_apps_enabled', '0'),
(242, 'developers_share_enabled', '0'),
(243, 'auto_friend', '0'),
(244, 'auto_friend_users', ''),
(245, 'auto_follow', '0'),
(246, 'auto_follow_users', ''),
(247, 'auto_like', '0'),
(248, 'auto_like_pages', ''),
(249, 'auto_join', '0'),
(250, 'auto_join_groups', ''),
(251, 'last_backup_time', '2023-01-16 17:17:03'),
(252, 'sms_provider', 'twilio'),
(253, 'bulksms_username', ''),
(254, 'bulksms_password', ''),
(255, 'infobip_username', ''),
(256, 'infobip_password', ''),
(257, 'watermark_enabled', '0'),
(258, 'watermark_icon', ''),
(259, 'watermark_position', 'bottom right'),
(260, 'watermark_xoffset', '-30'),
(261, 'watermark_yoffset', '-30'),
(262, 'watermark_opacity', '1'),
(263, 'adult_images_enabled', ''),
(264, 'adult_images_action', 'blur'),
(265, 'adult_images_api_key', ''),
(266, 'mobile_infinite_scroll', '0'),
(267, 'limit_cover_photo', '1'),
(268, 'comments_photos_enabled', '0'),
(269, 'chat_photos_enabled', '0'),
(270, 'onesignal_notification_enabled', '0'),
(271, 'onesignal_app_id', ''),
(272, 'onesignal_api_key', ''),
(273, 'system_distance', 'kilometer'),
(274, 'wallet_enabled', '0'),
(275, 'wallet_transfer_enabled', '1'),
(276, 'affiliates_money_withdraw_enabled', '1'),
(277, 'affiliates_money_transfer_enabled', '0'),
(278, 'pages_permission', 'everyone'),
(279, 'groups_permission', 'everyone'),
(280, 'events_permission', 'verified'),
(281, 'blogs_permission', 'everyone'),
(282, 'market_permission', 'everyone'),
(283, 'forums_permission', 'verified'),
(284, 'movies_permission', 'everyone'),
(285, 'games_permission', 'everyone'),
(286, 'jobs_enabled', '0'),
(287, 'posts_online_status', '1'),
(288, 'anonymous_mode', '0'),
(289, 'tinymce_photos_enabled', '1'),
(290, 'voice_notes_posts_enabled', '0'),
(291, 'voice_notes_comments_enabled', '0'),
(292, 'voice_notes_chat_enabled', '1'),
(293, 'offers_enabled', '0'),
(294, 'live_enabled', '0'),
(295, 'save_live_enabled', '0'),
(296, 'live_permission', 'verified'),
(297, 'agora_app_id', ''),
(298, 'agora_app_certificate', ''),
(299, 'agora_customer_id', ''),
(300, 'agora_customer_certificate', ''),
(301, 'agora_s3_bucket', ''),
(302, 'agora_s3_region', 'us-east-1'),
(303, 'agora_s3_key', ''),
(304, 'agora_s3_secret', ''),
(305, 'chat_permanently_delete_enabled', '1'),
(306, 'system_description_directory', 'Discover new people, create new connections and make new friends'),
(307, 'system_description_offers', 'Discover new offers'),
(308, 'system_description_jobs', 'Discover new jobs offers'),
(309, 'system_description_blogs', 'Explore the latest articles'),
(310, 'system_description_marketplace', 'Discover new products'),
(311, 'system_description_forums', 'The great place to discuss topics with other users'),
(312, 'system_description_movies', 'Discover new movies'),
(313, 'stories_duration', '3'),
(314, 'desktop_infinite_scroll', '1'),
(315, 'disable_declined_friendrequest', '0'),
(316, 'wallet_withdrawal_enabled', '1'),
(317, 'wallet_payment_method', 'paypal,skrill,bank'),
(318, 'wallet_payment_method_custom', ''),
(319, 'wallet_min_withdrawal', '50'),
(320, 'location_finder_enabled', '0'),
(321, 'relationship_info_enabled', '0'),
(322, 'website_info_enabled', '1'),
(323, 'biography_info_enabled', '1'),
(324, 'work_info_enabled', '1'),
(325, 'education_info_enabled', '1'),
(326, 'social_info_enabled', '1'),
(327, 'location_info_enabled', '0'),
(328, 'show_usernames_enabled', '0'),
(329, 'msg91_authkey', ''),
(330, 'name_min_length', '3'),
(331, 'newsfeed_source', 'all_posts'),
(332, 'video_call_permission', 'verified'),
(333, 'audio_call_permission', 'verified'),
(334, 'funding_enabled', '0'),
(335, 'funding_permission', 'everyone'),
(336, 'system_description_funding', 'Discover new funding requests'),
(337, 'stories_permission', 'everyone'),
(338, 'ads_permission', 'verified'),
(339, 'paystack_enabled', '0'),
(340, 'paystack_secret', ''),
(341, 'funding_money_withdraw_enabled', '1'),
(342, 'funding_payment_method', 'paypal,skrill'),
(343, 'funding_payment_method_custom', ''),
(344, 'funding_min_withdrawal', '50'),
(345, 'funding_money_transfer_enabled', '0'),
(346, 'funding_commission', '10'),
(347, 'play_store_badge_enabled', '0'),
(348, 'play_store_link', ''),
(349, 'app_store_badge_enabled', '0'),
(350, 'app_store_link', ''),
(351, 'invitation_permission', 'everyone'),
(352, 'invitation_user_limit', '2'),
(353, 'invitation_expire_period', 'day'),
(354, 'invitation_send_method', 'sms'),
(355, 'appgallery_badge_enabled', '0'),
(356, 'appgallery_store_link', ''),
(357, 'points_per_follow', '5'),
(358, 'points_per_referred', '5'),
(359, 'newsfeed_results', '10'),
(365, 'ads_approval_enabled', '1'),
(407, 'uploads_cdn_url', ''),
(592, 'affiliates_levels', '5'),
(692, 'voice_notes_durtaion', '120'),
(693, 'voice_notes_encoding', 'mp3'),
(702, 'pages_results', '12'),
(729, 'groups_results', '12'),
(730, 'events_results', '12'),
(921, 'system_currency_dir', 'left'),
(968, 'games_results', '12'),
(1004, 'newsfeed_public', '1'),
(1005, 'search_results', '10'),
(1006, 'auto_play_videos', '1'),
(1010, 'wasabi_enabled', '0'),
(1011, 'wasabi_bucket', ''),
(1012, 'wasabi_region', 'us-west-1'),
(1013, 'wasabi_key', ''),
(1014, 'wasabi_secret', ''),
(1028, 'marketplace_results', '12'),
(1029, 'offers_results', '12'),
(1030, 'jobs_results', '12'),
(1068, 'activation_required', '1'),
(1191, 's3', '0'),
(1195, 'google_cloud_enabled', '0'),
(1196, 'google_cloud_bucket', ''),
(1197, 'google_cloud_file', ''),
(1198, 'html_richtext_enabled', '0'),
(1199, 'razorpay_enabled', '0'),
(1200, 'razorpay_key_id', ''),
(1201, 'razorpay_key_secret', ''),
(1214, 'cashfree_enabled', '0'),
(1215, 'cashfree_mode', 'sandbox'),
(1216, 'cashfree_client_id', ''),
(1217, 'cashfree_client_secret', ''),
(1228, 'coinbase_enabled', '0'),
(1229, 'coinbase_api_key', ''),
(1238, 'securionpay_enabled', '0'),
(1239, 'securionpay_api_key', ''),
(1240, 'securionpay_api_secret', ''),
(1247, 'special_characters_enabled', '1'),
(1286, 'backblaze_enabled', '0'),
(1287, 'backblaze_bucket', ''),
(1288, 'backblaze_region', 'eu-central-003'),
(1289, 'backblaze_key', ''),
(1290, 'backblaze_secret', ''),
(1291, 'ffmpeg_enabled', '0'),
(1292, 'ffmpeg_path', ''),
(1293, 'ffmpeg_speed', 'medium'),
(1294, 'reserved_usernames_enabled', '1'),
(1295, 'reserved_usernames', '[{&quot;value&quot;:&quot;install&quot;},{&quot;value&quot;:&quot;static&quot;},{&quot;value&quot;:&quot;contact&quot;},{&quot;value&quot;:&quot;contacts&quot;},{&quot;value&quot;:&quot;sign&quot;},{&quot;value&quot;:&quot;signin&quot;},{&quot;value&quot;:&quot;login&quot;},{&quot;value&quot;:&quot;signup&quot;},{&quot;value&quot;:&quot;register&quot;},{&quot;value&quot;:&quot;signout&quot;},{&quot;value&quot;:&quot;logout&quot;},{&quot;value&quot;:&quot;reset&quot;},{&quot;value&quot;:&quot;activation&quot;},{&quot;value&quot;:&quot;connect&quot;},{&quot;value&quot;:&quot;revoke&quot;},{&quot;value&quot;:&quot;packages&quot;},{&quot;value&quot;:&quot;started&quot;},{&quot;value&quot;:&quot;search&quot;},{&quot;value&quot;:&quot;friends&quot;},{&quot;value&quot;:&quot;messages&quot;},{&quot;value&quot;:&quot;message&quot;},{&quot;value&quot;:&quot;notifications&quot;},{&quot;value&quot;:&quot;notification&quot;},{&quot;value&quot;:&quot;settings&quot;},{&quot;value&quot;:&quot;setting&quot;},{&quot;value&quot;:&quot;posts&quot;},{&quot;value&quot;:&quot;post&quot;},{&quot;value&quot;:&quot;photos&quot;},{&quot;value&quot;:&quot;photo&quot;},{&quot;value&quot;:&quot;create&quot;},{&quot;value&quot;:&quot;pages&quot;},{&quot;value&quot;:&quot;page&quot;},{&quot;value&quot;:&quot;groups&quot;},{&quot;value&quot;:&quot;group&quot;},{&quot;value&quot;:&quot;events&quot;},{&quot;value&quot;:&quot;event&quot;},{&quot;value&quot;:&quot;games&quot;},{&quot;value&quot;:&quot;game&quot;},{&quot;value&quot;:&quot;saved&quot;},{&quot;value&quot;:&quot;forums&quot;},{&quot;value&quot;:&quot;forum&quot;},{&quot;value&quot;:&quot;blogs&quot;},{&quot;value&quot;:&quot;blog&quot;},{&quot;value&quot;:&quot;articles&quot;},{&quot;value&quot;:&quot;article&quot;},{&quot;value&quot;:&quot;directory&quot;},{&quot;value&quot;:&quot;products&quot;},{&quot;value&quot;:&quot;product&quot;},{&quot;value&quot;:&quot;market&quot;},{&quot;value&quot;:&quot;admincp&quot;},{&quot;value&quot;:&quot;admin&quot;},{&quot;value&quot;:&quot;admins&quot;},{&quot;value&quot;:&quot;modcp&quot;},{&quot;value&quot;:&quot;moderator&quot;},{&quot;value&quot;:&quot;moderators&quot;},{&quot;value&quot;:&quot;moderatorcp&quot;},{&quot;value&quot;:&quot;chat&quot;},{&quot;value&quot;:&quot;ads&quot;},{&quot;value&quot;:&quot;wallet&quot;},{&quot;value&quot;:&quot;boosted&quot;},{&quot;value&quot;:&quot;people&quot;},{&quot;value&quot;:&quot;popular&quot;},{&quot;value&quot;:&quot;movies&quot;},{&quot;value&quot;:&quot;movie&quot;},{&quot;value&quot;:&quot;api&quot;},{&quot;value&quot;:&quot;apis&quot;},{&quot;value&quot;:&quot;oauth&quot;},{&quot;value&quot;:&quot;authorize&quot;},{&quot;value&quot;:&quot;anonymous&quot;},{&quot;value&quot;:&quot;jobs&quot;},{&quot;value&quot;:&quot;job&quot;}]'),
(1310, 'getting_started_profile_image_required', '0'),
(1311, 'getting_started_location_required', '0'),
(1312, 'getting_started_education_required', '0'),
(1313, 'getting_started_work_required', '0'),
(1314, 'posts_views_enabled', '1'),
(1425, 'points_per_post_view', '0.001'),
(1548, 'newsfeed_location_filter_enabled', '1'),
(1550, 'monetization_wallet_payment_enabled', '0'),
(1551, 'content_monetization_commission', '10'),
(1552, 'gifts_permission', 'everyone'),
(1578, 'system_logo_dark', 'photos/2023/01/Polex_4e86e93c805060e7f403bfc9aab53086.png'),
(1579, 'monetization_enabled', '0'),
(1580, 'monetization_permission', 'everyone'),
(1581, 'monetization_money_withdraw_enabled', '1'),
(1582, 'monetization_payment_method_custom', ''),
(1583, 'monetization_min_withdrawal', '50'),
(1584, 'monetization_money_transfer_enabled', '0'),
(1585, 'monetization_commission', '10'),
(1610, 'monetization_payment_method', 'paypal,skrill'),
(1618, 'packages_ads_free_enabled', '0'),
(1619, 'videos_upload_permission', 'everyone'),
(1620, 'audios_upload_permission', 'everyone'),
(1621, 'files_upload_permission', 'everyone'),
(1622, 'colored_posts_permission', 'everyone'),
(1623, 'activity_posts_permission', 'admins'),
(1624, 'polls_posts_permission', 'everyone'),
(1625, 'geolocation_posts_permission', 'everyone'),
(1626, 'anonymous_posts_permission', 'everyone'),
(1880, 'gif_posts_permission', 'everyone');

-- --------------------------------------------------------

--
-- Table structure for table `system_reactions`
--

CREATE TABLE `system_reactions` (
  `reaction_id` int UNSIGNED NOT NULL,
  `reaction` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `color` varchar(128) DEFAULT NULL,
  `image` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `system_reactions`
--

INSERT INTO `system_reactions` (`reaction_id`, `reaction`, `title`, `color`, `image`) VALUES
(1, 'like', 'Like', '#1E8BD2', 'reactions/like.png'),
(2, 'love', 'Love', '#F25268', 'reactions/love.png'),
(3, 'haha', 'Haha', '#F3B715', 'reactions/haha.png'),
(4, 'yay', 'Yay', '#F3B715', 'reactions/yay.png'),
(5, 'wow', 'Wow', '#F3B715', 'reactions/wow.png'),
(6, 'sad', 'Sad', '#F3B715', 'reactions/sad.png'),
(7, 'angry', 'Angry', '#F7806C', 'reactions/angry.png');

-- --------------------------------------------------------

--
-- Table structure for table `system_themes`
--

CREATE TABLE `system_themes` (
  `theme_id` int UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `default` enum('0','1') NOT NULL,
  `enabled` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `system_themes`
--

INSERT INTO `system_themes` (`theme_id`, `name`, `default`, `enabled`) VALUES
(1, 'default', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int UNSIGNED NOT NULL,
  `user_group` tinyint UNSIGNED NOT NULL DEFAULT '3',
  `user_demo` enum('0','1') NOT NULL DEFAULT '0',
  `user_name` varchar(64) NOT NULL,
  `user_email` varchar(64) NOT NULL,
  `user_email_verified` enum('0','1') NOT NULL DEFAULT '0',
  `user_email_verification_code` varchar(64) DEFAULT NULL,
  `user_phone` varchar(64) DEFAULT NULL,
  `user_phone_verified` enum('0','1') NOT NULL DEFAULT '0',
  `user_phone_verification_code` varchar(64) DEFAULT NULL,
  `user_password` varchar(64) NOT NULL,
  `user_two_factor_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `user_two_factor_type` enum('email','sms','google') DEFAULT NULL,
  `user_two_factor_key` varchar(64) DEFAULT NULL,
  `user_two_factor_gsecret` varchar(64) DEFAULT NULL,
  `user_activated` enum('0','1') NOT NULL DEFAULT '0',
  `user_reseted` enum('0','1') NOT NULL DEFAULT '0',
  `user_reset_key` varchar(64) DEFAULT NULL,
  `user_subscribed` enum('0','1') NOT NULL DEFAULT '0',
  `user_package` int UNSIGNED DEFAULT NULL,
  `user_subscription_date` datetime DEFAULT NULL,
  `user_boosted_posts` int UNSIGNED NOT NULL DEFAULT '0',
  `user_boosted_pages` int UNSIGNED NOT NULL DEFAULT '0',
  `user_started` enum('0','1') NOT NULL DEFAULT '0',
  `user_verified` enum('0','1') NOT NULL DEFAULT '0',
  `user_banned` enum('0','1') NOT NULL DEFAULT '0',
  `user_banned_message` text,
  `user_live_requests_counter` int UNSIGNED NOT NULL DEFAULT '0',
  `user_live_requests_lastid` int UNSIGNED NOT NULL DEFAULT '0',
  `user_live_messages_counter` int UNSIGNED NOT NULL DEFAULT '0',
  `user_live_messages_lastid` int UNSIGNED NOT NULL DEFAULT '0',
  `user_live_notifications_counter` int UNSIGNED NOT NULL DEFAULT '0',
  `user_live_notifications_lastid` int UNSIGNED NOT NULL DEFAULT '0',
  `user_latitude` varchar(256) NOT NULL DEFAULT '0',
  `user_longitude` varchar(256) NOT NULL DEFAULT '0',
  `user_location_updated` datetime DEFAULT NULL,
  `user_firstname` varchar(256) NOT NULL,
  `user_lastname` varchar(256) DEFAULT NULL,
  `user_gender` int UNSIGNED DEFAULT NULL,
  `user_picture` varchar(255) DEFAULT NULL,
  `user_picture_id` int UNSIGNED DEFAULT NULL,
  `user_cover` varchar(256) DEFAULT NULL,
  `user_cover_id` int UNSIGNED DEFAULT NULL,
  `user_cover_position` varchar(256) DEFAULT NULL,
  `user_album_pictures` int UNSIGNED DEFAULT NULL,
  `user_album_covers` int UNSIGNED DEFAULT NULL,
  `user_album_timeline` int UNSIGNED DEFAULT NULL,
  `user_pinned_post` int UNSIGNED DEFAULT NULL,
  `user_registered` datetime DEFAULT NULL,
  `user_last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_first_failed_login` datetime DEFAULT NULL,
  `user_failed_login_ip` varchar(64) DEFAULT NULL,
  `user_failed_login_count` int UNSIGNED NOT NULL DEFAULT '0',
  `user_country` int UNSIGNED DEFAULT NULL,
  `user_birthdate` date DEFAULT NULL,
  `user_relationship` varchar(256) DEFAULT NULL,
  `user_biography` text,
  `user_website` varchar(256) DEFAULT NULL,
  `user_work_title` varchar(256) DEFAULT NULL,
  `user_work_place` varchar(256) DEFAULT NULL,
  `user_work_url` varchar(256) DEFAULT NULL,
  `user_current_city` varchar(256) DEFAULT NULL,
  `user_hometown` varchar(256) DEFAULT NULL,
  `user_edu_major` varchar(256) DEFAULT NULL,
  `user_edu_school` varchar(256) DEFAULT NULL,
  `user_edu_class` varchar(256) DEFAULT NULL,
  `user_social_facebook` varchar(256) DEFAULT NULL,
  `user_social_twitter` varchar(256) DEFAULT NULL,
  `user_social_youtube` varchar(256) DEFAULT NULL,
  `user_social_instagram` varchar(256) DEFAULT NULL,
  `user_social_twitch` varchar(256) DEFAULT NULL,
  `user_social_linkedin` varchar(256) DEFAULT NULL,
  `user_social_vkontakte` varchar(256) DEFAULT NULL,
  `user_profile_background` varchar(256) DEFAULT NULL,
  `user_chat_enabled` enum('0','1') NOT NULL DEFAULT '1',
  `user_privacy_newsletter` enum('0','1') NOT NULL DEFAULT '1',
  `user_privacy_poke` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_gifts` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_wall` enum('me','friends','public') NOT NULL DEFAULT 'friends',
  `user_privacy_gender` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_birthdate` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_relationship` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_basic` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_work` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_location` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_education` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_other` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_friends` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_followers` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_photos` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_pages` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_groups` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `user_privacy_events` enum('me','friends','public') NOT NULL DEFAULT 'public',
  `email_post_likes` enum('0','1') NOT NULL DEFAULT '1',
  `email_post_comments` enum('0','1') NOT NULL DEFAULT '1',
  `email_post_shares` enum('0','1') NOT NULL DEFAULT '1',
  `email_wall_posts` enum('0','1') NOT NULL DEFAULT '1',
  `email_mentions` enum('0','1') NOT NULL DEFAULT '1',
  `email_profile_visits` enum('0','1') NOT NULL DEFAULT '1',
  `email_friend_requests` enum('0','1') NOT NULL DEFAULT '1',
  `facebook_connected` enum('0','1') NOT NULL DEFAULT '0',
  `facebook_id` varchar(128) DEFAULT NULL,
  `google_connected` enum('0','1') NOT NULL DEFAULT '0',
  `google_id` varchar(128) DEFAULT NULL,
  `twitter_connected` enum('0','1') NOT NULL DEFAULT '0',
  `twitter_id` varchar(128) DEFAULT NULL,
  `instagram_connected` enum('0','1') NOT NULL DEFAULT '0',
  `instagram_id` varchar(128) DEFAULT NULL,
  `linkedin_connected` enum('0','1') NOT NULL DEFAULT '0',
  `linkedin_id` varchar(128) DEFAULT NULL,
  `vkontakte_connected` enum('0','1') NOT NULL DEFAULT '0',
  `vkontakte_id` varchar(128) DEFAULT NULL,
  `user_referrer_id` int DEFAULT NULL,
  `points_earned` enum('0','1') NOT NULL DEFAULT '0',
  `user_points` float NOT NULL DEFAULT '0',
  `user_wallet_balance` float NOT NULL DEFAULT '0',
  `user_affiliate_balance` float NOT NULL DEFAULT '0',
  `user_funding_balance` float NOT NULL DEFAULT '0',
  `user_monetization_enabled` enum('0','1') NOT NULL DEFAULT '0',
  `user_monetization_price` float NOT NULL DEFAULT '0',
  `user_monetization_balance` float NOT NULL DEFAULT '0',
  `chat_sound` enum('0','1') NOT NULL DEFAULT '1',
  `notifications_sound` enum('0','1') NOT NULL DEFAULT '1',
  `onesignal_user_id` varchar(100) DEFAULT NULL,
  `user_language` varchar(16) DEFAULT 'en_us',
  `user_free_tried` enum('0','1') NOT NULL DEFAULT '0',
  `coinbase_hash` varchar(128) DEFAULT NULL,
  `coinbase_code` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_group`, `user_demo`, `user_name`, `user_email`, `user_email_verified`, `user_email_verification_code`, `user_phone`, `user_phone_verified`, `user_phone_verification_code`, `user_password`, `user_two_factor_enabled`, `user_two_factor_type`, `user_two_factor_key`, `user_two_factor_gsecret`, `user_activated`, `user_reseted`, `user_reset_key`, `user_subscribed`, `user_package`, `user_subscription_date`, `user_boosted_posts`, `user_boosted_pages`, `user_started`, `user_verified`, `user_banned`, `user_banned_message`, `user_live_requests_counter`, `user_live_requests_lastid`, `user_live_messages_counter`, `user_live_messages_lastid`, `user_live_notifications_counter`, `user_live_notifications_lastid`, `user_latitude`, `user_longitude`, `user_location_updated`, `user_firstname`, `user_lastname`, `user_gender`, `user_picture`, `user_picture_id`, `user_cover`, `user_cover_id`, `user_cover_position`, `user_album_pictures`, `user_album_covers`, `user_album_timeline`, `user_pinned_post`, `user_registered`, `user_last_seen`, `user_first_failed_login`, `user_failed_login_ip`, `user_failed_login_count`, `user_country`, `user_birthdate`, `user_relationship`, `user_biography`, `user_website`, `user_work_title`, `user_work_place`, `user_work_url`, `user_current_city`, `user_hometown`, `user_edu_major`, `user_edu_school`, `user_edu_class`, `user_social_facebook`, `user_social_twitter`, `user_social_youtube`, `user_social_instagram`, `user_social_twitch`, `user_social_linkedin`, `user_social_vkontakte`, `user_profile_background`, `user_chat_enabled`, `user_privacy_newsletter`, `user_privacy_poke`, `user_privacy_gifts`, `user_privacy_wall`, `user_privacy_gender`, `user_privacy_birthdate`, `user_privacy_relationship`, `user_privacy_basic`, `user_privacy_work`, `user_privacy_location`, `user_privacy_education`, `user_privacy_other`, `user_privacy_friends`, `user_privacy_followers`, `user_privacy_photos`, `user_privacy_pages`, `user_privacy_groups`, `user_privacy_events`, `email_post_likes`, `email_post_comments`, `email_post_shares`, `email_wall_posts`, `email_mentions`, `email_profile_visits`, `email_friend_requests`, `facebook_connected`, `facebook_id`, `google_connected`, `google_id`, `twitter_connected`, `twitter_id`, `instagram_connected`, `instagram_id`, `linkedin_connected`, `linkedin_id`, `vkontakte_connected`, `vkontakte_id`, `user_referrer_id`, `points_earned`, `user_points`, `user_wallet_balance`, `user_affiliate_balance`, `user_funding_balance`, `user_monetization_enabled`, `user_monetization_price`, `user_monetization_balance`, `chat_sound`, `notifications_sound`, `onesignal_user_id`, `user_language`, `user_free_tried`, `coinbase_hash`, `coinbase_code`) VALUES
(1, 1, '0', 'alahdal262', 'alahdal262@gmail.com', '1', NULL, NULL, '0', NULL, '$2y$10$ugIeDbKM9XjJO.BOlnhpDul6LKHpLfdhUJVF87wDTi4fPa4.yKayq', '0', NULL, NULL, 'YCTXPGURSAXBAZTI', '1', '0', NULL, '0', NULL, NULL, 0, 0, '1', '1', '0', NULL, 0, 0, 0, 4, 0, 0, '0', '0', NULL, 'alahdal262', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-14 19:33:03', '2023-03-01 03:05:32', '2023-01-25 23:38:05', '85.255.237.84', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(2, 3, '1', 'Shaima', 'shaima.abedo.1999@gmail.com', '0', NULL, NULL, '0', NULL, '$2y$10$iF2TISKPDpYSqw5UD1.Htet9rM85vrwcYZit/svEGkQzHZt4S./pW', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '1', '0', '0', '', 0, 0, 0, 2, 0, 0, '0', '0', NULL, 'شيماء ', 'العباسي ', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-14 20:15:49', '2023-02-28 14:39:48', '2023-02-28 00:50:29', '115.97.88.227', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(3, 1, '0', 'abdel', 'abdelalahdal@gmail.com', '1', NULL, NULL, '0', NULL, 'e73e3d6aed217a35ec45ddbb2a4263a7', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '1', '1', '0', '', 1, 0, 0, 0, 9, 0, '0', '0', NULL, 'Abdel', 'Alahdal', 1, NULL, NULL, NULL, NULL, '0px', 1, 2, NULL, NULL, '2023-01-15 08:27:12', '2023-01-16 17:24:26', '2023-03-06 10:01:37', '127.0.0.1', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'photos/2023/01/Polex_68941761e47ecd9d9320ef6126b35499.jpg', '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '1', '6019704028051231', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'ar_sa', '0', NULL, NULL),
(4, 3, '0', 'sama', 'maanee_mutaz_kPyH@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$0Mt81vXSW/g9P3p9tcFMqO9GbcesSywk4iFGSbP01a0TYLmC5TpIm', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '1', '0', '0', '', 0, 0, 0, 0, 4, 0, '0', '0', NULL, 'مصطفى', 'الشهيل', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:01:31', '2023-01-26 00:30:45', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'ar_sa', '0', NULL, NULL),
(5, 3, '0', 'abulebbeh_saleem_9lX4', 'abulebbeh_saleem_9lX4@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$C0lEAzMkLAi..n078ime8.DQeFgi4n0/.1zWcx3vFH8lQVxn0cW/K', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 1, 0, '0', '0', NULL, 'لؤي', 'العرفج', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:01:31', '2023-01-15 14:01:31', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(6, 3, '0', 'mqawasmee_Ny4O', 'mqawasmee_Ny4O@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$cxFED8SsCaomGNBImoJuce78ze.1Fau/dd07GrviY/ZaYyz0jJSHC', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'همام', 'العتيبي', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:01:31', '2023-01-15 14:01:31', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(7, 3, '0', 'mutaz15_8F4y', 'mutaz15_8F4y@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$KFZ.8kwA72fTq3qg/1mReuUnj1OYajRSg8FsxpUjre1dLYk8iJ/Lm', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'نعمه', 'المقبل', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:01:31', '2023-01-15 14:01:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(8, 3, '0', 'hamad_osama_FNq2', 'hamad_osama_FNq2@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$0XeuJ/h.J9bi.Cs9bXY1YuT5lqjhb6B1LHzdKzrG9KPIo56ua5aMO', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'وفاء', 'الفرحان', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:01:31', '2023-01-15 14:01:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(9, 3, '0', 'ahmad75_ltFP', 'ahmad75_ltFP@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$EIMshH30gLt1lTGLlC3w2OOll/MJXkkKgPcfLRLgBkWmXPWzvt2Qe', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'عالية', 'مدني', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:01:31', '2023-01-15 14:01:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(10, 3, '0', 'sjabri_gL94', 'sjabri_gL94@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$U2M93FossO7iNey/USWYBO8mj14imXcct8tXsjP0qab3YRUATtPdC', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'ميناس', 'العنزي', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:01:31', '2023-01-15 14:01:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(11, 3, '0', 'ibrahim_obaisi_LKGr', 'ibrahim_obaisi_LKGr@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$QojRnuJKDcohtTFFN65D6ucakGgBTsdcwGHEbxOVAmL00OjNCw2/u', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'نزيه', 'برماوي', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:01:31', '2023-01-15 14:01:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(12, 3, '0', 'ghasan_wHL6', 'ghasan_wHL6@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$OO5lDBMpbJnumiViglTTSu2/o6IVzYBuNUUD.ZmajA3ZiL5E35iDW', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'حصة', 'المقبل', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:01:31', '2023-01-15 14:01:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(13, 3, '0', 'rami91_54Tg', 'rami91_54Tg@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$jW8GAGpgIjcbspSpS/z5u.1Otceq7Vu5wzooyoxyHQSUgq18FH3CK', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'ضياء الدين&rsquo;, ', 'الشهيل', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:01:31', '2023-01-15 14:01:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(14, 3, '0', 'ymaanee_23zo', 'ymaanee_23zo@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$LqHfRm9CC8aKw0gOsAPqzO6MpbKDfoo3hxE4bHHrYHfI6mPnMQdsm', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'عبد السلام', 'العرفج', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:32', '2023-01-15 14:02:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(15, 3, '0', 'ahmad76_l1JG', 'ahmad76_l1JG@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$52xjCBCdVgdd91fro8TxmOIaMjpHl1Atz10.NiA6Jdh/DtlMZzNcm', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'إنعام', 'الراجحي', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:32', '2023-01-15 14:02:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(16, 3, '0', 'qasem_amr_fiWG', 'qasem_amr_fiWG@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$EBy/lW6RG/N/VZUYGqtLN..wPInuja.kWbkEHe/Ib/pVG3D00Tw2m', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'سمر', 'الخضيري', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:32', '2023-01-15 14:02:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(17, 3, '0', 'bashar44_odfs', 'bashar44_odfs@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$BTQUBz5RwDJomva9MhDj0uh5Jc17kCV.PDjToD7Tld05F/moO0P42', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'غازي', 'العتيبي', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:32', '2023-01-15 14:02:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(18, 3, '0', 'ahmad_maanee_jbxg', 'ahmad_maanee_jbxg@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$WWwfPZWxqrlAOT5NBjfCo.4JyoFgv5qvO/DwhSEu.uwNkgiPaNJaO', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'ميرا', 'الحميد', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:32', '2023-01-15 14:02:33', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(19, 3, '0', 'abdullah98_mdQO', 'abdullah98_mdQO@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$kLEnPX3OM1iCfkftm2FjBuJgNkjTmh93NFgN/u.8W5U9f4Soz1.tq', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'البراء', 'باشا', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:32', '2023-01-15 14:02:33', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(20, 3, '0', 'abbad_akram_ZHx4', 'abbad_akram_ZHx4@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$q3Mw2b0UoJs8yIXzegVQg.8AVpNHuyjtVE7O13kMdMORjGiETpLvO', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'ملاك', 'السماري', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:32', '2023-01-15 14:02:33', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(21, 3, '0', 'orabee_BJqp', 'orabee_BJqp@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$enE2W6fwypAy25dP4NYjPeYNAuyZGtDneBgu1uVQm3jbuMQld3P5K', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'نجود', 'المنيف', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:32', '2023-01-15 14:02:33', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(22, 3, '0', 'ibrahim_karam_Sknv', 'ibrahim_karam_Sknv@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$VBFRP9GqazjrXi2/x0Ox6OBZ0MAstuuGtLmfX0QsQodbjwXSRND5a', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'سهم', 'السالم', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:32', '2023-01-15 14:02:33', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(23, 3, '0', 'saleem82_Rn25', 'saleem82_Rn25@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$umk0go9oyvgGVMtREtoSEOIUmWG.xR4ulbGExmCGCPgoAFt4KOwsm', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'فاتن', 'السماعيل', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:32', '2023-01-15 14:02:33', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(24, 3, '0', 'osama24_Ac27', 'osama24_Ac27@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$.lr7nmHeSHo8KFMPGuBBwOLwJIPMQuk171DJ5PmtNA7i9SUbvaSCa', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'انيس', 'الشهيل', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:54', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(25, 3, '0', 'xrabee_p1kR', 'xrabee_p1kR@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$FvF72j7DONPwDMjW35/s6.awWCk6NoYp37eJgUR9BAD.NV3fznY5u', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'زكية', 'السليم', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:54', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(26, 3, '0', 'abbad_yazan_joYW', 'abbad_yazan_joYW@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$N3qCIZdKMXc5d3YPvrwYwes7OOrwg7SyjSapwRWVwDVzKGkpuR8IG', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'رجاء', 'السماري', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:54', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(27, 3, '0', 'rami_abulebbeh_HMo6', 'rami_abulebbeh_HMo6@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$EURGvSPVcJY.nXFEiDNdUOCidSjvZtMuKGOi3xSquLk6xQQZdHW7K', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'ضياء', 'هوساوي', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:54', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(28, 3, '0', 'sami_hasan_GTAx', 'sami_hasan_GTAx@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$EOQMzJxOEhtPEYA6wmd68.jImN5YldAufR5WON87mHCDuJLQhn5EO', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'عبد القادر', 'الماجد', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:55', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(29, 3, '0', 'yazan93_o3HQ', 'yazan93_o3HQ@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$jaOmh64oLdY1ZS05bebHCuT.CQLH9uUUCszwHrdzemWLLbMFQdi5K', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 1, 0, 0, 0, 2, 0, '0', '0', NULL, 'واثق', 'الداوود', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:55', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(30, 3, '0', 'abbad_abd_9Lmq', 'abbad_abd_9Lmq@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$IGl9FvViDekIrkv.Qopy3eM12p6ujZSbtZCCJGm5SWrd8644DuwnS', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 1, 0, 0, 0, 2, 0, '0', '0', NULL, 'زكية', 'الداوود', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:55', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(31, 3, '0', 'jabri_mutaz_bSPU', 'jabri_mutaz_bSPU@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$NvFsTYvR.iB.o/KrlX1h1ugprBC5aDJBQ2lljeQRWM1zgcK2hvFcy', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 1, 0, 0, 0, 2, 0, '0', '0', NULL, 'وصفي', 'مكي', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:55', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(32, 3, '0', 'ahmad85_6Ogc', 'ahmad85_6Ogc@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$JbXYI14XISdmxlYOU5Mk6OtaNcLOYv76R2NCPyB5Ids44uo/pUx/G', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 1, 0, 0, 0, 2, 0, '0', '0', NULL, 'أوس', 'الحسين', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:55', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(33, 3, '0', 'brabee_obWP', 'brabee_obWP@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$roYk5mIPtKW/T5i8YnWmkOmGj/3gihbUN6m3xBFtMEfVM1eBoFtTa', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'أريج', 'الحنتوشي', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:55', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(34, 3, '0', 'khaled_abbadi_2Xee', 'khaled_abbadi_2Xee@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$oyjc7CtcMRVKFcUobwbtqOk52SX0cIXZzMFqeV1daOT0RmDMOJuPa', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'غصون', 'جواهرجي', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:55', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(35, 3, '0', 'abdullah32_j78E', 'abdullah32_j78E@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$x9hX1f3VwNyKZVdm9zlLcOyiC/NvNvUJx6nU.ZUm2g8UQIj9gHAma', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'عمر', 'السهلي', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:55', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(36, 3, '0', 'rabee_samer_TL0f', 'rabee_samer_TL0f@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$dr1qTk1tpHCFi1l5uIrdm.gH0vCC040QmU0eJVvSI8ZD08qBWAnwi', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'منال', 'باشا', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:56', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(37, 3, '0', 'khasan_G16t', 'khasan_G16t@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$qqNvOH9i6KmkelB/rtvo7eMVDx8IbSpRjBxB/ejF2m42FArUVMJha', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'بشرى', 'العمرو', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:56', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(38, 3, '0', 'samer39_qtJS', 'samer39_qtJS@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$hY57OK.IcLMZ5sN3aZS4YOzqCJjo7BHaPziXHAvhmJs8fBnnGjli.', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 1, 0, 0, 0, 4, 0, '0', '0', NULL, 'زهير', 'القحطاني', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:56', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(39, 3, '0', 'ihamad_v0j0', 'ihamad_v0j0@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$X/4wWe4trG.SK6JjRHA0S./Rtg0dN/14WAaKh.rCe99D3fQ842HAe', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 1, 0, 0, 0, 2, 0, '0', '0', NULL, 'اسامة', 'الحصين', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:56', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(40, 3, '0', 'mohammad44_3vHi', 'mohammad44_3vHi@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$moxMoW7ADxjJWrXqF2Fx/uaqfh02RL.qBrKCTpBZekn.kNSlBTUpW', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'أسحار', 'الراجحي', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:56', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(41, 3, '0', 'kanaan_ibrahim_sd8w', 'kanaan_ibrahim_sd8w@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$eTzmT1zOJ01nOCJXIJHbUOySFrkZbuSoak.h7shqR3d52pACiKUNK', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'فيفيان', 'المقبل', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:56', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(42, 3, '0', 'zmaanee_xBaO', 'zmaanee_xBaO@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$gP3kMcjdp00ZpNkrrp7UAOEd.zMxcMSEPNMWYtoGUJ0jnKW3CtW0W', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'منال', 'العقل', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:56', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(43, 3, '0', 'robaisi_8l3T', 'robaisi_8l3T@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$Ry0Cg0cACPFzxmGnWJqH4egtMPzvyILsVajZOHuv1GFwHwotWm5Km', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'نرمين', 'العرفج', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:56', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(44, 3, '0', 'khaled_hasan_l8dl', 'khaled_hasan_l8dl@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$qNh4AfBA2ubLqlBTxP8xxOZRPVK.QHpbyzf1zYrjsYdZCWY2ZZV3a', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'نعمان', 'جواهرجي', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:57', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(45, 3, '0', 'amr_jabri_uijO', 'amr_jabri_uijO@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$7SUq2uPoGpUZslzS20kor.UDi9UuGzBZd4s/GwEOqk5eYapRdCXQ6', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'رانيا', 'الماجد', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:57', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(46, 3, '0', 'shami_mutaz_Uwjh', 'shami_mutaz_Uwjh@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$.gZnKRjFg.CIbc/v9hGYpeo6Ngor1J9zYbLfNDorsxC60lrjU/ph2', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'سيرينا', 'الحسين', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:57', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(47, 3, '0', 'abd_kanaan_OiCD', 'abd_kanaan_OiCD@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$vTk1tyjKFv3KQAphxR3uuegq.dbZz5slEv5gtOpq2DGAJojZk.f6a', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'إباء', 'الصقير', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:57', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(48, 3, '0', 'rmelhem_IZkr', 'rmelhem_IZkr@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$QVpc.ZeetC/c2BcbRBRhI.qVEJ3UiPWmwnrbRW9Rjomtapl3n3T0G', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'غصون', 'الحنتوشي', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:57', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(49, 3, '0', 'abbas_amr_pSPd', 'abbas_amr_pSPd@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$a0/Cf8ylTild6t4Po1J./uLvYwp1NBs4oo4LtuDFuVzH8oqivLI/u', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'عوده', 'المقبل', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:57', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(50, 3, '0', 'lkanaan_BUtx', 'lkanaan_BUtx@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$vu198JuhLW7rR2UCwOdZhunAtgUqfK5lGmI9F2xg6du0g5bJo2uUi', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'سلمان', 'الشيباني', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:57', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(51, 3, '0', 'qmaanee_8Tii', 'qmaanee_8Tii@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$vV7INvYJpQ1/kCKFm418zOZc.9xo7ftLWpXucBrrE7oM8uRKlRW2S', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 1, 0, 0, 0, 2, 0, '0', '0', NULL, 'براء', 'الأحمري', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:57', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(52, 3, '0', 'yazan08_nRLV', 'yazan08_nRLV@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$ZJSWRAHYLCLA2QRw2bbitenNKs5Jh5qmc3DZiR7HptjDDfUSsanI2', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 1, 0, 0, 0, 2, 0, '0', '0', NULL, 'سعد', 'المقبل', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:57', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL);
INSERT INTO `users` (`user_id`, `user_group`, `user_demo`, `user_name`, `user_email`, `user_email_verified`, `user_email_verification_code`, `user_phone`, `user_phone_verified`, `user_phone_verification_code`, `user_password`, `user_two_factor_enabled`, `user_two_factor_type`, `user_two_factor_key`, `user_two_factor_gsecret`, `user_activated`, `user_reseted`, `user_reset_key`, `user_subscribed`, `user_package`, `user_subscription_date`, `user_boosted_posts`, `user_boosted_pages`, `user_started`, `user_verified`, `user_banned`, `user_banned_message`, `user_live_requests_counter`, `user_live_requests_lastid`, `user_live_messages_counter`, `user_live_messages_lastid`, `user_live_notifications_counter`, `user_live_notifications_lastid`, `user_latitude`, `user_longitude`, `user_location_updated`, `user_firstname`, `user_lastname`, `user_gender`, `user_picture`, `user_picture_id`, `user_cover`, `user_cover_id`, `user_cover_position`, `user_album_pictures`, `user_album_covers`, `user_album_timeline`, `user_pinned_post`, `user_registered`, `user_last_seen`, `user_first_failed_login`, `user_failed_login_ip`, `user_failed_login_count`, `user_country`, `user_birthdate`, `user_relationship`, `user_biography`, `user_website`, `user_work_title`, `user_work_place`, `user_work_url`, `user_current_city`, `user_hometown`, `user_edu_major`, `user_edu_school`, `user_edu_class`, `user_social_facebook`, `user_social_twitter`, `user_social_youtube`, `user_social_instagram`, `user_social_twitch`, `user_social_linkedin`, `user_social_vkontakte`, `user_profile_background`, `user_chat_enabled`, `user_privacy_newsletter`, `user_privacy_poke`, `user_privacy_gifts`, `user_privacy_wall`, `user_privacy_gender`, `user_privacy_birthdate`, `user_privacy_relationship`, `user_privacy_basic`, `user_privacy_work`, `user_privacy_location`, `user_privacy_education`, `user_privacy_other`, `user_privacy_friends`, `user_privacy_followers`, `user_privacy_photos`, `user_privacy_pages`, `user_privacy_groups`, `user_privacy_events`, `email_post_likes`, `email_post_comments`, `email_post_shares`, `email_wall_posts`, `email_mentions`, `email_profile_visits`, `email_friend_requests`, `facebook_connected`, `facebook_id`, `google_connected`, `google_id`, `twitter_connected`, `twitter_id`, `instagram_connected`, `instagram_id`, `linkedin_connected`, `linkedin_id`, `vkontakte_connected`, `vkontakte_id`, `user_referrer_id`, `points_earned`, `user_points`, `user_wallet_balance`, `user_affiliate_balance`, `user_funding_balance`, `user_monetization_enabled`, `user_monetization_price`, `user_monetization_balance`, `chat_sound`, `notifications_sound`, `onesignal_user_id`, `user_language`, `user_free_tried`, `coinbase_hash`, `coinbase_code`) VALUES
(53, 3, '0', 'eqasem_wVu5', 'eqasem_wVu5@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$g3JNgkr9L3j.NKUCgN3W7e80.7aNS3zLyE0WDDEZgp.gurIaLqIHG', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'أمل', 'المشيقح', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(54, 3, '0', 'bashar43_digy', 'bashar43_digy@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$wO1Xj5MqqK5TwWSzEd8KWOCSrRPbMY0PUJYiAK5ha1U6Xj0kmHC3e', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 1, 0, 0, 0, 2, 0, '0', '0', NULL, 'لورا', 'الخضيري', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(55, 3, '0', 'ibrahim_obaisi_7Su5', 'ibrahim_obaisi_7Su5@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$Mtv1v3Yga.zjd/8kfU.VYOeZslCt0ho4Mk8fSSWMmtDrLmhOjChgW', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 1, 0, 0, 0, 2, 0, '0', '0', NULL, 'طاهر', 'العرفج', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(56, 3, '0', 'melhem_akram_ML4L', 'melhem_akram_ML4L@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$QIbU63.egfh/ZT38HOlFneCEwFCjn6Qt8oqkShjMtMTHzTxCKwW9W', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'ناديه', 'العرفج', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(57, 3, '0', 'akram61_qrJD', 'akram61_qrJD@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$7c2pBqnea6Sfft7/WbR6Q.vYsleNiusrqNzoZQjuCq8HA..AJL7Uq', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 1, 0, '0', '0', NULL, 'نسرين', 'مدني', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(58, 3, '0', 'samer99_NgM1', 'samer99_NgM1@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$.0zcXJ9O5m1.CfomrL/Ds.rOzIlGiwpRM/nqCNOMR2fsTFml8ZWWy', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'غالب', 'المشيقح', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(59, 3, '0', 'dshami_Ponu', 'dshami_Ponu@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$6mkWrwsHBzs7Qq1pF0uOhODSx7SNsZtjlqIB20u2WOtA/1vZdca4.', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'عبادة', 'الخضيري', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(60, 3, '0', 'shami_abd_FJ9h', 'shami_abd_FJ9h@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$Qe2ZbCR8/ZKww07GtumJ1OFcPzDBP/pKVOl4Q7Zu2JMcpNsYm5Z1.', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'حسناء', 'السهلي', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(61, 3, '0', 'flefel_abdullah_OOMb', 'flefel_abdullah_OOMb@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$9/S3ufmEo94cYUQfQqpoPuWfbw2omwKzi/2Ga.QQEMynVAS7mmkqG', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'صمود', 'العتيبي', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(62, 3, '0', 'thadi_q1jn', 'thadi_q1jn@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$./IocxQ2SzHHhup0obogsOBfb6mDMywZN5.SjOQqysOJbYS1dxp62', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'ميران', 'العرفج', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(63, 3, '0', 'fadi_flefel_W5l0', 'fadi_flefel_W5l0@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$ahUkSsBeYjCmegRYF8.mS.jTFTgpQazL95a5PVmHkFXaraUTcpwgG', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'عزة', 'الفيفي', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(64, 3, '0', 'shami_amr_d35O', 'shami_amr_d35O@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$wiVPKd2Ob5dR0tsCKhPxEO1g73GU4AKr0zYALmreMrTEQgX7/hbLC', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'اسحاق', 'الفريدي', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(65, 3, '0', 'flefel_samer_OQXx', 'flefel_samer_OQXx@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$QtMw1yKGkZa7HPjjfiyLH.TM/UpkTnjxHVzLoComJVFnTvNhJPXlK', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'إنعام', 'السماري', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(66, 3, '0', 'rami81_9cKY', 'rami81_9cKY@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$9S2ntfVzlPLU37lWTfzwMejkh5OPUVT62xwcKKGu3oKuiMObLnMSK', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'ميساء', 'المشيقح', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(67, 3, '0', 'amr69_N3gj', 'amr69_N3gj@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$KRK2IKrqLwi.AdmYy3xBZuRC00WqOdJNAzO7jeKragbzFQG72xcLy', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'هاشم', 'الجهني', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(68, 3, '0', 'akram31_QA9O', 'akram31_QA9O@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$kVvVobIQ4a/JZkpCGS8lJuZhuEtv/D80mo.jGlh62IZlYgz5biomC', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'أزهار', 'الشهري', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:02:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(69, 3, '0', 'ahasan_Lcj2', 'ahasan_Lcj2@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$quAwoZ6AePDlfQFWae8HPu7UEeBaK0BtUW7DUDEO/LQ5M.8mK/1N.', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'وسام', 'الداوود', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:03:00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(70, 3, '0', 'brabee_w4sb', 'brabee_w4sb@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$1SeqDvUCLdQU8mnrxWeA..Xf6XfFdcti9OZoRLnO5SwfS.9hK3F9u', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'وسن', 'الأسمري', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:03:00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(71, 3, '0', 'ibrahim_abbad_HWkp', 'ibrahim_abbad_HWkp@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$DPpkrCK462xNoEEGYjyIQOUBI0Uz8mAQqv/tNfGUoF1sbommSbEAK', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'صالح', 'الحميد', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:03:00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(72, 3, '0', 'rami_hamad_9ssj', 'rami_hamad_9ssj@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$LxWl4mZ0FEmj/EZ99xbzmO0mfwG8h8fjBJN1yYtSPBxan3J2x5.t2', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'زمان', 'الخالدي', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:03:00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(73, 3, '0', 'fadi67_oKXI', 'fadi67_oKXI@polex.graphicweb.co.uk', '0', NULL, NULL, '0', NULL, '$2y$10$j1Pija0rF.z.E7qj4kvSiewR/lPUIGx2KBjNRUpYHb16mp7w5Zn1a', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'أوس', 'الفريدي', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-15 14:02:54', '2023-01-15 14:03:00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(74, 3, '0', 'sami', 'sami@gmail.com', '0', NULL, NULL, '0', NULL, '$2y$10$HAZvJ2/tp89C7HpjluJQJeKrHUKf2NJg/CqmeKMVM5SiO9T8/knXa', '0', NULL, NULL, NULL, '0', '0', NULL, '0', NULL, NULL, 0, 0, '1', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'Sami', 'Kamal', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-16 13:01:41', '2023-01-16 14:34:53', '2023-02-06 22:28:15', '85.255.234.193', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(75, 3, '0', 'ez77', 'ez@gmail.com', '0', NULL, NULL, '0', NULL, '$2y$10$t7si25DrGSvO/4S8slNfOu46fBgUNjzsZLBN3EfcfuZ2a60GcAyuu', '0', NULL, NULL, 'NPKNHPDIOWSDES6L', '1', '0', NULL, '0', NULL, NULL, 0, 0, '1', '1', '0', '', 0, 0, 0, 4, 0, 0, '0', '0', NULL, 'عزت', 'أحمد', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-19 23:39:22', '2023-02-06 22:49:57', '2023-01-28 02:10:52', '154.236.92.30', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'ar_sa', '0', NULL, NULL),
(76, 3, '0', 'rio', 'rayan897908@gmail.com', '1', '0b4b63056e335feee8ecba25ff3de543', NULL, '0', NULL, '$2y$10$f1A6zwjoRkndgFl6gXjO5eCS1RBQC8qnNIn175hO5dtSJR/d/rZyu', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '0', '0', '0', '', 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'Rio', 'Rio', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-24 23:39:52', '2023-01-24 23:43:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'ar_sa', '0', NULL, NULL),
(77, 1, '0', 'ezzatmustafa', 'ezzat4mustafa@gmail.com', '1', 'aeda486467e02028200ce2a4a0a92e4b', NULL, '0', NULL, '$2y$10$D1mLBypMDef/6JRV1A5omeLvr2NAKXWnMYHnByBEUPkgPVGmIS0E6', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '1', '1', '0', '', 1, 0, 0, 0, 0, 0, '0', '0', NULL, 'Ezzat', 'Mustafa', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-25 23:51:50', '2023-02-06 22:59:21', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'ar_sa', '0', NULL, NULL),
(78, 3, '0', 'alkdja', 'alkda@mgial.com', '0', '83f279213dffc6ebfd5fe860b285fca2', NULL, '0', NULL, '$2y$10$H/LdrtHBdCcEIiE2SJIO6O7Ywd7lpIv7DMHtj.wDe5ht5x0BQsuvm', '0', NULL, NULL, NULL, '0', '0', NULL, '0', NULL, NULL, 0, 0, '1', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'Salsd', 'Lada', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-26 12:12:00', '2023-01-26 12:23:35', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL),
(79, 3, '0', 'Saleh123456', 'saleh123456@gmail.com', '0', NULL, NULL, '0', NULL, '$2y$10$xLdL75coq2jqyIs2KRKiZOMLPwwnBtOqmGYbXCiJtjqDf9z982Iza', '0', NULL, NULL, NULL, '0', '0', NULL, '0', NULL, NULL, 0, 0, '1', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'صالح عبدالرحمن', 'صالح عبدالرحمن', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-28 00:13:11', '2023-01-28 01:06:55', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'ar_sa', '0', NULL, NULL),
(80, 3, '0', 'nada', 'nada@gmail.com', '1', 'd7ca7fa6755793064e9d5acb9e3cef7d', NULL, '0', NULL, '$2y$10$Vt73zvcwPRbMyrqYQmxdouBuh4EH3mDRCxQSxivOl5YINyD5XfI8u', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '1', '1', '0', '', 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'Nada', 'Nada', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-06 22:28:51', '2023-02-06 22:47:07', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'ar_sa', '0', NULL, NULL),
(81, 1, '0', 'test', 'testuser1@gmail.com', '1', 'dc93331986b0ff42d469aaeaf8a68808', NULL, '0', NULL, '$2y$10$KPZ2fL00hR/s8KiWCsQfBeKwzmtzXiIjGA3/O9dbwA/TV3j3bWRNW', '0', NULL, NULL, NULL, '1', '0', NULL, '0', NULL, NULL, 0, 0, '1', '0', '0', NULL, 0, 0, 0, 0, 0, 0, '0', '0', NULL, 'Test', 'USEr 1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-06 10:02:48', '2023-03-21 05:29:09', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'public', 'public', 'friends', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', 'public', '1', '1', '1', '1', '1', '1', '1', '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', 0, 0, 0, 0, '0', 0, 0, '1', '1', NULL, 'en_us', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_affiliates`
--

CREATE TABLE `users_affiliates` (
  `id` int UNSIGNED NOT NULL,
  `referrer_id` int UNSIGNED NOT NULL,
  `referee_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_blocks`
--

CREATE TABLE `users_blocks` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `blocked_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_gifts`
--

CREATE TABLE `users_gifts` (
  `id` int UNSIGNED NOT NULL,
  `from_user_id` int UNSIGNED NOT NULL,
  `to_user_id` int UNSIGNED NOT NULL,
  `gift_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_invitations`
--

CREATE TABLE `users_invitations` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `email_phone` varchar(64) NOT NULL,
  `invitation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_pokes`
--

CREATE TABLE `users_pokes` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `poked_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users_searches`
--

CREATE TABLE `users_searches` (
  `log_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `node_id` int UNSIGNED NOT NULL,
  `node_type` varchar(32) NOT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users_searches`
--

INSERT INTO `users_searches` (`log_id`, `user_id`, `node_id`, `node_type`, `time`) VALUES
(1, 1, 2, 'user', '2023-01-15 14:40:18'),
(2, 1, 75, 'user', '2023-01-19 23:44:19');

-- --------------------------------------------------------

--
-- Table structure for table `users_sessions`
--

CREATE TABLE `users_sessions` (
  `session_id` int UNSIGNED NOT NULL,
  `session_token` varchar(64) NOT NULL,
  `session_date` datetime NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `user_browser` varchar(64) NOT NULL,
  `user_os` varchar(64) NOT NULL,
  `user_ip` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users_sessions`
--

INSERT INTO `users_sessions` (`session_id`, `session_token`, `session_date`, `user_id`, `user_browser`, `user_os`, `user_ip`) VALUES
(1, 'fb07a72ac50d5e343be7d550cc6cde44', '2023-01-14 19:33:28', 1, 'Chrome', 'Windows 10', '185.106.28.156'),
(3, '35c8845a09145941717ce794eacfd9cf', '2023-01-14 20:59:11', 1, 'Handheld Browser', 'iPhone', '185.240.17.89'),
(5, '1ac19d3956510ab7e82b8c17f255046e', '2023-01-15 08:28:04', 1, 'Chrome', 'Windows 10', '45.157.52.106'),
(6, '5d1a70a11461d6af6704e404bf91e352', '2023-01-15 14:10:00', 3, 'Chrome', 'Windows 10', '45.157.52.106'),
(7, '2082d7695c4493ebc65273caa278a9bd', '2023-01-15 14:33:58', 3, 'Chrome', 'Windows 10', '41.176.39.152'),
(8, '606c81533adae690c726c2929931bbb8', '2023-01-15 14:39:46', 3, 'Handheld Browser', 'Android', '2c0f:fc89:100:9767:9ec4:e420:61a:19cb'),
(16, '665c6bd64e6a91e0f43e09a03f1fd233', '2023-01-19 22:25:15', 1, 'Chrome', 'Mac OS X', '85.255.235.41'),
(17, '8c594850620ad3ef28d3ee840cbc070b', '2023-01-19 23:39:22', 75, 'Chrome', 'Windows 10', '41.176.39.50'),
(18, '88aafecf367e73fc96368c2ff09b43ff', '2023-01-20 15:51:27', 1, 'Firefox', 'Mac OS X', '85.255.237.23'),
(19, 'c514f895394dded1c60555e07eba3fcc', '2023-01-20 22:50:00', 75, 'Chrome', 'Windows 10', '197.120.135.193'),
(20, '87c59c36e6372928145f10b73a85bfb6', '2023-01-21 00:05:37', 75, 'Handheld Browser', 'Android', '2c0f:fc89:106:438e:9ba2:c486:7f4c:ebf1'),
(21, 'deb07fa1b35685f93b92a4641d0d2a59', '2023-01-21 01:54:03', 1, 'Handheld Browser', 'iPhone', '85.255.235.152'),
(23, '5b79915d4b76dd6f563fac583659cac0', '2023-01-24 23:12:36', 75, 'Handheld Browser', 'Android', '2c0f:fc89:806b:e24:502a:f258:60e9:492e'),
(28, 'e8c2b958fff0bf3d1e6b1fc72c3cefe3', '2023-01-25 23:38:32', 1, 'Chrome', 'Mac OS X', '85.255.237.84'),
(31, 'c21a01941b77649706fe201fd8f55aa0', '2023-01-25 23:53:40', 4, 'Chrome', 'Mac OS X', '85.255.237.84'),
(33, '8353921a400805d919f740543ca05531', '2023-01-26 12:02:33', 1, 'Chrome', 'Mac OS X', '194.61.173.240'),
(35, '618de0483d5f90f9fcd3412946b1fcf3', '2023-01-27 15:18:57', 1, 'Chrome', 'Mac OS X', '85.255.232.236'),
(45, '732882a627c7708cf2c5eb70ec047398', '2023-02-05 22:16:45', 77, 'Chrome', 'Windows 10', '154.239.201.254'),
(46, 'a8229f35c31cf6ba1fab40ebc4386c82', '2023-02-05 22:46:38', 1, 'Chrome', 'Mac OS X', '85.255.234.193'),
(50, '1f2d29573a301cc543633b6d5f4ed401', '2023-02-06 22:28:51', 80, 'Chrome', 'Mac OS X', '85.255.234.193'),
(51, '01f08cd4144e17e9f98e324cc3f45787', '2023-02-06 22:33:00', 77, 'Handheld Browser', 'Android', '62.139.244.148'),
(52, '2414d31e1008ae65f37e56711dda1813', '2023-02-27 17:34:52', 1, 'Handheld Browser', 'iPhone', '148.252.129.19'),
(54, 'd327971b5d49227c62d27703bdee5755', '2023-02-28 00:04:09', 1, 'Firefox', 'Mac OS X', '85.255.236.36'),
(55, 'dec5678e95c2247e7a064c8c1ca010bf', '2023-02-28 00:42:04', 2, 'Firefox', 'Windows 10', '39.52.152.180'),
(57, '95ced79d097088f3dad5dcd964b930c2', '2023-02-28 00:49:18', 2, 'Chrome', 'Mac OS X', '85.255.236.36'),
(58, '17731d57f88b3d1203bc95b6f1a43913', '2023-02-28 00:54:13', 2, 'Chrome', 'Windows 10', '115.97.88.227'),
(59, 'ef825699570a0f4770828a6a24053e5d', '2023-02-28 01:03:46', 2, 'Chrome', 'Windows 10', '188.43.136.46'),
(62, 'fbbcd31d708398121e0a4831ae006ae2', '2023-02-28 02:22:16', 1, 'Chrome', 'Mac OS X', '85.255.236.36'),
(63, '5d36e015ead8ae5d187550e78431e8c7', '2023-02-28 02:31:24', 2, 'Chrome', 'Windows 10', '2401:4900:1c5c:63c1:1412:c59:9985:b920'),
(64, '6387df2ee13add55b46dd2877edb453e', '2023-02-28 03:52:33', 2, 'Chrome', 'Linux', '122.160.138.11'),
(65, 'ec8cc96e218edfbdb0bd207ad4044534', '2023-02-28 06:13:19', 2, 'Chrome', 'Windows 10', '188.43.136.46'),
(66, 'c2eb7e58391c4e492f85171157f4fb13', '2023-02-28 10:26:19', 2, 'Chrome', 'Linux', '122.160.138.11'),
(67, 'a7dd3902d7655c66b50a880cf23665a6', '2023-02-28 13:45:38', 2, 'Chrome', 'Windows 10', '2400:adc5:422:6900:a086:5a30:b3ff:e2fa'),
(68, '5e7a35f831bd63dc09b3bee412eeef7d', '2023-02-28 14:36:30', 2, 'Chrome', 'Windows 10', '182.185.201.135'),
(69, '9762f75d9b31716827386692232e7f26', '2023-03-01 02:55:40', 1, 'Chrome', 'Mac OS X', '85.255.235.190'),
(71, '322076ebf150ed7a16db3b29828cb5cb', '2023-03-06 10:03:43', 81, 'Chrome', 'Windows 10', '127.0.0.1'),
(72, '313d756a850cb8758eddcf3a64bc7ad0', '2023-03-21 04:41:07', 81, 'Chrome', 'Windows 10', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `verification_requests`
--

CREATE TABLE `verification_requests` (
  `request_id` int UNSIGNED NOT NULL,
  `node_id` int UNSIGNED NOT NULL,
  `node_type` varchar(32) NOT NULL,
  `photo` varchar(256) DEFAULT NULL,
  `passport` varchar(256) DEFAULT NULL,
  `message` text,
  `time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_payments`
--

CREATE TABLE `wallet_payments` (
  `payment_id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `amount` varchar(32) NOT NULL,
  `method` varchar(64) NOT NULL,
  `method_value` text NOT NULL,
  `time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `transaction_id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `node_type` varchar(32) NOT NULL,
  `node_id` int UNSIGNED DEFAULT NULL,
  `amount` varchar(32) NOT NULL,
  `type` enum('in','out') NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `widget_id` int UNSIGNED NOT NULL,
  `title` varchar(256) NOT NULL,
  `place` varchar(32) NOT NULL,
  `place_order` int UNSIGNED NOT NULL DEFAULT '1',
  `code` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads_campaigns`
--
ALTER TABLE `ads_campaigns`
  ADD PRIMARY KEY (`campaign_id`),
  ADD KEY `campaign_user_id` (`campaign_user_id`);

--
-- Indexes for table `ads_system`
--
ALTER TABLE `ads_system`
  ADD PRIMARY KEY (`ads_id`);

--
-- Indexes for table `affiliates_payments`
--
ALTER TABLE `affiliates_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`);

--
-- Indexes for table `announcements_users`
--
ALTER TABLE `announcements_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `announcement_id_user_id` (`announcement_id`,`user_id`);

--
-- Indexes for table `auto_connect`
--
ALTER TABLE `auto_connect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `bank_transfers`
--
ALTER TABLE `bank_transfers`
  ADD PRIMARY KEY (`transfer_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`node_id`),
  ADD KEY `node_value` (`node_value`);

--
-- Indexes for table `blogs_categories`
--
ALTER TABLE `blogs_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_parent_id` (`category_parent_id`);

--
-- Indexes for table `coinpayments_transactions`
--
ALTER TABLE `coinpayments_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`conversation_id`),
  ADD KEY `last_message_id` (`last_message_id`);

--
-- Indexes for table `conversations_calls_audio`
--
ALTER TABLE `conversations_calls_audio`
  ADD PRIMARY KEY (`call_id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`);

--
-- Indexes for table `conversations_calls_video`
--
ALTER TABLE `conversations_calls_video`
  ADD PRIMARY KEY (`call_id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`);

--
-- Indexes for table `conversations_messages`
--
ALTER TABLE `conversations_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `conversations_users`
--
ALTER TABLE `conversations_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `conversation_id_user_id` (`conversation_id`,`user_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `custom_fields_values`
--
ALTER TABLE `custom_fields_values`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `field_id_node_id_node_type` (`field_id`,`node_id`,`node_type`),
  ADD KEY `value` (`value`(20));

--
-- Indexes for table `developers_apps`
--
ALTER TABLE `developers_apps`
  ADD PRIMARY KEY (`app_id`),
  ADD UNIQUE KEY `app_auth_id` (`app_auth_id`),
  ADD UNIQUE KEY `app_auth_secret` (`app_auth_secret`),
  ADD KEY `app_user_id` (`app_user_id`),
  ADD KEY `app_category_id` (`app_category_id`);

--
-- Indexes for table `developers_apps_categories`
--
ALTER TABLE `developers_apps_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_parent_id` (`category_parent_id`);

--
-- Indexes for table `developers_apps_users`
--
ALTER TABLE `developers_apps_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_id_user_id` (`app_id`,`user_id`);

--
-- Indexes for table `emojis`
--
ALTER TABLE `emojis`
  ADD PRIMARY KEY (`emoji_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event_admin` (`event_admin`),
  ADD KEY `event_category` (`event_category`),
  ADD KEY `event_cover_id` (`event_cover_id`),
  ADD KEY `event_album_covers` (`event_album_covers`),
  ADD KEY `event_album_timeline` (`event_album_timeline`);

--
-- Indexes for table `events_categories`
--
ALTER TABLE `events_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_parent_id` (`category_parent_id`);

--
-- Indexes for table `events_members`
--
ALTER TABLE `events_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id_user_id` (`event_id`,`user_id`);

--
-- Indexes for table `followings`
--
ALTER TABLE `followings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_following_id` (`user_id`,`following_id`);

--
-- Indexes for table `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`forum_id`),
  ADD KEY `forum_section` (`forum_section`);

--
-- Indexes for table `forums_replies`
--
ALTER TABLE `forums_replies`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `forums_threads`
--
ALTER TABLE `forums_threads`
  ADD PRIMARY KEY (`thread_id`),
  ADD KEY `forum_id` (`forum_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_one_id_user_two_id` (`user_one_id`,`user_two_id`);

--
-- Indexes for table `funding_payments`
--
ALTER TABLE `funding_payments`
  ADD PRIMARY KEY (`payment_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`game_id`);

--
-- Indexes for table `games_players`
--
ALTER TABLE `games_players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `game_id_user_id` (`game_id`,`user_id`);

--
-- Indexes for table `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`gift_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `username` (`group_name`),
  ADD KEY `group_admin` (`group_admin`),
  ADD KEY `group_category` (`group_category`),
  ADD KEY `group_picture_id` (`group_picture_id`),
  ADD KEY `group_cover_id` (`group_cover_id`),
  ADD KEY `group_album_pictures` (`group_album_pictures`),
  ADD KEY `group_album_covers` (`group_album_covers`),
  ADD KEY `group_album_timeline` (`group_album_timeline`);

--
-- Indexes for table `groups_admins`
--
ALTER TABLE `groups_admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `groups_categories`
--
ALTER TABLE `groups_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_parent_id` (`category_parent_id`);

--
-- Indexes for table `groups_members`
--
ALTER TABLE `groups_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `hashtags`
--
ALTER TABLE `hashtags`
  ADD PRIMARY KEY (`hashtag_id`),
  ADD KEY `hashtag` (`hashtag`);

--
-- Indexes for table `hashtags_posts`
--
ALTER TABLE `hashtags_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_id_hashtag_id` (`post_id`,`hashtag_id`);

--
-- Indexes for table `invitation_codes`
--
ALTER TABLE `invitation_codes`
  ADD PRIMARY KEY (`code_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `used_by` (`used_by`);

--
-- Indexes for table `jobs_categories`
--
ALTER TABLE `jobs_categories`
  ADD PRIMARY KEY (`category_id`) USING BTREE,
  ADD KEY `category_parent_id` (`category_parent_id`);

--
-- Indexes for table `market_categories`
--
ALTER TABLE `market_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_parent_id` (`category_parent_id`);

--
-- Indexes for table `monetization_payments`
--
ALTER TABLE `monetization_payments`
  ADD PRIMARY KEY (`payment_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `movies_genres`
--
ALTER TABLE `movies_genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `to_user_id` (`to_user_id`),
  ADD KEY `from_user_id` (`from_user_id`,`from_user_type`);

--
-- Indexes for table `offers_categories`
--
ALTER TABLE `offers_categories`
  ADD PRIMARY KEY (`category_id`) USING BTREE,
  ADD KEY `category_parent_id` (`category_parent_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `packages_payments`
--
ALTER TABLE `packages_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `username` (`page_name`),
  ADD KEY `page_admin` (`page_admin`),
  ADD KEY `page_category` (`page_category`),
  ADD KEY `page_cover_id` (`page_cover_id`),
  ADD KEY `page_picture_id` (`page_picture_id`),
  ADD KEY `page_country` (`page_country`),
  ADD KEY `page_album_pictures` (`page_album_pictures`),
  ADD KEY `page_album_covers` (`page_album_covers`),
  ADD KEY `page_album_timeline` (`page_album_timeline`);

--
-- Indexes for table `pages_admins`
--
ALTER TABLE `pages_admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_id_user_id` (`page_id`,`user_id`);

--
-- Indexes for table `pages_categories`
--
ALTER TABLE `pages_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_parent_id` (`category_parent_id`);

--
-- Indexes for table `pages_invites`
--
ALTER TABLE `pages_invites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_id_user_id_from_user_id` (`page_id`,`user_id`,`from_user_id`);

--
-- Indexes for table `pages_likes`
--
ALTER TABLE `pages_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_id_user_id` (`page_id`,`user_id`);

--
-- Indexes for table `points_payments`
--
ALTER TABLE `points_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `wall_id` (`wall_id`),
  ADD KEY `colored_pattern` (`colored_pattern`),
  ADD KEY `origin_id` (`origin_id`),
  ADD KEY `boosted_by` (`boosted_by`),
  ADD KEY `user_id` (`user_id`,`user_type`);

--
-- Indexes for table `posts_articles`
--
ALTER TABLE `posts_articles`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `posts_audios`
--
ALTER TABLE `posts_audios`
  ADD PRIMARY KEY (`audio_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts_colored_patterns`
--
ALTER TABLE `posts_colored_patterns`
  ADD PRIMARY KEY (`pattern_id`);

--
-- Indexes for table `posts_comments`
--
ALTER TABLE `posts_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `node_id` (`node_id`,`node_type`),
  ADD KEY `user_id` (`user_id`,`user_type`);

--
-- Indexes for table `posts_comments_reactions`
--
ALTER TABLE `posts_comments_reactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `comment_id_user_id` (`comment_id`,`user_id`);

--
-- Indexes for table `posts_files`
--
ALTER TABLE `posts_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts_funding`
--
ALTER TABLE `posts_funding`
  ADD PRIMARY KEY (`funding_id`) USING BTREE,
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts_funding_donors`
--
ALTER TABLE `posts_funding_donors`
  ADD PRIMARY KEY (`donation_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts_hidden`
--
ALTER TABLE `posts_hidden`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_id_user_id` (`post_id`,`user_id`);

--
-- Indexes for table `posts_jobs`
--
ALTER TABLE `posts_jobs`
  ADD PRIMARY KEY (`job_id`) USING BTREE,
  ADD KEY `post_id` (`post_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `posts_jobs_applications`
--
ALTER TABLE `posts_jobs_applications`
  ADD PRIMARY KEY (`application_id`) USING BTREE,
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts_links`
--
ALTER TABLE `posts_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts_live`
--
ALTER TABLE `posts_live`
  ADD PRIMARY KEY (`live_id`) USING BTREE,
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts_live_users`
--
ALTER TABLE `posts_live_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `user_id_post_id` (`user_id`,`post_id`);

--
-- Indexes for table `posts_media`
--
ALTER TABLE `posts_media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts_offers`
--
ALTER TABLE `posts_offers`
  ADD PRIMARY KEY (`offer_id`) USING BTREE,
  ADD KEY `post_id` (`post_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `posts_photos`
--
ALTER TABLE `posts_photos`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `album_id` (`album_id`);

--
-- Indexes for table `posts_photos_albums`
--
ALTER TABLE `posts_photos_albums`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `user_id` (`user_id`,`user_type`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `posts_photos_reactions`
--
ALTER TABLE `posts_photos_reactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_photo_id` (`user_id`,`photo_id`);

--
-- Indexes for table `posts_polls`
--
ALTER TABLE `posts_polls`
  ADD PRIMARY KEY (`poll_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `posts_polls_options`
--
ALTER TABLE `posts_polls_options`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `poll_id` (`poll_id`);

--
-- Indexes for table `posts_polls_options_users`
--
ALTER TABLE `posts_polls_options_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_poll_id` (`user_id`,`poll_id`);

--
-- Indexes for table `posts_products`
--
ALTER TABLE `posts_products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `posts_reactions`
--
ALTER TABLE `posts_reactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_id_user_id` (`post_id`,`user_id`);

--
-- Indexes for table `posts_saved`
--
ALTER TABLE `posts_saved`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_id_user_id` (`post_id`,`user_id`);

--
-- Indexes for table `posts_videos`
--
ALTER TABLE `posts_videos`
  ADD PRIMARY KEY (`video_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `node_id` (`node_id`);

--
-- Indexes for table `reports_categories`
--
ALTER TABLE `reports_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_parent_id` (`category_parent_id`);

--
-- Indexes for table `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `page_url` (`page_url`);

--
-- Indexes for table `stickers`
--
ALTER TABLE `stickers`
  ADD PRIMARY KEY (`sticker_id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`story_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `stories_media`
--
ALTER TABLE `stories_media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `story_id` (`story_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_following_id` (`user_id`,`node_id`);

--
-- Indexes for table `system_countries`
--
ALTER TABLE `system_countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `system_currencies`
--
ALTER TABLE `system_currencies`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `system_genders`
--
ALTER TABLE `system_genders`
  ADD PRIMARY KEY (`gender_id`) USING BTREE,
  ADD UNIQUE KEY `name` (`gender_name`) USING BTREE;

--
-- Indexes for table `system_languages`
--
ALTER TABLE `system_languages`
  ADD PRIMARY KEY (`language_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `system_options`
--
ALTER TABLE `system_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `system_reactions`
--
ALTER TABLE `system_reactions`
  ADD PRIMARY KEY (`reaction_id`);

--
-- Indexes for table `system_themes`
--
ALTER TABLE `system_themes`
  ADD PRIMARY KEY (`theme_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `facebook_id` (`facebook_id`),
  ADD UNIQUE KEY `twitter_id` (`twitter_id`),
  ADD UNIQUE KEY `linkedin_id` (`linkedin_id`),
  ADD UNIQUE KEY `vkontakte_id` (`vkontakte_id`),
  ADD UNIQUE KEY `instagram_id` (`instagram_id`),
  ADD UNIQUE KEY `user_phone` (`user_phone`),
  ADD UNIQUE KEY `google_id` (`google_id`),
  ADD KEY `user_picture_id` (`user_picture_id`),
  ADD KEY `user_gender` (`user_gender`),
  ADD KEY `user_cover_id` (`user_cover_id`),
  ADD KEY `user_country` (`user_country`),
  ADD KEY `user_album_pictures` (`user_album_pictures`),
  ADD KEY `user_album_covers` (`user_album_covers`),
  ADD KEY `user_album_timeline` (`user_album_timeline`);

--
-- Indexes for table `users_affiliates`
--
ALTER TABLE `users_affiliates`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `referrer_id_referee_id` (`referrer_id`,`referee_id`) USING BTREE;

--
-- Indexes for table `users_blocks`
--
ALTER TABLE `users_blocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_blocked_id` (`user_id`,`blocked_id`);

--
-- Indexes for table `users_gifts`
--
ALTER TABLE `users_gifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`),
  ADD KEY `gift_id` (`gift_id`);

--
-- Indexes for table `users_invitations`
--
ALTER TABLE `users_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_email_phone` (`user_id`,`email_phone`) USING BTREE;

--
-- Indexes for table `users_pokes`
--
ALTER TABLE `users_pokes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_poked_id` (`user_id`,`poked_id`) USING BTREE;

--
-- Indexes for table `users_searches`
--
ALTER TABLE `users_searches`
  ADD PRIMARY KEY (`log_id`),
  ADD UNIQUE KEY `node_id_node_type` (`node_id`,`node_type`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users_sessions`
--
ALTER TABLE `users_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `session_token` (`session_token`),
  ADD KEY `user_ip` (`user_ip`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `verification_requests`
--
ALTER TABLE `verification_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD UNIQUE KEY `node_id_node_type` (`node_id`,`node_type`);

--
-- Indexes for table `wallet_payments`
--
ALTER TABLE `wallet_payments`
  ADD PRIMARY KEY (`payment_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`widget_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads_campaigns`
--
ALTER TABLE `ads_campaigns`
  MODIFY `campaign_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ads_system`
--
ALTER TABLE `ads_system`
  MODIFY `ads_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliates_payments`
--
ALTER TABLE `affiliates_payments`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements_users`
--
ALTER TABLE `announcements_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auto_connect`
--
ALTER TABLE `auto_connect`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_transfers`
--
ALTER TABLE `bank_transfers`
  MODIFY `transfer_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `node_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs_categories`
--
ALTER TABLE `blogs_categories`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `coinpayments_transactions`
--
ALTER TABLE `coinpayments_transactions`
  MODIFY `transaction_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `conversation_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `conversations_calls_audio`
--
ALTER TABLE `conversations_calls_audio`
  MODIFY `call_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations_calls_video`
--
ALTER TABLE `conversations_calls_video`
  MODIFY `call_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations_messages`
--
ALTER TABLE `conversations_messages`
  MODIFY `message_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `conversations_users`
--
ALTER TABLE `conversations_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `field_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_values`
--
ALTER TABLE `custom_fields_values`
  MODIFY `value_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `developers_apps`
--
ALTER TABLE `developers_apps`
  MODIFY `app_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `developers_apps_categories`
--
ALTER TABLE `developers_apps_categories`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `developers_apps_users`
--
ALTER TABLE `developers_apps_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emojis`
--
ALTER TABLE `emojis`
  MODIFY `emoji_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1803;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events_categories`
--
ALTER TABLE `events_categories`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `events_members`
--
ALTER TABLE `events_members`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followings`
--
ALTER TABLE `followings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `forums`
--
ALTER TABLE `forums`
  MODIFY `forum_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forums_replies`
--
ALTER TABLE `forums_replies`
  MODIFY `reply_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forums_threads`
--
ALTER TABLE `forums_threads`
  MODIFY `thread_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `funding_payments`
--
ALTER TABLE `funding_payments`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `game_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `games_players`
--
ALTER TABLE `games_players`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `gift_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `groups_admins`
--
ALTER TABLE `groups_admins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `groups_categories`
--
ALTER TABLE `groups_categories`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `groups_members`
--
ALTER TABLE `groups_members`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `hashtags`
--
ALTER TABLE `hashtags`
  MODIFY `hashtag_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hashtags_posts`
--
ALTER TABLE `hashtags_posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invitation_codes`
--
ALTER TABLE `invitation_codes`
  MODIFY `code_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs_categories`
--
ALTER TABLE `jobs_categories`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `market_categories`
--
ALTER TABLE `market_categories`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `monetization_payments`
--
ALTER TABLE `monetization_payments`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies_genres`
--
ALTER TABLE `movies_genres`
  MODIFY `genre_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `offers_categories`
--
ALTER TABLE `offers_categories`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `package_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages_payments`
--
ALTER TABLE `packages_payments`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages_admins`
--
ALTER TABLE `pages_admins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pages_categories`
--
ALTER TABLE `pages_categories`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pages_invites`
--
ALTER TABLE `pages_invites`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pages_likes`
--
ALTER TABLE `pages_likes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `points_payments`
--
ALTER TABLE `points_payments`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `posts_articles`
--
ALTER TABLE `posts_articles`
  MODIFY `article_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts_audios`
--
ALTER TABLE `posts_audios`
  MODIFY `audio_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_colored_patterns`
--
ALTER TABLE `posts_colored_patterns`
  MODIFY `pattern_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts_comments`
--
ALTER TABLE `posts_comments`
  MODIFY `comment_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts_comments_reactions`
--
ALTER TABLE `posts_comments_reactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_files`
--
ALTER TABLE `posts_files`
  MODIFY `file_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_funding`
--
ALTER TABLE `posts_funding`
  MODIFY `funding_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_funding_donors`
--
ALTER TABLE `posts_funding_donors`
  MODIFY `donation_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_hidden`
--
ALTER TABLE `posts_hidden`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_jobs`
--
ALTER TABLE `posts_jobs`
  MODIFY `job_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_jobs_applications`
--
ALTER TABLE `posts_jobs_applications`
  MODIFY `application_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_links`
--
ALTER TABLE `posts_links`
  MODIFY `link_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts_live`
--
ALTER TABLE `posts_live`
  MODIFY `live_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_live_users`
--
ALTER TABLE `posts_live_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_media`
--
ALTER TABLE `posts_media`
  MODIFY `media_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts_offers`
--
ALTER TABLE `posts_offers`
  MODIFY `offer_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_photos`
--
ALTER TABLE `posts_photos`
  MODIFY `photo_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts_photos_albums`
--
ALTER TABLE `posts_photos_albums`
  MODIFY `album_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts_photos_reactions`
--
ALTER TABLE `posts_photos_reactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_polls`
--
ALTER TABLE `posts_polls`
  MODIFY `poll_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts_polls_options`
--
ALTER TABLE `posts_polls_options`
  MODIFY `option_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts_polls_options_users`
--
ALTER TABLE `posts_polls_options_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts_products`
--
ALTER TABLE `posts_products`
  MODIFY `product_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts_reactions`
--
ALTER TABLE `posts_reactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts_saved`
--
ALTER TABLE `posts_saved`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts_videos`
--
ALTER TABLE `posts_videos`
  MODIFY `video_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reports_categories`
--
ALTER TABLE `reports_categories`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `page_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stickers`
--
ALTER TABLE `stickers`
  MODIFY `sticker_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `story_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stories_media`
--
ALTER TABLE `stories_media`
  MODIFY `media_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `system_countries`
--
ALTER TABLE `system_countries`
  MODIFY `country_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `system_currencies`
--
ALTER TABLE `system_currencies`
  MODIFY `currency_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `system_genders`
--
ALTER TABLE `system_genders`
  MODIFY `gender_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_languages`
--
ALTER TABLE `system_languages`
  MODIFY `language_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `system_options`
--
ALTER TABLE `system_options`
  MODIFY `option_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3216;

--
-- AUTO_INCREMENT for table `system_reactions`
--
ALTER TABLE `system_reactions`
  MODIFY `reaction_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_themes`
--
ALTER TABLE `system_themes`
  MODIFY `theme_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `users_affiliates`
--
ALTER TABLE `users_affiliates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_blocks`
--
ALTER TABLE `users_blocks`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_gifts`
--
ALTER TABLE `users_gifts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_invitations`
--
ALTER TABLE `users_invitations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_pokes`
--
ALTER TABLE `users_pokes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_searches`
--
ALTER TABLE `users_searches`
  MODIFY `log_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_sessions`
--
ALTER TABLE `users_sessions`
  MODIFY `session_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `verification_requests`
--
ALTER TABLE `verification_requests`
  MODIFY `request_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_payments`
--
ALTER TABLE `wallet_payments`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `transaction_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `widget_id` int UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
