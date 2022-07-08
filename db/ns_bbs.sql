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

 Date: 09/07/2022 00:21:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fs_album
-- ----------------------------
DROP TABLE IF EXISTS `fs_album`;
CREATE TABLE `fs_album`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '相册编号',
  `pre_id` int(0) NULL DEFAULT NULL COMMENT '前置相册id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相册名称',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '照片',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建用户id',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '更新用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '相册' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fs_article
-- ----------------------------
DROP TABLE IF EXISTS `fs_article`;
CREATE TABLE `fs_article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `title_map` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '题图',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
  `pv` int(0) NULL DEFAULT 0 COMMENT '文章浏览量',
  `top` int(0) NULL DEFAULT NULL COMMENT '置顶（数字越大越置顶）',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建用户id',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '更新用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_article
-- ----------------------------
INSERT INTO `fs_article` VALUES (26, 'http://76.nanshengbbs.top/articleTitleMap-20220612230127855_v1.png', '南生论坛v1.0 ~ v2.0', '注：以下截图是v1.0和v2.0的界面样子\r\n功能说明\r\n南生论坛v1.0\r\n登录【用户系统】可以：发帖、修改帖子、删除帖子、评论、删除评论、修改个人信息、关注、收藏\r\n登录【管理系统】可以：管理用户、管理帖子、管理板块、访问记录\r\n南生论坛v2.0\r\n在v1.0的基础上：整体异步实现、新增统计饼图、优化人机交互、实现分页、实现相册功能、实现月周日访问记录（方便管理员了解该论坛的访问情况）\r\n适用', 1, 9, 1, 0, 1640, 1640, '2022-06-12 23:01:28', '2022-06-12 23:04:17');
INSERT INTO `fs_article` VALUES (27, 'http://76.nanshengbbs.top/articleTitleMap-20220621234043897_v2.6.png', '南生论坛v2.6', '注：以下截图是v2.6的界面样子\r\n功能说明\r\n南生论坛v2.6\r\n在v2.0的基础上：支持Markdown、新增分享功能、新增文章详情页面、首页文章显示简约化\r\n适用人员\r\n南生论坛v2.6\r\n该版本适用于初学ssm框架、对jQuery和ajax有一定熟悉度、并且想以Markdown形式写文章的童鞋使用，主要可以通过该项目了解整个项目的设计思路（让心怀大志、无从下手的你找到突破口）\r\n优势\r\n南', 1, 13, 2, 0, 1640, 1640, '2022-06-12 23:14:44', '2022-06-21 23:40:44');
INSERT INTO `fs_article` VALUES (28, 'http://76.nanshengbbs.top/articleTitleMap-20220621234309237_v2.8.2.png', '南生论坛v2.8.2', '注：以下截图是v2.8.2的界面样子\r\n功能说明\r\n南生论坛v2.8.2\r\n在v2.6的基础上： 对前后端代码和数据库表进行了全面重构，新增了闲聊，图片/视频文件压缩并上七牛云，优化系统，提升访问效率，新增轮播图管理、项目管理，运用了Redis缓存技术\r\n适用人员\r\n南生论坛v2.8.2\r\n该版本适用于对ssm框架有一定熟悉度、对代码规范度要求比较高、对图片/视频文件上云有兴趣的童鞋使用，主要可以', 1, 47, 3, 0, 1640, 1640, '2022-06-12 23:25:31', '2022-06-21 23:43:10');
INSERT INTO `fs_article` VALUES (29, 'http://76.nanshengbbs.top/articleTitleMap-20220612233811028_eGlass.jpg', 'ImageGlass - 一款轻量而快速的Windows平台图片查看器', 'ImageGlass是一款轻量而快速的windows平台图片查看器，代码开源，支持大多数图片格式。\r\n官网地址：ImageGlass\r\nGitHub地址：d2phap/ImageGlass\r\n与许多其他功能繁多的图片浏览器相比，ImageGlass显得有些“简陋”；可也正因为这种“简陋”，ImageGlass才更适合看图，没有其他复杂的功能充斥界面。\r\nwin10自带的图片应用加载速度太慢，图片切', 1, 122, NULL, 0, 1640, 1640, '2019-06-01 11:47:16', '2022-06-12 23:38:11');
INSERT INTO `fs_article` VALUES (30, 'http://76.nanshengbbs.top/articleTitleMap-20220612234641351_ardm.png', 'Redis免费客户端 Another Redis DeskTop Manager', '简介\r\nAnother Redis DeskTop Manager 是Redis桌面可视化工具\r\nAnother Redis DeskTop Manager是基于electron构建。目前可以运行在Windows、Linux、Mac平台。如果想学习electron的，也可以看看这个项目的源码。\r\n下载安装\r\n安装教程\r\nGitHub下载\r\n码云下载\r\n变更日志\r\n2020-06-18: SSL/T', 1, 146, NULL, 0, 1640, 1640, '2020-08-28 16:53:25', '2022-06-12 23:46:42');
INSERT INTO `fs_article` VALUES (31, 'http://76.nanshengbbs.top/articleTitleMap-20220612234750668_hutool.jpg', 'Hutool - 一个Java工具包类库', '官网地址\r\nHutool官网\r\n参考文档\r\nAPI文档\r\n视频介绍\r\n码云地址\r\nGitHub地址\r\nHutool 是什么\r\nHutool是一个Java工具包类库，对文件、流、加密解密、转码、正则、线程、XML等JDK方法进行封装，组成各种Util工具类\r\n简介\r\nHutool是一个小而全的Java工具类库，通过静态方法封装，降低相关API的学习成本，提高工作效率，使Java拥有函数式语言般的优雅', 1, 137, NULL, 0, 1640, 1640, '2020-09-29 14:39:27', '2022-06-12 23:47:51');
INSERT INTO `fs_article` VALUES (32, 'http://76.nanshengbbs.top/articleTitleMap-20220612234931325_ngDoc2.png', '神器 SpringDoc 横空出世！最适合 SpringBoot 的API文档工具来了！', '神器 SpringDoc 横空出世！最适合 SpringBoot 的API文档工具来了！\r\n之前在SpringBoot项目中一直使用的是SpringFox提供的Swagger库，上了下官网发现已经有接近两年没出新版本了！前几天升级了SpringBoot 2.6.x 版本，发现这个库的兼容性也越来越不好了，有的常用注解属性被废弃了居然都没提供替代！无意中发现了另一款Swagger库SpringDoc', 1, 77, NULL, 0, 1640, 1640, '2022-04-08 15:14:50', '2022-06-12 23:49:32');
INSERT INTO `fs_article` VALUES (33, 'http://76.nanshengbbs.top/articleTitleMap-20220612235037352_红黑树.jpg', '什么是红黑树？', '面试\r\n二叉查找树（BST）具备什么特性呢？\r\n左子树上所有结点的值均小于或等于它的根结点的值。\r\n右子树上所有结点的值均大于或等于它的根结点的值。\r\n左、右子树也分别为二叉排序树。\r\n下图中这棵树，就是一颗典型的二叉查找树：\r\n查看根节点9：\r\n由于10 &gt; 9，因此查看右孩子13：\r\n由于10 &lt; 13，因此查看左孩子11：\r\n由于10 &lt; 11，因此查看左孩子10，发现10', 1, 467, NULL, 0, 1640, 1640, '2020-10-23 09:24:18', '2022-06-12 23:50:38');
INSERT INTO `fs_article` VALUES (34, 'http://76.nanshengbbs.top/articleTitleMap-20220612235253028_spug.png', '开源运维平台：SPUG', '简介\r\n开源运维平台：面向中小型企业设计的轻量级无Agent的自动化运维平台，整合了主机管理、主机批量执行、主机在线终端、应用发布部署、在线任务计划、配置中心、监控、报警等一系列功能。\r\n特性\r\n批量执行: 主机命令在线批量执行\r\n在线终端: 主机支持浏览器在线终端登录\r\n任务计划: 灵活的在线任务计划\r\n发布部署: 支持自定义发布部署流程\r\n配置中心: 支持KV、文本、json等格式的配置\r\n监', 1, 233, NULL, 0, 1640, 1640, '2020-05-27 16:57:46', '2022-06-12 23:52:53');
INSERT INTO `fs_article` VALUES (35, 'http://76.nanshengbbs.top/articleTitleMap-20220612235522273_rkdown.png', '南生论坛推出v2.6版本 - 支持Markdown写文章和预览', 'Disabled options\r\nTeX (Based on KaTeX);\r\nEmoji;\r\nTask lists;\r\nHTML tags decode;\r\nFlowchart and Sequence Diagram;\r\nEditor.md directory\r\neditor.md/\r\n lib/\r\n css/\r\n scss/\r\n tests/\r\n fonts/\r\n images/\r\n pl', 1, 326, NULL, 0, 1640, 1640, '2019-11-19 14:03:23', '2022-06-12 23:56:34');
INSERT INTO `fs_article` VALUES (36, 'http://76.nanshengbbs.top/articleTitleMap-20220612235855269_新浪微博图床.png', '《新浪微博图床》本地Markdown编写更流畅, 新浪微博图床来帮忙', '用Markdown写文章，如果文章中使用了本地配图，那本地配图就要和文章一起打包，否则别人是看不到图片的\r\n如果把本地图片放到网络服务器，然后直接把图片的 url 粘贴到文章里面，就可以免除图片打包的步骤\r\n新浪微博的服务有两个为人称道的特色:\r\n一是遇到明星八卦新闻必然崩溃（明星以挤跨微博为荣！）\r\n二是图片服务器极少崩溃（微博是个好图床！）\r\n如何获取本地图片的url? 答: 将图片上传到新浪', 1, 81, NULL, 0, 1640, 1640, '2019-11-24 17:00:42', '2022-06-12 23:58:56');
INSERT INTO `fs_article` VALUES (37, 'http://76.nanshengbbs.top/articleTitleMap-20220613000007511_cat.jpg', '南生论坛推出v2.8.1版本', 'v2.8.1版本是v3.0.1版本的中间产物（这个版本原则上不提供源码）\r\nv2.8.1在v2.6的基础上有以下更新：\r\n后台代码全部重构\r\n基本上处理代码冗余问题\r\n接口全部按REST风格重写\r\nSQL优化\r\n重写率90%\r\n前台代码优化\r\njs文件完全去html化\r\n管理系统页面重构\r\n用户系统部分界面优化\r\n评论者显示头像\r\n登录后head处以头像方式显示\r\n增加“他人中心”的数据显示\r\n重', 1, 504, NULL, 0, 1640, 1640, '2020-05-01 22:52:12', '2022-06-13 00:00:08');
INSERT INTO `fs_article` VALUES (38, 'http://76.nanshengbbs.top/articleTitleMap-20220613000158304_76yun.png', '优化系统，提升访问效率', '发现问题\r\n网站访问效率低下，经过测试，发现主要由两个原因造成：\r\n本身云服务器的带宽不足（这个问题:tw-1f236:RMB可以解决）\r\n图片/视频文件过大，消耗大量的流量\r\n思考分析\r\n要解决以上问题可以从两个方面着手：\r\n图片/视频文件不走我们自己的服务器\r\n压缩图片/视频文件\r\n解决问题\r\n将图片/视频文件全部压缩到指定范围（自己找一个能忍受清晰度就行:fa-reddit:），避免文件过大', 1, 798, NULL, 0, 1640, 1640, '2020-06-04 23:24:48', '2022-06-13 00:01:59');
INSERT INTO `fs_article` VALUES (39, '', 'sad', 'adasdadasd1\r\n', 1, 42, NULL, 0, 1812, 1812, '2022-06-21 14:46:24', '2022-06-23 10:51:15');
INSERT INTO `fs_article` VALUES (40, 'http://76.nanshengbbs.top/articleTitleMap-20220621223826164_v3.0.0.png', '本系统【南生论坛v3.0.0】来了（SpringBoot + Vue）', '重要说明\r\n南生论坛v3.0.0是全新的一套系统！所有的数据表（用户、角色、权限等）都重新设计过，所以v2.8.2与v3.0.0的数据是不互通的。\r\n不过你之前在v2.8.2上注册（2022.6.11之后注册的不行）的用户信息在v3.0.0依然可以登录。\r\nv3.0.0以后所有的南生系列系统共用一套用户权限系统。\r\n目前使用同一套用户权限的有：南生论坛、南生运营、南生闲聊。\r\n如何进入旧版系统\r\n', 1, 68, 4, 0, 1640, 1640, '2022-06-21 22:32:04', '2022-06-23 10:27:48');
INSERT INTO `fs_article` VALUES (41, 'http://76.nanshengbbs.top/articleTitleMap-20220623221450862_logo-1.png', 'PM2 一个守护进程管理器', 'PM2 是 node 进程管理工具，可以利用它来简化很多 node应用管理的繁琐任务，如性能监控、自动重启、负载均衡等，而且使用非常简单。\r\n官方\r\n官网\r\nGitHub\r\n文档\r\nPM2简介\r\nPM2原先是nodejs应用的进程管理工具，不过其良好的设计以及扩展性可以手动执行执行进程。\r\n安装\r\n最新的 PM2 版本可通过 NPM 或 Yarn 安装：\r\nnpm install pm2@late', 1, 40, 5, 0, 1640, 1640, '2022-06-23 18:32:53', '2022-06-23 22:14:51');

-- ----------------------------
-- Table structure for fs_article_label
-- ----------------------------
DROP TABLE IF EXISTS `fs_article_label`;
CREATE TABLE `fs_article_label`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '文章标签编号',
  `article_id` int(0) NULL DEFAULT NULL COMMENT '文章id',
  `label_id` int(0) NULL DEFAULT NULL COMMENT '标签id',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建用户id',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '更新用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章标签' ROW_FORMAT = Dynamic;

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
INSERT INTO `fs_article_label` VALUES (32, 39, 15, 0, 1812, 1812, '2022-06-21 14:46:25', '2022-06-21 14:46:25');
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
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `pre_id` int(0) NULL DEFAULT NULL COMMENT '父评论id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论内容',
  `article_id` int(11) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '被评论帖子id',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `comment_user` bigint(0) NULL DEFAULT NULL COMMENT '评论用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_comment
-- ----------------------------
INSERT INTO `fs_comment` VALUES (19, 0, '南生论坛v1.0 - 于2016年12月开发完成（作者读大二）', 00000000026, 1, 0, 1640, '2022-06-12 23:30:57', '2022-06-12 23:30:57');
INSERT INTO `fs_comment` VALUES (20, 0, '南生论坛v2.6于2019-11-19在v1.0的基础上优化完成。', 00000000027, 1, 0, 1640, '2022-06-17 11:51:49', '2022-06-17 11:51:49');
INSERT INTO `fs_comment` VALUES (21, 0, '南生论坛v2.8.2于 2020-05-01 在v2.6的基础上优化（重构后端代码）完成。', 00000000028, 1, 0, 1640, '2022-06-17 11:54:19', '2022-06-17 11:54:19');
INSERT INTO `fs_comment` VALUES (22, 0, '厉害厉害👍👍👍', 00000000040, 1, 0, 1812, '2022-06-21 23:01:01', '2022-06-21 23:01:01');
INSERT INTO `fs_comment` VALUES (23, 0, 'Emoji符号大全：https://funletu.com/emoji/', 00000000040, 1, 0, 1640, '2022-06-21 23:35:36', '2022-06-21 23:35:36');
INSERT INTO `fs_comment` VALUES (24, 0, 'good', 00000000040, 1, 0, 2206, '2022-06-22 11:25:32', '2022-06-22 11:25:32');

-- ----------------------------
-- Table structure for fs_comment_like
-- ----------------------------
DROP TABLE IF EXISTS `fs_comment_like`;
CREATE TABLE `fs_comment_like`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '评论点赞编号',
  `comment_id` int(0) NULL DEFAULT NULL COMMENT '评论id',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0取消,1点赞)',
  `like_user` bigint(0) NULL DEFAULT NULL COMMENT '评论点赞用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论点赞' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_comment_like
-- ----------------------------
INSERT INTO `fs_comment_like` VALUES (10, 19, 1, 1640, '2022-06-12 23:31:00', '2022-06-12 23:31:00');

-- ----------------------------
-- Table structure for fs_follow
-- ----------------------------
DROP TABLE IF EXISTS `fs_follow`;
CREATE TABLE `fs_follow`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '关注编号',
  `from_user` bigint(0) NULL DEFAULT NULL COMMENT '发起关注的人',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0取消,1关注)',
  `to_user` bigint(0) NULL DEFAULT NULL COMMENT '被关注的人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关注' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_follow
-- ----------------------------
INSERT INTO `fs_follow` VALUES (16, 1640, 0, 1645, '2022-06-11 13:02:58', '2022-06-22 00:10:59');
INSERT INTO `fs_follow` VALUES (17, 1640, 0, 1646, '2022-06-11 13:08:44', '2022-06-22 00:10:59');
INSERT INTO `fs_follow` VALUES (18, 1640, 0, 1649, '2022-06-11 13:08:45', '2022-06-22 00:10:58');
INSERT INTO `fs_follow` VALUES (19, 1640, 0, 1650, '2022-06-11 13:08:45', '2022-06-22 00:10:57');
INSERT INTO `fs_follow` VALUES (20, 1640, 0, 1657, '2022-06-11 13:08:45', '2022-06-22 00:10:56');
INSERT INTO `fs_follow` VALUES (21, 1640, 0, 1665, '2022-06-11 13:08:46', '2022-06-22 00:10:55');
INSERT INTO `fs_follow` VALUES (22, 1640, 0, 1670, '2022-06-11 13:08:47', '2022-06-22 00:10:54');
INSERT INTO `fs_follow` VALUES (23, 1640, 0, 1674, '2022-06-11 13:08:47', '2022-06-22 00:10:53');
INSERT INTO `fs_follow` VALUES (24, 1812, 1, 1640, '2022-06-21 15:49:36', '2022-06-21 15:49:36');
INSERT INTO `fs_follow` VALUES (25, 2158, 1, 1640, '2022-06-22 00:07:09', '2022-06-22 00:07:09');
INSERT INTO `fs_follow` VALUES (26, 2158, 1, 1812, '2022-06-22 00:07:13', '2022-06-22 00:07:13');
INSERT INTO `fs_follow` VALUES (27, 2158, 1, 2199, '2022-06-22 00:07:15', '2022-06-22 00:07:15');
INSERT INTO `fs_follow` VALUES (28, 2158, 0, 1674, '2022-06-22 00:07:43', '2022-06-22 00:07:44');
INSERT INTO `fs_follow` VALUES (29, 2199, 1, 2158, '2022-06-22 00:09:11', '2022-06-22 00:09:11');
INSERT INTO `fs_follow` VALUES (30, 2199, 1, 1640, '2022-06-22 00:09:23', '2022-06-22 00:09:23');
INSERT INTO `fs_follow` VALUES (31, 1640, 1, 1812, '2022-06-22 00:11:08', '2022-06-22 00:11:08');
INSERT INTO `fs_follow` VALUES (32, 1640, 1, 2199, '2022-06-22 00:11:16', '2022-06-22 00:11:16');

-- ----------------------------
-- Table structure for fs_label
-- ----------------------------
DROP TABLE IF EXISTS `fs_label`;
CREATE TABLE `fs_label`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '标签编号',
  `label_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名字',
  `logo` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'logo(图片)',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建用户id',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '更新用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_label
-- ----------------------------
INSERT INTO `fs_label` VALUES (4, 'Vue.js', 'http://76.nanshengbbs.top/labelPicture-20220612145638935_Vue.png', 0, 1640, 1640, '2022-06-11 12:03:36', '2022-06-12 14:56:41');
INSERT INTO `fs_label` VALUES (5, 'Kubernetes', 'http://76.nanshengbbs.top/labelPicture-20220612145701133_rnetes.png', 0, 1640, 1640, '2022-06-11 12:10:38', '2022-06-12 14:57:02');
INSERT INTO `fs_label` VALUES (6, 'Docker', 'http://76.nanshengbbs.top/labelPicture-20220612145707795_Docker.png', 0, 1640, 1640, '2022-06-11 12:11:03', '2022-06-12 14:57:09');
INSERT INTO `fs_label` VALUES (8, 'Spring Boot', 'http://76.nanshengbbs.top/labelPicture-20220612145715490_g-boot.png', 0, 1640, 1640, '2022-06-11 12:14:00', '2022-06-12 14:57:17');
INSERT INTO `fs_label` VALUES (9, '运维', 'http://76.nanshengbbs.top/labelPicture-20220612145722862_19运维管理.png', 0, 1640, 1640, '2022-06-11 12:15:11', '2022-06-12 14:57:24');
INSERT INTO `fs_label` VALUES (10, '操作系统', 'http://76.nanshengbbs.top/labelPicture-20220612145729342_操作系统.png', 0, 1640, 1640, '2022-06-11 12:16:24', '2022-06-12 14:57:30');
INSERT INTO `fs_label` VALUES (11, '公告', 'http://76.nanshengbbs.top/labelPicture-20220612145735299_eboard.png', 0, 1640, 1640, '2022-06-11 12:36:46', '2022-06-12 14:57:36');
INSERT INTO `fs_label` VALUES (12, '南生论坛迭代', 'http://76.nanshengbbs.top/labelPicture-20220612224902616_-lanse.png', 0, 1640, 1640, '2022-06-12 22:49:06', '2022-06-12 22:49:55');
INSERT INTO `fs_label` VALUES (13, '推荐', 'http://76.nanshengbbs.top/labelPicture-20220612233448611_推荐.png', 0, 1640, 1640, '2022-06-12 23:34:53', '2022-06-12 23:34:53');
INSERT INTO `fs_label` VALUES (14, 'Markdown', 'http://76.nanshengbbs.top/labelPicture-20220612235625452_rkdown.png', 0, 1640, 1640, '2022-06-12 23:56:27', '2022-06-12 23:56:27');
INSERT INTO `fs_label` VALUES (15, '插件', 'http://76.nanshengbbs.top/labelPicture-20220612235758085_插件.png', 0, 1640, 1640, '2022-06-12 23:57:59', '2022-06-12 23:57:59');
INSERT INTO `fs_label` VALUES (16, '优化', 'http://76.nanshengbbs.top/labelPicture-20220613000113819_智能优化.png', 0, 1640, 1640, '2022-06-13 00:01:15', '2022-06-13 00:01:15');
INSERT INTO `fs_label` VALUES (17, 'Node.js', 'http://76.nanshengbbs.top/labelPicture-20220623173925045_ode.js.png', 0, 1640, 1640, '2022-06-23 17:39:27', '2022-06-23 17:39:27');
INSERT INTO `fs_label` VALUES (18, 'GitHub', 'http://76.nanshengbbs.top/labelPicture-20220623174020053_GitHub.png', 0, 1640, 1640, '2022-06-23 17:40:21', '2022-06-23 17:40:21');
INSERT INTO `fs_label` VALUES (19, 'Java', 'http://76.nanshengbbs.top/labelPicture-20220623174117612_java.png', 0, 1640, 1640, '2022-06-23 17:41:19', '2022-06-23 17:41:19');
INSERT INTO `fs_label` VALUES (20, 'PM2', 'http://76.nanshengbbs.top/labelPicture-20220623174732007_pm2.png', 0, 1640, 1640, '2022-06-23 17:46:23', '2022-06-23 17:47:33');

-- ----------------------------
-- Table structure for fs_like
-- ----------------------------
DROP TABLE IF EXISTS `fs_like`;
CREATE TABLE `fs_like`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '点赞编号',
  `article_id` int(0) NULL DEFAULT NULL COMMENT '文章id',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0取消,1点赞)',
  `like_user` bigint(0) NULL DEFAULT NULL COMMENT '点赞用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '点赞' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_like
-- ----------------------------
INSERT INTO `fs_like` VALUES (16, 26, 1, 1640, '2022-06-12 23:04:21', '2022-06-12 23:04:21');
INSERT INTO `fs_like` VALUES (17, 28, 1, 1640, '2022-06-12 23:29:44', '2022-06-12 23:29:44');
INSERT INTO `fs_like` VALUES (18, 27, 1, 1640, '2022-06-12 23:29:45', '2022-06-12 23:29:45');
INSERT INTO `fs_like` VALUES (19, 38, 1, 1640, '2022-06-13 17:57:15', '2022-06-13 17:57:15');
INSERT INTO `fs_like` VALUES (20, 29, 1, 1640, '2022-06-14 14:41:46', '2022-06-14 14:41:46');
INSERT INTO `fs_like` VALUES (21, 37, 1, 1640, '2022-06-14 14:41:51', '2022-06-14 14:41:51');
INSERT INTO `fs_like` VALUES (22, 39, 1, 1812, '2022-06-21 15:20:19', '2022-06-21 15:20:19');
INSERT INTO `fs_like` VALUES (23, 40, 1, 1812, '2022-06-21 23:01:09', '2022-06-21 23:01:29');
INSERT INTO `fs_like` VALUES (24, 40, 1, 1812, '2022-06-21 23:01:06', '2022-06-21 23:01:06');
INSERT INTO `fs_like` VALUES (25, 40, 1, 2158, '2022-06-21 23:57:49', '2022-06-21 23:57:49');
INSERT INTO `fs_like` VALUES (26, 28, 1, 2158, '2022-06-21 23:57:50', '2022-06-21 23:57:50');
INSERT INTO `fs_like` VALUES (27, 27, 1, 2158, '2022-06-21 23:57:51', '2022-06-21 23:57:51');
INSERT INTO `fs_like` VALUES (28, 26, 1, 2158, '2022-06-21 23:57:52', '2022-06-21 23:57:52');
INSERT INTO `fs_like` VALUES (29, 39, 1, 2158, '2022-06-21 23:57:54', '2022-06-21 23:57:54');
INSERT INTO `fs_like` VALUES (30, 32, 1, 2158, '2022-06-21 23:57:55', '2022-06-21 23:57:55');
INSERT INTO `fs_like` VALUES (31, 33, 1, 2158, '2022-06-21 23:57:56', '2022-06-21 23:57:56');
INSERT INTO `fs_like` VALUES (32, 31, 1, 2158, '2022-06-21 23:57:58', '2022-06-21 23:57:58');
INSERT INTO `fs_like` VALUES (33, 30, 1, 2158, '2022-06-21 23:57:58', '2022-06-21 23:57:58');
INSERT INTO `fs_like` VALUES (34, 38, 0, 2158, '2022-06-21 23:58:00', '2022-06-21 23:59:47');
INSERT INTO `fs_like` VALUES (35, 34, 1, 2158, '2022-06-21 23:58:04', '2022-06-21 23:58:04');
INSERT INTO `fs_like` VALUES (36, 29, 1, 2158, '2022-06-21 23:58:07', '2022-06-21 23:59:43');
INSERT INTO `fs_like` VALUES (37, 35, 1, 2158, '2022-06-21 23:58:26', '2022-06-21 23:58:26');
INSERT INTO `fs_like` VALUES (38, 33, 1, 1640, '2022-06-22 14:29:31', '2022-06-22 14:29:31');
INSERT INTO `fs_like` VALUES (39, 41, 1, 1640, '2022-06-23 20:41:57', '2022-06-23 20:41:57');

-- ----------------------------
-- Table structure for fs_slideshow
-- ----------------------------
DROP TABLE IF EXISTS `fs_slideshow`;
CREATE TABLE `fs_slideshow`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '轮播图编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '轮播图',
  `jump_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除(0正常,1删除)',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建用户id',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '更新用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '轮播图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fs_user_level
-- ----------------------------
DROP TABLE IF EXISTS `fs_user_level`;
CREATE TABLE `fs_user_level`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户等级编号',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Lv1' COMMENT '等级（Lv6）',
  `points` int(0) NULL DEFAULT 0 COMMENT '积分',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 591 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户等级' ROW_FORMAT = Dynamic;

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

SET FOREIGN_KEY_CHECKS = 1;
