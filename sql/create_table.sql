# 数据库初始化
# @author <a href="https://blog.csdn.net/guojiaqi_">oldGj</a>
# @from <a href="https://github.com/guoJiaQi-123/TYUT-SmartViewBI-backend">GitHub地址</a>

-- 创建库
create database if not exists tyut_bi;

-- 切换库
use tyut_bi;

-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userAccount  varchar(256)                           not null comment '账号',
    userPassword varchar(512)                           not null comment '密码',
    userName     varchar(256)                           null comment '用户昵称',
    userAvatar   varchar(1024)                          null comment '用户头像',
    userRole     varchar(256) default 'user'            not null comment '用户角色：user/admin/ban',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除',
    index idx_unionId (userAccount)
) comment '用户' collate = utf8mb4_unicode_ci;

-- 图表信息表
create table if not exists chart
(
    id          bigint auto_increment comment 'id' primary key,
    goal        text                               null comment '分析目标',
    chartData   text                               null comment '图标数据',
    name        varchar(128)                       null comment '图标名称',
    chartType   varchar(128)                       null comment '图标类型',
    state       tinyint  default 0                 not null comment '0：等待中【wait】，1：生成中【running】，2：生成失败【failed】，3：生成成功【succeed】',
    execMessage text                               null comment '执行信息',
    genChart    text                               null comment '生成的图表数据',
    genResult   text                               null comment '生成的分析结论',
    userId      bigint                             null comment '创建用户 ID',
    createTime  datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime  datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete    tinyint  default 0                 not null comment '是否删除',
    index idx_userId (userId)
) comment '帖子' collate = utf8mb4_unicode_ci;
