/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : plumsugar

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 19/08/2020 16:40:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `status` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, 1, '喜你如盛夏白瓷，梅子汤甜', '热爱可抵岁月漫长', '七月在野，八月在宇，九月在户，十月蟋蟀入我床下。', '2020-08-09 20:42:07', 1);
INSERT INTO `blog` VALUES (2, 2, '感受到温柔 自己也会想变得温柔', '云朵偷偷喝醉了酒，熏红了脸变成了晚霞躺卧在天边', '在可爱的电车沿线，除了春天禁止入内。', '2020-08-09 20:42:08', 1);
INSERT INTO `blog` VALUES (3, 3, '啤酒味的星星和梅子味的晚霞', '世事千帆过 前方终会是温柔的月光', '下雨的夜晚，盛产溏心月亮。', '2020-08-09 20:42:09', 1);
INSERT INTO `blog` VALUES (4, 3, '2021变成 %全糖加冰', '每一年都奔走自己的热爱里长', '生活温暖顺心 其他别无他求。', '2020-08-09 20:42:11', 1);
INSERT INTO `blog` VALUES (5, 3, '夕阳总会落在你身上', '愿一切为之努力的事情 都有浪漫的结果', '愿一切为之努力的事情 都有浪漫的结果', '2020-08-09 19:17:08', 0);
INSERT INTO `blog` VALUES (6, 2, '希望你的眼睛一直笑', '希望你的眼睛一直笑', '希望你的眼睛一直笑', '2020-08-09 19:18:18', 0);
INSERT INTO `blog` VALUES (7, 1, '生活温暖顺心 其他别无他求', '希望你的眼睛一直笑', '希望你的眼睛一直笑', '2020-08-09 19:19:08', 0);
INSERT INTO `blog` VALUES (8, 1, '生活温暖顺心 其他别无他求', '生活温暖顺心 其他别无他求', '生活温暖顺心 其他别无他求', '2020-08-09 19:19:02', 0);
INSERT INTO `blog` VALUES (9, 2, '生活温暖顺心 其他别无他求', '生活温暖顺心 其他别无他求', '生活温暖顺心 其他别无他求', '2020-08-09 19:19:17', 0);
INSERT INTO `blog` VALUES (10, 3, '生活温暖顺心 其他别无他求', '生活温暖顺心 其他别无他求', '生活温暖顺心 其他别无他求', '2020-08-09 19:19:32', 0);
INSERT INTO `blog` VALUES (11, 2, '生活温暖顺心 其他别无他求', '生活温暖顺心 其他别无他求', '生活温暖顺心 其他别无他求', '2020-08-09 19:19:44', 0);
INSERT INTO `blog` VALUES (12, 1, '生活温暖顺心 其他别无他求', '生活温暖顺心 其他别无他求', '生活温暖顺心 其他别无他求', '2020-08-09 19:20:00', 0);
INSERT INTO `blog` VALUES (13, 1, '风停在窗边，嘱咐我要热爱这个世界', '你三四月做的事，七八月自有答案', '**风停在窗边，嘱咐我要热爱这个世界**\n因为自己淋过雨，所以总想替别人撑把伞。\n```Java\npublic class Singleton {\n    private static Singleton instance = null;\n    static {\n        instance = new Singleton();\n    }\n    private Singleton (){}\n    public static Singleton getInstance() {\n        return instance;\n    }\n}\n```\n\n![image](https://pic3.zhimg.com/80/v2-5f03eff6588652059bddb018fc86a278_720w.jpg?source=1940ef5c)\n![image](https://pic3.zhimg.com/80/v2-5f03eff6588652059bddb018fc86a278_720w.jpg?source=1940ef5c)\n![image](https://pic3.zhimg.com/80/v2-5f03eff6588652059bddb018fc86a278_720w.jpg?source=1940ef5c)\n![image](https://pic3.zhimg.com/80/v2-5f03eff6588652059bddb018fc86a278_720w.jpg?source=1940ef5c)', '2020-08-10 16:58:25', 1);
INSERT INTO `blog` VALUES (14, 2, '夏天有梅子味的晚霞和两三颗啤酒味的星', '种自己的花，恰别人的果', '**我心里有一簇迎着烈日而生的花，比一切美酒都要芬芳，滚烫的馨香淹没过稻草人的胸膛，草扎的精神，从此万寿无疆**', '2020-08-10 17:20:29', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(5) NOT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `role` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `UK_USERNAME`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'chase', 'https://pic1.zhimg.com/50/v2-65a502ac27cfa2d08b3ce9a173d7bbcc_hd.webp', '37923945@qq.com', '508305b40a507fbec76ad487e35137d3', 0, '2020-08-07 16:15:32', 'super admin', NULL);
INSERT INTO `user` VALUES (2, 'gulin', 'https://wx1.sinaimg.cn/large/006zEkO9ly1ggxqjsznylj30u00u0tqo.jpg', 'gulin@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 1, '2020-08-07 16:16:25', 'admin', NULL);
INSERT INTO `user` VALUES (3, 'lily', 'https://pic4.zhimg.com/80/v2-0d1c491bb83dd7e57bbbf7277422f12e_720w.jpg', 'lily@qq.com', 'cd8e7918010a87cc619849e00265c9a6', 1, '2020-08-07 17:08:29', 'user', NULL);
INSERT INTO `user` VALUES (4, 'wyichen', 'https://pic1.zhimg.com/80/v2-773c9bb2dea11be48bd3ec65981253e7_720w.jpg', 'wyichen@qq.com', '3b8d33bbc78f19a08f648d54ab393a37', 0, '2020-08-11 13:30:17', 'user', NULL);
INSERT INTO `user` VALUES (5, 'wahaha', 'https://pic2.zhimg.com/80/v2-7caed82db369ac220632941aabf46ce8_720w.jpg', 'wahaha@qq.com', '87ef98219672a78c19bae7954fcd4114', 2, '2020-08-11 17:52:21', 'user', NULL);

SET FOREIGN_KEY_CHECKS = 1;
