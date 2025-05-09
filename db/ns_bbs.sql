/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 127.0.0.1:3306
 Source Schema         : ns_bbs

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 06/11/2024 22:27:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fs_album
-- ----------------------------
DROP TABLE IF EXISTS `fs_album`;
CREATE TABLE `fs_album`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '相册编号',
  `pre_id` int NULL DEFAULT NULL COMMENT '前置相册id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相册名称',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '照片',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建用户id',
  `update_user` bigint NULL DEFAULT NULL COMMENT '更新用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '相册' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_album
-- ----------------------------

-- ----------------------------
-- Table structure for fs_article
-- ----------------------------
DROP TABLE IF EXISTS `fs_article`;
CREATE TABLE `fs_article`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `title_map` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '题图',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
  `pv` int NULL DEFAULT 0 COMMENT '文章浏览量',
  `top` int NULL DEFAULT NULL COMMENT '置顶（数字越大越置顶）',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建用户id',
  `update_user` bigint NULL DEFAULT NULL COMMENT '更新用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_article
-- ----------------------------
INSERT INTO `fs_article` VALUES (26, 'http://aid.nansin.top/default/articleTitleMap-20220612230127855_v1.png', '南生论坛v1.0 ~ v2.0', '注：以下截图是v1.0和v2.0的界面样子\r\n功能说明\r\n南生论坛v1.0\r\n登录【用户系统】可以：发帖、修改帖子、删除帖子、评论、删除评论、修改个人信息、关注、收藏\r\n登录【管理系统】可以：管理用户、管理帖子、管理板块、访问记录\r\n南生论坛v2.0\r\n在v1.0的基础上：整体异步实现、新增统计饼图、优化人机交互、实现分页、实现相册功能、实现月周日访问记录（方便管理员了解该论坛的访问情况）\r\n适用', 1, 13, NULL, 0, 1812, 1812, '2022-06-12 23:01:28', '2022-06-12 23:04:17');
INSERT INTO `fs_article` VALUES (27, 'http://aid.nansin.top/default/articleTitleMap-20220621234043897_v2.6.png', '南生论坛v2.6', '注：以下截图是v2.6的界面样子\r\n功能说明\r\n南生论坛v2.6\r\n在v2.0的基础上：支持Markdown、新增分享功能、新增文章详情页面、首页文章显示简约化\r\n适用人员\r\n南生论坛v2.6\r\n该版本适用于初学ssm框架、对jQuery和ajax有一定熟悉度、并且想以Markdown形式写文章的童鞋使用，主要可以通过该项目了解整个项目的设计思路（让心怀大志、无从下手的你找到突破口）\r\n优势\r\n南', 1, 15, NULL, 0, 1812, 1812, '2022-06-12 23:14:44', '2022-06-21 23:40:44');
INSERT INTO `fs_article` VALUES (28, 'http://aid.nansin.top/default/articleTitleMap-20220621234309237_v2.8.2.png', '南生论坛v2.8.2', '注：以下截图是v2.8.2的界面样子\r\n功能说明\r\n南生论坛v2.8.2\r\n在v2.6的基础上： 对前后端代码和数据库表进行了全面重构，新增了闲聊，图片/视频文件压缩并上七牛云，优化系统，提升访问效率，新增轮播图管理、项目管理，运用了Redis缓存技术\r\n适用人员\r\n南生论坛v2.8.2\r\n该版本适用于对ssm框架有一定熟悉度、对代码规范度要求比较高、对图片/视频文件上云有兴趣的童鞋使用，主要可以', 1, 50, NULL, 0, 1812, 1812, '2022-06-12 23:25:31', '2022-06-21 23:43:10');
INSERT INTO `fs_article` VALUES (38, 'http://aid.nansin.top/default/articleTitleMap-20220613000158304_76yun.png', '优化系统，提升访问效率', '发现问题\r\n网站访问效率低下，经过测试，发现主要由两个原因造成：\r\n本身云服务器的带宽不足（这个问题:tw-1f236:RMB可以解决）\r\n图片/视频文件过大，消耗大量的流量\r\n思考分析\r\n要解决以上问题可以从两个方面着手：\r\n图片/视频文件不走我们自己的服务器\r\n压缩图片/视频文件\r\n解决问题\r\n将图片/视频文件全部压缩到指定范围（自己找一个能忍受清晰度就行:fa-reddit:），避免文件过大', 1, 802, NULL, 0, 1812, 1812, '2020-06-04 23:24:48', '2023-09-25 22:10:00');
INSERT INTO `fs_article` VALUES (40, 'http://aid.nansin.top/default/articleTitleMap-20220621223826164_v3.0.0.png', '本系统【南生论坛v3.0.0】来了（SpringBoot + Vue）', '重要说明\r\n南生论坛v3.0.0是全新的一套系统！所有的数据表（用户、角色、权限等）都重新设计过，所以v2.8.2与v3.0.0的数据是不互通的。\r\n不过你之前在v2.8.2上注册（2022.6.11之后注册的不行）的用户信息在v3.0.0依然可以登录。\r\nv3.0.0以后所有的南生系列系统共用一套用户权限系统。\r\n目前使用同一套用户权限的有：南生论坛、南生运营、南生闲聊。\r\n如何进入旧版系统\r\n', 1, 70, NULL, 0, 1812, 1812, '2022-06-21 22:32:04', '2022-06-23 10:27:48');
INSERT INTO `fs_article` VALUES (41, 'http://aid.nansin.top/default/articleTitleMap-20220623221450862_logo-1.png', 'PM2 一个守护进程管理器', 'PM2 是 node 进程管理工具，可以利用它来简化很多 node应用管理的繁琐任务，如性能监控、自动重启、负载均衡等，而且使用非常简单。\r\n官方\r\n官网\r\nGitHub\r\n文档\r\nPM2简介\r\nPM2原先是nodejs应用的进程管理工具，不过其良好的设计以及扩展性可以手动执行执行进程。\r\n安装\r\n最新的 PM2 版本可通过 NPM 或 Yarn 安装：\r\nnpm install pm2@late', 1, 50, 1, 0, 1812, 1812, '2022-06-23 18:32:53', '2022-06-23 22:14:51');

-- ----------------------------
-- Table structure for fs_article_label
-- ----------------------------
DROP TABLE IF EXISTS `fs_article_label`;
CREATE TABLE `fs_article_label`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文章标签编号',
  `article_id` int NULL DEFAULT NULL COMMENT '文章id',
  `label_id` int NULL DEFAULT NULL COMMENT '标签id',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建用户id',
  `update_user` bigint NULL DEFAULT NULL COMMENT '更新用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章标签' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_article_label
-- ----------------------------
INSERT INTO `fs_article_label` VALUES (12, 26, 12, 0, 1812, 1812, '2022-06-12 23:01:28', '2022-06-12 23:01:28');
INSERT INTO `fs_article_label` VALUES (13, 26, 11, 0, 1812, 1812, '2022-06-12 23:01:28', '2022-06-12 23:01:28');
INSERT INTO `fs_article_label` VALUES (14, 27, 12, 0, 1812, 1812, '2022-06-12 23:14:44', '2022-06-12 23:14:44');
INSERT INTO `fs_article_label` VALUES (15, 27, 11, 0, 1812, 1812, '2022-06-12 23:14:44', '2022-06-12 23:14:44');
INSERT INTO `fs_article_label` VALUES (16, 28, 12, 0, 1812, 1812, '2022-06-12 23:25:31', '2022-06-12 23:25:31');
INSERT INTO `fs_article_label` VALUES (17, 28, 11, 0, 1812, 1812, '2022-06-12 23:25:31', '2022-06-12 23:25:31');
INSERT INTO `fs_article_label` VALUES (18, 29, 13, 0, 1812, 1812, '2022-06-12 23:38:11', '2022-06-12 23:38:11');
INSERT INTO `fs_article_label` VALUES (19, 30, 13, 0, 1812, 1812, '2022-06-12 23:46:42', '2022-06-12 23:46:42');
INSERT INTO `fs_article_label` VALUES (20, 31, 13, 0, 1812, 1812, '2022-06-12 23:47:51', '2022-06-12 23:47:51');
INSERT INTO `fs_article_label` VALUES (21, 32, 13, 0, 1812, 1812, '2022-06-12 23:49:32', '2022-06-12 23:49:32');
INSERT INTO `fs_article_label` VALUES (22, 33, 13, 0, 1812, 1812, '2022-06-12 23:50:38', '2022-06-12 23:50:38');
INSERT INTO `fs_article_label` VALUES (23, 34, 13, 0, 1812, 1812, '2022-06-12 23:52:53', '2022-06-12 23:52:53');
INSERT INTO `fs_article_label` VALUES (24, 34, 9, 0, 1812, 1812, '2022-06-12 23:52:53', '2022-06-12 23:52:53');
INSERT INTO `fs_article_label` VALUES (25, 35, 11, 0, 1812, 1812, '2022-06-12 23:55:23', '2022-06-12 23:55:23');
INSERT INTO `fs_article_label` VALUES (26, 35, 14, 0, 1812, 1812, '2022-06-12 23:56:34', '2022-06-12 23:56:34');
INSERT INTO `fs_article_label` VALUES (27, 36, 15, 0, 1812, 1812, '2022-06-12 23:58:56', '2022-06-12 23:58:56');
INSERT INTO `fs_article_label` VALUES (28, 36, 13, 0, 1812, 1812, '2022-06-12 23:58:56', '2022-06-12 23:58:56');
INSERT INTO `fs_article_label` VALUES (29, 37, 11, 0, 1812, 1812, '2022-06-13 00:00:08', '2022-06-13 00:00:08');
INSERT INTO `fs_article_label` VALUES (30, 38, 16, 0, 1812, 1812, '2022-06-13 00:01:59', '2022-06-13 00:01:59');
INSERT INTO `fs_article_label` VALUES (31, 38, 11, 0, 1812, 1812, '2022-06-13 00:01:59', '2022-06-13 00:01:59');
INSERT INTO `fs_article_label` VALUES (32, 39, 15, 0, 1812, 1812, '2022-06-21 14:46:25', '2022-06-21 14:46:25');
INSERT INTO `fs_article_label` VALUES (33, 40, 12, 0, 1812, 1812, '2022-06-21 22:32:04', '2022-06-21 22:32:04');
INSERT INTO `fs_article_label` VALUES (34, 40, 11, 0, 1812, 1812, '2022-06-21 22:32:04', '2022-06-21 22:32:04');
INSERT INTO `fs_article_label` VALUES (35, 41, 20, 0, 1812, 1812, '2022-06-23 18:32:53', '2022-06-23 18:32:53');
INSERT INTO `fs_article_label` VALUES (36, 41, 13, 0, 1812, 1812, '2022-06-23 18:32:53', '2022-06-23 18:32:53');
INSERT INTO `fs_article_label` VALUES (37, 41, 17, 0, 1812, 1812, '2022-06-23 18:32:53', '2022-06-23 18:32:53');

-- ----------------------------
-- Table structure for fs_comment
-- ----------------------------
DROP TABLE IF EXISTS `fs_comment`;
CREATE TABLE `fs_comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `pre_id` int NULL DEFAULT NULL COMMENT '父评论id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论内容',
  `article_id` int(11) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '被评论帖子id',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `comment_user` bigint NULL DEFAULT NULL COMMENT '评论用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_comment
-- ----------------------------

-- ----------------------------
-- Table structure for fs_comment_like
-- ----------------------------
DROP TABLE IF EXISTS `fs_comment_like`;
CREATE TABLE `fs_comment_like`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论点赞编号',
  `comment_id` int NULL DEFAULT NULL COMMENT '评论id',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0取消,1点赞)',
  `like_user` bigint NULL DEFAULT NULL COMMENT '评论点赞用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论点赞' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_comment_like
-- ----------------------------

-- ----------------------------
-- Table structure for fs_course
-- ----------------------------
DROP TABLE IF EXISTS `fs_course`;
CREATE TABLE `fs_course`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程内容（视频）',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程描述',
  `cover` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `level` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '级别（初级/中级/困难）',
  `classify` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专栏分类（动画/游戏...）',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建用户id',
  `update_user` bigint NULL DEFAULT NULL COMMENT '更新用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_course
-- ----------------------------

-- ----------------------------
-- Table structure for fs_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `fs_dynamic`;
CREATE TABLE `fs_dynamic`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户动态编号',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型（写文章、评论、点赞、关注等）',
  `user_id` bigint NULL DEFAULT NULL COMMENT '发起人',
  `object_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的对象ID（文章id、用户id等）',
  `comment_id` int NULL DEFAULT NULL COMMENT '评论id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '动态' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_dynamic
-- ----------------------------

-- ----------------------------
-- Table structure for fs_follow
-- ----------------------------
DROP TABLE IF EXISTS `fs_follow`;
CREATE TABLE `fs_follow`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '关注编号',
  `from_user` bigint NULL DEFAULT NULL COMMENT '发起关注的人',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0取消,1关注)',
  `to_user` bigint NULL DEFAULT NULL COMMENT '被关注的人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关注' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_follow
-- ----------------------------

-- ----------------------------
-- Table structure for fs_label
-- ----------------------------
DROP TABLE IF EXISTS `fs_label`;
CREATE TABLE `fs_label`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '标签编号',
  `label_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名字',
  `logo` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'logo(图片)',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建用户id',
  `update_user` bigint NULL DEFAULT NULL COMMENT '更新用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_label
-- ----------------------------
INSERT INTO `fs_label` VALUES (4, 'Vue.js', 'http://aid.nansin.top/default/labelPicture-20220612145638935_Vue.png', 0, 1812, 1812, '2022-06-11 12:03:36', '2022-06-12 14:56:41');
INSERT INTO `fs_label` VALUES (5, 'Kubernetes', 'http://aid.nansin.top/default/labelPicture-20220612145701133_rnetes.png', 0, 1812, 1812, '2022-06-11 12:10:38', '2022-06-12 14:57:02');
INSERT INTO `fs_label` VALUES (6, 'Docker', 'http://aid.nansin.top/default/labelPicture-20220612145707795_Docker.png', 0, 1812, 1812, '2022-06-11 12:11:03', '2022-06-12 14:57:09');
INSERT INTO `fs_label` VALUES (8, 'Spring Boot', 'http://aid.nansin.top/default/labelPicture-20220612145715490_g-boot.png', 0, 1812, 1812, '2022-06-11 12:14:00', '2022-06-12 14:57:17');
INSERT INTO `fs_label` VALUES (9, '运维', 'http://aid.nansin.top/default/labelPicture-20220612145722862_19运维管理.png', 0, 1812, 1812, '2022-06-11 12:15:11', '2022-06-12 14:57:24');
INSERT INTO `fs_label` VALUES (10, '操作系统', 'http://aid.nansin.top/default/labelPicture-20220612145729342_操作系统.png', 0, 1812, 1812, '2022-06-11 12:16:24', '2022-06-12 14:57:30');
INSERT INTO `fs_label` VALUES (11, '公告', 'http://aid.nansin.top/default/labelPicture-20220612145735299_eboard.png', 0, 1812, 1812, '2022-06-11 12:36:46', '2022-06-12 14:57:36');
INSERT INTO `fs_label` VALUES (12, '南生论坛迭代', 'http://aid.nansin.top/default/labelPicture-20220612224902616_-lanse.png', 0, 1812, 1812, '2022-06-12 22:49:06', '2022-06-12 22:49:55');
INSERT INTO `fs_label` VALUES (13, '推荐', 'http://aid.nansin.top/default/labelPicture-20220612233448611_推荐.png', 0, 1812, 1812, '2022-06-12 23:34:53', '2022-06-12 23:34:53');
INSERT INTO `fs_label` VALUES (14, 'Markdown', 'http://aid.nansin.top/default/labelPicture-20220612235625452_rkdown.png', 0, 1812, 1812, '2022-06-12 23:56:27', '2022-06-12 23:56:27');
INSERT INTO `fs_label` VALUES (15, '插件', 'http://aid.nansin.top/default/labelPicture-20220612235758085_插件.png', 0, 1812, 1812, '2022-06-12 23:57:59', '2022-06-12 23:57:59');
INSERT INTO `fs_label` VALUES (16, '优化', 'http://aid.nansin.top/default/labelPicture-20220613000113819_智能优化.png', 0, 1812, 1812, '2022-06-13 00:01:15', '2022-06-13 00:01:15');
INSERT INTO `fs_label` VALUES (17, 'Node.js', 'http://aid.nansin.top/default/labelPicture-20220623173925045_ode.js.png', 0, 1812, 1812, '2022-06-23 17:39:27', '2022-06-23 17:39:27');
INSERT INTO `fs_label` VALUES (18, 'GitHub', 'http://aid.nansin.top/default/labelPicture-20220623174020053_GitHub.png', 0, 1812, 1812, '2022-06-23 17:40:21', '2022-06-23 17:40:21');
INSERT INTO `fs_label` VALUES (19, 'Java', 'http://aid.nansin.top/default/labelPicture-20220623174117612_java.png', 0, 1812, 1812, '2022-06-23 17:41:19', '2022-06-23 17:41:19');
INSERT INTO `fs_label` VALUES (20, 'PM2', 'http://aid.nansin.top/default/labelPicture-20220623174732007_pm2.png', 0, 1812, 1812, '2022-06-23 17:46:23', '2022-06-23 17:47:33');

-- ----------------------------
-- Table structure for fs_like
-- ----------------------------
DROP TABLE IF EXISTS `fs_like`;
CREATE TABLE `fs_like`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '点赞编号',
  `article_id` int NULL DEFAULT NULL COMMENT '文章id',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0取消,1点赞)',
  `like_user` bigint NULL DEFAULT NULL COMMENT '点赞用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '点赞' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_like
-- ----------------------------

-- ----------------------------
-- Table structure for fs_resource_navigate
-- ----------------------------
DROP TABLE IF EXISTS `fs_resource_navigate`;
CREATE TABLE `fs_resource_navigate`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '资源导航编号',
  `resource_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名字',
  `logo` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'logo(图片)',
  `category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建用户id',
  `update_user` bigint NULL DEFAULT NULL COMMENT '更新用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源导航' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_resource_navigate
-- ----------------------------
INSERT INTO `fs_resource_navigate` VALUES (4, 'everypixel', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717133906890_ux03zz.jpg', '图片', '免费图片聚合搜索，用这一个就够了', 'https://www.everypixel.com/free', 0, 1812, 1812, '2022-07-17 13:39:08', '2022-07-17 13:39:08');
INSERT INTO `fs_resource_navigate` VALUES (16, 'Kaboom Pics', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717134927958_yl0i7o.png', '图片', '清新好看的摄影照片', 'https://kaboompics.com/', 0, 1812, 1812, '2022-07-17 13:49:19', '2022-07-17 13:49:29');
INSERT INTO `fs_resource_navigate` VALUES (17, 'colorhub', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717134957966_7m0l5n.jpg', '图片', '高清无版权图片，个人和商业用途免费', 'https://colorhub.me/', 0, 1812, 1812, '2022-07-17 13:49:59', '2022-07-17 13:49:59');
INSERT INTO `fs_resource_navigate` VALUES (18, 'mixkit', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140000829_bc0sqt.jpg', '视频', '很棒的免费视频素材', 'https://mixkit.co/', 0, 1812, 1812, '2022-07-17 14:00:02', '2022-07-17 14:00:02');
INSERT INTO `fs_resource_navigate` VALUES (19, 'coverr', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140032092_eg0em5.png', '视频', '优秀的免费视频素材', 'https://coverr.co/', 0, 1812, 1812, '2022-07-17 14:00:33', '2022-07-17 14:00:33');
INSERT INTO `fs_resource_navigate` VALUES (20, 'Mazwai', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140101021_bd0n71.jpg', '视频', '免费视频素材库', 'https://mazwai.com/#/grid', 0, 1812, 1812, '2022-07-17 14:01:02', '2022-07-17 14:01:02');
INSERT INTO `fs_resource_navigate` VALUES (21, 'Vidlery', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140231878_5s0eyu.png', '视频', '免费的卡通背景视频', 'http://p3nlhclust404.shr.prod.phx3.secureserver.net/SharedContent/redirect_0.html', 0, 1812, 1812, '2022-07-17 14:02:33', '2022-07-17 14:02:33');
INSERT INTO `fs_resource_navigate` VALUES (22, 'FreeSound', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140319890_2o04lw.png', '音频', '非常多的免费音乐', 'https://freesound.org/', 0, 1812, 1812, '2022-07-17 14:03:21', '2022-07-17 14:03:21');
INSERT INTO `fs_resource_navigate` VALUES (23, 'cchound', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140353800_cg08g8.png', '音频', '免费音乐聚合网站', 'https://cchound.com/', 0, 1812, 1812, '2022-07-17 14:03:55', '2022-07-17 14:03:55');
INSERT INTO `fs_resource_navigate` VALUES (28, 'unDraw', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140653328_4e0ma1.jpg', '插画', '最棒最全的插画库', 'https://undraw.co/illustrations', 0, 1812, 1812, '2022-07-17 14:06:55', '2022-07-17 14:06:55');

-- ----------------------------
-- Table structure for fs_slideshow
-- ----------------------------
DROP TABLE IF EXISTS `fs_slideshow`;
CREATE TABLE `fs_slideshow`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '轮播图编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '轮播图',
  `jump_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建用户id',
  `update_user` bigint NULL DEFAULT NULL COMMENT '更新用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_slideshow
-- ----------------------------
INSERT INTO `fs_slideshow` VALUES (1, '测试001', 'http://aid.nansin.top/default/slider-20200706000714_1.png', NULL, NULL, 1, 0, 1812, 1812, '2023-02-01 15:54:28', '2023-02-01 15:54:30');
INSERT INTO `fs_slideshow` VALUES (2, '测试002', 'http://aid.nansin.top/default/slider-20200706001316_2.png', NULL, NULL, 1, 0, 1812, 1812, '2023-02-01 16:01:06', '2023-02-01 16:01:09');
INSERT INTO `fs_slideshow` VALUES (3, '测试003', 'http://aid.nansin.top/default/slider-20200706001324_3.png', NULL, NULL, 1, 0, 1812, 1812, '2023-02-01 16:01:06', '2023-02-01 16:01:09');
INSERT INTO `fs_slideshow` VALUES (4, '测试004', 'http://aid.nansin.top/default/slider-20200706001342_5.png', NULL, NULL, 1, 0, 1812, 1812, '2023-02-01 16:01:06', '2023-02-01 16:01:09');
INSERT INTO `fs_slideshow` VALUES (5, '微服务全景图', 'http://aid.nansin.top/default/slider-SpringCloudAlibaba.png', NULL, NULL, 1, 0, 1812, 1812, '2023-02-06 15:26:49', '2023-02-06 15:26:49');

-- ----------------------------
-- Table structure for fs_user_level
-- ----------------------------
DROP TABLE IF EXISTS `fs_user_level`;
CREATE TABLE `fs_user_level`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户等级编号',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Lv1' COMMENT '等级（Lv6）',
  `points` int NULL DEFAULT 0 COMMENT '积分',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1014 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户等级' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_user_level
-- ----------------------------
INSERT INTO `fs_user_level` VALUES (24, 1674, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (25, 1670, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (26, 1646, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (27, 1685, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (28, 1657, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (29, 1665, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (30, 1645, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (31, 1681, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (32, 1650, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (33, 1649, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (34, 1673, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (35, 1642, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (36, 1662, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (37, 1669, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (38, 1677, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (39, 1658, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (40, 1661, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (41, 1654, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (42, 1666, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (43, 1653, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (44, 1705, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (45, 1737, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (46, 1709, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (47, 1749, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (48, 1761, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (49, 1753, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (50, 1689, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (51, 1765, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (52, 1713, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (53, 1741, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (54, 1725, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (55, 1733, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (56, 1745, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (57, 1721, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (58, 1701, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (59, 1697, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (60, 1757, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (61, 1717, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (62, 1729, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (63, 1693, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (64, 1769, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (65, 1686, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (66, 1726, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (67, 1710, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (68, 1694, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (69, 1718, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (70, 1678, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (71, 1690, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (72, 1682, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (73, 1722, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (74, 1734, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (75, 1702, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (76, 1706, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (77, 1714, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (78, 1698, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (79, 1738, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (80, 1730, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (81, 1746, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (82, 1742, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (83, 1750, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (84, 1758, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (85, 1754, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (86, 1781, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (87, 1766, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (88, 1762, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (89, 1813, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (90, 1797, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (91, 1789, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (92, 1773, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (93, 1801, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (94, 1777, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (95, 1785, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (96, 1793, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (97, 1817, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (98, 1805, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (99, 1821, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (100, 1809, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (101, 1829, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (102, 1833, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (103, 1825, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (104, 1841, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (105, 1837, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (106, 1861, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (107, 1849, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (108, 1845, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (109, 1881, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (110, 1869, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (111, 1857, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (112, 1865, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (113, 1885, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (114, 1873, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (115, 1877, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (116, 1853, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (117, 1889, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (118, 1770, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (119, 1782, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (120, 1790, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (121, 1897, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (122, 1778, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (123, 1893, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (124, 1774, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (125, 1786, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (126, 1794, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (127, 1806, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (128, 1802, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (129, 1818, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (130, 1798, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (131, 1826, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (132, 1834, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (133, 1814, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (134, 1810, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (135, 1830, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (136, 1822, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (137, 1838, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (138, 1866, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (139, 1850, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (140, 1854, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (141, 1846, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (142, 1842, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (143, 1858, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (144, 1870, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (145, 1862, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (146, 1886, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (147, 1878, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (148, 1905, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (149, 1909, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (150, 1894, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (151, 1882, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (152, 1917, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (153, 1901, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (154, 1874, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (155, 1890, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (156, 1913, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (157, 1921, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (158, 1937, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (159, 1941, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (160, 1949, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (161, 1933, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (162, 1925, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (163, 1929, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (164, 1953, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (165, 1945, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (166, 1973, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (167, 1997, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (168, 1961, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (169, 1969, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (170, 1965, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (171, 1957, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (172, 1989, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (173, 1981, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (174, 1985, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (175, 1977, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (176, 1993, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (177, 2001, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (178, 2009, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (179, 2021, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (180, 2017, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (181, 2025, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (182, 2013, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (183, 2005, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (184, 1898, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (185, 1902, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (186, 1946, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (187, 1906, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (188, 1942, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (189, 1914, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (190, 1922, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (191, 1910, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (192, 1926, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (193, 1930, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (194, 1934, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (195, 1918, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (196, 1938, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (197, 1950, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (198, 1970, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (199, 1974, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (200, 1966, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (201, 1982, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (202, 1958, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (203, 1962, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (204, 1978, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (205, 1954, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (206, 2026, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (207, 1994, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (208, 2010, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (209, 1998, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (210, 1986, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (211, 1990, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (212, 2006, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (213, 2022, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (214, 2014, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (215, 2018, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (216, 2002, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (217, 2042, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (218, 2030, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (219, 2058, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (220, 2062, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (221, 2050, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (222, 2038, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (223, 2054, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (224, 2046, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (225, 2034, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (226, 2066, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (227, 2086, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (228, 2102, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (229, 2110, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (230, 2078, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (231, 2090, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (232, 2118, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (233, 2098, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (234, 2106, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (235, 2094, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (236, 2082, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (237, 2074, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (238, 2114, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (239, 2070, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (240, 2122, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (241, 2130, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (242, 2126, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (243, 2138, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (244, 2134, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (245, 2142, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (246, 2146, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (247, 2049, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (248, 2158, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (249, 2033, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (250, 2029, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (251, 2041, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (252, 2162, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (253, 2045, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (254, 2154, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (255, 2057, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (256, 2170, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (257, 2150, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (258, 2166, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (259, 2178, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (260, 2037, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (261, 2061, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (262, 2174, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (263, 2065, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (264, 2053, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (265, 2069, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (266, 2182, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (267, 2073, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (268, 2186, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (269, 2109, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (270, 2101, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (271, 2093, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (272, 2190, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (273, 2085, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (274, 2077, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (275, 2194, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (276, 2198, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (277, 2097, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (278, 2081, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (279, 2202, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:02');
INSERT INTO `fs_user_level` VALUES (280, 2121, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (281, 2113, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (282, 2105, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (283, 2125, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (284, 2117, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (285, 2089, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (286, 2129, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (287, 2137, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (288, 2153, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (289, 2133, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (290, 2141, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (291, 2149, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (292, 2145, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (293, 2181, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (294, 2185, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (295, 2169, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (296, 2193, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (297, 2165, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (298, 2201, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (299, 2189, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (300, 2157, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (301, 2161, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (302, 2177, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (303, 2173, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (304, 2197, 'Lv1', 0, '2022-06-11 11:17:29', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (305, 1652, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (306, 1660, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (307, 1644, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (308, 1672, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (309, 1676, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (310, 1640, 'Lv3', 327, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (311, 1664, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (312, 1656, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (313, 1648, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (314, 1668, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (315, 1684, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (316, 1704, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (317, 1688, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (318, 1692, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (319, 1712, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (320, 1696, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (321, 1700, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (322, 1680, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (323, 1708, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (324, 1716, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (325, 1720, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (327, 1724, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (328, 1732, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (329, 1728, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (330, 1760, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (331, 1740, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (332, 1643, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (333, 1744, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (334, 1659, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (335, 1736, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (336, 1647, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (337, 1752, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (338, 1663, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (339, 1764, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (340, 1748, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (341, 1655, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (342, 1756, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (343, 1667, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (344, 1651, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (345, 1671, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (346, 1675, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (347, 1679, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (348, 1691, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (349, 1683, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (350, 1699, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (351, 1687, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (352, 1695, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (353, 1703, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (354, 1707, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (355, 1723, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (356, 1715, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (357, 1751, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (358, 1727, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (359, 1711, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (360, 1743, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (361, 1747, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (362, 1735, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (363, 1739, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (364, 1719, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (365, 1731, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (366, 1759, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (367, 1763, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (368, 1755, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (369, 1791, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (370, 1779, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (371, 1783, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (372, 1768, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (373, 1831, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (374, 1823, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (375, 1819, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (376, 1795, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (377, 1799, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (378, 1827, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (379, 1775, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (380, 1787, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (381, 1815, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (382, 1839, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (383, 1807, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (384, 1835, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (385, 1767, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (386, 1811, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (387, 1803, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (388, 1771, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (389, 1772, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (390, 1820, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (391, 1800, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (392, 1816, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (393, 1780, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (394, 1788, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (395, 1804, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (396, 1784, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (397, 1776, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (398, 1847, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (399, 1792, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (400, 1812, 'Lv1', 6, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (401, 1796, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (402, 1832, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (403, 1808, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:00');
INSERT INTO `fs_user_level` VALUES (404, 1855, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (405, 1851, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (406, 1828, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (407, 1843, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (408, 1824, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (409, 1836, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (410, 1892, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (411, 1840, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (412, 1852, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (413, 1860, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (414, 1859, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (415, 1864, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (416, 1888, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (417, 1880, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (418, 1856, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (419, 1848, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (420, 1876, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (421, 1868, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (422, 1884, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (423, 1844, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (424, 1872, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (425, 1867, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (426, 1863, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (427, 1871, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (428, 1875, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (429, 1879, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (430, 1883, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (431, 1887, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (432, 1891, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (433, 1928, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (434, 1940, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (435, 1900, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (436, 1968, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (437, 1960, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (438, 1972, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (439, 1896, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (440, 1912, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (441, 1952, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (442, 1924, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (443, 1956, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (444, 1944, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (445, 1904, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (446, 1964, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (447, 1932, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (448, 1948, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (449, 1908, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (450, 1920, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (451, 1936, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (452, 1916, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (453, 1976, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (454, 1980, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (455, 1895, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (456, 1907, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (457, 1984, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (458, 2008, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (459, 2012, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (460, 1988, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (461, 2020, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (462, 2016, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (463, 1903, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (464, 2000, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (465, 1992, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (466, 1899, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (467, 1915, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (468, 1923, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (469, 1996, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (470, 1919, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (471, 1911, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (472, 2004, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (473, 1927, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (474, 1963, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (475, 1959, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (476, 1935, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (477, 1979, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (478, 1995, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (479, 1939, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (480, 1987, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (481, 1943, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (482, 1999, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (483, 1931, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (484, 1951, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (485, 1947, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (486, 1971, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (487, 1991, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (488, 1967, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (489, 1983, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (490, 1955, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (491, 1975, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (492, 2003, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (493, 2007, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (494, 2015, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (495, 2011, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (496, 2019, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (497, 2096, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (498, 2088, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (499, 2032, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (500, 2092, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (501, 2100, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (502, 2084, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (503, 2028, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (504, 2052, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (505, 2060, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (506, 2056, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (507, 2036, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (508, 2068, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (509, 2040, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (510, 2072, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (511, 2080, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (512, 2076, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (513, 2064, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (514, 2024, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (515, 2044, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (516, 2048, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (517, 2104, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (518, 2124, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (519, 2120, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (520, 2023, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (521, 2144, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (522, 2136, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (523, 2128, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (524, 2108, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (525, 2112, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (526, 2148, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (527, 2132, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (528, 2140, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (529, 2116, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (530, 2035, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (531, 2027, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (532, 2031, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (533, 2039, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (534, 2047, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (535, 2051, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (536, 2043, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (537, 2055, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (538, 2071, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (539, 2067, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (540, 2063, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (541, 2083, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (542, 2095, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (543, 2059, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (544, 2075, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (545, 2079, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (546, 2091, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (547, 2087, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (548, 2103, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (549, 2099, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (550, 2111, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (551, 2107, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (552, 2119, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (553, 2115, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (554, 2123, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (555, 2127, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (556, 2131, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (557, 2135, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (558, 2147, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (559, 2143, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (560, 2139, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (561, 2196, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (562, 2156, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (563, 2160, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (564, 2168, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (565, 2164, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (566, 2172, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (567, 2200, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (568, 2176, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (569, 2192, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (570, 2188, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (571, 2180, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (572, 2152, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (573, 2184, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (574, 2171, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (575, 2183, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (576, 2167, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (577, 2179, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (578, 2187, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (579, 2175, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (580, 2151, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (581, 2195, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (582, 2155, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (583, 2159, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (584, 2163, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (585, 2199, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (586, 2191, 'Lv1', 0, '2022-06-11 11:17:30', '2022-06-28 21:07:01');
INSERT INTO `fs_user_level` VALUES (589, 2206, 'Lv1', 0, '2022-06-22 11:24:27', '2022-06-28 21:07:02');
INSERT INTO `fs_user_level` VALUES (590, 2207, 'Lv1', 0, '2022-06-23 10:02:52', '2022-06-28 21:07:02');
INSERT INTO `fs_user_level` VALUES (591, 2208, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (592, 2209, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (593, 2210, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (594, 2211, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (595, 2212, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (596, 2213, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (597, 2214, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (598, 2215, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (599, 2216, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (600, 2217, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (601, 2218, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (602, 2219, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (603, 2220, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (604, 2221, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (605, 2222, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (606, 2223, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (607, 2224, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (608, 2225, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (609, 2226, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (610, 2227, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (611, 2228, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (612, 2229, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (613, 2230, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (614, 2231, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (615, 2232, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (616, 2233, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (617, 2234, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (618, 2235, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (619, 2236, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (620, 2237, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (621, 2238, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (622, 2239, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (623, 2240, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (624, 2241, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (625, 2242, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (626, 2243, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (627, 2244, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (628, 2245, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (629, 2246, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (630, 2247, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (631, 2248, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (632, 2249, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (633, 2250, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (634, 2251, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (635, 2252, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (636, 2253, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (637, 2254, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (638, 2255, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (639, 2256, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (640, 2257, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (641, 2258, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (642, 2259, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (643, 2260, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (644, 2261, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (645, 2262, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (646, 2263, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (647, 2264, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (648, 2265, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (649, 2266, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (650, 2267, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (651, 2268, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (652, 2269, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (653, 2270, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (654, 2271, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (655, 2272, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (656, 2273, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (657, 2274, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (658, 2275, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (659, 2276, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (660, 2277, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (661, 2278, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (662, 2279, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (663, 2280, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (664, 2281, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (665, 2282, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (666, 2283, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (667, 2284, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (668, 2285, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (669, 2286, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (670, 2287, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (671, 2288, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (672, 2289, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (673, 2290, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (674, 2291, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (675, 2292, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (676, 2293, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (677, 2294, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (678, 2295, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (679, 2296, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (680, 2297, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (681, 2298, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (682, 2299, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (683, 2300, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (684, 2301, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (685, 2302, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (686, 2303, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (687, 2304, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (688, 2305, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (689, 2306, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (690, 2308, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (691, 2309, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (692, 2310, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (693, 2311, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (694, 2312, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (695, 2313, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (696, 2314, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (697, 2315, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (698, 2316, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (699, 2317, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (700, 2318, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (701, 2319, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (702, 2320, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (703, 2321, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (704, 2322, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (705, 2323, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (706, 2324, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (707, 2325, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (708, 2326, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (709, 2327, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (710, 2328, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (711, 2329, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (712, 2330, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (713, 2331, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (714, 2332, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (715, 2333, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (716, 2334, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (717, 2335, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (718, 2336, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (719, 2337, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (720, 2338, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (721, 2339, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (722, 2340, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (723, 2341, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (724, 2342, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (725, 2343, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (726, 2344, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (727, 2345, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (728, 2346, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (729, 2347, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (730, 2348, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (731, 2349, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (732, 2350, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (733, 2351, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (734, 2352, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (735, 2353, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (736, 2354, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (737, 2355, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (738, 2356, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (739, 2357, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (740, 2358, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (741, 2359, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (742, 2360, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (743, 2361, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (744, 2362, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (745, 2363, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (746, 2364, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (747, 2365, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (748, 2366, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (749, 2367, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (750, 2368, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (751, 2369, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (752, 2370, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (753, 2371, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (754, 2372, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (755, 2373, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (756, 2374, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (757, 2375, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (758, 2376, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (759, 2377, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (760, 2378, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (761, 2379, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (762, 2380, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (763, 2381, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (764, 2382, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (765, 2383, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (766, 2384, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (767, 2385, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (768, 2386, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (769, 2387, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (770, 2388, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (771, 2389, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (772, 2390, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (773, 2391, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (774, 2392, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (775, 2393, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (776, 2394, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (777, 2395, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (778, 2396, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (779, 2397, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (780, 2398, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (781, 2399, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (782, 2400, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (783, 2401, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (784, 2402, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (785, 2403, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (786, 2404, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (787, 2405, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (788, 2406, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (789, 2407, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (790, 2408, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (791, 2409, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (792, 2410, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (793, 2411, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (794, 2412, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (795, 2413, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (796, 2414, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (797, 2415, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (798, 2416, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (799, 2417, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (800, 2418, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (801, 2419, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (802, 2420, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (803, 2421, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (804, 2422, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (805, 2423, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (806, 2424, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (807, 2425, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (808, 2426, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (809, 2427, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (810, 2428, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (811, 2429, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (812, 2430, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (813, 2431, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (814, 2432, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (815, 2433, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (816, 2434, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (817, 2435, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (818, 2436, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (819, 2437, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (820, 2438, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (821, 2439, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (822, 2440, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (823, 2441, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (824, 2442, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (825, 2443, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (826, 2444, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (827, 2445, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (828, 2446, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (829, 2447, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (830, 2448, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (831, 2449, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (832, 2450, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (833, 2451, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (834, 2452, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (835, 2453, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (836, 2454, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (837, 2455, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (838, 2456, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (839, 2457, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (840, 2458, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (841, 2459, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (842, 2460, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (843, 2461, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (844, 2462, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (845, 2463, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (846, 2464, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (847, 2465, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (848, 2466, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (849, 2467, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (850, 2468, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (851, 2469, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (852, 2470, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (853, 2471, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (854, 2472, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (855, 2473, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (856, 2474, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (857, 2475, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (858, 2476, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (859, 2477, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (860, 2478, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (861, 2479, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (862, 2480, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (863, 2481, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (864, 2482, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (865, 2483, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (866, 2484, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (867, 2485, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (868, 2486, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (869, 2487, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (870, 2488, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (871, 2489, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (872, 2490, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (873, 2491, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (874, 2492, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (875, 2493, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (876, 2494, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (877, 2495, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (878, 2496, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (879, 2497, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (880, 2498, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (881, 2499, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (882, 2500, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (883, 2501, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (884, 2502, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (885, 2503, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (886, 2504, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (887, 2505, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (888, 2506, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (889, 2507, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (890, 2508, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (891, 2509, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (892, 2510, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (893, 2511, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (894, 2512, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (895, 2513, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (896, 2514, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (897, 2515, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (898, 2516, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (899, 2517, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (900, 2518, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (901, 2519, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (902, 2520, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (903, 2521, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (904, 2522, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (905, 2523, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (906, 2524, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (907, 2525, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (908, 2526, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (909, 2527, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (910, 2528, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (911, 2529, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (912, 2530, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (913, 2531, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (914, 2532, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (915, 2533, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (916, 2534, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (917, 2535, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (918, 2536, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (919, 2537, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (920, 2538, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (921, 2539, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (922, 2540, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (923, 2541, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (924, 2542, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (925, 2543, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (926, 2544, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (927, 2545, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (928, 2546, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (929, 2547, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (930, 2548, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (931, 2549, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (932, 2550, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (933, 2551, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (934, 2552, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (935, 2553, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (936, 2554, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (937, 2555, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (938, 2556, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (939, 2557, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (940, 2558, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (941, 2559, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (942, 2560, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (943, 2561, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (944, 2562, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (945, 2563, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (946, 2564, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (947, 2565, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (948, 2566, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (949, 2567, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (950, 2568, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (951, 2569, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (952, 2570, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (953, 2571, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (954, 2572, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (955, 2573, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (956, 2574, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (957, 2575, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (958, 2576, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (959, 2577, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (960, 2578, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (961, 2579, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (962, 2580, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (963, 2581, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (964, 2582, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (965, 2583, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (966, 2584, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (967, 2585, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (968, 2586, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (969, 2587, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (970, 2588, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (971, 2589, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (972, 2590, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (973, 2591, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (974, 2592, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (975, 2593, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (976, 2594, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (977, 2595, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (978, 2596, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (979, 2597, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (980, 2598, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (981, 2599, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (982, 2600, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (983, 2601, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (984, 2602, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (985, 2603, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (986, 2604, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (987, 2605, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (988, 2606, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (989, 2607, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (990, 2608, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (991, 2609, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (992, 2610, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (993, 2611, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (994, 2612, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (995, 2613, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (996, 2614, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (997, 2615, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (998, 2616, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (999, 2617, 'Lv1', 0, '2023-09-25 21:31:01', '2023-09-25 21:31:01');
INSERT INTO `fs_user_level` VALUES (1000, 2618, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');
INSERT INTO `fs_user_level` VALUES (1001, 2619, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');
INSERT INTO `fs_user_level` VALUES (1002, 2620, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');
INSERT INTO `fs_user_level` VALUES (1003, 2621, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');
INSERT INTO `fs_user_level` VALUES (1004, 2622, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');
INSERT INTO `fs_user_level` VALUES (1005, 2623, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');
INSERT INTO `fs_user_level` VALUES (1006, 2624, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');
INSERT INTO `fs_user_level` VALUES (1007, 2625, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');
INSERT INTO `fs_user_level` VALUES (1008, 2626, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');
INSERT INTO `fs_user_level` VALUES (1009, 2627, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');
INSERT INTO `fs_user_level` VALUES (1010, 2628, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');
INSERT INTO `fs_user_level` VALUES (1011, 2629, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');
INSERT INTO `fs_user_level` VALUES (1012, 2630, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');
INSERT INTO `fs_user_level` VALUES (1013, 2631, 'Lv1', 0, '2023-09-25 21:31:02', '2023-09-25 21:31:02');

SET FOREIGN_KEY_CHECKS = 1;
