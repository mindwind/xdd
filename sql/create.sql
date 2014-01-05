--创建数据表空间
create tablespace xdd_ts
logging
datafile 'D:\database\oracle\ora10_xdd.dbf' 
size 32m 
autoextend on 
next 32m maxsize 2048m
extent management local;

-- 创建用户并指定表空间
create user xdd identified by xdd
default tablespace xdd_ts
temporary tablespace temp;

--给用户授予权限
grant connect,resource to xdd;

-- 用户表
create table XDD_USER (
	ID 		varchar2(32) not null, 				-- 用户ID(用户名)
	LAST_LOGIN_TIME varchar2(14),  				-- 用户最后一次登陆时间
	PASSWORD 		varchar2(32) not null, 		-- 密码
	REGISTER_TIME 	varchar2(14) not null, 		-- 用户注册时间
 	ROLE_ID			varchar2(32) not null,      -- 角色ID
	STATE			varchar2(1)  not null,       -- 状态： O-正常, X-注销
    ORG_ID          varchar2(32) not null,      -- 所属机构
	primary key (ID)
);

-- 角色表
create table XDD_ROLE (
	ID		varchar2(32) not null,				-- 业务无关主键(系统生成)
	NAME 	varchar2(50) not null,				-- 角色名称
	primary key (ID)
);

-- 权限表
create table XDD_PRIVILEGE (
	ID 		varchar2(32) not null, 				-- 业务无关主键(系统生成)
	TYPE	varchar2(10) not null, 				-- 权限分类	1-PUBLIC(公共类) 
                                                --          2-USER(用户管理类)
                                                --          3-INFO_PUB(信息发布类) 
                                                --          4-INFO_AUDIT(信息审核类)
	PRIVILEGE_POINT varchar2(150) not null, 	-- 权限点(用于程序判断)
	REMARK 	varchar2(100), 						-- 权限说明
    primary key (ID)
);

-- 角色权限关联表
create table XDD_ROLE_PRIVILEGE (
	ROLE_ID varchar2(32) not null, 
	PRIVILEGE_ID number(19,0) not null, 
	primary key (ROLE_ID, PRIVILEGE_ID)
);

-- 信息表
create table XDD_INFO
(
  ID             varchar2(32)  not null,         -- 业务无关主键(系统生成)
  TITLE          varchar2(600) not null,         -- 信息标题
  AUTHOR         varchar2(32)  not null,         -- 发布人
  PUBLISH_TIME   varchar2(14)  not null,         -- 发布时间															  
  CONTENT        clob,                           -- 信息内容															     												       
  GROUP_ID       varchar(32)   not null,         -- 信息栏目ID															        
  STATE     	 number(1)     not null,         -- 状态： 3-草稿 2-待初审  1-待终审  0-审核通过	-1-审核不通过 -2-暂存
  AUDITOR1	 	 varchar(32),  		 			 -- 一级审核员
  AUDITOR2	 	 varchar(32),  					 -- 二级审核员
  IMG_LINK_URL       varchar(150),               -- 图片信息链接地址
  IMG_URL        varchar(100),                   -- 图片访问地址
  primary key(ID)
);
alter table XDD_INFO add ORG_ID VARCHAR2(32);

-- 信息栏目表
create table XDD_INFO_GROUP
(
  ID		varchar2(32)   not null,        -- 业务无关主键(系统预设)
  NAME		varchar2(50)   not null,        -- 信息栏目名
  PARENT_ID varchar2(32),                   -- 父栏目ID
  GROUP_LEVEL  number(1)  not null,         -- 栏目所处级别(根为0)
  TYPE      varchar2(10), not null,         -- 栏目类型
  LINK      varchar2(100),                  -- 栏目独立链接
  primary key(ID)
);

-- 组织机构表
create table XDD_ORG
(
	ID		varchar2(32)   not null,        -- 业务无关主键(系统生成)
    NAME    varchar2(50)   not null,        -- 组织机构名
    primary key(ID)
);
alter table XDD_ORG add TYPE VARCHAR2(1);






