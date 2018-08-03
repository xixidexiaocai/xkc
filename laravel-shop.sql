/*
Navicat MySQL Data Transfer

Source Server         : homestead
Source Server Version : 50722
Source Host           : 192.168.10.10:3306
Source Database       : laravel-shop

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-07-26 18:07:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', '首页', 'fa-bar-chart', '/', null, '2018-07-19 09:31:33');
INSERT INTO `admin_menu` VALUES ('2', '0', '6', '系统管理', 'fa-tasks', null, null, '2018-07-26 08:02:57');
INSERT INTO `admin_menu` VALUES ('3', '2', '7', '管理员', 'fa-users', 'auth/users', null, '2018-07-26 08:02:57');
INSERT INTO `admin_menu` VALUES ('4', '2', '8', '角色', 'fa-user', 'auth/roles', null, '2018-07-26 08:02:57');
INSERT INTO `admin_menu` VALUES ('5', '2', '9', '权限', 'fa-ban', 'auth/permissions', null, '2018-07-26 08:02:57');
INSERT INTO `admin_menu` VALUES ('6', '0', '2', '用户管理', 'fa-bars', '/users', null, '2018-07-19 09:40:21');
INSERT INTO `admin_menu` VALUES ('7', '2', '11', '操作日志', 'fa-history', 'auth/logs', null, '2018-07-26 08:02:57');
INSERT INTO `admin_menu` VALUES ('8', '2', '10', '菜单', 'fa-bars', '/auth/menu', '2018-07-20 00:43:45', '2018-07-26 08:02:57');
INSERT INTO `admin_menu` VALUES ('9', '0', '3', '商品管理', 'fa-cubes', '/products', '2018-07-20 00:46:03', '2018-07-20 00:48:31');
INSERT INTO `admin_menu` VALUES ('10', '0', '4', '订单管理', 'fa-rmb', '/orders', '2018-07-26 06:15:37', '2018-07-26 06:15:52');
INSERT INTO `admin_menu` VALUES ('11', '0', '5', '优惠券管理', 'fa-tags', '/coupon_codes', '2018-07-26 08:02:43', '2018-07-26 08:02:57');

-- ----------------------------
-- Table structure for `admin_operation_log`
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '1', 'admin', 'GET', '192.168.10.1', '[]', '2018-07-26 09:25:16', '2018-07-26 09:25:16');

-- ----------------------------
-- Table structure for `admin_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null);
INSERT INTO `admin_permissions` VALUES ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null);
INSERT INTO `admin_permissions` VALUES ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null);
INSERT INTO `admin_permissions` VALUES ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null);
INSERT INTO `admin_permissions` VALUES ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null);
INSERT INTO `admin_permissions` VALUES ('6', '用户管理', 'users', '', '/users*', '2018-07-19 09:44:08', '2018-07-19 09:44:08');
INSERT INTO `admin_permissions` VALUES ('7', '商品管理', 'products', '', '/products*', '2018-07-26 08:59:03', '2018-07-26 08:59:03');
INSERT INTO `admin_permissions` VALUES ('8', '订单管理', 'orders', '', '/orders*', '2018-07-26 08:59:44', '2018-07-26 08:59:44');
INSERT INTO `admin_permissions` VALUES ('9', '优惠券管理', 'coupon_codes', '', '/coupon_codes*', '2018-07-26 09:01:10', '2018-07-26 09:01:10');

-- ----------------------------
-- Table structure for `admin_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for `admin_role_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES ('1', '1', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '2', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '3', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '4', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '6', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '7', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '8', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '9', null, null);

-- ----------------------------
-- Table structure for `admin_role_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);
INSERT INTO `admin_role_users` VALUES ('2', '2', null, null);

-- ----------------------------
-- Table structure for `admin_roles`
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2018-07-19 09:27:09', '2018-07-19 09:27:09');
INSERT INTO `admin_roles` VALUES ('2', '运营', 'operator', '2018-07-19 09:47:13', '2018-07-19 09:47:13');

-- ----------------------------
-- Table structure for `admin_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$4ZdnXxV/fGLlvx0T1cMSjOMCsrxc.VbuyWoApGVH5BXK37tFFndri', 'Administrator', null, 'GjbJI9N5WmLnc9AmgUPqWp1Lns8UwfAmZvvzO4vmlVp4thkWiOx8gyJI6swI', '2018-07-19 09:27:09', '2018-07-19 09:27:09');
INSERT INTO `admin_users` VALUES ('2', 'operator', '$2y$10$NGHHHsGaIYhOh8NfxTKbfuavkjlpihB7Gwcxa.VOwjbSThtkTZfNC', '运营', null, 'MZbmGedjRKfRD6xKlzlutZeukfb3MgqSmC8QrJzUt9wKGclOATcZUBhhMoTD', '2018-07-19 09:48:44', '2018-07-19 09:48:44');

-- ----------------------------
-- Table structure for `cart_items`
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_sku_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_foreign` (`user_id`),
  KEY `cart_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `cart_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_items
-- ----------------------------

-- ----------------------------
-- Table structure for `coupon_codes`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_codes`;
CREATE TABLE `coupon_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `used` int(10) unsigned NOT NULL DEFAULT '0',
  `min_amount` decimal(10,2) NOT NULL,
  `not_before` datetime DEFAULT NULL,
  `not_after` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_codes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupon_codes
-- ----------------------------
INSERT INTO `coupon_codes` VALUES ('1', 'eveniet at alias', 'HMKQNKYQDF6BZLGK', 'percent', '7.00', '1000', '9', '0.00', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:15');
INSERT INTO `coupon_codes` VALUES ('2', 'quas et provident', 'RSXWTLDHR2ILEJUI', 'percent', '36.00', '1000', '0', '229.00', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('3', 'dolorem officia quod', 'OVEBF97DJXRVAKUU', 'percent', '10.00', '1000', '0', '804.00', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('4', 'nisi recusandae ut', 'RT8LL8U40QYFHFAC', 'percent', '15.00', '1000', '5', '0.00', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:15');
INSERT INTO `coupon_codes` VALUES ('5', 'cumque ad quae', 'CKV0XBEWTS4QHCC6', 'percent', '45.00', '1000', '0', '240.00', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('6', 'ut omnis est', '3IY8FCNR6IFU8AAT', 'percent', '39.00', '1000', '0', '925.00', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('7', 'maxime similique sit', 'P7RMRZSJJNINVQTF', 'percent', '40.00', '1000', '1', '0.00', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('8', 'autem hic qui', 'MJOSY9NTIEX5CRQZ', 'fixed', '112.00', '1000', '0', '112.01', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('9', 'commodi perferendis et', 'H4R7OBILSDTCZAV8', 'percent', '45.00', '1000', '0', '740.00', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('10', 'optio tenetur in', '1GPJ3WYTHI0LQAC4', 'percent', '43.00', '1000', '0', '531.00', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('11', 'nesciunt aut ipsum', 'U9TPCJZ2HPRSV4E1', 'percent', '8.00', '1000', '0', '118.00', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('12', 'aut asperiores voluptate', 'NX3W1VGM56UQQ9CI', 'fixed', '30.00', '1000', '0', '30.01', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('13', 'voluptatem ut eius', 'DBG249JGHQFMB2QQ', 'fixed', '163.00', '1000', '0', '163.01', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('14', 'ullam quia sapiente', 'SDI2IGEU2HQU9VFH', 'fixed', '25.00', '1000', '0', '25.01', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('15', 'distinctio consequatur voluptatem', 'VOIISDAQRVFQBE3Q', 'percent', '40.00', '1000', '4', '0.00', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:15');
INSERT INTO `coupon_codes` VALUES ('16', 'dignissimos iusto quos', 'DVDH3JM4XEUL0NAM', 'fixed', '105.00', '1000', '0', '105.01', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('17', 'eos asperiores ratione', 'DLOPB7JJOEEM3WJP', 'percent', '1.00', '1000', '4', '0.00', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:15');
INSERT INTO `coupon_codes` VALUES ('18', 'impedit adipisci ut', 'K0S8M9LDRRSSCBZU', 'percent', '23.00', '1000', '0', '758.00', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('19', 'dolor et ut', 'TW6CU0DSP8G2W3PD', 'fixed', '63.00', '1000', '0', '63.01', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `coupon_codes` VALUES ('20', 'recusandae quam id', 'Z8D07S80IZL9LGFZ', 'fixed', '186.00', '1000', '0', '186.01', null, null, '1', '2018-07-26 09:20:14', '2018-07-26 09:20:14');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_01_04_173148_create_admin_tables', '1');
INSERT INTO `migrations` VALUES ('4', '2018_07_19_071611_users_add_email_verified', '1');
INSERT INTO `migrations` VALUES ('5', '2018_07_19_081602_create_user_addresses_table', '1');
INSERT INTO `migrations` VALUES ('6', '2018_07_20_003105_create_products_table', '1');
INSERT INTO `migrations` VALUES ('7', '2018_07_20_003241_create_product_skus_table', '1');
INSERT INTO `migrations` VALUES ('8', '2018_07_20_020511_create_user_favorite_products_table', '1');
INSERT INTO `migrations` VALUES ('9', '2018_07_20_022127_create_cart_items_table', '1');
INSERT INTO `migrations` VALUES ('10', '2018_07_20_024615_create_orders_table', '1');
INSERT INTO `migrations` VALUES ('11', '2018_07_20_024752_create_order_items_table', '1');
INSERT INTO `migrations` VALUES ('12', '2018_07_26_075356_create_coupon_codes_table', '1');
INSERT INTO `migrations` VALUES ('13', '2018_07_26_075650_orders_add_coupon_code_id', '1');

-- ----------------------------
-- Table structure for `order_items`
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_sku_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES ('1', '1', '16', '46', '1', '2282.00', null, null, null);
INSERT INTO `order_items` VALUES ('2', '1', '13', '38', '4', '6363.00', null, null, null);
INSERT INTO `order_items` VALUES ('3', '2', '7', '21', '5', '3941.00', '2', 'Voluptas ipsam ea exercitationem quae laboriosam quo est.', '2018-07-25 18:29:47');
INSERT INTO `order_items` VALUES ('4', '3', '1', '1', '4', '7697.00', '4', 'Quis mollitia harum expedita esse nesciunt est ea.', '2018-07-18 22:59:34');
INSERT INTO `order_items` VALUES ('5', '4', '26', '77', '1', '3980.00', '2', 'Nihil praesentium ratione aliquid consequatur voluptate ut dolorem.', '2018-07-25 07:32:09');
INSERT INTO `order_items` VALUES ('6', '4', '6', '16', '5', '9345.00', '2', 'Nihil praesentium ratione aliquid consequatur voluptate ut dolorem.', '2018-07-25 07:32:09');
INSERT INTO `order_items` VALUES ('7', '5', '23', '69', '5', '1613.00', '1', 'Explicabo tenetur dolores quia maxime et.', '2018-07-24 02:03:27');
INSERT INTO `order_items` VALUES ('8', '6', '16', '48', '1', '4980.00', '2', 'Accusamus saepe rem esse et recusandae in sequi quas.', '2018-07-08 18:29:41');
INSERT INTO `order_items` VALUES ('9', '7', '1', '1', '5', '7697.00', '3', 'Tempora aut placeat non ipsum quisquam.', '2018-07-21 20:20:29');
INSERT INTO `order_items` VALUES ('10', '7', '7', '21', '1', '3941.00', '3', 'Tempora aut placeat non ipsum quisquam.', '2018-07-21 20:20:29');
INSERT INTO `order_items` VALUES ('11', '7', '20', '60', '4', '6540.00', '3', 'Tempora aut placeat non ipsum quisquam.', '2018-07-21 20:20:29');
INSERT INTO `order_items` VALUES ('12', '8', '2', '4', '2', '1326.00', '1', 'Ratione cum iure modi aliquam recusandae fuga.', '2018-07-19 04:42:50');
INSERT INTO `order_items` VALUES ('13', '9', '21', '63', '2', '9669.00', '3', 'Sit culpa ut similique nemo omnis.', '2018-07-18 19:27:35');
INSERT INTO `order_items` VALUES ('14', '9', '18', '52', '4', '4527.00', '3', 'Sit culpa ut similique nemo omnis.', '2018-07-18 19:27:35');
INSERT INTO `order_items` VALUES ('15', '9', '24', '71', '4', '782.00', '3', 'Sit culpa ut similique nemo omnis.', '2018-07-18 19:27:35');
INSERT INTO `order_items` VALUES ('16', '10', '16', '48', '2', '4980.00', null, null, null);
INSERT INTO `order_items` VALUES ('17', '10', '28', '82', '2', '7278.00', null, null, null);
INSERT INTO `order_items` VALUES ('18', '11', '25', '73', '3', '8686.00', '2', 'Est voluptatum enim molestiae quia velit aliquid eum.', '2018-07-22 20:37:59');
INSERT INTO `order_items` VALUES ('19', '11', '13', '38', '1', '6363.00', '2', 'Est voluptatum enim molestiae quia velit aliquid eum.', '2018-07-22 20:37:59');
INSERT INTO `order_items` VALUES ('20', '11', '23', '68', '4', '2998.00', '2', 'Est voluptatum enim molestiae quia velit aliquid eum.', '2018-07-22 20:37:59');
INSERT INTO `order_items` VALUES ('21', '12', '14', '42', '4', '8920.00', '5', 'Qui est sapiente modi sed.', '2018-07-23 00:43:34');
INSERT INTO `order_items` VALUES ('22', '13', '9', '25', '3', '8294.00', '1', 'Quia dicta facilis quam quasi maxime necessitatibus.', '2018-07-18 22:57:47');
INSERT INTO `order_items` VALUES ('23', '14', '17', '51', '3', '8309.00', null, null, null);
INSERT INTO `order_items` VALUES ('24', '14', '12', '35', '2', '3386.00', null, null, null);
INSERT INTO `order_items` VALUES ('25', '15', '2', '6', '2', '8823.00', '5', 'Voluptas qui voluptas rerum corporis ut.', '2018-07-20 10:05:31');
INSERT INTO `order_items` VALUES ('26', '15', '6', '17', '3', '9712.00', '5', 'Voluptas qui voluptas rerum corporis ut.', '2018-07-20 10:05:31');
INSERT INTO `order_items` VALUES ('27', '15', '9', '25', '3', '8294.00', '5', 'Voluptas qui voluptas rerum corporis ut.', '2018-07-20 10:05:31');
INSERT INTO `order_items` VALUES ('28', '16', '3', '7', '1', '9287.00', '3', 'Et modi voluptas hic vitae quo cupiditate dolorum.', '2018-07-22 20:12:44');
INSERT INTO `order_items` VALUES ('29', '16', '15', '44', '4', '9312.00', '3', 'Et modi voluptas hic vitae quo cupiditate dolorum.', '2018-07-22 20:12:44');
INSERT INTO `order_items` VALUES ('30', '17', '23', '69', '4', '1613.00', null, null, null);
INSERT INTO `order_items` VALUES ('31', '17', '10', '30', '1', '4529.00', null, null, null);
INSERT INTO `order_items` VALUES ('32', '18', '8', '24', '2', '310.00', null, null, null);
INSERT INTO `order_items` VALUES ('33', '18', '19', '56', '3', '4371.00', null, null, null);
INSERT INTO `order_items` VALUES ('34', '18', '8', '24', '3', '310.00', null, null, null);
INSERT INTO `order_items` VALUES ('35', '19', '28', '84', '2', '5347.00', null, null, null);
INSERT INTO `order_items` VALUES ('36', '20', '15', '43', '1', '8492.00', '5', 'Cumque nesciunt velit ut non totam possimus.', '2018-07-25 17:25:37');
INSERT INTO `order_items` VALUES ('37', '21', '17', '49', '5', '842.00', null, null, null);
INSERT INTO `order_items` VALUES ('38', '21', '3', '8', '4', '7021.00', null, null, null);
INSERT INTO `order_items` VALUES ('39', '22', '13', '37', '2', '9413.00', '3', 'Est vel totam sed soluta ad praesentium expedita.', '2018-07-17 05:49:42');
INSERT INTO `order_items` VALUES ('40', '23', '9', '27', '5', '362.00', '5', 'Nam qui exercitationem tempora accusamus et amet deleniti sint.', '2018-07-07 20:04:27');
INSERT INTO `order_items` VALUES ('41', '24', '1', '2', '1', '811.00', '5', 'Non accusamus impedit eius id reiciendis cupiditate.', '2018-07-25 02:05:06');
INSERT INTO `order_items` VALUES ('42', '24', '18', '52', '4', '4527.00', '5', 'Non accusamus impedit eius id reiciendis cupiditate.', '2018-07-25 02:05:06');
INSERT INTO `order_items` VALUES ('43', '25', '16', '48', '1', '4980.00', '4', 'Quam facilis commodi ut blanditiis quas ullam ullam.', '2018-07-25 08:27:23');
INSERT INTO `order_items` VALUES ('44', '25', '14', '40', '4', '6786.00', '4', 'Quam facilis commodi ut blanditiis quas ullam ullam.', '2018-07-25 08:27:23');
INSERT INTO `order_items` VALUES ('45', '26', '30', '88', '5', '927.00', null, null, null);
INSERT INTO `order_items` VALUES ('46', '26', '7', '21', '2', '3941.00', null, null, null);
INSERT INTO `order_items` VALUES ('47', '27', '6', '18', '2', '2390.00', null, null, null);
INSERT INTO `order_items` VALUES ('48', '27', '7', '20', '5', '4043.00', null, null, null);
INSERT INTO `order_items` VALUES ('49', '27', '28', '83', '2', '5142.00', null, null, null);
INSERT INTO `order_items` VALUES ('50', '28', '30', '88', '4', '927.00', '4', 'Consectetur totam excepturi nam et libero atque delectus.', '2018-07-19 09:51:33');
INSERT INTO `order_items` VALUES ('51', '28', '12', '36', '2', '2972.00', '4', 'Consectetur totam excepturi nam et libero atque delectus.', '2018-07-19 09:51:33');
INSERT INTO `order_items` VALUES ('52', '28', '12', '35', '1', '3386.00', '4', 'Consectetur totam excepturi nam et libero atque delectus.', '2018-07-19 09:51:33');
INSERT INTO `order_items` VALUES ('53', '29', '15', '45', '4', '9634.00', '1', 'Odio eum quisquam possimus voluptatem eos natus pariatur.', '2018-07-22 15:11:49');
INSERT INTO `order_items` VALUES ('54', '29', '6', '17', '5', '9712.00', '1', 'Odio eum quisquam possimus voluptatem eos natus pariatur.', '2018-07-22 15:11:49');
INSERT INTO `order_items` VALUES ('55', '29', '8', '24', '1', '310.00', '1', 'Odio eum quisquam possimus voluptatem eos natus pariatur.', '2018-07-22 15:11:49');
INSERT INTO `order_items` VALUES ('56', '30', '9', '25', '1', '8294.00', null, null, null);
INSERT INTO `order_items` VALUES ('57', '30', '4', '11', '1', '3859.00', null, null, null);
INSERT INTO `order_items` VALUES ('58', '30', '28', '82', '3', '7278.00', null, null, null);
INSERT INTO `order_items` VALUES ('59', '31', '21', '61', '1', '2434.00', '3', 'Nihil cumque non repellat.', '2018-07-19 02:48:31');
INSERT INTO `order_items` VALUES ('60', '31', '7', '19', '2', '594.00', '3', 'Nihil cumque non repellat.', '2018-07-19 02:48:31');
INSERT INTO `order_items` VALUES ('61', '32', '22', '66', '3', '3244.00', '5', 'Ut amet molestiae temporibus.', '2018-07-14 15:47:59');
INSERT INTO `order_items` VALUES ('62', '33', '9', '26', '1', '3986.00', '5', 'Ab beatae cumque odit sed dolorem.', '2018-07-04 00:15:14');
INSERT INTO `order_items` VALUES ('63', '34', '8', '24', '2', '310.00', '3', 'Et blanditiis unde quia nulla quasi.', '2018-07-24 00:52:34');
INSERT INTO `order_items` VALUES ('64', '34', '21', '62', '5', '9788.00', '3', 'Et blanditiis unde quia nulla quasi.', '2018-07-24 00:52:34');
INSERT INTO `order_items` VALUES ('65', '34', '30', '89', '2', '8265.00', '3', 'Et blanditiis unde quia nulla quasi.', '2018-07-24 00:52:34');
INSERT INTO `order_items` VALUES ('66', '35', '19', '56', '4', '4371.00', '5', 'Facilis ipsum alias fugit neque est nemo.', '2018-07-14 20:42:22');
INSERT INTO `order_items` VALUES ('67', '36', '28', '84', '4', '5347.00', '1', 'Ut asperiores eveniet voluptate id consequatur sint.', '2018-07-26 03:21:50');
INSERT INTO `order_items` VALUES ('68', '36', '13', '37', '2', '9413.00', '1', 'Ut asperiores eveniet voluptate id consequatur sint.', '2018-07-26 03:21:50');
INSERT INTO `order_items` VALUES ('69', '36', '15', '43', '3', '8492.00', '1', 'Ut asperiores eveniet voluptate id consequatur sint.', '2018-07-26 03:21:50');
INSERT INTO `order_items` VALUES ('70', '37', '10', '29', '3', '1319.00', '2', 'Quidem consequatur dolorem debitis.', '2018-07-09 07:01:53');
INSERT INTO `order_items` VALUES ('71', '37', '15', '43', '4', '8492.00', '2', 'Quidem consequatur dolorem debitis.', '2018-07-09 07:01:53');
INSERT INTO `order_items` VALUES ('72', '37', '12', '36', '1', '2972.00', '2', 'Quidem consequatur dolorem debitis.', '2018-07-09 07:01:53');
INSERT INTO `order_items` VALUES ('73', '38', '10', '29', '1', '1319.00', '2', 'Quo molestias velit rerum accusantium et est.', '2018-07-06 12:08:36');
INSERT INTO `order_items` VALUES ('74', '39', '7', '19', '2', '594.00', '1', 'Voluptatibus facilis blanditiis velit sit.', '2018-07-11 20:05:44');
INSERT INTO `order_items` VALUES ('75', '40', '21', '63', '3', '9669.00', '2', 'Doloribus voluptatem voluptatum molestias ut totam sit nihil.', '2018-07-21 01:29:24');
INSERT INTO `order_items` VALUES ('76', '40', '25', '73', '4', '8686.00', '2', 'Doloribus voluptatem voluptatum molestias ut totam sit nihil.', '2018-07-21 01:29:24');
INSERT INTO `order_items` VALUES ('77', '41', '8', '24', '3', '310.00', '1', 'At occaecati ullam aliquam sit harum sint exercitationem.', '2018-07-09 19:39:26');
INSERT INTO `order_items` VALUES ('78', '42', '4', '12', '3', '8029.00', '2', 'Ratione nihil totam omnis veniam.', '2018-07-14 07:09:58');
INSERT INTO `order_items` VALUES ('79', '43', '2', '4', '2', '1326.00', '3', 'Quos voluptas dignissimos optio aut nihil facilis.', '2018-07-19 13:48:55');
INSERT INTO `order_items` VALUES ('80', '44', '1', '1', '4', '7697.00', '1', 'Aut commodi iste voluptas qui assumenda.', '2018-07-15 12:13:03');
INSERT INTO `order_items` VALUES ('81', '45', '13', '37', '5', '9413.00', '2', 'Alias odio illum non.', '2018-07-25 20:29:12');
INSERT INTO `order_items` VALUES ('82', '45', '13', '37', '1', '9413.00', '2', 'Alias odio illum non.', '2018-07-25 20:29:12');
INSERT INTO `order_items` VALUES ('83', '45', '3', '7', '3', '9287.00', '2', 'Alias odio illum non.', '2018-07-25 20:29:12');
INSERT INTO `order_items` VALUES ('84', '46', '29', '86', '5', '947.00', '4', 'Quia ut officiis minus non.', '2018-07-20 22:40:25');
INSERT INTO `order_items` VALUES ('85', '46', '1', '2', '5', '811.00', '4', 'Quia ut officiis minus non.', '2018-07-20 22:40:25');
INSERT INTO `order_items` VALUES ('86', '46', '10', '28', '1', '6985.00', '4', 'Quia ut officiis minus non.', '2018-07-20 22:40:25');
INSERT INTO `order_items` VALUES ('87', '47', '17', '51', '2', '8309.00', '1', 'Quasi excepturi dolores qui hic omnis aut dolor.', '2018-07-19 22:33:50');
INSERT INTO `order_items` VALUES ('88', '47', '21', '63', '3', '9669.00', '1', 'Quasi excepturi dolores qui hic omnis aut dolor.', '2018-07-19 22:33:50');
INSERT INTO `order_items` VALUES ('89', '48', '4', '10', '4', '9500.00', null, null, null);
INSERT INTO `order_items` VALUES ('90', '48', '7', '21', '1', '3941.00', null, null, null);
INSERT INTO `order_items` VALUES ('91', '49', '21', '62', '4', '9788.00', '4', 'Iure soluta necessitatibus ratione.', '2018-07-16 11:49:24');
INSERT INTO `order_items` VALUES ('92', '50', '12', '34', '1', '8074.00', '2', 'Enim voluptatem culpa qui aspernatur laboriosam.', '2018-07-17 18:51:33');
INSERT INTO `order_items` VALUES ('93', '51', '29', '86', '5', '947.00', '3', 'Asperiores est similique praesentium quod aliquam.', '2018-07-22 14:58:04');
INSERT INTO `order_items` VALUES ('94', '51', '19', '55', '2', '4677.00', '3', 'Asperiores est similique praesentium quod aliquam.', '2018-07-22 14:58:04');
INSERT INTO `order_items` VALUES ('95', '51', '15', '43', '4', '8492.00', '3', 'Asperiores est similique praesentium quod aliquam.', '2018-07-22 14:58:04');
INSERT INTO `order_items` VALUES ('96', '52', '8', '22', '5', '2201.00', '5', 'Eos eos exercitationem neque perferendis expedita reiciendis eveniet.', '2018-07-11 13:33:28');
INSERT INTO `order_items` VALUES ('97', '53', '22', '65', '1', '7446.00', '3', 'Ut non placeat illo rerum velit aut illum.', '2018-07-19 02:36:50');
INSERT INTO `order_items` VALUES ('98', '53', '17', '50', '5', '1572.00', '3', 'Ut non placeat illo rerum velit aut illum.', '2018-07-19 02:36:50');
INSERT INTO `order_items` VALUES ('99', '53', '22', '65', '5', '7446.00', '3', 'Ut non placeat illo rerum velit aut illum.', '2018-07-19 02:36:50');
INSERT INTO `order_items` VALUES ('100', '54', '28', '83', '3', '5142.00', '1', 'Saepe distinctio debitis accusantium a expedita vel.', '2018-07-19 12:28:50');
INSERT INTO `order_items` VALUES ('101', '55', '9', '27', '5', '362.00', '2', 'Consequatur architecto omnis quia voluptate.', '2018-07-20 09:27:09');
INSERT INTO `order_items` VALUES ('102', '56', '16', '47', '1', '9446.00', '3', 'Commodi commodi in molestiae repellendus molestias.', '2018-07-11 07:21:51');
INSERT INTO `order_items` VALUES ('103', '56', '8', '23', '1', '764.00', '3', 'Commodi commodi in molestiae repellendus molestias.', '2018-07-11 07:21:51');
INSERT INTO `order_items` VALUES ('104', '56', '22', '65', '4', '7446.00', '3', 'Commodi commodi in molestiae repellendus molestias.', '2018-07-11 07:21:51');
INSERT INTO `order_items` VALUES ('105', '57', '8', '24', '4', '310.00', null, null, null);
INSERT INTO `order_items` VALUES ('106', '57', '17', '49', '4', '842.00', null, null, null);
INSERT INTO `order_items` VALUES ('107', '58', '19', '57', '5', '3349.00', '2', 'Exercitationem ex perferendis quaerat ea.', '2018-07-20 22:27:26');
INSERT INTO `order_items` VALUES ('108', '58', '29', '85', '5', '3706.00', '2', 'Exercitationem ex perferendis quaerat ea.', '2018-07-20 22:27:26');
INSERT INTO `order_items` VALUES ('109', '58', '10', '28', '4', '6985.00', '2', 'Exercitationem ex perferendis quaerat ea.', '2018-07-20 22:27:26');
INSERT INTO `order_items` VALUES ('110', '59', '30', '88', '4', '927.00', '1', 'Assumenda qui sunt est et debitis.', '2018-07-13 08:40:43');
INSERT INTO `order_items` VALUES ('111', '59', '5', '15', '3', '7393.00', '1', 'Assumenda qui sunt est et debitis.', '2018-07-13 08:40:43');
INSERT INTO `order_items` VALUES ('112', '60', '5', '14', '2', '4691.00', '4', 'Distinctio et est ducimus natus adipisci qui rem.', '2018-07-07 13:28:59');
INSERT INTO `order_items` VALUES ('113', '61', '5', '14', '4', '4691.00', '2', 'A odit iure iste ut.', '2018-07-25 05:56:56');
INSERT INTO `order_items` VALUES ('114', '62', '19', '57', '5', '3349.00', '1', 'Eligendi eius sit itaque.', '2018-07-25 10:08:10');
INSERT INTO `order_items` VALUES ('115', '62', '26', '77', '2', '3980.00', '1', 'Eligendi eius sit itaque.', '2018-07-25 10:08:10');
INSERT INTO `order_items` VALUES ('116', '63', '9', '25', '2', '8294.00', '1', 'Deserunt inventore error rerum reiciendis voluptas amet qui.', '2018-07-23 07:30:38');
INSERT INTO `order_items` VALUES ('117', '64', '11', '32', '4', '5444.00', '3', 'Natus cumque eveniet quod aliquam eveniet corrupti tempora aspernatur.', '2018-07-20 09:39:30');
INSERT INTO `order_items` VALUES ('118', '65', '15', '43', '4', '8492.00', null, null, null);
INSERT INTO `order_items` VALUES ('119', '65', '9', '27', '3', '362.00', null, null, null);
INSERT INTO `order_items` VALUES ('120', '65', '22', '64', '1', '776.00', null, null, null);
INSERT INTO `order_items` VALUES ('121', '66', '17', '49', '1', '842.00', '1', 'Iste ut tenetur necessitatibus.', '2018-07-26 05:23:46');
INSERT INTO `order_items` VALUES ('122', '67', '5', '13', '2', '204.00', '5', 'Quo aliquid perspiciatis explicabo ut nam sed et nobis.', '2018-07-21 21:07:11');
INSERT INTO `order_items` VALUES ('123', '68', '2', '5', '4', '4720.00', '1', 'Ut illo ipsam veniam eum qui et animi placeat.', '2018-07-20 07:56:54');
INSERT INTO `order_items` VALUES ('124', '68', '24', '72', '1', '5417.00', '1', 'Ut illo ipsam veniam eum qui et animi placeat.', '2018-07-20 07:56:54');
INSERT INTO `order_items` VALUES ('125', '69', '14', '42', '2', '8920.00', '1', 'Quo totam in nihil perspiciatis repellendus et.', '2018-07-03 19:27:31');
INSERT INTO `order_items` VALUES ('126', '69', '20', '58', '3', '5585.00', '1', 'Quo totam in nihil perspiciatis repellendus et.', '2018-07-03 19:27:31');
INSERT INTO `order_items` VALUES ('127', '69', '20', '58', '1', '5585.00', '1', 'Quo totam in nihil perspiciatis repellendus et.', '2018-07-03 19:27:31');
INSERT INTO `order_items` VALUES ('128', '70', '2', '6', '3', '8823.00', '1', 'Accusantium maxime exercitationem voluptatum.', '2018-07-26 03:23:14');
INSERT INTO `order_items` VALUES ('129', '70', '24', '70', '3', '1880.00', '1', 'Accusantium maxime exercitationem voluptatum.', '2018-07-26 03:23:14');
INSERT INTO `order_items` VALUES ('130', '70', '2', '6', '5', '8823.00', '1', 'Accusantium maxime exercitationem voluptatum.', '2018-07-26 03:23:14');
INSERT INTO `order_items` VALUES ('131', '71', '4', '10', '2', '9500.00', null, null, null);
INSERT INTO `order_items` VALUES ('132', '71', '25', '73', '5', '8686.00', null, null, null);
INSERT INTO `order_items` VALUES ('133', '72', '27', '80', '2', '5492.00', '2', 'Sunt illum et quibusdam.', '2018-07-25 19:07:10');
INSERT INTO `order_items` VALUES ('134', '72', '25', '74', '2', '2188.00', '2', 'Sunt illum et quibusdam.', '2018-07-25 19:07:10');
INSERT INTO `order_items` VALUES ('135', '73', '16', '48', '4', '4980.00', '3', 'Aut nulla veritatis in molestiae voluptatem temporibus architecto.', '2018-07-25 15:01:21');
INSERT INTO `order_items` VALUES ('136', '74', '1', '3', '4', '6881.00', '1', 'Quidem et autem magni praesentium qui ipsam.', '2018-07-08 01:12:29');
INSERT INTO `order_items` VALUES ('137', '74', '15', '44', '5', '9312.00', '1', 'Quidem et autem magni praesentium qui ipsam.', '2018-07-08 01:12:29');
INSERT INTO `order_items` VALUES ('138', '74', '1', '2', '5', '811.00', '1', 'Quidem et autem magni praesentium qui ipsam.', '2018-07-08 01:12:29');
INSERT INTO `order_items` VALUES ('139', '75', '25', '73', '3', '8686.00', '2', 'Eos est est amet numquam.', '2018-07-25 05:33:24');
INSERT INTO `order_items` VALUES ('140', '75', '27', '80', '5', '5492.00', '2', 'Eos est est amet numquam.', '2018-07-25 05:33:24');
INSERT INTO `order_items` VALUES ('141', '75', '30', '88', '2', '927.00', '2', 'Eos est est amet numquam.', '2018-07-25 05:33:24');
INSERT INTO `order_items` VALUES ('142', '76', '9', '25', '2', '8294.00', '3', 'Similique facere ut beatae officia.', '2018-07-15 16:23:11');
INSERT INTO `order_items` VALUES ('143', '76', '22', '65', '4', '7446.00', '3', 'Similique facere ut beatae officia.', '2018-07-15 16:23:11');
INSERT INTO `order_items` VALUES ('144', '77', '14', '42', '3', '8920.00', '4', 'Dolores mollitia velit ut alias hic.', '2018-07-08 05:51:25');
INSERT INTO `order_items` VALUES ('145', '77', '14', '42', '3', '8920.00', '4', 'Dolores mollitia velit ut alias hic.', '2018-07-08 05:51:25');
INSERT INTO `order_items` VALUES ('146', '78', '21', '63', '3', '9669.00', '3', 'Pariatur sunt eveniet aliquid animi.', '2018-07-25 08:47:56');
INSERT INTO `order_items` VALUES ('147', '78', '10', '29', '5', '1319.00', '3', 'Pariatur sunt eveniet aliquid animi.', '2018-07-25 08:47:56');
INSERT INTO `order_items` VALUES ('148', '78', '13', '38', '1', '6363.00', '3', 'Pariatur sunt eveniet aliquid animi.', '2018-07-25 08:47:56');
INSERT INTO `order_items` VALUES ('149', '79', '11', '33', '5', '797.00', null, null, null);
INSERT INTO `order_items` VALUES ('150', '79', '5', '15', '4', '7393.00', null, null, null);
INSERT INTO `order_items` VALUES ('151', '80', '3', '9', '5', '1975.00', null, null, null);
INSERT INTO `order_items` VALUES ('152', '80', '19', '56', '5', '4371.00', null, null, null);
INSERT INTO `order_items` VALUES ('153', '80', '17', '49', '4', '842.00', null, null, null);
INSERT INTO `order_items` VALUES ('154', '81', '9', '26', '2', '3986.00', '4', 'Ipsa unde numquam et aperiam est maiores ducimus assumenda.', '2018-07-23 19:01:13');
INSERT INTO `order_items` VALUES ('155', '81', '2', '6', '1', '8823.00', '4', 'Ipsa unde numquam et aperiam est maiores ducimus assumenda.', '2018-07-23 19:01:13');
INSERT INTO `order_items` VALUES ('156', '82', '29', '86', '4', '947.00', '2', 'Enim placeat sed esse et officiis.', '2018-07-23 07:05:05');
INSERT INTO `order_items` VALUES ('157', '82', '8', '22', '3', '2201.00', '2', 'Enim placeat sed esse et officiis.', '2018-07-23 07:05:05');
INSERT INTO `order_items` VALUES ('158', '82', '16', '47', '1', '9446.00', '2', 'Enim placeat sed esse et officiis.', '2018-07-23 07:05:05');
INSERT INTO `order_items` VALUES ('159', '83', '4', '11', '3', '3859.00', '4', 'Iusto sit ea earum quis enim accusamus fuga.', '2018-07-19 07:37:04');
INSERT INTO `order_items` VALUES ('160', '83', '12', '36', '2', '2972.00', '4', 'Iusto sit ea earum quis enim accusamus fuga.', '2018-07-19 07:37:04');
INSERT INTO `order_items` VALUES ('161', '84', '20', '59', '2', '8018.00', '3', 'Occaecati aut perferendis non sapiente.', '2018-07-24 06:26:49');
INSERT INTO `order_items` VALUES ('162', '84', '17', '49', '2', '842.00', '3', 'Occaecati aut perferendis non sapiente.', '2018-07-24 06:26:49');
INSERT INTO `order_items` VALUES ('163', '84', '24', '72', '3', '5417.00', '3', 'Occaecati aut perferendis non sapiente.', '2018-07-24 06:26:49');
INSERT INTO `order_items` VALUES ('164', '85', '8', '24', '2', '310.00', '3', 'Optio placeat eos placeat.', '2018-07-03 18:07:56');
INSERT INTO `order_items` VALUES ('165', '85', '28', '83', '1', '5142.00', '3', 'Optio placeat eos placeat.', '2018-07-03 18:07:56');
INSERT INTO `order_items` VALUES ('166', '86', '12', '34', '2', '8074.00', '5', 'Labore corporis blanditiis quia iusto asperiores.', '2018-07-21 00:51:59');
INSERT INTO `order_items` VALUES ('167', '87', '4', '12', '4', '8029.00', '1', 'Culpa nesciunt unde optio odit.', '2018-07-20 18:59:43');
INSERT INTO `order_items` VALUES ('168', '87', '3', '8', '5', '7021.00', '1', 'Culpa nesciunt unde optio odit.', '2018-07-20 18:59:43');
INSERT INTO `order_items` VALUES ('169', '88', '11', '33', '4', '797.00', '2', 'Minus tempore quam porro et eum.', '2018-07-23 18:22:07');
INSERT INTO `order_items` VALUES ('170', '89', '22', '64', '3', '776.00', '1', 'Quae sed vel ad porro soluta aut et aliquid.', '2018-07-07 19:35:07');
INSERT INTO `order_items` VALUES ('171', '90', '28', '84', '1', '5347.00', '1', 'Amet nostrum voluptatum quam delectus occaecati veritatis quia.', '2018-07-26 04:50:57');
INSERT INTO `order_items` VALUES ('172', '91', '7', '21', '4', '3941.00', null, null, null);
INSERT INTO `order_items` VALUES ('173', '91', '8', '24', '5', '310.00', null, null, null);
INSERT INTO `order_items` VALUES ('174', '92', '22', '64', '3', '776.00', '4', 'Reprehenderit nam est qui voluptatum et labore.', '2018-07-11 06:23:15');
INSERT INTO `order_items` VALUES ('175', '93', '22', '66', '2', '3244.00', null, null, null);
INSERT INTO `order_items` VALUES ('176', '93', '8', '22', '3', '2201.00', null, null, null);
INSERT INTO `order_items` VALUES ('177', '94', '8', '22', '4', '2201.00', '2', 'Officia dolor dolorum itaque voluptatem perspiciatis id sit.', '2018-07-17 03:02:49');
INSERT INTO `order_items` VALUES ('178', '95', '6', '18', '3', '2390.00', null, null, null);
INSERT INTO `order_items` VALUES ('179', '95', '17', '51', '3', '8309.00', null, null, null);
INSERT INTO `order_items` VALUES ('180', '95', '22', '66', '1', '3244.00', null, null, null);
INSERT INTO `order_items` VALUES ('181', '96', '2', '4', '3', '1326.00', null, null, null);
INSERT INTO `order_items` VALUES ('182', '96', '3', '7', '3', '9287.00', null, null, null);
INSERT INTO `order_items` VALUES ('183', '97', '28', '84', '4', '5347.00', null, null, null);
INSERT INTO `order_items` VALUES ('184', '97', '6', '16', '5', '9345.00', null, null, null);
INSERT INTO `order_items` VALUES ('185', '97', '2', '6', '5', '8823.00', null, null, null);
INSERT INTO `order_items` VALUES ('186', '98', '12', '36', '3', '2972.00', '4', 'Est dolores et exercitationem dolor.', '2018-07-20 07:57:23');
INSERT INTO `order_items` VALUES ('187', '98', '6', '16', '3', '9345.00', '4', 'Est dolores et exercitationem dolor.', '2018-07-20 07:57:23');
INSERT INTO `order_items` VALUES ('188', '99', '5', '15', '4', '7393.00', '2', 'Ut architecto officia sequi repellat voluptatem laboriosam sed adipisci.', '2018-07-24 03:32:51');
INSERT INTO `order_items` VALUES ('189', '100', '1', '3', '5', '6881.00', null, null, null);
INSERT INTO `order_items` VALUES ('190', '100', '30', '88', '2', '927.00', null, null, null);
INSERT INTO `order_items` VALUES ('191', '101', '1', '2', '1', '811.00', null, null, null);

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `paid_at` datetime DEFAULT NULL,
  `coupon_code_id` int(10) unsigned DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `refund_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `ship_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ship_data` text COLLATE utf8mb4_unicode_ci,
  `extra` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_no_unique` (`no`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_coupon_code_id_foreign` (`coupon_code_id`),
  CONSTRAINT `orders_coupon_code_id_foreign` FOREIGN KEY (`coupon_code_id`) REFERENCES `coupon_codes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '20180726092015271689', '8', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c22\\u8857\\u9053\\u7b2c289\\u53f7\",\"zip\":628400,\"contact_name\":\"\\u51b7\\u7965\",\"contact_phone\":\"13995645759\"}', '25792.62', 'Voluptas architecto voluptas aperiam aperiam voluptates sit.', '2018-07-24 00:03:54', '1', 'wechat', 'd129d67b-bbe5-3169-9845-c0704a96af4e', 'pending', null, '0', '0', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('2', '20180726092015013690', '42', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c92\\u8857\\u9053\\u7b2c907\\u53f7\",\"zip\":581900,\"contact_name\":\"\\u5411\\u5609\",\"contact_phone\":\"18449566821\"}', '19705.00', 'Ducimus vitae et rerum soluta sapiente voluptatem.', '2018-07-25 09:53:29', null, 'wechat', 'ce3b0613-f6ad-3196-8292-9cedce6c9a49', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u6bd5\\u535a\\u8bda\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"6d164d43-eaca-3776-87a9-780ffd66b82a\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('3', '20180726092015365453', '69', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c97\\u8857\\u9053\\u7b2c50\\u53f7\",\"zip\":163300,\"contact_name\":\"\\u4ef2\\u5a77\\u5a77\",\"contact_phone\":\"14567579983\"}', '30788.00', 'Laudantium nemo aut consectetur necessitatibus.', '2018-07-18 09:48:19', null, 'wechat', 'b52b2f60-0f50-33a4-b61e-49d44fb8e9b9', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('4', '20180726092015947566', '64', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c14\\u8857\\u9053\\u7b2c864\\u53f7\",\"zip\":34300,\"contact_name\":\"\\u53f2\\u6d0b\",\"contact_phone\":\"17065497538\"}', '50705.00', 'Natus neque tempora ducimus dolores.', '2018-07-20 00:39:18', null, 'wechat', '21429fb4-6ba1-3f3e-a18f-ce362441ebce', 'success', 'c682352fd7f24ccfb508280629504689', '0', '1', 'pending', null, '{\"refund_reason\":\"Recusandae qui consectetur dolore quia corporis error.\"}', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('5', '20180726092015780243', '95', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c90\\u8857\\u9053\\u7b2c591\\u53f7\",\"zip\":106900,\"contact_name\":\"\\u8881\\u5efa\\u5e73\",\"contact_phone\":\"15097243529\"}', '8065.00', 'Et perspiciatis accusantium nemo unde.', '2018-06-28 22:27:16', null, 'wechat', '7cf26158-3439-32bf-a37e-25bb98c816b0', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('6', '20180726092015920511', '30', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c73\\u8857\\u9053\\u7b2c890\\u53f7\",\"zip\":525600,\"contact_name\":\"\\u90dc\\u6797\",\"contact_phone\":\"15212478758\"}', '4980.00', 'Repellendus et blanditiis dolores.', '2018-07-06 19:23:49', null, 'wechat', '3cd6907b-70e4-36e7-a123-e83a47db4dc8', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u6602\\u6b4c\\u4fe1\\u606f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"9040f954-51d2-3ab9-a5f9-1c242b586af5\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('7', '20180726092015190928', '13', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c42\\u8857\\u9053\\u7b2c281\\u53f7\",\"zip\":801700,\"contact_name\":\"\\u7fdf\\u6b23\",\"contact_phone\":\"14528558695\"}', '68586.00', 'Modi voluptatibus ipsum voluptas dolores delectus voluptatem inventore.', '2018-07-04 18:06:56', null, 'wechat', '1e577de5-cc10-3fff-86d0-b27dc11d7981', 'success', 'ef01d29bc8a44ddabd80b1ff8b2fb721', '0', '1', 'delivered', '{\"express_company\":\"\\u5546\\u8f6f\\u51a0\\u8054\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"ef3631dc-6e26-35eb-8f09-17b010d940ad\"}', '{\"refund_reason\":\"Eveniet aliquid sed nostrum.\"}', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('8', '20180726092015475240', '100', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c66\\u8857\\u9053\\u7b2c348\\u53f7\",\"zip\":77400,\"contact_name\":\"\\u5170\\u5fd7\\u52c7\",\"contact_phone\":\"18932078490\"}', '2652.00', 'Optio iusto odio et quisquam sit ut esse maiores.', '2018-07-05 15:25:47', null, 'alipay', 'aad69e44-1104-3fd8-a00c-dd2ae11df1e2', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('9', '20180726092015598416', '57', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c29\\u8857\\u9053\\u7b2c780\\u53f7\",\"zip\":656200,\"contact_name\":\"\\u76d6\\u745c\",\"contact_phone\":\"13370776430\"}', '40574.00', 'Quas dolor et sint.', '2018-07-10 04:50:28', null, 'wechat', '5afcc49e-b0e5-3e2f-8155-6d145d5d09fd', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u51cc\\u9896\\u4fe1\\u606f\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"ca3294c3-0ad6-3bac-af09-e0e1dc9145a5\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('10', '20180726092015420137', '87', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c53\\u8857\\u9053\\u7b2c628\\u53f7\",\"zip\":501800,\"contact_name\":\"\\u67f3\\u7389\\u82f1\",\"contact_phone\":\"17087526325\"}', '24516.00', 'Esse quod aut fugit et odio ipsum ipsa a.', '2018-07-22 00:42:33', null, 'alipay', '38f7a539-b592-364c-b3ce-2702a9233b3d', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u4e5d\\u65b9\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"367a258c-fe19-34b5-ae26-336e4dc438e7\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('11', '20180726092015517667', '8', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c22\\u8857\\u9053\\u7b2c289\\u53f7\",\"zip\":628400,\"contact_name\":\"\\u51b7\\u7965\",\"contact_phone\":\"13995645759\"}', '44413.00', 'Et saepe enim voluptatem sit.', '2018-07-10 06:22:50', null, 'alipay', '222debe7-bf48-333b-8a9d-9dc314d7ba09', 'success', '486e6af0c32f4281a74c47d14ebc46b7', '0', '1', 'delivered', '{\"express_company\":\"\\u8054\\u901a\\u65f6\\u79d1\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"5cc11166-d0fc-3dba-af1a-1e92c1104cde\"}', '{\"refund_reason\":\"Nobis sapiente mollitia consequuntur et dolorum corrupti.\"}', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('12', '20180726092015722292', '4', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c9\\u8857\\u9053\\u7b2c88\\u53f7\",\"zip\":362800,\"contact_name\":\"\\u4ec7\\u4f26\",\"contact_phone\":\"18593277417\"}', '35680.00', 'Est voluptatem et ullam ut unde ipsa blanditiis.', '2018-07-22 15:42:53', null, 'wechat', 'bc5aab02-23b7-3884-91a9-e382b624ffa6', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u5546\\u8f6f\\u51a0\\u8054\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"fa8f33cb-161a-367c-9376-7702acf1ac6d\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('13', '20180726092015355091', '11', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c64\\u8857\\u9053\\u7b2c322\\u53f7\",\"zip\":213300,\"contact_name\":\"\\u6b66\\u6d0b\",\"contact_phone\":\"15890676315\"}', '21149.70', 'Ullam voluptatem repudiandae sunt perferendis harum consequatur ut qui.', '2018-07-07 05:19:24', '4', 'alipay', '50b85baf-df49-3ade-bd54-0ecba5c5b3dc', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u6bd5\\u535a\\u8bda\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"2784ae18-f9b4-32fb-8b78-298e145bdbb9\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('14', '20180726092015579338', '17', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c77\\u8857\\u9053\\u7b2c131\\u53f7\",\"zip\":724200,\"contact_name\":\"\\u7ae5\\u5e06\",\"contact_phone\":\"18778494453\"}', '31699.00', 'Quibusdam libero deleniti atque est labore sed atque.', '2018-07-26 06:37:34', null, 'alipay', '83ce4ac2-2f74-318a-93cd-0c005c84bb8b', 'pending', null, '0', '0', 'delivered', '{\"express_company\":\"\\u56fe\\u9f99\\u4fe1\\u606f\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"817e3b37-f32d-3953-a074-09063b4d1c23\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('15', '20180726092015811029', '78', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c79\\u8857\\u9053\\u7b2c570\\u53f7\",\"zip\":528000,\"contact_name\":\"\\u6613\\u6bc5\",\"contact_phone\":\"15386116828\"}', '71664.00', 'Tempore ab libero ipsum tempore quia.', '2018-07-18 12:08:57', null, 'wechat', 'b4eb075b-ccdc-3400-8c3f-0825294c852f', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u6069\\u608c\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"247ed822-cec5-37b4-b9bd-30c22d99b866\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('16', '20180726092015278501', '45', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c57\\u8857\\u9053\\u7b2c676\\u53f7\",\"zip\":578100,\"contact_name\":\"\\u6d2a\\u6b63\\u8bda\",\"contact_phone\":\"18417657241\"}', '46535.00', 'Nihil rem iste ut quisquam et nisi.', '2018-07-11 18:13:58', null, 'alipay', 'da19bfad-bd33-374b-9408-25636d39df28', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u534e\\u8fdc\\u8f6f\\u4ef6\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"b51b4ff1-03dd-3c40-a58d-754f59597c52\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('17', '20180726092015652541', '14', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c89\\u8857\\u9053\\u7b2c60\\u53f7\",\"zip\":516600,\"contact_name\":\"\\u4ef2\\u6842\\u82f1\",\"contact_phone\":\"18927888331\"}', '10212.33', 'Voluptate eius ut qui qui molestias.', '2018-07-01 22:11:04', '1', 'alipay', '8f3faf76-eeed-31ec-808c-c079bcdb8d98', 'pending', null, '0', '0', 'delivered', '{\"express_company\":\"\\u9ec4\\u77f3\\u91d1\\u627f\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"05612f81-2511-3786-8beb-e56468c6bbd1\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('18', '20180726092015782652', '27', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c7\\u8857\\u9053\\u7b2c93\\u53f7\",\"zip\":357200,\"contact_name\":\"\\u6a0a\\u6625\\u6885\",\"contact_phone\":\"18416860396\"}', '14663.00', 'Beatae doloremque voluptates sint numquam blanditiis non libero dolores.', '2018-07-15 20:57:12', null, 'alipay', 'b2b25cd0-7c54-30f3-8c11-9df31b23e24b', 'pending', null, '0', '0', 'delivered', '{\"express_company\":\"\\u601d\\u4f18\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"7e527a49-3c4a-3b05-95f4-2200fc79b6d6\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('19', '20180726092015775223', '32', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c62\\u8857\\u9053\\u7b2c485\\u53f7\",\"zip\":197300,\"contact_name\":\"\\u5168\\u96f7\",\"contact_phone\":\"17696770084\"}', '10694.00', 'Ipsum porro quia est nihil.', '2018-07-11 03:13:06', null, 'alipay', '85f3cf02-ba5e-3443-95fe-299e72311ba0', 'pending', null, '0', '0', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('20', '20180726092015577526', '69', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c97\\u8857\\u9053\\u7b2c50\\u53f7\",\"zip\":163300,\"contact_name\":\"\\u4ef2\\u5a77\\u5a77\",\"contact_phone\":\"14567579983\"}', '8492.00', 'Sed saepe qui incidunt sit cumque voluptatum quia.', '2018-07-14 00:00:09', null, 'alipay', '064e1d5c-2b76-3970-8cc4-cef893c0caf2', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:16');
INSERT INTO `orders` VALUES ('21', '20180726092015933160', '26', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c63\\u8857\\u9053\\u7b2c265\\u53f7\",\"zip\":747400,\"contact_name\":\"\\u6851\\u6667\",\"contact_phone\":\"17794116161\"}', '32294.00', 'Deleniti et sequi dolor dicta.', '2018-07-24 09:49:05', null, 'wechat', '5774b7f1-56e5-3d52-aa78-0b50ca35f490', 'pending', null, '0', '0', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('22', '20180726092015016713', '11', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c64\\u8857\\u9053\\u7b2c322\\u53f7\",\"zip\":213300,\"contact_name\":\"\\u6b66\\u6d0b\",\"contact_phone\":\"15890676315\"}', '18637.74', 'Quidem deleniti sit unde consequatur molestias.', '2018-06-29 18:48:31', '17', 'wechat', '15a98f71-cf87-3e4e-a944-374142b5aa3a', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u946b\\u535a\\u817e\\u98de\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"70a51c17-46a5-3a6a-8694-d550fde5c189\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('23', '20180726092015810949', '55', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c72\\u8857\\u9053\\u7b2c740\\u53f7\",\"zip\":182100,\"contact_name\":\"\\u5e9e\\u6dd1\\u5170\",\"contact_phone\":\"14553463374\"}', '1086.00', 'At labore cum fugiat consequatur molestias fugiat.', '2018-07-06 00:53:24', '7', 'wechat', '2939e401-4504-3dc3-aa12-a31aee93ceec', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('24', '20180726092015693941', '79', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c4\\u8857\\u9053\\u7b2c775\\u53f7\",\"zip\":762600,\"contact_name\":\"\\u5b63\\u7389\\u5170\",\"contact_phone\":\"17005091081\"}', '18919.00', 'Error et et atque earum voluptas.', '2018-07-23 08:36:55', null, 'alipay', '22f11f33-5f3b-3781-bf8f-32450ab152c5', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u65f6\\u7a7a\\u76d2\\u6570\\u5b57\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"a51ebbd6-ea15-3c04-bcf4-2e6ee9ec4fc5\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('25', '20180726092015366653', '50', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c59\\u8857\\u9053\\u7b2c229\\u53f7\",\"zip\":374400,\"contact_name\":\"\\u8fdf\\u7434\",\"contact_phone\":\"13846896412\"}', '32124.00', 'Architecto facere aperiam omnis harum magnam ipsum dolores.', '2018-07-06 04:23:38', null, 'wechat', 'b3e61a21-d736-3310-99bb-a9019aa2e7cb', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u4e03\\u559c\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"98364e65-cd36-30bf-9f4f-c8e9c42f7f7e\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('26', '20180726092015815963', '42', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c98\\u8857\\u9053\\u7b2c48\\u53f7\",\"zip\":204700,\"contact_name\":\"\\u5180\\u5b50\\u5b89\",\"contact_phone\":\"15666278158\"}', '12517.00', 'Quis quia qui esse inventore odio.', '2018-07-19 22:25:07', null, 'wechat', '22f45dd6-ec25-3a00-983e-cb799edee74c', 'pending', null, '0', '0', 'delivered', '{\"express_company\":\"\\u540c\\u5174\\u4e07\\u70b9\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"8f7f2555-dc07-37ea-bcaa-cc3ebb4c08c0\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('27', '20180726092015488567', '11', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c64\\u8857\\u9053\\u7b2c322\\u53f7\",\"zip\":213300,\"contact_name\":\"\\u6b66\\u6d0b\",\"contact_phone\":\"15890676315\"}', '32809.47', 'Possimus ipsum vitae corporis tempore laboriosam.', '2018-07-11 09:31:22', '1', 'wechat', 'a4953f09-4f50-3b84-ba8e-01f8b84ea1b5', 'pending', null, '0', '0', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('28', '20180726092015789132', '22', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c78\\u8857\\u9053\\u7b2c408\\u53f7\",\"zip\":15800,\"contact_name\":\"\\u90ed\\u9e4f\\u7a0b\",\"contact_phone\":\"17054655728\"}', '12907.62', 'Est ut voluptatem quas.', '2018-07-16 10:38:46', '17', 'alipay', '81420845-7a5a-347b-9b44-5956159d5a44', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u521b\\u4ebf\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"4f575ce9-4488-3b63-961a-1b9a7acee541\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('29', '20180726092015377966', '53', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c47\\u8857\\u9053\\u7b2c61\\u53f7\",\"zip\":58700,\"contact_name\":\"\\u7afa\\u6668\",\"contact_phone\":\"18740793637\"}', '81287.58', 'Molestias dolores consequatur unde esse ea debitis.', '2018-07-22 01:50:53', '1', 'wechat', 'd50761eb-f677-308f-976e-46fa7a8db4db', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('30', '20180726092015457896', '44', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c46\\u8857\\u9053\\u7b2c531\\u53f7\",\"zip\":612600,\"contact_name\":\"\\u5f20\\u5efa\",\"contact_phone\":\"15527103820\"}', '33987.00', 'Dolor at reprehenderit odit rem cum.', '2018-07-16 08:56:25', null, 'wechat', 'aa63adc2-6984-3be1-942c-b17b08fb339c', 'pending', null, '0', '0', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('31', '20180726092015094274', '8', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c22\\u8857\\u9053\\u7b2c289\\u53f7\",\"zip\":628400,\"contact_name\":\"\\u51b7\\u7965\",\"contact_phone\":\"13995645759\"}', '3622.00', 'Blanditiis deserunt consequatur dolore nihil dicta nulla.', '2018-07-18 05:48:42', null, 'wechat', '4517d7ad-20bd-3c0d-aa72-4d2db8c27963', 'success', 'a52804269af34ce097b40c64d265c021', '0', '1', 'pending', null, '{\"refund_reason\":\"Nesciunt minima modi accusantium velit sed praesentium.\"}', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('32', '20180726092015358020', '54', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c74\\u8857\\u9053\\u7b2c365\\u53f7\",\"zip\":82500,\"contact_name\":\"\\u962e\\u5029\",\"contact_phone\":\"13234320013\"}', '9732.00', 'Quia repellendus et omnis consequatur doloribus.', '2018-07-05 08:31:17', null, 'alipay', 'efd03ba8-42dc-3dfe-8285-0740b14d9843', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u6613\\u52a8\\u529b\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"3acfb17c-024d-3df9-974e-49872c61f1f9\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('33', '20180726092015052524', '73', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c4\\u8857\\u9053\\u7b2c766\\u53f7\",\"zip\":471600,\"contact_name\":\"\\u5f90\\u5fd7\\u65b0\",\"contact_phone\":\"13699225347\"}', '3986.00', 'Quibusdam qui doloribus quis qui.', '2018-06-29 15:28:32', null, 'wechat', '5ff6ea13-1183-3426-b0dc-8f2426454814', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u53cc\\u654f\\u7535\\u5b50\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"0a8a16eb-5bfb-34b1-8879-29139eff415d\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('34', '20180726092015470019', '83', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c56\\u8857\\u9053\\u7b2c841\\u53f7\",\"zip\":731000,\"contact_name\":\"\\u865e\\u9759\",\"contact_phone\":\"15235057792\"}', '66090.00', 'Fugit rerum vero impedit repellendus in.', '2018-07-18 18:22:03', null, 'alipay', 'af3d11f6-d2e3-3a4c-81ee-01638eb9ba55', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('35', '20180726092015215961', '96', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c1\\u8857\\u9053\\u7b2c172\\u53f7\",\"zip\":656900,\"contact_name\":\"\\u9a6c\\u4f73\",\"contact_phone\":\"18445375623\"}', '17484.00', 'Qui voluptas autem aut veritatis.', '2018-07-03 06:26:41', null, 'wechat', '5cb3cf7c-efb3-38be-82a9-d0cc44fb895d', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u5357\\u5eb7\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"c74bef0e-baa7-39f7-ad0d-2ee7402ab797\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('36', '20180726092015557911', '16', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c556\\u53f7\",\"zip\":788500,\"contact_name\":\"\\u4ec7\\u7389\",\"contact_phone\":\"13359827196\"}', '61091.70', 'Aut iusto ea eum at.', '2018-07-23 22:52:52', '1', 'alipay', '498533db-c96c-30bb-bbfa-8719e48837ab', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('37', '20180726092015763354', '79', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c4\\u8857\\u9053\\u7b2c775\\u53f7\",\"zip\":762600,\"contact_name\":\"\\u5b63\\u7389\\u5170\",\"contact_phone\":\"17005091081\"}', '40897.00', 'Voluptates accusamus et voluptates voluptates.', '2018-07-03 15:43:29', null, 'alipay', 'bffbaa84-7eb6-35e4-8b88-4bde22612f70', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u8d8b\\u52bf\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"81df80fc-647c-348f-a486-5759fd3f4aea\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('38', '20180726092015946177', '20', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c36\\u8857\\u9053\\u7b2c392\\u53f7\",\"zip\":525300,\"contact_name\":\"\\u8f9c\\u6021\",\"contact_phone\":\"15198580231\"}', '1226.67', 'Dolor qui repudiandae consectetur numquam possimus ut reiciendis.', '2018-06-27 10:45:57', '1', 'alipay', 'e0f4cf77-0ada-3dac-98ca-22818130e58d', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u6613\\u52a8\\u529b\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"61d5ae19-a66b-3e99-b973-e80f313df586\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('39', '20180726092015955698', '6', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c79\\u8857\\u9053\\u7b2c475\\u53f7\",\"zip\":276900,\"contact_name\":\"\\u5c60\\u79c0\\u82b3\",\"contact_phone\":\"15012555765\"}', '1188.00', 'Sunt ut unde excepturi sed est eaque.', '2018-07-04 08:36:51', null, 'wechat', 'd10a2adb-a0ff-337c-b0cf-3fbbf6dba0dd', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('40', '20180726092015881949', '62', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c75\\u8857\\u9053\\u7b2c989\\u53f7\",\"zip\":456200,\"contact_name\":\"\\u90b8\\u6842\\u82b3\",\"contact_phone\":\"17192267822\"}', '63751.00', 'Ipsum sequi repellendus asperiores animi est minima.', '2018-07-15 20:27:54', null, 'alipay', '4be6dabb-97d5-3246-92ba-fe5cf2d7b448', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u601d\\u4f18\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"f8438b6d-8a68-3159-b7f2-9381d34e49ed\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('41', '20180726092015549047', '27', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c7\\u8857\\u9053\\u7b2c93\\u53f7\",\"zip\":357200,\"contact_name\":\"\\u6a0a\\u6625\\u6885\",\"contact_phone\":\"18416860396\"}', '930.00', 'Sit quas molestias sunt error.', '2018-06-28 00:19:57', null, 'alipay', 'd790bc0a-cade-3e32-b7dc-f78e4fa53891', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u5929\\u5f00\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"13cfdc8a-cda2-39b5-8e21-1044ddd2c085\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('42', '20180726092015395606', '14', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c19\\u8857\\u9053\\u7b2c507\\u53f7\",\"zip\":546200,\"contact_name\":\"\\u5353\\u535a\",\"contact_phone\":\"13965724730\"}', '24087.00', 'Omnis sint voluptatum quis dolore.', '2018-07-10 08:24:53', null, 'wechat', '0bd3268b-8619-318c-aa79-6f9dd5f74cf0', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u56fd\\u8baf\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"4a8be23f-cfda-31fd-b806-07d18aaafbc4\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('43', '20180726092015334001', '100', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c66\\u8857\\u9053\\u7b2c348\\u53f7\",\"zip\":77400,\"contact_name\":\"\\u5170\\u5fd7\\u52c7\",\"contact_phone\":\"18932078490\"}', '2652.00', 'Aliquam nisi consectetur et dolor numquam debitis quo et.', '2018-07-05 12:51:31', null, 'alipay', '942d1008-942e-3087-b69e-64638eb13c34', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u5408\\u8054\\u7535\\u5b50\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"9582d1b9-f05a-3547-95ed-57050ad7929a\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('44', '20180726092015637775', '87', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c53\\u8857\\u9053\\u7b2c628\\u53f7\",\"zip\":501800,\"contact_name\":\"\\u67f3\\u7389\\u82f1\",\"contact_phone\":\"17087526325\"}', '30480.12', 'Est dolorum sit doloribus labore aut id.', '2018-07-05 18:40:58', '17', 'alipay', '5e4b188c-d9d7-3989-8279-9e5c2b75f9db', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('45', '20180726092015396608', '57', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c60\\u8857\\u9053\\u7b2c643\\u53f7\",\"zip\":652900,\"contact_name\":\"\\u8881\\u5fd7\\u5f3a\",\"contact_phone\":\"18160481798\"}', '84339.00', 'Aut fuga natus et fuga.', '2018-07-24 08:31:09', null, 'alipay', '096e09ce-82e2-3454-8431-75674fcc1855', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('46', '20180726092015035929', '82', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c22\\u8857\\u9053\\u7b2c296\\u53f7\",\"zip\":133100,\"contact_name\":\"\\u6c64\\u7389\\u5170\",\"contact_phone\":\"13558477488\"}', '14670.75', 'Autem ut omnis voluptatibus.', '2018-07-16 20:12:42', '1', 'wechat', '88883f24-cc28-3bfe-ab08-7e3a831bc9e3', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u8fea\\u6469\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"9062bef8-d71d-35ff-b8d9-2695b77a17a7\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('47', '20180726092015184610', '51', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c46\\u8857\\u9053\\u7b2c345\\u53f7\",\"zip\":346800,\"contact_name\":\"\\u660e\\u840d\",\"contact_phone\":\"17025884757\"}', '45625.00', 'Eos ratione repellat porro ipsam ad tempore.', '2018-07-11 15:13:34', null, 'alipay', '36c4867e-eb58-38c1-b9c5-7a320405f78b', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u5bcc\\u7f73\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"df4432e0-f743-3885-9463-d093650bac74\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('48', '20180726092015574902', '25', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c34\\u8857\\u9053\\u7b2c655\\u53f7\",\"zip\":734100,\"contact_name\":\"\\u5510\\u7ffc\",\"contact_phone\":\"13806949879\"}', '41521.59', 'Doloremque in adipisci placeat dolorem quam.', '2018-07-20 23:57:04', '17', 'wechat', '26264953-08d7-3c08-81cd-fb1f31dec77e', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u946b\\u535a\\u817e\\u98de\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"0fd259df-caf5-34ba-a471-500e44efd76f\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('49', '20180726092015683679', '20', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c36\\u8857\\u9053\\u7b2c392\\u53f7\",\"zip\":525300,\"contact_name\":\"\\u8f9c\\u6021\",\"contact_phone\":\"15198580231\"}', '39152.00', 'Repellat sequi consequatur sit id architecto.', '2018-06-29 21:57:25', null, 'alipay', 'b48c42b4-17b5-3275-b403-01ea5a12c932', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('50', '20180726092015371339', '51', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c46\\u8857\\u9053\\u7b2c345\\u53f7\",\"zip\":346800,\"contact_name\":\"\\u660e\\u840d\",\"contact_phone\":\"17025884757\"}', '8074.00', 'Quo et veritatis commodi beatae occaecati et consequatur.', '2018-07-04 18:36:11', null, 'wechat', '5c6f7cf8-b50e-31ff-b7fd-9bcd2e03a820', 'success', 'ac06fec62a634f7b9dc7813e63ec99b6', '0', '1', 'pending', null, '{\"refund_reason\":\"Aspernatur qui sequi assumenda quisquam ut quae.\"}', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('51', '20180726092015195518', '75', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c7\\u8857\\u9053\\u7b2c936\\u53f7\",\"zip\":136800,\"contact_name\":\"\\u5321\\u9f99\",\"contact_phone\":\"18481188583\"}', '48057.00', 'Sit non et facere quia.', '2018-07-17 20:48:17', null, 'wechat', 'c13dfbd7-b9c4-39f3-96f5-03f3232ec7f0', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u5feb\\u8baf\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"c48d31d0-2405-3164-9523-41fe02e47729\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('52', '20180726092015801876', '24', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c47\\u8857\\u9053\\u7b2c936\\u53f7\",\"zip\":715900,\"contact_name\":\"\\u5f6d\\u7389\\u73cd\",\"contact_phone\":\"13913888861\"}', '11005.00', 'Ut aut est quaerat corporis et et beatae sunt.', '2018-07-02 07:42:25', null, 'alipay', '1882a52e-bdc9-38fe-95bf-13bfa325c76d', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('53', '20180726092015793446', '49', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c85\\u8857\\u9053\\u7b2c91\\u53f7\",\"zip\":615100,\"contact_name\":\"\\u4e8e\\u4e3d\",\"contact_phone\":\"17074708157\"}', '52536.00', 'Cumque dolor similique quam debitis quia nemo tempora dolorum.', '2018-07-14 17:40:10', null, 'wechat', 'a9f83d3b-f372-31ac-94d8-528235122e03', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u7f51\\u65b0\\u6052\\u5929\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"6617caff-c169-3899-9d5b-b282df6ed3ca\"}', '[]', '2018-07-26 09:20:15', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('54', '20180726092016305290', '8', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c22\\u8857\\u9053\\u7b2c289\\u53f7\",\"zip\":628400,\"contact_name\":\"\\u51b7\\u7965\",\"contact_phone\":\"13995645759\"}', '15426.00', 'Numquam excepturi vitae eveniet tenetur hic ipsum.', '2018-07-10 07:29:10', null, 'wechat', '9c9767f3-0945-3a8f-9869-c2dc9d4364a4', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u6069\\u608c\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"afc79a5e-056a-3d84-a2c7-d7e8da00ddc3\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:17');
INSERT INTO `orders` VALUES ('55', '20180726092016114004', '37', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c11\\u8857\\u9053\\u7b2c866\\u53f7\",\"zip\":587100,\"contact_name\":\"\\u8d75\\u535a\",\"contact_phone\":\"15363988315\"}', '1538.50', 'Odio sint neque doloremque nam quaerat.', '2018-07-09 16:40:30', '4', 'alipay', 'feddf709-3816-349c-843a-ef6382ac3273', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('56', '20180726092016290746', '28', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c91\\u8857\\u9053\\u7b2c652\\u53f7\",\"zip\":578800,\"contact_name\":\"\\u6e29\\u5b50\\u5b89\",\"contact_phone\":\"13135086725\"}', '39994.00', 'Similique nostrum qui quaerat enim perferendis non sed.', '2018-07-11 01:23:23', null, 'wechat', '588730e1-e39a-3930-a1ac-fac888c8ca5a', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u98de\\u6d77\\u79d1\\u6280\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"226ac85f-b18f-3c8c-a489-7aa2f97a5caa\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('57', '20180726092016765357', '72', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c21\\u8857\\u9053\\u7b2c478\\u53f7\",\"zip\":744100,\"contact_name\":\"\\u6842\\u65ed\",\"contact_phone\":\"18089199673\"}', '4608.00', 'Doloribus fugit mollitia necessitatibus iste.', '2018-07-11 17:50:22', null, 'wechat', 'aaa44595-cae1-3fb2-bae8-4d2582db80a3', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u7ef4\\u65fa\\u660e\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"3ff14d7b-dae4-325a-9e40-145f3f5a8663\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('58', '20180726092016758027', '16', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c556\\u53f7\",\"zip\":788500,\"contact_name\":\"\\u4ec7\\u7389\",\"contact_phone\":\"13359827196\"}', '63215.00', 'Ut praesentium sit odit ratione sint quia.', '2018-07-15 16:37:07', null, 'alipay', '9e820d75-8d01-3eed-803f-cc36409764f5', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u51cc\\u9896\\u4fe1\\u606f\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"0377ace2-e63d-3508-8612-ab18ac43357d\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('59', '20180726092016180069', '54', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c74\\u8857\\u9053\\u7b2c365\\u53f7\",\"zip\":82500,\"contact_name\":\"\\u962e\\u5029\",\"contact_phone\":\"13234320013\"}', '25887.00', 'Consequatur rerum aut non ullam ipsam sit velit.', '2018-07-02 18:07:42', null, 'wechat', '6102cca3-086d-3c0a-a323-67cbf0c5e392', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u83ca\\u98ce\\u516c\\u53f8\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"ae5b86bc-26d2-358b-9d84-09f8c7ccd794\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('60', '20180726092016663006', '48', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c28\\u8857\\u9053\\u7b2c346\\u53f7\",\"zip\":848000,\"contact_name\":\"\\u71d5\\u6668\",\"contact_phone\":\"13573831355\"}', '9382.00', 'Aut numquam in fuga excepturi deserunt consectetur accusamus et.', '2018-06-30 15:46:21', null, 'alipay', 'c2acabdc-3bf1-3335-872d-956ce1f86a7a', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u5170\\u91d1\\u7535\\u5b50\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"a6b6064c-7d49-30a9-a7a1-2fca8941d266\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('61', '20180726092016410773', '77', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c55\\u8857\\u9053\\u7b2c328\\u53f7\",\"zip\":346800,\"contact_name\":\"\\u8f66\\u9f99\",\"contact_phone\":\"14538348659\"}', '18764.00', 'Sequi officiis sit omnis ut officiis error sunt.', '2018-07-02 18:39:17', null, 'wechat', '4dabc357-f872-31da-a63c-d91d1aa9094f', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u8d8b\\u52bf\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"957f9849-8975-3e93-a359-342c8104daf7\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('62', '20180726092016468402', '45', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c31\\u8857\\u9053\\u7b2c854\\u53f7\",\"zip\":24300,\"contact_name\":\"\\u8212\\u9633\",\"contact_phone\":\"18692207322\"}', '22975.65', 'In repellat omnis quam adipisci illum.', '2018-07-25 06:39:27', '1', 'alipay', '05905dfd-3e1f-39dc-8504-4aee607a90a2', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('63', '20180726092016368347', '35', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c27\\u8857\\u9053\\u7b2c21\\u53f7\",\"zip\":552000,\"contact_name\":\"\\u5e94\\u7231\\u534e\",\"contact_phone\":\"14721133216\"}', '14099.80', 'Sit aperiam qui sed dolorem.', '2018-07-17 16:02:05', '4', 'alipay', '07299efc-e591-32f7-b183-ffed3c8f940d', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u6570\\u5b57100\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"1cf173a6-9ae1-365f-96f3-45902bc50824\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('64', '20180726092016280880', '75', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c98\\u8857\\u9053\\u7b2c695\\u53f7\",\"zip\":64300,\"contact_name\":\"\\u6210\\u971e\",\"contact_phone\":\"17077250473\"}', '18509.60', 'Voluptatibus quia unde quos veritatis soluta.', '2018-07-18 00:42:09', '4', 'wechat', '0cb266d7-7ca3-30e5-9852-9572cd5cd095', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u592a\\u6781\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"c255b38e-a19a-3935-a907-ed7f2ea71c03\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('65', '20180726092016132305', '20', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c36\\u8857\\u9053\\u7b2c392\\u53f7\",\"zip\":525300,\"contact_name\":\"\\u8f9c\\u6021\",\"contact_phone\":\"15198580231\"}', '35830.00', 'Et doloribus nostrum impedit est.', '2018-06-27 14:32:29', null, 'alipay', '6ee296da-6d22-3c42-ad61-5d1225670e8d', 'pending', null, '0', '0', 'pending', null, '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('66', '20180726092016166071', '59', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c67\\u8857\\u9053\\u7b2c692\\u53f7\",\"zip\":191300,\"contact_name\":\"\\u7a3d\\u6667\",\"contact_phone\":\"14551977305\"}', '715.70', 'Eos qui cum molestias itaque sint.', '2018-07-16 14:09:04', '4', 'alipay', '96700c77-f4d3-34e9-a7fd-5a8b6ca1c24a', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u5feb\\u8baf\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"7aef84f2-c213-36b9-a333-18aa7c4a712f\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('67', '20180726092016415564', '79', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c4\\u8857\\u9053\\u7b2c775\\u53f7\",\"zip\":762600,\"contact_name\":\"\\u5b63\\u7389\\u5170\",\"contact_phone\":\"17005091081\"}', '408.00', 'Sed ut quo ipsum qui.', '2018-07-17 18:33:47', null, 'wechat', 'bcbbbd24-5c2e-3ba7-8f05-c5e83d24f83d', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u8d8b\\u52bf\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"148426f0-80bc-3eb7-8acb-21689d6107f6\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('68', '20180726092016416886', '71', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c37\\u8857\\u9053\\u7b2c271\\u53f7\",\"zip\":256800,\"contact_name\":\"\\u5f3a\\u7ffc\",\"contact_phone\":\"17012102538\"}', '24297.00', 'Eos qui quis impedit quia occaecati.', '2018-07-19 03:39:27', null, 'alipay', '61996264-946e-3997-8b21-d52b919f6fd3', 'success', '229036916aea47d6b23c9e14e17eb477', '0', '1', 'pending', null, '{\"refund_reason\":\"Sequi consequatur veniam expedita quod sed in.\"}', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('69', '20180726092016014880', '26', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c96\\u8857\\u9053\\u7b2c11\\u53f7\",\"zip\":857600,\"contact_name\":\"\\u6bdb\\u54f2\",\"contact_phone\":\"15047373745\"}', '40180.00', 'Voluptatibus et laudantium aliquam atque sint.', '2018-07-01 03:51:09', null, 'alipay', '8ec6fa97-5893-336a-9c63-9cbc626bf853', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('70', '20180726092016091838', '77', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c55\\u8857\\u9053\\u7b2c328\\u53f7\",\"zip\":346800,\"contact_name\":\"\\u8f66\\u9f99\",\"contact_phone\":\"14538348659\"}', '76224.00', 'Necessitatibus sunt qui suscipit quo repellat rerum nihil expedita.', '2018-07-23 02:33:33', null, 'alipay', '99bc1f78-3a56-3bb5-b98a-db504ff2a633', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('71', '20180726092016224390', '27', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c7\\u8857\\u9053\\u7b2c93\\u53f7\",\"zip\":357200,\"contact_name\":\"\\u6a0a\\u6625\\u6885\",\"contact_phone\":\"18416860396\"}', '62430.00', 'Et eligendi cupiditate dolores distinctio eos.', '2018-07-13 09:45:32', null, 'alipay', 'f684aaf7-6cd9-38eb-98d9-15871a3e1950', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u5929\\u76ca\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"344449b4-6831-3841-9abb-161137b396c1\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('72', '20180726092016543605', '75', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c98\\u8857\\u9053\\u7b2c695\\u53f7\",\"zip\":64300,\"contact_name\":\"\\u6210\\u971e\",\"contact_phone\":\"17077250473\"}', '15360.00', 'Repellendus dolores facilis quam voluptates praesentium et officia.', '2018-06-29 21:47:49', null, 'wechat', '6413fb90-3697-3f7a-9c72-11d083d075c5', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u98de\\u5229\\u4fe1\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"7e15a2e7-da5e-30e7-b490-7686201a217c\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('73', '20180726092016127944', '84', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c68\\u8857\\u9053\\u7b2c851\\u53f7\",\"zip\":484000,\"contact_name\":\"\\u84dd\\u9759\",\"contact_phone\":\"17050731958\"}', '19920.00', 'Laudantium debitis facere asperiores sed enim aut sapiente voluptatum.', '2018-07-19 20:43:17', null, 'alipay', 'e622f3e6-6abb-3bd2-ac28-508cd022b9ec', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u8bfa\\u4f9d\\u66fc\\u8f6f\\u4ef6\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"c0e2895f-e891-39e0-9d69-05a32215c833\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('74', '20180726092016816241', '73', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c37\\u8857\\u9053\\u7b2c662\\u53f7\",\"zip\":462400,\"contact_name\":\"\\u67f3\\u6d77\\u71d5\",\"contact_phone\":\"18282819913\"}', '46883.40', 'Accusantium nihil earum ab debitis molestiae dolorem.', '2018-07-02 05:11:21', '15', 'wechat', '45c7bf1f-f538-39bc-9373-acd9740e6b5a', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u51cc\\u9896\\u4fe1\\u606f\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"45332b07-7740-379a-8516-0d80879a2281\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('75', '20180726092016900721', '94', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c56\\u8857\\u9053\\u7b2c336\\u53f7\",\"zip\":336000,\"contact_name\":\"\\u5411\\u6b22\",\"contact_phone\":\"17182930128\"}', '55372.00', 'Consequatur est similique voluptatem sunt.', '2018-07-22 13:48:19', null, 'wechat', '32685068-02fc-3fcd-a7e4-4bf04e261dff', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('76', '20180726092016217913', '93', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c94\\u8857\\u9053\\u7b2c174\\u53f7\",\"zip\":298000,\"contact_name\":\"\\u5a04\\u4e3d\\u5a1f\",\"contact_phone\":\"17107764552\"}', '46372.00', 'Enim dolor quam explicabo illum et et est.', '2018-07-10 06:35:33', null, 'alipay', '2e6bee40-dde3-3a2f-bac7-8eb4f8760b77', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u6656\\u6765\\u8ba1\\u7b97\\u673a\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"59d07a6b-a602-3c15-abad-8eda8741a8bd\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('77', '20180726092016932337', '72', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c21\\u8857\\u9053\\u7b2c478\\u53f7\",\"zip\":744100,\"contact_name\":\"\\u6842\\u65ed\",\"contact_phone\":\"18089199673\"}', '53520.00', 'Odit fugiat iusto dolorum dignissimos numquam.', '2018-06-29 17:30:06', null, 'wechat', 'af07094c-c743-340f-9afe-95264e02fd25', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:18');
INSERT INTO `orders` VALUES ('78', '20180726092016941019', '20', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c36\\u8857\\u9053\\u7b2c392\\u53f7\",\"zip\":525300,\"contact_name\":\"\\u8f9c\\u6021\",\"contact_phone\":\"15198580231\"}', '25179.00', 'Sed ipsum tempore enim molestias eaque dolorum.', '2018-07-24 18:58:04', '15', 'wechat', 'c080ec55-fc5a-329c-acef-a4cf823d5bb5', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u7fa4\\u82f1\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"ab4d70bd-7b1a-3788-9389-93e115673c08\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('79', '20180726092016522431', '21', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c44\\u8857\\u9053\\u7b2c751\\u53f7\",\"zip\":527600,\"contact_name\":\"\\u5c39\\u8f89\",\"contact_phone\":\"18813317818\"}', '33557.00', 'Quam sed sit voluptatem recusandae dolores saepe nihil.', '2018-06-28 00:41:04', null, 'alipay', '619c5723-19cb-3de7-b3ba-47818e8feeea', 'success', 'd92f92b9874047bb9c6db7c12c194179', '0', '0', 'delivered', '{\"express_company\":\"\\u94f6\\u5609\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"dbd33008-43d1-3037-bc20-d72fd937f9a3\"}', '{\"refund_reason\":\"Blanditiis sint doloribus qui non.\"}', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('80', '20180726092016047661', '91', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c16\\u8857\\u9053\\u7b2c286\\u53f7\",\"zip\":427800,\"contact_name\":\"\\u82a6\\u6dd1\\u82f1\",\"contact_phone\":\"17759193047\"}', '35098.00', 'Ut exercitationem hic maxime quae neque.', '2018-07-23 06:25:09', null, 'wechat', 'a499e66d-5f3c-3fe9-b577-58a06c9e95af', 'pending', null, '0', '0', 'delivered', '{\"express_company\":\"\\u51cc\\u4e91\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"a9e56de0-f2d0-3190-9b14-49df604af459\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('81', '20180726092016520614', '22', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c78\\u8857\\u9053\\u7b2c408\\u53f7\",\"zip\":15800,\"contact_name\":\"\\u90ed\\u9e4f\\u7a0b\",\"contact_phone\":\"17054655728\"}', '10077.00', 'Eveniet consequatur explicabo enim maxime inventore nisi saepe culpa.', '2018-07-21 22:30:15', '15', 'wechat', '656179e9-b045-3157-9ef4-0d9595916d70', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u5929\\u76ca\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"51d717c5-8b33-3ac6-b918-e77f52c17fb8\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('82', '20180726092016111942', '50', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c59\\u8857\\u9053\\u7b2c229\\u53f7\",\"zip\":374400,\"contact_name\":\"\\u8fdf\\u7434\",\"contact_phone\":\"13846896412\"}', '19837.00', 'Porro dicta exercitationem iure vel laborum totam consectetur eveniet.', '2018-07-21 18:42:32', null, 'alipay', '1e8ea24b-7f1f-3365-a312-a23ceba951ee', 'success', '17d84b92f47d44928c524312e260e7b2', '0', '1', 'received', '{\"express_company\":\"\\u5357\\u5eb7\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"e8882a9b-e085-3787-a0e1-05b4a6001882\"}', '{\"refund_reason\":\"Sint dolores quo consequatur possimus.\"}', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('83', '20180726092016689158', '62', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c38\\u8857\\u9053\\u7b2c179\\u53f7\",\"zip\":292800,\"contact_name\":\"\\u7fc1\\u6960\",\"contact_phone\":\"13440234363\"}', '17521.00', 'Nesciunt accusantium animi dolore debitis autem.', '2018-07-16 01:21:01', null, 'alipay', '292aa71f-c3ee-32ad-ad23-33a405ae4e4f', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u8944\\u6a0a\\u5730\\u7403\\u6751\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"de4f3149-c0d6-3ad9-8eb0-3ab0796f0e9b\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('84', '20180726092016545256', '82', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c22\\u8857\\u9053\\u7b2c296\\u53f7\",\"zip\":133100,\"contact_name\":\"\\u6c64\\u7389\\u5170\",\"contact_phone\":\"13558477488\"}', '33971.00', 'Delectus maiores eum natus autem omnis quis voluptates.', '2018-06-27 03:34:38', null, 'wechat', 'ed3f2b8e-15aa-3ed3-bd58-114da1ffd563', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('85', '20180726092016566195', '50', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c88\\u8857\\u9053\\u7b2c235\\u53f7\",\"zip\":437800,\"contact_name\":\"\\u6234\\u814a\\u6885\",\"contact_phone\":\"18607491557\"}', '5762.00', 'Et aut quaerat perferendis non eum.', '2018-06-28 13:35:23', null, 'alipay', 'd0069c60-867e-3c2d-a23b-cff24c3a0d2f', 'success', '416fcac224c34e64a665740087b948ed', '0', '1', 'delivered', '{\"express_company\":\"\\u6bd5\\u535a\\u8bda\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"a6f29da7-2b14-346d-92f2-cb8388adb89c\"}', '{\"refund_reason\":\"Iure autem doloremque doloremque explicabo vero sit commodi quas.\"}', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('86', '20180726092016976243', '61', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c20\\u8857\\u9053\\u7b2c604\\u53f7\",\"zip\":376800,\"contact_name\":\"\\u7ae0\\u5b87\",\"contact_phone\":\"15039044654\"}', '16148.00', 'Tenetur velit eaque quia praesentium autem cupiditate.', '2018-07-20 09:25:08', null, 'wechat', '7f2b40dd-2ea9-376c-8bdb-6c3bd1211fae', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('87', '20180726092016597154', '26', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c63\\u8857\\u9053\\u7b2c265\\u53f7\",\"zip\":747400,\"contact_name\":\"\\u6851\\u6667\",\"contact_phone\":\"17794116161\"}', '67221.00', 'Fugiat error est molestiae quibusdam ut.', '2018-07-16 01:23:00', null, 'wechat', '51f237c8-c936-3e21-bc5a-a7d9e0c65b86', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u901a\\u9645\\u540d\\u8054\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"b32bb8ea-0ec0-3c99-8f0a-31202a4d7b1b\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('88', '20180726092016900156', '94', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c56\\u8857\\u9053\\u7b2c336\\u53f7\",\"zip\":336000,\"contact_name\":\"\\u5411\\u6b22\",\"contact_phone\":\"17182930128\"}', '3188.00', 'Nihil modi quam perspiciatis laudantium commodi.', '2018-07-21 21:31:53', null, 'wechat', 'b1b6809d-9b2a-3521-8f41-3a1b8084b654', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u548c\\u6cf0\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"e46376a3-b93d-318f-bd3c-3e31b922aa17\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('89', '20180726092016910366', '76', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c7\\u8857\\u9053\\u7b2c297\\u53f7\",\"zip\":262900,\"contact_name\":\"\\u51b7\\u7ea2\",\"contact_phone\":\"13376412314\"}', '2328.00', 'Nihil est earum est optio nemo qui.', '2018-06-30 16:46:25', null, 'wechat', 'e892bdaa-92f0-3674-8895-bd5560845f9f', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('90', '20180726092016496191', '38', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c37\\u8857\\u9053\\u7b2c90\\u53f7\",\"zip\":307100,\"contact_name\":\"\\u4f59\\u6667\",\"contact_phone\":\"17018093201\"}', '5347.00', 'Perferendis tempore sed et et.', '2018-07-14 04:35:35', null, 'alipay', 'c82ceaaa-141c-39b0-98ab-a8cdd69d4d72', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u6bd5\\u535a\\u8bda\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"5a212775-47c5-3b58-869b-f0576004a02f\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('91', '20180726092016951976', '67', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c2\\u8857\\u9053\\u7b2c49\\u53f7\",\"zip\":416600,\"contact_name\":\"\\u8f66\\u946b\",\"contact_phone\":\"17096604116\"}', '17314.00', 'Asperiores molestiae autem accusamus neque velit enim.', '2018-07-14 09:52:24', null, 'alipay', '7a44d0e7-3bbe-3581-bb74-2c4daaa5969a', 'pending', null, '0', '0', 'pending', null, '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('92', '20180726092016980364', '33', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c42\\u8857\\u9053\\u7b2c583\\u53f7\",\"zip\":282900,\"contact_name\":\"\\u666f\\u5170\\u82f1\",\"contact_phone\":\"13303605031\"}', '2328.00', 'Eveniet delectus vel in repudiandae harum.', '2018-07-07 20:00:07', null, 'alipay', '7b3591b3-b231-3fb6-96df-0a9e457647d2', 'success', '20ac75e2a04f4e35a1ffae39acc8deb3', '0', '1', 'pending', null, '{\"refund_reason\":\"Sed ullam laborum quam.\"}', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('93', '20180726092016185301', '53', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c78\\u8857\\u9053\\u7b2c123\\u53f7\",\"zip\":753100,\"contact_name\":\"\\u9122\\u71d5\",\"contact_phone\":\"15263861004\"}', '13091.00', 'Deleniti deserunt laboriosam sed ab repudiandae veniam quo.', '2018-07-25 16:55:57', null, 'wechat', '3fe1bb59-0ae1-335b-bdfa-612ec37fa1eb', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u901a\\u9645\\u540d\\u8054\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"a419b6ea-88b6-3e16-9b4a-fc35ecea0c1b\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('94', '20180726092016188222', '6', '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c79\\u8857\\u9053\\u7b2c475\\u53f7\",\"zip\":276900,\"contact_name\":\"\\u5c60\\u79c0\\u82b3\",\"contact_phone\":\"15012555765\"}', '8187.72', 'Eius aut a sed qui qui aliquam a cum.', '2018-07-07 07:43:01', '1', 'alipay', 'c5cedd0f-b4c7-3915-9a8a-81c1c9512c25', 'pending', null, '0', '1', 'pending', null, '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('95', '20180726092016687560', '18', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c18\\u8857\\u9053\\u7b2c10\\u53f7\",\"zip\":132700,\"contact_name\":\"\\u6797\\u5e05\",\"contact_phone\":\"18876475771\"}', '35341.00', 'Doloremque deleniti eligendi id a illo.', '2018-06-29 09:06:23', null, 'alipay', '466660ec-fef9-3709-9d41-ac42d87bfb2b', 'pending', null, '0', '0', 'delivered', '{\"express_company\":\"\\u65f6\\u523b\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"ea9e7b8f-60f5-382d-ada5-e2cbf50394cc\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('96', '20180726092016880472', '91', '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c16\\u8857\\u9053\\u7b2c286\\u53f7\",\"zip\":427800,\"contact_name\":\"\\u82a6\\u6dd1\\u82f1\",\"contact_phone\":\"17759193047\"}', '31839.00', 'Eos dolorem assumenda voluptatem aut ratione quidem iure.', '2018-06-29 09:05:47', null, 'alipay', 'fd0c8830-c3dc-3317-8831-626cd7b2eaaf', 'pending', null, '0', '0', 'pending', null, '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('97', '20180726092016263959', '15', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c19\\u8857\\u9053\\u7b2c383\\u53f7\",\"zip\":75800,\"contact_name\":\"\\u666f\\u7ffc\",\"contact_phone\":\"17664900088\"}', '112228.00', 'Quo et atque incidunt beatae laboriosam.', '2018-07-09 12:26:53', null, 'alipay', 'b4658dbc-2b05-366a-b6ea-ec0a4b913755', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u6d66\\u534e\\u4f17\\u57ce\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"d561f019-bfe5-3bcd-a4a0-61b80d2fdb7b\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('98', '20180726092016381081', '28', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c91\\u8857\\u9053\\u7b2c652\\u53f7\",\"zip\":578800,\"contact_name\":\"\\u6e29\\u5b50\\u5b89\",\"contact_phone\":\"13135086725\"}', '22170.60', 'Consequuntur ut velit deleniti vel hic.', '2018-07-13 13:49:41', '15', 'alipay', 'b7585345-b0f1-3f23-bda6-c6f46b5ffb3b', 'pending', null, '0', '1', 'delivered', '{\"express_company\":\"\\u7acb\\u4fe1\\u7535\\u5b50\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"e085348a-ba74-3f20-a86a-eaf59544b58e\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('99', '20180726092016322048', '66', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c30\\u8857\\u9053\\u7b2c748\\u53f7\",\"zip\":602900,\"contact_name\":\"\\u6bd5\\u6842\\u8363\",\"contact_phone\":\"17184115387\"}', '29572.00', 'Quos rerum ipsa sit fuga voluptate voluptatum aut.', '2018-06-29 10:57:43', null, 'wechat', 'f98145ce-9fa0-34cf-abc5-11cc5a8b8cc5', 'pending', null, '0', '1', 'received', '{\"express_company\":\"\\u9ec4\\u77f3\\u91d1\\u627f\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"ed9c7631-4e6a-3f48-9953-abd8032df994\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('100', '20180726092016094980', '57', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c29\\u8857\\u9053\\u7b2c780\\u53f7\",\"zip\":656200,\"contact_name\":\"\\u76d6\\u745c\",\"contact_phone\":\"13370776430\"}', '36259.00', 'Expedita recusandae voluptatem nostrum culpa quaerat aut nam.', '2018-07-20 16:46:46', null, 'wechat', '807131eb-dc68-33e2-9bbd-cdd3778aaaa4', 'pending', null, '0', '0', 'received', '{\"express_company\":\"\\u65f6\\u7a7a\\u76d2\\u6570\\u5b57\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"cee77af2-8d64-3926-8fdd-810d3a9c7139\"}', '[]', '2018-07-26 09:20:16', '2018-07-26 09:20:19');
INSERT INTO `orders` VALUES ('101', '20180726100637693088', '101', '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u563b\\u563b\\u7684\\u5c0f\\u624d\\u7684\\u5bb6\",\"zip\":523000,\"contact_name\":\"\\u563b\\u563b\\u7684\\u5c0f\\u624d\",\"contact_phone\":\"12345678\"}', '811.00', null, null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2018-07-26 10:06:37', '2018-07-26 10:06:37');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `product_skus`
-- ----------------------------
DROP TABLE IF EXISTS `product_skus`;
CREATE TABLE `product_skus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_skus_product_id_foreign` (`product_id`),
  CONSTRAINT `product_skus_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_skus
-- ----------------------------
INSERT INTO `product_skus` VALUES ('1', 'quam', 'Pariatur ea ut ut corporis qui.', '7697.00', '94285', '1', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('2', 'est', 'Sequi qui accusamus rerum rerum dicta.', '811.00', '19775', '1', '2018-07-26 09:20:13', '2018-07-26 10:06:37');
INSERT INTO `product_skus` VALUES ('3', 'adipisci', 'Est quos corporis voluptate ut accusantium occaecati beatae.', '6881.00', '21475', '1', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('4', 'consectetur', 'Minus velit omnis quod est.', '1326.00', '47094', '2', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('5', 'ullam', 'Mollitia nam quidem aliquid numquam sit porro omnis ut.', '4720.00', '46961', '2', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('6', 'quisquam', 'Sed error nam rerum deleniti deleniti perferendis perspiciatis.', '8823.00', '55471', '2', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('7', 'dolores', 'Qui consequuntur vero ea veniam et.', '9287.00', '42141', '3', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('8', 'et', 'Hic nihil tempore est pariatur ab ex ab.', '7021.00', '93112', '3', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('9', 'veritatis', 'Minima nihil saepe fugit.', '1975.00', '2186', '3', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('10', 'repellendus', 'Corrupti aut repellendus aut est.', '9500.00', '12657', '4', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('11', 'libero', 'Molestias quas explicabo vel aut placeat.', '3859.00', '96618', '4', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('12', 'repellendus', 'Corporis dignissimos numquam neque consequatur.', '8029.00', '41649', '4', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('13', 'fugit', 'Quis sint minus eos iste.', '204.00', '12876', '5', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('14', 'dolore', 'Enim dolores necessitatibus et.', '4691.00', '51490', '5', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('15', 'et', 'Velit est ea id aut similique.', '7393.00', '86823', '5', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('16', 'est', 'Quidem eum suscipit id quos.', '9345.00', '32876', '6', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('17', 'aliquam', 'Eaque et qui sed sit praesentium.', '9712.00', '34003', '6', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('18', 'doloribus', 'Laboriosam expedita blanditiis a tenetur eum quod.', '2390.00', '83669', '6', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('19', 'libero', 'Illo officiis iste minus.', '594.00', '16191', '7', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('20', 'totam', 'At dicta non deleniti sit perferendis.', '4043.00', '38420', '7', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('21', 'ipsam', 'Dolores fugiat tempore et.', '3941.00', '52484', '7', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('22', 'eius', 'Sed dolorum nesciunt porro officia consequuntur.', '2201.00', '15327', '8', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('23', 'culpa', 'Laboriosam harum dolores consectetur sint numquam est reiciendis odit.', '764.00', '13311', '8', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('24', 'omnis', 'Dignissimos quod ut minus odit sint odio.', '310.00', '41974', '8', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('25', 'odit', 'Perspiciatis quibusdam cum sed in quas nostrum rerum.', '8294.00', '41133', '9', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('26', 'et', 'Omnis repellat error et totam tempora inventore.', '3986.00', '20010', '9', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('27', 'tempore', 'Ipsa ut dolorem quisquam porro harum perferendis.', '362.00', '36460', '9', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('28', 'rerum', 'Aut et sequi et ea.', '6985.00', '36623', '10', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('29', 'accusantium', 'Maiores ut ut voluptas est explicabo.', '1319.00', '99413', '10', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('30', 'sequi', 'Id nisi recusandae repudiandae sapiente minima.', '4529.00', '55903', '10', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('31', 'molestiae', 'Quam laborum doloribus aut esse.', '3539.00', '66312', '11', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('32', 'et', 'Omnis voluptatibus veniam odit qui modi aut.', '5444.00', '90597', '11', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('33', 'aperiam', 'Laboriosam sit et vero unde blanditiis sapiente maiores.', '797.00', '46952', '11', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('34', 'nihil', 'Asperiores est culpa facilis corporis.', '8074.00', '43027', '12', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('35', 'est', 'Omnis maiores quibusdam est.', '3386.00', '86219', '12', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('36', 'dignissimos', 'Molestiae doloremque sit ea rem voluptas magnam et.', '2972.00', '70621', '12', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('37', 'itaque', 'Aspernatur laboriosam voluptatem ullam neque omnis eum.', '9413.00', '89453', '13', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('38', 'ut', 'Inventore veritatis possimus et quis ab.', '6363.00', '20077', '13', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('39', 'expedita', 'Quia sit ut et qui consequatur odio.', '2397.00', '74689', '13', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('40', 'qui', 'Quisquam est voluptatum porro modi saepe.', '6786.00', '69092', '14', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('41', 'amet', 'Distinctio dolore quas vitae.', '634.00', '37182', '14', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('42', 'vel', 'Hic tempora voluptatibus non minus optio rerum.', '8920.00', '98055', '14', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('43', 'quis', 'Numquam doloribus voluptatem vero tempore et assumenda.', '8492.00', '7209', '15', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('44', 'aut', 'Rem nesciunt non reiciendis qui possimus voluptate.', '9312.00', '12219', '15', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('45', 'qui', 'Cupiditate qui doloremque iure nihil.', '9634.00', '40443', '15', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('46', 'sequi', 'Praesentium recusandae ipsam optio sed ea officia non.', '2282.00', '66399', '16', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('47', 'quaerat', 'A maiores dignissimos assumenda autem eos.', '9446.00', '54036', '16', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('48', 'ut', 'Quasi consectetur ut culpa et ipsam eum debitis.', '4980.00', '42499', '16', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('49', 'numquam', 'Voluptatum nam ipsum quaerat sed cupiditate ut.', '842.00', '69164', '17', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('50', 'dolores', 'Recusandae et molestiae nostrum qui vel voluptas pariatur.', '1572.00', '57449', '17', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('51', 'quas', 'Dolore nulla voluptatem eaque.', '8309.00', '28159', '17', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('52', 'atque', 'Et qui vel consectetur maiores aut rerum iste.', '4527.00', '77363', '18', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('53', 'rerum', 'Est quae eligendi exercitationem est et vero cupiditate non.', '2955.00', '3742', '18', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('54', 'sunt', 'Architecto voluptas incidunt et in.', '2953.00', '16464', '18', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('55', 'esse', 'Ducimus quibusdam saepe ut veniam eos sit repudiandae.', '4677.00', '25712', '19', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('56', 'quia', 'Alias molestias perferendis qui sed provident qui voluptas.', '4371.00', '41277', '19', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('57', 'sapiente', 'Facere et ut laboriosam.', '3349.00', '86984', '19', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('58', 'quo', 'Vero nulla esse facere doloribus molestiae.', '5585.00', '23283', '20', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('59', 'placeat', 'Optio quia velit deleniti tenetur.', '8018.00', '67422', '20', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('60', 'voluptatem', 'Fuga quo beatae ut quisquam nihil voluptatibus eos incidunt.', '6540.00', '79953', '20', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('61', 'et', 'Inventore facilis rerum esse vel iusto vitae.', '2434.00', '26668', '21', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('62', 'sequi', 'Laboriosam sequi excepturi ut saepe sed qui.', '9788.00', '98444', '21', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('63', 'vel', 'Saepe est cumque corporis voluptas.', '9669.00', '21905', '21', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('64', 'dicta', 'Deserunt dolore in veritatis qui praesentium.', '776.00', '23708', '22', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('65', 'corporis', 'Eos officia facere est velit.', '7446.00', '91304', '22', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('66', 'rem', 'Et quisquam consectetur id animi.', '3244.00', '79211', '22', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('67', 'aut', 'Iusto amet ut blanditiis autem dolor.', '6898.00', '12198', '23', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('68', 'placeat', 'Vitae aut aut nulla aliquam sunt.', '2998.00', '96356', '23', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('69', 'fuga', 'Quam odit omnis voluptatem possimus.', '1613.00', '61180', '23', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('70', 'non', 'Aut quo accusantium perferendis vero harum a.', '1880.00', '98844', '24', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('71', 'sint', 'Mollitia expedita labore ipsum amet praesentium quos repudiandae.', '782.00', '45023', '24', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('72', 'laudantium', 'Dolorem ipsum dolor sint.', '5417.00', '18186', '24', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('73', 'at', 'Minima ut et est neque consequuntur dolore sed.', '8686.00', '90758', '25', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('74', 'facilis', 'Esse necessitatibus aut deleniti laboriosam debitis quisquam blanditiis eaque.', '2188.00', '48294', '25', '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `product_skus` VALUES ('75', 'ut', 'Minima voluptatem dignissimos ducimus sapiente eligendi et esse.', '9358.00', '40975', '25', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('76', 'quam', 'Optio ut dignissimos voluptatem sunt aut.', '849.00', '83319', '26', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('77', 'corporis', 'Architecto sed earum sunt dolorum reprehenderit quia.', '3980.00', '7790', '26', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('78', 'aliquam', 'Doloremque facere quo natus aliquid sunt sed unde.', '9417.00', '57237', '26', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('79', 'omnis', 'Id nulla assumenda vel provident veniam ullam perferendis.', '2672.00', '57932', '27', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('80', 'rerum', 'Sit iste cum atque quaerat asperiores.', '5492.00', '63370', '27', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('81', 'ab', 'Voluptas totam itaque dicta voluptatem cupiditate.', '6789.00', '86248', '27', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('82', 'cumque', 'Ex libero fuga autem odit exercitationem impedit expedita.', '7278.00', '18721', '28', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('83', 'id', 'Eligendi molestiae qui eum rerum.', '5142.00', '3538', '28', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('84', 'rerum', 'Autem ut non quasi a dolores harum.', '5347.00', '62408', '28', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('85', 'ab', 'Optio qui ex minus vitae aut ea.', '3706.00', '78477', '29', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('86', 'tempora', 'Quae et inventore nihil nesciunt aut distinctio voluptatem.', '947.00', '95818', '29', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('87', 'ea', 'Aut voluptates numquam iusto veniam recusandae.', '2422.00', '19708', '29', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('88', 'quidem', 'Sit in officiis omnis quia molestiae doloremque.', '927.00', '76466', '30', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('89', 'iure', 'Odit assumenda qui ut deleniti aut omnis.', '8265.00', '8842', '30', '2018-07-26 09:20:14', '2018-07-26 09:20:14');
INSERT INTO `product_skus` VALUES ('90', 'sequi', 'Expedita cupiditate molestiae et vel omnis.', '9580.00', '59205', '30', '2018-07-26 09:20:14', '2018-07-26 09:20:14');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `on_sale` tinyint(1) NOT NULL DEFAULT '1',
  `rating` double(8,2) NOT NULL DEFAULT '5.00',
  `sold_count` int(10) unsigned NOT NULL DEFAULT '0',
  `review_count` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'excepturi', 'Qui ut cumque magni voluptatem.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '2.71', '33', '8', '811.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('2', 'corporis', 'Sapiente nihil eos ut ea perspiciatis.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '2.29', '27', '9', '1326.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('3', 'quae', 'Sint minus est aut distinctio consequatur.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '2.00', '21', '6', '1975.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('4', 'voluptatem', 'Officiis rem rem tempore ea adipisci ut natus.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '2.33', '17', '6', '3859.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('5', 'facere', 'Sint aliquam et in qui.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '2.80', '19', '6', '204.00', '2018-07-26 09:20:13', '2018-07-26 09:20:20');
INSERT INTO `products` VALUES ('6', 'in', 'In omnis vitae debitis nihil nihil omnis placeat voluptatem.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '3.00', '26', '7', '2390.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('7', 'autem', 'Quae in cupiditate incidunt dolorem neque.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '2.25', '22', '8', '594.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('8', 'voluptatem', 'Fugiat ea velit rerum enim dolores qui.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '2.50', '38', '13', '310.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('9', 'provident', 'Fugit deleniti optio quis et repudiandae.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', '1', '3.25', '27', '10', '362.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('10', 'laborum', 'Facilis dicta quae dolores laboriosam aperiam sed error.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '2.60', '15', '6', '1319.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('11', 'voluptatem', 'Qui provident voluptates necessitatibus voluptas et nulla.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '2.50', '13', '3', '797.00', '2018-07-26 09:20:13', '2018-07-26 09:20:20');
INSERT INTO `products` VALUES ('12', 'id', 'Odit laudantium inventore iure rerum ut id nihil temporibus.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '3.57', '14', '8', '2972.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('13', 'et', 'Dolore excepturi consequatur atque ipsam et nam et et.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '2.17', '16', '7', '2397.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('14', 'sed', 'Optio id non nulla blanditiis deserunt odio odio molestias.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '3.60', '16', '5', '634.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('15', 'quisquam', 'Praesentium enim eum inventore sed accusamus iusto qui.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '2.29', '29', '8', '8492.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('16', 'reiciendis', 'Ipsum quibusdam ut est sint.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '2.80', '11', '7', '2282.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('17', 'enim', 'Sint consequatur ducimus recusandae nostrum totam officiis soluta.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '2.00', '29', '9', '842.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('18', 'repellat', 'Illum et doloremque voluptatum commodi quo eos dolores.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '4.00', '8', '2', '2953.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('19', 'fuga', 'Optio soluta enim est impedit.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '2.75', '24', '6', '3349.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('20', 'cum', 'Nobis doloremque sint quisquam quisquam.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '2.00', '10', '4', '5585.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('21', 'harum', 'Aut optio similique quam voluptatem blanditiis.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '2.71', '21', '7', '2434.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('22', 'et', 'Dolore quam molestiae itaque non repudiandae.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '3.14', '27', '10', '776.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('23', 'harum', 'Rerum eos necessitatibus ullam neque quibusdam laboriosam qui.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '1.50', '13', '3', '1613.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('24', 'delectus', 'Beatae ex reprehenderit numquam omnis.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '2.00', '11', '4', '782.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('25', 'numquam', 'Quam assumenda harum libero corrupti consectetur.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '2.00', '17', '5', '2188.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('26', 'omnis', 'Tempore nemo libero aliquid ut qui.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', '1', '1.50', '3', '2', '849.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('27', 'repellendus', 'Non a id ad perferendis.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '2.00', '7', '2', '2672.00', '2018-07-26 09:20:13', '2018-07-26 09:20:20');
INSERT INTO `products` VALUES ('28', 'autem', 'Eligendi eveniet sit voluptates sunt rerum libero alias accusamus.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '1.50', '22', '9', '5142.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');
INSERT INTO `products` VALUES ('29', 'tenetur', 'Amet et numquam minus id.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', '1', '2.75', '19', '4', '947.00', '2018-07-26 09:20:13', '2018-07-26 09:20:20');
INSERT INTO `products` VALUES ('30', 'omnis', 'Cumque iure assumenda temporibus vel blanditiis cupiditate natus.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '2.50', '19', '6', '927.00', '2018-07-26 09:20:13', '2018-07-26 09:20:19');

-- ----------------------------
-- Table structure for `user_addresses`
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` int(10) unsigned NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
INSERT INTO `user_addresses` VALUES ('1', '1', '河北省', '石家庄市', '长安区', '第84街道第374号', '221600', '董霞', '17198657466', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('2', '1', '河北省', '石家庄市', '长安区', '第32街道第701号', '68400', '薄瑞', '15240098367', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('3', '2', '江苏省', '南京市', '浦口区', '第5街道第90号', '183800', '方玉兰', '17077501408', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('4', '3', '广东省', '深圳市', '福田区', '第35街道第332号', '617000', '谭文彬', '13770300120', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('5', '4', '北京市', '市辖区', '东城区', '第9街道第88号', '362800', '仇伦', '18593277417', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('6', '4', '江苏省', '苏州市', '相城区', '第97街道第983号', '291200', '蒙淑华', '17088779257', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('7', '5', '广东省', '深圳市', '福田区', '第86街道第540号', '434200', '匡翼', '18357349364', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('8', '6', '北京市', '市辖区', '东城区', '第6街道第266号', '112800', '蓝钟', '13444249852', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('9', '6', '河北省', '石家庄市', '长安区', '第79街道第475号', '276900', '屠秀芳', '15012555765', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('10', '7', '河北省', '石家庄市', '长安区', '第39街道第86号', '456600', '冼超', '17012793129', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('11', '8', '北京市', '市辖区', '东城区', '第22街道第289号', '628400', '冷祥', '13995645759', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('12', '9', '北京市', '市辖区', '东城区', '第66街道第500号', '134900', '窦丽华', '13082453856', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('13', '9', '河北省', '石家庄市', '长安区', '第38街道第167号', '534500', '邬桂珍', '18773522027', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('14', '10', '广东省', '深圳市', '福田区', '第9街道第117号', '408300', '单玉华', '13824267818', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('15', '10', '河北省', '石家庄市', '长安区', '第60街道第392号', '455700', '田玉梅', '17795492350', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('16', '11', '广东省', '深圳市', '福田区', '第64街道第322号', '213300', '武洋', '15890676315', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('17', '12', '河北省', '石家庄市', '长安区', '第10街道第713号', '292600', '覃淑珍', '18663013863', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('18', '13', '北京市', '市辖区', '东城区', '第42街道第281号', '801700', '翟欣', '14528558695', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('19', '14', '江苏省', '南京市', '浦口区', '第19街道第507号', '546200', '卓博', '13965724730', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('20', '14', '河北省', '石家庄市', '长安区', '第68街道第398号', '37700', '何哲彦', '13007715220', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('21', '14', '广东省', '深圳市', '福田区', '第89街道第60号', '516600', '仲桂英', '18927888331', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('22', '15', '江苏省', '南京市', '浦口区', '第11街道第867号', '691800', '佟智明', '13787808265', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('23', '15', '江苏省', '南京市', '浦口区', '第19街道第383号', '75800', '景翼', '17664900088', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('24', '16', '河北省', '石家庄市', '长安区', '第68街道第556号', '788500', '仇玉', '13359827196', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('25', '16', '江苏省', '苏州市', '相城区', '第54街道第319号', '263900', '熊凯', '13953082115', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('26', '17', '广东省', '深圳市', '福田区', '第0街道第782号', '416700', '滕鹏', '13521853861', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('27', '17', '北京市', '市辖区', '东城区', '第77街道第131号', '724200', '童帆', '18778494453', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('28', '18', '江苏省', '南京市', '浦口区', '第18街道第10号', '132700', '林帅', '18876475771', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('29', '18', '河北省', '石家庄市', '长安区', '第33街道第302号', '737000', '郑宁', '18225417581', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('30', '18', '江苏省', '南京市', '浦口区', '第95街道第923号', '475300', '井林', '15597109927', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('31', '19', '广东省', '深圳市', '福田区', '第11街道第952号', '103700', '谌莹', '17079421681', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('32', '19', '江苏省', '南京市', '浦口区', '第5街道第503号', '271000', '迟凯', '13542547723', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('33', '20', '江苏省', '苏州市', '相城区', '第36街道第392号', '525300', '辜怡', '15198580231', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('34', '21', '江苏省', '苏州市', '相城区', '第44街道第751号', '527600', '尹辉', '18813317818', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('35', '22', '江苏省', '苏州市', '相城区', '第78街道第537号', '696400', '畅学明', '17185765326', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('36', '22', '北京市', '市辖区', '东城区', '第78街道第408号', '15800', '郭鹏程', '17054655728', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('37', '22', '广东省', '深圳市', '福田区', '第12街道第678号', '88200', '全飞', '15540815717', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('38', '23', '河北省', '石家庄市', '长安区', '第39街道第679号', '331600', '夏翼', '17182711907', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('39', '23', '河北省', '石家庄市', '长安区', '第71街道第574号', '467600', '余阳', '14744145234', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('40', '24', '河北省', '石家庄市', '长安区', '第47街道第936号', '715900', '彭玉珍', '13913888861', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('41', '24', '江苏省', '苏州市', '相城区', '第91街道第413号', '327900', '梁秀华', '18154219932', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('42', '25', '河北省', '石家庄市', '长安区', '第29街道第342号', '161500', '吉超', '18039612918', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('43', '25', '江苏省', '苏州市', '相城区', '第34街道第655号', '734100', '唐翼', '13806949879', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('44', '26', '江苏省', '南京市', '浦口区', '第80街道第366号', '857700', '樊正平', '17059465391', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('45', '26', '广东省', '深圳市', '福田区', '第96街道第11号', '857600', '毛哲', '15047373745', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('46', '26', '广东省', '深圳市', '福田区', '第63街道第265号', '747400', '桑晧', '17794116161', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('47', '27', '江苏省', '南京市', '浦口区', '第7街道第93号', '357200', '樊春梅', '18416860396', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('48', '28', '江苏省', '苏州市', '相城区', '第77街道第718号', '206800', '莫洁', '17649026764', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('49', '28', '江苏省', '苏州市', '相城区', '第91街道第652号', '578800', '温子安', '13135086725', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('50', '29', '江苏省', '南京市', '浦口区', '第0街道第41号', '127100', '冷建', '14529854832', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('51', '30', '广东省', '深圳市', '福田区', '第12街道第661号', '577600', '僧楼', '17031719989', null, '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `user_addresses` VALUES ('52', '30', '北京市', '市辖区', '东城区', '第73街道第890号', '525600', '郜林', '15212478758', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('53', '30', '广东省', '深圳市', '福田区', '第59街道第948号', '178000', '杜帅', '14505710844', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('54', '31', '河北省', '石家庄市', '长安区', '第37街道第972号', '357300', '吴嘉', '18973120129', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('55', '31', '江苏省', '南京市', '浦口区', '第26街道第555号', '446900', '秦春梅', '13852087968', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('56', '32', '河北省', '石家庄市', '长安区', '第62街道第485号', '197300', '全雷', '17696770084', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('57', '33', '江苏省', '南京市', '浦口区', '第91街道第702号', '766600', '练健', '13830061195', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('58', '33', '北京市', '市辖区', '东城区', '第93街道第424号', '145500', '谌俊', '18039643342', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('59', '33', '广东省', '深圳市', '福田区', '第42街道第583号', '282900', '景兰英', '13303605031', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('60', '34', '广东省', '深圳市', '福田区', '第70街道第387号', '413900', '欧国庆', '18693188514', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('61', '35', '江苏省', '南京市', '浦口区', '第27街道第21号', '552000', '应爱华', '14721133216', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('62', '35', '江苏省', '苏州市', '相城区', '第74街道第851号', '396400', '冯婕', '17089578241', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('63', '36', '江苏省', '苏州市', '相城区', '第5街道第496号', '465600', '钟伦', '18536259605', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('64', '37', '江苏省', '南京市', '浦口区', '第11街道第866号', '587100', '赵博', '15363988315', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('65', '38', '江苏省', '苏州市', '相城区', '第37街道第90号', '307100', '余晧', '17018093201', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('66', '39', '广东省', '深圳市', '福田区', '第46街道第691号', '311600', '康玉英', '17854953177', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('67', '40', '广东省', '深圳市', '福田区', '第27街道第234号', '668800', '古彬', '17612922411', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('68', '40', '江苏省', '南京市', '浦口区', '第25街道第711号', '573800', '伏婷婷', '13235547895', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('69', '40', '广东省', '深圳市', '福田区', '第52街道第613号', '735000', '倪宇', '17069879685', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('70', '41', '北京市', '市辖区', '东城区', '第12街道第749号', '392700', '鲍琳', '13368845229', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('71', '41', '江苏省', '苏州市', '相城区', '第38街道第837号', '341600', '舒楼', '17198302110', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('72', '42', '河北省', '石家庄市', '长安区', '第92街道第907号', '581900', '向嘉', '18449566821', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('73', '42', '河北省', '石家庄市', '长安区', '第98街道第48号', '204700', '冀子安', '15666278158', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('74', '42', '江苏省', '苏州市', '相城区', '第29街道第687号', '154400', '管磊', '15058746710', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('75', '43', '广东省', '深圳市', '福田区', '第18街道第570号', '594300', '宫小红', '15687219534', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('76', '43', '广东省', '深圳市', '福田区', '第30街道第188号', '842400', '柳鹰', '17073538942', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('77', '44', '江苏省', '南京市', '浦口区', '第23街道第536号', '426900', '阎桂芬', '17021150237', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('78', '44', '江苏省', '苏州市', '相城区', '第46街道第531号', '612600', '张建', '15527103820', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('79', '45', '江苏省', '苏州市', '相城区', '第31街道第854号', '24300', '舒阳', '18692207322', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('80', '45', '广东省', '深圳市', '福田区', '第57街道第676号', '578100', '洪正诚', '18417657241', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('81', '46', '江苏省', '苏州市', '相城区', '第65街道第712号', '641300', '薛华', '17073138589', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('82', '46', '江苏省', '苏州市', '相城区', '第1街道第749号', '823400', '罗正业', '18108077707', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('83', '46', '江苏省', '南京市', '浦口区', '第68街道第995号', '432100', '黄宇', '17091063236', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('84', '47', '江苏省', '南京市', '浦口区', '第43街道第888号', '715800', '盖燕', '13641389076', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('85', '47', '江苏省', '南京市', '浦口区', '第28街道第758号', '72200', '简琳', '17161203165', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('86', '48', '江苏省', '苏州市', '相城区', '第25街道第75号', '455200', '鲍鑫', '17828773907', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('87', '48', '广东省', '深圳市', '福田区', '第53街道第933号', '797300', '宇建平', '14701206108', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('88', '48', '江苏省', '苏州市', '相城区', '第28街道第346号', '848000', '燕晨', '13573831355', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('89', '49', '江苏省', '苏州市', '相城区', '第85街道第91号', '615100', '于丽', '17074708157', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('90', '49', '广东省', '深圳市', '福田区', '第86街道第255号', '655500', '闵小红', '13389738822', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('91', '50', '江苏省', '苏州市', '相城区', '第27街道第617号', '218000', '武俊', '17087374675', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('92', '50', '江苏省', '南京市', '浦口区', '第88街道第235号', '437800', '戴腊梅', '18607491557', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('93', '50', '江苏省', '南京市', '浦口区', '第59街道第229号', '374400', '迟琴', '13846896412', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('94', '51', '广东省', '深圳市', '福田区', '第46街道第345号', '346800', '明萍', '17025884757', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('95', '52', '江苏省', '苏州市', '相城区', '第7街道第80号', '154900', '路建华', '17002141483', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('96', '52', '江苏省', '南京市', '浦口区', '第83街道第716号', '396000', '管荣', '17182212272', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('97', '53', '北京市', '市辖区', '东城区', '第78街道第123号', '753100', '鄢燕', '15263861004', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('98', '53', '北京市', '市辖区', '东城区', '第47街道第61号', '58700', '竺晨', '18740793637', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('99', '54', '河北省', '石家庄市', '长安区', '第74街道第365号', '82500', '阮倩', '13234320013', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('100', '55', '河北省', '石家庄市', '长安区', '第72街道第740号', '182100', '庞淑兰', '14553463374', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('101', '56', '河北省', '石家庄市', '长安区', '第34街道第927号', '198600', '何桂芬', '17000083807', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('102', '56', '广东省', '深圳市', '福田区', '第6街道第833号', '403900', '华昱然', '15986160015', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('103', '56', '北京市', '市辖区', '东城区', '第47街道第611号', '563100', '蔡凯', '18833713672', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('104', '57', '广东省', '深圳市', '福田区', '第9街道第733号', '125200', '柏伦', '17757783979', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('105', '57', '江苏省', '南京市', '浦口区', '第29街道第780号', '656200', '盖瑜', '13370776430', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('106', '57', '江苏省', '南京市', '浦口区', '第60街道第643号', '652900', '袁志强', '18160481798', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('107', '58', '北京市', '市辖区', '东城区', '第6街道第285号', '694000', '严红霞', '17042286105', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('108', '59', '北京市', '市辖区', '东城区', '第67街道第692号', '191300', '稽晧', '14551977305', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('109', '60', '广东省', '深圳市', '福田区', '第4街道第599号', '341400', '余旭', '15331647313', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('110', '60', '北京市', '市辖区', '东城区', '第42街道第968号', '383300', '侯娜', '13082909903', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('111', '60', '江苏省', '苏州市', '相城区', '第63街道第792号', '82600', '荆雷', '13475241002', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('112', '61', '北京市', '市辖区', '东城区', '第51街道第696号', '135800', '保雪梅', '13701623007', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('113', '61', '河北省', '石家庄市', '长安区', '第20街道第604号', '376800', '章宇', '15039044654', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('114', '62', '河北省', '石家庄市', '长安区', '第38街道第179号', '292800', '翁楠', '13440234363', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('115', '62', '河北省', '石家庄市', '长安区', '第75街道第989号', '456200', '邸桂芳', '17192267822', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('116', '63', '江苏省', '苏州市', '相城区', '第26街道第890号', '646100', '晋淑珍', '13459460070', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('117', '63', '江苏省', '南京市', '浦口区', '第79街道第83号', '675800', '毕琴', '13642925812', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('118', '63', '北京市', '市辖区', '东城区', '第88街道第787号', '43400', '葛红霞', '15060191189', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('119', '64', '河北省', '石家庄市', '长安区', '第14街道第864号', '34300', '史洋', '17065497538', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('120', '64', '河北省', '石家庄市', '长安区', '第13街道第425号', '72800', '解秀云', '18146082295', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('121', '65', '江苏省', '南京市', '浦口区', '第9街道第898号', '127100', '符春梅', '17048599206', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('122', '66', '江苏省', '南京市', '浦口区', '第30街道第748号', '602900', '毕桂荣', '17184115387', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('123', '67', '河北省', '石家庄市', '长安区', '第2街道第49号', '416600', '车鑫', '17096604116', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('124', '67', '广东省', '深圳市', '福田区', '第47街道第253号', '24400', '廉坤', '17004230655', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('125', '68', '北京市', '市辖区', '东城区', '第28街道第707号', '654400', '祁坤', '13378087033', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('126', '69', '江苏省', '苏州市', '相城区', '第97街道第50号', '163300', '仲婷婷', '14567579983', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('127', '70', '北京市', '市辖区', '东城区', '第93街道第743号', '373900', '鞠兵', '13646321909', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('128', '71', '江苏省', '苏州市', '相城区', '第24街道第623号', '858800', '谌娟', '17661460578', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('129', '71', '北京市', '市辖区', '东城区', '第51街道第564号', '678800', '闵艳', '17001387965', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('130', '71', '广东省', '深圳市', '福田区', '第37街道第271号', '256800', '强翼', '17012102538', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('131', '72', '北京市', '市辖区', '东城区', '第21街道第478号', '744100', '桂旭', '18089199673', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('132', '73', '广东省', '深圳市', '福田区', '第37街道第662号', '462400', '柳海燕', '18282819913', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('133', '73', '广东省', '深圳市', '福田区', '第4街道第766号', '471600', '徐志新', '13699225347', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('134', '74', '河北省', '石家庄市', '长安区', '第93街道第983号', '652700', '韦宁', '15902698151', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('135', '74', '北京市', '市辖区', '东城区', '第44街道第585号', '557000', '荆秀云', '13547956551', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('136', '74', '江苏省', '苏州市', '相城区', '第43街道第545号', '611600', '邬桂花', '13860202161', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('137', '75', '广东省', '深圳市', '福田区', '第7街道第936号', '136800', '匡龙', '18481188583', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('138', '75', '江苏省', '苏州市', '相城区', '第98街道第695号', '64300', '成霞', '17077250473', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('139', '75', '广东省', '深圳市', '福田区', '第91街道第216号', '595900', '翟鹰', '15529034581', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('140', '76', '江苏省', '南京市', '浦口区', '第7街道第297号', '262900', '冷红', '13376412314', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('141', '77', '江苏省', '苏州市', '相城区', '第55街道第328号', '346800', '车龙', '14538348659', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('142', '78', '河北省', '石家庄市', '长安区', '第13街道第449号', '162300', '花丽', '13087063649', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('143', '78', '江苏省', '苏州市', '相城区', '第79街道第570号', '528000', '易毅', '15386116828', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('144', '78', '江苏省', '苏州市', '相城区', '第34街道第284号', '48800', '霍正诚', '17091639982', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('145', '79', '河北省', '石家庄市', '长安区', '第4街道第775号', '762600', '季玉兰', '17005091081', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('146', '80', '江苏省', '南京市', '浦口区', '第81街道第288号', '321800', '曲娟', '13235897555', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('147', '81', '江苏省', '南京市', '浦口区', '第92街道第159号', '721500', '滕军', '18981526375', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('148', '82', '北京市', '市辖区', '东城区', '第22街道第296号', '133100', '汤玉兰', '13558477488', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('149', '83', '河北省', '石家庄市', '长安区', '第56街道第841号', '731000', '虞静', '15235057792', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('150', '83', '江苏省', '南京市', '浦口区', '第62街道第376号', '743800', '辛健', '13911773949', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('151', '83', '河北省', '石家庄市', '长安区', '第46街道第272号', '383100', '柯磊', '13070894475', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('152', '84', '江苏省', '南京市', '浦口区', '第68街道第851号', '484000', '蓝静', '17050731958', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('153', '85', '江苏省', '苏州市', '相城区', '第62街道第321号', '716900', '苟晧', '13035511919', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('154', '85', '江苏省', '南京市', '浦口区', '第73街道第719号', '483400', '冯丽娟', '17183105568', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('155', '85', '广东省', '深圳市', '福田区', '第5街道第489号', '321500', '汤玉兰', '13019547679', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('156', '86', '江苏省', '南京市', '浦口区', '第50街道第692号', '142400', '赵玉兰', '17192733661', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('157', '87', '江苏省', '南京市', '浦口区', '第53街道第628号', '501800', '柳玉英', '17087526325', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('158', '88', '江苏省', '苏州市', '相城区', '第8街道第891号', '661600', '凌婕', '13972516192', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('159', '88', '河北省', '石家庄市', '长安区', '第75街道第991号', '427300', '鞠浩', '13885666480', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('160', '89', '广东省', '深圳市', '福田区', '第84街道第939号', '512500', '宗馨予', '17098019469', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('161', '89', '江苏省', '南京市', '浦口区', '第33街道第447号', '213300', '任桂芬', '13594698277', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('162', '90', '江苏省', '苏州市', '相城区', '第96街道第543号', '687700', '边桂荣', '15352085764', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('163', '91', '广东省', '深圳市', '福田区', '第16街道第286号', '427800', '芦淑英', '17759193047', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('164', '92', '江苏省', '苏州市', '相城区', '第39街道第838号', '338300', '花秀荣', '17134110445', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('165', '92', '广东省', '深圳市', '福田区', '第93街道第804号', '316200', '毛岩', '17010879078', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('166', '92', '北京市', '市辖区', '东城区', '第57街道第685号', '462200', '衣平', '18701909475', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('167', '93', '北京市', '市辖区', '东城区', '第2街道第59号', '452900', '蔺智敏', '15218536115', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('168', '93', '北京市', '市辖区', '东城区', '第94街道第174号', '298000', '娄丽娟', '17107764552', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('169', '93', '江苏省', '苏州市', '相城区', '第78街道第953号', '385700', '费斌', '13227774004', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('170', '94', '北京市', '市辖区', '东城区', '第56街道第336号', '336000', '向欢', '17182930128', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('171', '95', '北京市', '市辖区', '东城区', '第90街道第591号', '106900', '袁建平', '15097243529', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('172', '95', '江苏省', '苏州市', '相城区', '第13街道第619号', '724400', '金鹏', '17090559012', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('173', '96', '广东省', '深圳市', '福田区', '第41街道第295号', '802900', '窦洋', '17876126643', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('174', '96', '北京市', '市辖区', '东城区', '第1街道第172号', '656900', '马佳', '18445375623', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('175', '96', '江苏省', '苏州市', '相城区', '第31街道第28号', '355500', '巩馨予', '17054753922', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('176', '97', '北京市', '市辖区', '东城区', '第40街道第976号', '563300', '关丹', '14732827747', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('177', '97', '河北省', '石家庄市', '长安区', '第18街道第528号', '478100', '彭振国', '15675066517', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('178', '98', '江苏省', '南京市', '浦口区', '第95街道第523号', '135600', '闵颖', '15931662920', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('179', '98', '江苏省', '苏州市', '相城区', '第35街道第753号', '105600', '阮淑珍', '17005439740', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('180', '99', '江苏省', '苏州市', '相城区', '第43街道第338号', '511200', '兰萍', '13165096241', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('181', '99', '江苏省', '苏州市', '相城区', '第47街道第266号', '692800', '宇玉梅', '17792932329', null, '2018-07-26 09:20:12', '2018-07-26 09:20:12');
INSERT INTO `user_addresses` VALUES ('182', '99', '河北省', '石家庄市', '长安区', '第32街道第107号', '823100', '卞欣', '17745603036', null, '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `user_addresses` VALUES ('183', '100', '江苏省', '苏州市', '相城区', '第66街道第348号', '77400', '兰志勇', '18932078490', null, '2018-07-26 09:20:13', '2018-07-26 09:20:13');
INSERT INTO `user_addresses` VALUES ('184', '101', '北京市', '市辖区', '东城区', '嘻嘻的小才的家', '523000', '嘻嘻的小才', '12345678', '2018-07-26 10:06:37', '2018-07-26 10:06:14', '2018-07-26 10:06:37');

-- ----------------------------
-- Table structure for `user_favorite_products`
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite_products`;
CREATE TABLE `user_favorite_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_favorite_products_user_id_foreign` (`user_id`),
  KEY `user_favorite_products_product_id_foreign` (`product_id`),
  CONSTRAINT `user_favorite_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorite_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_favorite_products
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '林红梅', 'jdolores@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'jvMx7fOq92', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('2', '陆峰', 'illo.libero@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'DJqOPgd5aN', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('3', '翁建', 'consequatur_illum@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'V3ZMRtR0Ij', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('4', '明建军', 'nsit@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'iBz3Idpzjv', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('5', '牟秀英', 'veniam54@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'q080BXvbEO', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('6', '唐岩', 'quis.dicta@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'vjTm2HsLrf', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('7', '衣瑞', 'voluptate.maxime@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '3WLPqxzYWL', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('8', '白文彬', 'plabore@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'wOL1DDPUGw', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('9', '曲志文', 'provident32@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'WLs3OnPShl', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('10', '孔志强', 'excepturi70@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'oXNZVNlhFv', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('11', '钟利', 'saepe64@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'FpiKGzP2jk', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('12', '易腊梅', 'et_nisi@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'Y26WXqmM56', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('13', '卓秀荣', 'a.voluptatibus@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'qGm7QsaUtg', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('14', '史欣', 'suscipit40@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'hmRajDOQZL', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('15', '尹丽娟', 'sunt_fugit@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'HgZwmAjFFD', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('16', '鄢峰', 'mut@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'zZusu2tEdi', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('17', '司飞', 'pariatur_et@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'cmjG3lKc7x', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('18', '封金凤', 'laudantium.et@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '9Z8HkBV1H3', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('19', '石瑶', 'cest@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'iNGJJHi3Oy', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('20', '薛玉华', 'et71@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'mJb5FbRGnZ', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('21', '路桂珍', 'odio_omnis@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'dumClFq02X', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('22', '苗桂芝', 'consequatur_optio@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'UqOJtzXZUo', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('23', '屈婷婷', 'voluptas52@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'M6vGec2mYa', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('24', '董红梅', 'voluptas.sapiente@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'FUuWuh6TDj', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('25', '蔡志新', 'est74@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'iqPHZIcKc1', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('26', '蔡刚', 'libero.distinctio@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'sxXJ0r5giq', '1', '2018-07-26 09:20:10', '2018-07-26 09:20:10');
INSERT INTO `users` VALUES ('27', '包洁', 'voluptatem05@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'yQbGJnSOoV', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('28', '雷瑞', 'ocum@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'R0zBhLRkyI', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('29', '季明', 'ea16@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '5lzc1tIHnG', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('30', '苏利', 'nipsam@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'vDFcVWHpBN', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('31', '席成', 'quis35@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'W6rRM0EZAU', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('32', '柯敏', 'rem.sunt@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'BG0NHqdhSK', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('33', '蒋洁', 'odeserunt@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'n5GLp8tiPo', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('34', '舒冬梅', 'nisi.ut@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'VdNRlS1bEs', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('35', '稽志新', 'pvoluptates@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'HiVY9Hlcz8', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('36', '郜秀芳', 'vnon@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'MM8ZbxnZ58', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('37', '孔智渊', 'nmagni@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '8G05Ocffd6', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('38', '党凤英', 'at.officia@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '8SHTBLYJFT', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('39', '洪超', 'cumque_reiciendis@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '3z0360xchm', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('40', '姚嘉俊', 'nisi_fuga@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '88l51Q7SqY', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('41', '成建', 'in_maxime@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'AuLyLH9lc9', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('42', '殷志强', 'est72@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'cdgzSjGQMX', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('43', '鲁丹', 'fuga_aperiam@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'AtDFUoMn6x', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('44', '季欣', 'inventore.rerum@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'd4WM32imYr', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('45', '查志新', 'perferendis_quaerat@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'dy8G7VyeYq', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('46', '邬志强', 'expedita_provident@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'D4UbWhAEI3', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('47', '景秀兰', 'consectetur_placeat@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'rdzXw7gVeF', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('48', '郜明霞', 'fugit_corporis@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '6krQq20q4R', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('49', '盖秀兰', 'earum.doloremque@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'B7Z6VHERYW', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('50', '范芳', 'quia_at@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '4MFKMnNzPD', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('51', '王杨', 'ucumque@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'OzQijV7mbM', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('52', '申欣', 'nquo@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'xnWrUkl7hD', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('53', '季爱华', 'dolorum30@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'pCEFN9iaWc', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('54', '罗建平', 'odit.non@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 't455A3z2GD', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('55', '吴凤英', 'jipsa@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'IvwYGBlDnu', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('56', '樊钟', 'quisquam.non@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'qaz7vFhsoW', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('57', '武鹏', 'dolores.amet@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'kKDvAuauZm', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('58', '陆秀英', 'et.est@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'yqP9QndZbn', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('59', '钟磊', 'sit_ex@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'AMOoIw2Gox', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('60', '申致远', 'paut@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'B4LKgnmsSp', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('61', '官桂珍', 'nihil_vitae@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'oskAq6WfX2', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('62', '伏依琳', 'quis_consequatur@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'KagcLos5ZJ', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('63', '葛全安', 'voluptate18@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'KvugYAcE7b', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('64', '童鑫', 'gvoluptas@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'xEu2jmbuwr', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('65', '涂丹丹', 'praesentium_omnis@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '07StbXyqC2', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('66', '郜玉华', 'provident34@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '0Ar1psi5K4', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('67', '周欣', 'ut.consequatur@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'ol00NhO4PK', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('68', '蓝玉', 'ipsum84@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'jkfsJPGdDZ', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('69', '台岩', 'zvoluptatem@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '0X9HupIqzN', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('70', '尹玉兰', 'nemo.quo@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'Hcokv5sh6H', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('71', '蒋怡', 'quia61@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'VIQhNnICzJ', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('72', '宇波', 'aut_facilis@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'UBgO8nkojA', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('73', '洪兰英', 'ipsam_harum@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'p8o5mdxY2r', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('74', '游钟', 'enulla@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'c4LvrDty6H', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('75', '蒋志强', 'possimus87@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'Ww5ggyxWTV', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('76', '武艳', 'deius@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'L2Cpqoz6lv', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('77', '温秀华', 'tempore92@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'wbiG9CGqZy', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('78', '曾健', 'laudantium_similique@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'vZmGYfa9C7', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('79', '顾智勇', 'xexercitationem@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'R7SAHkkH3f', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('80', '应建平', 'dolor_consequatur@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'aiPJlVi47r', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('81', '伏伦', 'jamet@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '0BIuNxgUDD', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('82', '岳欣', 'bodit@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'RXWkTuSpAA', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('83', '伍坤', 'est16@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '1rCWJJchHB', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('84', '蓝林', 'optio.laboriosam@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'tWxnM8D9l7', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('85', '晋磊', 'exercitationem.qui@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '69RYNEFn4s', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('86', '万秀云', 'nihil.ut@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'QKmjz1Z0KU', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('87', '颜明霞', 'eos.nulla@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'oCsgfqVceC', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('88', '安博', 'et_reprehenderit@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'hF5Bq76FKv', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('89', '鲍翼', 'onihil@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'dNtfm7LMPy', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('90', '冉楼', 'sint.debitis@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'WSe8PlNusz', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('91', '毕正豪', 'et75@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'Vx87gGMAu4', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('92', '伍淑英', 'et_voluptatibus@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'glUwbTMZAG', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('93', '叶桂芳', 'recusandae02@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'E4z6Bhi2vg', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('94', '虞智渊', 'aut.illo@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 's4WhA8ZokE', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('95', '路海燕', 'autem24@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'FPFIKKNEXv', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('96', '罗建平', 'odit.consequatur@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'wLgwJ5c8MK', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('97', '孟秀梅', 'est_explicabo@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'Ej9wN4KiGR', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('98', '卢明', 'aut_rerum@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '3HAgRfSMxv', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('99', '冯楼', 'vero_ab@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'jUs5CnOaZl', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('100', '鞠雷', 'veritatis_et@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'CoL2yRDx9S', '1', '2018-07-26 09:20:11', '2018-07-26 09:20:11');
INSERT INTO `users` VALUES ('101', 'xkc', '1335025768@qq.com', '$2y$10$Zg4VLoMrr9.ubPp7q8VTveqRdowbTTYJEFU6awN7h0OiafEaaEz.S', null, '1', '2018-07-26 09:21:21', '2018-07-26 09:21:21');
