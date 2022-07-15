/*
Navicat MySQL Data Transfer

Source Server         : liu
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : cky_scheme

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2022-04-28 08:36:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for cky_corporate
-- ----------------------------
DROP TABLE IF EXISTS `cky_corporate`;
CREATE TABLE `cky_corporate` (
  `C_ID` int NOT NULL,
  `C_TYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CORPORATION_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `REGIS_NUM` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EMPLOYEE_ID` int NOT NULL,
  PRIMARY KEY (`C_ID`,`C_TYPE`) USING BTREE,
  KEY `C_TYPE_C` (`C_TYPE`) USING BTREE,
  CONSTRAINT `C_ID_C` FOREIGN KEY (`C_ID`) REFERENCES `cky_customer` (`C_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `C_TYPE_C` FOREIGN KEY (`C_TYPE`) REFERENCES `cky_customer` (`C_TYPE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cky_corporate
-- ----------------------------

-- ----------------------------
-- Table structure for cky_coupons
-- ----------------------------
DROP TABLE IF EXISTS `cky_coupons`;
CREATE TABLE `cky_coupons` (
  `COUPON_ID` int NOT NULL AUTO_INCREMENT,
  `DISCOUNT` decimal(4,2) NOT NULL,
  `VALID_FROM` date DEFAULT NULL,
  `VALID_TO` date DEFAULT NULL,
  PRIMARY KEY (`COUPON_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cky_coupons
-- ----------------------------
INSERT INTO `cky_coupons` VALUES ('1', '0.30', '2022-01-20', '2022-03-10');
INSERT INTO `cky_coupons` VALUES ('2', '0.20', '2022-02-15', '2022-04-03');
INSERT INTO `cky_coupons` VALUES ('3', '0.25', '2022-05-11', '2022-09-11');
INSERT INTO `cky_coupons` VALUES ('4', '0.10', '2022-06-23', '2022-11-23');
INSERT INTO `cky_coupons` VALUES ('5', '0.15', '2022-07-08', '2022-12-08');
INSERT INTO `cky_coupons` VALUES ('6', '0.20', null, null);
INSERT INTO `cky_coupons` VALUES ('7', '0.10', null, null);
INSERT INTO `cky_coupons` VALUES ('8', '0.15', null, null);
INSERT INTO `cky_coupons` VALUES ('9', '0.25', '2022-11-11', '2023-04-11');
INSERT INTO `cky_coupons` VALUES ('10', '0.10', '2022-12-14', '2023-05-14');

-- ----------------------------
-- Table structure for cky_coup_cust
-- ----------------------------
DROP TABLE IF EXISTS `cky_coup_cust`;
CREATE TABLE `cky_coup_cust` (
  `COUPON_ID` int NOT NULL,
  `C_ID` int NOT NULL,
  `COUPON_TYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `C_TYPE` char(1) NOT NULL,
  PRIMARY KEY (`COUPON_ID`,`C_ID`,`C_TYPE`),
  KEY `C_ID` (`C_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cky_coup_cust
-- ----------------------------
INSERT INTO `cky_coup_cust` VALUES ('2', '3', 'I', 'I');
INSERT INTO `cky_coup_cust` VALUES ('3', '3', 'I', 'I');
INSERT INTO `cky_coup_cust` VALUES ('6', '4', 'C', 'C');

-- ----------------------------
-- Table structure for cky_customer
-- ----------------------------
DROP TABLE IF EXISTS `cky_customer`;
CREATE TABLE `cky_customer` (
  `C_ID` int NOT NULL AUTO_INCREMENT,
  `C_TYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `C_STREET` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `C_CITY` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `C_STATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `C_ZIPCODE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `C_EMAIL` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `C_PHONE_NUM` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `C_PASSWORD` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`C_ID`,`C_TYPE`) USING BTREE,
  KEY `C_ID` (`C_ID`) USING BTREE,
  KEY `C_TYPE` (`C_TYPE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cky_customer
-- ----------------------------
INSERT INTO `cky_customer` VALUES ('1', 'I', 'uhujj', 'jnj', '98765', '98765', '987564@bhj', '987654', '8:CHEXu27sXj_e3');
INSERT INTO `cky_customer` VALUES ('2', 'I', 'uhujj', 'jnj', '98765', '98765', '987564@bhj', '987654', '123');
INSERT INTO `cky_customer` VALUES ('3', 'I', 'cdc', 'bhj', '678', '67890', 'huihu@hu', '8978789', '87879');
INSERT INTO `cky_customer` VALUES ('4', 'C', 'VDSX', 'JHJ', 'HJHJ', '09876', 'HJHK@HJ', '8765876', '8765');

-- ----------------------------
-- Table structure for cky_individual
-- ----------------------------
DROP TABLE IF EXISTS `cky_individual`;
CREATE TABLE `cky_individual` (
  `C_ID` int NOT NULL,
  `C_TYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `F_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `M_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `L_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DLN` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `INSURANCE_CNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `INSURANCE_PNUM` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`C_ID`,`C_TYPE`) USING BTREE,
  KEY `C_TYPE_I` (`C_TYPE`) USING BTREE,
  CONSTRAINT `C_ID_I` FOREIGN KEY (`C_ID`) REFERENCES `cky_customer` (`C_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `C_TYPE_I` FOREIGN KEY (`C_TYPE`) REFERENCES `cky_customer` (`C_TYPE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cky_individual
-- ----------------------------
INSERT INTO `cky_individual` VALUES ('1', 'I', 'kk', 'kk', 'zz', '987', '09876', '9876');
INSERT INTO `cky_individual` VALUES ('2', 'I', 'kk', 'kk', 'zz', '121', '09876', '1212');

-- ----------------------------
-- Table structure for cky_invoice
-- ----------------------------
DROP TABLE IF EXISTS `cky_invoice`;
CREATE TABLE `cky_invoice` (
  `INVOICE_ID` int NOT NULL AUTO_INCREMENT,
  `INVOICE_DATE` date NOT NULL,
  `INVOICE_AMOUNT` decimal(7,2) NOT NULL,
  `R_ID` int DEFAULT NULL,
  PRIMARY KEY (`INVOICE_ID`) USING BTREE,
  KEY `R_ID` (`R_ID`),
  CONSTRAINT `R_ID` FOREIGN KEY (`R_ID`) REFERENCES `cky_rental` (`R_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cky_invoice
-- ----------------------------
INSERT INTO `cky_invoice` VALUES ('1', '2022-04-27', '13284.00', '3');
INSERT INTO `cky_invoice` VALUES ('3', '2022-04-27', '24059.20', '9');
INSERT INTO `cky_invoice` VALUES ('4', '2022-04-27', '72.00', '10');
INSERT INTO `cky_invoice` VALUES ('5', '2022-04-27', '57055.00', '1');
INSERT INTO `cky_invoice` VALUES ('6', '2022-04-27', '12248.00', '2');
INSERT INTO `cky_invoice` VALUES ('7', '2022-04-27', '11343.20', '8');
INSERT INTO `cky_invoice` VALUES ('8', '2022-02-20', '14637.60', '4');
INSERT INTO `cky_invoice` VALUES ('9', '2022-02-16', '66033.00', '5');

-- ----------------------------
-- Table structure for cky_office
-- ----------------------------
DROP TABLE IF EXISTS `cky_office`;
CREATE TABLE `cky_office` (
  `OFFICE_ID` int NOT NULL AUTO_INCREMENT COMMENT 'OFFICE ID',
  `OFF_COUNTRY` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'COUNTRY NAME OF OFFICE',
  `OFF_STATE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'STATE OF OFFICE',
  `OFF_CITY` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'CITY OF OFFICE',
  `OFF_STREET` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'STREET OF OFFICE',
  `OFF_ZIPCODE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ZIPCODE OF OFFICE',
  `OFF_PHONE_NUM` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'PHONE NUMBER OF OFFICE',
  PRIMARY KEY (`OFFICE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cky_office
-- ----------------------------
INSERT INTO `cky_office` VALUES ('1', 'US', 'NJ', 'Jersey City', '605 Pavonia Ave', '07306', '6464567890');
INSERT INTO `cky_office` VALUES ('2', 'US', 'NJ', 'Jersey City', '112 Mangolia Ave', '07306', '6463334444');
INSERT INTO `cky_office` VALUES ('3', 'US', 'NJ', 'Jersey City', '20 Newark Ave', '07304', '3248889999');
INSERT INTO `cky_office` VALUES ('4', 'US', 'NY', 'New York', '46 Bowery', '10013', '6462121212');
INSERT INTO `cky_office` VALUES ('5', 'US', 'NY', 'New York', '26 Forsyth St', '10002', '6463232323');
INSERT INTO `cky_office` VALUES ('6', 'US', 'NY', 'Brooklyn', '57 Orange St', '11201', '6464334443');
INSERT INTO `cky_office` VALUES ('7', 'US', 'NY', 'Queens', '40th Ave', '11101', '3249229991');
INSERT INTO `cky_office` VALUES ('8', 'US', 'MA', 'Dorchester', '500 Geneva Ave', '02122', '6767667776');
INSERT INTO `cky_office` VALUES ('9', 'US', 'MA', 'Boston', '206 Washington St', '02109', '7788778887');
INSERT INTO `cky_office` VALUES ('10', 'US', 'MA', 'Boston', '1 Charles St', '02116', '9900909009');
INSERT INTO `cky_office` VALUES ('11', 'US', 'NJ', 'Princeton', '201 Goheen Walk', '08544', '6667778888');
INSERT INTO `cky_office` VALUES ('12', 'US', 'MA', 'Cambridge', '1 Oxford St', '02138', '7773330000');

-- ----------------------------
-- Table structure for cky_payment
-- ----------------------------
DROP TABLE IF EXISTS `cky_payment`;
CREATE TABLE `cky_payment` (
  `PAYMENT_ID` int NOT NULL AUTO_INCREMENT,
  `PAY_METHOD` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CARD_NUM` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PAY_AMOUNT` decimal(7,2) NOT NULL,
  `INVOICE_ID` int NOT NULL,
  `PAY_DATE` date NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`) USING BTREE,
  KEY `INVOICE_ID` (`INVOICE_ID`) USING BTREE,
  CONSTRAINT `INVOICE_ID` FOREIGN KEY (`INVOICE_ID`) REFERENCES `cky_invoice` (`INVOICE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cky_payment
-- ----------------------------

-- ----------------------------
-- Table structure for cky_rental
-- ----------------------------
DROP TABLE IF EXISTS `cky_rental`;
CREATE TABLE `cky_rental` (
  `R_ID` int NOT NULL AUTO_INCREMENT COMMENT 'rental service ID',
  `PICK_DATE` date NOT NULL COMMENT 'PICK UP DATE',
  `DROP_DATE` date NOT NULL COMMENT 'DROP OFF DATE',
  `PICK_LOCATION` int NOT NULL COMMENT 'PICK UP LOCATION',
  `DROP_LOCATION` int DEFAULT NULL COMMENT 'DROP OFF LOCATION',
  `START_ODO` decimal(7,2) NOT NULL DEFAULT '0.00' COMMENT 'START ODOMETER',
  `END_ODO` decimal(7,2) DEFAULT NULL COMMENT 'END ODOMETER',
  `ODO_LIMIT` decimal(4,0) DEFAULT NULL COMMENT 'ODOMETER LIMIT',
  `COUPON_ID` int DEFAULT NULL COMMENT 'COUPON ID',
  `VEHICLE_ID` int NOT NULL COMMENT 'VAHICLE ID',
  `C_ID` int NOT NULL,
  `C_TYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`R_ID`) USING BTREE,
  KEY `VEHICLE_ID` (`VEHICLE_ID`),
  KEY `C_ID` (`C_ID`),
  KEY `coupon_id` (`COUPON_ID`),
  KEY `c_type` (`C_TYPE`),
  KEY `PICK_LOC` (`PICK_LOCATION`),
  KEY `DROP_LOC` (`DROP_LOCATION`),
  CONSTRAINT `C_ID` FOREIGN KEY (`C_ID`) REFERENCES `cky_customer` (`C_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `c_type` FOREIGN KEY (`C_TYPE`) REFERENCES `cky_customer` (`C_TYPE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `coupon_id` FOREIGN KEY (`COUPON_ID`) REFERENCES `cky_coupons` (`COUPON_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `DROP_LOC` FOREIGN KEY (`DROP_LOCATION`) REFERENCES `cky_office` (`OFFICE_ID`),
  CONSTRAINT `PICK_LOC` FOREIGN KEY (`PICK_LOCATION`) REFERENCES `cky_office` (`OFFICE_ID`),
  CONSTRAINT `VEHICLE_ID` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `cky_vehicle` (`VEHICLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cky_rental
-- ----------------------------
INSERT INTO `cky_rental` VALUES ('1', '2022-01-03', '2022-01-10', '1', '2', '78.00', '12345.00', '123', null, '5', '1', 'I');
INSERT INTO `cky_rental` VALUES ('2', '2022-01-16', '2022-01-19', '2', '4', '323.00', '5555.00', '555', null, '4', '3', 'I');
INSERT INTO `cky_rental` VALUES ('3', '2022-01-22', '2022-01-27', '2', '3', '323.00', '9999.00', '888', null, '10', '2', 'I');
INSERT INTO `cky_rental` VALUES ('4', '2022-02-10', '2022-02-20', '5', '4', '768.00', '12342.00', '233', '6', '3', '4', 'C');
INSERT INTO `cky_rental` VALUES ('5', '2022-02-13', '2022-02-16', '5', '3', '768.00', '23231.00', '123', null, '7', '2', 'I');
INSERT INTO `cky_rental` VALUES ('6', '2022-03-06', '2022-03-06', '2', '2', '1287.00', '1494.00', '700', null, '4', '1', 'I');
INSERT INTO `cky_rental` VALUES ('7', '2022-03-23', '2022-04-03', '4', '2', '3489.00', '10639.00', '600', null, '9', '1', 'I');
INSERT INTO `cky_rental` VALUES ('8', '2022-03-25', '2022-03-25', '4', '3', '1287.00', '6666.00', '666', '6', '10', '4', 'C');
INSERT INTO `cky_rental` VALUES ('9', '2022-03-26', '2022-03-26', '2', '5', '1494.00', '9999.00', '999', '2', '4', '3', 'I');
INSERT INTO `cky_rental` VALUES ('10', '2022-04-01', '2022-04-03', '5', '4', '10232.00', '3333.00', '333', '6', '11', '4', 'C');
INSERT INTO `cky_rental` VALUES ('11', '2022-05-28', '2022-05-30', '1', '5', '25430.00', '27111.00', '900', null, '8', '3', 'I');

-- ----------------------------
-- Table structure for cky_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `cky_vehicle`;
CREATE TABLE `cky_vehicle` (
  `VEHICLE_ID` int NOT NULL AUTO_INCREMENT COMMENT 'vehicle id  to identify vehicle',
  `LPN` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'license plate number',
  `MAKE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'make of a vehicle',
  `V_MODEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'model of a vehicle',
  `V_YEAR` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'make year of a vehicle',
  `VIN` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'VIN of a vehicle',
  `STATUS` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'whether the vehicle is available',
  `CLASS_ID` int NOT NULL COMMENT 'vehicle class of a vehicle',
  `OFFICE_ID` int NOT NULL COMMENT 'the office the vehicle belong to',
  PRIMARY KEY (`VEHICLE_ID`) USING BTREE,
  KEY `CLASS_ID` (`CLASS_ID`) USING BTREE,
  KEY `OFFICE_ID` (`OFFICE_ID`) USING BTREE,
  CONSTRAINT `CLASS_ID` FOREIGN KEY (`CLASS_ID`) REFERENCES `cky_vehicle_class` (`CLASS_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `OFFICE_ID` FOREIGN KEY (`OFFICE_ID`) REFERENCES `cky_office` (`OFFICE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cky_vehicle
-- ----------------------------
INSERT INTO `cky_vehicle` VALUES ('1', 'B42LBJ', 'TELSA', 'S', '2013', '5YJSA1DG9DFP14705', '0', '7', '1');
INSERT INTO `cky_vehicle` VALUES ('2', 'FM74H', 'SUBARU', 'Legacy', '2011', '4S3BMHB68B3286050', '0', '10', '1');
INSERT INTO `cky_vehicle` VALUES ('3', 'PHY81C', 'SUBARU', 'Legacy', '2012', '4F3BMHB68B3285060', '0', '10', '2');
INSERT INTO `cky_vehicle` VALUES ('4', 'HXW7509', 'FORD', 'Expedition', '2015', '1FMJU2AT3FEF00187', '0', '4', '2');
INSERT INTO `cky_vehicle` VALUES ('5', 'ABC1234', 'CHEVROLET', 'Blazer', '1991', '1GNCS18Z3M0115561', '0', '3', '3');
INSERT INTO `cky_vehicle` VALUES ('6', 'EEV2967', 'ACURA', 'RDX', '2015', '5J8TB4H38FL002262', '0', '2', '3');
INSERT INTO `cky_vehicle` VALUES ('7', '215BG2', 'FORD', 'F-150', '2011', '1FTFW1R6XBFB08616', '0', '5', '4');
INSERT INTO `cky_vehicle` VALUES ('8', '99NK92', 'BMW', 'i8', '2019', 'WBY2Z4C54KVB81799', '0', '1', '5');
INSERT INTO `cky_vehicle` VALUES ('9', 'YXP645', 'HONDA', 'CR-V', '2004', 'JHLRD77874C026456', '0', '9', '6');
INSERT INTO `cky_vehicle` VALUES ('10', 'SZT144', 'INTERNATIONAL', 'MA015', '2007', '1HTMPAFM37H414790', '0', '6', '7');
INSERT INTO `cky_vehicle` VALUES ('11', 'SZT145', 'TOYOTA', 'Tundra', '2017', '5TFAW5F12HX597834', '0', '5', '7');
INSERT INTO `cky_vehicle` VALUES ('12', 'KKM531', 'BMW', 'i9', '2020', '5TFAW5F12FL002262', '0', '3', '1');
INSERT INTO `cky_vehicle` VALUES ('13', 'JNCS515', 'TOYOTA', 'Tundra', '2021', '1GAABB8Z3M0115561', '0', '8', '2');
INSERT INTO `cky_vehicle` VALUES ('14', 'HAPPY99', 'Volkswagen', 'Beetle', '2022', '1HTKJHGF37H414790', '0', '1', '3');

-- ----------------------------
-- Table structure for cky_vehicle_class
-- ----------------------------
DROP TABLE IF EXISTS `cky_vehicle_class`;
CREATE TABLE `cky_vehicle_class` (
  `CLASS_ID` int NOT NULL AUTO_INCREMENT COMMENT 'class id of different vehicle class',
  `CLASS_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'class name of vehicle class',
  `RENTAL_RATE` decimal(5,0) NOT NULL COMMENT 'rental fee per day of vehicle class ',
  `FEE_OM` decimal(5,0) NOT NULL COMMENT 'fee of over meter: USD per hour',
  PRIMARY KEY (`CLASS_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cky_vehicle_class
-- ----------------------------
INSERT INTO `cky_vehicle_class` VALUES ('1', 'small car', '20', '2');
INSERT INTO `cky_vehicle_class` VALUES ('2', 'mid-size car', '30', '3');
INSERT INTO `cky_vehicle_class` VALUES ('3', 'luxury car', '80', '5');
INSERT INTO `cky_vehicle_class` VALUES ('4', 'SUV', '50', '4');
INSERT INTO `cky_vehicle_class` VALUES ('5', 'Mini Van', '30', '3');
INSERT INTO `cky_vehicle_class` VALUES ('6', 'Station Wagon', '40', '3');
INSERT INTO `cky_vehicle_class` VALUES ('7', 'Hatchback', '40', '4');
INSERT INTO `cky_vehicle_class` VALUES ('8', 'sports car', '70', '5');
INSERT INTO `cky_vehicle_class` VALUES ('9', 'compact car', '20', '2');
INSERT INTO `cky_vehicle_class` VALUES ('10', 'sedan', '25', '2');
INSERT INTO `cky_vehicle_class` VALUES ('11', 'motorcycle', '10', '1');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2022-04-23 02:44:16.994071');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2022-04-23 02:44:17.334158');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2022-04-23 02:44:18.342322');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2022-04-23 02:44:18.609170');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2022-04-23 02:44:18.621135');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2022-04-23 02:44:18.757227');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2022-04-23 02:44:18.905021');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2022-04-23 02:44:19.035748');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2022-04-23 02:44:19.056356');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2022-04-23 02:44:19.172187');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2022-04-23 02:44:19.179189');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2022-04-23 02:44:19.191158');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2022-04-23 02:44:19.369478');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2022-04-23 02:44:19.543603');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2022-04-23 02:44:19.694042');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2022-04-23 02:44:19.715979');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0012_alter_user_first_name_max_length', '2022-04-23 02:44:19.845638');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2022-04-23 02:44:19.885526');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of django_session
-- ----------------------------
DROP TRIGGER IF EXISTS `TU`;
DELIMITER ;;
CREATE TRIGGER `TU` AFTER UPDATE ON `cky_rental` FOR EACH ROW BEGIN  
DECLARE i_id INTEGER;   
DECLARE rdays NUMERIC(7);    
DECLARE meters NUMERIC(6);    
DECLARE classid NUMERIC(3);    
DECLARE rr NUMERIC(4);   
DECLARE fo NUMERIC(4);    
DECLARE odolim NUMERIC(6);   
DECLARE overmeter NUMERIC(6);    
DECLARE coupid VARCHAR(30);    
DECLARE pcoup NUMERIC(5,4);    
DECLARE r_id NUMERIC(4);  
SET i_id = (SELECT MAX(invoice_id)+1 FROM CKY_INVOICE); 
SET rdays = (SELECT TRUNCATE((NEW.Drop_Date-NEW.Pick_Date),1)+1 );   
SET meters = (new.End_Odo - new.Start_Odo);   
SET classid = (SELECT class_id FROM cky_vehicle   
                   WHERE vehicle_id = new.vehicle_id);  
 SET rr = (SELECT rental_rate FROM cky_vehicle_class WHERE class_id = classid);   
SET fo = (SELECT fee_om FROM cky_vehicle_class WHERE class_id = classid);   
SET odolim = new.Odo_limit;   SET coupid = new.COUPON_ID;   
IF coupid is null THEN     
SET pcoup = 0;    
ELSE     
SET pcoup = (SELECT discount from cky_coupons WHERE coupon_id=coupid);    
END IF;  
     IF odolim is null THEN    
  SET overmeter = 0;   
 ELSE      
SET overmeter = (SELECT GREATEST(0,meters-(rdays*odolim)));   
END IF;   
    IF old.end_odo<>new.end_odo THEN   
 INSERT INTO CKY_INVOICE(INVOICE_ID, INVOICE_DATE, INVOICE_AMOUNT, R_ID) values            
        (i_id,NEW.Drop_Date,(rdays*rr + overmeter*fo)*(1-pcoup), NEW.R_ID); 
   
END IF;  
END
;;
DELIMITER ;
