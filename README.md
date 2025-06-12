> 需要学习SSM框架的童鞋去：[我的另一个基于【SSM】的论坛项目](https://github.com/maliangnansheng/bbs-ssm)、 SpringCloud版本去：[SpringCloud版本](https://bbs.nansin.top/detail/453)

# Nan's BBS 南生论坛（SpringBoot+Vue）

[![](https://img.shields.io/badge/Author-马亮南生-orange.svg)](https://bbs.nansin.top/user/1640)
[![](https://img.shields.io/badge/version-3.0.0-brightgreen.svg)](https://github.com/maliangnansheng/bbs-springboot)
[![GitHub stars](https://img.shields.io/github/stars/maliangnansheng/bbs-springboot.svg?style=social&label=Stars)](https://github.com/maliangnansheng/bbs-springboot)
[![GitHub forks](https://img.shields.io/github/forks/maliangnansheng/bbs-springboot.svg?style=social&label=Fork)](https://github.com/maliangnansheng/bbs-springboot)

> 本项目完全开源！如果觉得不错麻烦帮忙点一次`Star⭐️`
>
> [**未经授权**](https://bbs.nansin.top/detail/600)的情况下严禁公司使用或者商用(个人学习使用不限制) 
>
> [加载太慢or图片加载不出来 **点我**](https://bbs.nansin.top/detail/172)

## 仓库说明

> 本仓库`bbs-springboot`是【南生论坛3.0.0】前后端分离项目的**后端项目**。
>
> 对应的 **前端项目（Vue2版本）** 仓库移步至：[bbs-vue-ui](https://github.com/maliangnansheng/bbs-vue-ui)
>
> 对应的 **前端项目（Vue3版本）** 仓库移步至：[bbs-vue3-ui](https://github.com/maliangnansheng/bbs-vue3-ui)

## 部署效果

开源版演示地址：[https://open.nansin.top](https://open.nansin.top)（普通用户：`自己注册就行`；管理员：`椿/123456`）

商业版演示地址：[https://bbs.nansin.top](https://bbs.nansin.top)（普通用户：`椿/123456`；管理员：`测试管理员/123456`）

开源版部署教程：[【后端】安装部署教程](https://bbs.nansin.top/detail/44)、[【前端】安装部署教程](https://bbs.nansin.top/detail/45)

相关文档：[01 南生论坛使用指南](https://www.bilibili.com/video/BV1he4y1C7rk?share_source=copy_web&vd_source=1f88041e3a02d90ecf98d311908d3d8b)、 [02 南生论坛代码讲解](https://www.bilibili.com/video/BV1pK411C7T4/?vd_source=d0a5d07985a7fbbfb889c874632343c6)、 [03 如何获取南生论坛设计文档？](https://bbs.nansin.top/detail/76)、 [04 南生论坛日常迭代（开源计划）](https://bbs.nansin.top/detail/122)、 [05 10分钟搞懂南生论坛](https://bbs.nansin.top/detail/369)、 [06 不同角色不同视图](https://bbs.nansin.top/detail/350)、 [07 南生运营功能介绍](https://bbs.nansin.top/detail/521)

## 项目架构

![](https://76.nansin.top/github/ns-jiagou2.png)

## 关于项目

- 南生论坛基于`SpringBoot+Vue`框架实现（商业版也提供[SpringCloud版本](https://bbs.nansin.top/detail/453)）
- 分为[用户系统（南生论坛）](https://bbs.nansin.top)和[管理系统（南生运营）](https://manage.nansin.top)两部分
- 大厂微服务架构，仿掘金风格，前后端分离，多端适配，界面优雅，功能全面，性能高效

## 技术栈

- **后端：**
  程序架构：[SpringBoot](https://spring.io/projects/spring-boot)、RPC：[Dubbo](https://cn.dubbo.apache.org/zh-cn/overview/what/)、注册中心：[Zookeeper](https://zookeeper.apache.org/)、消息队列：[RocketMQ](https://rocketmq.apache.org/zh/)、缓存：[Redis](https://redis.io/)、持久层框架：[MyBatis](https://mybatis.org/mybatis-3/zh_CN/index.html)、数据库：[MySQL](https://www.mysql.com/)、大数据存储：[MongoDB](https://www.mongodb.com/zh-cn)、实时交互：[WebSocket](https://websocket.org/)、权限管理：[Shiro](https://shiro.apache.org/)、对象存储：[七牛云](https://www.qiniu.com/) 等
- **前端：**
  前端框架：[Vue](https://vuejs.org/)、HTTP客户端：[Axios](https://axios-http.com/)、路由管理：[Vue Router](https://router.vuejs.org/)、UI组件库：[Ant Design of Vue](https://www.antdv.com/docs/vue/introduce-cn/)、打包工具：[Webpack](https://webpack.js.org/)、CSS预处理器：[Less](http://lesscss.org/)、状态管理：[Vuex](https://vuex.vuejs.org/)、JavaScript版本：[ES6](https://es6.ruanyifeng.com/)、服务端语言：[Node.js](https://nodejs.org/)、Markdown编辑器：[mavonEditor](https://github.com/hinesboy/mavonEditor)、富文本编辑器：[wangEditor](https://github.com/wangeditor-team/wangeditor)、数据可视化：[ECharts](https://echarts.apache.org/) 等

## 为什么做这个项目？
- 企业一般都需要一个内部社区供开发者学习、分享、交流（本项目参考了稀土掘金、哔哩哔哩等部分功能）。
- 市面上已有的开源社区大部分都是PHP语言的，Java开源的很少，SpringBoot/SpringCloud框架开发的几乎没有。大多数互联网公司内部开发语言都是Java，很多都是SpringBoot/SpringCloud开发框架，对于PHP开源的社区，无法很好的接入公司内部系统。
- 现有的开源社区功能过于简单，无法满足企业的大部分需求。
- 现有的开源社区界面风格老式，没有跟上时代发展的审美，且定制能力差。
- 现有的开源社区缺乏用户/角色/权限统一管理的功能，用户系统各成一套，二开成本过高。

## 联系作者

> **商用** 需要联系作者[**授权**](https://bbs.nansin.top/detail/600)(学习使用不需要授权)

1. 加作者微信：maliangnansheng（[扫码添加](https://bbs.nansin.top/about)）
2. 加作者QQ：924818949（[扫码添加](https://bbs.nansin.top/about)）

## 功能结构

- 用户系统-功能结构图

  ![](https://76.nansin.top/github/ns-bbs250612.png)

- 管理系统-功能结构图

  ![](https://76.nansin.top/github/ns-manage250612.png)

## 项目结构

### 后端项目结构（SpringBoot）

![](https://76.nansin.top/github/idea003.png)

### 前端项目结构（Vue）

![](https://76.nansin.top/github/idea013.png)

## 静态展示

> 这里只浅展示部分效果，完整体验去官网：[https://bbs.nansin.top](https://bbs.nansin.top)

### 用户系统

- **论坛管理（`管理员权限`）**

  ![image](https://76.nansin.top/github/bbs-manage.png)
  
- **文章**

  ![image](https://76.nansin.top/github/bbs-article.png)

- **问答**

  ![image](https://76.nansin.top/github/bbs-issue.png)

- **话题**

  ![image](https://76.nansin.top/github/bbs-topic.png)

- **文章详情**

  ![image](https://76.nansin.top/github/ns-bbs-article.png)

- **积分系统**

  ![](https://76.nansin.top/github/points_system.png)

- **私信**

  ![image](https://76.nansin.top/github/bbs_chat.png)

- **个人主页**

  ![image](https://76.nansin.top/github/ns-bbs-homepage.png)

- **个人资料**

  ![](https://76.nansin.top/github/ns-bbs-personalinfo2.png)

- **切换主题**

  ![](https://76.nansin.top/github/ns-bbs-theme.png)


### 管理系统

- **仪表盘**

  ![](https://76.nansin.top/github/ns-manage-dashboard2.png)

- **权限管理**

  ![](https://76.nansin.top/github/ns-manage-permissions.png)
  
- **角色管理**

  ![](https://76.nansin.top/github/ns-manage-role3.png)

- **用户管理**

  ![](https://76.nansin.top/github/ns-manage-user2.png)

- **反馈管理**

  ![](https://76.nansin.top/github/ns-manage-feedback.png)

- **通知管理**

  ![](https://76.nansin.top/github/ns-manage-notify.png)

## 桌面应用

### Windows
> Windows桌面应用效果图

![](https://76.nansin.top/logo/zmxt.png)

下载地址：[https://76.nansin.top/app/ns-bbs.msi](https://76.nansin.top/app/ns-bbs.msi)

### Mac
> 作者没有苹果电脑，同学们自行下载安装体验

下载地址：[https://76.nansin.top/app/ns-bbs.dmg](https://76.nansin.top/app/ns-bbs.dmg)
