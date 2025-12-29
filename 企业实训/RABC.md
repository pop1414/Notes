# RABC（Role-Based Access Control）
![[Pasted image 20251229133153.png]]
- 基于角色的访问控制
- 这三个模块，其实是在指三类对象
## 权限选项管理（Permission）
- 管理系统最基本的权限选项，通常细化到每个左侧菜单/超链接，是“最小单位”
- 参与者：仅超级管理员可以操作，对系统中的角色进行权限配置
- 主要用来管理客户的基本信息，同时可以查询客户的订购信息
- 功能说明：
	1. 有以下的初始化角色：客服人员、调度中心管理员、分站管理员、库房管理员、配送中心管理员、超级管理员；分别对应各个模块的权限，不可修改以及删除
	2. 可以创建新的角色，并配置角色的详细权限
## 角色管理（Role）
- 一个角色能配置多个“权限选项”，角色本身可增删改查，并且有“配置角色权限”的入口
- 参与者：仅超级管理员可以操作，对系统中的角色进行增加、修改、删除等操作
- 设定一个角色，给这个角色配置多个权限选项 
- 功能说明：
	1. 点击“查询”、“增加”按钮创建新角色以及查询现有角色
	2. 点击“修改信息”、“删除”超链接可以对角色进行修改和删除操作
	3. 点击“配置角色权限”超链接，进入给角色配置权限选项的页面；在此页面中可以对角色拥有的权限选项进行增删操作
## 用户管理（User）
- 维护“能登录系统的人”（谁能登录），并给用户“赋角色”
- 参与者：仅超级管理员可以操作
- 基于对用户的信息管理
- 功能说明：
	1. 增加、修改、删除、查询用户信息
	2. 可以设置用户的角色为（谁能登录）：客服人员、调度中心管理员、分站管理员、库房管理员、配送中心管理员、超级管理员或者新建角色（对扩展开放）

## 具体权限


## 具体角色
- 客服人员（customer_service)：
	- 接受请求，生成订单，检查库存确定状态
	- client:create, client:
- 调度中心管理员（dispatcher):
	- 订单/库房调度，手工/自动调度，修改缺货订单，生成任务/调拨单
	- order:confirm, schedule:manual
- 分站管理员（substation_admin）
	- 派单、结单，订单状态更新
	- task:query, task:assign
- 库房管理员
## 具体数据库表
- users（用户表）
- |字段名|数据类型|约束/默认值|注释|
|---|---|---|---|
|id|BIGINT|AUTO_INCREMENT, PRIMARY KEY|用户ID，自增主键|
|username|VARCHAR(50)|UNIQUE NOT NULL|用户名，唯一|
|password|VARCHAR(255)|NOT NULL|加密密码 (使用BCrypt)|
|email|VARCHAR(100)|-|邮箱|
|type|ENUM('customer_service', 'dispatcher', 'substation_admin', 'warehouse_admin', 'delivery_center_admin', 'finance', 'super_admin', 'deliverer')|NOT NULL|用户类型，基于文档角色（如客服、配送员）|
|depot_id|BIGINT|-|关联库房/分站ID (可选，外键引用depot.id)|
|create_time|TIMESTAMP|DEFAULT CURRENT_TIMESTAMP|创建时间|
|update_time|TIMESTAMP|DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP|更新时间|
- roles（角色表）
- |字段名|数据类型|约束/默认值|注释|
|---|---|---|---|
|id|BIGINT|AUTO_INCREMENT, PRIMARY KEY|角色ID，自增主键|
|role_name|VARCHAR(50)|UNIQUE NOT NULL|角色名，如 'customer_service'|
|description|VARCHAR(255)|-|描述|
|is_initial|TINYINT(1)|DEFAULT 1|是否初始化角色 (1=是，不可删除)|
|create_time|TIMESTAMP|DEFAULT CURRENT_TIMESTAMP|创建时间|
- permissions（权限表）
- |字段名|数据类型|约束/默认值|注释|
|---|---|---|---|
|id|BIGINT|AUTO_INCREMENT, PRIMARY KEY|权限ID，自增主键|
|perm_name|VARCHAR(100)|UNIQUE NOT NULL|权限名，如 'order:create'|
|description|VARCHAR(255)|-|描述|
|module|VARCHAR(50)|-|所属模块，如 'order'|
|create_time|TIMESTAMP|DEFAULT CURRENT_TIMESTAMP|创建时间|
- role_permissions（角色-权限关联表）
- |字段名|数据类型|约束/默认值|注释|
|---|---|---|---|
|role_id|BIGINT|NOT NULL|角色ID (外键引用roles.id, ON DELETE CASCADE)|
|perm_id|BIGINT|NOT NULL|权限ID (外键引用permissions.id, ON DELETE CASCADE)|
- user_roles（用户-角色关联表）
- |字段名|数据类型|约束/默认值|注释|
|---|---|---|---|
|role_id|BIGINT|NOT NULL|角色ID (外键引用roles.id, ON DELETE CASCADE)|
|perm_id|BIGINT|NOT NULL|权限ID (外键引用permissions.id, ON DELETE CASCADE)|
- 一个用户可能既是“分站管理员”又兼“库房管理员”（兼职/临时授权很常见）
