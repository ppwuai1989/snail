-------------------------------------------------
-- Export file for user PORTAL                 --
-- Created by chenxiaoke on 2014/9/1, 13:24:16 --
-------------------------------------------------

spool portal.log

prompt
prompt Creating table COMPANY
prompt ======================
prompt
create table COMPANY
(
  company_id     VARCHAR2(50) not null,
  company_type   VARCHAR2(50) not null,
  company_name   VARCHAR2(50) not null,
  area_code      VARCHAR2(6) not null,
  address        VARCHAR2(200),
  content        VARCHAR2(500),
  contact        VARCHAR2(50),
  tel            VARCHAR2(50),
  email          VARCHAR2(50),
  create_time    DATE not null,
  create_user_id VARCHAR2(50) not null,
  stauts         CHAR(1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table COMPANY
  is '��˾';
comment on column COMPANY.company_id
  is '��˾���';
comment on column COMPANY.company_type
  is '��˾���';
comment on column COMPANY.company_name
  is '��˾����';
comment on column COMPANY.area_code
  is '��˾�����������';
comment on column COMPANY.address
  is '��˾��ַ';
comment on column COMPANY.content
  is '��˾���';
comment on column COMPANY.contact
  is '��ϵ��';
comment on column COMPANY.tel
  is '��ϵ�绰';
comment on column COMPANY.email
  is '��������';
comment on column COMPANY.create_time
  is '����ʱ��';
comment on column COMPANY.create_user_id
  is '�����˱��';
comment on column COMPANY.stauts
  is '״̬��0��������1��';
alter table COMPANY
  add constraint PK_COMPANY primary key (COMPANY_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table COMPANY_CATEGORY
prompt ===============================
prompt
create table COMPANY_CATEGORY
(
  name   VARCHAR2(50),
  code   VARCHAR2(50) not null,
  stauts CHAR(1) default '1'
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table COMPANY_CATEGORY
  is '��˾���';
alter table COMPANY_CATEGORY
  add constraint PK_COMPANY_CATEGORY primary key (CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DEPARTMENT
prompt =========================
prompt
create table DEPARTMENT
(
  department_id        VARCHAR2(50) not null,
  parent_department_id VARCHAR2(50) not null,
  department_name      VARCHAR2(50) not null,
  department_level     NUMBER default 3 not null,
  user_id              VARCHAR2(50) default '1' not null,
  create_time          DATE default sysdate not null,
  create_user_id       VARCHAR2(50) default '1' not null,
  stauts               CHAR(1) default 1 not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table DEPARTMENT
  is '����';
comment on column DEPARTMENT.department_id
  is '���ű��';
comment on column DEPARTMENT.parent_department_id
  is '�ϼ����ű��';
comment on column DEPARTMENT.department_name
  is '��������';
comment on column DEPARTMENT.department_level
  is '���ż���';
comment on column DEPARTMENT.user_id
  is '�����˱��';
comment on column DEPARTMENT.create_time
  is '����ʱ��';
comment on column DEPARTMENT.create_user_id
  is '�����˱��';
comment on column DEPARTMENT.stauts
  is '״̬��0ͣ������1��';
alter table DEPARTMENT
  add constraint PK_DEPARTMENT primary key (DEPARTMENT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DICT
prompt ===================
prompt
create table DICT
(
  table_name VARCHAR2(30) not null,
  dict_name  VARCHAR2(50) not null,
  auto_load  NUMBER default 1,
  load_sql   VARCHAR2(200),
  indate     DATE default sysdate
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table DICT
  is '�����б������Զ�����';
comment on column DICT.table_name
  is '����';
comment on column DICT.dict_name
  is '�ֵ�����';
comment on column DICT.auto_load
  is '�Ƿ���������';
comment on column DICT.load_sql
  is '���ز������õ�SQL';
alter table DICT
  add constraint PK_DICT primary key (TABLE_NAME)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FILES
prompt ====================
prompt
create table FILES
(
  file_id       VARCHAR2(50) not null,
  file_name     VARCHAR2(50) not null,
  file_ext_name VARCHAR2(50) not null,
  file_content  BLOB not null,
  create_time   DATE default sysdate not null,
  operater      VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table FILES
  is '�ļ�';

prompt
prompt Creating table FILE_RESOURCE
prompt ============================
prompt
create table FILE_RESOURCE
(
  file_id       VARCHAR2(50),
  file_name     VARCHAR2(50),
  file_ext_name VARCHAR2(50),
  file_content  BLOB,
  create_time   DATE,
  operater      VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table FILE_RESOURCE
  is '�ļ�';

prompt
prompt Creating table LOGS
prompt ===================
prompt
create table LOGS
(
  id           NUMBER(20) not null,
  log          VARCHAR2(500),
  user_id      VARCHAR2(50),
  user_name    VARCHAR2(50),
  create_time  DATE,
  object_value VARCHAR2(50),
  old          VARCHAR2(50),
  news         VARCHAR2(50),
  name         VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table LOGS
  is '��־';
comment on column LOGS.id
  is '���';
comment on column LOGS.log
  is '��־����';
comment on column LOGS.user_id
  is '�����߱��';
comment on column LOGS.user_name
  is '������';
comment on column LOGS.create_time
  is '����ʱ��';
comment on column LOGS.object_value
  is '������������';
comment on column LOGS.old
  is 'ԭ��ֵ';
comment on column LOGS.news
  is '����ֵ';
comment on column LOGS.name
  is '��������';
alter table LOGS
  add constraint PK_LOGS primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORDERS
prompt =====================
prompt
create table ORDERS
(
  orders_id       VARCHAR2(50) not null,
  orders_name     VARCHAR2(50),
  orders_content  VARCHAR2(500),
  company_id      VARCHAR2(50) not null,
  orders_time     DATE not null,
  director        VARCHAR2(50) not null,
  plan_time       DATE not null,
  real_time       DATE,
  create_time     DATE not null,
  create_user_id  VARCHAR2(50) not null,
  stauts          CHAR(1) not null,
  notify_time     DATE,
  notify_user     VARCHAR2(50),
  assign_time     DATE,
  assign_user     VARCHAR2(50),
  assign_stauts   VARCHAR2(1) default 0,
  notify_stauts   VARCHAR2(1) default 0,
  complete_time   DATE,
  complete_stauts VARCHAR2(1) default 0,
  complete_user   VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ORDERS
  is '����';
comment on column ORDERS.orders_id
  is '�������';
comment on column ORDERS.orders_name
  is '��������';
comment on column ORDERS.orders_content
  is '��������';
comment on column ORDERS.company_id
  is '������˾���';
comment on column ORDERS.orders_time
  is '����ʱ��';
comment on column ORDERS.director
  is '�����˱��';
comment on column ORDERS.plan_time
  is '�ƻ����ʱ��';
comment on column ORDERS.real_time
  is 'ʵ�����ʱ��';
comment on column ORDERS.create_time
  is '����ʱ��';
comment on column ORDERS.create_user_id
  is '�����˱��';
comment on column ORDERS.stauts
  is '״̬��0����1���ᵥ2��֪ͨ3���ɵ�4���깤��';
comment on column ORDERS.notify_time
  is '֪ͨʱ��';
comment on column ORDERS.notify_user
  is '֪ͨ��Ա';
comment on column ORDERS.assign_time
  is '�ɵ�ʱ��';
comment on column ORDERS.assign_user
  is '�ɵ���Ա';
comment on column ORDERS.assign_stauts
  is '֪ͨ��ʶ';
comment on column ORDERS.notify_stauts
  is '�ɵ���ʶ';
comment on column ORDERS.complete_time
  is '�깤ʱ��';
comment on column ORDERS.complete_stauts
  is '�깤��ʶ';
comment on column ORDERS.complete_user
  is '�깤��Ա';
alter table ORDERS
  add constraint PK_ORDERS primary key (ORDERS_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORDERS_DETAIL
prompt ============================
prompt
create table ORDERS_DETAIL
(
  orders_detail_id  VARCHAR2(50) not null,
  orders_id         VARCHAR2(50) not null,
  parts             VARCHAR2(50) not null,
  standard          VARCHAR2(50) not null,
  single_number     NUMBER,
  craft_no          VARCHAR2(50),
  volume_density    NUMBER(10,2),
  stock             NUMBER,
  volume            NUMBER(10,3),
  single_weight     NUMBER(10,3),
  total_weight      NUMBER(10,3),
  production_number NUMBER,
  remark            VARCHAR2(50),
  create_time       DATE,
  notify_time       DATE,
  notify_user       VARCHAR2(50),
  assign_time       DATE,
  assign_user       VARCHAR2(50),
  notify_remark     VARCHAR2(50),
  assign_remark     VARCHAR2(50),
  assign_stauts     VARCHAR2(1) default 0,
  notify_stauts     VARCHAR2(1) default 0,
  real_amount       NUMBER(10,3),
  model             VARCHAR2(50),
  all_number        NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ORDERS_DETAIL
  is '������ϸ';
comment on column ORDERS_DETAIL.orders_detail_id
  is '������ϸ���';
comment on column ORDERS_DETAIL.orders_id
  is '�������';
comment on column ORDERS_DETAIL.parts
  is '������λ';
comment on column ORDERS_DETAIL.standard
  is '��Ʒ���';
comment on column ORDERS_DETAIL.single_number
  is '������';
comment on column ORDERS_DETAIL.craft_no
  is '���պ�';
comment on column ORDERS_DETAIL.volume_density
  is '����';
comment on column ORDERS_DETAIL.stock
  is '���';
comment on column ORDERS_DETAIL.volume
  is '���';
comment on column ORDERS_DETAIL.single_weight
  is '����';
comment on column ORDERS_DETAIL.total_weight
  is '����';
comment on column ORDERS_DETAIL.production_number
  is '������';
comment on column ORDERS_DETAIL.remark
  is '��ע';
comment on column ORDERS_DETAIL.create_time
  is '����ʱ��';
comment on column ORDERS_DETAIL.notify_time
  is '֪ͨʱ��';
comment on column ORDERS_DETAIL.notify_user
  is '֪ͨ��Ա';
comment on column ORDERS_DETAIL.assign_time
  is '�ɵ�ʱ��';
comment on column ORDERS_DETAIL.assign_user
  is '�ɵ���Ա';
comment on column ORDERS_DETAIL.notify_remark
  is '֪ͨ���';
comment on column ORDERS_DETAIL.assign_remark
  is '�ɵ����';
comment on column ORDERS_DETAIL.assign_stauts
  is '֪ͨ��ʶ';
comment on column ORDERS_DETAIL.notify_stauts
  is '�ɵ���ʶ';
comment on column ORDERS_DETAIL.real_amount
  is 'ʵ������';
comment on column ORDERS_DETAIL.model
  is '�ͺ�';
comment on column ORDERS_DETAIL.all_number
  is '����';
alter table ORDERS_DETAIL
  add constraint PK_ORDERS_DETAIL primary key (ORDERS_DETAIL_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCE
prompt ======================
prompt
create table PRODUCE
(
  produce_id       VARCHAR2(50) not null,
  orders_detail_id VARCHAR2(50) not null,
  produce_time     DATE not null,
  person_in_charge VARCHAR2(50) not null,
  product_id       VARCHAR2(50) not null,
  device_id        VARCHAR2(50) not null,
  tasks_amount     NUMBER not null,
  theory_weight    NUMBER,
  real_weight      NUMBER,
  real_amount      NUMBER,
  accept_amount    NUMBER,
  produce_dis      VARCHAR2(500),
  acceptor         VARCHAR2(50),
  inspetor         VARCHAR2(50),
  director         VARCHAR2(50),
  apm              VARCHAR2(50),
  stant_no         VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table PRODUCE
  is '��Ʒ�ɹ�';
comment on column PRODUCE.produce_id
  is '�ɹ������';
comment on column PRODUCE.orders_detail_id
  is '������ϸ���';
comment on column PRODUCE.produce_time
  is '����ʱ��';
comment on column PRODUCE.person_in_charge
  is '��������';
comment on column PRODUCE.product_id
  is '��Ʒ����';
comment on column PRODUCE.device_id
  is '�豸���';
comment on column PRODUCE.tasks_amount
  is '��������';
comment on column PRODUCE.theory_weight
  is '���۵���';
comment on column PRODUCE.real_weight
  is 'ʵ�ʵ���';
comment on column PRODUCE.real_amount
  is 'ʵ������';
comment on column PRODUCE.accept_amount
  is '��������';
comment on column PRODUCE.produce_dis
  is '�������';
comment on column PRODUCE.acceptor
  is '��������';
comment on column PRODUCE.inspetor
  is '�����ල';
comment on column PRODUCE.director
  is '��������';
comment on column PRODUCE.apm
  is '���';
comment on column PRODUCE.stant_no
  is '���ձ��';
alter table PRODUCE
  add constraint PK_PRODUCE primary key (PRODUCE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCE_USERS
prompt ============================
prompt
create table PRODUCE_USERS
(
  produce_id  VARCHAR2(50),
  user_id     VARCHAR2(50),
  create_time DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table PRODUCE_USERS
  is '������Ա��¼';
comment on column PRODUCE_USERS.produce_id
  is '�ɵ����';
comment on column PRODUCE_USERS.user_id
  is '��Ա���';
comment on column PRODUCE_USERS.create_time
  is 'ʱ��';
create index INDEX_PRODUCE_ID on PRODUCE_USERS (PRODUCE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCT
prompt ======================
prompt
create table PRODUCT
(
  product_id       VARCHAR2(50) not null,
  product_type     VARCHAR2(50) not null,
  product_name     VARCHAR2(50) not null,
  product_icon     VARCHAR2(50),
  product_dis      VARCHAR2(500),
  create_time      DATE not null,
  create_user_id   VARCHAR2(50) not null,
  stauts           CHAR(1) not null,
  product_standard VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table PRODUCT
  is '��Ʒ';
comment on column PRODUCT.product_id
  is '��Ʒ���';
comment on column PRODUCT.product_type
  is '��Ʒ���';
comment on column PRODUCT.product_name
  is '��Ʒ����';
comment on column PRODUCT.product_icon
  is '��ƷͼƬ';
comment on column PRODUCT.product_dis
  is '��Ʒ����';
comment on column PRODUCT.create_time
  is '����ʱ��';
comment on column PRODUCT.create_user_id
  is '�����˱��';
comment on column PRODUCT.stauts
  is '״̬��0��������1��';
comment on column PRODUCT.product_standard
  is '��Ʒ���';
alter table PRODUCT
  add constraint PK_PRODUCT primary key (PRODUCT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCT_CATEGORY
prompt ===============================
prompt
create table PRODUCT_CATEGORY
(
  category_id    VARCHAR2(50) not null,
  category_name  VARCHAR2(50) not null,
  category_icon  VARCHAR2(50),
  category_dis   VARCHAR2(500),
  create_time    DATE not null,
  create_user_id VARCHAR2(50) not null,
  stauts         CHAR(1) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table PRODUCT_CATEGORY
  is '��Ʒ���';
comment on column PRODUCT_CATEGORY.category_id
  is '�����';
comment on column PRODUCT_CATEGORY.category_name
  is '�������';
comment on column PRODUCT_CATEGORY.category_icon
  is '���ͼƬ';
comment on column PRODUCT_CATEGORY.category_dis
  is '�������';
comment on column PRODUCT_CATEGORY.create_time
  is '����ʱ��';
comment on column PRODUCT_CATEGORY.create_user_id
  is '�����˱��';
comment on column PRODUCT_CATEGORY.stauts
  is '״̬��0��������1��';
alter table PRODUCT_CATEGORY
  add constraint PK_PRODUCT_CATEGORY primary key (CATEGORY_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PROVINCE
prompt =======================
prompt
create table PROVINCE
(
  code        VARCHAR2(12),
  name        VARCHAR2(50),
  type        VARCHAR2(50),
  parent_code VARCHAR2(12)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table PROVINCE
  is '��������';

prompt
prompt Creating table RESOURCES
prompt ========================
prompt
create table RESOURCES
(
  resources_id        VARCHAR2(50) not null,
  parent_resources_id VARCHAR2(50) not null,
  resources_name      VARCHAR2(50) not null,
  resources_url       VARCHAR2(200),
  resources_path      VARCHAR2(200),
  resources_icon      VARCHAR2(200),
  resources_type      CHAR(1) default '2' not null,
  create_time         DATE default sysdate not null,
  create_user_id      VARCHAR2(50) default '1' not null,
  remark              VARCHAR2(50) default 'fa fa-leaf',
  stauts              CHAR(1) default 1
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table RESOURCES
  is '��Դ';
comment on column RESOURCES.resources_id
  is '��Դ���';
comment on column RESOURCES.parent_resources_id
  is '�ϼ����';
comment on column RESOURCES.resources_name
  is '��Դ����';
comment on column RESOURCES.resources_url
  is '��Դ��ַ';
comment on column RESOURCES.resources_path
  is '��Դ·��';
comment on column RESOURCES.resources_icon
  is 'ͼ��';
comment on column RESOURCES.resources_type
  is '��Դ���';
comment on column RESOURCES.create_time
  is '����ʱ��';
comment on column RESOURCES.create_user_id
  is '�����˱��';
comment on column RESOURCES.remark
  is '��ע';
comment on column RESOURCES.stauts
  is '״̬';
alter table RESOURCES
  add constraint PK_RESOURCES primary key (RESOURCES_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ROLE
prompt ===================
prompt
create table ROLE
(
  role_id        VARCHAR2(50) not null,
  role_name      VARCHAR2(50) not null,
  create_time    DATE not null,
  create_user_id VARCHAR2(50) not null,
  remark         VARCHAR2(200) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ROLE
  is '�û���ɫ';
comment on column ROLE.role_id
  is '��ɫ���';
comment on column ROLE.role_name
  is '��ɫ����';
comment on column ROLE.create_time
  is '����ʱ��';
comment on column ROLE.create_user_id
  is '�����˱��';
comment on column ROLE.remark
  is '��ע';
alter table ROLE
  add constraint PK_ROLE primary key (ROLE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ROLE_RESOURCES
prompt =============================
prompt
create table ROLE_RESOURCES
(
  role_id      VARCHAR2(50) not null,
  resources_id VARCHAR2(50) not null,
  create_time  DATE default sysdate not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ROLE_RESOURCES
  is '��ɫȨ��';
comment on column ROLE_RESOURCES.role_id
  is '��ɫ���';
comment on column ROLE_RESOURCES.resources_id
  is '��Դ���';
comment on column ROLE_RESOURCES.create_time
  is '����ʱ��';

prompt
prompt Creating table STATIC_DATA
prompt ==========================
prompt
create table STATIC_DATA
(
  name   VARCHAR2(50),
  code   VARCHAR2(50),
  type   CHAR(2),
  remark VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table STATIC_DATA
  is '��̬�ֵ�';
comment on column STATIC_DATA.name
  is 'name';
comment on column STATIC_DATA.code
  is 'code';
comment on column STATIC_DATA.type
  is 'remark';

prompt
prompt Creating table USERS
prompt ====================
prompt
create table USERS
(
  user_id         VARCHAR2(50) not null,
  account         VARCHAR2(30) not null,
  password        VARCHAR2(100) not null,
  sex             CHAR(1) not null,
  id_card         VARCHAR2(18),
  name            VARCHAR2(50) not null,
  department_id   VARCHAR2(50) not null,
  area_code       VARCHAR2(6) not null,
  birthday        DATE,
  stauts          CHAR(1) not null,
  last_login_time DATE,
  mobile          VARCHAR2(50),
  email           VARCHAR2(50),
  seat            VARCHAR2(50),
  user_level      VARCHAR2(2) not null,
  create_time     DATE not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table USERS
  is 'ϵͳ�û�';
comment on column USERS.user_id
  is '�û����';
comment on column USERS.account
  is '�˻�';
comment on column USERS.password
  is '����';
comment on column USERS.sex
  is '�Ա�';
comment on column USERS.id_card
  is '���֤��';
comment on column USERS.name
  is '�û���';
comment on column USERS.department_id
  is '���ű��';
comment on column USERS.area_code
  is '�����������';
comment on column USERS.birthday
  is '��������';
comment on column USERS.stauts
  is '״̬��0ͣ������1��';
comment on column USERS.last_login_time
  is '����¼ʱ��';
comment on column USERS.mobile
  is '�ֻ���';
comment on column USERS.email
  is '��������';
comment on column USERS.seat
  is '��λ';
comment on column USERS.user_level
  is '�û�����';
comment on column USERS.create_time
  is '����ʱ��';
alter table USERS
  add constraint PK_USERS primary key (USER_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USERS_ROLE
prompt =========================
prompt
create table USERS_ROLE
(
  user_id     VARCHAR2(50) not null,
  role_id     VARCHAR2(50) not null,
  create_time DATE default SYSDATE not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table USERS_ROLE
  is '�û���ɫ';
create index PK_USERS_ROLE on USERS_ROLE (USER_ID, ROLE_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence SEQ_LOGS
prompt ==========================
prompt
create sequence SEQ_LOGS
minvalue 1
maxvalue 999999999999999999999999999
start with 361
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ORDERS
prompt ============================
prompt
create sequence SEQ_ORDERS
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ORDERS_DETAIL
prompt ===================================
prompt
create sequence SEQ_ORDERS_DETAIL
minvalue 1
maxvalue 999999999999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PRODUCE
prompt =============================
prompt
create sequence SEQ_PRODUCE
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PRODUCT_CATEGORY
prompt ======================================
prompt
create sequence SEQ_PRODUCT_CATEGORY
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;


spool off
