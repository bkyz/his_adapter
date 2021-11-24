

# HIS 统一平台数据标准(预交金模式)

| **版本号** | **变更时间** | **变更内容** | **编撰人员** | **描述** |
| --- | --- | --- | --- | --- |
| V1.0 | 2016.05.20 | 创建文档 | 王曲 |
 |
| V2.0 | 2016.06.02 | 修改文档 | 王曲 |
 |
| V3.0 | 2018.04.16 | 修改文档 | 卢汉金 |
 |
| V4.0 | 2020.08.31 | 修改文档 | 罗阳 | 定义预交金模式下的通用型接口以及各接口出入参修改 |
| V4.1 | 2020.10.10 | 修改文档 | 罗阳 | 统一各项出入参节点大小写规范，以及命名规范 |
| V4.2 | 2020.10.12 | 修改文档 | 罗阳 | 修改3001、3002接口新增标识PayState，3003、3004为查询已结算的交易信息接口。 |
| V4.3 | 2020.10.25 | 修改文档 | 罗阳 | 修改3004、4005、4007、4010、7001、7002、7003、7004接口卡类型、卡号字段去除; 7001、7002、7003、7004入参去除InPatientNo字段，新增VisitType字段且7001、ExamBillNo与7003、LabBillNo取消必填；4007接口返回参数调整为ReceiptNo，4010接口修正出入参OrderNo、OrderID改为SeqNumber；其余所有接口UserID、HospitalID必填。 |
| V4.4 | 2020.11.02 | 修改文档 | 罗阳 | ①、2002、2003、2006接口入参CardType\CardNum调整为CertificateType\CertificateNum②、所有接口CardNo调整为统一的CardNum③、连州地区4003新增一个出参，7001新增5个出参，7002新增2个出参 |
| V4.5 | 2021.04.21 | 修改文档 | 罗阳 | 3002接口新增入参PatientID（患者ID） |
| V4.6 | 2021.06.30 | 修改文档 | 罗阳 | 2001接口卡类型为99时卡号默认为PatientID，出参增加出生日期Birthdate、家庭地址Address4002、4003入参科室编号（DeptCode）改为可以为空，为空时返回全部3015出参增加患者计费时间字段OperationTime |
| V4.7 | 2021.07.27 | 修改文档 | 罗阳 | 新增30151接口，入参与3015一致，出参不再为汇总信息更改为明细信息4010预约情况查询接口时间改为时间段，且预约序号可以为空,出参增加SessionCode和SessionName |
| V4.7 | 2021.07.27 | 修改文档 | 罗阳 | 6001接口入参itemclass改为spellcode |
| V4.8 | 2021.08.18 | 修改文档 | 罗阳 | 4010接口出参新增OperationTime节点6001接口支持分页查询功能新增参数Size、Page、PhysicFlag，出参新增ItemCount参数 |
| V4.9 | 2021.08.26 | 修改文档 | 罗阳 | 修改3008、3009接口对接相关移动支付医保交易，3010接口作废。 |
| V4.10 | 2021.09.13 | 修改文档 | 罗阳 | 新增2011电子健康码绑定接口新增3019门诊费用清单查询接口修改4010患者预约情况查询（连州地区）接口，新增TodayFlag标识修改2001患者信息校验接口支持电子健康码查询病人信息 |

**目 录**

# 文档概述

## 引言

本文档制定第三方系统厂家与His厂商的业务接口规范。

# 适用范围

本文档适用银医一卡通自助应用、院内诊疗卡自助应用、居民健康卡自助应用、微信服务号应用。

文档内容预期读者包括His开发商技术人员、自助系统开发商技术人员。

# 接口概述

HIS作为服务端，以WebService方式或者Socket方式为自助终端、银行以及手机银行系统、手机微信提供服务。接口参数类型为String，字符串内的格式为XML。WebService方式通讯统一入口方法为Invoke，通过业务码进行业务区分。Socket方式通讯通过业务码进行业务区分。

该接口实现根据具体医院具体业务进行实现。

## 数据类型与格式

如无特殊说明，本文档中的部分数据均为以下格式：

- 日期： yyyyMMdd，即4位年，2位月份，2位日期。数据类型记为Date，长度为8。
- 时间：HHmmss，即2位小时（24小时制），2为分钟，2为秒。数据类型记为Time，长度为6.
- 日期时间：yyyyMMdd HHmmss。数据类型记为Datetime，长度为14.
- 带毫秒日期时间：yyyyMMdd HHmmssfff。fff为毫秒数。数据类型记为DatetimeF，长度为17。
- 金额：dddddddd.dd，整数部分最多为8位，小数点1位，小数部分为2位，若小数部分为0，则小数点和小数部分可以省略。计量单位为人民币元。数据类型记为decimal，最大长度为11。
- 单价：dddddddd.dd,，整数部分最多为8位，小数点1位，小数部分最多为2位，若小数部分为0，则小数点和小数部分可以省略。计量单位为人民币元。数据类型记为decimal，最大长度为11。
- 数量：dddddddd.dd，8位整数，2为小数。小数部分为0，小数点和小数部分可以省略，最大长度11位。数据类型记为Quantity。
- 其他数据请参照数据字典。

## 接口服务列表

### 基础服务

| 序号 | 服务方法说明 | 方法 | 交易码 |
| --- | --- | --- | --- |
| 1 | 网络测试 | Invoke | 1001 |

### 患者档案服务

| 序号 | 服务方法说明 | 方法 | 交易码 |
| --- | --- | --- | --- |
| 1 | 患者信息校验 | Invoke | 2001 |
| 2 | 建档 | Invoke | 2002 |
| 3 | 密码设置/信息修改 | Invoke | 2003 |
| ~~4~~ | 办卡 | Invoke | 2004 |
| 5 | 换卡 | Invoke | 2005 |
| 6 | 就诊卡查询 | Invoke | 2006 |
| 7 | 门诊就诊记录查询 | Invoke | 2007 |

### 充值缴费服务

| 序号 | 服务方法说明 | 方法 | 交易码 |
| --- | --- | --- | --- |
| 1 | 门诊待缴费记录查询 | Invoke | 3001 |
| 2 | 门诊待缴费明细查询 | Invoke | 3002 |
| 3 | 门诊已缴费记录查询 | Invoke | 3003 |
| 4 | 门诊已缴费明细查询 | Invoke | 3004 |
| 5 | 门诊预交金充值 | Invoke | 3005 |
| 6 | 门诊预交金充值记录 | Invoke | 3006 |
| 7 | 门诊缴费 | Invoke | 3007 |
| 8 | 医保预结算/结算 | Invoke | 3008 |
| 9 | 医保结算确认 | Invoke | 3009 |
| 10 | 医保结算取消 | Invoke | 3010 |
| 11 | 获取住院患者信息 | Invoke | 3011 |
| 12 | 住院预交金充值 | Invoke | 3012 |
| 13 | 住院预交金充值记录 | Invoke | 3013 |
| 14 | 住院患者费用查询 | Invoke | 3014 |
| 15 | 住院日清单查询 | Invoke | 3015 |
| 16 | 更新缴费清单打印次数 | Invoke | 3016 |
| 17 | 银联缴费日志记录 | Invoke | 3017 |
| 18 | 更新银联缴费日志记录 | Invoke | 3018 |

### 号源服务

| 1 | 获取挂号科室 | Invoke | 4001 |
| --- | --- | --- | --- |
| 2 | 获取号类 | Invoke | 4002 |
| 3 | 获取医生排班 | Invoke | 4003 |
| 4 | 获取医生排班时间点 | Invoke | 4004 |
| 5 | 获取挂号费用 | Invoke | 4005 |
| 6 | 预约确认 | Invoke | 4006 |
| 7 | 预约支付 | Invoke | 4007 |
| 8 | 预约取号 | Invoke | 4008 |
| 9 | 取消预约 | Invoke | 4009 |
| 10 | 患者预约情况查询 | Invoke | 4010 |
| 11 | 停诊医生查询 | Invoke | 4011 |

### 医嘱/排队服务

| 序号 | 服务方法说明 | 方法 | 交易码 |
| --- | --- | --- | --- |
| 1 | 门诊候诊信息查询 | Invoke | 5001 |
| 2 | 取药排队信息查询 | Invoke | 5002 |
| 3 | 门诊病人就诊记录 | Invoke | 5003 |
| 4 | 门诊医嘱记录查询 | Invoke | 5004 |
| 5 | 门诊自助取药确认 | Invoke | 5005 |

### 字典服务

| 序号 | 服务方法说明 | 方法 | 交易码 |
| --- | --- | --- | --- |
| 1 | 查询物价费用明细 | Invoke | 6001 |
| 2 | 获取科室介绍明细 | Invoke | 6002 |
| 3 | 获取医生介绍明细 | Invoke | 6003 |
| 4 | 查询药品信息 | Invoke | 6004 |
| 5 | 查询非药品信息 | Invoke | 6005 |
| 6 | 获取基本字典信息 | Invoke | 6006 |

### 报告查询服务

| 序号 | 服务方法说明 | 方法 | 交易码 |
| --- | --- | --- | --- |
| 1 | 检查报告列表查询 | Invoke | 7001 |
| 2 | 检查报告明细查询 | Invoke | 7002 |
| 3 | 检验报告列表查询 | Invoke | 7003 |
| 4 | 检验报告明细查询 | Invoke | 7004 |

### 医保服务（广州地区）

| 序号 | 服务方法说明 | 方法 | 交易码 |
| --- | --- | --- | --- |
| 1 | API登录信息解析 | Invoke | 8001 |
| 2 | API取人员信息解析 | Invoke | 8002 |
| 3 | API门诊登记信息解析 | Invoke | 8003 |
| 4 | API门诊费用上传信息解析 | Invoke | 8004 |
| 5 | 平台登录信息解析 | Invoke | 8005 |
| 6 | 平台取人员业务信息解析 | Invoke | 8006 |
| 7 | 平台预结算/结算信息解析 | Invoke | 8007 |
| 8 | 平台取消结算信息解析 | Invoke | 8008 |
| 9 | 医保/平台重新登录 | Invoke | 8009 |

# 接口详细说明与格式

## 基础服务

### 【1001】网络测试

该接口主要功能是在自助设备启动时，进行检测His服务是否正常；同时自助设备与His服务器进行时间同步。

| 接口代码 | 1001 |
| --- | --- |
| 接口描述 | 测试HIS是否连接正常 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为1001) | Y | 4 |
| TransactionID | String | 交易流水号(例如格式:yyyyMMddHHmmss) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16:eUOPTfxvGVeusXeV |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | fdrx/FD001 |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<NowTime\>\</NowTime\>\<SerialNo\>\</SerialNo\>\</Response\> |


| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| NowTime | DateTime | HIS服务当前时间 | Y | |
| SerialNo | String | HIS服务当前时间(格式: yyyymmddhh24missff3) | Y | |

## 患者档案服务

### 【2001】患者信息校验

检验患者档案是否已经存在，若存在则返回相关信息，若不存在进行建档处 理。

| 接口代码 | 2001 |
| --- | --- |
| 接口描述 | 获取患者相关信息 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为2001) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡(证)类型(00、就诊卡 01、身份证JK、电子健康码) | Y | |
| CardNum | String | 卡(证)号 | Y | |
| IsChild | String | 是否儿童（Y/N，如IsChild为Y且cardtype为01时，身份证号为监护人身份证号，按此查找） | Y | 连州地区新增 |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<PatientId\>\</PatientId\>\<PatientName \>\</PatientName\>\<IDCard\>\</IDCard\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<MobilePhone\>\</MobilePhone\>\<Sex\>\</Sex\>\<AccountBalance\>\</AccountBalance\>\<SetPassword\>\</SetPassword\>\<CreateDate\>\</CreateDate\>\<UseTime\>\</UseTime\>\</Item\>...\</Items\>
\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集 | Y | |
| Item | | 项目列表 | Y | |
| PatientId | Integer | HIS系统病人档案唯一Id | Y | |
| PatientName | String | 姓名 | Y | |
| IDCard | String | 身份证号码 | | |
| CardType | String | 就诊卡类型 | | |
| CardNum | String | 卡号 | | |
| MobilePhone | String | 手机号码 | | |
| Sex | String | 性别 | Y | |
| AccountBalance | Float | 账户余额 | | |
| SetPassword | Integer | 密码标志 | Y | |
| CreateDate | String | 办卡时间(yyyymmddhhmmss) | Y | |
| UseTime | Integer | 就诊次数 | Y | |
| BirthDate | String | 出生日期（格式：yyyymmdd） | | |
| Address | String | 联系地址 | | |

### 【2002】建档

根据患者基本信息建立患者档案

| 接口代码 | 2002 |
| --- | --- |
| 接口描述 | 获取患者相关信息 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientId\>\</PatientId\>\<PatientName\>\</PatientName\>\<CertificateType\>\</CertificateType\>\<CertificateNum\>\</CertificateNum\>\<Sex\>\</Sex\>\<BirthDate\>\</BirthDate\>\<MobilePhone\>\</MobilePhone\>\<Address\>\</Address\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为2002) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y |  |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientId | String | 病人ID | | 10 |
| PatientName | String | 姓名 | Y | |
| CertificateType | String | 证件类型 | Y | |
| CertificateNum | String | 证件号码 | Y | |
| Sex | String | 性别 | Y | |
| BirthDate | String | 出生日期（格式：yyyymmdd） | Y | |
| MobilePhone | String | 联系电话 | Y | |
| Address | String | 联系地址 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<PatientId\>\</PatientId\>\<PatientName \>\</PatientName\>\<IDCard\>\</IDCard\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<MobilePhone\>\</MobilePhone\>\<Sex\>\</Sex\>\<AccountBalance\>\</AccountBalance\>\<SetPassword\>\</SetPassword\>\<CreateDate\>\</CreateDate\>\<UseTime\>\</UseTime\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| PatientId | Integer | HIS系统病人档案唯一Id | Y | |
| PatientName | String | 姓名 | Y | |
| IDCard | String | 身份证号码 | | |
| CardType | String | 就诊卡类型 | | |
| CardNum | String | 卡号 | | |
| MobilePhone | String | 手机号码 | | |
| Sex | String | 性别 | Y | |
| AccountBalance | Float | 账户余额 | | |
| SetPassword | Integer | 密码标志 | Y | |
| CreateDate | String | 办卡时间（yyyymmddhhmmss） | Y | |
| UseTime | Integer | 就诊次数 | Y | |

### 【2003】密码设置/信息修改

设置账户交易密码/患者实名认证

| 接口代码 | 2003 |
| --- | --- |
| 接口描述 | 设置账户交易密码/患者实名认证 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientId\>\</PatientId\>\<OperationType\>\</OperationType\>\<PasswordOld\>\</PasswordOld\>\<PasswordNew\>\</PasswordNew\>\<CertificateType\>\< CertificateType\>\<CertificateNum \>\</CertificateNum\>\<PhoneNum\>\</PhoneNum\>\<GuardianName\>\</GuardianName\>\<GuardianCerType\>\</GuardianCerType\>\<GuardianCerNum\>\</GuardianCerNum\>\<GuardianPhoneNum\>\</GuardianPhoneNum\>\</Request\> |


| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ------ | ------- | ----- | 
| TranCode | String | 业务请求代码(值为2003) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientId | Integer | HIS系统病人档案唯一Id | Y | |
| OperationType | Integer | 操作类型(1 修改密码,2 实名认证) | Y | |
| PasswordOld | String | 原密码 | Y | |
| PasswordNew | String | 新密码 | Y | |
| CertificateType | String | 证件类型 | Y | |
| CertificateNum | String | 证件号码 | Y | |
| PhoneNum | String | 电话号码 | Y | |
| GuardianName | String | 监护人姓名 | Y | |
| GuardianCerType | Integer | 监护人证件类型 | Y | |
| GuardianCerNum | String | 监护人证件号码 | Y | |
| GuardianPhoneNum | String | 监护人电话号码 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |

### 【2004】办卡

根据患者ID新办各种就诊卡（或者不发医院就诊卡），建立各种就诊卡信息。

| 接口代码 | 2004 |
| --- | --- |
| 接口描述 | 设置账户交易密码/患者实名认证 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientId\>\</PatientId\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为2004) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientId | Integer | HIS系统病人档案唯一Id | Y | |
| CardType | Integer | 卡类型 | Y | |
| CardNum | String | 卡号码 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |

### 【2005】换卡

换就诊卡，旧卡丢失等原因，用新卡替换旧卡，只允许更换医院就诊卡，其他类型的卡不允许更换。换卡后原旧卡自动作废。如果以后允许其他卡也可以更换，必须填写卡类型，也只允许同种类型卡更换。

| 接口代码 | 2005 |
| --- | --- |
| 接口描述 | 换就诊卡只允许更换医院就诊卡 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientId\>\</PatientId\>\<CardNumOld\>\</CardNumOld\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<UserId\>\</UserId\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为2005) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientId | Integer | HIS系统病人档案唯一Id | Y | |
| CardNumOld | String | 旧卡号码 | Y | |
| CardType | Integer | 卡类型 | Y | |
| CardNum | String | 卡号码 | Y | |
| UserId | String | 操作员工号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |

### 【2006】就诊卡查询

根据就诊卡卡号或身份证号查询患者基本信息

| 接口代码 | 2006 |
| --- | --- |
| 接口描述 | 根据就诊卡卡号或身份证号查询患者基本信息 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CertificateType\>\</CertificateType\>\<CertificateNum\>\</CertificateNum\>\<Name\>\</Name\>\<Phone\>\</Phone\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为2006) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CertificateType | String | 证件类型(参考字典附录) | Y | |
| CertificateNum | String | 证件号码 | Y | |
| Name | String | 姓名 | | |
| Phone | String | 电话号码 | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<PatientId\>\</PatientId\>\<PatientName \>\</PatientName\>\<IDCard\>\</IDCard\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<MobilePhone\>\</MobilePhone\>\<Sex\>\</Sex\>\<AccountBalance\>\</AccountBalance\>\<SetPassword\>\</SetPassword\>\<CreateDate\>\</CreateDate\>\<UseTime\>\</UseTime\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集 | Y | |
| Item | | 项目列表 | Y | |
| PatientId | Integer | HIS系统病人档案唯一Id | Y | |
| PatientName | String | 姓名 | Y | |
| CardType | String | 其他证件类型 | | |
| CardNum | String | 其他证件号码 | | |
| MobilePhone | String | 手机号码 | | |
| Sex | String | 性别 | Y | |
| AccountBalance | Float | 账户余额 | | |
| SetPassword | Integer | 密码标志 | Y | |
| CreateDate | String | 办卡时间(yyyymmddhhmmss) | Y | |
| UseTime | Integer | 就诊次数 | Y | |

### 【2007】门诊就诊记录查询(广州地区)

根据就诊卡卡号以及时间段查询患者就诊记录信息

| 接口代码 | 2007 |
| --- | --- |
| 接口描述 | 根据就诊卡卡号以及时间段查询患者就诊记录信息 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<CardType\>1\</ CardType\>\<CardNum\>12112121\</CardNum\>\<StartDate\>2017-01-01\</StartDate\>\<EndDate\>2017-10-16\</EndDate\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为2002) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | Integer | 卡类型 | Y | |
| CardNum | String | 卡号码 | Y | |
| StartDate | DateTime | 开始日期 | Y | |
| EndDate | DateTime | 结束日期 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response\>\<Result\>0\</Result\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<PatientName\>张三\</PatientName\>\<Sex\>0\</Sex\>\<PatientID\>10086100\</PatientID\>\<NullahNumber\>144002\</NullahNumber\>\<TreatmentType\>110\</TreatmentType\>\<Items\>\<Item\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| PatientName | String | 姓名 | Y | |
| Sex | String | 性别（0：男；1：女；2：未知；9：未定） | Y | |
| PatientID | String | 病人ID | Y | |
| NullahNumber | String | 门诊流水号（挂号号） | Y | |
| TreatmentType | String | 待遇类型 | Y | 为0代表非医保病人，大于0为医保病人 |
| DeptName | String | 就诊科室名称 | | |
| DoctorName | String | 就诊医生名称 | | |
| DiagName | String | 诊断名称 | | |
| Cost | Decimal | 本次就诊总费用 | | |
| Charges | Decimal | 本次就诊总自付 | | |
| VisitDate | String | 就诊日期(格式yyyymmdd) | | |

### 【2011】电子健康码绑定(连州地区)

根据病人ID和电子健康码静态码做病人信息绑定

| 接口代码 | 2011 |
| --- | --- |
| 接口描述 | 根据病人ID和电子健康码静态码做病人信息绑定 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientId\>\</PatientId\>\<PatientName\>\</PatientName\>\<erhcCardNo\>\</erhcCardNo\>\<empi\>\</empi\>\<QrCode\>\</QrCode\>\<idCode\>\</idCode\>\<personnelType\>\</personnelType\>\<nation\>\</nation\>\<birthday\>\</birthday\>\<birthplace\>\</birthplace\>\<phone\>\</phone\>\<linkman\>\</linkman\>\<maritalstatuscode\>\</maritalstatuscode\>\<current\_address\>\</current\_address\>\<nationality\>\</nationality\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为2011) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientId | String | 病人ID | Y | |
| PatientName | String | 姓名 | Y | |
| QrCode | String | 电子健康码—静态二维码 | Y | |
| idCode | String | 电子健康码—证件号码 | Y | |
| personnelType | String | 电子健康码—人员类型（1:普通 2:无证件儿童） | | |
| nation | String | 电子健康码—民族 | Y | |
| erhcCardNo | String | 电子健康码—电子健康码ID | | |
| empi | String | 电子健康码—主索引ID | | |
| birthday | String | 电子健康码—出生日期（YYYYMMDD） | | |
| birthplace | String | 电子健康码—出生地 | | |
| phone | String | 电子健康码—本人手机号 | | |
| linkman | String | 电子健康码—联系人姓名 | | |
| telephone | String | 电子健康码—联系人电话 | | |
| maritalstatuscode | String | 电子健康码—婚姻状态 | | |
| current\_address | String | 电子健康码—居住地址 | | |
| nationality | String | 电子健康码—国籍 | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |

## 充值缴费服务

### 【3001】门诊待缴费或已缴费记录查询

获取患者门诊待缴费项目信息。

| 接口代码 | 3001 |
| --- | --- |
| 接口描述 | 门诊待缴费或已缴费记录查询（PayState传0表示查待缴费、传1表示查已缴费） |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<AuthKey\>\</AuthKey\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<StartDate\>\</StartDate\>\<EndDate\>\</EndDate\>\<NullahNumber\>\</NullahNumber\>\<PayState\>\</PayState\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3001) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientID | String | 患者ID | Y | |
| StartDate | String | 开始日期(格式yyyymmdd) | Y | |
| EndDate | String | 结束日期(格式yyyymmdd) | Y | |
| NullahNumber | String | 门诊流水号（挂号号） | | |
| PayState | String | 缴费状态 | Y | 传0表示查待缴费、传1表示查已缴费 |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<CardNum\>\</CardNum\>\<TotalAmount\>\</TotalAmount\>\<Items\>\<Item\>\<NullahNumber\>\</NullahNumber\>\<ApplyNo\>\</ApplyNo\>\<BillName\>\</BillName\>\<ApplyTime\>\</ApplyTime\>\<DeptCode\>\</DeptCode\>\<DeptName\>\</DeptName\>\<DoctorName\>\</DoctorName\>\<Amount\>\</Amount\>\<InsurClass\>\</InsurClass\>\<InsurBillNo\>\</InsurBillNo\>\<RateType\>\</RateType\>\<PayState\>\</PayState\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| CardNum | String | 就诊卡号 | Y | |
| TotalAmount | Decimal | 总金额 | Y | |
| Items | | 项目集 | | |
| Item | | 项目列表 | | |
| NullahNumber | String | 挂号号 | Y | |
| ApplyNo | String | 单据号 | Y | |
| BillName | String | 单据类型 | Y | |
| DeptCode | String | 科室代码 | Y | |
| DeptName | String | 科室名称 | Y | |
| DoctorName | String | 医生名称 | Y | |
| Amount | Decimal | 处方金额 | Y | |
| ApplyTime | String | 开单时间(格式: yyyymmddhhmmss) | Y | |
| InsurClass | String | 医保类型（00普通、01生育、02特检、03大病等） | Y | |
| InsurBillNo | String | 医保门诊流水号 | Y | |
| RateType | String | 费别（S自费） | Y | |

### 【3002】门诊待缴费或已缴费明细查询

门诊待缴费明细查询。

| 接口代码 | 3002 |
| --- | --- |
| 接口描述 | 门诊待缴费或已缴费明细查询（PayState传0表示查待缴费、传1表示查已缴费） |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<ApplyNoSet\>\</ApplyNoSet\>\<PayState\>\</PayState\>\<PatientID\>\</PatientID\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3002) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| ApplyNoSet | String | 单据号集合(单据号用英文逗号间隔) | Y | |
| PayState | String | 缴费状态 | Y | 传0表示查待缴费、传1表示查已缴费 |
| PatientID | String | 患者ID | Y | 广州地区新增 |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<TotalAmount\>\</TotalAmount\>\<Items\>\<Item\>\<ItemName\>\</ItemName\>\<ItemType\>\</ItemType\>\<ItemUnit\>\</ItemUnit\>\<ItemPrice\>\</ItemPrice\>\<ItemSpec\>\</ItemSpec\>\<ItemQuantity\>\</ItemQuantity\>\<ItemAmount\>\</ItemAmount\>\<ApplyNo\>\</ApplyNo\>\</Item\> …\<Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| TotalAmount | Decimal | 总金额 | Y | |
| Items | | 项目集 | | |
| Item | | 项目列表 | | |
| ItemName | String | 项目名称 | Y | |
| ItemType | String | 项目类型 | Y | |
| ItemUnit | String | 项目规格 | Y | |
| ItemPrice | Decimal | 项目单价 | Y | |
| ItemSpec | String | 项目规格 | Y | |
| ItemQuantity | Decimal | 项目数量 | Y | |
| ItemAmount | Decimal | 项目金额 | Y | |
| ApplyNo | String | 单据号 | Y | |

### 【3003】门诊已结算记录查询

门诊已缴费记录查询。

| 接口代码 | 3003 |
| --- | --- |
| 接口描述 | 门诊已结算记录查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<StartDate\>\</StartDate\>\<EndDate\>\</EndDate\>\<OrderNo\>\</OrderNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3003) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y ||
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientID | String | 患者ID | Y | |
| StartDate | String | 缴费开始时间(格式yyyymmdd) | Y | |
| EndDate | String | 缴费截止时间(格式yyyymmdd) | Y | |
| OrderNo | String | 原支付订单号（没有传值，则默认根据缴费时间查询） | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<SettleNo\>\</SettleNo\>\<ReceiptNo\>\</ReceiptNo\>\<SettleDate\>\</SettleDate\>\<NullahNumber\>\</NullahNumber\>\<RateType\>\</RateType\>\<DeptCode\>\</DeptCode\>\<DeptName\>\</DeptName\>\<DoctorCode\>\</DoctorCode\>\<DoctorName\>\</DoctorName\>\<Cost\>\</Cost\>\<Charges\>\</Charges\>\<InsurFund\>\</InsurFund\>\<InsurAccount\>\</InsurAccount\>\<ReceiptItems\>\<ReceiptItem\>\<ReceiptClass\>\</ReceiptClass\>\<ReceiptName\>\</ReceiptName\>\<ReceiptCost\>\</ReceiptCost\>\<ReceiptCharges\>\</ReceiptCharges\>\</ReceiptItem\> …\</ReceiptItems\>\</Item\> …\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集 | | |
| Item | | 项目列表 | | |
| SettleNo | String | 结算号 | Y | |
| ReceiptNo | String | 发票号 | Y | |
| SettleDate | String | 结算日期 | Y | |
| NullahNumber | String | 挂号流水号 | Y | |
| RateType | Decimal | 费别 | Y | |
| DeptCode | String | 就诊科室 | Y | |
| DeptName | String | 科室名称 | Y | |
| DoctorCode | String | 医生工号 | Y | |
| DoctorName | String | 医生姓名 | Y | |
| Cost | Decimal | 金额 | Y | |
| Charges | Decimal | 自付金额 | Y | |
| InsurFund | Decimal | 基金统筹支付 | Y | |
| InsurAccount | Decimal | 个人账户支付 | Y | |
| PrintFlag | String | 打印标志 | Y | |
| PayType | String | 支付方式 | Y | |
| Operator | String | 收费员 | Y | |
| ReceiptItems | | 发票项目集 | | |
| ReceiptItem | | 发票项目列表 | | |
| ReceiptClass | String | 发票类别 | Y | |
| ReceiptName | String | 发票类别名称 | Y | |
| ReceiptCost | Decimal | 发票类别金额 | Y | |
| ReceiptCharges | Decimal | 发票类别自付金额 | Y | |

### 【3004】门诊已结算明细查询

门诊已缴费明细查询。

| 接口代码 | 3004 |
| --- | --- |
| 接口描述 | 门诊已结算明细查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\> \<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<SettleNoSet\>\</SettleNoSet\>\<ReceiptNoSet\>\</ReceiptNoSet\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3004) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| SettleNoSet | String | 结算号集合（结算号集合为空时，发票号集合不能为空） | Y | |
| ReceiptNoSet | String | 发票号集合（发票号集合为空时，结算号集合不能为空） | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<PrintFlag\>\</PrintFlag\>\<SettleNo\>\</SettleNo\>\<ReceiptNo\>\</ReceiptNo\>\<NullahNumber\>\</NullahNumber\>\<CureDate\>\</CureDate\>\<ReceiptClass\>\</ReceiptClass\>\<ItemName\>\</ItemName\>\<ItemCode\>\</ItemCode\>\<ItemSpec\>\</ItemSpec\>\<ItemPrice\>\</ItemPrice\>\<ItemQuantity\>\</ItemQuantity\>\<ItemUnit\>\</ItemUnit\>\<ApplyNo\>\</ApplyNo\>\<ApplyDept\>\</ApplyDept\>\<ApplyDoctor\>\</ApplyDoctor\>\<Cost\>\</Cost\>\<Charges\>\</Charges\>\<Operator\>\</Operator\>\<OperationTime\>\</OperationTime\>\</Item\> …\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集 | | |
| Item | | 项目列表 | | |
| PrintFlag | String | 打印标志 | Y | |
| SettleNo | String | 结算号 | Y | |
| ReceiptNo | String | 发票号 | Y | |
| NullahNumber | String | 挂号号 | Y | |
| CureDate | date | 就诊时间 | Y | |
| ReceiptClass | String | 发票类别 | Y | |
| ItemName | String | 项目名称 | Y | |
| ItemCode | Decimal | 项目代码 | Y | |
| ItemSpec | Decimal | 项目规格 | Y | |
| ItemPrice | Decimal | 项目单价 | Y | |
| ItemQuantity | Decimal | 项目数量 | Y | |
| ItemUnit | String | 项目单位 | Y | |
| ApplyNo | String | 单据号 | Y | |
| ApplyDept | String | 开单科室 | Y | |
| ApplyDoctor | String | 开单医生 | Y | |
| Cost | Decimal | 项目金额 | Y | |
| Charges | Decimal | 自付金额 | Y | |
| Operator | String | 扣费人 | Y | |
| OperationTime | Date | 扣费时间 | Y | |


门诊预交金充值。

| 接口代码 | 3005 |
| --- | --- |
| 接口描述 | 门诊预交金充值 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<Amt\>\</Amt\>\<OrderNo\>\</OrderNo\>\<PayType\>\</PayType\>\<PosID\>\</PosID\>\<BankCardNum\>\</BankCardNum\>\<PayDate\>\</PayDate\>\<BatchNo\>\</BatchNo\>\<VouchNo\>\</VouchNo\>\<ReferNo\>\</ReferNo\>\<BankCode\>\</BankCode\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3008) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientID | String | 患者ID | Y | |
| Amt | Decimal | 充值金额 | Y | |
| OrderNo | String | 订单号 | Y | |
| PayType | String | 支付方式(参见附录支付方式表) | Y | |
| PosID | String | POS终端号(有银行交易时传入) | | |
| BankCardNum | String | 支付的银行卡号(有银行交易时传入) | | |
| PayDate | Date | 支付日期(有银行交易时传入)（yyyymmddhhmmss） | | |
| BatchNo | String | 批次号(有银行交易时传入) | | |
| VouchNo | String | 凭证号(有银行交易时传入) | | |
| ReferNo | String | 参考号(有银行交易时传入) | | |
| BankCode | String | 银行代码(参见附录银行代码表) | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>
 \<PrepayNo\>\</PrepayNo\>\<ReceiptNo\>\</ReceiptNo\>\<AccBalance\>\</AccBalance\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| PrepayNo | String | 充值流水号 | Y | |
| ReceiptNo | String | 充值收据号 | Y | |
| AccBalance | Decimal | 预交金账户余额 | Y | |

### 【3006】门诊预交金充值记录

| 接口代码 | 3006 |
| --- | --- |
| 接口描述 | 门诊预交金充值记录 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<StartDate\>\</StartDate\>\<EndDate\>\</EndDate\>\<OrderNo\>\</OrderNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3009) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientID | String | 患者ID | Y | |
| StartDate | Date | 开始日期(yyyymmdd) | Y | |
| EndDate | Date | 结束日期(yyyymmdd) | Y | |
| OrderNo | String | 原订单号 | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<PrepayNo\>\</PrepayNo\>\<ReceiptNo\>\</ReceiptNo\>\<PayType\>\</PayType\>\<Amt\>\</Amt\>\<PayDate\>\</PayDate\>\<Operator\>\</Operator\>\<SettleNo\>\</SettleNo\>\<OrderNo\>\</OrderNo\>\</Item\> …\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 充值记录集合 | Y | |
| Item | | 充值明细 | Y | |
| PrepayNo | String | 预交金流水号 | Y | |
| ReceiptNo | String | 预交金收据号 | Y | |
| PayType | String | 支付方式 | Y | |
| Amt | Decimal | 支付金额 | Y | |
| PayDate | Date | 支付时间(yyyymmddhhmmss) | Y | |
| Operator | String | 操作人 | Y | |
| SettleNo | String | 结算号 | Y | |
| OrderNo | String | 支付订单号 | Y | |

### 【3007】门诊缴费

| 接口代码 | 3007 |
| --- | --- |
| 接口描述 | 门诊缴费 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientID\>\</PatientID\>\<ApplyNoSet\>\</ApplyNoSet\>\<PayType\>\</PayType\>\<Cost\>\</Cost\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3007) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| ApplyNoSet | String | 单据号集合(单据号用英文逗号间隔) | Y | |
| Cost | Decimal | 医疗费总额 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Paytime\>\</Paytime\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Paytime | datetime | 支付时间 | Y ||

### 【3008】 医保费用上传（广州地区）

提交相关费用信息到医保。

| 接口代码 | 3008 |
| --- | --- |
| 接口描述 | 医保费用上传 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>3008\</TranCode\>\<TransactionID\>20171016145840815001\</TransactionID\>\<AuthKey\>xIctXrclVKouPjZI\</AuthKey\>\<UserID\>自助机/Z999\</UserID\>\<DeviceID\>815001\</DeviceID\>\<HospitalID\>441700-0001\</HospitalID\>\<ApplyNoSet\>1234;5678;7890\</ApplyNoSet\>\<NullahNumber\>144002\</NullahNumber\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3008) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| ApplyNoSet | String | 单据号集合(单据号用英文逗号间隔) | Y | |
| NullahNumber | String | 门诊流水号（挂号号） | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<psn\_no\>\</psn\_no\>\<mdtrt\_cert\_type\>\</mdtrt\_cert\_type\>\<mdtrt\_cert\_no\>\</mdtrt\_cert\_no\>\<med\_type\>\</med\_type\>\<medfee\_sumamt\>\</medfee\_sumamt\>\<psn\_setlway\>\</psn\_setlway\>\<mdtrt\_id\>\</mdtrt\_id\>\<chrg\_bchno\>\</chrg\_bchno\>\<acct\_used\_flag\>\</acct\_used\_flag\>\<insutype\>\</insutype\>\<mdtrt\_mode\>\</mdtrt\_mode\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| psn_no | String | 人员编号 | Y | |
| mdtrt_cert\_type | String | 就诊凭证类型 | Y | |
| mdtrt_cert\_no | String | 就诊凭证编号 | Y | |
| med_type | String | 医疗类别 | Y | |
| medfee_sumamt | String | 医疗费总额 | Y | |
| psn_setlway | String | 个人结算方式 | | |
| mdtrt_id | String | 就诊ID | Y | |
| chrg_bchno | String | 收费批次号 | | |
| acct_used\_flag | String | 个人账户使用标志 | Y | |
| insutype | String | 险种类型 | Y | |
| mdtrt_mode | String | 就诊方式 | | |

### 【3009】 医保结算确认（广州地区）

第三方医保结算成功之后调用，用于回写HIS本地数据。

| 接口代码 | 3009 |
| --- | --- |
| 接口描述 | 医保结算确认 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>3009\</TranCode\>\<TransactionID\>20171016145840815001\</TransactionID\>\<AuthKey\>xIctXrclVKouPjZI\</AuthKey\>\<UserID\>自助机/Z999\</UserID\>\<DeviceID\>815001\</DeviceID\>\<HospitalID\>441700-0001\</HospitalID\>\<ApplyNoSet\>1234,5678,7890\</ApplyNoSet\>\<NullahNumber\>144002\</NullahNumber\>\<SumMoney\>100\</SumMoney\>\<InsuranceFund\>60\</InsuranceFund\>\<InsuranceAccountCharges\>40\</InsuranceAccountCharges\>\<PayWay\>1\</PayWay\>\<WeChatTransID\>0000001\</WeChatTransID\>\<OrderNo\>000000005869\_2\</OrderNo\>\<InsurSettleResult\>2\</InsurSettleResult\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3009) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y ||
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| ApplyNoSet | String | 单据号集合(单据号用英文逗号间隔) | Y | |
| NullahNumber | String | 门诊流水号（挂号号） | Y | |
| SumMoney | String | 总金额 | Y | |
| InsuranceFund | String | 医保统筹 | Y | |
| InsuranceAccountCharges | String | 自费 | Y | |
| PayWay | String | 微信0/社保卡个账1 | Y | |
| WeChatTransID | String | 微信订单流水号 | Y | |
| OrderNo | String | 医保返回订单号 | Y | |
| InsurSettleResult | String | 医保结算结果json串 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<SettleNo\>结算号\</SettleNo\>\<InvoiceNo\>发票号\</InvoiceNo\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| SettleNo | String | 结算号 | Y | |
| InvoiceNo | String | 发票号 | Y | |

### 【3010】 医保结算取消（广州地区）

3013医保结算失败时调用，用于取消医保统筹部分。

| 接口代码 | 3010 |
| --- | --- |
| 接口描述 | 医保结算取消 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>3010\</TranCode\>\<TransactionID\>20171016145840815001\</TransactionID\>\<AuthKey\>xIctXrclVKouPjZI\</AuthKey\>\<UserID\>自助机/Z999\</UserID\>\<DeviceID\>815001\</DeviceID\>\<HospitalID\>441700-0001\</HospitalID\>\<NullahNumber\>144002\</NullahNumber\>\<FeeBatch\>2\</ FeeBatch\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3010) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| NullahNumber | String | 门诊流水号（挂号号） | Y | |
| FeeBatch | String | 医保费用批次 | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<BackTime\>2018-01-01 14:00:00\</BackTime\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| BackTime | datetime | 回退时间 | Y | |
| PlatformSettleCancelFlag | String | 平台取消结算标识（若为Y则需要调用服务，之后调用7007） | | |
| PlatformSettleCancelXml | String | 平台取消结算参数 | | |
| PlatformSettleCancelLogNo | String | 平台取消结算交易日志号 | | |
| PlatformSettleCancelFuncId | String | 平台取消结算医保交易代码 | | |

### 【3011】住院患者信息

该接口是根据卡号查询患者住院信息。

| 接口代码 | 3011 |
| --- | --- |
| 接口描述 | 根据卡号查询患者住院信息 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<InPatientNo\>\</InPatientNo\>\<StartDate\>\</StartDate\>\<EndDate\>\</EndDate\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3007) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientID | String | 患者ID | Y | |
| InPatientNo | String | 住院号 | | |
| StartDate | String | 开始时间 | |  |
| EndDate | String | 结束时间 | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<PatientID\>\</PatientID\>\<InPatientNo\>\</InPatientNo\>\<PatientName\>\</PatientName\>\<PatientSex\>\</PatientSex\>\<PatientAge\>\</PatientAge\>\<InPatientStatus\>\</InPatientStatus\>\<InPatientDate\>\</InPatientDate\>\<InPatientDept\>\</InPatientDept\>\<InPatientDays\>\</InPatientDays\>\<OutPatientDate\>\</OutPatientDate\>\<OutPatientDept\>\</OutPatientDept\>\<RateType\>\</RateType\>\<AccBalance\>\</AccBalance\>\<AccRechargeAmount\>\</AccRechargeAmount\>\<BedNo\>\</BedNo\>\<NowDoctorCode\>\</NowDoctorCode\>\<NowDoctorName\>\</NowDoctorName\>\<NowNurseCode\>\</NowNurseCode\>\<NowNurseName\>\</NowNurseName\>\<NowDiagCode\>\</NowDiagCode\>\<NowDiagName\>\</NowDiagName\>\<Cost\>\</Cost\>\<Item\> …\<Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集 | Y | |
| Item | | 项目列表 | Y | |
| PatientID | String | 患者ID号 | Y | |
| InPatientNo | String | 住院号 | Y | |
| PatientName | String | 患者姓名 | Y | |
| PatientSex | String | 性别(参见附录性别表) | Y | |
| PatientAge | Int | 年龄 | Y | |
| InPatientStatus | String | 在院/出院 | Y | |
| InPatientDate | Date | 住院日期 | Y | |
| InPatientDept | String | 在院科室 | Y | |
| InPatientDays | Int | 住院天数 | Y | |
| OutPatientDate | Date | 出院日期 | Y | |
| OutPatientDept | String | 出院科室 | Y | |
| RateType | String | 患者费别 | Y | |
| AccBalance | Decimal | 账户余额 | Y | |
| AccRechargeAmount | Decimal | 账户累计充值金额 | Y | |
| BedNo | String | 床号 | Y | |
| NowDoctorCode | String | 主管医生代码 | | |
| NowDoctorName | String | 主管医生名称 | | |
| NowNurseCode | String | 主管护士代码 | | |
| NowNurseName | String | 主管护士名称 | | |
| NowDiagCode | String | 当前诊断代码 | | |
| NowDiagName | String | 当前诊断名称 | | |
| Cost | Decimal | 本次住院总费用 | | |

### 【3012】住院预交金充值

| 接口代码 | 3012 |
| --- | --- |
| 接口描述 | 住院预交金充值 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明.| \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<InPatientNo\>\</InPatientNo\>\<Amt\>\</Amt\>\<OrderNo\>\</OrderNo\>\<PayType\>\</PayType\>\<PosID\>\</PosID\>\<BankCardNum\>\</BankCardNum\>\<PayDate\>\</PayDate\>\<BatchNo\>\</BatchNo\>\<VouchNo\>\</VouchNo\>\<ReferNo\>\</ReferNo\>\<BankCode\>\</BankCode\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3008) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientID | String | 患者ID | Y | |
| InPatientNo | String | 住院号 | Y | |
| Amt | Decimal | 充值金额 | Y | |
| OrderNo | String | 订单号 | Y | |
| PayType | String | 支付方式(参见附录支付方式表) | Y | |
| PosID | String | POS终端号(有银行交易时传入) | | |
| BankCardNum | String | 支付的银行卡号(有银行交易时传入) | | |
| PayDate | Date | 支付日期(有银行交易时传入)（yyyymmddhhmmss） | | |
| BatchNo | String | 批次号(有银行交易时传入) | | |
| VouchNo | String | 凭证号(有银行交易时传入) | | |
| ReferNo | String | 参考号(有银行交易时传入) | | |
| BankCode | String | 银行代码(参见附录银行代码表) | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\> \<PrepayNo\>\</PrepayNo\>\<ReceiptNo\>\</ReceiptNo\>\<AccBalance\>\</AccBalance\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| PrepayNo | String | 充值流水号 | Y | |
| ReceiptNo | String | 充值收据号 | Y | |
| AccBalance | Decimal | 预交金账户余额 | Y | |

### 【3013】住院预交金充值记录

| 接口代码 | 3013 |
| --- | --- |
| 接口描述 | 住院预交金充值记录 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<InPatientNo\>\</InPatientNo\>\<StartDate\>\</StartDate\>\<EndDate\>\</EndDate\>\<OrderNo\>\</OrderNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3009) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientID | String | 患者ID | Y | |
| InPatientNo | String | 住院号 | Y | |
| StartDate | Date | 开始日期(yyyymmdd) | Y | |
| EndDate | Date | 结束日期(yyyymmdd) | Y | |
| OrderNo | String | 原订单号 | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<PrepayNo\>\</PrepayNo\>\<ReceiptNo\>\</ReceiptNo\>\<PayType\>\</PayType\>\<Amt\>\</Amt\>\<PayDate\>\</PayDate\>\<Operator\>\</Operator\>\<SettleNo\>\</SettleNo\>\<OrderNo\>\</OrderNo\>\</Item\> …\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 充值记录集合 | Y | |
| Item | | 充值明细 | Y | |
| PrepayNo | String | 预交金流水号 | Y | |
| ReceiptNo | String | 预交金收据号 | Y | |
| PayType | String | 支付方式 | Y | |
| Amt | Decimal | 支付金额 | Y | |
| PayDate | Date | 支付时间(yyyymmddhhmmss) | Y | |
| Operator | String | 操作人 | Y | |
| SettleNo | String | 结算号 | Y | |
| OrderNo | String | 支付订单号 | Y | |

### 【3014】住院患者费用查询

| 接口代码 | 3014 |
| --- | --- |
| 接口描述 | 住院患者费用查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<InPatientNo\>\</InPatientNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3010) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientID | String | 患者ID | Y | |
| InPatientNo | String | 住院号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<TotalFee\>\</TotalFee\>\<PrepayMoney\>\</PrepayMoney\>\<OweFee\>\</OweFee\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| TotalFee | Decimal | 总费用 | Y | |
| PrepayMoney | Decimal | 已充值金额 | Y | |
| OweFee | Decimal | 待补缴金额 | Y | |

### 【3015】住院日清单查询

| 接口代码 | 3015 |
| --- | --- |
| 接口描述 | 住院日清单查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<InPatientNo\>\</InPatientNo\>\<StartDate\>\</StartDate\>\<EndDate\>\</EndDate\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3011) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientID | String | 患者ID | Y | |
| InPatientNo | String | 住院号 | Y | |
| StartDate | Date | 开始日期(yyyymmdd) | Y | |
| EndDate | Date | 结束日期(yyyymmdd) | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<PrintFlag\>\</PrintFlag\>\<BillItems\>\<BillItem\>\<ItemCode\>\</ItemCode\>\<ItemName\>\</ItemName\>\<ReceiptClass\>\</ReceiptClass\>\<ItemPrice\>\</ItemPrice\>\<ItemQty\>\</ItemQty\>\<ItemUnit\>\</ItemUnit\>\<Cost\>\</Cost\>\<Charges\>\</Charges\>\<ItemSpec\>\</ItemSpec\>\<ExecDeptName\>\</ExecDeptName\>\<InsurFlag\>\</InsurFlag\>\</BillItem\>...\</BillItems\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| PrintFlag | String | 打印标志 | Y | |
| BillItems | | 清单集合 | Y | |
| BillItem | | 清单明细 | Y | |
| ItemCode | String | 项目代码 | Y | |
| ItemName | String | 项目名称 | Y | |
| ReceiptClass | String | 发票类别(例如:西药、检查等) | Y | |
| ItemPrice | Decimal | 单价 | Y | |
| ItemQty | Decimal | 数量 | Y | |
| ItemUnit | String | 单位 | Y | |
| Cost | Decimal | 项目金额 | Y | |
| Charges | Decimal | 自付金额 | Y | |
| ItemSpec | String | 规格 | | |
| ExecDeptName | String | 执行科室 | | |
| InsurFlag | String | 医保标志：1：是；0：否 | | |
| OperationTime | Date | 扣费时间 | | |

### 【3016】更新缴费清单打印次数

| 接口代码 | 3016 |
| --- | --- |
| 接口描述 | 更新缴费清单打印次数 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<IoFlag\>\</IoFlag\>\<SettleNo\>\</SettleNo\>\<InPatientNo\>\</InPatientNo\>\<BillDate\>\</BillDate\>\<PrintDate\>\</PrintDate\>\<TradeNo\>\</TradeNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3012) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientID | String | 患者ID | Y | |
| IoFlag | String | 门诊/住院(0:门诊;1:住院) | Y | |
| SettleNo | String | 结算号（门诊不为空） | | |
| InPatientNo | String | 住院号（住院不为空） | | |
| BillDate | Date | 清单日期（yyyymmdd）（住院不为空，全部住院清单传入$） | | |
| PrintDate | Date | 打印时间(yyyymmddhhmiss) | Y | |
| TradeNo | String | 打印交易业务代码 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<PrintNum\>\</PrintNum\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| PrintNum | Number | 打印次数 | Y | |

### 【3017】银联缴费日志记录

| 接口代码 | 3017 |
| --- | --- |
| 接口描述 | 银联缴费日志记录 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<VisitNo\>\</VisitNo\> …\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3013) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientID | String | 患者ID | Y | |
| VisitNo | String | 住院次数（门诊传0） | Y | |
| BatchNo | String | 批次号（没有则默认传666666） | Y | |
| TradeText | String | 交易内容 | Y | |
| ReturnText | String | 响应内容 | Y | |
| TradeType | String | 交易类型/代码 | Y | |
| AuthorNo | String | 授权码 | Y | |
| BankTradeDate | String | 银行交易日期(yyyymmdd) | Y | |
| BankTradeTime | String | 银行交易时间(hhmmss) | Y | |
| BankTradeReturn | String | 交易返回结果码 | Y | |
| Money | Decimal | 交易金额 | Y | |
| PosCode | String | IP地址 | Y | |
| PosserNo | String | POS终端流水号 | Y | |
| BankReceiptNo | String | 银行票据号 | Y | |
| BankTransNo | String | 银行参考号 | Y | |
| BankCardNum | String | 银行卡号 | Y | |
| BankTerminalNo | String | 终端号 | Y | |
| AlpayWechetBillNo | String | 系统订单号（微信、支付宝用到） | Y | |
| SourceType | String | 日志来源（01：支付宝；02：微信；00：银联卡） | Y | |
| Memo | String | 备注（银行卡名称、支付宝、微信） | Y | |
| prepayflag | String | 收付方式（交押金：1 结算：2） | Y | |
| paytype | String | 支付方式（参考字典附录） | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<TradeNo\>\</TradeNo\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| Result | String | 交易结果：0：成功 -1：错误 | Y |  |
| Msg | String | 对错误/异常的详细描述信息 | Y |  |
| TradeNo | String | 银行日志交易流水号 | Y |  |

    1.
### 【3018】更新银联缴费日志记录

| 接口代码 | 3018 |
| --- | --- |
| 接口描述 | 更新银联缴费日志记录 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<TradeNo\>\</TradeNo\>\<PatientID\>\</PatientID\>\<ReceiptNo\>\</ReceiptNo\>\<PrepayFlag\>\</PrepayFlag\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3013) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| TradeNo | String | 银联交易流水号 | Y | |
| PatientID | String | 患者ID | Y | |
| ReceiptNo | String | 预交金/结算收据号 | Y | |
| PrepayFlag | String | 收付标志（交押金：1 结算：2） | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<NowTime\>\</NowTime\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| NowTime | String | 当前时间 | Y | |

### 【3019】门诊日清单查询

| 接口代码 | 3019 |
| --- | --- |
| 接口描述 | 门诊日清单查询(门诊挂号号与起止时间不能同时为空) |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientID\>\</PatientID\>\<NullahNumber\>\</NullahNumber\>\<StartDate\>\</StartDate\>\<EndDate\>\</EndDate\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为3019) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| NullahNumber | String | 门诊挂号号 | Y | |
| StartDate | Date | 开始日期(yyyymmdd) | Y | |
| EndDate | Date | 结束日期(yyyymmdd) | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<PrintFlag\>\</PrintFlag\>\<BillItems\>\<BillItem\>\<ItemCode\>\</ItemCode\>\<ItemName\>\</ItemName\>\<ItemPrice\>\</ItemPrice\>\<ItemQty\>\</ItemQty\>\<Cost\>\</Cost\>\<Charges\>\</Charges\>\<InsurItemClass\>\</InsurItemClass\>\<OperationTime\>\</OperationTime\>\</BillItem\>...\</BillItems\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| BillItems | | 清单集合 | Y | |
| BillItem | | 清单明细 | Y | |
| ItemCode | String | 项目代码 | Y | |
| ItemName | String | 项目名称 | Y | |
| ItemPrice | Decimal | 单价 | Y | |
| ItemQty | Decimal | 数量 | Y | |
| Cost | Decimal | 项目金额 | Y | |
| Charges | Decimal | 自付金额 | Y | |
| InsurItemClass | String | 医保类别:1甲类2乙类3丙类9自费 | | |
| OperationTime | Date | 扣费时间 | | |

## 4.4号源服务

### 4.4.1【4001】获取挂号科室

挂号、预约挂号时获取挂号科室。多级科室共用该接口。获取一级科室时科室编号标签传入空值，获取二级科室时科室编号标签传入上级科室编号。

| 接口代码 | 4001 |
| --- | --- |
| 接口描述 | 获取挂号科室 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4001) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<DeptCode\>\</DeptCode\>\<DeptName\>\</DeptName\>\<Description\>\</Description\>\<NextFlag\>\</NextFlag\>\<TopDeptCode\>\</TopDeptCode\>\<TopDeptName\>\</TopDeptName\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集 | | |
| Item | | 项目列表 | | |
| DeptCode | String | 科室编号 | Y | |
| DeptName | String | 科室名称 | Y | |
| Description | String | 科室简介 | | |
| NextFlag | String | 是否有下级科室 有：true 无：false | Y | |
| TopDeptCode | String | 上级科室代码（片区代码） | | |
| TopDeptName | String | 上级科室名称（片区名称） | | |

### 4.4.2【4002】获取号类

获取该科室可以挂号的号类。例如:专家号、普通号、急诊号等

| 接口代码 | 4002 |
| --- | --- |
| 接口描述 | 获取号类 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\> \<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<RegDate\>\</RegDate\>\<DeptCode\>\</DeptCode\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4002) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| RegDate | String | 挂号日期(格式yyyymmdd) | Y | |
| DeptCode | String | 科室编号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<RegTypeCode\>\</RegTypeCode\>\<RegTypeName\>\</RegTypeName\>\<Description\>\</Description\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| RegTypeCode | String | 号类编号 | Y | |
| RegTypeName | String | 号类名称 | Y | |
| Description | String | 描述 | | |

### 4.4.3【4003】获取医生排班

获取出诊医生排班信息。

| 接口代码 | 4003 |
| --- | --- |
| 接口描述 | 获取医生排班信息 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<StartDate\>\</StartDate\>\<EndDate\>\</EndDate\>\<DeptCode\>\</DeptCode\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4003) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| StartDate | String | 开始日期(格式yyyymmdd) | | |
| EndDate | String | 结束日期(格式yyyymmdd) | | |
| DeptCode | String | 科室编号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<DeptCode\>\</DeptCode\>\<DeptName\>\</DeptName\>\<DoctorCode\>\</DoctorCode\>\<DoctorName\>\</DoctorName\>\<DoctorTitle\>\</DoctorTitle\>\<WorkType\>\</WorkType\>\<RegType\>\</RegType\>\<Fee\>\</Fee\>\<RegFee\>\</RegFee\>\<CheckupFee\>\</CheckupFee\>\<OtherFee\>\</OtherFee\>\<ClinicRoom\>\</ClinicRoom\>\<AvailableNum\>\</AvailableNum\>\<LimitCount\>\</LimitCount\>\<Status\>\</Status\>\<AllowPrecontractFlag\>\</AllowPrecontractFlag\>\<WorkDate\>\</WorkDate\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| DeptCode | String | 科室编号 | Y | |
| DeptName | String | 科室名称 | Y | |
| DoctorCode | String | 医生编号 | Y | |
| DoctorName | String | 医生名称 | Y | |
| DoctorTitle | String | 医生职称(例如:医生 医师 主治医师 副主任医师 主任医师 副教授 教授) | Y | |
| WorkType | String | 班次编码 | Y | |
| RegType | String | 挂号类别 | | |
| Fee | Decimal | 挂号总费用 | Y | |
| RegFee | Decimal | 挂号费 | Y | |
| CheckupFee | Decimal | 检查费 | Y | |
| OtherFee | Decimal | 其他费用 | Y | |
| ClinicRoom | String | 对应诊室 | Y | |
| AvailableNum | Decimal | 剩余号数量 | Y | |
| LimitCount | Decimal | 限号数 | | |
| Status | String | 状态:0就诊1停诊 | | |
| AllowPrecontractFlag | String | 允许预约（Y/N） | | |
| WorkDate | | 号源日期 | | |
| Sex | String | 性别（医生性别） | | 连州地区新增 |

### 4.4.4【4004】获取医生排班时间

获取医生排班时间

| 接口代码 | 4004 |
| --- | --- |
| 接口描述 | 获取医生排班时间 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<RegDate\>\</RegDate\>\<DeptCode\>\</DeptCode\>\<DoctorCode\>\</DoctorCode\>\<WorkType\>\</WorkType\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4004) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| RegDate | String | 挂号日期(格式yyyymmdd) | Y | |
| DeptCode | String | 科室编号 | Y | |
| DoctorCode | String | 医生编号 | Y | |
| WorkType | String | 班次编号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<BeginTime\>\</BeginTime\>\<EndTime\>\</EndTime\>\<TimeCode\>\</TimeCode\>\<TimeValue\>\</TimeValue\>\<AvailableNum\>\</AvailableNum\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集 | | |
| Item | | 项目列表 | | |
| BeginTime | String | 开始时间（预约时间段模式需要） | | |
| EndTime | String | 结束时间（预约时间段模式需要） | | |
| TimeCode | String | 时间点编号 | Y | |
| TimeValue | String | 时间值 | Y | |
| AvailableNum | String | 剩余号源数 | Y | |

### 4.4.5【4005】获取挂号费用

获取挂号时真实费用。比如：免挂号费、挂号优惠、复诊等在该接口中体现。

| 接口代码 | 4005 |
| --- | --- |
| 接口描述 | 获取医生排班时间点 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientID\>\</PatientID\>\<RegDate\>\</RegDate\>\<DeptCode\>\</DeptCode\>\<RegType\>\</RegType\>\<DoctorCode\>\</DoctorCode\>\<TimeCode\>\</TimeCode\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4005) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| RegDate | String | 挂号日期(格式yyyymmdd) | Y | |
| DeptCode | String | 科室编号 | Y | |
| RegType | String | 挂号类别 | Y | |
| DoctorCode | String | 医生编号 | Y | |
| TimeCode | String | 时间点编号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Cost\>\</Cost\>\<Charges\>\</Charges\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Cost | Decimal | 总费用 | Y | |
| Charges | Decimal | 个人现金 | Y | |

### 4.4.6【4006】预约挂号确认

| 接口代码 | 4006 |
| --- | --- |
| 接口描述 | 预约挂号确认 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientID\>\</PatientID\>\<TimeCode\>\</TimeCode\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4006) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| TimeCode | String | 时间点编号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<SeqNumber\>\</SeqNumber\>\<RegDateTime\>\</RegDateTime\>\<AdmitAddress\>\</AdmitAddress\>\<OrderContent\>\</OrderContent\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| SeqNumber | String | 预约流水号 | Y | |
| RegDateTime | String | 预约时间(格式yyyymmddhhmmss) | Y | |
| AdmitAddress | String | 就诊地点 | Y | |
| OrderContent | String | 预约单内容 | | |

### 4.4.7【4007】预约支付

| 接口代码 | 4007 |
| --- | --- |
| 接口描述 | 预约支付 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientID\>\</PatientID\>\<SeqNumber\>\</SeqNumber\>\<PayType\>\</PayType\>\<Cost\>\</Cost\>\<Charges\>\</Charges\>\<OrderNo\>\</OrderNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4007) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| SeqNumber | String | 预约流水号 | Y | |
| PayType | String | 支付方式 | Y | |
| Cost | Decimal | 医疗费总额 | | |
| Charges | Decimal | 个人现金 | Y | |
| OrderNo | String | 第三方支付订单号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<ReceiptNo\>\</ReceiptNo\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| ReceiptNo | String | 收据号 | Y | |

### 4.4.8【4008】预约取号

预约取号

| 接口代码 | 4008 |
| --- | --- |
| 接口描述 | 预约取号 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientID\>\</PatientID\>\<SeqNumber\>\</SeqNumber\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4008) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| SeqNumber | String | 预约流水号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<SickSeq\>\</SickSeq\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| SickSeq | String | 病人排队号 | Y | |

### 4.4.9【4009】取消预约

| 接口代码 | 4009 |
| --- | --- |
| 接口描述 | 取消预约 |

1. **请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientID\>\</PatientID\>\<SeqNumber\>\</SeqNumber\>\<TimeCode\>\</TimeCode\>\<NullahNumber\>\</NullahNumber\>\<PayType\>\</PayType\>\<SettleNo\>\</SettleNo\>\<BackCharges\>\</BackCharges\>\<OrderNo\>\</OrderNo\>\<OrginOrderNo\>\</OrginOrderNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4009) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| SeqNumber | String | 预约流水号 | Y | |
| TimeCode | String | 时间点编号 | Y | |
| NullahNumber | String | 挂号流水号(退挂号费时不为空) | | |
| PayType | String | 支付方式(退挂号费时不为空) | | |
| BackCharges | String | 退费金额 (退挂号费时不为空) | | |
| OrderNo | String | 退费订单号(退挂号费时不为空) | | 30 |
| OrginOrderNo | String | 原订单号,预约支付接口的OrderNo(退挂号费时不为空) | | 30 |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |

### 4.4.10.【4010】患者预约情况查询

| 接口代码 | 4010 |
| --- | --- |
| 接口描述 | 患者预约情况查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<OrderDate\>\</OrderDate\>\<SeqNumber\>\</SeqNumber\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4010) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| OrderDate | Date | 日期(yyyymmdd) | Y | |
| SeqNumber | String | 预约流水号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<SeqNumber\>\</SeqNumber\>\<DeptCode\>\</DeptCode\>\<DeptName\>\</DeptName\>\<DoctorCode\>\</DoctorCode\>\<DoctorName\>\</DoctorName\>\<DoctorTitle\>\</DoctorTitle\>\<BeginTime\>\</BeginTime\>\<EndTime\>\</EndTime\>\<TimeCode\>\</TimeCode\>\<TimeValue\>\</TimeValue\>\<AdmitRange\>\</AdmitRange\>\<Status\>\</Status\>\<CostFlag\>\</CostFlag\>\<CardNum\>\</CardNum\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| SeqNumber | String | 预约流水号 | Y | |
| DeptCode | String | 科室编码 | Y | |
| DeptName | String | 科室名称 | Y | |
| DoctorCode | String | 医生编码 | Y | |
| DoctorName | String | 医生名称 | Y | |
| DoctorTitle | String | 医生职称 | Y | |
| BeginTime | String | 开始时间 | Y | |
| EndTime | String | 结束时间 | Y | |
| SessionCode | String | 班次代码 | Y | |
| SessionName | String | 班次名称 | Y | |
| TimeCode | String | 时间点编号 | Y | |
| TimeValue | String | 时间点值 | Y | |
| AdmitRange | Date | 就诊日期 | Y | |
| Status | String | 预约状态 | Y | |
| CostFlag | String | 是否扣费（1：是；0：否） | Y | |
| CardNum | String | 就诊卡号 | Y | |

### 4.4.10.【4010】患者预约情况查询（连州地区）

| 接口代码 | 4010 |
| --- | --- |
| 接口描述 | 患者预约情况查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<OrderDate\>\</OrderDate\>\<SeqNumber\>\</SeqNumber\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4010) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| StartDate | String | 开始日期(格式yyyymmdd) | | |
| EndDate | String | 结束日期(格式yyyymmdd) | | |
| SeqNumber | String | 预约流水号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<SeqNumber\>\</SeqNumber\>\<DeptCode\>\</DeptCode\>\<DeptName\>\</DeptName\>\<DoctorCode\>\</DoctorCode\>\<DoctorName\>\</DoctorName\>\<DoctorTitle\>\</DoctorTitle\>\<BeginTime\>\</BeginTime\>\<EndTime\>\</EndTime\>\<TimeCode\>\</TimeCode\>\<TimeValue\>\</TimeValue\>\<AdmitRange\>\</AdmitRange\>\<Status\>\</Status\>\<CostFlag\>\</CostFlag\>\<CardNum\>\</CardNum\>\<TodayFlag\>\</TodayFlag\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| SeqNumber | String | 预约流水号 | Y | |
| DeptCode | String | 科室编码 | Y |  |
| DeptName | String | 科室名称 | Y | |
| DoctorCode | String | 医生编码 | Y | |
| DoctorName | String | 医生名称 | Y | |
| DoctorTitle | String | 医生职称 | Y | |
| BeginTime | String | 开始时间 | Y | |
| EndTime | String | 结束时间 | Y | |
| SessionCode | String | 班次代码 | Y | |
| SessionName | String | 班次名称 | Y | |
| TimeCode | String | 时间点编号 | Y | |
| TimeValue | String | 时间点值 | Y | |
| AdmitRange | Date | 就诊日期 | Y | |
| Status | String | 预约状态 | Y | |
| CostFlag | String | 是否扣费（1：是；0：否） | Y | |
| CardNum | String | 就诊卡号 | Y | |
| OperationTime | DateTime | 操作时间 | | 连州地区新增 |
| TodayFlag | String | 当天标识（1：是；0：否） | | 连州地区新增 |

### 4.4.11.【4011】停诊医生信息查询(根据医院急诊流程而定)

| 接口代码 | 4011 |
| --- | --- |
| 接口描述 | 停诊医生信息查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<StartDate\>\</StartDate\>\<EndDate\>\</EndDate\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4011) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| StartDate | Date | 号源开始日期(yyyymmdd) | Y | |
| EndDate | Date | 号源截止日期(yyyymmdd) | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<DeptCode\>\</DeptCode\>\<DeptName\>\</DeptName\>\<DoctorCode\>\</DoctorCode\>\<DoctorName\>\</DoctorName\>\<StopReason\>\</StopReason\>\<RegDate\>\</RegDate\>\<WorkType\>\</WorkType\>\<BeginTime\>\</BeginTime\>\<EndTime\>\</EndTime\>\<StopFlag\>\</StopFlag\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| DeptCode | String | 科室编码 | Y | |
| DeptName | String | 科室名称 | Y | |
| DoctorCode | String | 医生编码 | Y | |
| DoctorName | String | 医生名称 | Y | |
| StopReason | String | 停诊原因 | Y | |
| RegDate | String | 挂号日期（yyyymmddhhmiss） | Y | |
| WorkType | String | 班次 | Y | |
| BeginTime | String | 开始时间（hh:mi） | Y | |
| EndTime | String | 结束时间（hh:mi） | Y | |
| StopFlag | String | 停诊标志（1：停诊） | Y | |

### 4.4.12.【4013】获取急诊挂号科室(根据医院急诊流程而定)

此接口获取急诊挂号科室。

| 接口代码 | 4012 |
| --- | --- |
| 接口描述 | 获取急诊挂号科室 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4001) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<DeptCode\>\</DeptCode\>\<DeptName\>\</DeptName\>\<Description\>\</Description\>\<NextFlag\>\</NextFlag\>\<TopDeptCode\>\</TopDeptCode\>\<TopDeptName\>\</TopDeptName\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| DeptCode | String | 科室编号 | Y | |
| DeptName | String | 科室名称 | Y | |
| Description | String | 科室简介 | | |
| NextFlag | String | 是否有下级科室 有：true 无：false | Y | |
| TopDeptCode | String | 上级科室代码（片区代码） | | |
| TopDeptName | String | 上级科室名称（片区名称） | | |

### 4.4.13.【4014】获取急诊医生排班(根据医院急诊流程而定)

获取出诊医生排班信息。

| 接口代码 | 4014 |
| --- | --- |
| 接口描述 | 获取医生排班信息 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<StartDate\>\</StartDate\>\<EndDate\>\</EndDate\>\<DeptCode\>\</DeptCode\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4003) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| StartDate | String | 开始日期(格式yyyymmdd) | | |
| EndDate | String | 结束日期(格式yyyymmdd) | | |
| DeptCode | String | 科室编号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<DeptCode\>\</DeptCode\>\<DeptName\>\</DeptName\>\<DoctorCode\>\</DoctorCode\>\<DoctorName\>\</DoctorName\>\<DoctorTitle\>\</DoctorTitle\>\<WorkType\>\</WorkType\>\<RegType\>\</RegType\>\<Fee\>\</Fee\>\<RegFee\>\</RegFee\>\<CheckupFee\>\</CheckupFee\>\<OtherFee\>\</OtherFee\>\<ClinicRoom\>\</ClinicRoom\>\<AvailableNum\>\</AvailableNum\>\<LimitCount\>\</LimitCount\>\<Status\>\</Status\>\<AllowPrecontractFlag\>\</AllowPrecontractFlag\>\<WorkDate\>\</WorkDate\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| DeptCode | String | 科室编号 | Y | |
| DeptName | String | 科室名称 | Y | |
| DoctorCode | String | 医生编号 | Y | |
| DoctorName | String | 医生名称 | Y | |
| WorkType | String | 班次编码 | Y | |
| RegType | String | 挂号类别 | | |
| Fee | Decimal | 挂号总费用 | Y | |
| WorkDate | | 号源日期 | | |

### 4.4.14.【4015】急诊预约确认(根据医院急诊流程而定)

| 接口代码 | 4015 |
| --- | --- |
| 接口描述 | 预约确认 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientID\>\</PatientID\>\<TimeCode\>\</TimeCode\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4006) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| TimeCode | String | 时间点编号 | Y | |
| RegDate | String | 挂号日期(格式yyyymmdd) | | |
| DeptCode | String | 急诊科室编号 | | |
| DoctorCode | String | 急诊医生信息（格式：姓名/ID） | | |
| WorkType | String | 班次编码 | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<SeqNumber\>\</SeqNumber\>\<RegDateTime\>\</RegDateTime\>\<AdmitAddress\>\</AdmitAddress\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| SeqNumber | String | 预约流水号 | Y | |
| RegDateTime | String | 预约时间(格式yyyymmddhhmmss) | Y | |
| AdmitAddress | String | 就诊地点 | Y | |
| OrderContent | String | 预约单内容 | | |

### 4.4.15.【4016】急诊预约取号(根据医院急诊流程而定)

预约取号

| 接口代码 | 4008 |
| --- | --- |
| 接口描述 | 预约取号 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientID\>\</PatientID\>\<SeqNumber\>\</SeqNumber\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为4008) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| SeqNumber | String | 急诊预约流水号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<SickSeq\>\</SickSeq\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| SickSeq | String | 病人排队号 | Y | |

## 4.5.医嘱/排队服务

### 4.5.1.【5001】门诊候诊信息查询

| 接口代码 | 5001 |
| --- | --- |
| 接口描述 | 门诊候诊信息查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientId\>\</PatientId\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为5001) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientId | String | 病人ID | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<SeqNumber\>\</SeqNumber\>\<DeptName\>\</DeptName\>\<DeptLocus\>\</DeptLocus\>\<Doctor\>\</Doctor\>\<AverageTime\>\</AverageTime\>\<SickSeq\>\</SickSeq\>\<CurrentSickSeq\>\</CurrentSickSeq\>\<VisitTime\>\</VisitTime\>\<FrontNum\>\</FrontNum\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集合 | | |
| Item | | 项目明细 | | |
| SeqNumber | String | 预约流水号 | | |
| DeptName | String | 科室名称 | | |
| DeptLocus | String | 科室位置 | | |
| Doctor | String | 就诊医生 | | |
| AverageTime | String | 看诊平均时长 | | |
| SickSeq | String | 就诊序号 | | |
| CurrentSickSeq | String | 当前就诊序号 | | |
| VisitTime | String | 预计就诊时间 | | |
| FrontNum | String | 前面人数 | | |

### 4.5.2.【5002】取药排队信息查询

| 接口代码 | 5002 |
| --- | --- |
| 接口描述 | 取药排队信息查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientId\>\</PatientId\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为5002) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientId | String | 病人ID | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<DeptName\>\</DeptName\>\<DeptLocus\>\</DeptLocus\>\<DosageSeq\>\</DosageSeq\>\<CurrentDosageSeq\>\</CurrentDosageSeq\>\<GetDosageTime\>\</GetDosageTime\>\<FrontNum\>\</FrontNum\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集合 | | |
| Item | | 项目明细 | | |
| DeptName | String | 药房名称 | | |
| DeptLocus | String | 药房位置 | | |
| DosageSeq | String | 取药序号 | | |
| CurrentDosageSeq | String | 当前取药序号 | | |
| GetDosageTime | String | 预计取药时间 | | |
| FrontNum | String | 前面人数 | | |

### 4.5.3.【5003】门诊病人就诊记录

| 接口代码 | 5003 |
| --- | --- |
| 接口描述 | 门诊病人就诊记录 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientID\>\</PatientID\>\<StartDate\>\</StartDate\>\<EndDate\>\</EndDate\>\<DeptCode\>\</DeptCode\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为5003) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientID | String | 病人ID | Y | |
| StartDate | String | 开始日期(yyyymmdd) | Y | |
| EndDate | String | 截止日期(yyyymmdd) | Y | |
| DeptCode | String | 就诊科室 | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<NullahNumber\>\</NullahNumber\>\<RegDate\>\</RegDate\>\<DeptName\>\</DeptName\>\<DoctorName\>\</DoctorName\>\<RegTypeName\>\</RegTypeName\>\<DiagName\>\</DiagName\>\<Cost\>\</Cost\>\<Charges\>\</Charges\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 就诊记录集合 | | |
| Item | | 就诊记录 | | |
| NullahNumber | String | 挂号号（门诊就诊流水号） | | |
| RegDate | Date | 挂号日期(yyyymmddhhmmss) | | |
| DeptName | String | 就诊科室 | | |
| DoctorName | String | 医生姓名 | | |
| RegTypeName | String | 挂号类别名称 | | |
| DiagName | String | 诊断名称 | | |
| Cost | Decimal | 本次就诊总费用 | | |
| Charges | Decimal | 本次就诊总自付 | | |

### 4.5.4.【5004】门诊医嘱记录查询

| 接口代码 | 5004 |
| --- | --- |
| 接口描述 | 门诊医嘱记录查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<NullahNumber\>\</NullahNumber\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为5004) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| NullahNumber | String | 挂号号（门诊就诊流水号） | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<TotalCost\>\</TotalCost\>\<TotalCharges\>\</TotalCharges\>\<Items\>\<Item\>\<ItemClass\>\</ItemClass\>\<ItemName\>\</ItemName\>\<ItemSpec\>\</ItemSpec\>\<ItemPrice\>\</ItemPrice\>\<ItemQuantity\>\</ItemQuantity\>\<Cost\>\</Cost\>\<Charges\>\</Charges\>\<Usage\>\</Usage\>\<Dosage\>\</Dosage\>\<DoseUnit\>\</DoseUnit\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| TotalCost | Decimal | 医嘱总费用 | | |
| TotalCharges | Decimal | 医嘱总自付 | | |
| Items | | 医嘱明细集合 | | |
| Item | | 医嘱明细 | | |
| ItemClass | String | 项目类别 | | |
| ItemName | String | 项目名称 | | |
| ItemSpec | String | 项目规格 | | |
| ItemPrice | Decimal | 项目单价 | | |
| ItemQuantity | Decimal | 项目数量 | | |
| Cost | Decimal | 项目费用 | | |
| Charges | Decimal | 项目自付 | | |
| Usage | String | 用药方法 | | |
| Dosage | String | 每次剂量 | | |
| DoseUnit | String | 剂量单位 | | |

### 4.5.5.【5005】门诊自助取药确认

| 接口代码 | 5005 |
| --- | --- |
| 接口描述 | 门诊自助取药确认 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<CardType\>\</CardType\>\<CardNum\>\</CardNum\>\<PatientId\>\</PatientId\>\<HosPartFlag\>\</HosPartFlag\>\<DeptCodeSet\>\</DeptCodeSet\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为5005) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| CardType | String | 卡类型(参见附录卡类型表) | Y | |
| CardNum | String | 卡号 | Y | |
| PatientId | String | 病人ID | Y | |
| HosPartFlag | String | 总院分院标志(A：总院；B：分院) | | |
| DeptCodeSet | String | 科室代码集合 | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<ApplyCount\>\</ApplyCount\>\<DeptName\>\</DeptName\>\<DeptLocus\>\</DeptLocus\>\<CounterName\>\</CounterName\>\<DosageSeq\>\</DosageSeq\>\<PrescribeNumber\>\</PrescribeNumber\>\<ErrMsg\>\</ErrMsg\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集合 | | |
| Item | | 项目明细 | | |
| ApplyCount | number | 单据张数 | Y | |
| DeptName | String | 药房名称 | Y | |
| DeptLocus | String | 药房位置 | Y | |
| CounterName | String | 窗口名称 | Y | |
| DosageSeq | String | 取药序号 | Y | |
| PrescribeNumber | String | 处方号 | Y | |
| ErrMsg | String | 错误消息提示 | | |

## 4.6.字典服务

### 4.6.1.【6001】查询物价信息明细

| 接口代码 | 6001 |
| --- | --- |
| 接口描述 | 查询物价信息明细 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<ItemClass\>\</ItemClass\>\<ItemCode\>\</ItemCode\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为6001) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| ItemClass | String | 项目大类(示例：A,B,C,…参考字典附录) | Y | |
| ItemCode | String | 物品编码 | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<ItemCode\>\</ItemCode\>\<ItemName\>\</ItemName\>\<GoodsName\>\</GoodsName\>\<ItemSpec\>\</ItemSpec\>\<Form\>\</Form\>\<ItemUnit\>\</ItemUnit\>\<ItemPrice\>\</ItemPrice\>\<Factory\>\</Factory\>\<InsurClass\>\</InsurClass\>\<BaseFlag\>\</BaseFlag\>\<CheckNo\>\</CheckNo\>\<SpellCode\>\</SpellCode\>\<WbzxCode\>\</WbzxCode\>\<ItemConnotation\>\</ItemConnotation\>\<ExceptionContent\>\</ExceptionContent\>\<Memo\>\</Memo\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 物价项目集 | | |
| Item | | 物价项目明细 | | |
| ItemCode | String | 项目编码 | | |
| ItemName | String | 项目名称 | | |
| GoodsName | String | 商品名 | | |
| ItemSpec | String | 规格 | | |
| Form | String | 剂型 | | |
| ItemUnit | String | 单位 | | |
| ItemPrice | Decimal | 价格 | | |
| Factory | String | 生产厂家 | | |
| InsurClass | String | 医保类型 | | |
| BaseFlag | String | 基药标志 | | |
| CheckNo | String | 批准文号 | | |
| SpellCode | String | 拼音码 | | |
| WbzxCode | String | 五笔码 | | |
| ItemConnotation | String | 项目内涵 | | |
| ExceptionContent | String | 除外内容 | | |
| Memo | String | 备注 | | |

### 4.6.1.【6001】查询物价信息明细（连州地区）

| 接口代码 | 6001 |
| --- | --- |
| 接口描述 | 查询物价信息明细 |
| 备注 | SpellCode或ItemCode不为空时，Size、Page输入无效，SpellCode与ItemCode为空是，Size、Page输入有效，可实现分页查所有数据。 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<SpellCode\>\</SpellCode\>\<ItemCode\>\</ItemCode\>\<Size\>\</Size\>\<Page\>\</Page\>\<PhysicFlag\>\</PhysicFlag\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为6001) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| SpellCode | String | 拼音简码 | | |
| ItemCode | String | 物品编码 | | |
| Size | String | 每页需查询的数据数量 | | 连州地区新增 |
| Page | String | 页数 | | 连州地区新增 |
| PhysicFlag | String | 是否药品标识（Y为药品/N为非药品 默认为N） | | 连州地区新增 |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<ItemCode\>\</ItemCode\>\<ItemName\>\</ItemName\>\<GoodsName\>\</GoodsName\>\<ItemSpec\>\</ItemSpec\>\<Form\>\</Form\>\<ItemUnit\>\</ItemUnit\>\<ItemPrice\>\</ItemPrice\>\<Factory\>\</Factory\>\<InsurClass\>\</InsurClass\>\<BaseFlag\>\</BaseFlag\>\<CheckNo\>\</CheckNo\>\<SpellCode\>\</SpellCode\>\<WbzxCode\>\</WbzxCode\>\<ItemConnotation\>\</ItemConnotation\>\<ExceptionContent\>\</ExceptionContent\>\<Memo\>\</Memo\>\<ItemCount\>\</ItemCount\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 物价项目集 | | |
| Item | | 物价项目明细 | | |
| ItemCode | String | 项目编码 | | |
| ItemName | String | 项目名称 | | |
| GoodsName | String | 商品名 | | |
| ItemSpec | String | 规格 | | |
| Form | String | 剂型 | | |
| ItemUnit | String | 单位 | | |
| ItemPrice | Decimal | 价格 | | |
| Factory | String | 生产厂家 | | |
| InsurClass | String | 医保类型 | | |
| BaseFlag | String | 基药标志 | | |
| CheckNo | String | 批准文号 | | |
| SpellCode | String | 拼音码 | | |
| WbzxCode | String | 五笔码 | | |
| ItemConnotation | String | 项目内涵 | | |
| ExceptionContent | String | 除外内容 | | |
| Memo | String | 备注 | | |
| ItemCount | String | 项目总数量 | | |

### 4.6.2.【6002】获取科室介绍明细

| 接口代码 | 6002 |
| --- | --- |
| 接口描述 | 获取科室介绍明细 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<DeptCode\>\</DeptCode\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为6002) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| DeptCode | String | 科室编码 | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<DeptCode\>\</DeptCode\>\<DeptName\>\</DeptName\>\<Description\>\</Description\>\</Item\>...\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 科室明细集 | | |
| Item | | 科室明细 | | |
| DeptCode | String | 科室编码 | | |
| DeptName | String | 科室名称 | | |
| Description | String | 科室简介 | | |

### 4.6.3.【6003】获取医生介绍明细

| 接口代码 | 6003 |
| --- | --- |
| 接口描述 | 查询物价费用明细 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<DoctorName\>\</DoctorName\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为6003) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| DoctorName | String | 医生名称（示例:李思/001） | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<DeptCode\>科室编码\</DeptCode\>\<DeptName\>科室名称\</DeptName\>\<DoctorCode\>医生编码\</DoctorCode\>\<DoctorName\>医生名称\</DoctorName\>\<DoctorTitle\>医生职称\</DoctorTitle\>\<Description\>医生简介\</Description\>\</Item\>...\</ Item \>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 医生明细集 | | |
| Item | | 医生明细 | | |
| DeptCode | String | 科室编码 | Y | |
| DeptName | String | 科室名称 | Y | |
| DoctorCode | String | 医生编码 | Y | |
| DoctorName | String | 医生名称 | Y | |
| DoctorTitle | String | 医生职称 | Y | |
| ServiceName | String | 专业名称 | Y | |
| SessionDescription | String | 出诊安排描述 | Y | |
| Description | String | 医生简介 | Y | |

### 4.6.4.【6004】查询药品信息

| 接口代码 | 6004 |
| --- | --- |
| 接口描述 | 根据药品拼音简码查询药品信息，支持模糊查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<SpellCode\>PTT\</SpellCode\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为6004) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| SpellCode | String | 拼音简码 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<DrugItems\>\<DrugItem\>\<DrugCode\>0001\</DrugCode\>\<DrugName\>氨基葡萄糖胶囊\</DrugName\>\<Spec\>240mg\</Spec\>\<Unit\>盒\</Unit\>\<Price\>26.47\</Price\>\</DrugItem\> ……\</DrugItems\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| DrugItems | | 药品明细集 | | |
| DrugItem | | 药品明细 | | |
| DrugCode | String | 药品代码 | Y | |
| DrugName | String | 药品名称 | Y | |
| Spec | String | 规格 | Y | |
| Unit | String | 单位 | Y | |
| Price | Decimal | 单价 | Y | |

### 4.6.5.【6005】查询非药品信息

| 接口代码 | 6005 |
| --- | --- |
| 接口描述 | 根据拼音简码查询耗材、器械、费用等信息，支持模糊查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\> \<HospitalID\>\</HospitalID\>\<SpellCode\> \</SpellCode\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为6005) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| SpellCode | String | 拼音简码 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<ItemCode\>\</ItemCode\>\<ItemName\>\</ItemName\>\<Unit\>\</Unit\>\<Price\>\</Price\>\</Item\> ……\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目明细集 | | |
| Item | | 项目明细 | | |
| ItemCode | String | 项目编号 | Y | |
| ItemName | String | 项目名称 | Y | |
| Unit | String | 单位 | Y | |
| Price | Decimal | 单价 | Y | |

### 4.6.6.【6006】获取基本字典信息

| 接口代码 | 6006 |
| --- | --- |
| 接口描述 | 获取基本字典信息 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\> \<HospitalID\>\</HospitalID\>\<DictLevel\>\</DictLevel\>\<DictName\>\<DictName\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为6006) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| DictLevel | String | 字典等级（0:返回所有大类字典数据;1:返回特定字典数据） | Y | |
| DictName | String | 字典名称（字典等级为0时，此节点不用传值） | | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<Code\>\</Code\>\<Name\>\</Name\>\<Valid\>\</Valid\>\</Item\> …\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集 | Y | |
| Item | | 项目列表 | Y | |
| Code | String | 代码 | Y | |
| Name | String | 名称 | Y | |
| Valid | String | 是否有效 | Y | |

## 4.7.报告查询服务

### 4.7.1.【7001】检查报告列表查询

| 接口代码 | 7001 |
| --- | --- |
| 接口描述 | 检查报告列表查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientID\>\</PatientID\>\<VisitType\>\</VisitType\>\<StartDate\>\</StartDate\>\<EndDate\>\</EndDate\>\<ExamBillNo\>\</ExamBillNo\>\<PrintFlag\>\</PrintFlag\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为7001) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| VisitType | String | 就诊类型（1门诊2急诊3住院4体检，为空查时间段内该病人所有数据） | | |
| StartDate | Date | 开始日期(yyyymmdd) | Y | |
| EndDate | Date | 结束日期(yyyymmdd) | Y | |
| ExamBillNo | String | 检查单号 | | |
| PrintFlag | String | 打印标志 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<ReportId\>\</ReportId\>\<ExamBillNo\>\</ExamBillNo\>\<ApplyNo\>\</ApplyNo\>\<BarcodeNo\>\</BarcodeNo\>\<ExamCustomNo\>\</ExamCustomNo\>\<PatientId\>\</PatientId\>\<Sex\>\</Sex\>\<PatientName\>\</PatientName\>\<Age\>\</Age\>\<InPatientNo\>\</InPatientNo\>\<VisitType\>\</VisitType\>\<VisitDept\>\</VisitDept\>\<ResiCaseNo\>\</ResiCaseNo\>\<BedNo\>\</BedNo\>\<PrescribeNo\>\</PrescribeNo\>\<Priority\>\</Priority\>\<ItemName\>\</ItemName\>\<DiagnoseName\>\</DiagnoseName\>\<ReportStatus\>\</ReportStatus\>\<ApplyTime\>\</ApplyTime\>\<ApplyDept\>\</ApplyDept\>\<ApplyOperator\>\</ApplyOperator\>\<RegisterTime\>\</RegisterTime\>\<RegisterOperator\>\</RegisterOperator\>\<ExamTime\>\</ExamTime\>\<ExamDept\>\</ExamDept\>\<ExamOperator\>\</ExamOperator\>\<ReportTime\>\</ReportTime\>\<ReportOperator\>\</ReportOperator\>\<AuditTime\>\</AuditTime\>\<AuditOperator\>\</AuditOperator\>\<Remark\>\</Remark\>\</Item\> …\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成,功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集 | Y | |
| Item | | 项目列表 | Y | |
| ReportId | String | 报告Id | | |
| ExamBillNo | String | 检查单号 | Y | |
| ApplyNo | String | HIS单号 | Y | |
| BarcodeNo | String | 条码号 | | |
| ExamCustomNo | String | 检查自定义单号 | | |
| PatientId | String | 患者ID | Y | |
| Sex | String | 患者性别 | Y | |
| PatientName | String | 患者姓名 | Y | |
| Age | String | 年龄 | Y | |
| InPatientNo | String | 就诊号 | Y | |
| VisitType | String | 就诊类型 | Y | |
| VisitDept | String | 就诊科室 | Y | |
| ResiCaseNo | String | 住院病案号 | | |
| BedNo | String | 床号 | | |
| PrescribeNo | String | 医嘱号 | Y | |
| Priority | String | 医嘱优先级 | | |
| ItemName | String | 检查项目名称 | Y | |
| DiagnoseName | String | 诊断名称 | | |
| ReportStatus | String | 报告状态 | Y | |
| ApplyTime | Date | 申请时间(yyyymmddhhmiss) | Y | |
| ApplyDept | String | 申请科室 | Y | |
| ApplyOperator | String | 申请人 | Y | |
| RegisterTime | Date | 登记时间(yyyymmddhhmiss) | | |
| RegisterOperator | String | 登记人 | | |
| ExamTime | Date | 检查时间(yyyymmddhhmiss) | | |
| ExamDept | String | 检查科室 | | |
| ExamOperator | String | 检查操作人 | | |
| ReportTime | Date | 报告时间(yyyymmddhhmiss) | | |
| ReportOperator | String | 报告操作人 | | |
| AuditTime | Date | 审核时间(yyyymmddhhmiss) | | |
| AuditOperator | String | 审核人 | | |
| Remark | String | 备注 | | |
| ItemCode | String | 项目编码 | | 连州地区新增 |
| ApplyDeptCode | String | 申请科室编码 | | 连州地区新增 |
| ApplyDoctorCode | String | 申请医生编码 | | 连州地区新增 |
| ExecuteDeptCode | String | 执行科室编码 | | 连州地区新增 |
| ExecuteDoctorCode | String | 执行医生编码 | | 连州地区新增 |

### 4.7.2.【7002】检查报告明细查询

| 接口代码 | 7002 |
| --- | --- |
| 接口描述 | 检查报告明细查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientID\>\</PatientID\>\<VisitType\>\</VisitType\>\<ExamBillNo\>\</ExamBillNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为7002) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| VisitType | String | 就诊类型（1门诊2急诊3住院4体检） | Y | |
| ExamBillNo | String | 检查单号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<ExamPart\>\</ExamPart\>\<ExamMethod\>\</ExamMethod\>\<VisitStateDesc\>\</VisitStateDesc\>\<ExamImgDesc\>\</ExamImgDesc\>\<ExamPurpose\>\</ExamPurpose\>\<AbnormalFlag\>\</AbnormalFlag\>\</Item\> …\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集 | Y | |
| Item | | 项目列表 | Y | |
| ExamPart | String | 检查部位 | Y | |
| ExamMethod | String | 检查方法 | Y | |
| VisitStateDesc | String | 病情描述（影像结论） | Y | |
| ExamImgDesc | String | 影像所得（影像描述） | Y | |
| ExamPurpose | String | 检查目的 | | |
| AbnormalFlag | String | 异常标志 | | |
| ItemDetailName | String | 项目名称 | | 连州地区新增 |
| ItemDetailCode | String | 项目编码 | | 连州地区新增 |

### 4.7.3.【7003】检验报告列表查询

| 接口代码 | 7003 |
| --- | --- |
| 接口描述 | 检验报告列表查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientID\>\</PatientID\>\<VisitType\>\</VisitType\>\<StartDate\>\</StartDate\>\<EndDate\>\</EndDate\>\<LabBillNo\>\</LabBillNo\>\<PrintFlag\>\</PrintFlag\>\<IdCardNum\>\</IdCardNum\>
\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为7003) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| VisitType | String | 就诊类型（1门诊2急诊3住院4体检，为空查时间段内该病人所有数据） | | |
| StartDate | Date | 开始日期(yyyymmdd) | Y | |
| EndDate | Date | 结束日期(yyyymmdd) | Y | |
| LabBillNo | String | 检验单号 |  | |
| PrintFlag | String | 打印标志 | Y | |
| IdCardNum | String | 身份证号码 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<ReportId\>\</ReportId\>\<LabBillNo\>\</LabBillNo\>\<ApplyNo\>\</ApplyNo\>\<BarcodeNo\>\</BarcodeNo\>\<PatientId\>\</PatientId\>\<Sex\>\</Sex\>\<PatientName\>\</PatientName\>\<Age\>\</Age\>\<NullahNumber\>\</NullahNumber\>\<InPatientNo\>\</InPatientNo\>\<VisitType\>\</VisitType\>\<VisitDept\>\</VisitDept\>\<BedNo\>\</BedNo\>\<PrescribeNo\>\</PrescribeNo\>\<Priority\>\</Priority\>\<DiagnoseName\>\</DiagnoseName\>\<SpecimenName\>\</SpecimenName\>\<ReportStatus\>\</ReportStatus\>\<CollectPart\>\</CollectPart\>\<ApplyTime\>\</ApplyTime\>\<ApplyDept\>\</ApplyDept\>\<ApplyOperator\>\</ApplyOperator\>\<CollectTime\>\</CollectTime\>\<CollectOperator\>\</CollectOperator\>\<AcceptTime\>\</AcceptTime\>\<AcceptOperator\>\</AcceptOperator\>\<LabTime\>\</LabTime\>\<LabDept\>\</LabDept\>\<LabOperator\>\</LabOperator\>\<ReportTime\>\</ReportTime\>\<ReportOperator\>\</ReportOperator\>\<AuditTime\>\</AuditTime\>\<AuditOperator\>\</AuditOperator\>\<Remark\>\</Remark\>\</Item\> …\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集 | Y | |
| Item | | 项目列表 | Y | |
| ReportId | String | 报告Id | Y | |
| LabBillNo | String | 检验单号 | Y | |
| ApplyNo | String | HIS单号 | Y | |
| BarcodeNo | String | 条码号 | Y | |
| PatientId | String | 患者ID | Y | |
| Sex | String | 患者性别 | Y | |
| PatientName | String | 患者姓名 | Y | |
| Age | String | 年龄 | Y | |
| InPatientNo | String | 就诊号 | Y | |
| VisitType | String | 就诊类型 | Y | |
| VisitDept | String | 就诊科室 | Y | |
| BedNo | String | 床号 | | |
| PrescribeNo | String | 医嘱号 | Y | |
| Priority | String | 医嘱优先级 | | |
| DiagnoseName | String | 诊断名称 | | |
| SpecimenName | String | 标本名称 | Y | |
| ReportStatus | String | 报告状态 | Y | |
| CollectPart | String | 采集部位 | | |
| ApplyTime | Date | 申请时间(yyyymmddhhmiss) | Y | |
| ApplyDept | String | 申请科室 | Y | |
| ApplyOperator | String | 申请人 | Y | |
| CollectTime | Date | 采集时间(yyyymmddhhmiss) | | |
| CollectOperator | String | 采集人 | | |
| AcceptTime | Date | 接收时间(yyyymmddhhmiss) | | |
| AcceptOperator | String | 接收人 | | |
| LabTime | Date | 检验时间(yyyymmddhhmiss) | | |
| LabDept | String | 检验科室 | | |
| LabOperator | String | 检验人 |  | |
| ReportTime | Date | 报告时间(yyyymmddhhmiss) | | |
| ReportOperator | String | 报告操作人 | | |
| AuditTime | Date | 审核时间(yyyymmddhhmiss) | | |
| AuditOperator | String | 审核人 | | |
| Remark | String | 备注 | | |

### 4.7.4.【7004】检验报告明细查询

| 接口代码 | 7004 |
| --- | --- |
| 接口描述 | 检验报告明细查询 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<PatientID\>\</PatientID\>\<VisitType\>\</VisitType\>\<LabBillNo\>\</LabBillNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为7004) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| PatientID | String | 患者ID | Y | |
| VisitType | String | 就诊类型（1门诊2急诊3住院4体检） | Y | |
| LabBillNo | String | 检验单号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<Items\>\<Item\>\<BillSubNo\>\</BillSubNo\>\<ItemChiName\>\</ItemChiName\>\<ItemResult\>\</ItemResult\>\<ResultUnit\>\</ResultUnit\>\<ResultFlag\>\</ResultFlag\>\<ReferenceDesc\>\</ReferenceDesc\>\<Ranges\>\</Ranges\>\<LowLimit\>\</LowLimit\>\<HighLimit\>\</HighLimit\>\</Item\> …\</Items\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 -1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| Items | | 项目集 | Y | |
| Item | | 项目列表 | Y | |
| BillSubNo | String | 明细子序号 | Y | |
| ItemChiName | String | 细项中文名 | Y | |
| ItemResult | String | 结果值 | Y | |
| ResultUnit | String | 结果值单位 | Y | |
| ResultFlag | String | 结果值标志 | Y | |
| ReferenceDesc | String | 参考值描述 | | |
| Ranges | String | 参考值 | Y | |
| LowLimit | String | 参考值下限 | | |
| HighLimit | String | 参考值上限 | | |

## 4.8 医保服务(仅支持广州地区)

### 4.8.1【8001】API登录信息解析

| 接口代码 | 8001 |
| --- | --- |
| 接口描述 | API登录确认 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<TradeXml\>\</TradeXml\>\<TradeLogNo\>\</TradeLogNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为8001) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| TradeXml | String | 交易XML | Y | |
| TradeLogNo | String | 交易日志号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\</Response\> |
| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |

### 4.8.2【8002】API取人员信息解析

| 接口代码 | 8002 |
| --- | --- |
| 接口描述 | API取人员信息解析 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<TradeXml\>\</TradeXml\>\<TradeLogNo\>\</TradeLogNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为8002) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| TradeXml | String | 交易XML | Y | |
| TradeLogNo | String | 交易日志号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| Result | String | 交易结果：0：成功 1：错误 | Y |  |
| Msg | String | 对错误/异常的详细描述信息 | Y |  |

### 4.8.3【8003】API门诊登记信息解析

| 接口代码 | 8002 |
| --- | --- |
| 接口描述 | API门诊登记信息解析 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<TradeXml\>\</TradeXml\>\<TradeLogNo\>\</TradeLogNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为8003) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| TradeXml | String | 交易XML | Y | |
| TradeLogNo | String | 交易日志号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |

### 4.8.4【8004】API **门诊费用上传** 信息解析

| 接口代码 | 8004 |
| --- | --- |
| 接口描述 | API门诊费用上传信息解析 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<TradeXml\>\</TradeXml\>\<TradeLogNo\>\</TradeLogNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为7004) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| TradeXml | String | 交易XML | Y | |
| TradeLogNo | String | 交易日志号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |

### 4.8.5【8005】平台登录信息解析

| 接口代码 | 8005 |
| --- | --- |
| 接口描述 | 平台登录信息解析 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<TradeXml\>\</TradeXml\>\<TradeLogNo\>\</TradeLogNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为7005) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| TradeXml | String | 交易XML | Y | |
| TradeLogNo | String | 交易日志号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |

### 4.8.6【8006】 **平台取人员业务信息** 解析

| 接口代码 | 8006 |
| --- | --- |
| 接口描述 | 平台取人员业务信息解析 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<TradeXml\>\</TradeXml\>\<TradeLogNo\>\</TradeLogNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为7006) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| TradeXml | String | 交易XML | Y | |
| TradeLogNo | String | 交易日志号 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |

### 4.8.7【8007】 **平台预结算**** / ****结算信息** 解析

| 接口代码 | 8007 |
| --- | --- |
| 接口描述 | 平台预结算/结算信息解析 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<TradeXml\>\</TradeXml\>\<TradeLogNo\>\</TradeLogNo\>\<SettleFlag\>\</SettleFlag\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为8007) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| TradeXml | String | 交易XML | Y | |
| TradeLogNo | String | 交易日志号 | Y | |
| SettleFlag | String | 结算标识(0为预结算，1为结算) | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<SumMoney\>100\</SumMoney\>\<InsuranceFund\>60\</InsuranceFund\>\<InsuranceAccountCharges\>40\</InsuranceAccountCharges\>\<OrderNo\>000000005869\_2\<\</OrderNo\>\<FeeBatch\>2\</FeeBatch\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |
| SumMoney | String | 总金额 | Y | |
| InsuranceFund | String | 医保统筹 | Y | |
| InsuranceAccountCharges | String | 自费 | | |
| OrderNo | String | 医保返回订单号(正式结算才会有) | | |
| FeeBatch | String | 医保费用批次(正式结算才会有) | | |

### 4.8.8【8008】 **平台取消结算信息** 解析

| 接口代码 | 8008 |
| --- | --- |
| 接口描述 | 平台取消结算信息解析 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>\</TranCode\>\<TransactionID\>\</TransactionID\>\<AuthKey\>\</AuthKey\>\<UserID\>\</UserID\>\<DeviceID\>\</DeviceID\>\<HospitalID\>\</HospitalID\>\<TradeXml\>\</TradeXml\>\<TradeLogNo\>\</TradeLogNo\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为8008) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| TradeXml | String | 交易XML | Y | |
| TradeLogNo | String | 交易日志号 | Y | |
| BillList | String | 单据列表(BillNum;BillNum)即为单据编号;单据编号 注：无需单据类型 | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y | |

### 4.8.9【8009】 **医保**** / ****平台重新登录**

用于重新登录医保或者平台。

| 接口代码 | 8009 |
| --- | --- |
| 接口描述 | 医保/平台重新登录 |

**请求消息：**

| 说明 | 示例 |
| --- | --- |
| 以Request为根节点的XML串.子节点定义详见下方的说明. | \<Request\>\<TranCode\>7009\</TranCode\>\<TransactionID\>20171016145840815001\</TransactionID\>\<AuthKey\>xIctXrclVKouPjZI\</AuthKey\>\<UserID\>自助机/Z999\</UserID\>\<DeviceID\>815001\</DeviceID\>\<HospitalID\>441700-0001\</HospitalID\>\<LoginFlag\>1\</LoginFlag\>\</Request\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| TranCode | String | 业务请求代码(值为8009) | Y | 4 |
| TransactionID | String | 交易流水号(格式:yyyyMMddHHmmss+设备号) | Y | 22 |
| AuthKey | String | 系统授权码(由HIS厂家提供) | Y | 16 |
| UserID | String | 操作员号(根据医院实际情况决定) | Y | |
| DeviceID | String | 设备编号 | Y | |
| HospitalID | String | 医院编码(根据医院实际情况决定) | Y | |
| LoginFlag | String | 值域：1、2（1、医保重新 登录；2、平台重新登录） | Y | |

**应答消息** ：

| 说明 | 示例 |
| --- | --- |
| 以Response 为根节点的XML串. | \<Response Service= "" Result= ""\>\<Msg\>\</Msg\>\<ApiLoginFlag\>Y\</ApiLoginFlag\>\<APiLoginXml\>\<Program\>\<FunctionID\>0\</FunctionID\>\<parameters\>\<login\_id\>hexu\</login\_id\>\<login\_password\>hexu\</login\_password\>\</parameters\>\</Program\>\</APiLoginXml\>\<APiLoginLogNo\>1123\</APiLoginLogNo\>\<ApiLoginFuncId\>0\</ApiLoginFuncId\>\<PlatformLoginFlag\>\</PlatformLoginFlag\>\<PlatformLoginXml\>\</PlatformLoginXml\>\<PlatformLoginLogNo\>\</PlatformLoginLogNo\>\</Response\> |

| 标签名 | 数据类型 | 说明 | 必填项 | 最大长度 |
| ----- | ---- | ---- | ----- | ----- |
| Result | String | 交易结果：0：成功 1：错误 | Y | |
| Msg | String | 对错误/异常的详细描述信息 | Y ||
| ApiLoginFlag | String | API登录标识（若为Y则需要调用服务，之后调用7001） | Y | |
| APiLoginXml | String | API登录参数 | | |
| APiLoginLogNo | String | API登录交易日志号 | | |
| ApiLoginFuncId | String | API登录医保交易代码 | | |
| PlatformLoginFlag | String | 平台登录标识（若为Y则需要调用服务，之后调用7005） | Y | |
| PlatformLoginXml | String | 平台登录参数 | | |
| PlatformLoginLogNo | String | 平台登录交易日志号 | | |

## 4.9.附加接口

## 4.10.字典附录

| 字段代码 | 字段名称 | 值代码 | 值名称 |
| --- | --- | --- | --- |
| Sex | 性别 | 0 | 男 |
| 1 | 女 |
| 9 | 未知 |
| CardType | 就诊卡类型 | 1 | 院内就诊卡 |
| 2 | 社保卡 |
| CertificateType/CardTypeCode | (卡)证件类型 | JK | 电子健康码 |
| 00 | 就诊卡 |
| 01 | 居民身份证（户口簿） |
| 02 | 中国人民解放军军官证 |
| 03 | 中国人民武装警察警官证 |
| 04 | 香港特区护照/港澳居民 |
| 05 | 澳门特区护照/港澳居民 |
| 06 | 台湾居民来往大陆通行证 |
| 07 | 外国人永久居留证 |
| 08 | 外国人护照 |
| 09 | 残疾人证 |
| 10 | 军烈属证明 |
| 11 | 外国人就业证 |
| 12 | 外国专家证 |
| 13 | 外国人常驻记者证 |
| 14 | 台港澳人员就业证 |
| 15 | 回国(来华)定居专家证 |
| 90 | 社会保障卡 |
| 99 | 其他身份证件 |
| ~~CardTypeCode~~ | ~~卡(证)类型~~ | ~~1~~ | ~~就诊卡~~ |
| ~~2~~ | ~~身份证~~ |
| PayType | 支付方式 | 1 | 现金 |
| 21 | 支付宝 |
| 22 | 微信 |
| SP | 中行POS |
| JP | 建行POS |
| GP | 工行POS |
| WorkType | 班次 | 1 | 上午班 |
| 2 | 下午班 |
| 3 | 班外（急诊） |
| 4 | 全天班 |
| ItemClass | 项目大类 | A | 西药 |
| B | 中成药 |
| C01 | 中草药 |
| C02 | 中颗粒 |
| C03 | 原材料 |
| C05 | 农本颗粒 |
| D | 检验 |
| E | 检查 |
| F | 手术 |
| K | 材料 |
| I | 治疗 |
| MedicalType | 医疗类别（新医保） | 11 | 普通门诊 |
| 13 | 门诊大病 |
| 14 | 重疾特药 |
| 16 | 门诊特检 |
| 17 | 健康体检 |
| 51 | 生育门诊（产前检查） |
| 53 | 生育门诊（终止妊娠） |
| 55 | 生育门诊（计划生育） |
| 57 | 生育门诊（其它） |
| 参保险种（旧医保） | 1 | 基本医疗 |
| 2 | 生育医保 |
| 3 | 离休医疗 |
| 4 | 家属统筹医疗 |
| 5 | 工伤医疗 |
| 6 | 农民工医疗（三档） |
| 7 | 少儿医疗（二档） |
