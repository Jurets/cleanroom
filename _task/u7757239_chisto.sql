-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost:3306
-- Время создания: Окт 31 2013 г., 11:48
-- Версия сервера: 5.1.66-rel14.1-log
-- Версия PHP: 5.4.16

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `u7757239_chisto`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accounting1c`
--

CREATE TABLE IF NOT EXISTS `accounting1c` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `object_type` int(11) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_type` (`object_type`),
  KEY `external_id` (`external_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ActionLog`
--

CREATE TABLE IF NOT EXISTS `ActionLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `event` tinyint(255) NOT NULL,
  `model_name` varchar(50) NOT NULL,
  `model_title` text NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `event` (`event`),
  KEY `datetime` (`datetime`),
  KEY `model_name` (`model_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `ActionLog`
--

INSERT INTO `ActionLog` (`id`, `username`, `event`, `model_name`, `model_title`, `datetime`) VALUES
(1, 'admins', 3, 'StoreProduct', 'Samsung Galaxy Tab 7.0 Plus P6200 16GB', '2013-10-29 13:04:37'),
(2, 'admins', 3, 'StoreProduct', 'Samsung Galaxy Tab 10.1 P7500 16Gb', '2013-10-29 13:04:45'),
(3, 'admins', 3, 'StoreProduct', 'LG Flatron M2250D', '2013-10-29 13:07:26'),
(4, 'admins', 3, 'StoreProduct', 'LG Flatron IPS226V', '2013-10-29 13:07:26'),
(5, 'admins', 3, 'StoreProduct', 'Samsung SyncMaster S22A350N', '2013-10-29 13:07:26'),
(6, 'admins', 3, 'StoreProduct', 'Philips 237E3QPHSU', '2013-10-29 13:07:26'),
(7, 'admins', 3, 'StoreProduct', 'Philips 227E3LSU', '2013-10-29 13:07:26'),
(8, 'admins', 2, 'StoreManufacturer', 'Comet', '2013-10-29 13:07:40'),
(9, 'admins', 2, 'StoreManufacturer', 'Menikini', '2013-10-29 13:07:55');

-- --------------------------------------------------------

--
-- Структура таблицы `AuthAssignment`
--

CREATE TABLE IF NOT EXISTS `AuthAssignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `AuthAssignment`
--

INSERT INTO `AuthAssignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('Admin', '1', NULL, NULL),
('Authenticated', '57', NULL, 'N;'),
('Authenticated', '58', NULL, 'N;'),
('Orders.Orders.*', '56', NULL, 'N;'),
('Orders.Statuses.*', '56', NULL, 'N;'),
('Authenticated', '56', NULL, 'N;');

-- --------------------------------------------------------

--
-- Структура таблицы `AuthItem`
--

CREATE TABLE IF NOT EXISTS `AuthItem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `AuthItem`
--

INSERT INTO `AuthItem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('Admin', 2, NULL, NULL, 'N;'),
('Authenticated', 2, NULL, NULL, 'N;'),
('Guest', 2, NULL, NULL, 'N;'),
('Orders.Orders.*', 1, NULL, NULL, 'N;'),
('Orders.Statuses.*', 1, NULL, NULL, 'N;'),
('Orders.Orders.Index', 0, NULL, NULL, 'N;'),
('Orders.Orders.Create', 0, NULL, NULL, 'N;'),
('Orders.Orders.Update', 0, NULL, NULL, 'N;'),
('Orders.Orders.AddProductList', 0, NULL, NULL, 'N;'),
('Orders.Orders.AddProduct', 0, NULL, NULL, 'N;'),
('Orders.Orders.RenderOrderedProducts', 0, NULL, NULL, 'N;'),
('Orders.Orders.JsonOrderedProducts', 0, NULL, NULL, 'N;'),
('Orders.Orders.Delete', 0, NULL, NULL, 'N;'),
('Orders.Orders.DeleteProduct', 0, NULL, NULL, 'N;'),
('Orders.Statuses.Index', 0, NULL, NULL, 'N;'),
('Orders.Statuses.Create', 0, NULL, NULL, 'N;'),
('Orders.Statuses.Update', 0, NULL, NULL, 'N;'),
('Orders.Statuses.Delete', 0, NULL, NULL, 'N;');

-- --------------------------------------------------------

--
-- Структура таблицы `AuthItemChild`
--

CREATE TABLE IF NOT EXISTS `AuthItemChild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Comments`
--

CREATE TABLE IF NOT EXISTS `Comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `class_name` varchar(100) NOT NULL,
  `object_pk` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `text` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `class_name_index` (`class_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Discount`
--

CREATE TABLE IF NOT EXISTS `Discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `sum` varchar(10) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `roles` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `active` (`active`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `Discount`
--

INSERT INTO `Discount` (`id`, `name`, `active`, `sum`, `start_date`, `end_date`, `roles`) VALUES
(1, 'Скидка на всю технику Apple', 1, '5%', '2013-10-28 23:29:13', '2014-01-01 12:00:00', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `DiscountCategory`
--

CREATE TABLE IF NOT EXISTS `DiscountCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_id` (`discount_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=240 ;

--
-- Дамп данных таблицы `DiscountCategory`
--

INSERT INTO `DiscountCategory` (`id`, `discount_id`, `category_id`) VALUES
(231, 1, 1),
(232, 1, 223),
(233, 1, 224),
(234, 1, 225),
(235, 1, 226),
(236, 1, 227),
(237, 1, 228),
(238, 1, 229),
(239, 1, 230);

-- --------------------------------------------------------

--
-- Структура таблицы `DiscountManufacturer`
--

CREATE TABLE IF NOT EXISTS `DiscountManufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_id` (`discount_id`),
  KEY `manufacturer_id` (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Дамп данных таблицы `DiscountManufacturer`
--

INSERT INTO `DiscountManufacturer` (`id`, `discount_id`, `manufacturer_id`) VALUES
(22, 1, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `grid_view_filter`
--

CREATE TABLE IF NOT EXISTS `grid_view_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `grid_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Order`
--

CREATE TABLE IF NOT EXISTS `Order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `secret_key` varchar(10) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `delivery_price` float(10,2) NOT NULL,
  `total_price` float(10,2) NOT NULL,
  `status_id` int(11) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_address` varchar(255) NOT NULL COMMENT 'delivery address',
  `user_phone` varchar(30) NOT NULL,
  `user_comment` varchar(500) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `admin_comment` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `secret_key` (`secret_key`),
  KEY `delivery_id` (`delivery_id`),
  KEY `status_id` (`status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `OrderHistory`
--

CREATE TABLE IF NOT EXISTS `OrderHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `handler` varchar(255) DEFAULT NULL,
  `data_before` text,
  `data_after` text,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_index` (`order_id`),
  KEY `created_index` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `OrderProduct`
--

CREATE TABLE IF NOT EXISTS `OrderProduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `configurable_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `configurable_name` text NOT NULL COMMENT 'Store name of configurable product',
  `configurable_data` text NOT NULL,
  `variants` text NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `configurable_id` (`configurable_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=84 ;

-- --------------------------------------------------------

--
-- Структура таблицы `OrderStatus`
--

CREATE TABLE IF NOT EXISTS `OrderStatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `position` (`position`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `OrderStatus`
--

INSERT INTO `OrderStatus` (`id`, `name`, `position`) VALUES
(1, 'Новый', 0),
(5, 'Доставлен', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Page`
--

CREATE TABLE IF NOT EXISTS `Page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `publish_date` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `layout` varchar(2555) NOT NULL,
  `view` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  KEY `url` (`url`),
  KEY `created` (`created`),
  KEY `updated` (`updated`),
  KEY `publish_date` (`publish_date`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `Page`
--

INSERT INTO `Page` (`id`, `user_id`, `category_id`, `url`, `created`, `updated`, `publish_date`, `status`, `layout`, `view`) VALUES
(8, 1, NULL, 'help', '2012-06-10 22:35:51', '2012-07-07 11:47:09', '2012-06-10 22:35:29', 'published', '', ''),
(9, 1, NULL, 'how-to-create-order', '2012-06-10 22:36:50', '2012-07-07 11:45:53', '2012-06-10 22:36:27', 'published', '', ''),
(10, 1, NULL, 'garantiya', '2012-06-10 22:37:06', '2012-07-07 11:45:38', '2012-06-10 22:36:50', 'published', '', ''),
(11, 1, NULL, 'dostavka-i-oplata', '2012-06-10 22:37:18', '2012-07-07 11:41:49', '2012-06-10 22:37:07', 'published', '', ''),
(12, 1, 7, 'samsung-pitaetsya-izbezhat-zapreta-na-galaxy-nexus-v-shtatah-pri-pomoshi-patcha', '2012-07-07 12:08:50', '2012-07-07 12:09:33', '2012-07-07 12:06:19', 'published', '', ''),
(13, 1, 7, 'za-85-mesyacev-android-40-popal-na-11-ustroistv', '2012-07-07 12:19:44', '2013-06-04 23:20:21', '2012-07-07 12:14:48', 'published', '', ''),
(14, 1, 7, 'google-prezentoval-svoi-ochki-dopolnennoi-realnosti', '2012-07-07 12:26:11', '2012-07-07 12:26:11', '2012-07-07 12:25:48', 'published', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `PageCategory`
--

CREATE TABLE IF NOT EXISTS `PageCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `full_url` text NOT NULL,
  `layout` varchar(255) NOT NULL,
  `view` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `page_size` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `url` (`url`),
  KEY `created` (`created`),
  KEY `updated` (`updated`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `PageCategory`
--

INSERT INTO `PageCategory` (`id`, `parent_id`, `url`, `full_url`, `layout`, `view`, `created`, `updated`, `page_size`) VALUES
(7, NULL, 'news', 'news', '', '', '2012-07-07 12:06:03', '2013-04-29 23:24:05', NULL),
(10, NULL, 'tesstovya2', 'tesstovya2', '', '', '2013-05-21 23:59:34', '2013-05-21 23:59:34', NULL),
(12, 7, 'tesstovya2', 'news/tesstovya2', '', '', '2013-05-22 00:07:01', '2013-05-22 00:07:01', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `PageCategoryTranslate`
--

CREATE TABLE IF NOT EXISTS `PageCategoryTranslate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `language_id` (`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `PageCategoryTranslate`
--

INSERT INTO `PageCategoryTranslate` (`id`, `object_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keywords`) VALUES
(13, 7, 1, 'Новости', '', '', '', ''),
(14, 7, 9, 'Новости', '', '', '', ''),
(15, 11, 1, 'sdfsdf', '', '', '', ''),
(16, 11, 9, 'sdfsdf', '', '', '', ''),
(17, 12, 1, 'Тесстовя2', '', '', '', ''),
(18, 12, 9, 'Тесстовя2', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `PageTranslate`
--

CREATE TABLE IF NOT EXISTS `PageTranslate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` text,
  `full_description` text,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `language_id` (`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Дамп данных таблицы `PageTranslate`
--

INSERT INTO `PageTranslate` (`id`, `object_id`, `language_id`, `title`, `short_description`, `full_description`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(22, 11, 9, 'Доставка и оплата', '', '', '', '', ''),
(15, 8, 1, 'Помощь', 'Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).', '', '', '', ''),
(16, 8, 9, 'Помощь', '', '', '', '', ''),
(17, 9, 1, 'Как сделать заказ', '<p>Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генератором. Он использует словарь из более чем 200 латинских слов, а также набор моделей предложений. В результате сгенерированный Lorem Ipsum выглядит правдоподобно, не имеет повторяющихся абзацей или "невозможных" слов.</p>', '', '', '', ''),
(18, 9, 9, 'Как сделать заказ', '', '', '', '', ''),
(19, 10, 1, 'Гарантия', '<p>Многие думают, что Lorem Ipsum - взятый с потолка псевдо-латинский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из колледжа Hampden-Sydney, штат Вирджиния, взял одно из самых странных слов в Lorem Ipsum, "consectetur", и занялся его поисками в классической латинской литературе.</p>\r\n<p>В результате он нашёл неоспоримый первоисточник Lorem Ipsum в разделах 1.10.32 и 1.10.33 книги "de Finibus Bonorum et Malorum" ("О пределах добра и зла"), написанной Цицероном в 45 году н.э. Этот трактат по теории этики был очень популярен в эпоху Возрождения. Первая строка Lorem Ipsum, "Lorem ipsum dolor sit amet..", происходит от одной из строк в разделе 1.10.32 Классический текст Lorem Ipsum, используемый с XVI века, приведён ниже. Также даны разделы 1.10.32 и 1.10.33 "de Finibus Bonorum et Malorum" Цицерона и их английский перевод, сделанный H. Rackham, 1914 год.</p>', '', '', '', ''),
(20, 10, 9, 'Гарантия', '', '', '', '', ''),
(21, 11, 1, 'Доставка и оплата', '<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>', '', '', '', ''),
(23, 12, 1, 'Samsung пытается избежать запрета на Galaxy Nexus', 'Текущую ситуацию с судебным противостоянием Apple и Samsung в Штатах (ссылка по теме) можно описать строчкой их двух слов: всё плохо. ', 'В смысле всё плохо для Samsung — южнокорейская корпорация так и не сумела отбиться от назначенного судом предварительного запрета на американские продажи планшетников Galaxy Tab 10.1 и, главное, новейших смартфонов Galaxy Nexus. Расклад намечается хуже некуда: по некоторым выкладкам, потенциальный ущерб от подобного запрета может достигнуть 180 млн. долларов, две трети из которых придутся на непроданные Galaxy Nexus.', '', '', ''),
(25, 13, 1, 'За 8,5 месяцев Android 4.0 попал на 11% устройств', 'В свое время платформа Android 2.x распространялась активнее, чем Android 4.0 Ice Cream Sandwich, а ведь уже появилась новая мобильная ОС от Google — Android 4.1 Jelly Bean. За 8,5 месяцев своего существования Android ICS попал на 10,9% устройств, а лидировать на рынке продолжает Android 2,3 Gingerbread.', '', '', '', ''),
(24, 12, 9, 'Samsung пытается избежать запрета на Galaxy Nexus в Штатах при помощи патча', 'Текущую ситуацию с судебным противостоянием Apple и Samsung в Штатах (ссылка по теме) можно описать строчкой их двух слов: всё плохо. В смысле всё плохо для Samsung — южнокорейская корпорация так и не сумела отбиться от назначенного судом предварительного запрета на американские продажи планшетников Galaxy Tab 10.1 и, главное, новейших смартфонов Galaxy Nexus. Расклад намечается хуже некуда: по некоторым выкладкам, потенциальный ущерб от подобного запрета может достигнуть 180 млн. долларов, две трети из которых придутся на непроданные Galaxy Nexus.', '', '', '', ''),
(26, 13, 9, 'За 8,5 месяцев Android 4.0 попал на 11% устройств', 'В свое время платформа Android 2.x распространялась активнее, чем Android 4.0 Ice Cream Sandwich, а ведь уже появилась новая мобильная ОС от Google — Android 4.1 Jelly Bean. За 8,5 месяцев своего существования Android ICS попал на 10,9% устройств, а лидировать на рынке продолжает Android 2,3 Gingerbread.', '', '', '', ''),
(27, 14, 1, 'Google презентовал свои очки дополненной реальности‎', 'Компания Google приступит к продаже очков дополненной реальности, который разрабатываются в рамках проекта Google Project Glass, пишет блог All Things Digital. ', 'Очки будут стоить 1,5 тысячи долларов, и поставки стартуют в начале 2013 года. Устройство, однако, будет предназначено только для разработчиков. Оформить предварительный заказ на него смогут исключительно посетители конференции I/O, открывшейся 27 июня в Сан-Франциско. ', '', '', ''),
(28, 14, 9, 'Google презентовал свои очки дополненной реальности‎', 'Компания Google приступит к продаже очков дополненной реальности, который разрабатываются в рамках проекта Google Project Glass, пишет блог All Things Digital. ', 'Очки будут стоить 1,5 тысячи долларов, и поставки стартуют в начале 2013 года. Устройство, однако, будет предназначено только для разработчиков. Оформить предварительный заказ на него смогут исключительно посетители конференции I/O, открывшейся 27 июня в Сан-Франциско. ', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `Rights`
--

CREATE TABLE IF NOT EXISTS `Rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`itemname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `StoreAttribute`
--

CREATE TABLE IF NOT EXISTS `StoreAttribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `display_on_front` tinyint(1) NOT NULL DEFAULT '1',
  `use_in_filter` tinyint(1) NOT NULL,
  `use_in_variants` tinyint(1) NOT NULL,
  `use_in_compare` tinyint(1) NOT NULL DEFAULT '0',
  `select_many` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT '0',
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `use_in_filter` (`use_in_filter`),
  KEY `display_on_front` (`display_on_front`),
  KEY `position` (`position`),
  KEY `use_in_variants` (`use_in_variants`),
  KEY `use_in_compare` (`use_in_compare`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `StoreAttribute`
--

INSERT INTO `StoreAttribute` (`id`, `name`, `type`, `display_on_front`, `use_in_filter`, `use_in_variants`, `use_in_compare`, `select_many`, `position`, `required`) VALUES
(1, 'processor_manufacturer', 3, 1, 1, 0, 1, 0, 0, 0),
(2, 'freq', 3, 1, 0, 0, 1, 0, 0, 0),
(3, 'memmory', 3, 1, 0, 0, 1, 0, 0, 0),
(4, 'memmory_type', 3, 1, 0, 0, 1, 0, 0, 0),
(5, 'screen', 3, 1, 1, 0, 1, 0, 0, 0),
(6, 'screen_dimension', 3, 1, 0, 0, 1, 0, 0, 0),
(7, 'rms_power', 3, 1, 0, 0, 1, 0, 0, 0),
(8, 'corpus_material', 3, 1, 1, 0, 1, 0, 0, 0),
(9, 'sound_type', 3, 1, 1, 0, 1, 0, 0, 0),
(10, 'monitor_diagonal', 3, 1, 1, 0, 1, 0, 0, 0),
(11, 'monitor_dimension', 3, 1, 0, 0, 1, 0, 0, 0),
(12, 'view_angle', 3, 1, 0, 0, 1, 0, 0, 0),
(13, 'phone_platform', 3, 1, 1, 0, 1, 0, 0, 0),
(14, 'phone_weight', 3, 1, 0, 0, 1, 0, 0, 0),
(15, 'phone_display', 3, 1, 0, 0, 1, 0, 0, 0),
(16, 'phone_camera', 3, 1, 0, 0, 1, 0, 0, 0),
(17, 'tablet_screen_size', 3, 1, 0, 0, 1, 0, 0, 0),
(18, 'memmory_size', 3, 1, 0, 0, 1, 0, 0, 0),
(19, 'weight', 3, 1, 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `StoreAttributeOption`
--

CREATE TABLE IF NOT EXISTS `StoreAttributeOption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `position` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_id` (`attribute_id`),
  KEY `position` (`position`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=134 ;

--
-- Дамп данных таблицы `StoreAttributeOption`
--

INSERT INTO `StoreAttributeOption` (`id`, `attribute_id`, `position`) VALUES
(59, 1, 0),
(60, 2, 0),
(61, 3, 0),
(62, 4, 0),
(63, 5, 0),
(64, 6, 0),
(65, 1, 0),
(66, 2, 0),
(67, 2, 0),
(68, 2, 0),
(69, 1, 0),
(70, 2, 0),
(71, 3, 0),
(72, 6, 0),
(73, 2, 0),
(74, 6, 0),
(75, 3, 0),
(76, 5, 0),
(77, 1, 0),
(78, 2, 0),
(79, 5, 0),
(80, 2, 0),
(81, 7, 0),
(82, 8, 0),
(83, 9, 0),
(84, 7, 0),
(85, 7, 0),
(86, 8, 0),
(87, 7, 0),
(88, 9, 0),
(89, 7, 0),
(90, 7, 0),
(91, 10, 0),
(92, 11, 0),
(93, 12, 0),
(94, 10, 0),
(95, 10, 0),
(96, 12, 0),
(97, 10, 0),
(98, 11, 0),
(99, 13, 0),
(100, 14, 0),
(101, 15, 0),
(102, 16, 0),
(103, 14, 0),
(104, 15, 0),
(105, 16, 0),
(106, 14, 0),
(107, 13, 0),
(108, 14, 0),
(109, 15, 0),
(110, 14, 0),
(111, 16, 0),
(112, 14, 0),
(113, 13, 0),
(114, 15, 0),
(115, 13, 0),
(116, 14, 0),
(117, 15, 0),
(118, 14, 0),
(119, 15, 0),
(120, 17, 0),
(121, 6, 0),
(122, 18, 0),
(123, 19, 0),
(124, 18, 0),
(125, 17, 0),
(126, 6, 0),
(127, 19, 0),
(128, 18, 0),
(129, 19, 0),
(130, 17, 0),
(131, 6, 0),
(132, 19, 0),
(133, 19, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `StoreAttributeOptionTranslate`
--

CREATE TABLE IF NOT EXISTS `StoreAttributeOptionTranslate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id` (`language_id`),
  KEY `object_id` (`object_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=267 ;

--
-- Дамп данных таблицы `StoreAttributeOptionTranslate`
--

INSERT INTO `StoreAttributeOptionTranslate` (`id`, `language_id`, `object_id`, `value`) VALUES
(117, 1, 59, 'Celeron'),
(118, 9, 59, 'Celeron'),
(119, 1, 60, '2200 МГц'),
(120, 9, 60, '2200 МГц'),
(121, 1, 61, '2048 Мб'),
(122, 9, 61, '2048 Мб'),
(123, 1, 62, 'DDR3'),
(124, 9, 62, 'DDR3'),
(125, 1, 63, '15.6 дюйм'),
(126, 9, 63, '15.6 дюйм'),
(127, 1, 64, '1366x768'),
(128, 9, 64, '1366x768'),
(129, 1, 65, 'E-240'),
(130, 9, 65, 'E-240'),
(131, 1, 66, '1650 МГц'),
(132, 9, 66, '1650 МГц'),
(133, 1, 67, '1500 МГц'),
(134, 9, 67, '1500 МГц'),
(135, 1, 68, '1700 МГц'),
(136, 9, 68, '1700 МГц'),
(137, 1, 69, 'Core i7'),
(138, 9, 69, 'Core i7'),
(139, 1, 70, '2500 МГц'),
(140, 9, 70, '2500 МГц'),
(141, 1, 71, '8192 Мб'),
(142, 9, 71, '8192 Мб'),
(143, 1, 72, '1920x1080'),
(144, 9, 72, '1920x1080'),
(145, 1, 73, '2700 МГц'),
(146, 9, 73, '2700 МГц'),
(147, 1, 74, '1920x1200'),
(148, 9, 74, '1920x1200'),
(149, 1, 75, '4096 Мб'),
(150, 9, 75, '4096 Мб'),
(151, 1, 76, '15.4 дюйм'),
(152, 9, 76, '15.4 дюйм'),
(153, 1, 77, 'Core i5'),
(154, 9, 77, 'Core i5'),
(155, 1, 78, '2660 МГц'),
(156, 9, 78, '2660 МГц'),
(157, 1, 79, '16.4 дюйм'),
(158, 9, 79, '16.4 дюйм'),
(159, 1, 80, '1730 МГц'),
(160, 9, 80, '1730 МГц'),
(161, 1, 81, '71 Вт'),
(162, 9, 81, '71 Вт'),
(163, 1, 82, 'пластик'),
(164, 9, 82, 'пластик'),
(165, 1, 83, '5.1'),
(166, 9, 83, '5.1'),
(167, 1, 84, '62 Вт'),
(168, 9, 84, '62 Вт'),
(169, 1, 85, '80 Вт'),
(170, 9, 85, '80 Вт'),
(171, 1, 86, 'MDF'),
(172, 9, 86, 'MDF'),
(173, 1, 87, '25 Вт'),
(174, 9, 87, '25 Вт'),
(175, 1, 88, '2.1'),
(176, 9, 88, '2.1'),
(177, 1, 89, '30 Вт'),
(178, 9, 89, '30 Вт'),
(179, 1, 90, '28 Вт'),
(180, 9, 90, '28 Вт'),
(181, 1, 91, '24"'),
(182, 9, 91, '24"'),
(183, 1, 92, '1920x1200'),
(184, 9, 92, '1920x1200'),
(185, 1, 93, '178°/178°'),
(186, 9, 93, '178°/178°'),
(187, 1, 94, '23"'),
(188, 9, 94, '23"'),
(189, 1, 95, '21.5"'),
(190, 9, 95, '21.5"'),
(191, 1, 96, '170°/160°'),
(192, 9, 96, '170°/160°'),
(193, 1, 97, '27"'),
(194, 9, 97, '27"'),
(195, 1, 98, '2560x1440'),
(196, 9, 98, '2560x1440'),
(197, 1, 99, 'Android'),
(198, 9, 99, 'Android'),
(199, 1, 100, '118 г'),
(200, 9, 100, '118 г'),
(201, 1, 101, '3.8"'),
(202, 9, 101, '3.8"'),
(203, 1, 102, '5 МП'),
(204, 9, 102, '5 МП'),
(205, 1, 103, '129 г'),
(206, 9, 103, '129 г'),
(207, 1, 104, '4.7"'),
(208, 9, 104, '4.7"'),
(209, 1, 105, '8 МП'),
(210, 9, 105, '8 МП'),
(211, 1, 106, '162 г'),
(212, 9, 106, '162 г'),
(213, 1, 107, 'iOS'),
(214, 9, 107, 'iOS'),
(215, 1, 108, '140 г'),
(216, 9, 108, '140 г'),
(217, 1, 109, '3.5"'),
(218, 9, 109, '3.5"'),
(219, 1, 110, '135 г'),
(220, 9, 110, '135 г'),
(221, 1, 111, '3 МП'),
(222, 9, 111, '3 МП'),
(223, 1, 112, '137 г'),
(224, 9, 112, '137 г'),
(225, 1, 113, 'MeeGo'),
(226, 9, 113, 'MeeGo'),
(227, 1, 114, '3.9"'),
(228, 9, 114, '3.9"'),
(229, 1, 115, 'BlackBerry OS'),
(230, 9, 115, 'BlackBerry OS'),
(231, 1, 116, '130 г'),
(232, 9, 116, '130 г'),
(233, 1, 117, '2.8"'),
(234, 9, 117, '2.8"'),
(235, 1, 118, '122 г'),
(236, 9, 118, '122 г'),
(237, 1, 119, '2.4"'),
(238, 9, 119, '2.4"'),
(239, 1, 120, '9.7"'),
(240, 9, 120, '9.7"'),
(241, 1, 121, '1024x768'),
(242, 9, 121, '1024x768'),
(243, 1, 122, '16 Гб'),
(244, 9, 122, '16 Гб'),
(245, 1, 123, '613 г'),
(246, 9, 123, '613 г'),
(247, 1, 124, '64 Гб'),
(248, 9, 124, '64 Гб'),
(249, 1, 125, '7"'),
(250, 9, 125, '7"'),
(251, 1, 126, '1024x600'),
(252, 9, 126, '1024x600'),
(253, 1, 127, '343 г'),
(254, 9, 127, '343 г'),
(255, 1, 128, '8 Гб'),
(256, 9, 128, '8 Гб'),
(257, 1, 129, '410 г'),
(258, 9, 129, '410 г'),
(259, 1, 130, '10.1"'),
(260, 9, 130, '10.1"'),
(261, 1, 131, '1280x800'),
(262, 9, 131, '1280x800'),
(263, 1, 132, '586 г'),
(264, 9, 132, '586 г'),
(265, 1, 133, '565 г'),
(266, 9, 133, '565 г');

-- --------------------------------------------------------

--
-- Структура таблицы `StoreAttributeTranslate`
--

CREATE TABLE IF NOT EXISTS `StoreAttributeTranslate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `language_id` (`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- Дамп данных таблицы `StoreAttributeTranslate`
--

INSERT INTO `StoreAttributeTranslate` (`id`, `object_id`, `language_id`, `title`) VALUES
(31, 1, 1, 'Тип процессора'),
(32, 1, 9, 'Тип процессора'),
(33, 2, 1, 'Частота процессора'),
(34, 2, 9, 'Частота процессора'),
(35, 3, 1, 'Объем памяти'),
(36, 3, 9, 'Объем памяти'),
(37, 4, 1, 'Тип памяти'),
(38, 4, 9, 'Тип памяти'),
(39, 5, 1, 'Диагональ'),
(40, 5, 9, 'Диагональ'),
(41, 6, 1, 'Разрешение'),
(42, 6, 9, 'Разрешение'),
(43, 7, 1, 'Суммарная мощность'),
(44, 7, 9, 'Суммарная мощность'),
(45, 8, 1, 'Материал'),
(46, 8, 9, 'Материал'),
(47, 9, 1, 'Тип'),
(48, 9, 9, 'Тип'),
(49, 10, 1, 'Диагональ'),
(50, 10, 9, 'Диагональ'),
(51, 11, 1, 'Разрешение'),
(52, 11, 9, 'Разрешение'),
(53, 12, 1, 'Угол обзора'),
(54, 12, 9, 'Угол обзора'),
(55, 13, 1, 'Платформа'),
(56, 13, 9, 'Платформа'),
(57, 14, 1, 'Вес'),
(58, 14, 9, 'Вес'),
(59, 15, 1, 'Диагональ'),
(60, 15, 9, 'Диагональ'),
(61, 16, 1, 'Камера'),
(62, 16, 9, 'Камера'),
(63, 17, 1, 'Диагональ'),
(64, 17, 9, 'Диагональ'),
(65, 18, 1, 'Объем памяти'),
(66, 18, 9, 'Объем памяти'),
(67, 19, 1, 'Вес'),
(68, 19, 9, 'Вес');

-- --------------------------------------------------------

--
-- Структура таблицы `StoreCategory`
--

CREATE TABLE IF NOT EXISTS `StoreCategory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lft` int(10) unsigned NOT NULL,
  `rgt` int(10) unsigned NOT NULL,
  `level` smallint(5) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `full_path` varchar(255) NOT NULL,
  `layout` varchar(255) NOT NULL,
  `view` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `lft` (`lft`),
  KEY `rgt` (`rgt`),
  KEY `level` (`level`),
  KEY `url` (`url`),
  KEY `full_path` (`full_path`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=244 ;

--
-- Дамп данных таблицы `StoreCategory`
--

INSERT INTO `StoreCategory` (`id`, `lft`, `rgt`, `level`, `url`, `full_path`, `layout`, `view`, `description`) VALUES
(1, 1, 52, 1, 'root', '', '', '', NULL),
(223, 10, 17, 2, 'moiki-visokogo-davleniya', 'moiki-visokogo-davleniya', '', '', 'Текстовое описание как и что'),
(224, 11, 12, 3, 'apparati-visokogo-davleniya-karcher', 'moiki-visokogo-davleniya/apparati-visokogo-davleniya-karcher', '', '', ''),
(225, 13, 14, 3, 'apparati-visokogo-davleniya-portotecnica', 'moiki-visokogo-davleniya/apparati-visokogo-davleniya-portotecnica', '', '', ''),
(226, 18, 25, 2, 'polomoechnie-mashini', 'polomoechnie-mashini', '', '', ''),
(227, 19, 20, 3, 'polomoechnie-mashini-fiorentini-20131025211409', 'polomoechnie-mashini/polomoechnie-mashini-fiorentini-20131025211409', '', '', ''),
(228, 26, 33, 2, 'podmetalnie-mashini', 'podmetalnie-mashini', '', '', ''),
(229, 36, 37, 2, 'uborochnie-telejki-i-inventar', 'uborochnie-telejki-i-inventar', '', '', ''),
(230, 21, 22, 3, 'polomoechnie-mashini-karcher-20131025211420', 'polomoechnie-mashini/polomoechnie-mashini-karcher-20131025211420', '', '', ''),
(231, 34, 35, 2, 'pilesosi', 'pilesosi', '', '', ''),
(232, 38, 39, 2, 'apparati-dlya-chistki-obuvi', 'apparati-dlya-chistki-obuvi', '', '', ''),
(233, 40, 41, 2, 'snegouborochnaya-tehnika', 'snegouborochnaya-tehnika', '', '', ''),
(234, 42, 43, 2, 'parogeneratori', 'parogeneratori', '', '', ''),
(235, 44, 45, 2, 'penogeneratori-i-kompressori', 'penogeneratori-i-kompressori', '', '', ''),
(236, 46, 47, 2, 'ximicheskie-i-moyushie-sredstva', 'ximicheskie-i-moyushie-sredstva', '', '', ''),
(237, 48, 49, 2, 'aksessuari-i-komplektuyushie', 'aksessuari-i-komplektuyushie', '', '', ''),
(238, 50, 51, 2, 'prochaya-tehnika', 'prochaya-tehnika', '', '', ''),
(239, 15, 16, 3, 'apparati-visokogo-davleniya-comet', 'apparati-visokogo-davleniya-comet', '', '', ''),
(240, 27, 28, 3, 'podmetalnie-mashini-fiorentini', 'podmetalnie-mashini/podmetalnie-mashini-fiorentini', '', '', ''),
(241, 29, 30, 3, 'podmetalnie-mashini-karcher', 'podmetalnie-mashini/podmetalnie-mashini-karcher', '', '', ''),
(242, 23, 24, 3, 'polomoechnie-mashini--ipc-ganzow', 'polomoechnie-mashini--ipc-ganzow', '', '', ''),
(243, 31, 32, 3, 'podmetalnie-mashini----ipc-ganzow', 'podmetalnie-mashini----ipc-ganzow', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `StoreCategoryOld`
--

CREATE TABLE IF NOT EXISTS `StoreCategoryOld` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lft` int(10) unsigned NOT NULL,
  `rgt` int(10) unsigned NOT NULL,
  `level` smallint(5) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `full_path` varchar(255) NOT NULL,
  `layout` varchar(255) NOT NULL,
  `view` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `lft` (`lft`),
  KEY `rgt` (`rgt`),
  KEY `level` (`level`),
  KEY `url` (`url`),
  KEY `full_path` (`full_path`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=231 ;

--
-- Дамп данных таблицы `StoreCategoryOld`
--

INSERT INTO `StoreCategoryOld` (`id`, `lft`, `rgt`, `level`, `url`, `full_path`, `layout`, `view`, `description`) VALUES
(1, 1, 26, 1, 'root', '', '', '', NULL),
(223, 10, 15, 2, 'noutbuki', 'noutbuki', '', '', NULL),
(224, 11, 12, 3, 'byudzhetnii', 'noutbuki/byudzhetnii', '', '', NULL),
(225, 13, 14, 3, 'igrovoi', 'noutbuki/igrovoi', '', '', NULL),
(226, 16, 21, 2, 'kompyuteri', 'kompyuteri', '', '', NULL),
(227, 17, 18, 3, 'kompyuternaya-akustika', 'kompyuteri/kompyuternaya-akustika', '', '', NULL),
(228, 22, 23, 2, 'monitori', 'monitori', '', '', NULL),
(229, 24, 25, 2, 'telefoni', 'telefoni', '', '', NULL),
(230, 19, 20, 3, 'plansheti', 'kompyuteri/plansheti', '', '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `StoreCategoryTranslate`
--

CREATE TABLE IF NOT EXISTS `StoreCategoryTranslate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `language_id` (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Дамп данных таблицы `StoreCategoryTranslate`
--

INSERT INTO `StoreCategoryTranslate` (`id`, `object_id`, `language_id`, `name`, `meta_title`, `meta_keywords`, `meta_description`, `description`) VALUES
(1, 1, 1, 'root', '', '', '', NULL),
(28, 1, 9, 'root', '', '', '', NULL),
(31, 223, 1, 'Мойки высокого давления', '', '', '', 'Текстовое описание как и что'),
(32, 223, 9, 'Ноутбуки', '', '', '', NULL),
(33, 224, 1, 'Аппараты высокого давления Karcher', '', '', '', ''),
(34, 224, 9, 'Бюджетный', '', '', '', NULL),
(35, 225, 1, 'Аппараты высокого давления Portotecnica', '', '', '', ''),
(36, 225, 9, 'Игровой', '', '', '', NULL),
(37, 226, 1, 'Поломоечные машины', '', '', '', ''),
(38, 226, 9, 'Компьютеры', '', '', '', NULL),
(39, 227, 1, 'Поломоечные машины Fiorentini', '', '', '', ''),
(40, 227, 9, 'Компьютерная акустика', '', '', '', NULL),
(41, 228, 1, 'Подметальные машины', '', '', '', ''),
(42, 228, 9, 'Мониторы', '', '', '', NULL),
(43, 229, 1, 'Уборочные тележки и инвентарь', '', '', '', ''),
(44, 229, 9, 'Телефоны', '', '', '', NULL),
(45, 230, 1, 'Поломоечные машины Karcher', '', '', '', ''),
(46, 230, 9, 'Планшеты', '', '', '', NULL),
(47, 231, 1, 'Пылесосы', '', '', '', ''),
(48, 231, 9, 'Пылесосы', '', '', '', ''),
(49, 232, 1, 'Аппараты для чистки обуви', '', '', '', ''),
(50, 232, 9, 'Аппараты для чистки обуви', '', '', '', ''),
(51, 233, 1, 'Снегоуборочная техника', '', '', '', ''),
(52, 233, 9, 'Снегоуборочная техника', '', '', '', ''),
(53, 234, 1, 'Парогенераторы', '', '', '', ''),
(54, 234, 9, 'Парогенераторы', '', '', '', ''),
(55, 235, 1, 'Пеногенераторы и компрессоры', '', '', '', ''),
(56, 235, 9, 'Пеногенераторы и компрессоры', '', '', '', ''),
(57, 236, 1, 'Химические и моющие средства', '', '', '', ''),
(58, 236, 9, 'Химические и моющие средства', '', '', '', ''),
(59, 237, 1, 'Аксессуары и комплектующие', '', '', '', ''),
(60, 237, 9, 'Химические и моющие средства', '', '', '', ''),
(61, 238, 1, 'Прочая техника', '', '', '', ''),
(62, 238, 9, 'Прочая техника', '', '', '', ''),
(63, 239, 1, 'Аппараты высокого давления Comet', '', '', '', ''),
(64, 239, 9, 'Аппараты высокого давления Comet', '', '', '', ''),
(65, 240, 1, 'Подметальные машины Fiorentini', '', '', '', ''),
(66, 240, 9, 'Поломоечные машины Fiorentini', '', '', '', ''),
(67, 241, 1, 'Подметальные машины Karcher', '', '', '', ''),
(68, 241, 9, 'Поломоечные машины Karcher', '', '', '', ''),
(69, 242, 1, 'Поломоечные машины  IPC Ganzow', '', '', '', ''),
(70, 242, 9, 'Поломоечные машины  IPC Ganzow', '', '', '', ''),
(71, 243, 1, 'Подметальные машины    IPC Ganzow', '', '', '', ''),
(72, 243, 9, 'Подметальные машины    IPC Ganzow', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `StoreCategoryTranslateOld`
--

CREATE TABLE IF NOT EXISTS `StoreCategoryTranslateOld` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `language_id` (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Дамп данных таблицы `StoreCategoryTranslateOld`
--

INSERT INTO `StoreCategoryTranslateOld` (`id`, `object_id`, `language_id`, `name`, `meta_title`, `meta_keywords`, `meta_description`, `description`) VALUES
(1, 1, 1, 'root', '', '', '', NULL),
(28, 1, 9, 'root', '', '', '', NULL),
(31, 223, 1, 'Ноутбуки', '', '', '', NULL),
(32, 223, 9, 'Ноутбуки', '', '', '', NULL),
(33, 224, 1, 'Бюджетный', '', '', '', NULL),
(34, 224, 9, 'Бюджетный', '', '', '', NULL),
(35, 225, 1, 'Игровой', '', '', '', NULL),
(36, 225, 9, 'Игровой', '', '', '', NULL),
(37, 226, 1, 'Компьютеры', '', '', '', NULL),
(38, 226, 9, 'Компьютеры', '', '', '', NULL),
(39, 227, 1, 'Компьютерная акустика', '', '', '', NULL),
(40, 227, 9, 'Компьютерная акустика', '', '', '', NULL),
(41, 228, 1, 'Мониторы', '', '', '', NULL),
(42, 228, 9, 'Мониторы', '', '', '', NULL),
(43, 229, 1, 'Телефоны', '', '', '', NULL),
(44, 229, 9, 'Телефоны', '', '', '', NULL),
(45, 230, 1, 'Планшеты', '', '', '', NULL),
(46, 230, 9, 'Планшеты', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `StoreCurrency`
--

CREATE TABLE IF NOT EXISTS `StoreCurrency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `iso` varchar(10) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `rate` float(10,3) NOT NULL,
  `main` tinyint(1) DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `StoreCurrency`
--

INSERT INTO `StoreCurrency` (`id`, `name`, `iso`, `symbol`, `rate`, `main`, `default`) VALUES
(1, 'Доллары', 'USD', '$', 1.000, 1, 1),
(2, 'Рубли', 'RUR', 'руб.', 32.520, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `StoreDeliveryMethod`
--

CREATE TABLE IF NOT EXISTS `StoreDeliveryMethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` float(10,2) NOT NULL DEFAULT '0.00',
  `free_from` float(10,2) NOT NULL DEFAULT '0.00',
  `position` smallint(6) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `position` (`position`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `StoreDeliveryMethod`
--

INSERT INTO `StoreDeliveryMethod` (`id`, `price`, `free_from`, `position`, `active`) VALUES
(14, 10.00, 1000.00, 0, 1),
(15, 0.00, 0.00, 1, 1),
(16, 30.00, 0.00, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `StoreDeliveryMethodTranslate`
--

CREATE TABLE IF NOT EXISTS `StoreDeliveryMethodTranslate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `language_id` (`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `StoreDeliveryMethodTranslate`
--

INSERT INTO `StoreDeliveryMethodTranslate` (`id`, `object_id`, `language_id`, `name`, `description`) VALUES
(1, 14, 1, 'Курьером', ''),
(2, 14, 9, 'English', 'english description'),
(3, 15, 1, 'Самовывоз', ''),
(4, 15, 9, 'Самовывоз', ''),
(5, 16, 1, 'Адресная доставка по стране', ''),
(6, 16, 9, 'Адресная доставка по стране', '');

-- --------------------------------------------------------

--
-- Структура таблицы `StoreDeliveryPayment`
--

CREATE TABLE IF NOT EXISTS `StoreDeliveryPayment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Saves relations between delivery and payment methods ' AUTO_INCREMENT=83 ;

--
-- Дамп данных таблицы `StoreDeliveryPayment`
--

INSERT INTO `StoreDeliveryPayment` (`id`, `delivery_id`, `payment_id`) VALUES
(24, 12, 14),
(23, 10, 16),
(22, 10, 13),
(21, 10, 14),
(34, 11, 16),
(33, 11, 13),
(25, 12, 15),
(26, 12, 16),
(78, 14, 21),
(77, 14, 19),
(76, 14, 20),
(75, 14, 18),
(82, 15, 20),
(81, 15, 18),
(55, 16, 17),
(56, 16, 18),
(57, 16, 20),
(58, 16, 19),
(74, 14, 17);

-- --------------------------------------------------------

--
-- Структура таблицы `StoreManufacturer`
--

CREATE TABLE IF NOT EXISTS `StoreManufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `layout` varchar(255) NOT NULL,
  `view` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `StoreManufacturer`
--

INSERT INTO `StoreManufacturer` (`id`, `url`, `layout`, `view`, `image`) VALUES
(1, 'karcher', '', '', ''),
(2, 'fiorentini', '', '', ''),
(3, 'ipc-euromop', '', '', ''),
(4, 'ipc-soteco', '', '', ''),
(5, 'ipc-gansow', '', '', ''),
(6, 'delvir', '', '', ''),
(7, 'portotecnica', '', '', ''),
(8, 'ecoline', '', '', ''),
(9, 'stiga', '', '', ''),
(10, 'pro-brite', '', '', ''),
(11, 'fraber', '', '', ''),
(12, 'trojan', '', '', ''),
(13, 'menikini', '', '', ''),
(14, 'comet', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `StoreManufacturerOld`
--

CREATE TABLE IF NOT EXISTS `StoreManufacturerOld` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `layout` varchar(255) NOT NULL,
  `view` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `StoreManufacturerOld`
--

INSERT INTO `StoreManufacturerOld` (`id`, `url`, `layout`, `view`) VALUES
(1, 'lenovo', '', ''),
(2, 'asus', '', ''),
(3, 'dell', '', ''),
(4, 'fujitsu', '', ''),
(5, 'hp', '', ''),
(6, 'apple', '', ''),
(7, 'sony', '', ''),
(8, 'acer', '', ''),
(9, 'logitech', '', ''),
(10, 'microlab', '', ''),
(11, 'edifier', '', ''),
(12, 'sven', '', ''),
(13, 'lg', '', ''),
(14, 'samsung', '', ''),
(15, 'philips', '', ''),
(16, 'htc', '', ''),
(17, 'nokia', '', ''),
(18, 'blackberry', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `StoreManufacturerTranslate`
--

CREATE TABLE IF NOT EXISTS `StoreManufacturerTranslate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `language_id` (`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Дамп данных таблицы `StoreManufacturerTranslate`
--

INSERT INTO `StoreManufacturerTranslate` (`id`, `object_id`, `language_id`, `name`, `description`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(19, 1, 1, 'Karcher', 'Описание', '', '', ''),
(20, 1, 9, 'Lenovo', '', '', '', ''),
(21, 2, 1, 'fiorentini', '', '', '', ''),
(22, 2, 9, 'Asus', '', '', '', ''),
(23, 3, 1, 'IPC Euromop', '', '', '', ''),
(24, 3, 9, 'Dell', '', '', '', ''),
(25, 4, 1, 'IPC Soteco', '', '', '', ''),
(26, 4, 9, 'Fujitsu', '', '', '', ''),
(27, 5, 1, 'IPC Gansow', '', '', '', ''),
(28, 5, 9, 'HP', '', '', '', ''),
(29, 6, 1, 'Delvir', '', '', '', ''),
(30, 6, 9, 'Apple', '', '', '', ''),
(31, 7, 1, 'Portotecnica', '', '', '', ''),
(32, 7, 9, 'Sony', '', '', '', ''),
(33, 8, 1, 'Eco Line', '', '', '', ''),
(34, 8, 9, 'Acer', '', '', '', ''),
(35, 9, 1, 'Stiga', '', '', '', ''),
(36, 9, 9, 'Logitech', '', '', '', ''),
(37, 10, 1, 'PRO-Brite', '', '', '', ''),
(38, 10, 9, 'Microlab', '', '', '', ''),
(39, 11, 1, 'FRABER', '', '', '', ''),
(40, 11, 9, 'Edifier', '', '', '', ''),
(41, 12, 1, 'Trojan', '', '', '', ''),
(42, 12, 9, 'Sven', '', '', '', ''),
(43, 13, 1, 'Menikini', '', '', '', ''),
(44, 13, 9, 'LG', '', '', '', ''),
(45, 14, 1, 'Comet', '', '', '', ''),
(46, 14, 9, 'Samsung', '', '', '', ''),
(47, 15, 1, 'Philips', '', '', '', ''),
(48, 15, 9, 'Philips', '', '', '', ''),
(49, 16, 1, 'HTC', '', '', '', ''),
(50, 16, 9, 'HTC', '', '', '', ''),
(51, 17, 1, 'Nokia', '', '', '', ''),
(52, 17, 9, 'Nokia', '', '', '', ''),
(53, 18, 1, 'BlackBerry', '', '', '', ''),
(54, 18, 9, 'BlackBerry', '', '', '', ''),
(55, 19, 1, 'Menikini', '', '', '', ''),
(56, 19, 9, 'Menikini', '', '', '', ''),
(57, 20, 1, 'Comet', '', '', '', ''),
(58, 20, 9, 'Comet', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `StoreManufacturerTranslateOld`
--

CREATE TABLE IF NOT EXISTS `StoreManufacturerTranslateOld` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `language_id` (`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Дамп данных таблицы `StoreManufacturerTranslateOld`
--

INSERT INTO `StoreManufacturerTranslateOld` (`id`, `object_id`, `language_id`, `name`, `description`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(19, 1, 1, 'Lenovo', '', '', '', ''),
(20, 1, 9, 'Lenovo', '', '', '', ''),
(21, 2, 1, 'Asus', '', '', '', ''),
(22, 2, 9, 'Asus', '', '', '', ''),
(23, 3, 1, 'Dell', '', '', '', ''),
(24, 3, 9, 'Dell', '', '', '', ''),
(25, 4, 1, 'Fujitsu', '', '', '', ''),
(26, 4, 9, 'Fujitsu', '', '', '', ''),
(27, 5, 1, 'HP', '', '', '', ''),
(28, 5, 9, 'HP', '', '', '', ''),
(29, 6, 1, 'Apple', '', '', '', ''),
(30, 6, 9, 'Apple', '', '', '', ''),
(31, 7, 1, 'Sony', '', '', '', ''),
(32, 7, 9, 'Sony', '', '', '', ''),
(33, 8, 1, 'Acer', '', '', '', ''),
(34, 8, 9, 'Acer', '', '', '', ''),
(35, 9, 1, 'Logitech', '', '', '', ''),
(36, 9, 9, 'Logitech', '', '', '', ''),
(37, 10, 1, 'Microlab', '', '', '', ''),
(38, 10, 9, 'Microlab', '', '', '', ''),
(39, 11, 1, 'Edifier', '', '', '', ''),
(40, 11, 9, 'Edifier', '', '', '', ''),
(41, 12, 1, 'Sven', '', '', '', ''),
(42, 12, 9, 'Sven', '', '', '', ''),
(43, 13, 1, 'LG', '', '', '', ''),
(44, 13, 9, 'LG', '', '', '', ''),
(45, 14, 1, 'Samsung', '', '', '', ''),
(46, 14, 9, 'Samsung', '', '', '', ''),
(47, 15, 1, 'Philips', '', '', '', ''),
(48, 15, 9, 'Philips', '', '', '', ''),
(49, 16, 1, 'HTC', '', '', '', ''),
(50, 16, 9, 'HTC', '', '', '', ''),
(51, 17, 1, 'Nokia', '', '', '', ''),
(52, 17, 9, 'Nokia', '', '', '', ''),
(53, 18, 1, 'BlackBerry', '', '', '', ''),
(54, 18, 9, 'BlackBerry', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `StorePaymentMethod`
--

CREATE TABLE IF NOT EXISTS `StorePaymentMethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `payment_system` varchar(100) NOT NULL,
  `position` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_id` (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `StorePaymentMethod`
--

INSERT INTO `StorePaymentMethod` (`id`, `currency_id`, `active`, `payment_system`, `position`) VALUES
(17, 1, 1, 'webmoney', 0),
(18, 2, 1, '', 2),
(19, 1, 1, 'robokassa', 1),
(20, 2, 1, '', 3),
(21, 2, 1, 'qiwi', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `StorePaymentMethodTranslate`
--

CREATE TABLE IF NOT EXISTS `StorePaymentMethodTranslate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `language_id` (`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `StorePaymentMethodTranslate`
--

INSERT INTO `StorePaymentMethodTranslate` (`id`, `object_id`, `language_id`, `name`, `description`) VALUES
(1, 17, 1, 'WebMoney', 'WebMoney — это универсальное средство для расчетов в Сети, целая среда финансовых взаимоотношений, которой сегодня пользуются миллионы людей по всему миру.'),
(2, 17, 9, 'English payment1', 'russian description'),
(3, 18, 1, 'Наличная', 'Наличная оплата осуществляется только в рублях при доставке товара курьером покупателю.'),
(7, 20, 1, 'Безналичная', ' Стоимость товара при безналичной оплате без ПДВ равна розничной цене товара + 2% '),
(8, 20, 9, 'Безналичная', ''),
(4, 18, 9, 'Наличка', '<p>ыла оылдао ылдао ылдоа ылдва<br />ыаол ывла оывалд ыова</p>'),
(5, 19, 1, 'Robokassa', 'Многими пользователями электронные платежные системы расцениваются в качестве наиболее удобного средства оплаты товаров и услуг в Интернете.'),
(6, 19, 9, 'Robokassa', '<p>Description goes here</p>'),
(9, 21, 1, 'Qiwi', 'Оплата с помощью Qiwi'),
(10, 21, 9, 'Qiwi', 'Оплата с помощью Qiwi');

-- --------------------------------------------------------

--
-- Структура таблицы `StoreProduct`
--

CREATE TABLE IF NOT EXISTS `StoreProduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `use_configurations` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `max_price` float(10,2) NOT NULL DEFAULT '0.00',
  `is_active` tinyint(1) NOT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `view` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT '0',
  `availability` tinyint(2) NOT NULL DEFAULT '1',
  `auto_decrease_quantity` tinyint(2) NOT NULL DEFAULT '1',
  `views_count` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `added_to_cart_count` int(11) NOT NULL,
  `votes` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `video` text,
  PRIMARY KEY (`id`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `type_id` (`type_id`),
  KEY `price` (`price`),
  KEY `max_price` (`max_price`),
  KEY `is_active` (`is_active`),
  KEY `sku` (`sku`),
  KEY `created` (`created`),
  KEY `updated` (`updated`),
  KEY `added_to_cart_count` (`added_to_cart_count`),
  KEY `views_count` (`views_count`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Дамп данных таблицы `StoreProduct`
--

INSERT INTO `StoreProduct` (`id`, `manufacturer_id`, `type_id`, `use_configurations`, `url`, `price`, `max_price`, `is_active`, `layout`, `view`, `sku`, `quantity`, `availability`, `auto_decrease_quantity`, `views_count`, `created`, `updated`, `added_to_cart_count`, `votes`, `rating`, `discount`, `video`) VALUES
(1, 1, 2, 0, 'lenovo-b570', 345.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:53', '2013-10-28 23:28:53', 0, 0, 0, NULL, 'Intel GMA HD'),
(2, 1, 2, 0, 'lenovo-g570', 360.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:53', '2013-10-28 23:28:53', 0, 0, 0, NULL, 'Intel GMA HD'),
(3, 2, 2, 0, 'asus-k53u', 375.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:53', '2013-10-28 23:28:53', 0, 0, 0, NULL, 'Intel GMA HD'),
(4, 2, 2, 0, 'asus-x54c', 370.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, 'Intel HD Graphics 3000'),
(5, 3, 2, 0, 'dell-inspiron-n5050', 380.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 2, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, 'Intel HD Graphics 3000'),
(6, 4, 2, 0, 'fujitsu-lifebook-ah531', 395.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, 'Intel HD Graphics 3000'),
(7, 5, 2, 0, 'hp-elitebook-8560w', 3150.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, 'NVIDIA Quadro 2000M'),
(8, 3, 2, 0, 'dell-alienware-m17x', 2850.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, 'AMD Radeon HD 6990M'),
(9, 6, 2, 0, 'apple-macbook-pro-15-late-2011', 2600.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 6, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, 'ATI Radeon HD 6770М'),
(10, 1, 2, 0, 'lenovo-thinkpad-w520', 2450.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, 'NVIDIA Quadro 2000M'),
(11, 7, 2, 0, 'sony-vaio-vpc-f13s8r', 1950.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, 'NVIDIA GeForce GT 425M'),
(12, 8, 2, 0, 'acer-aspire-5943g-7748g75twiss', 2350.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, 'ATI Mobility Radeon HD 5850'),
(13, 9, 3, 0, 'logitech-x-530', 99.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, NULL),
(14, 10, 3, 0, 'microlab-m-860', 89.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, NULL),
(15, 11, 3, 0, 'edifier-m3700', 115.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, NULL),
(16, 9, 3, 0, 'logitech-z-313', 84.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, NULL),
(17, 12, 3, 0, 'sven-sps-820', 55.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, NULL),
(18, 11, 3, 0, 'edifier-m1385', 67.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, NULL),
(19, 11, 3, 0, 'edifier-x600', 45.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, NULL),
(20, 10, 3, 0, 'microlab-fc-362', 85.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, NULL),
(21, 3, 4, 0, 'dell-u2412m', 240.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, NULL),
(22, 3, 4, 0, 'dell-u2312hm', 180.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, NULL),
(28, 5, 4, 0, 'hp-zr2740w', 460.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:54', '2013-10-28 23:28:54', 0, 0, 0, NULL, NULL),
(29, 5, 4, 0, 'hp-zr2440w', 380.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL),
(30, 14, 5, 0, 'samsung-galaxy-ace-ii', 390.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL),
(31, 16, 5, 0, 'htc-one-xl', 425.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 7, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL),
(32, 16, 5, 0, 'htc-sensation-xl', 480.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL),
(33, 6, 5, 0, 'apple-iphone-4s-16gb', 675.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL),
(34, 6, 5, 0, 'apple-iphone-3gs-8gb', 425.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL),
(35, 6, 5, 0, 'apple-iphone-4-16gb', 550.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL),
(36, 17, 5, 0, 'nokia-n9', 425.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 8, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL),
(37, 18, 5, 0, 'blackberry-bold-9900', 445.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL),
(38, 18, 5, 0, 'blackberry-bold-9780', 379.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL),
(39, 6, 6, 0, 'apple-ipad-2-16gb-wi-fi--3g', 430.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 9, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL),
(40, 6, 6, 0, 'apple-ipad-2-64gb-wi-fi--3g', 560.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL),
(42, 8, 6, 0, 'acer-iconia-tab-a100-8gb', 365.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL),
(43, 2, 6, 0, 'asus-transformer-pad-prime-201-64gb', 495.00, 0.00, 1, NULL, NULL, NULL, 0, 1, 1, 1, '2013-10-28 23:28:55', '2013-10-28 23:28:55', 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `StoreProductAttributeEAV`
--

CREATE TABLE IF NOT EXISTS `StoreProductAttributeEAV` (
  `entity` int(11) unsigned NOT NULL,
  `attribute` varchar(250) NOT NULL,
  `value` text NOT NULL,
  KEY `ikEntity` (`entity`),
  KEY `attribute` (`attribute`),
  KEY `value` (`value`(50))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `StoreProductAttributeEAV`
--

INSERT INTO `StoreProductAttributeEAV` (`entity`, `attribute`, `value`) VALUES
(1, 'processor_manufacturer', '59'),
(1, 'freq', '60'),
(1, 'memmory', '61'),
(1, 'memmory_type', '62'),
(1, 'screen', '63'),
(1, 'screen_dimension', '64'),
(2, 'processor_manufacturer', '59'),
(2, 'freq', '60'),
(2, 'memmory', '61'),
(2, 'memmory_type', '62'),
(2, 'screen', '63'),
(2, 'screen_dimension', '64'),
(3, 'processor_manufacturer', '65'),
(3, 'freq', '66'),
(3, 'memmory', '61'),
(3, 'memmory_type', '62'),
(3, 'screen', '63'),
(3, 'screen_dimension', '64'),
(4, 'processor_manufacturer', '59'),
(4, 'freq', '67'),
(4, 'memmory', '61'),
(4, 'memmory_type', '62'),
(4, 'screen', '63'),
(4, 'screen_dimension', '64'),
(5, 'processor_manufacturer', '59'),
(5, 'freq', '68'),
(5, 'memmory', '61'),
(5, 'memmory_type', '62'),
(5, 'screen', '63'),
(5, 'screen_dimension', '64'),
(6, 'processor_manufacturer', '59'),
(6, 'freq', '68'),
(6, 'memmory', '61'),
(6, 'memmory_type', '62'),
(6, 'screen', '63'),
(6, 'screen_dimension', '64'),
(7, 'processor_manufacturer', '69'),
(7, 'freq', '70'),
(7, 'memmory', '71'),
(7, 'memmory_type', '62'),
(7, 'screen', '63'),
(7, 'screen_dimension', '72'),
(8, 'processor_manufacturer', '69'),
(8, 'freq', '73'),
(8, 'memmory', '71'),
(8, 'memmory_type', '62'),
(8, 'screen', '63'),
(8, 'screen_dimension', '74'),
(9, 'processor_manufacturer', '69'),
(9, 'freq', '70'),
(9, 'memmory', '75'),
(9, 'memmory_type', '62'),
(9, 'screen', '76'),
(9, 'screen_dimension', '72'),
(10, 'processor_manufacturer', '69'),
(10, 'freq', '73'),
(10, 'memmory', '75'),
(10, 'memmory_type', '62'),
(10, 'screen', '63'),
(10, 'screen_dimension', '72'),
(11, 'processor_manufacturer', '77'),
(11, 'freq', '78'),
(11, 'memmory', '75'),
(11, 'memmory_type', '62'),
(11, 'screen', '79'),
(11, 'screen_dimension', '72'),
(12, 'processor_manufacturer', '69'),
(12, 'freq', '80'),
(12, 'memmory', '71'),
(12, 'memmory_type', '62'),
(12, 'screen', '63'),
(12, 'screen_dimension', '72'),
(13, 'rms_power', '81'),
(13, 'corpus_material', '82'),
(13, 'sound_type', '83'),
(14, 'rms_power', '84'),
(14, 'corpus_material', '82'),
(14, 'sound_type', '83'),
(15, 'rms_power', '85'),
(15, 'corpus_material', '86'),
(15, 'sound_type', '83'),
(16, 'rms_power', '87'),
(16, 'corpus_material', '82'),
(16, 'sound_type', '88'),
(17, 'rms_power', '89'),
(17, 'corpus_material', '86'),
(17, 'sound_type', '88'),
(18, 'rms_power', '90'),
(18, 'corpus_material', '86'),
(18, 'sound_type', '88'),
(19, 'rms_power', '89'),
(19, 'corpus_material', '86'),
(19, 'sound_type', '88'),
(20, 'rms_power', '84'),
(20, 'corpus_material', '86'),
(20, 'sound_type', '88'),
(21, 'monitor_diagonal', '91'),
(21, 'monitor_dimension', '92'),
(21, 'view_angle', '93'),
(22, 'monitor_diagonal', '94'),
(22, 'monitor_dimension', '92'),
(22, 'view_angle', '93'),
(28, 'monitor_diagonal', '97'),
(28, 'monitor_dimension', '98'),
(28, 'view_angle', '93'),
(29, 'monitor_diagonal', '91'),
(29, 'monitor_dimension', '92'),
(29, 'view_angle', '93'),
(30, 'phone_platform', '99'),
(30, 'phone_weight', '100'),
(30, 'phone_display', '101'),
(30, 'phone_camera', '102'),
(31, 'phone_platform', '99'),
(31, 'phone_weight', '103'),
(31, 'phone_display', '104'),
(31, 'phone_camera', '105'),
(32, 'phone_platform', '99'),
(32, 'phone_weight', '106'),
(32, 'phone_display', '104'),
(32, 'phone_camera', '105'),
(33, 'phone_platform', '107'),
(33, 'phone_weight', '108'),
(33, 'phone_display', '109'),
(33, 'phone_camera', '105'),
(34, 'phone_platform', '107'),
(34, 'phone_weight', '110'),
(34, 'phone_display', '109'),
(34, 'phone_camera', '111'),
(35, 'phone_platform', '107'),
(35, 'phone_weight', '112'),
(35, 'phone_display', '109'),
(35, 'phone_camera', '102'),
(36, 'phone_platform', '113'),
(36, 'phone_weight', '110'),
(36, 'phone_display', '114'),
(36, 'phone_camera', '105'),
(37, 'phone_platform', '115'),
(37, 'phone_weight', '116'),
(37, 'phone_display', '117'),
(37, 'phone_camera', '102'),
(38, 'phone_platform', '115'),
(38, 'phone_weight', '118'),
(38, 'phone_display', '119'),
(38, 'phone_camera', '102'),
(39, 'tablet_screen_size', '120'),
(39, 'screen_dimension', '121'),
(39, 'memmory_size', '122'),
(39, 'weight', '123'),
(40, 'tablet_screen_size', '120'),
(40, 'screen_dimension', '121'),
(40, 'memmory_size', '124'),
(40, 'weight', '123'),
(42, 'tablet_screen_size', '125'),
(42, 'screen_dimension', '126'),
(42, 'memmory_size', '128'),
(42, 'weight', '129'),
(43, 'tablet_screen_size', '130'),
(43, 'screen_dimension', '131'),
(43, 'memmory_size', '124'),
(43, 'weight', '132');

-- --------------------------------------------------------

--
-- Структура таблицы `StoreProductCategoryRef`
--

CREATE TABLE IF NOT EXISTS `StoreProductCategoryRef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `is_main` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `product` (`product`),
  KEY `is_main` (`is_main`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=140 ;

--
-- Дамп данных таблицы `StoreProductCategoryRef`
--

INSERT INTO `StoreProductCategoryRef` (`id`, `product`, `category`, `is_main`) VALUES
(70, 1, 224, 1),
(71, 1, 223, 0),
(72, 2, 224, 1),
(73, 2, 223, 0),
(74, 3, 224, 1),
(75, 3, 223, 0),
(76, 4, 224, 1),
(77, 4, 223, 0),
(78, 5, 224, 1),
(79, 5, 223, 0),
(80, 6, 224, 1),
(81, 6, 223, 0),
(82, 7, 225, 1),
(83, 7, 223, 0),
(84, 8, 225, 1),
(85, 8, 223, 0),
(86, 9, 225, 1),
(87, 9, 223, 0),
(88, 10, 225, 1),
(89, 10, 223, 0),
(90, 11, 225, 1),
(91, 11, 223, 0),
(92, 12, 225, 1),
(93, 12, 223, 0),
(94, 13, 227, 1),
(95, 13, 226, 0),
(96, 14, 227, 1),
(97, 14, 226, 0),
(98, 15, 227, 1),
(99, 15, 226, 0),
(100, 16, 227, 1),
(101, 16, 226, 0),
(102, 17, 227, 1),
(103, 17, 226, 0),
(104, 18, 227, 1),
(105, 18, 226, 0),
(106, 19, 227, 1),
(107, 19, 226, 0),
(108, 20, 227, 1),
(109, 20, 226, 0),
(110, 21, 228, 1),
(111, 22, 228, 1),
(117, 28, 228, 1),
(118, 29, 228, 1),
(119, 30, 229, 1),
(120, 31, 229, 1),
(121, 32, 229, 1),
(122, 33, 229, 1),
(123, 34, 229, 1),
(124, 35, 229, 1),
(125, 36, 229, 1),
(126, 37, 229, 1),
(127, 38, 229, 1),
(128, 39, 230, 1),
(129, 39, 226, 0),
(130, 40, 230, 1),
(131, 40, 226, 0),
(134, 42, 230, 1),
(135, 42, 226, 0),
(136, 43, 230, 1),
(137, 43, 226, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `StoreProductConfigurableAttributes`
--

CREATE TABLE IF NOT EXISTS `StoreProductConfigurableAttributes` (
  `product_id` int(11) NOT NULL COMMENT 'Attributes available to configure product',
  `attribute_id` int(11) NOT NULL,
  UNIQUE KEY `product_attribute_index` (`product_id`,`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `StoreProductConfigurations`
--

CREATE TABLE IF NOT EXISTS `StoreProductConfigurations` (
  `product_id` int(11) NOT NULL COMMENT 'Saves relations beetwen product and configurations',
  `configurable_id` int(11) NOT NULL,
  UNIQUE KEY `idsunique` (`product_id`,`configurable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `StoreProductImage`
--

CREATE TABLE IF NOT EXISTS `StoreProductImage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_main` tinyint(1) DEFAULT '0',
  `uploaded_by` int(11) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=179 ;

--
-- Дамп данных таблицы `StoreProductImage`
--

INSERT INTO `StoreProductImage` (`id`, `product_id`, `name`, `is_main`, `uploaded_by`, `date_uploaded`, `title`) VALUES
(135, 1, '1_4251407303.jpg', 1, 0, '2013-10-28 23:28:53', NULL),
(136, 2, '2_1107586311.jpg', 1, 0, '2013-10-28 23:28:53', NULL),
(137, 3, '3_1356978038.jpg', 1, 0, '2013-10-28 23:28:53', NULL),
(138, 4, '4_4067983402.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(139, 5, '5_3216915218.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(140, 6, '6_1353855136.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(141, 7, '7_203454540.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(142, 8, '8_4167765282.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(143, 9, '9_3822403258.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(144, 10, '10_440214832.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(145, 11, '11_1065942834.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(146, 12, '12_1685378983.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(147, 13, '13_2151320157.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(148, 14, '14_842217480.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(149, 15, '15_508536559.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(150, 16, '16_3803465909.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(151, 17, '17_3325929035.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(152, 18, '18_1320301505.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(153, 19, '19_3250509412.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(154, 20, '20_1641853196.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(155, 21, '21_1429727632.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(156, 22, '22_608914692.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(162, 28, '28_4288089981.jpg', 1, 0, '2013-10-28 23:28:54', NULL),
(163, 29, '29_4220525970.jpg', 1, 0, '2013-10-28 23:28:55', NULL),
(164, 30, '30_2703389323.jpg', 1, 0, '2013-10-28 23:28:55', NULL),
(165, 31, '31_3870670112.jpg', 1, 0, '2013-10-28 23:28:55', NULL),
(166, 32, '32_1605653262.jpg', 1, 0, '2013-10-28 23:28:55', NULL),
(167, 33, '33_2330389348.jpg', 1, 0, '2013-10-28 23:28:55', NULL),
(168, 34, '34_3662021671.jpg', 1, 0, '2013-10-28 23:28:55', NULL),
(169, 35, '35_3653949183.jpg', 1, 0, '2013-10-28 23:28:55', NULL),
(170, 36, '36_1691143556.jpg', 1, 0, '2013-10-28 23:28:55', NULL),
(171, 37, '37_1187693200.jpg', 1, 0, '2013-10-28 23:28:55', NULL),
(172, 38, '38_3138120534.jpg', 1, 0, '2013-10-28 23:28:55', NULL),
(173, 39, '39_1749951950.jpg', 1, 0, '2013-10-28 23:28:55', NULL),
(174, 40, '40_2698397610.jpg', 1, 0, '2013-10-28 23:28:55', NULL),
(176, 42, '42_1964145616.jpg', 1, 0, '2013-10-28 23:28:55', NULL),
(177, 43, '43_1010200627.jpg', 1, 0, '2013-10-28 23:28:55', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `StoreProductTranslate`
--

CREATE TABLE IF NOT EXISTS `StoreProductTranslate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` text,
  `full_description` text,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `language_id` (`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=267 ;

--
-- Дамп данных таблицы `StoreProductTranslate`
--

INSERT INTO `StoreProductTranslate` (`id`, `object_id`, `language_id`, `name`, `short_description`, `full_description`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(179, 1, 1, 'Lenovo B570', 'Celeron / Pentium, 1500-2200 МГц, 2048-4096 Мб, 320-500 Гб, 15.6 дюйм, Intel GMA HD, DVD-RW, Wi-Fi, Bluetooth (опционально), 2.35 кг', NULL, NULL, NULL, NULL),
(180, 1, 9, 'Lenovo B570', 'Celeron / Pentium, 1500-2200 МГц, 2048-4096 Мб, 320-500 Гб, 15.6 дюйм, Intel GMA HD, DVD-RW, Wi-Fi, Bluetooth (опционально), 2.35 кг', NULL, NULL, NULL, NULL),
(181, 2, 1, 'Lenovo G570', 'Celeron / Pentium, 1500-2200 МГц, 2048-4096 Мб, 320-500 Гб, 15.6 дюйм, ATI Radeon HD 6370M, DVD-RW, Wi-Fi, Bluetooth (опционально), 2.43 кг', NULL, NULL, NULL, NULL),
(182, 2, 9, 'Lenovo G570', 'Celeron / Pentium, 1500-2200 МГц, 2048-4096 Мб, 320-500 Гб, 15.6 дюйм, ATI Radeon HD 6370M, DVD-RW, Wi-Fi, Bluetooth (опционально), 2.43 кг', NULL, NULL, NULL, NULL),
(183, 3, 1, 'ASUS K53U', 'C-60 / E-240 / E-450, 1000-1650 МГц, 2048-4096 Мб, 320-500 Гб, 15.6 дюйм, DVD-RW, Wi-Fi, Bluetooth (опционально), 2.6 кг', NULL, NULL, NULL, NULL),
(184, 3, 9, 'ASUS K53U', 'C-60 / E-240 / E-450, 1000-1650 МГц, 2048-4096 Мб, 320-500 Гб, 15.6 дюйм, DVD-RW, Wi-Fi, Bluetooth (опционально), 2.6 кг', NULL, NULL, NULL, NULL),
(185, 4, 1, 'ASUS X54C', 'Celeron / Pentium, 1500-2200 МГц, 2048-4096 Мб, 320-500 Гб, 15.6 дюйм, Intel HD Graphics 3000, DVD-RW, Wi-Fi, Bluetooth, 2.6 кг', NULL, NULL, NULL, NULL),
(186, 4, 9, 'ASUS X54C', 'Celeron / Pentium, 1500-2200 МГц, 2048-4096 Мб, 320-500 Гб, 15.6 дюйм, Intel HD Graphics 3000, DVD-RW, Wi-Fi, Bluetooth, 2.6 кг', NULL, NULL, NULL, NULL),
(187, 5, 1, 'DELL INSPIRON N5050', 'Celeron, 1500-1700 МГц, 2048 Мб, 320-500 Гб, 15.6 дюйм, Intel HD Graphics 3000, DVD-RW, Wi-Fi, Bluetooth (опционально), 2.37 кг', NULL, NULL, NULL, NULL),
(188, 5, 9, 'DELL INSPIRON N5050', 'Celeron, 1500-1700 МГц, 2048 Мб, 320-500 Гб, 15.6 дюйм, Intel HD Graphics 3000, DVD-RW, Wi-Fi, Bluetooth (опционально), 2.37 кг', NULL, NULL, NULL, NULL),
(189, 6, 1, 'Fujitsu LIFEBOOK AH531', 'Celeron / Pentium, 1500-2200 МГц, 2048 Мб, 320 Гб, 15.6 дюйм, Intel HD Graphics 3000, DVD-RW, Wi-Fi, Bluetooth, 2.5 кг', NULL, NULL, NULL, NULL),
(190, 6, 9, 'Fujitsu LIFEBOOK AH531', 'Celeron / Pentium, 1500-2200 МГц, 2048 Мб, 320 Гб, 15.6 дюйм, Intel HD Graphics 3000, DVD-RW, Wi-Fi, Bluetooth, 2.5 кг', NULL, NULL, NULL, NULL),
(191, 7, 1, 'HP EliteBook 8560w', 'Core i7, 2500 МГц, 8192 Мб, 750 Гб, 15.6 дюйм, NVIDIA Quadro 2000M, BD-RE, Wi-Fi, Bluetooth, 3 кг', NULL, NULL, NULL, NULL),
(192, 7, 9, 'HP EliteBook 8560w', 'Core i7, 2500 МГц, 8192 Мб, 750 Гб, 15.6 дюйм, NVIDIA Quadro 2000M, BD-RE, Wi-Fi, Bluetooth, 3 кг', NULL, NULL, NULL, NULL),
(193, 8, 1, 'DELL ALIENWARE M17x', 'Core i7, 2200-2400 МГц, 8192-16384 Мб, 750-1500 Гб, 17 дюйм, AMD Radeon HD 6990M, BD-RE / Blu-Ray / DVD-RW, Wi-Fi, Bluetooth, 5.3 кг', NULL, NULL, NULL, NULL),
(194, 8, 9, 'DELL ALIENWARE M17x', 'Core i7, 2200-2400 МГц, 8192-16384 Мб, 750-1500 Гб, 17 дюйм, AMD Radeon HD 6990M, BD-RE / Blu-Ray / DVD-RW, Wi-Fi, Bluetooth, 5.3 кг', NULL, NULL, NULL, NULL),
(195, 9, 1, 'Apple MacBook Pro 15 Late 2011', 'Core i7, 2200-2400 МГц, 4096 Мб, 500-750 Гб, 15.4 дюйм, ATI Radeon HD 6750M / ATI Radeon HD 6770М, DVD-RW, Wi-Fi, Bluetooth, 2.54 кг', NULL, NULL, NULL, NULL),
(196, 9, 9, 'Apple MacBook Pro 15 Late 2011', 'Core i7, 2200-2400 МГц, 4096 Мб, 500-750 Гб, 15.4 дюйм, ATI Radeon HD 6750M / ATI Radeon HD 6770М, DVD-RW, Wi-Fi, Bluetooth, 2.54 кг', NULL, NULL, NULL, NULL),
(197, 10, 1, 'Lenovo THINKPAD W520', 'Core i7 / Core i7 Extreme, 2000-2700 МГц, 4096-8192 Мб, 160-580 Гб, 15.6 дюйм, NVIDIA Quadro 2000M, DVD-RW, Wi-Fi, Bluetooth, 2.45 кг', NULL, NULL, NULL, NULL),
(198, 10, 9, 'Lenovo THINKPAD W520', 'Core i7 / Core i7 Extreme, 2000-2700 МГц, 4096-8192 Мб, 160-580 Гб, 15.6 дюйм, NVIDIA Quadro 2000M, DVD-RW, Wi-Fi, Bluetooth, 2.45 кг', NULL, NULL, NULL, NULL),
(199, 11, 1, 'Sony VAIO VPC-F13S8R', 'Core i5, 2660 МГц, 4096 Мб, 640 Гб, 16.4 дюйм, NVIDIA GeForce GT 425M, Blu-Ray, Wi-Fi, Bluetooth, 3.1 кг', NULL, NULL, NULL, NULL),
(200, 11, 9, 'Sony VAIO VPC-F13S8R', 'Core i5, 2660 МГц, 4096 Мб, 640 Гб, 16.4 дюйм, NVIDIA GeForce GT 425M, Blu-Ray, Wi-Fi, Bluetooth, 3.1 кг', NULL, NULL, NULL, NULL),
(201, 12, 1, 'Acer ASPIRE 5943G-7748G75TWiss', 'Core i7, 1730 МГц, 8192 Мб, 750 Гб, 15.6 дюйм, ATI Mobility Radeon HD 5850, BD-RE, Wi-Fi, Bluetooth, 3.3 кг', NULL, NULL, NULL, NULL),
(202, 12, 9, 'Acer ASPIRE 5943G-7748G75TWiss', 'Core i7, 1730 МГц, 8192 Мб, 750 Гб, 15.6 дюйм, ATI Mobility Radeon HD 5850, BD-RE, Wi-Fi, Bluetooth, 3.3 кг', NULL, NULL, NULL, NULL),
(203, 13, 1, 'Logitech X-530', 'число каналов: 5.1, мощность 71.20 Вт, 40-20000 Гц, материал колонок: пластик, материал сабвуфера: MDF, разъем для наушников, магнитное экранирование', NULL, NULL, NULL, NULL),
(204, 13, 9, 'Logitech X-530', 'число каналов: 5.1, мощность 71.20 Вт, 40-20000 Гц, материал колонок: пластик, материал сабвуфера: MDF, разъем для наушников, магнитное экранирование', NULL, NULL, NULL, NULL),
(205, 14, 1, 'Microlab M-860', 'число каналов: 5.1, мощность 62 Вт, 30-20000 Гц, материал колонок: пластик, материал сабвуфера: MDF, магнитное экранирование, пульт ДУ', NULL, NULL, NULL, NULL),
(206, 14, 9, 'Microlab M-860', 'число каналов: 5.1, мощность 62 Вт, 30-20000 Гц, материал колонок: пластик, материал сабвуфера: MDF, магнитное экранирование, пульт ДУ', NULL, NULL, NULL, NULL),
(207, 15, 1, 'Edifier M3700', 'число каналов: 5.1, мощность 80 Вт, 45-20000 Гц, материал колонок: MDF, материал сабвуфера: MDF, магнитное экранирование, пульт ДУ', NULL, NULL, NULL, NULL),
(208, 15, 9, 'Edifier M3700', 'число каналов: 5.1, мощность 80 Вт, 45-20000 Гц, материал колонок: MDF, материал сабвуфера: MDF, магнитное экранирование, пульт ДУ', NULL, NULL, NULL, NULL),
(209, 16, 1, 'Logitech Z-313', 'число каналов: 2.1, мощность 25 Вт, 48-20000 Гц, материал колонок: пластик, материал сабвуфера: MDF', NULL, NULL, NULL, NULL),
(210, 16, 9, 'Logitech Z-313', 'число каналов: 2.1, мощность 25 Вт, 48-20000 Гц, материал колонок: пластик, материал сабвуфера: MDF', NULL, NULL, NULL, NULL),
(211, 17, 1, 'Sven SPS-820', 'число каналов: 2.1, мощность 38 Вт, 50-20000 Гц, материал колонок: MDF, материал сабвуфера: MDF, магнитное экранирование', NULL, NULL, NULL, NULL),
(212, 17, 9, 'Sven SPS-820', 'число каналов: 2.1, мощность 38 Вт, 50-20000 Гц, материал колонок: MDF, материал сабвуфера: MDF, магнитное экранирование', NULL, NULL, NULL, NULL),
(213, 18, 1, 'Edifier M1385', 'число каналов: 2.1, мощность 28 Вт, материал сабвуфера: MDF, разъем для наушников, магнитное экранирование, радио', NULL, NULL, NULL, NULL),
(214, 18, 9, 'Edifier M1385', 'число каналов: 2.1, мощность 28 Вт, материал сабвуфера: MDF, разъем для наушников, магнитное экранирование, радио', NULL, NULL, NULL, NULL),
(215, 19, 1, 'Edifier X600', 'число каналов: 2.1, мощность 30 Вт, 48-20000 Гц, материал колонок: MDF, материал сабвуфера: MDF, магнитное экранирование', NULL, NULL, NULL, NULL),
(216, 19, 9, 'Edifier X600', 'число каналов: 2.1, мощность 30 Вт, 48-20000 Гц, материал колонок: MDF, материал сабвуфера: MDF, магнитное экранирование', NULL, NULL, NULL, NULL),
(217, 20, 1, 'Microlab FC 362', 'число каналов: 2.1, мощность 54 Вт, 35-20000 Гц, материал сабвуфера: MDF, разъем для наушников', NULL, NULL, NULL, NULL),
(218, 20, 9, 'Microlab FC 362', 'число каналов: 2.1, мощность 54 Вт, 35-20000 Гц, материал сабвуфера: MDF, разъем для наушников', NULL, NULL, NULL, NULL),
(219, 21, 1, 'DELL U2412M', 'ЖК (TFT E-IPS) 24", широкоформатный, 1920x1200, LED-подсветка, 300 кд/м2, 1000:1, 8 мс, 178°/178°, USB-концентратор, DVI, DisplayPort, VGA', NULL, NULL, NULL, NULL),
(220, 21, 9, 'DELL U2412M', 'ЖК (TFT E-IPS) 24", широкоформатный, 1920x1200, LED-подсветка, 300 кд/м2, 1000:1, 8 мс, 178°/178°, USB-концентратор, DVI, DisplayPort, VGA', NULL, NULL, NULL, NULL),
(221, 22, 1, 'DELL U2312HM', 'ЖК (TFT IPS) 23", широкоформатный, 1920x1080, LED-подсветка, 300 кд/м2, 1000:1, 8 мс, 178°/178°, USB-концентратор, DVI, DisplayPort, VGA', NULL, NULL, NULL, NULL),
(222, 22, 9, 'DELL U2312HM', 'ЖК (TFT IPS) 23", широкоформатный, 1920x1080, LED-подсветка, 300 кд/м2, 1000:1, 8 мс, 178°/178°, USB-концентратор, DVI, DisplayPort, VGA', NULL, NULL, NULL, NULL),
(233, 28, 1, 'HP ZR2740w', 'ЖК (TFT IPS) 27", широкоформатный, 2560x1440, LED-подсветка, 380 кд/м2, 1000:1, 12 мс, 178°/178°, USB-концентратор, DVI, DisplayPort', NULL, NULL, NULL, NULL),
(234, 28, 9, 'HP ZR2740w', 'ЖК (TFT IPS) 27", широкоформатный, 2560x1440, LED-подсветка, 380 кд/м2, 1000:1, 12 мс, 178°/178°, USB-концентратор, DVI, DisplayPort', NULL, NULL, NULL, NULL),
(235, 29, 1, 'HP ZR2440w', 'ЖК (TFT IPS) 24", широкоформатный, 1920x1200, LED-подсветка, 350 кд/м2, 1000:1, 6 мс, 178°/178°, USB-концентратор, DVI, HDMI, DisplayPort', NULL, NULL, NULL, NULL),
(236, 29, 9, 'HP ZR2440w', 'ЖК (TFT IPS) 24", широкоформатный, 1920x1200, LED-подсветка, 350 кд/м2, 1000:1, 6 мс, 178°/178°, USB-концентратор, DVI, HDMI, DisplayPort', NULL, NULL, NULL, NULL),
(237, 30, 1, 'Samsung Galaxy Ace II', 'GSM, 3G, смартфон, Android 2.3, вес 118 г, ШхВхТ: 62.3x118.3x10.5 мм, экран 3.8", 480x800, FM-радио, Bluetooth, Wi-Fi, GPS, ГЛОНАСС, фотокамера 5 МП, память 4 Гб, слот microSD (TransFlash), аккумулятор 1500 мАч', NULL, NULL, NULL, NULL),
(238, 30, 9, 'Samsung Galaxy Ace II', 'GSM, 3G, смартфон, Android 2.3, вес 118 г, ШхВхТ: 62.3x118.3x10.5 мм, экран 3.8", 480x800, FM-радио, Bluetooth, Wi-Fi, GPS, ГЛОНАСС, фотокамера 5 МП, память 4 Гб, слот microSD (TransFlash), аккумулятор 1500 мАч', NULL, NULL, NULL, NULL),
(239, 31, 1, 'HTC One XL', 'GSM, 3G, смартфон, Android 4.0, вес 129 г, ШхВхТ: 69.9x134.8x8.9 мм, экран 4.7", 720x1280, FM-радио, Bluetooth, Wi-Fi, GPS, фотокамера 8 МП, память 32 Гб, аккумулятор 1800 мАч', NULL, NULL, NULL, NULL),
(240, 31, 9, 'HTC One XL', 'GSM, 3G, смартфон, Android 4.0, вес 129 г, ШхВхТ: 69.9x134.8x8.9 мм, экран 4.7", 720x1280, FM-радио, Bluetooth, Wi-Fi, GPS, фотокамера 8 МП, память 32 Гб, аккумулятор 1800 мАч', NULL, NULL, NULL, NULL),
(241, 32, 1, 'HTC Sensation XL', 'GSM, 3G, смартфон, Android 2.3, вес 162 г, ШхВхТ: 70.7x132.5x9.9 мм, экран 4.7", 480x800, FM-радио, Bluetooth, Wi-Fi, GPS, фотокамера 8 МП, память 16 Гб, аккумулятор 1600 мАч', NULL, NULL, NULL, NULL),
(242, 32, 9, 'HTC Sensation XL', 'GSM, 3G, смартфон, Android 2.3, вес 162 г, ШхВхТ: 70.7x132.5x9.9 мм, экран 4.7", 480x800, FM-радио, Bluetooth, Wi-Fi, GPS, фотокамера 8 МП, память 16 Гб, аккумулятор 1600 мАч', NULL, NULL, NULL, NULL),
(243, 33, 1, 'Apple iPhone 4S 16Gb', 'GSM, CDMA800, CDMA1900, 3G, смартфон, iOS 5, вес 140 г, ШхВхТ: 58.6x115.2x9.3 мм, экран 3.5", 640x960, Bluetooth, Wi-Fi, GPS, ГЛОНАСС, фотокамера 8 МП, память 16 Гб', NULL, NULL, NULL, NULL),
(244, 33, 9, 'Apple iPhone 4S 16Gb', 'GSM, CDMA800, CDMA1900, 3G, смартфон, iOS 5, вес 140 г, ШхВхТ: 58.6x115.2x9.3 мм, экран 3.5", 640x960, Bluetooth, Wi-Fi, GPS, ГЛОНАСС, фотокамера 8 МП, память 16 Гб', NULL, NULL, NULL, NULL),
(245, 34, 1, 'Apple iPhone 3GS 8Gb', 'GSM, 3G, смартфон, iOS, вес 135 г, ШхВхТ: 62x116x12 мм, экран 3.5", 320x480, Bluetooth, Wi-Fi, GPS, фотокамера 3 МП, память 8 Гб', NULL, NULL, NULL, NULL),
(246, 34, 9, 'Apple iPhone 3GS 8Gb', 'GSM, 3G, смартфон, iOS, вес 135 г, ШхВхТ: 62x116x12 мм, экран 3.5", 320x480, Bluetooth, Wi-Fi, GPS, фотокамера 3 МП, память 8 Гб', NULL, NULL, NULL, NULL),
(247, 35, 1, 'Apple iPhone 4 16Gb', 'GSM, 3G, смартфон, iOS 4, вес 137 г, ШхВхТ: 59x115x9 мм, экран 3.5", 640x960, Bluetooth, Wi-Fi, GPS, фотокамера 5 МП, память 16 Гб', NULL, NULL, NULL, NULL),
(248, 35, 9, 'Apple iPhone 4 16Gb', 'GSM, 3G, смартфон, iOS 4, вес 137 г, ШхВхТ: 59x115x9 мм, экран 3.5", 640x960, Bluetooth, Wi-Fi, GPS, фотокамера 5 МП, память 16 Гб', NULL, NULL, NULL, NULL),
(249, 36, 1, 'Nokia N9', 'GSM, 3G, смартфон, MeeGo 1.2, вес 135 г, ШхВхТ: 61x116x12 мм, экран 3.9", 480x854, Bluetooth, Wi-Fi, GPS, фотокамера 8 МП, аккумулятор 1450 мАч', NULL, NULL, NULL, NULL),
(250, 36, 9, 'Nokia N9', 'GSM, 3G, смартфон, MeeGo 1.2, вес 135 г, ШхВхТ: 61x116x12 мм, экран 3.9", 480x854, Bluetooth, Wi-Fi, GPS, фотокамера 8 МП, аккумулятор 1450 мАч', NULL, NULL, NULL, NULL),
(251, 37, 1, 'BlackBerry Bold 9900', 'GSM, 3G, смартфон, BlackBerry OS, вес 130 г, ШхВхТ: 66x115x11 мм, экран 2.8", 640x480, Bluetooth, Wi-Fi, GPS, фотокамера 5 МП, память 8 Гб, слот microSD (TransFlash), аккумулятор 1230 мАч', NULL, NULL, NULL, NULL),
(252, 37, 9, 'BlackBerry Bold 9900', 'GSM, 3G, смартфон, BlackBerry OS, вес 130 г, ШхВхТ: 66x115x11 мм, экран 2.8", 640x480, Bluetooth, Wi-Fi, GPS, фотокамера 5 МП, память 8 Гб, слот microSD (TransFlash), аккумулятор 1230 мАч', NULL, NULL, NULL, NULL),
(253, 38, 1, 'BlackBerry Bold 9780', 'GSM, 3G, смартфон, BlackBerry OS, вес 122 г, ШхВхТ: 60x109x14 мм, экран 2.4", 480x360, Bluetooth, Wi-Fi, GPS, фотокамера 5 МП, память 256 Мб, слот microSD (TransFlash), аккумулятор 1500 мАч', NULL, NULL, NULL, NULL),
(254, 38, 9, 'BlackBerry Bold 9780', 'GSM, 3G, смартфон, BlackBerry OS, вес 122 г, ШхВхТ: 60x109x14 мм, экран 2.4", 480x360, Bluetooth, Wi-Fi, GPS, фотокамера 5 МП, память 256 Мб, слот microSD (TransFlash), аккумулятор 1500 мАч', NULL, NULL, NULL, NULL),
(255, 39, 1, 'Apple iPad 2 16Gb Wi-Fi + 3G', 'экран 9.7", 1024x768, емкостный, мультитач, iOS, встроенная память 16 Гб, Wi-Fi, Bluetooth, 3G, GPS, гироскоп, две фотокамеры, вес 613 г', NULL, NULL, NULL, NULL),
(256, 39, 9, 'Apple iPad 2 16Gb Wi-Fi + 3G', 'экран 9.7", 1024x768, емкостный, мультитач, iOS, встроенная память 16 Гб, Wi-Fi, Bluetooth, 3G, GPS, гироскоп, две фотокамеры, вес 613 г', NULL, NULL, NULL, NULL),
(257, 40, 1, 'Apple iPad 2 64Gb Wi-Fi + 3G', 'экран 9.7", 1024x768, емкостный, мультитач, iOS, встроенная память 64 Гб, Wi-Fi, Bluetooth, 3G, GPS, гироскоп, две фотокамеры, вес 613 г', NULL, NULL, NULL, NULL),
(258, 40, 9, 'Apple iPad 2 64Gb Wi-Fi + 3G', 'экран 9.7", 1024x768, емкостный, мультитач, iOS, встроенная память 64 Гб, Wi-Fi, Bluetooth, 3G, GPS, гироскоп, две фотокамеры, вес 613 г', NULL, NULL, NULL, NULL),
(261, 42, 1, 'Acer Iconia Tab A100 8Gb', 'экран 7", 1024x600, емкостный, мультитач, Android 3.2, встроенная память 8 Гб, microSDHC, Wi-Fi, Bluetooth, GPS, гироскоп, две фотокамеры, HDMI, подключение к компьютеру по USB, вес 410 г', NULL, NULL, NULL, NULL),
(262, 42, 9, 'Acer Iconia Tab A100 8Gb', 'экран 7", 1024x600, емкостный, мультитач, Android 3.2, встроенная память 8 Гб, microSDHC, Wi-Fi, Bluetooth, GPS, гироскоп, две фотокамеры, HDMI, подключение к компьютеру по USB, вес 410 г', NULL, NULL, NULL, NULL),
(263, 43, 1, 'Asus Transformer Pad Prime 201 64Gb', 'экран 10.1", 1280x800, емкостный, мультитач, Android 4.0, встроенная память 64 Гб, microSD, Wi-Fi, Bluetooth, гироскоп, две фотокамеры, micro HDMI, подключение к компьютеру по USB, вес 586 г', NULL, NULL, NULL, NULL),
(264, 43, 9, 'Asus Transformer Pad Prime 201 64Gb', 'экран 10.1", 1280x800, емкостный, мультитач, Android 4.0, встроенная память 64 Гб, microSD, Wi-Fi, Bluetooth, гироскоп, две фотокамеры, micro HDMI, подключение к компьютеру по USB, вес 586 г', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `StoreProductType`
--

CREATE TABLE IF NOT EXISTS `StoreProductType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `categories_preset` text NOT NULL,
  `main_category` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `StoreProductType`
--

INSERT INTO `StoreProductType` (`id`, `name`, `categories_preset`, `main_category`) VALUES
(1, 'Простой продукт', '', 0),
(2, 'Ноутбук', '', 0),
(3, 'Акустика', '', 0),
(4, 'Монитор', '', 0),
(5, 'Телефон', '', 0),
(6, 'Планшет', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `StoreProductVariant`
--

CREATE TABLE IF NOT EXISTS `StoreProductVariant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` float(10,2) NOT NULL DEFAULT '0.00',
  `price_type` tinyint(1) NOT NULL,
  `sku` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_id` (`attribute_id`),
  KEY `option_id` (`option_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Структура таблицы `StoreRelatedProduct`
--

CREATE TABLE IF NOT EXISTS `StoreRelatedProduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Handle related products' AUTO_INCREMENT=60 ;

-- --------------------------------------------------------

--
-- Структура таблицы `StoreTypeAttribute`
--

CREATE TABLE IF NOT EXISTS `StoreTypeAttribute` (
  `type_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`type_id`,`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `StoreTypeAttribute`
--

INSERT INTO `StoreTypeAttribute` (`type_id`, `attribute_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 13),
(5, 14),
(5, 15),
(5, 16),
(6, 17),
(6, 18),
(6, 19);

-- --------------------------------------------------------

--
-- Структура таблицы `StoreWishlist`
--

CREATE TABLE IF NOT EXISTS `StoreWishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key` (`key`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `StoreWishlistProducts`
--

CREATE TABLE IF NOT EXISTS `StoreWishlistProducts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wishlist_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_id` (`wishlist_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Структура таблицы `SystemLanguage`
--

CREATE TABLE IF NOT EXISTS `SystemLanguage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(25) NOT NULL,
  `locale` varchar(100) NOT NULL,
  `default` tinyint(1) NOT NULL,
  `flag_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `SystemLanguage`
--

INSERT INTO `SystemLanguage` (`id`, `name`, `code`, `locale`, `default`, `flag_name`) VALUES
(1, 'Русский', 'ru', 'ru', 1, 'ru.png'),
(9, 'English', 'en', 'en', 0, 'us.png');

-- --------------------------------------------------------

--
-- Структура таблицы `SystemModules`
--

CREATE TABLE IF NOT EXISTS `SystemModules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- Дамп данных таблицы `SystemModules`
--

INSERT INTO `SystemModules` (`id`, `name`, `enabled`) VALUES
(7, 'users', 1),
(9, 'pages', 1),
(11, 'core', 1),
(12, 'rights', 1),
(16, 'orders', 1),
(15, 'store', 1),
(17, 'comments', 1),
(37, 'feedback', 1),
(38, 'discounts', 1),
(39, 'newsletter', 1),
(40, 'csv', 1),
(41, 'logger', 1),
(52, 'accounting1c', 1),
(53, 'yandexMarket', 1),
(54, 'notifier', 1),
(55, 'statistics', 1),
(56, 'sitemap', 1),
(57, 'programm', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `SystemSettings`
--

CREATE TABLE IF NOT EXISTS `SystemSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `key` (`key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Дамп данных таблицы `SystemSettings`
--

INSERT INTO `SystemSettings` (`id`, `category`, `key`, `value`) VALUES
(9, 'feedback', 'max_message_length', '1000'),
(8, 'feedback', 'enable_captcha', '1'),
(7, 'feedback', 'admin_email', 'admin@localhost.local'),
(10, '17_WebMoneyPaymentSystem', 'LMI_PAYEE_PURSE', 'Z123456578811'),
(11, '17_WebMoneyPaymentSystem', 'LMI_SECRET_KEY', 'theSercretPassword'),
(12, '18_WebMoneyPaymentSystem', 'LMI_PAYEE_PURSE', '1'),
(13, '18_WebMoneyPaymentSystem', 'LMI_SECRET_KEY', '2'),
(14, '19_RobokassaPaymentSystem', 'login', 'login'),
(15, '19_RobokassaPaymentSystem', 'password1', 'password1value'),
(16, '19_RobokassaPaymentSystem', 'password2', 'password2value'),
(22, 'accounting1c', 'password', 'f880fefe2aff8130bb31d480f08e47c03e655b60'),
(21, 'accounting1c', 'ip', '127.0.0.1'),
(23, 'accounting1c', 'tempdir', 'application.runtime'),
(24, 'yandexMarket', 'name', 'Демо магазин'),
(25, 'yandexMarket', 'company', 'Демо кампания'),
(26, 'yandexMarket', 'url', 'http://demo-company.loc/'),
(27, 'yandexMarket', 'currency_id', '2'),
(28, 'core', 'siteName', 'Чистопром - чистота в промышленных масштабах'),
(29, 'core', 'productsPerPage', '12,18,24'),
(30, 'core', 'productsPerPageAdmin', '30'),
(31, 'core', 'theme', 'default'),
(32, '20_QiwiPaymentSystem', 'shop_id', ''),
(33, '20_QiwiPaymentSystem', 'password', ''),
(34, '21_QiwiPaymentSystem', 'shop_id', '211182'),
(35, '21_QiwiPaymentSystem', 'password', 'xsi100500'),
(36, 'core', 'editorTheme', 'compant'),
(37, 'core', 'editorHeight', '300'),
(38, 'core', 'editorAutoload', '0'),
(39, 'images', 'path', 'webroot.uploads.product'),
(40, 'images', 'thumbPath', 'webroot.assets.productThumbs'),
(41, 'images', 'url', '/uploads/product/'),
(42, 'images', 'thumbUrl', '/assets/productThumbs/'),
(43, 'images', 'maxFileSize', '10485760'),
(44, 'images', 'max_sizes', '1800х1600'),
(45, 'images', 'maximum_image_size', '800x600'),
(46, 'images', 'watermark_image', ''),
(47, 'images', 'watermark_active', '0'),
(48, 'images', 'watermark_position', 'bottomRight'),
(49, 'images', 'watermark_position_vertical', 'bottom'),
(50, 'images', 'watermark_position_horizontal', 'right'),
(51, 'images', 'watermark_opacity', '100');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_migration`
--

CREATE TABLE IF NOT EXISTS `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tbl_migration`
--

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1361214193),
('m130218_190341_add_description_to_store_category', 1361214373),
('m130218_190818_add_description_to_store_category_translate', 1361214547),
('m130420_194012_add_roles_to_discounts', 1366487103),
('m130420_204956_add_personal_discount_to_user', 1366491054),
('m130421_095545_add_personal_discount_to_product', 1366538394),
('m130504_170119_add_discout_to_order', 1367686940),
('m130504_183903_add_title_to_store_product_image', 1367692811),
('m130507_103455_add_banned_to_user', 1367923070),
('m130507_104810_unban_all_users', 1367923771),
('m130624_155800_add_new_fields_to_product', 1372089566),
('m130714_114907_add_admin_comment_to_orders', 1373802668),
('m130726_042212_create_order_history_table', 1374814430);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `login_ip` varchar(255) NOT NULL,
  `recovery_key` varchar(20) NOT NULL,
  `recovery_password` varchar(100) NOT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Saves user accounts' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `created_at`, `last_login`, `login_ip`, `recovery_key`, `recovery_password`, `discount`, `banned`) VALUES
(1, 'admins', 'a88464bc617766536f6d23cb668b06d1ec86399e', 'overg@mail.ru', '2013-10-28 23:29:13', '2013-10-30 21:47:29', '95.27.21.225', '', '', NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `user_profile`
--

INSERT INTO `user_profile` (`id`, `user_id`, `full_name`, `phone`, `delivery_address`) VALUES
(1, 1, 'admins', NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
