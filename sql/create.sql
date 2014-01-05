--�������ݱ�ռ�
create tablespace xdd_ts
logging
datafile 'D:\database\oracle\ora10_xdd.dbf' 
size 32m 
autoextend on 
next 32m maxsize 2048m
extent management local;

-- �����û���ָ����ռ�
create user xdd identified by xdd
default tablespace xdd_ts
temporary tablespace temp;

--���û�����Ȩ��
grant connect,resource to xdd;

-- �û���
create table XDD_USER (
	ID 		varchar2(32) not null, 				-- �û�ID(�û���)
	LAST_LOGIN_TIME varchar2(14),  				-- �û����һ�ε�½ʱ��
	PASSWORD 		varchar2(32) not null, 		-- ����
	REGISTER_TIME 	varchar2(14) not null, 		-- �û�ע��ʱ��
 	ROLE_ID			varchar2(32) not null,      -- ��ɫID
	STATE			varchar2(1)  not null,       -- ״̬�� O-����, X-ע��
    ORG_ID          varchar2(32) not null,      -- ��������
	primary key (ID)
);

-- ��ɫ��
create table XDD_ROLE (
	ID		varchar2(32) not null,				-- ҵ���޹�����(ϵͳ����)
	NAME 	varchar2(50) not null,				-- ��ɫ����
	primary key (ID)
);

-- Ȩ�ޱ�
create table XDD_PRIVILEGE (
	ID 		varchar2(32) not null, 				-- ҵ���޹�����(ϵͳ����)
	TYPE	varchar2(10) not null, 				-- Ȩ�޷���	1-PUBLIC(������) 
                                                --          2-USER(�û�������)
                                                --          3-INFO_PUB(��Ϣ������) 
                                                --          4-INFO_AUDIT(��Ϣ�����)
	PRIVILEGE_POINT varchar2(150) not null, 	-- Ȩ�޵�(���ڳ����ж�)
	REMARK 	varchar2(100), 						-- Ȩ��˵��
    primary key (ID)
);

-- ��ɫȨ�޹�����
create table XDD_ROLE_PRIVILEGE (
	ROLE_ID varchar2(32) not null, 
	PRIVILEGE_ID number(19,0) not null, 
	primary key (ROLE_ID, PRIVILEGE_ID)
);

-- ��Ϣ��
create table XDD_INFO
(
  ID             varchar2(32)  not null,         -- ҵ���޹�����(ϵͳ����)
  TITLE          varchar2(600) not null,         -- ��Ϣ����
  AUTHOR         varchar2(32)  not null,         -- ������
  PUBLISH_TIME   varchar2(14)  not null,         -- ����ʱ��															  
  CONTENT        clob,                           -- ��Ϣ����															     												       
  GROUP_ID       varchar(32)   not null,         -- ��Ϣ��ĿID															        
  STATE     	 number(1)     not null,         -- ״̬�� 3-�ݸ� 2-������  1-������  0-���ͨ��	-1-��˲�ͨ�� -2-�ݴ�
  AUDITOR1	 	 varchar(32),  		 			 -- һ�����Ա
  AUDITOR2	 	 varchar(32),  					 -- �������Ա
  IMG_LINK_URL       varchar(150),               -- ͼƬ��Ϣ���ӵ�ַ
  IMG_URL        varchar(100),                   -- ͼƬ���ʵ�ַ
  primary key(ID)
);
alter table XDD_INFO add ORG_ID VARCHAR2(32);

-- ��Ϣ��Ŀ��
create table XDD_INFO_GROUP
(
  ID		varchar2(32)   not null,        -- ҵ���޹�����(ϵͳԤ��)
  NAME		varchar2(50)   not null,        -- ��Ϣ��Ŀ��
  PARENT_ID varchar2(32),                   -- ����ĿID
  GROUP_LEVEL  number(1)  not null,         -- ��Ŀ��������(��Ϊ0)
  TYPE      varchar2(10), not null,         -- ��Ŀ����
  LINK      varchar2(100),                  -- ��Ŀ��������
  primary key(ID)
);

-- ��֯������
create table XDD_ORG
(
	ID		varchar2(32)   not null,        -- ҵ���޹�����(ϵͳ����)
    NAME    varchar2(50)   not null,        -- ��֯������
    primary key(ID)
);
alter table XDD_ORG add TYPE VARCHAR2(1);






