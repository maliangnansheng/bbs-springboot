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

 Date: 25/07/2024 20:45:44
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
INSERT INTO `fs_article` VALUES (26, 'http://aid.nansin.top/default/articleTitleMap-20220612230127855_v1.png', '南生论坛v1.0 ~ v2.0', '注：以下截图是v1.0和v2.0的界面样子\r\n功能说明\r\n南生论坛v1.0\r\n登录【用户系统】可以：发帖、修改帖子、删除帖子、评论、删除评论、修改个人信息、关注、收藏\r\n登录【管理系统】可以：管理用户、管理帖子、管理板块、访问记录\r\n南生论坛v2.0\r\n在v1.0的基础上：整体异步实现、新增统计饼图、优化人机交互、实现分页、实现相册功能、实现月周日访问记录（方便管理员了解该论坛的访问情况）\r\n适用', 1, 13, NULL, 0, 1640, 1640, '2022-06-12 23:01:28', '2022-06-12 23:04:17');
INSERT INTO `fs_article` VALUES (27, 'http://aid.nansin.top/default/articleTitleMap-20220621234043897_v2.6.png', '南生论坛v2.6', '注：以下截图是v2.6的界面样子\r\n功能说明\r\n南生论坛v2.6\r\n在v2.0的基础上：支持Markdown、新增分享功能、新增文章详情页面、首页文章显示简约化\r\n适用人员\r\n南生论坛v2.6\r\n该版本适用于初学ssm框架、对jQuery和ajax有一定熟悉度、并且想以Markdown形式写文章的童鞋使用，主要可以通过该项目了解整个项目的设计思路（让心怀大志、无从下手的你找到突破口）\r\n优势\r\n南', 1, 15, NULL, 0, 1640, 1640, '2022-06-12 23:14:44', '2022-06-21 23:40:44');
INSERT INTO `fs_article` VALUES (28, 'http://aid.nansin.top/default/articleTitleMap-20220621234309237_v2.8.2.png', '南生论坛v2.8.2', '注：以下截图是v2.8.2的界面样子\r\n功能说明\r\n南生论坛v2.8.2\r\n在v2.6的基础上： 对前后端代码和数据库表进行了全面重构，新增了闲聊，图片/视频文件压缩并上七牛云，优化系统，提升访问效率，新增轮播图管理、项目管理，运用了Redis缓存技术\r\n适用人员\r\n南生论坛v2.8.2\r\n该版本适用于对ssm框架有一定熟悉度、对代码规范度要求比较高、对图片/视频文件上云有兴趣的童鞋使用，主要可以', 1, 50, NULL, 0, 1640, 1640, '2022-06-12 23:25:31', '2022-06-21 23:43:10');
INSERT INTO `fs_article` VALUES (38, 'http://aid.nansin.top/default/articleTitleMap-20220613000158304_76yun.png', '优化系统，提升访问效率', '发现问题\r\n网站访问效率低下，经过测试，发现主要由两个原因造成：\r\n本身云服务器的带宽不足（这个问题:tw-1f236:RMB可以解决）\r\n图片/视频文件过大，消耗大量的流量\r\n思考分析\r\n要解决以上问题可以从两个方面着手：\r\n图片/视频文件不走我们自己的服务器\r\n压缩图片/视频文件\r\n解决问题\r\n将图片/视频文件全部压缩到指定范围（自己找一个能忍受清晰度就行:fa-reddit:），避免文件过大', 1, 802, NULL, 0, 1640, 1640, '2020-06-04 23:24:48', '2023-09-25 22:10:00');
INSERT INTO `fs_article` VALUES (40, 'http://aid.nansin.top/default/articleTitleMap-20220621223826164_v3.0.0.png', '本系统【南生论坛v3.0.0】来了（SpringBoot + Vue）', '重要说明\r\n南生论坛v3.0.0是全新的一套系统！所有的数据表（用户、角色、权限等）都重新设计过，所以v2.8.2与v3.0.0的数据是不互通的。\r\n不过你之前在v2.8.2上注册（2022.6.11之后注册的不行）的用户信息在v3.0.0依然可以登录。\r\nv3.0.0以后所有的南生系列系统共用一套用户权限系统。\r\n目前使用同一套用户权限的有：南生论坛、南生运营、南生闲聊。\r\n如何进入旧版系统\r\n', 1, 70, NULL, 0, 1640, 1640, '2022-06-21 22:32:04', '2022-06-23 10:27:48');
INSERT INTO `fs_article` VALUES (41, 'http://aid.nansin.top/default/articleTitleMap-20220623221450862_logo-1.png', 'PM2 一个守护进程管理器', 'PM2 是 node 进程管理工具，可以利用它来简化很多 node应用管理的繁琐任务，如性能监控、自动重启、负载均衡等，而且使用非常简单。\r\n官方\r\n官网\r\nGitHub\r\n文档\r\nPM2简介\r\nPM2原先是nodejs应用的进程管理工具，不过其良好的设计以及扩展性可以手动执行执行进程。\r\n安装\r\n最新的 PM2 版本可通过 NPM 或 Yarn 安装：\r\nnpm install pm2@late', 1, 50, 1, 0, 1640, 1640, '2022-06-23 18:32:53', '2022-06-23 22:14:51');

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
INSERT INTO `fs_article_label` VALUES (12, 26, 12, 0, 1640, 1640, '2022-06-12 23:01:28', '2022-06-12 23:01:28');
INSERT INTO `fs_article_label` VALUES (13, 26, 11, 0, 1640, 1640, '2022-06-12 23:01:28', '2022-06-12 23:01:28');
INSERT INTO `fs_article_label` VALUES (14, 27, 12, 0, 1640, 1640, '2022-06-12 23:14:44', '2022-06-12 23:14:44');
INSERT INTO `fs_article_label` VALUES (15, 27, 11, 0, 1640, 1640, '2022-06-12 23:14:44', '2022-06-12 23:14:44');
INSERT INTO `fs_article_label` VALUES (16, 28, 12, 0, 1640, 1640, '2022-06-12 23:25:31', '2022-06-12 23:25:31');
INSERT INTO `fs_article_label` VALUES (17, 28, 11, 0, 1640, 1640, '2022-06-12 23:25:31', '2022-06-12 23:25:31');
INSERT INTO `fs_article_label` VALUES (18, 29, 13, 0, 1640, 1640, '2022-06-12 23:38:11', '2022-06-12 23:38:11');
INSERT INTO `fs_article_label` VALUES (19, 30, 13, 0, 1640, 1640, '2022-06-12 23:46:42', '2022-06-12 23:46:42');
INSERT INTO `fs_article_label` VALUES (20, 31, 13, 0, 1640, 1640, '2022-06-12 23:47:51', '2022-06-12 23:47:51');
INSERT INTO `fs_article_label` VALUES (21, 32, 13, 0, 1640, 1640, '2022-06-12 23:49:32', '2022-06-12 23:49:32');
INSERT INTO `fs_article_label` VALUES (22, 33, 13, 0, 1640, 1640, '2022-06-12 23:50:38', '2022-06-12 23:50:38');
INSERT INTO `fs_article_label` VALUES (23, 34, 13, 0, 1640, 1640, '2022-06-12 23:52:53', '2022-06-12 23:52:53');
INSERT INTO `fs_article_label` VALUES (24, 34, 9, 0, 1640, 1640, '2022-06-12 23:52:53', '2022-06-12 23:52:53');
INSERT INTO `fs_article_label` VALUES (25, 35, 11, 0, 1640, 1640, '2022-06-12 23:55:23', '2022-06-12 23:55:23');
INSERT INTO `fs_article_label` VALUES (26, 35, 14, 0, 1640, 1640, '2022-06-12 23:56:34', '2022-06-12 23:56:34');
INSERT INTO `fs_article_label` VALUES (27, 36, 15, 0, 1640, 1640, '2022-06-12 23:58:56', '2022-06-12 23:58:56');
INSERT INTO `fs_article_label` VALUES (28, 36, 13, 0, 1640, 1640, '2022-06-12 23:58:56', '2022-06-12 23:58:56');
INSERT INTO `fs_article_label` VALUES (29, 37, 11, 0, 1640, 1640, '2022-06-13 00:00:08', '2022-06-13 00:00:08');
INSERT INTO `fs_article_label` VALUES (30, 38, 16, 0, 1640, 1640, '2022-06-13 00:01:59', '2022-06-13 00:01:59');
INSERT INTO `fs_article_label` VALUES (31, 38, 11, 0, 1640, 1640, '2022-06-13 00:01:59', '2022-06-13 00:01:59');
INSERT INTO `fs_article_label` VALUES (32, 39, 15, 0, 1640, 1640, '2022-06-21 14:46:25', '2022-06-21 14:46:25');
INSERT INTO `fs_article_label` VALUES (33, 40, 12, 0, 1640, 1640, '2022-06-21 22:32:04', '2022-06-21 22:32:04');
INSERT INTO `fs_article_label` VALUES (34, 40, 11, 0, 1640, 1640, '2022-06-21 22:32:04', '2022-06-21 22:32:04');
INSERT INTO `fs_article_label` VALUES (35, 41, 20, 0, 1640, 1640, '2022-06-23 18:32:53', '2022-06-23 18:32:53');
INSERT INTO `fs_article_label` VALUES (36, 41, 13, 0, 1640, 1640, '2022-06-23 18:32:53', '2022-06-23 18:32:53');
INSERT INTO `fs_article_label` VALUES (37, 41, 17, 0, 1640, 1640, '2022-06-23 18:32:53', '2022-06-23 18:32:53');

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
INSERT INTO `fs_label` VALUES (4, 'Vue.js', 'http://aid.nansin.top/default/labelPicture-20220612145638935_Vue.png', 0, 1640, 1640, '2022-06-11 12:03:36', '2022-06-12 14:56:41');
INSERT INTO `fs_label` VALUES (5, 'Kubernetes', 'http://aid.nansin.top/default/labelPicture-20220612145701133_rnetes.png', 0, 1640, 1640, '2022-06-11 12:10:38', '2022-06-12 14:57:02');
INSERT INTO `fs_label` VALUES (6, 'Docker', 'http://aid.nansin.top/default/labelPicture-20220612145707795_Docker.png', 0, 1640, 1640, '2022-06-11 12:11:03', '2022-06-12 14:57:09');
INSERT INTO `fs_label` VALUES (8, 'Spring Boot', 'http://aid.nansin.top/default/labelPicture-20220612145715490_g-boot.png', 0, 1640, 1640, '2022-06-11 12:14:00', '2022-06-12 14:57:17');
INSERT INTO `fs_label` VALUES (9, '运维', 'http://aid.nansin.top/default/labelPicture-20220612145722862_19运维管理.png', 0, 1640, 1640, '2022-06-11 12:15:11', '2022-06-12 14:57:24');
INSERT INTO `fs_label` VALUES (10, '操作系统', 'http://aid.nansin.top/default/labelPicture-20220612145729342_操作系统.png', 0, 1640, 1640, '2022-06-11 12:16:24', '2022-06-12 14:57:30');
INSERT INTO `fs_label` VALUES (11, '公告', 'http://aid.nansin.top/default/labelPicture-20220612145735299_eboard.png', 0, 1640, 1640, '2022-06-11 12:36:46', '2022-06-12 14:57:36');
INSERT INTO `fs_label` VALUES (12, '南生论坛迭代', 'http://aid.nansin.top/default/labelPicture-20220612224902616_-lanse.png', 0, 1640, 1640, '2022-06-12 22:49:06', '2022-06-12 22:49:55');
INSERT INTO `fs_label` VALUES (13, '推荐', 'http://aid.nansin.top/default/labelPicture-20220612233448611_推荐.png', 0, 1640, 1640, '2022-06-12 23:34:53', '2022-06-12 23:34:53');
INSERT INTO `fs_label` VALUES (14, 'Markdown', 'http://aid.nansin.top/default/labelPicture-20220612235625452_rkdown.png', 0, 1640, 1640, '2022-06-12 23:56:27', '2022-06-12 23:56:27');
INSERT INTO `fs_label` VALUES (15, '插件', 'http://aid.nansin.top/default/labelPicture-20220612235758085_插件.png', 0, 1640, 1640, '2022-06-12 23:57:59', '2022-06-12 23:57:59');
INSERT INTO `fs_label` VALUES (16, '优化', 'http://aid.nansin.top/default/labelPicture-20220613000113819_智能优化.png', 0, 1640, 1640, '2022-06-13 00:01:15', '2022-06-13 00:01:15');
INSERT INTO `fs_label` VALUES (17, 'Node.js', 'http://aid.nansin.top/default/labelPicture-20220623173925045_ode.js.png', 0, 1640, 1640, '2022-06-23 17:39:27', '2022-06-23 17:39:27');
INSERT INTO `fs_label` VALUES (18, 'GitHub', 'http://aid.nansin.top/default/labelPicture-20220623174020053_GitHub.png', 0, 1640, 1640, '2022-06-23 17:40:21', '2022-06-23 17:40:21');
INSERT INTO `fs_label` VALUES (19, 'Java', 'http://aid.nansin.top/default/labelPicture-20220623174117612_java.png', 0, 1640, 1640, '2022-06-23 17:41:19', '2022-06-23 17:41:19');
INSERT INTO `fs_label` VALUES (20, 'PM2', 'http://aid.nansin.top/default/labelPicture-20220623174732007_pm2.png', 0, 1640, 1640, '2022-06-23 17:46:23', '2022-06-23 17:47:33');

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
INSERT INTO `fs_resource_navigate` VALUES (4, 'everypixel', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717133906890_ux03zz.jpg', '图片', '免费图片聚合搜索，用这一个就够了', 'https://www.everypixel.com/free', 0, 1640, 1812, '2022-07-17 13:39:08', '2022-07-17 13:39:08');
INSERT INTO `fs_resource_navigate` VALUES (16, 'Kaboom Pics', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717134927958_yl0i7o.png', '图片', '清新好看的摄影照片', 'https://kaboompics.com/', 0, 1640, 1812, '2022-07-17 13:49:19', '2022-07-17 13:49:29');
INSERT INTO `fs_resource_navigate` VALUES (17, 'colorhub', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717134957966_7m0l5n.jpg', '图片', '高清无版权图片，个人和商业用途免费', 'https://colorhub.me/', 0, 1640, 1812, '2022-07-17 13:49:59', '2022-07-17 13:49:59');
INSERT INTO `fs_resource_navigate` VALUES (18, 'mixkit', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140000829_bc0sqt.jpg', '视频', '很棒的免费视频素材', 'https://mixkit.co/', 0, 1640, 1812, '2022-07-17 14:00:02', '2022-07-17 14:00:02');
INSERT INTO `fs_resource_navigate` VALUES (19, 'coverr', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140032092_eg0em5.png', '视频', '优秀的免费视频素材', 'https://coverr.co/', 0, 1640, 1812, '2022-07-17 14:00:33', '2022-07-17 14:00:33');
INSERT INTO `fs_resource_navigate` VALUES (20, 'Mazwai', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140101021_bd0n71.jpg', '视频', '免费视频素材库', 'https://mazwai.com/#/grid', 0, 1640, 1812, '2022-07-17 14:01:02', '2022-07-17 14:01:02');
INSERT INTO `fs_resource_navigate` VALUES (21, 'Vidlery', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140231878_5s0eyu.png', '视频', '免费的卡通背景视频', 'http://p3nlhclust404.shr.prod.phx3.secureserver.net/SharedContent/redirect_0.html', 0, 1640, 1812, '2022-07-17 14:02:33', '2022-07-17 14:02:33');
INSERT INTO `fs_resource_navigate` VALUES (22, 'FreeSound', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140319890_2o04lw.png', '音频', '非常多的免费音乐', 'https://freesound.org/', 0, 1640, 1812, '2022-07-17 14:03:21', '2022-07-17 14:03:21');
INSERT INTO `fs_resource_navigate` VALUES (23, 'cchound', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140353800_cg08g8.png', '音频', '免费音乐聚合网站', 'https://cchound.com/', 0, 1640, 1812, '2022-07-17 14:03:55', '2022-07-17 14:03:55');
INSERT INTO `fs_resource_navigate` VALUES (28, 'unDraw', 'http://aid.nansin.top/default/resourceNavigatePicture-20220717140653328_4e0ma1.jpg', '插画', '最棒最全的插画库', 'https://undraw.co/illustrations', 0, 1640, 1812, '2022-07-17 14:06:55', '2022-07-17 14:06:55');

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
INSERT INTO `fs_slideshow` VALUES (1, '测试001', 'http://aid.nansin.top/default/slider-20200706000714_1.png', NULL, NULL, 1, 0, 1640, 1640, '2023-02-01 15:54:28', '2023-02-01 15:54:30');
INSERT INTO `fs_slideshow` VALUES (2, '测试002', 'http://aid.nansin.top/default/slider-20200706001316_2.png', NULL, NULL, 1, 0, 1640, 1640, '2023-02-01 16:01:06', '2023-02-01 16:01:09');
INSERT INTO `fs_slideshow` VALUES (3, '测试003', 'http://aid.nansin.top/default/slider-20200706001324_3.png', NULL, NULL, 1, 0, 1640, 1640, '2023-02-01 16:01:06', '2023-02-01 16:01:09');
INSERT INTO `fs_slideshow` VALUES (4, '测试004', 'http://aid.nansin.top/default/slider-20200706001342_5.png', NULL, NULL, 1, 0, 1640, 1640, '2023-02-01 16:01:06', '2023-02-01 16:01:09');
INSERT INTO `fs_slideshow` VALUES (5, '微服务全景图', 'http://aid.nansin.top/default/slider-SpringCloudAlibaba.png', NULL, NULL, 1, 0, 1640, 1640, '2023-02-06 15:26:49', '2023-02-06 15:26:49');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1304 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户等级' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fs_user_level
-- ----------------------------
INSERT INTO `fs_user_level` VALUES (1303, 1640, 'Lv2', 100, '2024-07-25 20:16:00', '2024-07-25 20:40:00');

SET FOREIGN_KEY_CHECKS = 1;
