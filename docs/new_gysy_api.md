**项目编号：**** CZ2020-1458**

# **广州医科大学附属妇女儿童医院**

# **2020**

# **年"智慧医院"信息化项目**

# **接口（**

# **ESB**

# **集成）说明手册**

| **建设单位** | **广州医科大学附属第三医院** |
| --- | --- |
| **监理单位** | **广州市汇源通信建设监理有限公司** |
| **承建单位** | **中国移动通信集团广东有限公司** |

**2021**** 年 ****9**** 月**

| **版本信息** \* A代表新增，M代表修改，D代表删除。 |
| --- |
| **版本号** | **发布日期** | **提交人** | **审阅人** | **A.M.D** | **更新位置** | **更新摘要** |
| V1.0 |
 |
 |
 | A |
 |
 |
|
 |
 |
 |
 |
 |
 |
 |
|
 |
 |
 |
 |
 |
 |
 |
|
 |
 |
 |
 |
 |
 |
 |
|
 |
 |
 |
 |
 |
 |
 |
|
 |
 |
 |
 |
 |
 |
 |
|
 |
 |
 |
 |
 |
 |
 |

**目 录**

[1](#_Toc83907896)引言 1

[1.1](#_Toc83907897)编写目的 1

[1.2](#_Toc83907898)项目名称 1

[1.3](#_Toc83907899)预期的读者 1

[1.4](#_Toc83907900)参考资料 1

[1.5](#_Toc83907901)定义、首字母缩写词和缩略语 1

[2](#_Toc83907902)接口规范 2

[2.1](#_Toc83907903)工作原理 2

[2.2](#_Toc83907904)调用说明 2

[2.2.1](#_Toc83907905)传输协议 2

[2.2.2](#_Toc83907906)接口调用地址 2

[2.2.3](#_Toc83907907)调用方法 2

[2.3](#_Toc83907908)调用ESB的消息架构 4

[2.4ESB](#_Toc83907909)返回的消息架构 5

[2.5](#_Toc83907910)消息架构的使用 7

[2.6](#_Toc83907911)异常捕捉 7

[2.7](#_Toc83907912)提供者接口返回值约定 7

[3](#_Toc83907913)接口服务 8

[3.1](#_Toc83907914)接口服务清单 8

[3.2HIS](#_Toc83907915)提供接口 10

[3.2.1](#_Toc83907916)获取HIS当前时间 HIS\_GetServerTime 10

[3.2.2](#_Toc83907917)获取HIS检验申请单信息 HIS\_GetLabApply 11

[3.2.3](#_Toc83907918)获取HIS检查申请单信息 HIS\_GetExamApply 20

[3.2.4HIS](#_Toc83907919)检验登记状态 HIS\_LISRegister 28

[3.2.5HIS](#_Toc83907920)检验登记取消状态 HIS\_LISCancelRegister 31

[3.2.6HIS](#_Toc83907921)检验出报告状态 HIS\_LISReport 33

[3.2.7HIS](#_Toc83907922)检查登记状态 HIS\_PACSRegister 35

[3.2.8HIS](#_Toc83907923)检查登记取消状态 HIS\_PACSCancelRegister 37

[3.2.9HIS](#_Toc83907924)检查出报告状态 HIS\_PACSReport 38

[~~3.2.10~~~~ HIS~~](#_Toc83907925)~~门诊患者处方撤销结算 ~~HIS\_ExeRecipecancelPay 41

[3.2.11HIS](#_Toc83907926)门诊患者处方结算 HIS\_ExeRecipePay 44

[~~3.2.12~~~~ HIS~~](#_Toc83907927)~~门诊患者处方预结算 ~~HIS\_ExeRecipePrePay 50

[3.2.13](#_Toc83907928)获取HIS门诊患者处方明细信息 HIS\_GetOutPatientRecipeDetail 55

[3.2.14](#_Toc83907929)获取HIS门诊患者处方单信息 HIS\_GetOutPatientRecipe 58

[~~3.2.15~~~~ HIS~~](#_Toc83907930)~~门诊患者自助报到 ~~HIS\_ExeCheckInRegister 62

[~~3.2.16~~](#_Toc83907931) ~~获取~~ HIS门诊患者候诊队列 HIS\_GetWaitingQueue 65

[3.2.17](#_Toc83907932)获取HIS门诊患者挂号信息 HIS\_GetRegisterInfo 68

[3.2.18HIS](#_Toc83907933)门诊患者挂号 HIS\_ExeOutPatientRegister 72

[3.2.19](#_Toc83907934)获取HIS患者基本信息 HIS\_GetPatientInfo 76

[3.2.20HIS](#_Toc83907935)门诊患者挂号退号 HIS\_ExeCancelRegister 80

[3.2.21HIS](#_Toc83907936)建档服务 HIS\_CreateMedCard 82

[3.2.22HIS](#_Toc83907937)门诊患者挂号缴费 HIS\_ExepayRegister 87

[3.2.23](#_Toc83907938)获取HIS门诊科室医生排班信息 HIS\_GetScheduleInfo 89

[3.2.24](#_Toc83907939)获取HIS门诊科室列表 HIS\_GetOutDeptInfo 94

[3.2.25](#_Toc83907940)住院费用查询 HIS\_GetInpatientFeeInfo 96

[3.2.26](#_Toc83907941)住院一日费用清单 HIS\_GetDayReportInfo 98

[3.2.27](#_Toc83907942)住院押金补缴 HIS\_PayDeposit 100

[3.2.28HIS](#_Toc83907943)危急值通知 HIS\_CVPNotice 101

[3.2.29HIS](#_Toc83907944)危急值电话通知 HIS\_CVPTelNotice 104

[3.2.30HIS](#_Toc83907945)危急值答复 ~~通知~~ 查询 HIS\_CVPReplyNotice 106

[3.2.31HIS](#_Toc83907946)危急值取消通知 HIS\_CVPCancelNotice 108

[3.2.32HIS](#_Toc83907947)查询住院号 HIS\_QueryInPatient 109

[3.3EMR](#_Toc83907948)提供接口 111

[3.3.1](#_Toc83907949)获取患者诊断信息 EMR\_Diagnosis 111

[3.3.2](#_Toc83907950)获取EMR文书内容信息接口 EMR\_GetAllFile 115

[3.3.3](#_Toc83907951)获取患者病案首页信息 EMR\_GetFirstPage 122

[3.3.4](#_Toc83907952)获取患者手术信息 EMR\_GetOperation 131

[3.4LIS](#_Toc83907953)提供接口 136

[3.4.1](#_Toc83907954)获取检验列表 LIS\_GetPatientList 136

[3.4.2](#_Toc83907955)获取常规结果 LIS\_GetRoutineResult 142

[3.4.3](#_Toc83907956)获取条码信息 LIS\_GetBarcodeInfo 145

[3.4.4](#_Toc83907957)状态回写 LIS\_OperationRecord 149

[3.4.5](#_Toc83907958)获取PDF报告 LIS\_GetPatientReport 150

[3.4.6](#_Toc83907959)危急值处理 LIS\_OperationUrgentRecord 152

[3.4.7](#_Toc83907960)获取微生物结果 LIS\_GetMicroResult 154

[3.5PACS](#_Toc83907961)提供接口 157

[3.5.1](#_Toc83907962)检查报告列表 PACS\_getReportList 157

[3.5.2](#_Toc83907963)获取PDF报告 PACS\_getpdfreport 161

[3.5.3](#_Toc83907964)接受危急值处理信息 PACS\_dangerous 162

[3.5.4](#_Toc83907965)检查报告明细 PACS\_getExamDetail 164

[3.5.5](#_Toc83907966)产前检查报告列表 PACS\_astraia\_getReportList 167

[3.5.6](#_Toc83907967)获取产前系统PDF报告 PACS\_astraia\_getPdfReport 171

[3.5.7](#_Toc83907968)产前检查报告明细 PACS\_astraia\_getExamDetail 172

[3.6](#_Toc83907969)体检提供接口 174

[3.6.1](#_Toc83907970)获取检验申请单 PEIS\_RepLisQuery 174

[3.6.2](#_Toc83907971)获取检查申请单信息 PEIS\_CustomerInfo 178

[3.6.3](#_Toc83907972)项目状态回写 PEIS\_UpdateItemCheckStatus 181

[3.6.4](#_Toc83907973)结果状态回写 PEIS\_UpdateItemGetReport 182

[3.6.5](#_Toc83907974)获取体检报告 PEIS\_RepBGReport 183

[3.7EMPI](#_Toc83907975)提供接口 185

[3.7.1](#_Toc83907976)查询患者服务 EMPI\_QueryPatient 185

[3.7.2](#_Toc83907977)患者注册服务 EMPI\_RegisterPatient 191

[3.8MDM](#_Toc83907978)提供接口 193

[3.8.1](#_Toc83907979)获取令牌 MDM\_Auth 193

[3.8.2](#_Toc83907980)获取元数据契约列表 MDM\_GetTableList 195

[3.8.3](#_Toc83907981)获取元数据结构详情 MDM\_GetTableSchema 200

[3.8.4](#_Toc83907982)获取元数据字段属性 MDM\_GetColSchema 206

[3.8.5](#_Toc83907983)插入数据 MDM\_InsertData 209

[3.8.6](#_Toc83907984)设置数据有效状态 MDM\_BatchSetValid 210

[3.8.7](#_Toc83907985)更新一条数据 MDM\_UpdateData 212

[3.8.8](#_Toc83907986)注销一条数据 MDM\_DeleteData 214

[3.8.9](#_Toc83907987)获取主数据列表 MDM\_GetDataPageList 215

[3.8.10](#_Toc83907988)获取映射数据契约列表 MDM\_GetMapperPageList 220

[3.8.11](#_Toc83907989)获取映射数据结构详情 MDM\_GetMapperInfo 223

[3.8.12](#_Toc83907990)获取映射数据字段属性 MDM\_GetFieldSetByMapperID 232

[3.8.13](#_Toc83907991)获取映射数据列表 MDM\_GetMapperData 235

[3.8.14](#_Toc83907992)获取已订阅的字典 MDM\_GetSubscribe 237

[3.8.15](#_Toc83907993)添加订阅字典 MDM\_AddSubscribe 239

[3.8.16](#_Toc83907994)获取已订阅字典的数据 MDM\_GetSubscribeList 241

[3.9](#_Toc83907995)妇幼保健提供接口 244

[3.9.1](#_Toc83907996)门诊电子病历（Lian\_GetOutpatientEmr） 244

# 1引言

## 1.1编写目的

本文档旨在为广州医科大学附属妇女儿童医院ESB平台中各厂商接口提供文档说明，以便各厂商根据自己角色提供或调用对应接口。

## 1.2项目名称

广州医科大学附属妇女儿童医院2020年"智慧医院"信息化采购项目

## 1.3预期的读者

本文档主要面向医院信息科工程师以及各系统厂商的开发人员、实施人员

## 1.4参考资料

《广州医科大学妇女儿童医院ESB数据交换接口规范》

## 1.5定义、首字母缩写词和缩略语

**ESB** ：Enterprise Service Bus，企业服务总线，本文档中特指广州医科大学妇女儿童医院ESB企业服务总线。

**HIS** ：Hospital Information System，医院信息管理系统，本文档中特指广州医科大学妇女儿童医院HIS医院信息管理系统。

**PACS** ：Picture Archiving and Communication Systems，影像归档和通信系统，本文档中特指广州医科大学妇女儿童医院PACS影像归档和通信系统。

**LIS** ：Laboratory Information Management System，实验室信息管理系统，本文档中特指广州医科大学妇女儿童医院LIS实验室信息管理系统。

**PEIS** ：Physical Examination Information System，体检信息管理系统，本文档中特指广州医科大学妇女儿童医院PEIS体检信息管理系统。

**EMPI** ：Enterprise Master Patient Index，患者主索引，即患者基本信息检索目录，本文档中特指广州医科大学妇女儿童医院EMPI患者主索引管理系统。

**MDM** ：Master Data Management，主数据管理，本文档中特指广州医科大学妇女儿童医院MDM主数据管理系统。

**提供者** ：接口提供方，即服务提供系统，实现Web Service服务供其他业务系统调用。

**消费者** ：接口调用方，即服务消费系统，调用提供者提供的Web Service服务，实现对应业务功能。

# 2接口规范

## 2.1工作原理

提供者各自搭建Web Service服务，接入ESB，通过 ESB转发，统一管理。

消费者通过ESB调用Web Service服务。

## 2.2调用说明

### 2.2.1传输协议

请使用SOAP v1.2协议进行Web Service调用。

### 2.2.2接口调用地址

| **方法** | **URL** | **备注** |
| --- | --- | --- |
| CallESB | 待定 | 正式 |
| CallESB | http://10.90.128.12:6002/Esbservice.asmx | 测试 |

### 2.2.3调用方法

**服务方法定义：**

| **publicstring CallESB(string xmlMessage)** |
| --- |

请注意：生产环境地址与测试环境有所不同，但是服务方法的定义（契约）不会改变。

消费者可以使用以上服务地址以及方法说明（契约）通过代理生成工具生成代理类或者通过编写代码直接调用，使用ESB服务。参数xmlMessage格式定义见[2.3](#_%E8%B0%83%E7%94%A8ESB%E7%9A%84%E6%B6%88%E6%81%AF%E6%9E%B6%E6%9E%84)调用ESB的消息架构，返回值格式定义见[2.4 ESB](#_ESB%E8%BF%94%E5%9B%9E%E7%9A%84%E6%B6%88%E6%81%AF%E6%9E%B6%E6%9E%84)返回的消息架构。

**调用报文示例：**

| **请求报文：** |
| --- |
| \<ESBEnvelope xmlns="http://ESB.TopSchemaV2"\>
 \<ESBHeader\>
 \<HeaderControl AppCode="APP\_001" Password="111111" MessageCategory=" MDM\_Auth" Version="1" CreateTime="2021/2/3 19:03:26"/\>
 \</ESBHeader\>
 \<ESBBody\>
 \<BodyControl CallType=""/\>
 \<BusinessRequest\>\<![CDATA[\<request\>\<Header\>\<Token/\>\</Header\>\<Body\>\<AppCode\>APP\_001\</AppCode\>\<TenantID\>mdm\</TenantID\>\</Body\>\</request\>]]\>\</BusinessRequest\>
 \</ESBBody\>
 \</ESBEnvelope\> |
| **接收报文：** |
| \<?xml version="1.0" encoding="utf-8"?\>
 \<request\>
 \<Header\>
 \<Token\>492FCFBEE3372E5C8595B0620E042368\</Token\>
 \<StatusCode\>Success\</StatusCode\>
 \<Message\>登录成功\</Message\>
 \</Header\>
 \<Body\>
 \<Name\>HIS\</Name\>
 \<Code\>1351730652671774720\</Code\>
 \<IsAdmin\>false\</IsAdmin\>
 \<IsSSO\>false\</IsSSO\>
 \<IsThird\>true\</IsThird\>
 \</Body\>
 \</request\> |

## 2.3调用ESB的消息架构

消费者调用ESB时，需按照以下消息架构：

| **\<ESBEnvelopexmlns="http://ESB.TopSchemaV2"\>**** \<ESBHeader\> ****\<HeaderControlAppCode="" Password=""MessageCategory="" Version="" CreateTime=""\>**** \</HeaderControl\> ****\</** ESBHeader\> **\<** ESBBody\> **\<BusinessRequest\>**** \<![CDATA[****业务请求消息****]]\> ****\</BusinessRequest\>**** \</ESBBody\> ****\</ESBEnvelope\>** |
| --- |

其中， **消息架构元素说明** 如下：

| **元素名称** | **元素说明** | **备注** |
| --- | --- | --- |
| ESBEnvelope | ESB消息架构的根节点 | 消息命名空间为 http://ESB.TopSchemaV2 |
| ESBHeader | ESB消息头 |
 |
| HeaderControl | 消息头控制 |
 |
| ESBBody | ESB消息体 |
 |
| BusinessRequest | 请求消息内容 | Xml格式的业务字符串，xml的格式需要服务调用方、提供方以及ESB平台方依据业务需求进行制定；请使用\<![CDATA[……]]\>将业务数据包裹。（如果业务数据本身使用了CDATA请注意CDATA的嵌套） |

**HeaderControl**  **（**** ESB ****消息头）各元素的属性说明** 如下：

| **属性名称** | **属性说明** | **数据类型** | **备注** |
| --- | --- | --- | --- |
| AppCode | 应用系统编码 | 字符串 | 标记服务消费系统，由信息科提供 |
| Password | 应用系统密码 | 字符串 | 由信息科提供 |
| MessageCategory | 消息类别 | 字符串 | 用户标记ESB消息的业务类型 |
| Version | 消息版本 | 整形格式的字符串 | 为允许今后对ESB业务数据结构进行更新，业务数据需要提供版本号以区分业务数据新旧版本。最小值是1，版本不同，消息架构可以不同。（暂未启用） |
| CreateTime | 消息创建时间 | 时间格式的字符串 | 2021-01-01 23:12:12或者2021/01/01 23:12:12（Date和Time之间有一个空格） |

**请注意：**** MessageCategory ****（消息类别）** 用于区分ESB消息对应的业务类型，ESB需要依据此属性来决定如何组织调用服务。这个属性是消息调用方和ESB之间的一个"契约"。在本文档中， **MessageCategory**** （消息类别）即为服务名。**

## 2.4ESB返回的消息架构

ESB返回给消费者时，按照以下消息架构：

| **\<ESBReturnxmlns="http://ESB.TopSchemaV2"\>**** \<ESBHeader Status="" Remarks=""ReturnTime=""\> ****\</** ESBHeader\> **\<** ESBBody\> **\<BusinessResponse\>**** \<![CDATA[****返回的业务数据****]]\> ****\</BusinessResponse\>**** \</ESBBody\> ****\</ ESBReturn \>** |
| --- |

其中， **消息架构元素说明** 如下：

| **元素名称** | **元素说明** | **备注** |
| --- | --- | --- |
| ESBReturn | ESB消息架构的根节点 | 消息命名空间为 http://ESB.TopSchemaV2 |
| ESBHeader | ESB消息头 |
 |
| ESBBody | ESB消息体 |
 |
| BusinessResponse | 返回消息内容 | Xml格式的业务字符串，xml的格式由服务调方、提供方以及ESB平台方依据业务需求进行制定；请使用\<![CDATA[……]]\>将业务数据包裹。（如果业务数据本身使用了CDATA请注意CDATA的嵌套） |

**ESBHeader**  **（**** ESB ****消息头）各元素的属性说明** 如下：

| **属性名称** | **属性说明** | **数据类型** | **备注** |
| --- | --- | --- | --- |
| Status | 调用状态 | 数值 | 标识本次调用是否成功-1 ： 失败0 ： 未知1 ： 成功 |
| Remarks | 备注 | 字符串 |
 |
| ReturnTime | 消息实例返回时间 | 时间格式的字符串 | 2021-01-01 23:12:12或者2021/01/01 23:12:12（Date和Time之间有一个空格） |

## 2.5消息架构的使用

消费者需要按照[2.3](#_%E8%B0%83%E7%94%A8ESB%E7%9A%84%E6%B6%88%E6%81%AF%E6%9E%B6%E6%9E%84)调用ESB的消息架构的说明使用ESB消息架构，构建消息以字符串格式发送给ESB 。其中，给提供者的业务请求数据内容需要包装成XML格式字符串，并使用\<![CDATA[……]]\>包裹，赋值给BusinessRequest节点，如果业务数据本身使用了CDATA请注意CDATA的嵌套。

消费者需要按照[2.4 ESB](#_ESB%E8%BF%94%E5%9B%9E%E7%9A%84%E6%B6%88%E6%81%AF%E6%9E%B6%E6%9E%84)返回的消息架构的说明解析ESB的返回消息报文，从 BusinessResponse 节点提取提供者返回报文。返回报文使用\<![CDATA[……]]\>包裹。

## 2.6异常捕捉

消费者接收ESB的返回消息报文后，要先根据ESBHeader 节点 Status 元素判断调用状态(-1 失败；0 未知；1 成功)，判断调用是否成功：

- 异常消息会使用Status = -1的返回消息架构，表示ESB调用对应提供者服务失败；
- 当提供者返回非标准的消息给ESB时，消费者将收到Status = 0 的返回消息，表示ESB调用对应提供者服务状态未知，并将提供者的返回内容填充在BusinessResponse节点中；
- 当提供者正常返回标准消息给ESB时，消费者将收到Status = 1 的返回消息，表示ESB调用提供者服务成功，并将提供者的返回内容填充在BusinessResponse节点中，消费者需再从BusinessResponse节点中提取提供者返回报文，从提供者返回报文中判断服务是否成功。

## 2.7提供者接口返回值约定

建议提供者接口返回值中，使用0 表示正常（成功）， -1 表示异常（失败）。

# 3接口服务

## 3.1接口服务清单

| **序号** | **提供者** | **服务** | **服务名**** （ ****MessageCategory**  **消息类别）** | **用途** |
| --- | --- | --- | --- | --- |
| 1 | HIS | 获取HIS当前时间 | [HIS\_GetServerTime](#_%E8%8E%B7%E5%8F%96HIS%E5%BD%93%E5%89%8D%E6%97%B6%E9%97%B4_HIS_GetServerTime) | 提供HIS当前时间 |
| 2 | HIS | 获取HIS检验申请单信息 | [HIS\_GetLabApply](#_%E8%8E%B7%E5%8F%96HIS%E6%A3%80%E9%AA%8C%E7%94%B3%E8%AF%B7%E5%8D%95%E4%BF%A1%E6%81%AF_HIS_GetLabApply) | 提供检验申请单信息 |
| 3 | HIS | 获取HIS检查申请单信息 | [HIS\_GetExamApply](#_%E8%8E%B7%E5%8F%96HIS%E6%A3%80%E6%9F%A5%E7%94%B3%E8%AF%B7%E5%8D%95%E4%BF%A1%E6%81%AF_HIS_GetExamApply) | 提供检查申请单信息 |
| 4 | HIS | HIS检验登记状态 | [HIS\_LISRegister](#_HIS%E6%A3%80%E9%AA%8C%E7%99%BB%E8%AE%B0%E7%8A%B6%E6%80%81_HIS_LISRegister) | 提供检验登记状态回写给HIS |
| 5 | HIS | HIS检验登记取消状态 | [HIS\_LISCancelRegister](#_HIS%E6%A3%80%E9%AA%8C%E7%99%BB%E8%AE%B0%E5%8F%96%E6%B6%88%E7%8A%B6%E6%80%81_HIS_LISCancelRegister) | 提供检验取消登记状态回写给HIS |
| 6 | HIS | HIS检验出报告状态 | [HIS\_LISReport](#_HIS%E6%A3%80%E9%AA%8C%E5%87%BA%E6%8A%A5%E5%91%8A%E7%8A%B6%E6%80%81_HIS_LISReport) | 提供检验报告通知状态回写给HIS |
| 7 | HIS | HIS检查登记状态 | [HIS\_PACSRegister](#_HIS%E6%A3%80%E6%9F%A5%E7%99%BB%E8%AE%B0%E7%8A%B6%E6%80%81_HIS_PACSRegister) | 提供检查登记状态回写给HIS |
| 8 | HIS | HIS检查登记取消状态 | [HIS\_PACSCancelRegister](#_HIS%E6%A3%80%E6%9F%A5%E7%99%BB%E8%AE%B0%E5%8F%96%E6%B6%88%E7%8A%B6%E6%80%81_HIS_PACSCancelRegister) | 提供检查取消登记状态回写给HIS |
| 9 | HIS | HIS检查出报告状态 | [HIS\_PACSReport](#_HIS%E6%A3%80%E6%9F%A5%E5%87%BA%E6%8A%A5%E5%91%8A%E7%8A%B6%E6%80%81_HIS_PACSReport) | 提供检查报告通知状态回写给HIS |
| ~~10~~ | ~~HIS~~ | ~~HIS门诊患者处方撤销结算~~ | [~~HIS\_ExeRecipecancelPay~~](#_HIS%E9%97%A8%E8%AF%8A%E6%82%A3%E8%80%85%E5%A4%84%E6%96%B9%E6%92%A4%E9%94%80%E7%BB%93%E7%AE%97_HIS_ExeRecipecancelPa_1) | ~~提供门诊处方退费信息~~ |
| 11 | HIS | HIS门诊患者处方结算 | [HIS\_ExeRecipePay](#_HIS%E9%97%A8%E8%AF%8A%E6%82%A3%E8%80%85%E5%A4%84%E6%96%B9%E7%BB%93%E7%AE%97_HIS_ExeRecipePay) | 提供门诊处方收费信息 |
| ~~12~~ | ~~HIS~~ | ~~HIS门诊患者处方预结算~~ | [~~HIS\_ExeRecipePrePay~~](#_HIS%E9%97%A8%E8%AF%8A%E6%82%A3%E8%80%85%E5%A4%84%E6%96%B9%E9%A2%84%E7%BB%93%E7%AE%97_HIS_ExeRecipePrePay) | ~~提供门诊患者处方预结算~~ |
| 13 | HIS | 获取HIS门诊患者处方明细信息 | [HIS\_GetOutPatientRecipeDetail](#_%E8%8E%B7%E5%8F%96HIS%E9%97%A8%E8%AF%8A%E6%82%A3%E8%80%85%E5%A4%84%E6%96%B9%E6%98%8E%E7%BB%86%E4%BF%A1%E6%81%AF_HIS_GetOutPatientRe) | 提供门诊处方明细信息 |
| 14 | HIS | 获取HIS门诊患者处方单信息 | [HIS\_GetOutPatientRecipe](#_%E8%8E%B7%E5%8F%96HIS%E9%97%A8%E8%AF%8A%E6%82%A3%E8%80%85%E5%A4%84%E6%96%B9%E5%8D%95%E4%BF%A1%E6%81%AF_HIS_GetOutPatientRec) | 提供门诊处方单信息 |
| ~~15~~ | ~~HIS~~ | ~~HIS门诊患者自助报到~~ | [~~HIS\_ExeCheckInRegister~~](#_HIS%E9%97%A8%E8%AF%8A%E6%82%A3%E8%80%85%E8%87%AA%E5%8A%A9%E6%8A%A5%E5%88%B0_HIS_ExeCheckInRegister) | ~~提供门诊患者自助报到信息~~ |
| ~~16~~ | ~~HIS~~ | ~~获取HIS门诊患者候诊队列~~ | [~~HIS\_GetWaitingQueue~~](#_%E8%8E%B7%E5%8F%96HIS%E9%97%A8%E8%AF%8A%E6%82%A3%E8%80%85%E5%80%99%E8%AF%8A%E9%98%9F%E5%88%97_HIS_GetWaitingQueue) | ~~提供门诊患者候诊队列信息~~ |
| 17 | HIS | 获取HIS门诊患者挂号信息 | [HIS\_GetRegisterInfo](#_%E8%8E%B7%E5%8F%96HIS%E9%97%A8%E8%AF%8A%E6%82%A3%E8%80%85%E6%8C%82%E5%8F%B7%E4%BF%A1%E6%81%AF_HIS_GetRegisterInfo) | 提供门诊患者挂号信息 |
| 18 | HIS | HIS门诊患者挂号 | [HIS\_ExeOutPatientRegister](#_HIS%E9%97%A8%E8%AF%8A%E6%82%A3%E8%80%85%E6%8C%82%E5%8F%B7_HIS_ExeOutPatientRegister) | 提供门诊患者挂号服务信息 |
| 19 | HIS | 获取HIS患者基本信息 | [HIS\_GetPatientInfo](#_%E8%8E%B7%E5%8F%96HIS%E6%82%A3%E8%80%85%E5%9F%BA%E6%9C%AC%E4%BF%A1%E6%81%AF_HIS_GetPatientInfo) | 提供患者基本信息 |
| 20 | HIS | HIS门诊患者挂号退号 | [HIS\_ExeCancelRegister](#_HIS%E9%97%A8%E8%AF%8A%E6%82%A3%E8%80%85%E6%8C%82%E5%8F%B7%E9%80%80%E5%8F%B7_HIS_ExeCancelRegister) | 提供门诊患者挂号退号服务信息 |
| 21 | HIS | HIS建档服务 | [HIS\_CreateMedCard](#_HIS%E5%BB%BA%E6%A1%A3%E6%9C%8D%E5%8A%A1_HIS_CreateMedCard) | 为新患者创建患者基本信息 |
| 22 | HIS | HIS门诊患者挂号缴费 | [HIS\_ExepayRegister](#_HIS%E9%97%A8%E8%AF%8A%E6%82%A3%E8%80%85%E6%8C%82%E5%8F%B7%E7%BC%B4%E8%B4%B9_HIS_ExepayRegister) | 提供门诊患者挂号缴费信息 |
| 23 | HIS | 获取HIS门诊科室医生排班信息 | [HIS\_GetScheduleInfo](#_%E8%8E%B7%E5%8F%96HIS%E9%97%A8%E8%AF%8A%E7%A7%91%E5%AE%A4%E5%8C%BB%E7%94%9F%E6%8E%92%E7%8F%AD%E4%BF%A1%E6%81%AF_HIS_GetScheduleInfo) | 提供门诊科室医生排班信息 |
| 24 | HIS | 获取HIS门诊科室列表 | [HIS\_GetOutDeptInfo](#_%E8%8E%B7%E5%8F%96HIS%E9%97%A8%E8%AF%8A%E7%A7%91%E5%AE%A4%E5%88%97%E8%A1%A8_HIS_GetOutDeptInfo) | 提供门诊科室列表信息 |
| 25 | HIS | 住院费用查询 | [HIS\_GetInpatientFeeInfo](#_%E4%BD%8F%E9%99%A2%E8%B4%B9%E7%94%A8%E6%9F%A5%E8%AF%A2_HIS_GetInpatientFeeInfo) | 查询患者住院费用信息 |
| 26 | HIS | 住院一日费用清单 | [HIS\_GetDayReportInfo](#_%E4%BD%8F%E9%99%A2%E4%B8%80%E6%97%A5%E8%B4%B9%E7%94%A8%E6%B8%85%E5%8D%95_HIS_GetDayReportInfo) | 查询住院患者指定日期费用明细 |
| 27 | HIS | 住院押金补缴 | [HIS\_PayDeposit](#_%E4%BD%8F%E9%99%A2%E6%8A%BC%E9%87%91%E8%A1%A5%E7%BC%B4_HIS_PayDeposit) | 查询住院患者交预交金 |
| 28 | HIS | HIS危急值通知 | [HIS\_CVPNotice](#_HIS%E5%8D%B1%E6%80%A5%E5%80%BC%E9%80%9A%E7%9F%A5_HIS_CVPNotice) | 危急值通知，危急值接口与院内其它系统的交互 |
| 29 | HIS | HIS危急值电话通知 | HIS\_[CVPTelNotice](#_HIS%E5%8D%B1%E6%80%A5%E5%80%BC%E7%94%B5%E8%AF%9D%E9%80%9A%E7%9F%A5_HIS_CVPTelNotice) | 危急值电话通知，危急值接口与院内其它系统的交互 |
| 30 | HIS | HIS危急值答复查询 | [HIS\_CVPReplyNotice](#_HIS%E5%8D%B1%E6%80%A5%E5%80%BC%E7%AD%94%E5%A4%8D%E9%80%9A%E7%9F%A5_HIS_CVPReplyNotice) | 危急值答复查询，危急值接口与院内其它系统的交互 |
| 31 | HIS | HIS危急值取消通知 | [HIS\_CVPCancelNotice](#_HIS%E5%8D%B1%E6%80%A5%E5%80%BC%E5%8F%96%E6%B6%88%E9%80%9A%E7%9F%A5_HIS_CVPCancelNotice) | 危急值取消通知，危急值接口与院内其它系统的交互 |
| 31 | HIS | HIS查询住院号 | [HIS\_QueryInPatient](#_HIS%E6%9F%A5%E8%AF%A2%E4%BD%8F%E9%99%A2%E5%8F%B7_HIS_QueryInPatient) | 查询住院号 |
| 33 | EMR | 获取患者诊断信息 | [EMR\_Diagnosis](#_%E8%8E%B7%E5%8F%96%E6%82%A3%E8%80%85%E8%AF%8A%E6%96%AD%E4%BF%A1%E6%81%AF_EMR_Diagnosis) | 提供患者诊断信息 |
| 34 | EMR | 获取EMR文书内容信息接口 | [EMR\_GetAllFile](#_%E8%8E%B7%E5%8F%96EMR%E6%96%87%E4%B9%A6%E5%86%85%E5%AE%B9%E4%BF%A1%E6%81%AF%E6%8E%A5%E5%8F%A3_EMR_GetAllFile) | 提供EMR文书内容信息 |
| 35 | EMR | 获取患者病案首页信息 | [EMR\_GetFirstPage](#_%E8%8E%B7%E5%8F%96%E6%82%A3%E8%80%85%E7%97%85%E6%A1%88%E9%A6%96%E9%A1%B5%E4%BF%A1%E6%81%AF_EMR_GetFirstPage) | 提供患者病案首页信息 |
| 36 | EMR | 获取患者手术信息 | [EMR\_GetOperation](#_%E8%8E%B7%E5%8F%96%E6%82%A3%E8%80%85%E6%89%8B%E6%9C%AF%E4%BF%A1%E6%81%AF_EMR_GetOperation) | 提供患者手术信息 |
| 37 | LIS | 获取检验列表 | [LIS\_GetPatientList](#_%E8%8E%B7%E5%8F%96%E6%A3%80%E9%AA%8C%E5%88%97%E8%A1%A8_LIS_GetPatientList) | 获取检验信息列表 |
| 38 | LIS | 获取常规结果 | [LIS\_GetRoutineResult](#_%E8%8E%B7%E5%8F%96%E5%B8%B8%E8%A7%84%E7%BB%93%E6%9E%9C_LIS_GetRoutineResult) | 获取常规检验报告结果 |
| 39 | LIS | 获取条码信息 | [LIS\_GetBarcodeInfo](#_%E8%8E%B7%E5%8F%96%E6%9D%A1%E7%A0%81%E4%BF%A1%E6%81%AF_LIS_GetBarcodeInfo) | 通过条码号获取条码信息 |
| 40 | LIS | 状态回写 | [LIS\_OperationRecord](#_%E7%8A%B6%E6%80%81%E5%9B%9E%E5%86%99_LIS_OperationRecord) | 回写条码状态 |
| 41 | LIS | 获取PDF报告 | [LIS\_GetPatientReport](#_%E8%8E%B7%E5%8F%96PDF%E6%8A%A5%E5%91%8A_LIS_GetPatientReport) | 获取检验PDF报告 |
| 42 | LIS | 危急值处理 | [LIS\_OperationUrgentRecord](#_%E5%8D%B1%E6%80%A5%E5%80%BC%E5%A4%84%E7%90%86_LIS_OperationUrgentRecord) | 危急值处理回写 |
| 43 | LIS | 获取微生物结果 | [LIS\_GetMicroResult](#_%E8%8E%B7%E5%8F%96%E5%BE%AE%E7%94%9F%E7%89%A9%E7%BB%93%E6%9E%9C_LIS_GetMicroResult) | 获取微生物结果 |
| 44 | PACS | 检查报告列表 | [PACS\_getReportList](#_%E6%A3%80%E6%9F%A5%E6%8A%A5%E5%91%8A%E5%88%97%E8%A1%A8_PACS_getReportList) | 供第三方系统获取PACS系统的患者报告列表 |
| 45 | PACS | 获取PDF报告 | [PACS\_getpdfreport](#_%E8%8E%B7%E5%8F%96PDF%E6%8A%A5%E5%91%8A_PACS_getpdfreport) | 供第三方获取PDF格式报告 |
| 46 | PACS | 接受危急值处理信息 | [PACS\_dangerous](#_%E6%8E%A5%E5%8F%97%E5%8D%B1%E6%80%A5%E5%80%BC%E5%A4%84%E7%90%86%E4%BF%A1%E6%81%AF_PACS_dangerous) | 接受危机系统返回的处理结果 |
| 47 | PACS | 检查报告明细 | [PACS\_getExamDetail](#_%E6%A3%80%E6%9F%A5%E6%8A%A5%E5%91%8A%E6%98%8E%E7%BB%86_PACS_getExamDetail) | 供第三方获取报告详细内容 |
| 48 | PACS | 产前检查报告列表 | [PACS\_astraia\_getReportList](#_%E4%BA%A7%E5%89%8D%E6%A3%80%E6%9F%A5%E6%8A%A5%E5%91%8A%E5%88%97%E8%A1%A8_PACS_astraia_getReportList) | 供第三方系统获取产前系统的患者报告列表 |
| 49 | PACS | 获取产前系统PDF报告 | [PACS\_astraia\_getPdfReport](#_%E8%8E%B7%E5%8F%96%E4%BA%A7%E5%89%8D%E7%B3%BB%E7%BB%9FPDF%E6%8A%A5%E5%91%8A_PACS_astraia_getPdfRepo) | 供第三方获取产前系统的PDF格式报告 |
| 50 | PACS | 产前检查报告明细 | [PACS\_astraia\_getExamDetail](#_%E4%BA%A7%E5%89%8D%E6%A3%80%E6%9F%A5%E6%8A%A5%E5%91%8A%E6%98%8E%E7%BB%86_PACS_astraia_getExamDetail) | 供第三方获取产前报告详细内容 |
| 51 | 体检 | 获取检验申请单 | [PEIS\_RepLisQuery](#_%E8%8E%B7%E5%8F%96%E6%A3%80%E9%AA%8C%E7%94%B3%E8%AF%B7%E5%8D%95_PEIS_RepLisQuery) | 提供检验申请单信息 |
| 52 | 体检 | 获取检查申请单信息 | [PEIS\_CustomerInfo](#_%E8%8E%B7%E5%8F%96%E6%A3%80%E6%9F%A5%E7%94%B3%E8%AF%B7%E5%8D%95%E4%BF%A1%E6%81%AF_PEIS_CustomerInfo) | 提供体检检查申请单信息 |
| 53 | 体检 | 项目状态回写 | [PEIS\_UpdateItemCheckStatus](#_%E9%A1%B9%E7%9B%AE%E7%8A%B6%E6%80%81%E5%9B%9E%E5%86%99_PEIS_UpdateItemCheckStatus) | 回写项目检查状态 |
| 54 | 体检 | 结果状态回写 | [PEIS\_UpdateItemGetReport](#_%E7%BB%93%E6%9E%9C%E7%8A%B6%E6%80%81%E5%9B%9E%E5%86%99_PEIS_UpdateItemGetReport) | 回写项目检查结果状态 |
| 55 | 体检 | 获取体检报告 | [PEIS\_RepBGReport](#_%E8%8E%B7%E5%8F%96%E4%BD%93%E6%A3%80%E6%8A%A5%E5%91%8A_PEIS_RepBGReport) | 获取体检报告 |
| 56 | EMPI | 查询患者服务 | [EMPI\_QueryPatient](#_%E6%9F%A5%E8%AF%A2%E6%82%A3%E8%80%85%E6%9C%8D%E5%8A%A1_EMPI_QueryPatient) | 查询患者基本信息、EMPI编号 |
| 57 | EMPI | 患者注册服务 | [EMPI\_RegisterPatient](#_%E6%82%A3%E8%80%85%E6%B3%A8%E5%86%8C%E6%9C%8D%E5%8A%A1_EMPI_RegisterPatient) | 向平台注册新患者，平台分配EMPI编号 |
| 58 | MDM | 获取令牌 | [MDM\_Auth](#_%E8%8E%B7%E5%8F%96%E4%BB%A4%E7%89%8C_MDM_Auth) | 获取MDM系统令牌 |
| 59 | MDM | 获取元数据契约列表 | [MDM\_GetTableList](#_%E8%8E%B7%E5%8F%96%E5%85%83%E6%95%B0%E6%8D%AE%E5%A5%91%E7%BA%A6%E5%88%97%E8%A1%A8_MDM_GetTableList) | 获取元数据契约列表（有读权限） |
| 60 | MDM | 获取元数据结构详情 | [MDM\_GetTableSchema](#_%E8%8E%B7%E5%8F%96%E5%85%83%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84%E8%AF%A6%E6%83%85_MDM_GetTableSchema) | 根据元数据唯一ID获取元数据结构详情 |
| 61 | MDM | 获取元数据字段属性 | [MDM\_GetColSchema](#_%E8%8E%B7%E5%8F%96%E5%85%83%E6%95%B0%E6%8D%AE%E5%AD%97%E6%AE%B5%E5%B1%9E%E6%80%A7_MDM_GetColSchema) | 根据元数据唯一ID获取元数据字段属性 |
| 62 | MDM | 插入数据 | [MDM\_InsertData](#_%E6%8F%92%E5%85%A5%E6%95%B0%E6%8D%AE_MDM_InsertData) | 插入数据（有写权限） |
| 63 | MDM | 设置数据有效状态 | [MDM\_BatchSetValid](#_%E8%AE%BE%E7%BD%AE%E6%95%B0%E6%8D%AE%E6%9C%89%E6%95%88%E7%8A%B6%E6%80%81_MDM_BatchSetValid) | 设置数据有效状态（有写权限） |
| 64 | MDM | 更新一条数据 | [MDM\_UpdateData](#_%E6%9B%B4%E6%96%B0%E4%B8%80%E6%9D%A1%E6%95%B0%E6%8D%AE_MDM_UpdateData) | 更新一条数据（有写权限） |
| 65 | MDM | 注销一条数据 | [MDM\_DeleteData](#_%E6%B3%A8%E9%94%80%E4%B8%80%E6%9D%A1%E6%95%B0%E6%8D%AE_MDM_DeleteData) | 注销一条数据（有写权限） |
| 66 | MDM | 获取主数据列表 | [MDM\_GetDataPageList](#_%E8%8E%B7%E5%8F%96%E4%B8%BB%E6%95%B0%E6%8D%AE%E5%88%97%E8%A1%A8_MDM_GetDataPageList) | 获取主数据列表（有读权限） |
| 67 | MDM | 获取映射数据契约列表 | [MDM\_GetMapperPageList](#_%E8%8E%B7%E5%8F%96%E6%98%A0%E5%B0%84%E6%95%B0%E6%8D%AE%E5%A5%91%E7%BA%A6%E5%88%97%E8%A1%A8_MDM_GetMapperPageList) | 获取映射数据契约列表（有读权限） |
| 68 | MDM | 获取映射数据结构详情 | [MDM\_GetMapperInfo](#_%E8%8E%B7%E5%8F%96%E6%98%A0%E5%B0%84%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84%E8%AF%A6%E6%83%85_MDM_GetMapperInfo) | 根据映射数据唯一ID获取映射数据结构详情 |
| 69 | MDM | 获取映射数据字段属性 | [MDM\_GetFieldSetByMapperID](#_%E8%8E%B7%E5%8F%96%E6%98%A0%E5%B0%84%E6%95%B0%E6%8D%AE%E5%AD%97%E6%AE%B5%E5%B1%9E%E6%80%A7_MDM_GetFieldSetByMapperI) | 根据映射数据唯一ID获取映射数据字段属性 |
| 70 | MDM | 获取映射数据列表 | [MDM\_GetMapperData](#_%E8%8E%B7%E5%8F%96%E6%98%A0%E5%B0%84%E6%95%B0%E6%8D%AE%E5%88%97%E8%A1%A8_MDM_GetMapperData) | 获取映射数据列表（有读权限） |
| 71 | MDM | 获取已订阅的字典 | [MDM\_GetSubscribe](#_%E8%8E%B7%E5%8F%96%E5%B7%B2%E8%AE%A2%E9%98%85%E7%9A%84%E5%AD%97%E5%85%B8_MDM_GetSubscribe) | 获取已订阅的字典 |
| 72 | MDM | 添加订阅字典 | [MDM\_AddSubscribe](#_%E6%B7%BB%E5%8A%A0%E8%AE%A2%E9%98%85%E5%AD%97%E5%85%B8_MDM_AddSubscribe) | 添加订阅字典 |
| 73 | MDM | 获取已订阅字典的数据 | [MDM\_GetSubscribeList](#_%E8%8E%B7%E5%8F%96%E5%B7%B2%E8%AE%A2%E9%98%85%E5%AD%97%E5%85%B8%E7%9A%84%E6%95%B0%E6%8D%AE_MDM_GetSubscribeList) | 获取已订阅字典的数据 |
| 74 | 妇幼保健 | 获取门诊电子病历信息 | [Lian\_GetOutpatientEmr](#_%E9%97%A8%E8%AF%8A%E7%94%B5%E5%AD%90%E7%97%85%E5%8E%86%EF%BC%88Lian_GetOutpatientEmr%EF%BC%89) | 根据挂号流水号和卡号，获取门诊病人现病史、主诉、既往史、过敏史、个人史、体格检查、专科检查、辅助检查等电子病历信息 |

## 3.2HIS提供接口

### 3.2.1获取HIS当前时间 HIS\_GetServerTime

#### 3.2.1.1服务名 MessageCategory （消息类别）

HIS\_GetServerTime

#### 3.2.1.2用途

提供HIS当前时间

#### 3.2.1.3业务请求消息 BusinessRequest

无

#### 3.2.1.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<ServerTime\> **2021-01-01 00:00:00.000** \</ServerTime\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | Str | 0:成功，-1：失败 |
| ResultMessage | Result | Str | 失败详细信息 |
| ServerTime | Content | Str | 服务器时间，详细到毫秒 |

#### 3.2.1.5注意事项

无

### 3.2.2获取HIS检验申请单信息 HIS\_GetLabApply

#### 3.2.2.1服务名 MessageCategory （消息类别）

HIS\_GetLabApply

#### 3.2.2.2用途

提供检验申请单信息

#### 3.2.2.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\> ~~\<ApplyId\>\</ApplyId\>~~ \<PatientId\>\</PatientId\>\<MedCardNo\>\</MedCardNo\>\<InpNo\>\</InpNo\> ~~\<MedExamNo\>\</MedExamNo\>~~ \<DeptCode\>\</DeptCode\>\<BedNo\>\</BedNo\>\<ApplyStatus\>1\</ApplyStatus\>\<ApplyDateBegin\>\</ApplyDateBegin\>\<ApplyDateEnd\>\</ApplyDateEnd\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| ~~ApplyId~~ | ~~Request~~ | ~~否~~ | ~~str~~ | ~~HIS支付订单号，通过处方支付接口获取~~ |
| PatientId | Request | ~~是~~ 否 | str | 患者ID |
| MedCardNo | Request | ~~是~~ 否 | str | 门诊卡号 |
| ~~MedExamNo~~ | ~~Request~~ | ~~否~~ | ~~str~~ | ~~体检号~~ |
| DeptCode | Request | 否 | str | 开单科室代码 |
| BedNo | Request | 否 | str | 床号 |
| ApplyStatus | Request | 否 | str | 状态,0:新开（来源：HIS、体检），1：已执行收费（来源：HIS、体检）， ~~2~~ ：已采集（来源：LIS），3：已签收（来源：LIS） 4：已检验（来源LIS），2：已打印条码（来源LIS），3：已采集（来源：LIS），4：已签收（来源：LIS）5：报告已审核（来源：LIS），6：报告已发布（正式发布可看，来源：LIS），7：报告已打印（来源：LIS），8：报告回退（重新修改发布，来源：LIS），9：申请单已退费（来源：体检、HIS），-1：申请单已回退（条码删除允许退费，来源：LIS） |
| ApplyDateBegin | Request | 否 | str | 申请时间开始 |
| ApplyDateEnd | Request | ~~是~~ 否 | str | 申请时间结束 |
| **InpNo** | Request | 是 | str | 住院患者申请单需要传 |
| **Type** | Request | 是 | str | 住院2 门诊1 |
| 注：PatientId、MedCardNo不能同时为空 |

#### 3.2.2.4返回业务数据BusinessResponse

| \<Result\> \<ResultCode\>0\</ResultCode\> \<ResultMessage\>\</ResultMessage\> \<Content\> \<PatientId\>002003\</PatientId\> \<MedCardNo\>44010000\</MedCardNo\> \<InpNo\>333255\</InpNo\> \<PatientName\>张三\</PatientName\> \<Sex\>男\</Sex\> \<BirthDate\>2018-02-01\</BirthDate\> \<Age\>4岁3月\</Age\> \<PatAddr\>广东省广州市荔湾区XXX路XX号\</PatAddr\> \<PatTel\>13333333333\</PatTel\> \<InsuranceNo\>\</InsuranceNo \> \<CardType\>01\</CardType\> \<CardTypeName\>居民身份证\</CardTypeName\> \<CardNo\>44010000201802010310\</CardNo\> \<Nationality\>中国\<Nationality\> \<PatientIdentity\>1\</PatientIdentity\> \<PatAbroad\>0\</PatAbroad\> \<Setlement\>自费\</Setlement\> \<Origin\>7\</Origin\> \<HouseholdRegister\>广东省广州市\</HouseholdRegister\> \<EmpId\>\</EmpId\> \<LabApplys\> \<LabApply\> \<BranchId\>01\</BranchId\> \<ApplyId\>0011001\</ApplyId\> \<Source\>1\</Source\> \<SourceName\>住院\</SourceName\> \<ClinicId\>\</ClinicId\> \<AdmissTimes\>1\</AdmissTimes\> \<VisitNumber\>101110234\</VisitNumber\> \<DiagCode\>I11.001\</DiagCode\> \<DiagName\>高血压\</DiagName\> \<DeptCode\>0003320\</DeptCode\> \<DeptName\>儿科\</DeptName\> \<WardCode\>0003321\</WardCode\> \<WardName\>儿科病区\</WardName\> \<DoctCode\>0003322\</DoctCode\> \<DoctName\>张医生\</DeptName\> \<ApplyDate\>2021-03-01 00:00:00\</ApplyDate\> \<BedNo\>01\</BedNo\> \<ApplyStatus\>1\</ApplyStatus\> \<DeleteFlag\>0\</DeleteFlag\> \<UrgenFlag\>0\</UrgenFlag\> \<SpecimenId\> **0001** \</SpecimenId\> \<SpecimenCode\> **F030220** \</SpecimenCode\> \<SpecimenName\> **全血** \</SpecimenName\> \<Annotation\>检验注意事项\</Annotation\> \<ApplyItems\> \<ApplyItem\> \<OrderId\>100002210100\</OrderId\> \<ItemCode\>55230\</ItemCode\> \<ItemName\>P-ANCA\</ItemName\> \<MethodCode\>\</MethodCode\> \<MethodName\>\</MethodName\> \<ExecTime\>2021-03-01 00:00:00\</ExecTime\> \<ExecDeptCode\>000333\</ExecDeptCode\> \<ExecDeptName\>检验科\</ExecDeptName\> \<Price\>30.00\</Price\> \</ApplyItem\> \</ApplyItems\> \</LabApply\> \</LabApplys\> \</Content\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
 |
| --- | --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
 |
| ResultMessage | Result | str | 失败详细信息 |
 |
| Content | Result | 节点 | 实例节点 |
 |
| PatientId | Content | str | 患者ID |
 |
| MedCardNo | Content | str | 门诊卡号 |
 |
| InpNo | Content | str | 住院号 |
 |
| PatientName | Content | str | 姓名 |
 |
| Sex | Content | str | 性别 |
 |
| BirthDate | Content | str | 出生日期 |
 |
| Age | Content | str | 年龄 |
 |
| PatAddr | Content | str | 联系地址 |
 |
| PatTel | Content | str | 联系电话 |
 |
| InsuranceNo | Content | str | 医保卡号，五级要求 |
 |
| CardType | Content | str | 证件类型，01:居民身份证（户口簿），02:中国人民解放军军官证，03:中国人民武装警察警官证，04:香港特区护照/港澳居民来往内地通行证，05:港澳台居民居住证，06:台湾居民来往大陆通行证，07:外国人永久居留证，08:外国人护照，09:残疾人证，10:军烈属证明，11:外国人就业证，12:外国专家证，13:外国人常驻记者证，14:台港澳人员就业证，15:回国（来华）定居专家证，90:社会保障卡，99:其他身份证件（注意：部分证件类型已经不允许用，但字典项保留） |
 |
| CardTypeName | Content | str | 居民身份证（户口簿） |
 |
| CardNo | Content | str | 证件号码 |
 |
| Nationality | Content | str | 国籍 |
 |
| PatientIdentity | Content | str | 当前新冠肺炎疫情所需字段，1.出入境通关人员、2.国内出行人员、3.上岗就业人员、4.返校复课师生、5.医疗机构工作人员、6.口岸检疫和边防检查人员、7.监所工作人员、8.社会福利养老机构工作人员、9.孕产妇、10.新生儿、11.母婴服务类机构人员、12.农贸市场海水产品从业人员、13.农贸市场禽畜肉类从业人员、14.农贸市场进口食品类从业人员、15.农贸市场其他人员、16.农贸市场专项排查其他从业人员、17.屠宰场/各类冷库从业人员、18.农贸市场中地下或通风不良场所从业人员、99.其它人群 |
 |
| PatAbroad | Content | str | 是否14天内境外入境人员1.是 2.否 |
 |
| Setlement | Content | str | 自费/记账/居民医疗保险等 |
 |
| Origin | Content | str | 1.集中留观、2.密切接触者、3.交通检疫、4.社区排查、5.发热门诊、6.其他门（急）诊、7.住院患者、8.住院患者陪护人员、9.农贸市场专项排查、99.其它采样点 |
 |
| HouseholdRegister | Content | str | 户籍地 |
 |
| EmpId | Content | str | 患者主索引 |
 |
| LabApplys | Content | 节点 | 1..1，申请单集合 |
 |
| LabApply | LabApplys | 节点 | 1..\*，重复节点，一个节点为一个申请单明细信息 |
 |
| BranchId | LabApply | str | 院区ID |
 |
| ApplyId | LabApply | str | 申请单号 |
 |
| Source | LabApply | str | 来源ID，0门诊；1住院;2体检 |
 |
| SourceName | LabApply | str | 来源名称，门诊；住院;体检 |
 |
| ClinicId | LabApply | str | 门诊流水号 |
 |
| AdmissTimes | LabApply | str | 住院次数 |
 |
| VisitNumber | LabApply | str | 住院流水号，唯一ID，适配修改住院号 |
 |
| DiagCode | LabApply | str | 主要诊断代码 |
 |
| DiagName | LabApply | str | 主要诊断名称 |
 |
| DeptCode | LabApply | str | 开单科室代码 |
 |
| DeptName | LabApply | str | 开单科室名称 |
 |
| WardCode | LabApply | str | 开单病区代码 |
 |
| WardName | LabApply | str | 开单病区名称 |
 |
| DoctCode | LabApply | str | 开单医生代码 |
 |
| DoctName | LabApply | str | 开单医生名称 |
 |
| ApplyDate | LabApply | str | 申请时间 |
 |
| BedNo | LabApply | str | 床号 |
 |
| ApplyStatus | LabApply | str | 状态，0：新开 1：已执行收费，2：已登记，3：已确认，4：报告已发布，5：报告已打印，9：已退费 |
 |
| DeleteFlag | LabApply | str | 删除标志，0：未删除，1：已删除 |
 |
| UrgenFlag | LabApply | str | 加急标志：0：常规 1：加急 |
 |
| SpecimenId | LabApply | str | 标本ID |
| --- | --- | --- | --- |
| SpecimenCode | LabApply | str | 标本代码 |
| --- | --- | --- | --- |
| SpecimenName | LabApply | str | 标本名称 |
| --- | --- | --- | --- |
| Annotation | LabApply | str | 检验注意事项 |
| --- | --- | --- | --- |
| ApplyItems | LabApply | str | 1..1，检查项目节点 |
 |
| --- | --- | --- | --- | --- |
| ApplyItem | ApplyItems | str | 1..\*，检查项目实体 |
 |
| OrderId | ApplyItem | str | 医嘱ID |
 |
| ItemCode | ApplyItem | str | 项目代码 |
 |
| ItemName | ApplyItem | str | 项目名称 |
 |
| MethodCode | ApplyItem | str | 检验方法代码 |
 |
| MethodName | ApplyItem | str | 检验方法名称 |
 |
| ExecTime | ApplyItem | str | 执行时间 |
 |
| ExecDeptCode | ApplyItem | str | 执行科室 |
 |
| ExecDeptName | ApplyItem | str | 执行科室名称 |
 |
| Price | ApplyItem | str | 价格 |
 |

#### 3.2.2.5注意事项

入参中，PatientId、MedCardNo不能同时为空。

### 3.2.3获取HIS检查申请单信息 HIS\_GetExamApply

#### 3.2.3.1服务名 MessageCategory （消息类别）

HIS\_GetExamApply

#### 3.2.3.2用途

提供检查申请单信息

#### 3.2.3.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\> ~~\<ApplyId\>\</ApplyId\>~~ \<PatientId\>\</PatientId\>\<MedCardNo\>\</MedCardNo\>\<InpNo\>\</InpNo\> ~~\<MedExamNo\>\</MedExamNo\>~~ \<DeptCode\>\</DeptCode\>\<ExceDeptCode\>\</ExceDeptCode\>\<BedNo\>\</BedNo\>\<ApplyStatus\>\</ApplyStatus\>\<ApplyDateBegin\>\</ApplyDateBegin\>\<ApplyDateEnd\>\</ApplyDateEnd\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| ~~ApplyId~~ | ~~Request~~ | ~~是~~ | ~~str~~ | ~~HIS支付订单号，通过处方支付接口获取~~ |
| PatientId | Request | 否 | str | 患者ID |
| MedCardNo | Request | 否 | str | 门诊卡号 |
| ~~MedExamNo~~ | ~~Request~~ | ~~否~~ | ~~str~~ | ~~体检号~~ |
| DeptCode | Request | 否 | str | 开单科室代码 |
| ExecDeptCode | Request | 否 | str | 执行科室代码 |
| BedNo | Request | 否 | str | 床号 |
| ApplyStatus | Request | 否 | str | 状态,0:新开（来源：HIS、体检），1：已执行收费（来源：HIS、体检），2：已登记（来源：PACS），3：已确认（来源：PACS）， 4：报告已审核（来源：PACS），5：报告已发布（正式发布可看，来源：PACS），6：报告已打印（来源：PACS），7：报告回退（重新修改发布，来源：PACS），8：申请单已退费（来源：体检、HIS），-1：申请单已回退（条码删除允许退费，来源：PACS） |
| ApplyDateBegin | Request | 否 | str | 申请时间开始 |
| ApplyDateEnd | Request | 否 | str | 申请时间结束 |
| **InpNo** | Request | 是 | str | 住院患者申请单需要传 |
| **Type** | Request | 是 | str | 住院2 门诊1 |
| 注：PatientId、MedCardNo不能同时为空 |

#### 3.2.3.4返回业务数据BusinessResponse

| \<Result\> \<ResultCode\>0\</ResultCode\> \<ResultMessage\>\</ResultMessage\> \<Content\> \<PatientId\>002003\</PatientId\> \<MedCardNo\>44010000\</MedCardNo\> \<InpNo\>333255\</InpNo\> \<PatientName\>张三\</PatientName\> \<Sex\>男\</Sex\> \<BirthDate\>2018-02-01\</BirthDate\> \<Age\>4岁3月\</Age\> \<PatAddr\>广东省广州市荔湾区XXX路XX号\</PatAddr\> \<PatTel\>13333333333\</PatTel\> \<InsuranceNo\>\</InsuranceNo \> \<CardType\>01\</CardType\> \<CardTypeName\>居民身份证\</CardTypeName\> \<CardNo\>44010000201802010310\</CardNo\> \<Nationality\>中国\<Nationality\> \<PatientIdentity\>1\</PatientIdentity\> \<PatAbroad\>0\</PatAbroad\> \<Setlement\>自费\</Setlement\> \<Origin\>7\</Origin\> \<HouseholdRegister\>广东省广州市\</HouseholdRegister\> \<EmpId\>\</EmpId\> \<ExamApplys\> \<ExamApply\> \<BranchId\>01\</BranchId\> \<ApplyId\>0011001\</ApplyId\> \<Source\>1\</Source\> \<SourceName\>住院\</SourceName\> \<ClinicId\>\</ClinicId\> \<AdmissTimes\>1\</AdmissTimes\> \<VisitNumber\>101110234\</VisitNumber\> \<DiagCode\>I11.001\</DiagCode\> \<DiagName\>高血压\</DiagName\> \<DeptCode\>0003320\</DeptCode\> \<DeptName\>儿科\</DeptName\> \<WardCode\>0003321\</WardCode\> \<WardName\>儿科病区\</WardName\> \<DoctCode\>0003322\</DoctCode\> \<DoctName\>张医生\</DeptName\> \<ApplyDate\>2021-03-01 00:00:00\</ApplyDate\> \<BedNo\>01\</BedNo\> \<ApplyStatus\>1\</ApplyStatus\> \<DeleteFlag\>0\</DeleteFlag\> \<UrgenFlag\>0\</UrgenFlag\> \<HumanOrgans\>全腹部\</HumanOrgans\> \<Method\>超色多普勒超声\</Method\> \<Range\>正常\</Range\> \<Direction\>正常\</Direction\> \<Annotation\>检查注意事项\</Annotation\> \<ApplyItems\> \<ApplyItem\> \<OrderId\>100002210100\</OrderId\> \<ItemCode\>55230\</ItemCode\> \<ItemName\>彩超\</ItemName\> \<MethodCode\>\</MethodCode\> \<MethodName\>\</MethodName\> \<ExecTime\>2021-03-01 00:00:00\</ExecTime\> \<ExecDeptCode\>000333\</ExecDeptCode\> \<ExecDeptName\>超声科\</ExecDeptName\> \<Price\>30.00\</Price\> \</ApplyItem\> \</ApplyItems\> \</ExamApply\> \</ExamApplys\> \</Content\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| PatientId | Content | str | 患者ID |
| MedCardNo | Content | str | 门诊卡号 |
| InpNo | Content | str | 住院号 |
| PatientName | Content | str | 姓名 |
| Sex | Content | str | 性别 |
| BirthDate | Content | str | 出生日期 |
| Age | Content | str | 年龄 |
| PatAddr | Content | str | 联系地址 |
| PatTel | Content | str | 联系电话 |
| InsuranceNo | Content | str | 医保卡号，五级要求 |
| CardType | Content | str | 证件类型，01:居民身份证（户口簿），02:中国人民解放军军官证，03:中国人民武装警察警官证，04:香港特区护照/港澳居民来往内地通行证，05:港澳台居民居住证，06:台湾居民来往大陆通行证，07:外国人永久居留证，08:外国人护照，09:残疾人证，10:军烈属证明，11:外国人就业证，12:外国专家证，13:外国人常驻记者证，14:台港澳人员就业证，15:回国（来华）定居专家证，90:社会保障卡，99:其他身份证件（注意：部分证件类型已经不允许用，但字典项保留） |
| CardTypeName | Content | str | 居民身份证（户口簿） |
| CardNo | Content | str | 证件号码 |
| Nationality | Content | str | 国籍 |
| PatientIdentity | Content | str | 当前新冠肺炎疫情所需字段，1.出入境通关人员、2.国内出行人员、3.上岗就业人员、4.返校复课师生、5.医疗机构工作人员、6.口岸检疫和边防检查人员、7.监所工作人员、8.社会福利养老机构工作人员、9.孕产妇、10.新生儿、11.母婴服务类机构人员、12.农贸市场海水产品从业人员、13.农贸市场禽畜肉类从业人员、14.农贸市场进口食品类从业人员、15.农贸市场其他人员、16.农贸市场专项排查其他从业人员、17.屠宰场/各类冷库从业人员、18.农贸市场中地下或通风不良场所从业人员、99.其它人群 |
| PatAbroad | Content | str | 是否14天内境外入境人员1.是 2.否 |
| Setlement | Content | str | 自费/记账/居民医疗保险等 |
| Origin | Content | str | 1.集中留观、2.密切接触者、3.交通检疫、4.社区排查、5.发热门诊、6.其他门（急）诊、7.住院患者、8.住院患者陪护人员、9.农贸市场专项排查、99.其它采样点 |
| HouseholdRegister | Content | str | 户籍地 |
| EmpId | Content | str | 患者主索引 |
| ExamApplys | Content | 节点 | 1..1，申请单集合 |
| ExamApply | ExamApplys | 节点 | 1..\*，重复节点，一个节点为一个申请单明细信息 |
| BranchId | ExamApply | str | 院区ID |
| ApplyId | ExamApply | str | 申请单号 |
| Source | ExamApply | str | 来源ID，0门诊；1住院;2体检 |
| SourceName | ExamApply | str | 来源名称，门诊；住院;体检 |
| ClinicId | ExamApply | str | 门诊流水号 |
| AdmissTimes | ExamApply | str | 住院次数 |
| VisitNumber | ExamApply | str | 住院流水号，唯一ID，适配修改住院号 |
| DiagCode | ExamApply | str | 主要诊断代码 |
| DiagName | ExamApply | str | 主要诊断名称 |
| DeptCode | ExamApply | str | 开单科室代码 |
| DeptName | ExamApply | str | 开单科室名称 |
| WardCode | ExamApply | str | 开单病区代码 |
| WardName | ExamApply | str | 开单病区名称 |
| DoctCode | ExamApply | str | 开单医生代码 |
| DoctName | ExamApply | str | 开单医生名称 |
| ApplyDate | ExamApply | str | 申请时间 |
| BedNo | ExamApply | str | 床号 |
| ApplyStatus | ExamApply | str | 状态，0：新开 1：已执行收费，2：已登记，3：已确认，4：报告已发布，5：报告已打印，9：已退费 |
| DeleteFlag | ExamApply | str | 删除标志，0：未删除，1：已删除 |
| UrgenFlag | ExamApply | str | 加急标志：0：常规 1：加急 |
| HumanOrgans | ExamApply | str | 部位 |
| Method | ExamApply | str | 方法 |
| Range | ExamApply | str | 范围 |
| Direction | ExamApply | str | 方位 |
| Annotation | ExamApply | str | 检查注意事项 |
| ApplyItems | ExamApply | str | 1..1，检查项目节点 |
| ApplyItem | ApplyItems | str | 1..\*，检查项目实体 |
| OrderId | ApplyItem | str | 医嘱ID |
| ItemCode | ApplyItem | str | 项目代码 |
| ItemName | ApplyItem | str | 项目名称 |
| MethodCode | ApplyItem | str | 检查方法代码 |
| MethodName | ApplyItem | str | 检查方法名称 |
| ExecTime | ApplyItem | str | 执行时间 |
| ExecDeptCode | ApplyItem | str | 执行科室 |
| ExecDeptName | ApplyItem | str | 执行科室名称 |
| Price | ApplyItem | str | 价格 |

#### 3.2.3.5注意事项

入参中，PatientId、MedCardNo不能同时为空。

### 3.2.4HIS检验登记状态 HIS\_LISRegister

#### 3.2.4.1服务名 MessageCategory （消息类别）

HIS\_LISRegister

#### 3.2.4.2用途

提供检验登记状态回写给HIS

#### 3.2.4.3业务请求消息BusinessRequest

| \<Request\> \<registe\>\<BranchId\> **01** \</BranchId\> \<ApplicationID\> **470699** \</ApplicationID\> \<PatientNo\> **0018018006** \</PatientNo\> \<UndrugCode\> **0001010105** \</UndrugCode\> \<UndrugName\> **aa** \</UndrugName\> \<ExecuteOrgCode\> **aa** \</ExecuteOrgCode\> \<WardCode\> **aa** \</WardCode\> \<OperCode\> **aa** \</OperCode\>\<Type\> **1** \</Type\> \</registe\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| OrderId | Request | 是 | str | 医嘱号 |
| ApplicationID | Request | 是 | str | 申请单ID |
| PatientNo | Request | 是 | str | 患者编号 |
| UndrugCode | Request | 是 | str | HIS项目编码 |
| UndrugName | Request | 是 | str | HIS项目名称 |
| ApplyStatus | Request | 否 | str | 状态,0:新开（来源：HIS、体检），1：已执行收费（来源：HIS、体检）， ~~2~~ ：已采集（来源：LIS），3：已签收（来源：LIS） 4：已检验（来源LIS），2：已打印条码（来源LIS），3：已采集（来源：LIS），4：已签收（来源：LIS）5：报告已审核（来源：LIS），6：报告已发布（正式发布可看，来源：LIS），7：报告已打印（来源：LIS），8：报告回退（重新修改发布，来源：LIS），9：申请单已退费（来源：体检、HIS），-1：申请单已回退（条码删除允许退费，来源：LIS） |
| ExecuteOrgCode | Request | 是 | str | 执行科室名称 |
| WardCode | Request | 是 | str | 病区编码 |
| OperCode | Request | 是 | str | 操作员编码 |
| Type | Request | 是 | Str | 类型 1门诊 2住院 |

#### 3.2.4.4返回业务数据BusinessResponse

| \<Result\>\<message\>\<statusCode\> **0** \</statusCode\>\<message\> **操作成功** \</message\>\</message\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| StatusCode | Result | str | 0：成功，-1：失败 |
| Message | Result | str | 失败详细信息 |

#### 3.2.4.5注意事项

无

### 3.2.5HIS检验登记取消状态 HIS\_LISCancelRegister

#### 3.2.5.1服务名 MessageCategory （消息类别）

HIS\_LISCancelRegister

#### 3.2.5.2用途

提供检验取消登记状态回写给HIS

#### 3.2.5.3业务请求消息BusinessRequest

| \<Request\> \<unregiste\>\<BranchID\> **01** \</BranchId\> \<ApplicationID\> **10388492** \</ApplicationID\> \<OperCode\> **009873** \</OperCode\>\<Type\> **1** \</Type\> \</unregiste\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| OrderId | Request | 是 | str | 医嘱号 |
| ApplicationID | Request | 是 | str | 申请单ID |
| ApplyStatus | Request | 是 | str | 状态,0:新开（来源：HIS、体检），1：已执行收费（来源：HIS、体检）， ~~2~~ ：已采集（来源：LIS），3：已签收（来源：LIS） 4：已检验（来源LIS），：已打印条码（来源LIS），3：已采集（来源：LIS），4：已签收（来源：LIS）5：报告已审核（来源：LIS），6：报告已发布（正式发布可看，来源：LIS），7：报告已打印（来源：LIS），8：报告回退（重新修改发布，来源：LIS），9：申请单已退费（来源：体检、HIS），-1：申请单已回退（条码删除允许退费，来源：LIS） |
| OperCode | Request | 是 | str | 操作员编码 |
| Type | Request | 是 | Str | 类型 1门诊 2住院 |

#### 3.2.5.4返回业务数据BusinessResponse

| \<Result\>\<message\>\<statusCode\> **0** \</statusCode\>\<message\> **操作成功** \</message\>\</message\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| StatusCode | Result | str | 0：成功，-1：失败 |
| Message | Result | str | 失败详细信息 |

#### 3.2.5.5注意事项

无

### 3.2.6HIS检验出报告状态 HIS\_LISReport

#### 3.2.6.1服务名 MessageCategory （消息类别）

HIS\_LISReport

#### 3.2.6.2用途

提供检验报告通知状态回写给HIS。

#### 3.2.6.3业务请求消息BusinessRequest

| \<Request\> ~~\<Apply\>~~ \<Report\>\<BranchId\> **01** \</BranchId\> \<ApplicationID\> **470699** \</ApplicationID\>\<SampleNo\> **11111** \</SampleNo\> \<PatientNo\> **0018018006** \</PatientNo\> \<UndrugCode\> **0001010105** \</UndrugCode\> \<UndrugName\> **aa** \</UndrugName\> \<ExecuteOrgCode\> **aa** \</ExecuteOrgCode\> \<SendTime\> **2018-06-06 14:40:11** \</SendTime\> \<SenderName\> **伍蓝** \</SenderName\> \<SenderCode\> **0466** \</SenderCode\> \<CheckerName\> **万德学** \</CheckerName\> \<CheckerCode\> **0094** \</CheckerCode\> \<Result\> **10**. **48** \</Result\> \<UnitName\> **U/L** \</UnitName\> \<ReferenceValue\> **50** \</ReferenceValue\>\<ResultFlag\>0\</ResultFlag\>\<Type\> **1** \</Type\>\</Report\> ~~\</Apply\>~~ \</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| ApplicationID | Request | 是 | str | 申请单ID |
| SampleNo | Request | 是 | str | Lis标本号 |
| OrderID | Request | 是 | str | 医嘱ID |
| PatientNo | Request | 是 | str | 患者ID |
| UndrugCode | Request | 是 | str | 项目编码 |
| UndrugName | Request | 是 | str | 项目名称 |
| SendTime | Request | 是 | str | 报告时间 |
| SenderName | Request | 是 | str | 报告人 |
| SenderCode | Request | 是 | str | 报告人代码 |
| CheckerName | Request | 是 | str | 检验人 |
| CheckerCode | Request | 是 | str | 检验人代码 |
| Type | Request | 是 | Str | 类型 1门诊 2住院 |

#### 3.2.6.4返回业务数据BusinessResponse

| \<Result\>\<message\>\<statusCode\> **0** \</statusCode\>\<message\> **操作成功** \</message\>\</message\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| StatusCode | Result | str | 0：成功，-1：失败 |
| Message | Result | str | 失败详细信息 |

#### 3.2.6.5注意事项

无

### 3.2.7HIS检查登记状态 HIS\_PACSRegister

#### 3.2.7.1服务名 MessageCategory （消息类别）

HIS\_PACSRegister

#### 3.2.7.2用途

提供检查登记状态回写给HIS

#### 3.2.7.3业务请求消息BusinessRequest

| \<Request\> ~~\<Apply\>~~ \<Registe\>\<BranchId\> **01** \</BranchId\> \<ApplicationID\> **470699** \</ApplicationID\> \<HisPatientID\> **0018018006-01** \</HisPatientID\> \<ExecDeptID\> **0001010105** \</ExecDeptID\> \<PositionName\> **aa** \</PositionName\> \<ReqDepartmentName\> **aa** \</ReqDepartmentName\> \<OperCode\> **aa** \</OperCode\>\<Type\> **1** \</Type\>\</Registe\> ~~\</Apply\>~~ \</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| ApplicationID | Request | 是 | str | 申请单ID |
| HisPatientID | Request | 是 | str | 患者编号 |
| ExecDeptID | Request | 否 | str | 检查科室ID |
| PositionName | Request | 否 | str | 检查项目名称 |
| ReqDepartmentName | Request | 否 | str | 申请科室名称 |
| OperCode | Request | 是 | str | 操作员 |
| Type | Request | 是 | Str | 类型 1门诊 2住院 |

#### 3.2.7.4返回业务数据BusinessResponse

| \<Result\>\<message\>\<statusCode\> **0** \</statusCode\>\<message\> **操作成功** \</message\>\</message\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| StatusCode | Result | str | 0：成功，-1：失败 |
| Message | Result | str | 失败详细信息 |

#### 3.2.7.5注意事项

无

### 3.2.8HIS检查登记取消状态 HIS\_PACSCancelRegister

#### 3.2.8.1服务名 MessageCategory （消息类别）

HIS\_PACSCancelRegister

#### 3.2.8.2用途

提供检查取消登记状态回写给HIS

#### 3.2.8.3业务请求消息BusinessRequest

| \<Request\> ~~\<Apply\>~~ \<unregiste\>\<BranchID\> **01** \</BranchId\> \<ApplicationID\>470699\</ApplicationID\> \<OperCode\> **009999** \</OperCode\>\<Type\> **1** \</Type\>\</unregiste\> ~~\</Apply\>~~ \</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| ApplicationID | Request | 是 | str | 申请单ID |
| OperCode | Request | 是 | str | 操作员编码 |
| Type | Request | 是 | Str | 类型 1门诊 2住院 |

#### 3.2.8.4返回业务数据BusinessResponse

| \<Result\>\<message\>\<statusCode\> **0** \</statusCode\>\<message\> **操作成功** \</message\>\</message\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| StatusCode | Result | str | 0：成功，-1：失败 |
| Message | Result | str | 失败详细信息 |

#### 3.2.8.5注意事项

无

### 3.2.9HIS检查出报告状态 HIS\_PACSReport

#### 3.2.9.1服务名 MessageCategory （消息类别）

HIS\_PACSReport

#### 3.2.9.2用途

提供检查报告通知状态回写给HIS，告知HIS对应申请单已出报告或报告取消

#### 3.2.9.3业务请求消息BusinessRequest

| \<Request\> ~~\<Apply\>~~ \<report\>\<BranchId\> **01** \</BranchId\> \<ApplicationID\> **46699** \<ApplicationID/\> \<Describe\> **影像所见** \</Describe\> \<Diagnose\> **诊断** \</Diagnose\> \<Advice\> **建议** \</ Advice\> \<Doctor1Name\> **报告医生** \</Doctor1Name\> \<Doctor2Name\> **审核医生** \</Doctor2Name\> \<Reporttime\> **2021** - **07-22** \</Reporttime \>\<Type\> **1** \</Type\> \</report\> ~~\</Apply\>~~ \</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| ApplicationID | Request | 是 | str | 申请单ID |
| ApplyStatus | Request | 否 | str | 状态, 5：报告已发布（正式发布可看，来源：PACS），7：报告回退（重新修改发布，来源：PACS） |
| Describe | Request | 否 | str | 影像所见 |
| Diagnose | Request | 否 | str | 诊断 |
| Advice | Request | 否 | str | 建议 |
| Doctor1Name | Request | 否 | str | 报告医生姓名 |
| Doctor2Name | Request | 否 | str | 审核医生姓名 |
| Reporttime | Request | 否 | str | 报告时间 |
| Type | Request | 是 | Str | 类型 1门诊 2住院 |

#### 3.2.9.4返回业务数据BusinessResponse

| \<Result\>\<message\>\<statusCode\> **0** \</statusCode\>\<message\> **操作成功** \</message\>\</message\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| StatusCode | Result | str | 0：成功，-1：失败 |
| Message | Result | str | 失败详细信息 |

#### 3.2.9.5注意事项

无

### 3.2.10 ~~HIS~~~~ 门诊患者处方撤销结算 HIS\_ExeRecipecancelPay~~

#### 3.2.10.1服务名 MessageCategory （消息类别）

HIS\_ExeRecipecancelPay

#### 3.2.10.2用途

暂时取消，退费走线下窗口业务。 ~~提供门诊处方退费信息。~~

#### 3.2.10.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<PayOrderId\> **2021010108000001** \</PayOrderId\>\<ReciptPayType\> **1** \</ReciptPayType\>\<AcctUseFlag\> **1** \</AcctUseFlag\>\<MedfeeSumamt\> **200.00** \</MedfeeSumamt\>\<AcctPay\> **50** \</AcctPay\>\<AcctPayOrderSn\> **202101010001000100002** \</AcctPayOrderSn\>\<PsnCashPay\> **100** \</PsnCashPay\>\<PsnCashPayWay\> **WX** \</PsnCashPayWay\>\<PsnCashPayOrderSn\> **WX20210101201201010** \</PsnCashPayOrderSn\>\<SourceOrderId\> **3332252135212** \</SourceOrderId\>\<CancelPayTime\> **2021-01-01 00:00:00.000** \</CancelPayTime\>\<SourceSystem\> **自助机** \</SourceSystem\>\<SourceSystemMsg\> **编号**** 01**\</SourceSystemMsg\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| PayOrderId | Request | 是 | str | HIS支付订单号，通过处方支付接口获取 |
| ReciptPayType | Request | 是 | str | 支付方式：0：全自费 1：广州医保......(日后需在继续扩充) |
| AcctUseFlag | Request | 否 | str | 医保个人账户使用标志，支付方式为医保时必填，0：不适用 1：使用 |
| MedfeeSumamt | Request | 是 | str | 总费用 |
| AcctPay | Request | 否 | str | 使用个账支付时必填，个账支付金额 |
| AcctPayOrderSn | Request | 否 | str | 个账支付退款第三方流水号 |
| PsnCashPay | Request | 否 | str | 现金支付退款金额 |
| PsnCashPayWay | Request | 否 | str | 现金支付退款方式。WX：微信 ZFB：支付宝 YL：银联 |
| PsnCashPayOrderSn | Request | 否 | str | 现金支付退款第三方流水号 |
| SourceOrderId | Request | 是 | str | 第三方平台订单退款ID |
| PayTime | Request | 是 | str | 退款时间 |
| SourceSystem | Request | 是 | str | 来源系统，自助机、微信、互联网医院等 |
| SourceSystemMsg | Request | 是 | str | 备注信息，可填入自助机编号等信息 |
| 注:支付方式为医保支付时，HIS自行调用医保支付接口，非医保移动支付及医保互联网支付使用。 |

#### 3.2.10.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<CancelPayInfo\>\<BranchId\> **01** \</BranchId\>\<CancelPayOrderId\> **20210101000100010002** \</CancelPayOrderId\>\<PayOrderStatus\> **1** \</PayOrderStatus\>\<ErrorMsg\>\</ErrorMsg\>\<Invono\>\</Invono\>\<InvoUrl\>\</InvoUrl\>\<InvoContentType\> **PDF** \</InvoContentType\>\<InvoContent\>\</InvoContent\>\</CancelPayInfo\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| CancelPayInfo | Content | 节点 | 1..1，重复节点，一个节点为一个明细信息 |
| BranchId | CancelPayInfo | str | 院区ID |
| RecipeId | CancelPayInfo | str | 处方单号,多个,拼接 |
| CancelPayOrderId | CancelPayInfo | str | HIS支付订单号 |
| PayOrderStatus | CancelPayInfo | str | 退款状态，0失败，1：成功 |
| ErrorMsg | CancelPayInfo | str | 退款提示信息 |
| Invono | CancelPayInfo | str | 发票号 |
| InvoUrl | CancelPayInfo | str | 电子发票URL |
| InvoContentType | CancelPayInfo | str | 电子发票实体类型，JPG，PDF，PNG等（暂时不用，先保留） |
| InvoContent | CancelPayInfo | str | 电子发票实体，内容用Base64转换（暂时不用，先保留） |

#### 3.2.10.5注意事项

无

### 3.2.11HIS门诊患者处方结算 HIS\_ExeRecipePay

#### 3.2.11.1服务名 MessageCategory （消息类别）

HIS\_ExeRecipePay

#### 3.2.11.2用途

提供门诊处方收费信息

#### 3.2.11.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<RecipeId\> **2021010108000001** \</RecipeId\>\<ReciptPayType\> **1** \</ReciptPayType\>\<AcctUseFlag\> **1** \</AcctUseFlag\>\<MedfeeSumamt\> **200.00** \</MedfeeSumamt\>\<AcctPay\> **50** \</AcctPay\>\<AcctPayOrderSn\> **202101010001000100002** \</AcctPayOrderSn\>\<PsnCashPay\> **100** \</PsnCashPay\>\<PsnCashPayWay\> **WX** \</PsnCashPayWay\>\<PsnCashPayOrderSn\> **WX20210101201201010** \</PsnCashPayOrderSn\>\<SourceOrderId\> **3332252135212** \</SourceOrderId\>\<PayTime\> **2021-01-01 00:00:00.000** \</PayTime\>\<SourceSystem\> **自助机** \</SourceSystem\>\<SourceSystemMsg\> **编号**** 01**\</SourceSystemMsg\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| RecipeId | Request | 是 | str | 处方ID，多个处方合并支付时用,(英文逗号)分割，只能传入单个患者的多张处方 |
| ReciptPayType | Request | 是 | str | 支付方式：0：全自费 1：广州医保......(日后需在继续扩充) |
| AcctUseFlag | Request | 否 | str | 医保个人账户使用标志，支付方式为医保时必填，0：不适用 1：使用 |
| MedfeeSumamt | Request | 是 | str | 总费用 |
| AcctPay | Request | 否 | str | 使用个账支付时必填，个账支付金额 |
| AcctPayOrderSn | Request | 否 | str | 个账支付第三方流水号 |
| PsnCashPay | Request | 否 | str | 现金支付金额 |
| PsnCashPayWay | Request | 否 | str | 现金支付方式。WX：微信 ZFB：支付宝 YL：银联 |
| PsnCashPayOrderSn | Request | 否 | str | 现金支付第三方流水号 |
| SourceOrderId | Request | 是 | str | 第三方平台订单ID |
| PayTime | Request | 是 | str | 支付时间 |
| SourceSystem | Request | 是 | str | 来源系统，自助机、微信、互联网医院等 |
| SourceSystemMsg | Request | 是 | str | 备注信息，可填入自助机编号等信息 |
| 注:支付方式为医保支付时，HIS自行调用医保支付接口，非医保移动支付及医保互联网支付使用。 |

#### 3.2.11.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<PayInfo\>\<BranchId\> **01** \</BranchId\>\<RecipeId\> **2021010101010001** \</RecipeId\>\<PayOrderId\> **20210101000100010002** \</PrePayInfo\>\<PayOrderStatus\> **1** \</PayOrderStatus\>\<ErrorMsg\>\</ErrorMsg\>\<Invono\>\</Invono\>\<InvoUrl\>\</InvoUrl\>\<InvoContentType\> **PDF** \</InvoContentType\>\<InvoContent\>\</InvoContent\>\<FeeInfo\>\<FeeItem\>\<FeeItemID\> **001** \</FeeItemID\>\<FeeItemName\> **挂号费** \</FeeItemName\>\<FeeAmount\> **30** \</FeeAmount\>\</FeeItem\>\</FeeInfo\>\<GuideList\>\<Guide\>\<GuideId\> **01** \</GuideId\>\<GuideType\> **2** \</GuideType\>\<DeptCode\> **0001** \</GuideCode\>\<DeptName\> **检验科** \</GuideDept\>\<DeptAddr\> **门诊楼**** 5 ****楼** \</DeptAddr\>\<DeptWin\>\</DeptWin\>\<Seq\>\</Seq\>\<GuideMsg\> **请先到护士站报到** \</GuideMsg\>\<ItemList\>\<Item\>\<ItemId\>\</ItemId\>\<ItemName\>\</ItemName\>\<Count\>\</Count\>\</Item\>\</ItemList\>\</Guide\>\<Guide\>\<GuideId\> **02** \</GuideId\>\<GuideType\> **1** \</GuideType\>\<DeptCode\> **0002** \</GuideCode\>\<DeptName\> **门诊西药房** \</GuideDept\>\<DeptAddr\> **门诊楼**** 1 ****楼** \</DeptAddr\>\<DeptWin\> **04**** 号窗口 **\</DeptWin\>\<Seq\>** 01**\</Seq\>\<GuideMsg\>\</GuideMsg\>\<ItemList\>\<Item\>\<ItemId\>\</ItemId\>\<ItemName\>\</ItemName\>\<Count\>\</Count\>\</Item\>\</ItemList\>\</Guide\>\</GuideList\>\</PayInfo\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| PayInfo | Content | 节点 | 1..1，重复节点，一个节点为一个明细信息 |
| BranchId | PayInfo | str | 院区ID |
| RecipeId | PayInfo | str | 处方单号,多个,拼接 |
| PayOrderId | PayInfo | str | HIS支付订单号 |
| PayOrderStatus | PayInfo | str | 支付状态，0失败，1：成功 |
| ErrorMsg | PayInfo | str | 支付提示信息 |
| Invono | PayInfo | str | 发票号 |
| InvoUrl | PayInfo | str | 电子发票URL |
| InvoContentType | PayInfo | str | 电子发票实体类型，JPG，PDF，PNG等（暂时不用，先保留） |
| InvoContent | PayInfo | str | 电子发票实体，内容用Base64转换（暂时不用，先保留） |
| FeeInfo | PayInfo | 节点 | 1..1费用统计信息节点 |
| FeeItem | FeeInfo | 节点 | 1..\*，费用统计项目 |
| FeeItemID | PayInfo | str | 统计分类ID |
| FeeItemName | FeeItem | str | 统计分类名称 |
| FeeAmount | FeeItem | str | 金额 |
| GuideList | PayInfo | 节点 | 1..1，指引单实体 |
| Guide | GuideList | str | 0..\*，单个指引单 |
| GuideId | Guide | str | 指引单ID |
| GuideType | Guide | str | 指引单类型，1：取药单，2：检验指引单，3：检查指引单，4：手术治疗指引单 |
| DeptCode | Guide | str | 指引单对应科室代码 |
| DeptName | Guide | str | 指引单对应科室名称 |
| DeptAddr | Guide | str | 指引单对应科室地址 |
| DeptWin | Guide | str | 窗口 |
| Seq | Guide | str | 顺序号 |
| GuideMsg | Guide | str | 提示信息 |
| ItemList | Guide | 节点 | 1..1，指引单单对应项目 |
| Item | ItemList | 节点 | 1..\*，单个项目实体 |
| ItemId | Item | str | 项目ID，对应处方明细ID |
| ItemName | Item | str | 项目名称，对应处方明细项目名称 |
| Count | Item | str | 数量 |

#### 3.2.11.5注意事项

无

### 3.2.12 ~~HIS~~~~ 门诊患者处方预结算 HIS\_ExeRecipePrePay~~

#### 3.2.12.1服务名 MessageCategory （消息类别）

HIS\_ExeRecipePrePay

#### 3.2.12.2用途

涉及医保业务，暂时取消。 ~~提供门诊患者处方预结算。~~

#### 3.2.12.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<RecipeId\> **2021010108000001** \</RecipeId\>\<ReciptPayType\> **1** \</ReciptPayType\>\<AcctUseFlag\> **1** \</AcctUseFlag\>\<SourceSystem\> **自助机** \</SourceSystem\>\<SourceSystemMsg\> **编号**** 01**\</SourceSystemMsg\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| RecipeId | Request | 否 | str | 处方ID，多个处方合并支付时用,(英文逗号)分割，只能传入单个患者的多张处方 |
| ReciptPayType | Request | 否 | str | 支付方式：0：全自费 1：广州医保......(日后需在继续扩充) |
| AcctUseFlag | Request | 否 | str | 医保个人账户使用标志，支付方式为医保时必填，0：不适用 1：使用 |
| SourceSystem | Request | 是 | str | 来源系统，自助机、微信、互联网医院等 |
| SourceSystemMsg | Request | 是 | str | 备注信息，可填入自助机编号等信息 |
| 注:接口调用时如付费方式为医保支付时，进行医保处方上传并进行预结算，并返回相关医保信息，以便第三方实现移动支付、互联网支付。 |

#### 3.2.12.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<PrePayInfo\>\<BranchId\>01\</BranchId\>\<PsnNo\>00401215114\</PsnNo\>\<MdtrtCertType\>01\</MdtrtCertType\>\<MdtrtCertNo\>44010019441112201411\</MdtrtCertNo\>\<MdtrtId\>003001000055141341351\</MdtrtId\>\<ChrgBchno\>001013141\</ChrgBchno\>\<Insutype\>01\</insutype\>\<MedType\>\</MedType\>\<AcctUsedFlag\>1\</AcctUsedFlag\>\<PsnSetlway\>\</PsnSetlway\>\<Invono\>\</Invono\>\<MdtrtMode\>\</MdtrtMode\>\<MidSetlFlag\>\</MidSetlFlag\>\<MedfeeSumamt\>200.00\</MedfeeSumamt\>\<FulamtOwnpayAmt\>\</FulamtOwnpayAmt\>\<OverlmtSelfpay\>\</OverlmtSelfpay\>\<PreselfpayAmt\>\</PreselfpayAmt\>\<InscpScpAmt\>\</InscpScpAmt\>\<ActPayDedc\>\</ActPayDedc\>\<HifpPay\>\</HifpPay\>\<PoolPropSelfpay\>\</PoolPropSelfpay\>\<CvlservPay\>\</CvlservPay\>\<HifesPay\>\</HifesPay\>\<HifmiPay\>\</HifmiPay\>\<HifobPay\>\</HifobPay\>\<MafPay\>\</MafPay\>\<OthPay\>\</OthPay\>\<FundPaySumamt\>\</FundPaySumamt\>\<HospPartAmt\>\</HospPartAmt\>\<PsnPartAm\>\</PsnPartAm\>\<AcctPay\>\</AcctPay\>\<PsnCashPay\>\</PsnCashPay\>\<AcctMulaidPay\>\</AcctMulaidPay\>\<Balc\>\</Balc\>\<FixmedinsCode\>\</FixmedinsCode\>\<FixmedinsName\>\</FixmedinsName\>\</PrePayInfo\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| PrePayInfo | Content | 节点 | 1..1，重复节点，一个节点为一个明细信息 |
| BranchId | PrePayInfo | str | 院区ID |
| PsnNo | PrePayInfo | str | 人员编号 |
| MdtrtCertType | PrePayInfo | str | 就诊凭证类型 |
| MdtrtCertNo | PrePayInfo | str | 就诊凭证编号 |
| MdtrtId | PrePayInfo | str | 就诊ID |
| ChrgBchno | PrePayInfo | str | 收费批次号 |
| Insutype | PrePayInfo | str | 险种类型 |
| MedType | PrePayInfo | str | 医疗类别 |
| AcctUsedFlag | PrePayInfo | str | 个人账户使用标志 |
| PsnSetlway | PrePayInfo | str | 个人结算方式 |
| Invono | PrePayInfo | str | 发票号（保留） |
| MdtrtMode | PrePayInfo | str | 就诊方式 |
| MidSetlFlag | PrePayInfo | str | 中途结算标志 |
| MedfeeSumamt | PrePayInfo | str | 医疗费总额 |
| FulamtOwnpayAmt | PrePayInfo | str | 全自费金额 |
| OverlmtSelfpay | PrePayInfo | str | 超限价自费费用 |
| PreselfpayAmt | PrePayInfo | str | 先行自付金额 |
| InscpScpAmt | PrePayInfo | str | 符合政策范围金额 |
| ActPayDedc | PrePayInfo | str | 实际支付起付线 |
| HifpPay | PrePayInfo | str | 基本医疗保险统筹基金支出 |
| PoolPropSelfpay | PrePayInfo | str | 基本医疗保险统筹基金支付比例 |
| CvlservPay | PrePayInfo | str | 公务员医疗补助资金支出 |
| HifesPay | PrePayInfo | str | 企业补充医疗保险基金支出 |
| HifmiPay | PrePayInfo | str | 居民大病保险资金支出 |
| HifobPay | PrePayInfo | str | 职工大额医疗费用补助基金支出 |
| MafPay | PrePayInfo | str | 医疗救助基金支出 |
| OthPay | PrePayInfo | str | 其他基金支出 |
| FundPaySumamt | PrePayInfo | str | 基金支付总额 |
| HospPartAmt | PrePayInfo | str | 医院负担金额 |
| PsnPartAm | PrePayInfo | str | 个人负担总金额 |
| AcctPay | PrePayInfo | str | 个人账户支出 |
| PsnCashPay | PrePayInfo | str | 现金支付金额 |
| AcctMulaidPay | PrePayInfo | str | 账户共济支付金额 |
| Balc | PrePayInfo | str | 个人账户支出后余额 |
| FixmedinsCode | PrePayInfo | str | 定点医疗机构编号 |
| FixmedinsName | PrePayInfo | str | 定点医疗机构名称 |

#### 3.2.12.5注意事项

接口调用时如付费方式为医保支付时，进行医保处方上传并进行预结算，并返回相关医保信息，以便第三方实现移动支付、互联网支付。

### 3.2.13获取HIS门诊患者处方明细信息 HIS\_GetOutPatientRecipeDetail

#### 3.2.13.1服务名 MessageCategory （消息类别）

HIS\_GetOutPatientRecipeDetail

#### 3.2.13.2用途

提供门诊处方明细信息

#### 3.2.13.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<RecipeId\> **2021010108000001** \</RecipeId\>\<RecipeDateBegin\> **2021-01-01 00:00:00** \</RecipeDateBegin\>\<RecipeDateEnd\> **2021-01-01 00:00:00** \</RecipeDateEnd\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| RecipeId | Request | 否 | str | 处方ID |
| RecipeDateBegin | Request | 否 | str | 查询处方单开始时间 |
| RecipeDateEnd | Request | 否 | str | 查询处方单结束时间 |
|
 |

#### 3.2.13.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<RecipeDetail\>\<BranchId\> **01** \</BranchId\>\<RecipeId\> **2021010100000001** \</RecipeId\>\<RecipeDetailId\> **2200012241** \</RecipeDetailId\>\<ItemTypeId\> **1** \</ItemTypeId\>\<ItemTypeName\> **西药** \</ItemTypeName\>\<ItemId\> **100001121** \</ItemId\>\<ItemCode\> **00033585** \</ItemCode\>\<ItemName\> **氯化钠** \</ItemName\>\<InsuranceItemCode\> **01010001** \</InsuranceItemCode\>\<InsuranceItemName\> **氯化钠** \</InsuranceItemName\>\<DrugId\> **00011101** \</DrugId\>\<DrugCode\> **0101001** \</DrugCode\>\<DrugName\> **氯化钠注射液** \</DrugName\>\<DisplayOrder\> **1** \</DisplayOrder\>\<PrepId\> **1** \</PrepId\>\<PrepName\> **注射剂** \</PrepName\>\<Price\> **3.00** \</Price\>\<Count\> **2** \</Count\>\<Unit\> **瓶** \</Unit\>\<Amount\> **6.00** \</Amount\>\<SpecId\> **1** \</SpecId\>\<SpecName\> **100ml/**** 瓶 **\</SpecName\>\<FreqId\>** Bid **\</FreqId\>\<FreqName\>** 一天两次 **\</FreqName\>\<Dosage\>** 10 **\</Dosage\>\<DosageUnit\>** ml **\</DosageUnit\>\<ContitueDay\>** 3 **\</ContitueDay\>\<RecipeDate\>** 2021-01-01 00:00:00**\</RecipeDate\>\</RecipeDetail\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| RecipeDetail | Content | 节点 | 1..1，重复节点，一个节点为一个明细信息 |
| RecipeId | RecipeDetail | str | 处方单ID |
| RecipeDetailId | RecipeDetail | str | 处方明细ID |
| ItemTypeId | RecipeDetail | str | 处方类型ID，1:西药，2：中药，3：检验，4：检查，5：手术治疗，9：其它 |
| ItemTypeName | RecipeDetail | str | 处方类型名称 |
| ItemId | RecipeDetail | str | 项目ID |
| ItemCode | RecipeDetail | str | 项目编码 |
| ItemName | RecipeDetail | str | 项目名称 |
| InsuranceItemCode | RecipeDetail | str | 对应医保项目编码 |
| InsuranceItemName | RecipeDetail | str | 对应医保项目名称 |
| DrugId | RecipeDetail | str | 对应药品ID |
| DrugCode | RecipeDetail | str | 对应药品编码 |
| DrugName | RecipeDetail | str | 对应药品名称 |
| DisplayOrder | RecipeDetail | str | 显示顺序 |
| PrepId | RecipeDetail | str | 剂型ID |
| PrepName | RecipeDetail | str | 剂型 |
| Price | RecipeDetail | str | 价格 |
| Count | RecipeDetail | str | 数量 |
| Unit | RecipeDetail | str | 单位 |
| Amount | RecipeDetail | str | 总价 |
| SpecId | RecipeDetail | str | 规格ID |
| SpecName | RecipeDetail | str | 规格 |
| FreqId | RecipeDetail | str | 频次ID |
| FreqName | RecipeDetail | str | 频次 |
| Dosage | RecipeDetail | str | 剂量 |
| DosageUnit | RecipeDetail | str | 计量单位 |
| ContitueDay | RecipeDetail | str | 用药天数 |
| RecipeDate | RecipeDetail | str | 处方单时间 |

#### 3.2.13.5注意事项

无

### 3.2.14获取HIS门诊患者处方单信息 HIS\_GetOutPatientRecipe

#### 3.2.14.1服务名 MessageCategory （消息类别）

HIS\_GetOutPatientRecipe

#### 3.2.14.2用途

提供门诊处方单信息

#### 3.2.14.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<PatientId\> **00001111** \</PatientId\>\<MedCardNo\> **4401000011112222** \</MedCardNo\>\<RegistrId\> **1000011010120** \</RegistrId\>\<RecipeId\> **2021010108000001** \</RecipeId\>\<RecipeDateBegin\> **2021-01-01 00:00:00** \</RecipeDateBegin\>\<RecipeDateEnd\> **2021-01-01 00:00:00** \</RecipeDateEnd\>\<RecipeStatus\> **1** \</RecipeStatus\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| PatientId | Request | 是 | str | 患者ID |
| MedCardNo | Request | 是 | str | 院内就诊卡号 |
| RegistrId | Request | 否 | str | 挂号ID |
| RecipeId | Request | 否 | str | 处方ID |
| RecipeDateBegin | Request | 否 | str | 查询处方单开始时间 |
| RecipeDateEnd | Request | 否 | str | 查询处方单结束时间 |
| RecipeStatus | Request | 是 | str | 处方单状态：1：未缴费 2：已缴费未取药 3：已缴费已取药 9：已退费， -1：处方撤销 |
|
 |

#### 3.2.14.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<Recipe\>\<RegistrId\> **1000011010120** \</RegistrId\>\<BranchId\> **01** \</BranchId\>\<DeptId\> **001** \</DeptId\>\<DeptName\> **内科门诊** \</DeptName\>\<DoctorId\> **11111** \</DoctorId\>\<DoctorName\> **李医生** \</DoctorName\>\<PatientId\> **00001111** \</PatientId\>\<MedCardNo\> **4401000011112222** \</MedCardNo\>\<PatientName\> **张三** \</PatientName\>\<RecipeId\> **2021010100000001** \</RecipeId\>\<RecipeDateTime\> **2021-01-01 00:00:00** \</RecipeDateTime\>\<RecipeInsuranceType\> **1** \</RecipeInsuranceType\>\<RecipeTypeId\>\</RecipeTypeId\>\<RecipeTypeName\> **普通处方** \</RecipeTypeName\>\<DiagnosisDesc\> **1**** 、高血压 **** 2 ****、咳嗽** \</DiagnosisDesc\>\<RecipeStatus\> **1** \</RecipeStatus\>\<TotalFee\> **100.00** \</TotalFee\>\</Recipe\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| Recipe | Content | 节点 | 1..1，重复节点，一个节点为一个挂号信息 |
| RegistrId | Recipe | str | 挂号ID，锁号ID |
| BranchId | Recipe | str | 院区ID |
| DeptId | Recipe | str | 科室ID |
| DeptMame | Recipe | str | 科室名称 |
| DoctorId | Recipe | str | 医生ID |
| DoctorName | Recipe | str | 医生姓名 |
| PatientId | Recipe | str | 患者ID |
| MedCardNo | Recipe | str | 院内就诊卡号 |
| PatientName | Recipe | str | 患者姓名 |
| RecipeId | Recipe | str | 处方ID |
| RecipeDateTime | Recipe | str | 处方单时间 |
| RecipeInsuranceType | Recipe | str | 处方医保类型 1：医保处方 0：自费处方 |
| RecipeTypeId | Recipe | str | 处方类型ID |
| RecipeTypeName | Recipe | str | 处方类型名称 |
| DiagnosisDesc | Recipe | str | 诊断描述 |
| RecipeStatus | Recipe | str | 处方单状态：1：未缴费 2：已缴费未取药 3：已缴费已取药 9：已退费， -1：处方撤销 |
| TotalFee | Recipe | str | 总费用 |

#### 3.2.14.5注意事项

无

### 3.2.15 ~~HIS~~~~ 门诊患者自助报到 HIS\_ExeCheckInRegister~~

#### 3.2.15.1服务名 MessageCategory （消息类别）

HIS\_ExeCheckInRegister

#### 3.2.15.2用途

暂时取消，预计改由南翼科技分诊排队系统提供。 ~~提供门诊患者自助报到信息。~~

#### 3.2.15.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<DeptId\> **001** \</DeptId\>\<DoctorId\> **11111** \</DoctorId\>\<PatientId\> **00001111** \</PatientId\>\<MedCardNo\> **4401000011112222** \</MedCardNo\>\<RegistrId\> **1000011010120** \</RegistrId\>\<SourceSystem\> **自助机** \</SourceSystem\>\<SourceSystemMsg\> **编号**** 01**\</SourceSystemMsg\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| DeptId | Request | 是 | str | 科室ID |
| DoctorId | Request | 否 | str | 医生ID |
| PatientId | Request | 否 | str | 患者ID |
| MedCardNo | Request | 否 | str | 院内就诊卡号 |
| RegistrId | Request | 是 | str | 挂号ID |
| SourceSystem | Request | 是 | str | 来源系统，自助机、微信、互联网医院等 |
| SourceSystemMsg | Request | 是 | str | 备注信息，可填入自助机编号等信息 |
|
1. 未缴费的挂号订单不允许报到
 |

#### 3.2.15.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<CheckIn\>\<RegistrId\> **1000011010120** \</RegistrId\>\<BranchId\> **01** \</BranchId\>\<DeptId\> **001** \</DeptId\>\<DeptName\> **内科门诊** \</DeptName\>\<DoctorId\> **11111** \</DoctorId\>\<DoctorName\> **李医生** \</DoctorName\>\<PatientId\> **00001111** \</PatientId\>\<MedCardNo\> **4401000011112222** \</MedCardNo\>\<PatientName\> **张三** \</PatientName\>\<SourceOrderId\> **202101010001** \</SourceOrderId\>\<RegistrDate\> **2021-01-01** \</RegistrDate\>\<RegistrTime\> **08:00-09:00** \</RegistrTime\>\<ConsultationRoom\> **001** \</ConsultationRoom\>\<RegistrSeq\> **33** \</RegistrSeq\>\<SchedulePeriodId\> **A** \</SchedulePeriodId\>\<SchedulePeriodName\> **上午** \</SchedulePeriodName\>\<CheckInStatus\> **1** \</CheckInStatus\>\<CheckInMsg\> **报到成功，请到**** XXX ****诊室就诊** \</CheckInMsg\>\</CheckIn\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| Registr | Content | 节点 | 1..1，重复节点，一个节点为一个挂号信息 |
| RegistrId | CheckIn | str | 挂号ID，锁号ID |
| BranchId | CheckIn | str | 院区ID |
| DeptId | CheckIn | str | 科室ID |
| DeptMame | CheckIn | str | 科室名称 |
| DoctorId | CheckIn | str | 医生ID |
| DoctorName | CheckIn | str | 医生姓名 |
| ConsultationRoom | CheckIn | str | 诊室 |
| PatientId | CheckIn | str | 患者ID |
| MedCardNo | CheckIn | str | 院内就诊卡号 |
| PatientName | CheckIn | str | 患者姓名 |
| SourceOrderId | CheckIn | str | 第三方平台订单ID |
| RegistrDate | CheckIn | str | 挂号就诊日期 |
| RegistrTime | CheckIn | str | 就诊时间段 |
| RegistrSeq | CheckIn | str | 就诊序号 |
| SchedulePeriodId | CheckIn | str | 午别ID |
| SchedulePeriodName | CheckIn | str | 午别名称 |
| CheckInStatus | CheckIn | str | 报到状态，1：成功 0失败 |
| RemainingCount | CheckIn | str | 报到提示消息，报到失败则返回失败原因 |

#### 3.2.15.5注意事项

无

### 3.2.16 ~~获取HIS门诊患者候诊队列 HIS\_GetWaitingQueue~~

#### 3.2.16.1服务名 MessageCategory （消息类别）

HIS\_GetWaitingQueue

#### 3.2.16.2用途

暂时取消，预计改由南翼科技分诊排队系统提供。 ~~提供门诊患者候诊队列信息。~~

#### 3.2.16.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<DeptId\> **001** \</DeptId\>\<DoctorId\> **11111** \</DoctorId\>\<PatientId\> **00001111** \</PatientId\>\<MedCardNo\> **4401000011112222** \</MedCardNo\>\<RegistrId\> **1000011010120** \</RegistrId\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| DeptId | Request | 是 | str | 科室ID |
| DoctorId | Request | 否 | str | 医生ID |
| PatientId | Request | 否 | str | 患者ID |
| MedCardNo | Request | 否 | str | 院内就诊卡号 |
| RegistrId | Request | 是 | str | 挂号ID |
|
1. 只允许获取当前候诊队列，即当天的数据，就诊日期未到，不进入队列。
2. 已就诊数据数据不返回
 |

#### 3.2.16.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<Registr\>\<RegistrId\> **1000011010120** \</RegistrId\>\<BranchId\> **01** \</BranchId\>\<DeptId\> **001** \</DeptId\>\<DeptName\> **内科门诊** \</DeptName\>\<DoctorId\> **11111** \</DoctorId\>\<DoctorName\> **李医生** \</DoctorName\>\<PatientId\> **00001111** \</PatientId\>\<MedCardNo\> **4401000011112222** \</MedCardNo\>\<PatientName\> **张三** \</PatientName\>\<SourceOrderId\> **202101010001** \</SourceOrderId\>\<RegistrDate\> **2021-01-01** \</RegistrDate\>\<RegistrTime\> **08:00-09:00** \</RegistrTime\>\<ConsultationRoom\> **001** \</ConsultationRoom\>\<RegistrSeq\> **33** \</RegistrSeq\>\<SchedulePeriodId\> **A** \</SchedulePeriodId\>\<SchedulePeriodName\> **上午** \</SchedulePeriodName\>\<CurrentRegistrSeq\> **10** \</CurrentRegistrSeq\>\<RemainingCount\> **1** \</RemainingCount\>\<WaitStatus\> **0** \</WaitStatus\>\</Registr\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| Registr | Content | 节点 | 1..1，重复节点，一个节点为一个挂号信息 |
| RegistrId | Registr | str | 挂号ID，锁号ID |
| BranchId | Registr | str | 院区ID |
| DeptId | Registr | str | 科室ID |
| DeptMame | Registr | str | 科室名称 |
| DoctorId | Registr | str | 医生ID |
| DoctorName | Registr | str | 医生姓名 |
| ConsultationRoom | Registr | str | 诊室 |
| PatientId | Registr | str | 患者ID |
| MedCardNo | Registr | str | 院内就诊卡号 |
| PatientName | Registr | str | 患者姓名 |
| SourceOrderId | Registr | str | 第三方平台订单ID |
| RegistrDate | Registr | str | 挂号就诊日期 |
| RegistrTime | Registr | str | 就诊时间段 |
| RegistrSeq | Registr | str | 就诊序号 |
| SchedulePeriodId | Registr | str | 午别ID |
| SchedulePeriodName | Registr | str | 午别名称 |
| CurrentRegistrSeq | Registr | str | 队列当前叫号 |
| RemainingCount | Registr | str | 前面剩余多少人 |
| WaitStatus | Registr | str | 是否叫号，1已叫，0未叫 |

#### 3.2.16.5注意事项

1. 只允许获取当前候诊队列，即当天的数据，就诊日期未到，不进入队列。
2. 已就诊数据数据不返回

### 3.2.17获取HIS门诊患者挂号信息 HIS\_GetRegisterInfo

#### 3.2.17.1服务名 MessageCategory （消息类别）

HIS\_GetRegisterInfo

#### 3.2.17.2用途

提供门诊患者挂号信息

#### 3.2.17.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<DeptId\> **001** \</DeptId\>\<DoctorId\> **11111** \</DoctorId\>\<PatientId\> **00001111** \</PatientId\>\<MedCardNo\> **4401000011112222** \</MedCardNo\>\<RegistrId\> **1000011010120** \</RegistrId\>\<RegistrDateBegin\> **2021-01-01** \</RegistrDateBegin\>\<RegistrDateEnd\> **2021-01-02** \</RegistrDateEnd\>\<HisOrderStatus\> **0** \</HisOrderStatus\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| DeptId | Request | 是 | str | 科室ID |
| DoctorId | Request | 否 | str | 医生ID |
| PatientId | Request | 否 | str | 患者ID |
| MedCardNo | Request | 否 | str | 院内就诊卡号 |
| RegistrId | Request | ~~是~~ 否 | str | 挂号ID |
| RegistrDateBegin | Request | 是 | str | 查询挂号日期开始 |
| RegistrDateEnd | Request | 是 | str | 查询挂号日期结束 |
| HisOrderStatus | Request | ~~是~~ 否 | str | 订单状态，0：已挂号未缴费，即锁号状态。1：已挂号已缴费，2：现场已取号，3：现场已报到，4：已就诊，5：医生已停诊未通知，6：已停诊已通知，9：已退号 |

#### 3.2.17.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<Registr\>\<RegistrId\> **1000011010120** \</RegistrId\>\<BranchId\> **01** \</BranchId\>\<DeptId\> **001** \</DeptId\>\<DeptName\> **内科门诊** \</DeptName\>\<DoctorId\> **11111** \</DoctorId\>\<DoctorName\> **李医生** \</DoctorName\>\<PatientId\> **00001111** \</PatientId\>\<MedCardNo\> **4401000011112222** \</MedCardNo\>\<PatientName\> **张三** \</PatientName\>\<SourceOrderId\> **202101010001** \</SourceOrderId\>\<RegistrDate\> **2021-01-01** \</RegistrDate\>\<RegistrTime\> **08:00-09:00** \</RegistrTime\>\<SchedulePeriodId\> **A** \</SchedulePeriodId\>\<SchedulePeriodName\> **上午** \</SchedulePeriodName\>\<ConsultationRoom\> **001** \</ConsultationRoom\>\<RegistrSeq\> **33** \</RegistrSeq\>\<Fee\> **10** \</Fee\>\<HisOrderId\> **2021010100000111** \</HisOrderId\>\<HisOrderStatus\> **0** \</HisOrderStatus\>\<EffectiveTime\> **2021-01-01 07:00:00** \</EffectiveTime\>\<SourceSystem\> **自助机** \</SourceSystem\>\</Registr\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| Registr | Content | 节点 | 1..1，重复节点，一个节点为一个挂号信息 |
| RegistrId | Registr | str | 挂号ID，锁号ID |
| BranchId | Registr | str | 院区ID |
| DeptId | Registr | str | 科室ID |
| DeptMame | Registr | str | 科室名称 |
| DoctorId | Registr | str | 医生ID |
| DoctorName | Registr | str | 医生姓名 |
| ConsultationRoom | Registr | str | 诊室 |
| PatientId | Registr | str | 患者ID |
| MedCardNo | Registr | str | 院内就诊卡号 |
| PatientName | Registr | str | 患者姓名 |
| SourceOrderId | Registr | str | 第三方平台订单ID |
| RegistrDate | Registr | str | 挂号就诊日期 |
| SchedulePeriodId | Registr | str | 午别 |
| SchedulePeriodName | Registr | str | 午别名称 |
| RegistrTime | Registr | str | 就诊时间段 |
| RegistrSeq | Registr | str | 就诊序号 |
| Fee | Registr | str | 挂号费用 |
| HisOrderId | Registr | str | HIS订单ID |
| HisOrderStatus | Registr | str | 订单状态，0：已挂号未缴费，即锁号状态。1：已挂号已缴费，2：现场已取号，3：现场已报到，4：已就诊，5：医生已停诊未通知，6：已停诊已通知，9：已退号 |
| EffectiveTime | Registr | str | 挂号确认时间 |
| SourceSystem | Registr | str | 来源系统，微信、自助机、互联网医院等 |

#### 3.2.17.5注意事项

无

### 3.2.18HIS门诊患者挂号 HIS\_ExeOutPatientRegister

#### 3.2.18.1服务名 MessageCategory （消息类别）

HIS\_ExeOutPatientRegister

#### 3.2.18.2用途

提供门诊患者挂号服务信息

#### 3.2.18.3业务请求消息BusinessRequest

| \<Request\>\<ScheduleDataBegin\>2021-10-21\</ScheduleDataBegin\>\<DeptId\>0001102105102\</DeptId\>\<DoctorId\>00005\</DoctorId\>\<ScheduleId\>1120\</ScheduleId\>\<RegId\>4330\</RegId\>\<SourceSystem\>HlwReserver\</SourceSystem\>\<SourceSystemMsg\>\</SourceSystemMsg\>\<PatientId\>0049091144\</PatientId\>\<MedCardNo\>190904199808109795\</MedCardNo\>\<PatientName\>蒙之定\</PatientName\>\<SourceOrderId\>\</SourceOrderId\>\<PayChannel\>支付宝\</PayChannel\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| DeptId | Request | 是 | str | 科室ID |
| DoctorId | Request | 是 | str | 医生ID |
| ScheduleId | Request | 是 | str | 班次ID |
| RegId | Request | 是 | str | 资源ID |
| SourceSystem | Request | 是 | str | 来源系统，排班接口中的OriginalId字段 |
| SourceSystemMsg | Request | 是 | str | 来源系统，排班接口中的OriginalName字段 |
| PatientId | Request | 是 | str | 患者ID |
| MedCardNo | Request | 是 | str | 院内就诊卡号 |
| PatientName | Request | 是 | str | 患者姓名 |
| SourceOrderId | Request | 是 | str | 第三方平台订单ID |
| **ScheduleDataBegin** | Request | 是 | str | 号源日期（yyyy-MM-dd） |

#### 3.2.18.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<Registr\>\<RegistrId\> **1000011010120** \</RegistrId\>\<BranchId\> **01** \</BranchId\>\<DeptId\> **001** \</DeptId\>\<DeptName\> **内科门诊** \</DeptName\>\<DoctorId\> **11111** \</DoctorId\>\<DoctorName\> **李医生** \</DoctorName\>\<PatientId\> **00001111** \</PatientId\>\<MedCardNo\> **4401000011112222** \</MedCardNo\>\<PatientName\> **张三** \</PatientName\>\<SourceOrderId\> **202101010001** \</SourceOrderId\>\<RegistrDate\> **2021-01-01** \</RegistrDate\>\<RegistrTime\> **08:00-09:00** \</RegistrTime\>\<SchedulePeriodId\> **A** \</SchedulePeriodId\>\<SchedulePeriodName\> **上午** \</SchedulePeriodName\>\<ConsultationRoom\> **001** \</ConsultationRoom\>\<RegistrSeq\> **33** \</RegistrSeq\>\<Fee\> **10** \</Fee\>\<VisitCode\> **1024** \</ VisitCode \>\<HisOrderId\> **2021010100000111** \</HisOrderId\>\<HisOrderStatus\> **0** \</HisOrderStatus\>\<EffectiveTime\> **2021-01-01 07:00:00** \</EffectiveTime\>\<Remark\> **请在半小时内完成缴费，否则订单自动取消** \</Remark\>\</Registr\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| Registr | Content | 节点 | 1..1，重复节点，一个节点为一个挂号信息 |
| RegistrId | Registr | str | 挂号ID，锁号ID |
| BranchId | Registr | str | 院区ID |
| DeptId | Registr | str | 科室ID |
| DeptMame | Registr | str | 科室名称 |
| DoctorId | Registr | str | 医生ID |
| DoctorName | Registr | str | 医生姓名 |
| ConsultationRoom | Registr | str | 诊室 |
| PatientId | Registr | str | 患者ID |
| MedCardNo | Registr | str | 院内就诊卡号 |
| PatientName | Registr | str | 患者姓名 |
| SourceOrderId | Registr | str | 第三方平台订单ID |
| RegistrDate | Registr | str | 挂号就诊日期 |
| RegistrTime | Registr | str | 就诊时间段 |
| SchedulePeriodId | Registr | str | 午别 |
| SchedulePeriodName | Registr | str | 午别名称 |
| RegistrSeq | Registr | str | 就诊序号 |
| Fee | Registr | str | 挂号费用 |
| HisOrderId | Registr | str | HIS订单ID |
| HisOrderStatus | Registr | str | 订单状态，0：已挂号未缴费，即锁号状态。1：已挂号已缴费，9：已退号 |
| EffectiveTime | Registr | str | 实际操作时间 |
| Remark | Registr | str | 挂号备注 |
| VisitCode | Registr | str | 就诊流水号 |

#### 3.2.18.5注意事项

无

### 3.2.19获取HIS患者基本信息 HIS\_GetPatientInfo

#### 3.2.19.1服务名 MessageCategory （消息类别）

HIS\_GetPatientInfo

#### 3.2.19.2用途

提供患者基本信息

#### 3.2.19.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<PatientName\> **张三** \</PatientName\>\<IDCardType\>\</IDCardType\>\<IDCardNo\>\</IDCardNo\>\<MedCardNo\> **4401000011110001** \</MedCardNo\>\<CityHealthCardNo\> **1** \</CityHealthCardNo\>\<ProvinceHealthCardNo\> **1** \</ProvinceHealthCardNo\>\<EMPI\>1111\</EMPI\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| PatientName | Request | 否 | str | 姓名 |
| Sex | Request | 否 | str | 性别 |
| IDCardType | Request | 否 | str | 证件类型 |
| IDCardNo | Request | 是 | str | 证件号码 |
| MedCardNo | Request | 是 | str | 院内就诊卡号 |
| CityHealthCardNo | Request | 否 | str | 广州市健康卡 |
| ProvinceHealthCardNo | Request | 否 | str | 广东省健康卡 |
| EMPI | Request | 否 | str | 患者主索引 |
| 注：证件号、就诊卡、广州市健康卡、主索引必须传其中之一，证件号与类型同时传就诊卡类型为MED\_ID，身份证号类型为1 |

#### 3.2.19.4返回业务数据BusinessResponse

| \<Result\> \<ResultCode\>0\</ResultCode\> \<ResultMessage\>\</ResultMessage\> \<Content\> \<Patient\> \<BranchId\>01\</BranchId\> \<PatientId\>张三\</PatientId\> \<PatientName\>张三\</PatientName\> \<Sex\>1\</Sex\> \<BirthDate\>1972-03-03\</BirthDate\> \<CardType\>\</CardType\> \<CardNo\>\</CardNo\> \<PatAddr\>\</PatAddr\> \<PatTel\>\</PatTel\> \<ContactName\>\</ContactName\> \<ContactAddr\>\</ContactAddr\> \<ContactTel\>\</ContactTel\> \<RelationShip\>\</RelationShip\> \<GuardianName\>张三丰\</GuardianName\> \<GuardianSex\>1\</GuardianSex\> \<GuardianCardType\>1\</GuardianCardType\> \<GuardianCardNo\>\</GuardianCardNo\> \<Marital\>\</Marital\> \<BloodType\>\</BloodType\> \<Nationality\>\</Nationality\> \<MedCardNo\>4401000011115555\</MedCardNo\> \<CityHealthCardNo\>8553166392DA27D66CD10C765FFE9CDB6B11AD87E2F20121E546F5B2DA0D4BF4:1::4403A0022APPB0115\</CityHealthCardNo\> \<ProvinceHealthCardNo\>\</ProvinceHealthCardNo\> \<EmpiId\>93d45163-f4f1-4707-9b56-3e945ad7d151\</EmpiId\> \</Patient\> \</Content\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result |
 | 0：成功，-1：失败 |
| ResultMessage | Result |
 | 失败详细信息 |
| Patient | Result | 节点 | 1..\*，重复节点，患者信息集合 |
| BranchId | Patient | str | 院区ID |
| PatientId | Patient | str | 患者ID |
| PatientName | Patient | str | 姓名 |
| Sex | Patient | str | 性别 |
| BirthDate | Patient | str | 出生日期 |
| CardType | Patient | str | 证件类型 |
| CardNo | Patient | str | 证件号码 |
| PatAddr | Patient | str | 患者地址 |
| PatTel | Patient | str | 患者电话 |
| ContactName | Patient | str | 联系人姓名 |
| ContactAddr | Patient | str | 联系人地址 |
| ContactTel | Patient | str | 联系人电话 |
| RelationShip | Patient | str | 联系人关系 |
| GuardianName | Patient | str | 监护人姓名，无身份证号儿童使用 |
| GuardianCardType | Patient | str | 监护人证件类型，无身份证号儿童使用 |
| GuardianCardNo | Patient | str | 监护人证件号码，无身份证号儿童使用 |
| Marital | Patient | str | 婚姻状况 |
| BloodType | Patient | str | ABO血型 |
| Nationality | Patient | str | 国籍 |
| MedCardNo | Patient | str | 院内就诊卡号 |
| CityHealthCardNo | Patient | str | 广州市健康卡号 |
| ProvinceHealthCardNo | Patient | str | 广东省健康卡号 |
| EMPI | Patient | str | 患者主索引 |

#### 3.2.19.5注意事项

无

### 3.2.20HIS门诊患者挂号退号 HIS\_ExeCancelRegister

#### 3.2.20.1服务名 MessageCategory （消息类别）

HIS\_ExeCancelRegister

#### 3.2.20.2用途

提供门诊患者挂号退号服务信息

#### 3.2.20.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\>02\</BranchId\>\<RegistrId\>463789\</RegistrId\>\<SourceOrderId\>AL20211020719526\</SourceOrderId\>\<HisOrderId\>string\</HisOrderId\>\<SourceSystem\>FD\_selfService\</SourceSystem\>\<SourceSystemMsg\>string\</SourceSystemMsg\>\<RegId\>7203\</RegId\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| RegistrId | Request | 是 | str | 挂号ID |
| SourceOrderId | Request | 是 | str | 第三方订单号 |
| HisOrderId | Request | 否 | str | HIS订单号 |
| SourceSystem | Request | 是 | str | 来源系统，排班接口中的OriginalId字段 |
| SourceSystemMsg | Request | 是 | str | 来源系统，排班接口中的OriginalName字段 |
| **RegId** | Request | 是 | Str | 号源id（同挂号） |

#### 3.2.20.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<Registr\>\<BranchId\> **001** \</BranchId\>\<RegistrId\> **1000011010120** \</RegistrId\>\<SourceOrderId\> **202101010001** \</SourceOrderId\>\<HisOrderId\> **2021010100000111** \</HisOrderId\>\<HisOrderStatus\>9\</HisOrderStatus\>\<Remark\>退号 **成功** \</Remark\>\</Registr\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| Registr | Content | 节点 | 1..1，重复节点，一个节点为一个支付信息 |
| BranchId | Registr | str | 院区ID |
| RegistrId | Registr | str | 挂号ID，锁号ID |
| SourceOrderId | Registr | str | 第三方订单ID |
| HisOrderId | Registr | str | HIS订单ID |
| HisOrderStatus | Registr | str | 订单状态，0：已挂号未缴费，即锁号状态。1：已挂号已缴费，2：现场已取号，3：现场已报到，4：已就诊，5：医生已停诊未通知，6：已停诊已通知，9：已退号，退号失败则返回原来状态，并提示失败原因 |
| Remark | Registr | str | 备注 |

#### 3.2.20.5注意事项

无

### 3.2.21HIS建档服务 HIS\_CreateMedCard

#### 3.2.21.1服务名 MessageCategory （消息类别）

HIS\_CreateMedCard

#### 3.2.21.2用途

为新患者创建患者基本信息

#### 3.2.21.3业务请求消息BusinessRequest

| \<Request\>\<PatientName\> **张三** \</PatientName\>\<Sex\> **1** \</Sex\>\<BirthDate\> **1972-03-03** \</BirthDate\>\<IDCardType\>\</IDCardType\>\<IDCardNo\>\</IDCardNo\>\<GuardianName\> **张三丰** \</GuardianName\>\<GuardianSex\> **1** \</GuardianSex\>\<GuardianIDCardType\> **1** \</GuardianIDCardType\>\<GuardianIDCardNo\>\</GuardianIDCardNo\>\<RelationShip\>\</RelationShip\>\<ContactAddr\>\</ContactAddr\>\<ContactTel\>\</ContactTel\>\<Marital\>\</Marital\>\<BloodType\>\</BloodType\>\<Nationality\>\</Nationality\>\<SourceSystem\> **互联网医院** \</SourceSystem\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| PatientName | Request | 是 | str | 姓名 |
| Sex | Request | 是 | str | 性别 |
| BirthDate | Request | 是 | str | 出生日期 |
| IDCardType | Request | 是 | str | 证件类型，居民身份证、中国人民解放军军人身份证件、中国人民武装警察身份证件、港澳居民来往内地通行证、台湾居民来往大陆通行证、护照、其他 |
| IDCardNo | Request | 是 | str | 证件号码 |
| GuardianName | Request | 否 | str | 监护人姓名，无身份证号儿童使用 |
| GuardianIDCardType | Request | 否 | str | 监护人证件类型，无身份证号儿童使用 |
| GuardianIDCardNo | Request | 否 | str | 监护人证件号码，无身份证号儿童使用 |
| RelationShip | Request | 否 | str | 关系 |
| ContactAddr | Request | 否 | str | 联系地址 |
| ContactTel | Request | 是 | str | 联系电话 |
| Marital | Request | 否 | str | 婚姻状况 |
| BloodType | Request | 否 | str | ABO血型 |
| Nationality | Request | 否 | str | 国籍 |
| SourceSystem | Request | 是 | str | 来源系统 |

#### 3.2.21.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<Patient\>\<PatientName\> **张三** \</PatientName\>\<PatientId\> **000002222** \</PatientId\>\<Sex\> **1** \</Sex\>\<BirthDate\> **1972-03-03** \</BirthDate\>\<IDCardType\>\</IDCardType\>\<IDCardNo\>\</IDCardNo\>\<GuardianName\> **张三丰** \</GuardianName\>\<GuardianSex\>男\</GuardianSex\>\<GuardianIDCardType\> **1** \</GuardianIDCardType\>\<GuardianIDCardNo\>\</GuardianIDCardNo\>\<RelationShip\>\</RelationShip\>\<ContactAddr\>\</ContactAddr\>\<ContactTel\>\</ContactTel\>\<Marital\>\</Marital\>\<BloodType\>\</BloodType\>\<Nationality\>\</Nationality\>\<MedCardNo\> **4401000011115555** \</MedCardNo\>\<CityHealthCardNo\> **8553166392DA27D66CD10C765FFE9CDB6B11AD87E2F20121E546F5B2DA0D4BF4:1::4403A0022APPB0115** \</CityHealthCardNo\>\<ProvinceHealthCardNo\>\</ProvinceHealthCardNo\>\</Patient\>\</Content\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result |
 | 0：成功，-1：失败 |
| ResultMessage | Result |
 | 失败详细信息 |
| PatientId | Patient | str | 患者ID |
| PatientName | Patient | str | 姓名 |
| Sex | Patient | str | 性别 |
| BirthDate | Patient | str | 出生日期 |
| IDCardType | Patient | str | 证件类型，居民身份证、中国人民解放军军人身份证件、中国人民武装警察身份证件、港澳居民来往内地通行证、台湾居民来往大陆通行证、护照、其他 |
| IDCardNo | Patient | str | 证件号码 |
| GuardianName | Patient | str | 监护人姓名，无身份证号儿童使用 |
| GuardianIDCardType | Patient | str | 监护人证件类型，无身份证号儿童使用 |
| GuardianIDCardNo | Patient | str | 监护人证件号码，无身份证号儿童使用 |
| RelationShip | Patient | str | 关系 |
| ContactAddr | Patient | str | 联系地址 |
| ContactTel | Patient | str | 联系电话 |
| Marital | Patient | str | 婚姻状况 |
| BloodType | Patient | str | ABO血型 |
| Nationality | Patient | str | 国籍 |
| MedCardNo | Patient | str | 院内就诊卡号 |
| CityHealthCardNo | Patient | str | 广州市健康卡号 |
| ProvinceHealthCardNo | Patient | str | 广东省健康卡号 |
| EMPI | Patient | str | 患者主索引 |

#### 3.2.21.5注意事项

无

### 3.2.22HIS门诊患者挂号缴费 HIS\_ExepayRegister

#### 3.2.22.1服务名 MessageCategory （消息类别）

HIS\_ExepayRegister

#### 3.2.22.2用途

提供门诊患者挂号缴费信息

#### 3.2.22.3业务请求消息BusinessRequest

| \<Request\>\<RegistrId\> **1000011010120** \</RegistrId\>\<SourceOrderId\> **202101010001** \</SourceOrderId\>\<HisOrderId\> **2021010100000111** \</HisOrderId\>\<Fee\> **10** \</Fee\>\<PayChannel\> **支付宝** \</PayChannel\>\<PaySerialNo\> **20210000000001** \</PaySerialNo\>\<PayTime\> **2021-01-01 07:00:00.000** \</PayTime\>\<PayAccount\> **66121661046254** \</PayAccount\>\<SourceSystem\> **自助机** \</SourceSystem\>\<SourceSystemMsg\> **编号**** 01**\</SourceSystemMsg\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| RegistrId | Request | 是 | str | 挂号ID |
| SourceOrderId | Request | 是 | str | 第三方订单号 |
| HisOrderId | Request | 否 | str | HIS订单号 |
| Fee | Request | 否 | str | 金额 |
| PayChannel | Request | 否 | str | 支付渠道，银行卡、支付宝、微信等，中文 |
| PaySerialNo | Request | 是 | str | 支付平台流水号 |
| PayTime | Request | 是 | str | 支付平台支付时间 |
| PayAccount | Request | 是 | str | 支付账号 |
| SourceSystem | Request | 是 | str | 来源系统，微信、自助机、互联网医院等 |
| SourceSystemMsg | Request | 是 | str | 来源系统信息，自助机编号等 |

#### 3.2.22.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<PayInfo\>\<RegistrId\> **1000011010120** \</RegistrId\>\<SourceOrderId\> **202101010001** \</SourceOrderId\>\<HisOrderId\> **2021010100000111** \</HisOrderId\>\<PayStatus\> **1** \</PayStatus\>\<PayRemark\> **支付成功** \</PayRemark\>\<InvoiceNo\> **发票号** \</InvoiceNo\>\<ElectronicInvoiceUrl\> **sdasggfdsfasdasd** \</ElectronicInvoiceUrl\>\<ElectronicInvoiceType\> **PDF** \</ElectronicInvoiceType\>\<ElectronicInvoiceContent\> **dafsafausadbahdbsfa** \</ElectronicInvoiceContent\>\</PayInfo\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| PayInfo | Content | 节点 | 1..1，重复节点，一个节点为一个支付信息 |
| RegistrId | Registr | str | 挂号ID，锁号ID |
| SourceOrderId | Registr | str | 第三方订单ID |
| HisOrderId | Registr | str | HIS订单ID |
| PayStatus | Registr | str | 支付状态：0：支付失败，1：支付成功 |
| PayRemark | Registr | str | 备注 |
| InvoiceNo | Registr | str | 发票号 |
| ElectronicInvoiceUrl | Registr | str | 电子发票URL（保留） |
| ElectronicInvoiceType | Registr | str | 电子发票实体类型，PDF、JPG |
| ElectronicInvoiceContent | Registr | str | 电子发票实体转Base64后字符串 |

#### 3.2.22.5注意事项

无

### 3.2.23获取HIS门诊科室医生排班信息 HIS\_GetScheduleInfo

#### 3.2.23.1服务名 MessageCategory （消息类别）

HIS\_GetScheduleInfo

#### 3.2.23.2用途

提供门诊科室医生排班信息

#### 3.2.23.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<DeptId\> **001** \</DeptId\>\<DoctorId\> **0001** \</DoctorId\>\<RegistrDateBegin\> **2021-01-01** \</RegistrDateBegin\>\<RegistrDateEnd\> **2021-01-02** \</RegistrDateEnd\>\<OriginalId\>Hospital\</OriginalId\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| DeptId | Request | 是 | str | 科室ID |
| DoctorId | Request | 否 | str | 医生ID |
| **RegistrDateBegin** | Request | 否 | str | 查询排班开始时间 |
| **RegistrDateEnd** | Request | 否 | str | 查询排班结束时间 |
| OriginalId | Request | ~~是~~ 否 | str | 号源池ID，区分各种渠道预留号：Bkwxgzh（倍康微信公众号），Hospital（院内预约），FD\_selfService（方鼎自助服务），sptReserver（省平台预约），HlwReserver（互联网预约） |

#### 3.2.23.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<Schedule\>\<BranchId\> **001** \</BranchId\>\<DeptId\> **001** \<DeptId\>\<DeptMame\> **内科门诊** \</DeptMame\>\<ConsultationRoom\> **001** \</ConsultationRoom\>\<DoctorId\> **0002** \</DoctorId\>\<DoctorName\> **李医生** \</DoctorName\>\<DoctorTitle\> **主任医师** \</DoctorTitle\>\<DoctorDesc\> **医师简介** \</DoctorDesc\>\<ScheduleDate\> **2021-01-01** \</ScheduleDate\>\<ScheduleDayOfWeek\> **星期一** \</ScheduleDayOfWeek\>\<ScheduleId\> **177169** \</ScheduleId\>\<ScheduleType\> **1** \</ScheduleType\>\<ScheduleStatus\> **1** \</ScheduleStatus\>\<Fee\> **10** \</Fee\>\<SchedulePeriodId\> **A** \</SchedulePeriodId\>\<SchedulePeriodName\> **上午** \</SchedulePeriodName\>\<TimeFrame\>\<!--分时段资源类型--\>\<RegId\> **10101** \</RegId\>\<OriginalId\> **Hospital** \</OriginalId\>\<OriginalName\> **通用预约渠道** \</OriginalName\>\<TotalFrameNumber\> **20** \</TotalFrameNumber\>\<RemainNumber\> **10** \</RemainNumber\>\<TimeBegin\> **2021-01-01 08:00** \</TimeBegin\>\<TimeEnd\> **2021-01-01 09:00:00** \</TimeEnd\>\</TimeFrame\>\<TimeFrame\> **......** \</TimeFrame\>\</Schedule\>\<Schedule\> **......** \</Schedule\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| Schedule | Content | 节点 | 1..\*，重复节点，一个节点为一个排班信息 |
| BranchId | Schedule | str | 院区ID |
| DeptId | Schedule | str | 科室ID |
| DeptMame | Schedule | str | 科室名称 |
| ConsultationRoom | Schedule | str | 诊室 |
| DoctorId | Schedule | str | 排班医生ID |
| DoctorName | Schedule | str | 排班医生姓名 |
| DoctorTitle | Schedule | str | 排班医生职称 |
| DoctorDesc | Schedule | str | 医生简介 |
| ScheduleDate | Schedule | str | 排班日期 |
| ScheduleDayOfWeek | Schedule | str | 星期一、星期二...... |
| ScheduleId | Schedule | str | 班次ID |
| ScheduleType | Schedule | str | 排班类型，1普通，2专家，3特需9其他，区分普通号专家 |
| ScheduleStatus | Schedule | str | 状态，1有号，2无号，3停诊 |
| Fee | Schedule | str | 挂号费用 |
| SchedulePeriodId | Schedule | str | A上午，P下午，N晚上，F全天 |
| SchedulePeriodName | Schedule | str | 上午，下午，晚上，全天 |
| TimeFrame | Schedule | 节点 | 分时段预约节点，重复1..\* |
| RegId | TimeFrame | str | 资源ID |
| OriginalId | TimeFrame | str | 号源池ID |
| OriginalName | TimeFrame | str | 号源池名称 |
| TotalFrameNumber | TimeFrame | str | 号源总数 |
| RemainNumber | TimeFrame | str | 剩余号源数 |
| TimeBegin | TimeFrame | str | 分时段开始时间 |
| TimeEnd | TimeFrame | str | 分时段结束时间 |

#### 3.2.23.5注意事项

无

### 3.2.24获取HIS门诊科室列表 HIS\_GetOutDeptInfo

#### 3.2.24.1服务名 MessageCategory （消息类别）

HIS\_GetOutDeptInfo

#### 3.2.24.2用途

提供门诊科室列表信息

#### 3.2.24.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<DeptId\> **001** \</DeptId\>\<ParentDeptId\> **002** \</ParentDeptId\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| DeptId | Request | 是 | str | 科室ID |
| ParentDeptId | Request | 否 | str | 父科室ID |

#### 3.2.24.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<Dept\>\<BranchId\> **001** \</BranchId\>\<DeptId\> **001** \<DeptId\>\<DeptMame\> **内科门诊** \</DeptMame\>\<ParentDeptId\> **002** \</ParentDeptId\>\<ParentDeptName\> **门诊** \</ParentDeptName\>\<DeptSerialNo\> **1** \</DeptSerialNo\>\<ScheduleCount\> **11** \</ScheduleCount\>\<DeptDesc\> **科室介绍** \</DeptDesc\>\<DeptSite\> **5**** 楼 **\</DeptSite\>\<DeptStatus\>1\</DeptStatus\>\<DeptRegType\>1\</DeptRegType\>\</Dept\>\<Dept\>**......**\</Dept\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result |
 | 0：成功，-1：失败 |
| ResultMessage | Result |
 | 失败详细信息 |
| BranchId | Dept | str | 院区ID |
| DeptId | Dept | str | 科室ID |
| DeptMame | Dept | str | 科室名称 |
| ParentDeptId | Dept | str | 父科室ID |
| ParentDeptName | Dept | str | 父科室名称 |
| DeptSerialNo | Dept | str | 科室序号（排序用） |
| ScheduleCount | Dept | str | 排班医生数量 |
| DeptDesc | Dept | str | 科室简介 |
| DeptSite | Dept | str | 科室位置 |
| DeptStatus | Dept | str | 科室状态，1:启用，0：停用 |
| DeptRegType | Dept | str | 是否排班科室，1：是 |

#### 3.2.24.5注意事项

无

### 3.2.25住院费用查询 HIS\_GetInpatientFeeInfo

#### 3.2.25.1服务名 MessageCategory （消息类别）

HIS\_GetInpatientFeeInfo

#### 3.2.25.2用途

查询患者住院费用信息

#### 3.2.25.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\> \<InpatientCode\> **4030202712** \</InpatientCode\> \<PatientName\> **蒋晓月** \</PatientName\> \<OperCode\> **000001** \</OperCode\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| InpatientCode | Request | 是 | str | 住院号 |
| PatientName | Request | 是 | str | 姓名 |
| OperCode | Request | 否 | str | 操作员 |
| 注:支付方式为医保支付时，HIS自行调用医保支付接口，非医保移动支付及医保互联网支付使用。 |

#### 3.2.25.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\> **0** \</ResultCode\>\<ResultMessage\>\</ResultMessage\> \<PrepayAmount\> **1000.0** \</PrepayAmount\> \<UsedAmount\> **216.2** \</UsedAmount\> \<RemainAmount\> **783.8** \</RemainAmount\>\<BranchId\>01\</BranchId\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| PrepayAmount | Result | str | 预交金 |
| UsedAmount | Result | str | 使用金额 |
| RemainAmount | Result | str | 剩余金额 |
| BranchId | Result | str | 院区ID |

#### 3.2.25.5注意事项

支付方式为医保支付时，HIS自行调用医保支付接口，非医保移动支付及医保互联网支付使用。

### 3.2.26住院一日费用清单 HIS\_GetDayReportInfo

#### 3.2.26.1服务名 MessageCategory （消息类别）

HIS\_GetDayReportInfo

#### 3.2.26.2用途

查询住院患者指定日期费用明细

#### 3.2.26.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<InpatientCode\> **4030202712** \</InpatientCode\>\<PatientName\> **蒋晓月** \</PatientName\>\<FeeDate\> **2020**** - ****09**** - ****24** \</FeeDate\>\<OperCode\> **000001** \</OperCode\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| InpatientCode | Request | 是 | String | 住院号 |
| PatientName | Request | 是 | String | 姓名 |
| FeeDate | Request | 是 | Date | 费用时间 |
| OperCode | Request | 否 | String | 操作员 |

#### 3.2.26.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<FeeType\> **检查费** \</FeeType\>\<Amount\> **328.00** \</Amount\>\<Count\> **1** \</Count\>\<Price\> **328.00** \</Price\>\<BranchId\> **01** \</BranchId\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | Str | 0:成功，-1：失败 |
| ResultMessage | Result | Str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| FeeType | Result | varchar2(4) | 费用类型 |
| Amount | Result | Number(12,6) | 总金额 |
| Count | Result | Number(4) | 数量 |
| Price | Result | Number(12,6) | 单价 |
| BranchId | Result | Str | 院区ID |

#### 3.2.26.5注意事项

无

### 3.2.27­住院押金补缴 HIS\_PayDeposit

#### 3.2.27.1服务名 MessageCategory （消息类别）

HIS\_PayDeposit

#### 3.2.27.2用途

查询住院患者交预交金

#### 3.2.27.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<PatientName\> **蒋晓月** \</PatientName\>\<PrepayAmount\> **2000.00** \</PrepayAmount\>\<InpatientCode\> **4030202712** \</InpatientCode\>\<OrderID\> **EHXXXXXXXXXXX** \</OrderID\>\<PayType\> **WeChat** \</PayType\>\<PayDateTime\> **2020-11-23 12:12:11** \</PayDateTime\>\<OperCode\> **000001** \</OperCode\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| PatientName | Request | 是 | String | 姓名 |
| PrepayAmount | Request | 否 | String | 金额 |
| InpatientCode | Request | 是 | String | 住院号 |
| OrderID | Request | 是 | String | 交易订单号 |
| PayType | Request | 是 | String | 支付类型 |
| PayDateTime | Request | 是 | Date | 支付时间 |
| OperCode | Request | 否 | String | 操作员 |

#### 3.2.27.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<InvoiceNo\> **2098838761** \</InvoiceNo\>\<BussinessID\> **388732** \</BussinessID\>\<BranchId\> **01** \</BranchId\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | Str | 0:成功，-1：失败 |
| ResultMessage | Result | Str | 失败详细信息 |
| InvoiceNo | Result | varchar2(16) | 发票号 |
| BussinessID | Result | Number(18) | HIS业务ID |
| BranchId | Result | Str | 院区ID |

#### 3.2.27.5注意事项

无

### 3.2.28HIS危急值通知 HIS\_CVPNotice

#### 3.2.28.1服务名 MessageCategory （消息类别）

HIS\_CVPNotice

#### 3.2.28.2用途

危急值通知

#### 3.2.28.3业务请求消息BusinessRequest

| \<Request\> ~~\<InParam\>~~ \<notice\> \<applicationId\> **1099892** \</applicationId\> \<crisisId\> **1234567** \</crisisId\> \<descript\> **晚期妊娠出现羊水过少**** , ****羊水指数小于**** 3cm, ****胎儿心率大于**** 160 ****次**** / ****分或小于**** 120 ****次**** / ****分** \</descript\> \<disableFlag\> **0** \</disableFlag\> \<patientType\> **2** \</patientType\> \<reportTime\> **2020-09-24 10:21:22** \</reportTime\> \<reportUserId\> **009999** \</reportUserId\> \<reportorgcodereportOrgcode\> **00013104** \</reportorgcodereportOrgcode\> \<Sourceflag\<sourceflag\> **PACS** \</Sourceflagsourceflag\> \<inpatientCode\>21090140\</inpatientCode\>\<visitCode\>1849\</visitCode\>\<orgCode\>0001102110\</orgCode\>\<doctorCode\>000102\</doctorCode\>\<orderServiceCode\>50021376\</orderServiceCode\>\<orderServiceName\>彩超腹部（肝胆胰脾肾）\</orderServiceName\>\</notice\> ~~\</InParam\>~~ \</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| applicationId | Request | 是 | str | 申请单ID |
| crisisId | Request | 是 | str | 危急值ID |
| descript | Request | 是 | str | 危急值描述 |
| disableFlag | Request | 是 | str | 状态1新建0取消 |
| patientType | Request | 是 | str | 患者类型 |
| reportTime | Request | 是 | str | 上报时间 |
| reportUserId | Request | 是 | str | 上报人 |
| reportorgcode | Request | 是 | str | 上报科室 |
| sourceflag | Request | 是 | str | 来源：LIS、PACS、PEIS |
| inpatientCode | Request | 是 | str | 门诊就诊卡/住院号 |
| visitCode | Request | 否 | str | 就诊流水号 |
| orgCode | Request | 是 | str | 医嘱开立科室 |
| doctorCode | Request | 是 | str | 开立医生编码 |
| orderServiceCode | Request | 是 | str | 项目编码 |
| orderServiceName | Request | 是 | str | 项目名称 |

#### 3.2.28.4返回业务数据 BusinessResponse

| \<Result\>\<message\>\<statusCode\> **0** \</statusCode\>\<message\> **操作成功** \</message\>\</message\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| StatusCode | Result | str | 0：成功，-1：失败 |
| Message | Result | str | 失败详细信息 |

#### 3.2.28.5注意事项

### 3.2.29HIS危急值电话通知 HIS\_CVPTelNotice

#### 3.2.29.1服务名 MessageCategory （消息类别）

HIS\_CVPTelNotice

#### 3.2.29.2用途

~~危急值电话通知~~

用于医技科室在某些情况（如临床科室答复超时）下，电话通知临床科室，然后在医技系统手工补录电话沟通过程（含临床科室答复内容）。医技系统调用本接口，把补录的内容推送消息给HIS，完成危机值管理流程。

#### 3.2.29.3业务请求消息BusinessRequest

| \<Request\> ~~\<InParam\>~~ \<telephoneNotice\> \<crisisId\> **1111** \</crisisId\> \<isTelephoneNotice\> **1** \</isTelephoneNotice\> \<telephoneNoticeTime\> **2019-09-25 00:00:00** \</telephoneNoticeTime\> \<noticeUserID\> **1111** \</noticeUserID\> \<noticeRemark\> **1111** \</noticeRemark\> \</telephoneNotice\> ~~\</InParam\>~~ \</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| crisisId | Request | 是 | str | 危急值ID |
| isTelephoneNotice | Request | 是 | str | 是否电话通知 |
| telephoneNoticeTime | Request | 是 | str | 电话通知时间 |
| noticeUserID | Request | 是 | str | 通知人 |
| noticeRemark | Request | 是 | str | 备注 |

#### 3.2.29.4返回业务数据 BusinessResponse

| \<Result\>\<message\>\<statusCode\> **0** \</statusCode\>\<message\> **操作成功** \</message\>\</message\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| StatusCode | Result | str | 0：成功，-1：失败 |
| Message | Result | str | 失败详细信息 |

#### 3.2.29.5注意事项

### 3.2.30HIS危急值答复 ~~通知~~ 查询 HIS\_CVPReplyNotice

#### 3.2.30.1服务名 MessageCategory （消息类别）

HIS\_CVPReplyNotice

#### 3.2.30.2用途

~~危急值答复通知~~

提供给医技系统轮询临床科室答复状态及内容。正常情况下，HIS在临床科室医生或护士在系统中确认接收危机值并答复后，调用对应医技系统的危机值处理接口（），推送消息给医技科室。医技系统也可以通过本接口主动轮询，以防止HIS推送失败耽误处置。

医技系统需要注意轮询的周期不能过于频密，以免增加服务器负荷，并且在收到HIS推送确认消息或通过本接口查询到答复后，必须马上停止轮询。

#### 3.2.30.3业务请求消息BusinessRequest

| \<Request\> ~~\<BranchId\> **01** \</BranchId\>~~~~ \<CrisisId\> **1111** \</CrisisId\> ~~~~\<Responsetime\> **2020-09-24 10:21:22** \</Responsetime\>~~~~ \<Responsename\> **管理员** \</Responsename\> ~~~~\<Response\> **已确认** \</Response\>~~ \<response\> \<crisisId\>123456\</crisisId\>\</response\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| ~~BranchId~~ | ~~Request~~ | ~~是~~ | ~~str~~ | ~~院区ID~~ |
| CrisisId | Request | 是 | VARCHAR2(16) | 危急值ID |
| ~~Responsetime~~ | ~~Request~~ | ~~是~~ | ~~VARCHAR2(16)~~ | ~~答复时间~~ |
| ~~Responsename~~ | ~~Request~~ | ~~是~~ | ~~VARCHAR2(16)~~ | ~~答复人~~ |
| ~~Response~~ | ~~Request~~ | ~~是~~ | ~~VARCHAR2(64)~~ | ~~答复内容~~ |

#### 3.2.30.4返回业务数据 BusinessResponse

| \<Result\> ~~\<ResultCode\> **0** \</ResultCode\>~~~~ \<ResultMessage\> **操作成功** \</ResultMessage\> ~~~~\<BranchId\> **01** \</BranchId\>~~ \<ResultCode \<statusCode\>0\</ResultCodestatusCode\>\<ResultMessage\> **操作成功** \</ResultMessage\>\<BranchId\> **01** \</BranchId\>\<message\>成功\</message\>\<data\>\<id\>881\</id\>\<crisisId\>123456\</crisisId\>\<reportUser\>009999\</reportUser\>\<reportDate\>2019-12-08T22:04:10+08:00\</reportDate\>\<responseValue\>晚期妊娠出现羊水过少,羊水指数小于3cm,胎儿心率大于160次/分或小于120次/分\</responseValue\>\<patName\>朱\*\</patName\>\<bedName\>35\</bedName\>\</data\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ~~ResultCode~~ | ~~Result~~ | ~~Str~~ | ~~0:成功，-1：失败~~ |
| ~~ResultMessage~~ | ~~Result~~ | ~~Str~~ | ~~结果内容~~ |
| ~~BranchId~~ | ~~Result~~ | ~~Str~~ | ~~院区ID~~ |
| statusCode | Result | Str | 0:成功，-1：失败 |
| message | Result | Str | 结果内容 |
| id | Result | Str | HIS危急值ID |
| crisisId | Result | Str | 上报危机值ID |
| responseUser | Result | Str | 答复人 |
| responseDate | Result | Str | 答复时间 |
| responseValue | Result | Str | 答复值 |
| patName | Result | Str | 姓名 |
| bedName | Result | Str | 床位 |

#### 3.2.30.5注意事项

~~无~~

医技系统需要注意轮询的周期不能过于频密，以免增加服务器负荷，并且在收到HIS推送确认消息或通过本接口查询到答复后，必须马上停止轮询。

### 3.2.31HIS危急值取消通知 HIS\_CVPCancelNotice

#### 3.2.31.1服务名 MessageCategory （消息类别）

HIS\_CVPCancelNotice

#### 3.2.31.2用途

危急值取消通知

#### 3.2.31.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<CrisisId\> **1111** \</CrisisId\>\<DisableFlag\> **0** \</DisableFlag\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| CrisisId | Request | 是 | VARCHAR2(16) | 危急值ID |
| DisableFlag | Request | 是 | VARCHAR2(16) | 取消通知 |

#### 3.2.31.4返回业务数据 BusinessResponse

| \<Result\>\<ResultCode\> **0** \</ResultCode\>\<ResultMessage\> **操作成功** \</ResultMessage\>\<BranchId\> **01** \</BranchId\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | Str | 0:成功，-1：失败 |
| ResultMessage | Result | Str | 结果内容 |
| BranchId | Result | Str | 院区ID |

#### 3.2.31.5注意事项

无

### 3.2.32HIS查询住院号 HIS\_QueryInPatient

#### 3.2.32.1服务名 MessageCategory （消息类别）

HIS\_QueryInPatient

#### 3.2.32.2用途

查询住院号

#### 3.2.32.3业务请求消息BusinessRequest

| \<Request\>\<BranchId\> **01** \</BranchId\>\<VisitCode\> **21080094** \</VisitCode\>\<IDCardNo\>\</IDCardNo\>\<PatMiCode\>\</PatMiCode\>\<DisableFlag\> **0** \</DisableFlag\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| BranchId | Request | 是 | str | 院区ID |
| VisitCode | Request | 是 | str | 就诊卡号 |
| IDCardNo | Request | 否 | str | 身份证号 |
| PatMiCode | Request | 否 | str | 病人ID |

#### 3.2.32.4返回业务数据 BusinessResponse

| \<Result\>\<ResultCode\> **0** \</ResultCode\>\<ResultMessage\> **操作成功** \</ResultMessage\>\<PatientId\> **724551** \</PatientId\>\<InpNo\> **2021000412** \</InpNo\>\<PatientName\> **姓名** \</PatientName\>\<PatMiCode\> **1111** \</PatMiCode\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | Str | 0:成功，-1：失败 |
| ResultMessage | Result | Str | 结果内容 |
| Visit | Result | Str | 患者本次就诊ID |
| InpNo | Result | Str | 住院号 |
| PatientName | Result | Str | 姓名 |
| PatMiCode | Result | Str | 病人ID |

#### 3.2.32.5注意事项

无

## 3.3EMR提供接口

### 3.3.1获取患者诊断信息 EMR\_Diagnosis

#### 3.3.1.1服务名 MessageCategory （消息类别）

EMR\_Diagnosis

#### 3.3.1.2用途

提供患者诊断信息

#### 3.3.1.3业务请求消息BusinessRequest

| \<?xmlversion= **"1.0"** encoding= **"utf-8"**?\>\<EmrParameters\>\<ADMINISSION\_DATE\_TIMELOW= **"2017-01-01 00:00:00"** HEIGHT= **"2017-01-01 00:00:00"** /\>\<DISCHARGE\_DATE\_TIMELOW= **"2017-01-01 00:00:00"** HEIGHT= **"2017-01-01 00:00:00"** /\>\<LAST\_MODIFY\_DATE\_TIMELOW= **"2017-01-01 00:00:00"** HEIGHT= **"2017-01-01 00:00:00"** /\>\<PATIENT\_IDVALUE= **"100000401214"** /\>\<VISIT\_IDVALUE= **"1"** /\>\<INP\_NOVALUE= **"293045"** /\>\<OUTPATIENT\_NOVALUE= **"100000401214"** /\>\</EmrParameters\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| ADMINISSION\_DATE\_TIME | EmrParameters | 各个条件之间为AND关系，参数条件有且最少一个，可任意组合。 | str | 入院时间条件，查询时间段内患者诊断数据，属性LOW为开始时间，属性HEIGHT为结束时间 |
| DISCHARGE\_DATE\_TIME | EmrParameters | str | 出院时间条件，查询时间段内患者诊断数据，属性LOW为开始时间，属性HEIGHT为结束时间。 |
| LAST\_MODIFY\_DATE\_TIME | EmrParameters | str | 最后修改时间条件，查询时间段内患者诊断数据，属性LOW为开始时间，属性HEIGHT为结束时间 |
| PATIENT\_ID | EmrParameters | str | 住院流水号字段，相关值填入VALUE属性。 |
| VISIT\_ID | EmrParameters | str | 住院次数字段，相关值填入VALUE字段。 |
| INP\_NO | EmrParameters | str | 住院号字段，相关值填入VALUE属性。 |
| OUTPATIENT\_NO | EmrParameters | str | 门诊号字段，相关值填入VALUE属性 |

#### 3.3.1.4返回业务数据 BusinessResponse

| \<?xmlversion= **"1.0"** encoding= **"UTF-8"**?\>\<EmrDiagnosis\>\<Diagnosis\>\<FILE\_VISIT\_TYPE\> **2** \</FILE\_VISIT\_TYPE\>\<PATIENT\_ID\> **100000399949** \</PATIENT\_ID\>\<VISIT\_ID\> **4** \</VISIT\_ID\>\<INP\_NO\> **257736** \</INP\_NO\>\<NAME\> **林德顺** \</NAME\>\<ADMISSION\_DATE\_TIME\> **2017-08-23 15:42:15** \</ADMISSION\_DATE\_TIME\>\<DISCHARGE\_DATE\_TIME\> **2017-09-05 08:00:00** \</DISCHARGE\_DATE\_TIME\>\<TYPE\> **病历诊断** \</TYPE\>\<DIAGNOSIS\_FLAG\> **西医** \</DIAGNOSIS\_FLAG\>\<DIAGNOSIS\_TYPE\_NAME\> **初步诊断** \</DIAGNOSIS\_TYPE\_NAME\>\<DIAGNOSIS\_NO\> **1** \</DIAGNOSIS\_NO\>\<DIAGNOSIS\_SUB\_NO\> **0** \</DIAGNOSIS\_SUB\_NO\>\<ID\> **1** \</ID\>\<PARENTID\> **0** \</PARENTID\>\<DIAGNOSIS\_DATE\> **2017-08-23T15:43:20+08:00** \</DIAGNOSIS\_DATE\>\<DIAGNOSIS\_DESC\> **高血压** \</DIAGNOSIS\_DESC\>\<DIAGNOSIS\_CODE\> **I10.X09** \</DIAGNOSIS\_CODE\>\<DIAGNOSIS\_NAME\> **高血压** \</DIAGNOSIS\_NAME\>\</Diagnosis\>\</EmrDiagnosis\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| FILE\_VISIT\_TYPE | Diagnosis | 否 | str | 0：门诊 2：住院 |
| PATIENT\_ID | Diagnosis | 否 | str |
 |
| VISIT\_ID | Diagnosis | 否 | str |
 |
| INP\_NO | Diagnosis | 否 | str |
 |
| NAME | Diagnosis | 否 | str |
 |
| ADMISSION\_DATE\_TIME | Diagnosis | 否 | Datetime |
 |
| ADMISSION\_DATE\_TIME | Diagnosis | 否 | Datetime |
 |
| TYPE | Diagnosis | 否 | str | 值为病历诊断或首页诊断 |
| DIAGNOSIS\_FLAG | Diagnosis | 否 | str | 值为中医或西医 |
| DIAGNOSIS\_TYPE\_NAME | Diagnosis | 否 | str | 初步诊断、补充诊断、修正诊断、确定诊断、最后诊断。门诊诊断、入院初诊、出院诊断、病理诊断、损伤和中毒的外部原因 |
| DIAGNOSIS\_NO | Diagnosis | 否 | str | 诊断排序序号（以诊断类型分组），子诊断序号跟父诊断序号相同 |
| DIAGNOSIS\_SUB\_NO | Diagnosis | 否 | str |
 |
| ID | Diagnosis | 否 | str | 诊断ID号 |
| PARENTID | Diagnosis | 否 | str | 父诊断ID号 |
| DIAGNOSIS\_DATE | Diagnosis | 否 | Datetime |
 |
| DIAGNOSIS\_DESC | Diagnosis | 否 | str |
 |
| DIAGNOSIS\_CODE | Diagnosis | 否 | str |
 |
| DIAGNOSIS\_NAME | Diagnosis | 否 | str |
 |

#### 3.3.1.5注意事项

无

### 3.3.2获取EMR文书内容信息接口 EMR\_GetAllFile

#### 3.3.2.1服务名 MessageCategory （消息类别）

EMR\_GetAllFile

#### 3.3.2.2用途

提供EMR文书内容信息

#### 3.3.2.3业务请求消息BusinessRequest

| \<?xml version="1.0" encoding="utf-8" ?\>\<EmrParameters\>\<ADMINISSION\_DATE\_TIME LOW="" HEIGHT=""/\>\<DISCHARGE\_DATE\_TIME LOW="" HEIGHT=""/\>\<LAST\_MODIFY\_DATE\_TIME LOW="" HEIGHT=""/\>\<PATIENT\_ID VALUE=""/\>\<VISIT\_ID VALUE=""/\>\<INP\_NO VALUE=""/\>\<OUTPATIENT\_NO VALUE=""/\>\</EmrParameters\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| ADMINISSION\_DATE\_TIME | EmrParameters | 各个条件之间为AND关系，参数条件有且最少一个，可任意组合。 | str | 入院时间，查询范围分别填入LOW与HEIGHT属性中 |
| DISCHARGE\_DATE\_TIME | EmrParameters | str | 出院时间，询范围分别填入LOW与HEIGHT属性中 |
| LAST\_MODIFY\_DATE\_TIME | EmrParameters | str | 文书最后修改时，查询范围分别填入LOW与HEIGHT属性中 |
| PATIENT\_ID | EmrParameters | str | 患者住院号，值填入VALUE属性中 |
| VISIT\_ID | EmrParameters | str | 住院次数，值填入VALUE属性中 |
| INP\_NO | EmrParameters | str | 住院号，值填入VALUE属性中 |
| OUTPATIENT\_NO | EmrParameters | str | 门诊号，值填入VALUE属性中 |

#### 3.3.2.4返回业务数据 BusinessResponse

| \<Response\>\<ResponseStatus\>1\</ResponseStatus\>\<ResponseMessage /\>\<ResponseTime\>2019-10-18 15:42:53\</ResponseTime\>\<Content\>\<ROW\>\<FILE\_VISIT\_TYPE\>2\</FILE\_VISIT\_TYPE\>\<FILE\_UNIQUE\_ID\>2\</FILE\_UNIQUE\_ID\>\<PATIENT\_ID\>100000523085\</PATIENT\_ID\>\<VISIT\_ID\>1\</VISIT\_ID\>\<INP\_NO\>346109\</INP\_NO\>\<OUTPATIENT\_NO/\>\<NAME\>黄焯炼\</NAME\>\<ADMISSION\_DATE\_TIME\>2019/10/9 9:32:28\</ADMISSION\_DATE\_TIME\>\<DISCHARGE\_DATE\_TIME/\>\<LAST\_MODIFY\_DATE\_TIME\>2019/10/18 9:15:19\</LAST\_MODIFY\_DATE\_TIME\>\<CREATOR\_ID\>0000229\</CREATOR\_ID\>\<CREATOR\_NAME\>宁卫兵\</CREATOR\_NAME\>\<CREATE\_DATE\_TIME\>2019/10/18 9:12:10\</CREATE\_DATE\_TIME\>\<CAPTION\_DATE\_TIME\>2019/10/17 11:12:00\</CAPTION\_DATE\_TIME\>\<TOPIC\>日常病程记录\</TOPIC\>\<LAST\_MODIFY\_USER\_ID\>0000229\</LAST\_MODIFY\_USER\_ID\>\<LAST\_MODIFY\_USER\_NAME\>宁卫兵\</LAST\_MODIFY\_USER\_NAME\>\<MR\_CONTENT\_TEXXT\>2019-10-17 11:12　　　　　 患者精神可，诉腰痛、双膝痹痛明显好转，左膝关节肿胀减轻，站立行走时疼痛减轻，无跛行，无头晕眼花，咽中有痰，无气促，无心悸胸闷，胃纳睡眠一般，大小便正常，舌质红，舌苔黄厚，脉滑。查体：体温(℃):36.3 脉搏(次/分):74 呼吸(次/分):20 血压(mmHg):134/70。形体肥胖，心率74次/分，心律齐整，心音正常，未闻及额外心音，未闻及杂音，未闻及心包摩擦音。无异常血管征。左膝关节无肿胀、轻压痛，局部肤温正常。2019-10-15 体检组合：丙氨酸氨基转氨酶 34.4(U/L)，天冬氨酸氨基转移酶 21.7(U/L)，尿素 3.96(mmol/L)，肌酐 104(umol/L)，尿酸 638(umol/L)↑，血糖 4.97(mmol/L)，总胆固醇 3.74(mmol/L)，甘油三酯 2.76(mmol/L)↑。患者尿酸、甘油三酯较前降低，继续目前予改善循环、营养神经、降尿酸、降血脂、护胃、针灸、理疗等对症支持治疗。停双氯芬酸钠缓释片。中药守上方×3（18-20/10）。 宁卫兵 \</MR\_CONTENT\_TEXXT\>\<MR\_CONTENT\_HTML\>&lt;html&gt;&lt;head&gt;&lt;title&gt;广州医科大学附属第三医院&lt;/title&gt;&lt;style type="text/css"&gt; .table1 { BORDER-RIGHT: #000000 0px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 0px solid } .td1 { BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 0px solid; BORDER-LEFT: #000000 0px solid; BORDER-BOTTOM: #000000 1px solid } &lt;/style&gt;&lt;/head&gt;&lt;body bgcolor="#005757"&gt;&lt;table width="794" align="center" border="1" cellspacing="0" bordercolor=black rules=none bgcolor="#FFFFFF"&gt;&lt;tr&gt;&lt;td&gt;&lt;table width="642" align="center"&gt;&lt;tr&gt;&lt;td&gt;&lt;table height="42" align="center"&gt;&lt;tr&gt;&lt;td&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&lt;p&gt;&lt;img src="data:image/bmp;base64,Qk0uhQAAAAAAADYAAAAoAAAA9gAAAC4AAAABABgAAAAAAPiEAADEDgAAxA4AAAAAAAAAAAAA////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////AAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8AAP///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////wAA////////////////////////////////////////////////////////////////////////////////////////////////3ufB////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////AAD///////////////////////////////////////////////////////////////////////////////3z9uXn7tDN2aKes1NniACGoCvE0pbj6snn7tLx9uL6/fH///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8AAP///////////////////////////////////////////////////////////////+fu0L3LiLrJg42nN3+bH67BcLDDcnyXGH6ZG7DBcLDBcHeUEYOdJL3LiMHPjZGpPJSqQbfGft7nwf///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////wAA////////////////////////////////////////////////////4OjEp7pid5QOZoYAZIUApLhdkqpAnrVUt8h+vc2IlKxBdZIMmbBKwc+Nj6c5dZIOkqlAs8N3nbFPZIUAZoYBZoYBd5QOsMFy7/Xg////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////AAD////////////////////////////////////////4++6/z4uDnSJkhgBmhgFkhQBkhQBmhgCnvGKSqkCgtlbJ157P26eUrEGbsU/S3KrW4LOPpzeit1nI1ZvL16CetVNkhQBmhgFmhgFkhQBmhgFniACbsU3n7tD////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////\</MR\_CONTENT\_HTML\>\<DELETE\_FLAG\>0\</DELETE\_FLAG\>\</ROW\>\</Content\>\</Response\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| ResponseStatus | Response | 是 | str | 入院时间，查询范围分别填入LOW与HEIGHT属性中 |
| ResponseMessage | Response | 是 | str | 出院时间，询范围分别填入LOW与HEIGHT属性中 |
| ResponseTime | Response | 是 | str | 文书最后修改时，查询范围分别填入LOW与HEIGHT属性中 |
| Content | Response | 是 | 节点 | 患者住院号，值填入VALUE属性中 |
| ROW | Content | 是 | 节点 | 住院次数，值填入VALUE属性中 |
| FILE\_VISIT\_TYPE | Content | 是 | 节点 | 住院号，值填入VALUE属性中 |
| FILE\_UNIQUE\_ID | Content | 是 | 节点 | 门诊号，值填入VALUE属性中 |
| PATIENT\_ID | Content | 否 | str |
 |
| VISIT\_ID | Content | 否 | str |
 |
| INP\_NO | Content | 否 | str |
 |
| INP\_NO | Content | 否 | str |
 |
| NAME | Content | 否 | Str |
 |
| ADMISSION\_DATE\_TIME | Content | 否 | Str |
 |
| DISCHARGE\_DATE\_TIME | Content | 否 | Str |
 |
| LAST\_MODIFY\_DATE\_TIME | Content | 否 | Str |
 |
| CREATOR\_ID | Content | 否 | Str |
 |
| CREATOR\_NAME | Content | 否 | Str |
 |
| CREATE\_DATE\_TIME | Content | 否 | Str |
 |
| CAPTION\_DATE\_TIME | Content | 否 | str |
 |
| TOPIC | Content | 否 | str |
 |
| LAST\_MODIFY\_USER\_ID | Content | 否 | str |
 |
| LAST\_MODIFY\_USER\_NAME | Content | 否 | str |
 |
| MR\_CONTENT\_TEXXT | Content | 否 | str |
 |
| MR\_CONTENT\_HTML | Content | 否 | str |
 |
| DELETE\_FALG | Content | 否 | str |
 |

#### 3.3.2.5注意事项

无

### 3.3.3获取患者病案首页信息 EMR\_GetFirstPage

#### 3.3.3.1服务名 MessageCategory （消息类别）

EMR\_GetFirstPage

#### 3.3.3.2用途

提供患者病案首页信息

#### 3.3.3.3业务请求消息BusinessRequest

| \<?xmlversion= **"1.0"** encoding= **"utf-8"**?\>\<EmrParameters\>\<ADMINISSION\_DATE\_TIMELOW= **"2017-01-01 00:00:00"** HEIGHT= **"2017-01-01 00:00:00"** /\>\<DISCHARGE\_DATE\_TIMELOW= **"2017-01-01 00:00:00"** HEIGHT= **"2017-01-01 00:00:00"** /\>\<LAST\_MODIFY\_DATE\_TIMELOW= **"2017-01-01 00:00:00"** HEIGHT= **"2017-01-01 00:00:00"** /\>\<PATIENT\_IDVALUE= **"100000401214"** /\>\<VISIT\_IDVALUE= **"1"** /\>\<INP\_NOVALUE= **"293045"** /\>\<OUTPATIENT\_NOVALUE= **"100000401214"** /\>\</EmrParameters\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| ADMINISSION\_DATE\_TIME | EmrParameters | 各个条件之间为AND关系，参数条件有且最少一个，可任意组合。 | str | 入院时间条件，查询时间段内患者诊断数据，属性LOW为开始时间，属性HEIGHT为结束时间 |
| DISCHARGE\_DATE\_TIME | EmrParameters | str | 出院时间条件，查询时间段内患者诊断数据，属性LOW为开始时间，属性HEIGHT为结束时间。 |
| LAST\_MODIFY\_DATE\_TIME | EmrParameters | str | 最后修改时间条件，查询时间段内修改的病案首页数据，属性LOW为开始时间，属性HEIGHT为结束时间。 |
| PATIENT\_ID | EmrParameters | str | 住院流水号字段，相关值填入VALUE属性。 |
| VISIT\_ID | EmrParameters | str | 住院次数字段，相关值填入VALUE字段。 |
| INP\_NO | EmrParameters | str | 住院号字段，相关值填入VALUE属性。 |
| OUTPATIENT\_NO | EmrParameters | str | 门诊号字段，相关值填入VALUE属性 |

#### 3.3.3.4返回业务数据 BusinessResponse

| \<?xmlversion= **"1.0"** encoding= **"utf-8"**?\>\<FirstPages\>\<FirstPage\>\<PATIENT\_ID\> **100000464765** \</PATIENT\_ID\>\<VISIT\_ID\> **1** \</VISIT\_ID\>\<INP\_NO\> **1** \</INP\_NO\>\<NAME\> **彭济罡** \</NAME\>\<SEX\> **男** \</SEX\>\<DATE\_OF\_BIRTH\> **2018-09-29** \</DATE\_OF\_BIRTH\>\<AGE\> **49**** 分钟 **\</AGE\>\<CITIZENSHIP\>** 中国 **\</CITIZENSHIP\>\<NATION\>** 汉族 **\</NATION\>\<BIRTH\_PLACE\>** 广东广州 **\</BIRTH\_PLACE\>\<JIGUAN\>** 湖南省岳阳市 **\</JIGUAN\>\<ID\_NO\>** 440104201809297317 **\</ID\_NO\>\<OCCUPATION\>** 无业人员 **\</OCCUPATION\>\<MARITAL\_STATUS\>** 未婚 **\</MARITAL\_STATUS\>\<MAILING\_ADDRESS\>** 440104000 ****广东省广州市越秀区**** @ ****东山领汇**** B ****栋**** 3005 **\</MAILING\_ADDRESS\>\<HOME\_TEL\>** 13570084508 **\</HOME\_TEL\>\<ZIP\_CODE\>** - **\</ZIP\_CODE\>\<NOMEN\>** 440104000 ****广东省广州市越秀区**** @ ****东山领汇**** B ****栋**** 3005 **\</NOMEN\>\<HOME\_ZIP\>** - **\</HOME\_ZIP\>\<SERVICE\_AGENCY\>** - **\</SERVICE\_AGENCY\>\<WORK\_TEL\>** - **\</WORK\_TEL\>\<WORK\_ZIP\>** - **\</WORK\_ZIP\>\<NEXT\_OF\_KIN\>** 孙香 **\</NEXT\_OF\_KIN\>\<RELATIONSHIP\>** 父母 **\</RELATIONSHIP\>\<NEXT\_OF\_KIN\_ADDR\>** 广州市越秀区东山领汇 ****B**** 栋 ****3005** \</NEXT\_OF\_KIN\_ADDR\>\<NEXT\_OF\_KIN\_PHONE\> **13926443919** \</NEXT\_OF\_KIN\_PHONE\>\<PATIENT\_CLASS\> **急诊** \</PATIENT\_CLASS\>\<ADMISSION\_DATE\_TIME\> **2018-09-29 13:42:00** \</ADMISSION\_DATE\_TIME\>\<DEPT\_ADMISSION\_TO\> **0000338** \</DEPT\_ADMISSION\_TO\>\<BED\_ADMISSION\_TO\> **51** \</BED\_ADMISSION\_TO\>\<DISCHARGE\_DATE\_TIME\> **2019-01-06 08:00:00** \</DISCHARGE\_DATE\_TIME\>\<DEPT\_DISCHARGE\_FROM\> **0000337** \</DEPT\_DISCHARGE\_FROM\>\<BED\_DISCHARGE\_FROM\> **08** \</BED\_DISCHARGE\_FROM\>\<BABY\_BIRTH\_WEIGHT\> **600** \</BABY\_BIRTH\_WEIGHT\>\<BABY\_ADMIN\_WEIGHT\> **600** \</BABY\_ADMIN\_WEIGHT\>\<IN\_SOURCE\> **医院所在市的外区（县）** \</IN\_SOURCE\>\<CLINICANDPATHOLOGICAL\> **-** \</CLINICANDPATHOLOGICAL\>\<CLINICANDOUT\> **符合** \</CLINICANDOUT\>\<INANDOUT\> **符合** \</INANDOUT\>\<BEFOREANDAFTEROPRATION\> **符合** \</BEFOREANDAFTEROPRATION\>\<RADIOLOGYANDPATHOLOGICAL\> **-** \</RADIOLOGYANDPATHOLOGICAL\>\<OPFROZENANDPARAFFIN\> **-** \</OPFROZENANDPARAFFIN\>\<MTD\_VALUE\> **危重** \</MTD\_VALUE\>\<ISINCLINICALPATHWAY\> **否** \</ISINCLINICALPATHWAY\>\<CP\_NAME/\>\<IS\_CP\_VARIATION/\>\<EMER\_TREAT\_TIMES\> **3** \</EMER\_TREAT\_TIMES\>\<ESC\_EMER\_TIMES\> **3** \</ESC\_EMER\_TIMES\>\<YWGM\> **无** \</YWGM\>\<ALERGY\_DRUGS/\>\<AUTOPSY\_INDICATOR\_NAME/\>\<BLOOD\_TYPE\> **AB** \</BLOOD\_TYPE\>\<BLOOD\_TYPE\_RH\> **阳** \</BLOOD\_TYPE\_RH\>\<DIRECTOR\> **崔其亮** \</DIRECTOR\>\<CHIEF\_DOCTOR\> **吴繁** \</CHIEF\_DOCTOR\>\<ATTENDING\_DOCTOR\> **梁少珍** \</ATTENDING\_DOCTOR\>\<DOCTOR\_IN\_CHARGE\> **梁少珍** \</DOCTOR\_IN\_CHARGE\>\<LIABILITY\_NURSE\> **李丽珍** \</LIABILITY\_NURSE\>\<ADVANCED\_STUDIES\_DOCTOR\> **-** \</ADVANCED\_STUDIES\_DOCTOR\>\<PRACTICE\_DOCTOR\_OF\_GRADUATE\> **蔡伯忠** \</PRACTICE\_DOCTOR\_OF\_GRADUATE\>\<CONSULTING\_DOCTOR\> **陈瑞琦** \</CONSULTING\_DOCTOR\>\<CATALOGER\> **徐晓明** \</CATALOGER\>\<DOCTOR\_OF\_CONTROL\_QUALITY\> **梁少珍** \</DOCTOR\_OF\_CONTROL\_QUALITY\>\<NURSE\_OF\_CONTROL\_QUALITY\> **李丽珍** \</NURSE\_OF\_CONTROL\_QUALITY\>\<DATE\_OF\_CONTROL\_QUALITY\> **2019-01-09 00:00:00** \</DATE\_OF\_CONTROL\_QUALITY\>\<MR\_QUALITY\> **甲** \</MR\_QUALITY\>\<DISCHARGE\_DISPOSITION\> **医嘱离院** \</DISCHARGE\_DISPOSITION\>\<ZYMC\_SQ/\>\<ZYJG/\>\<ZRYJH\> **无** \</ZRYJH\>\<ZYMD/\>\<FIRST\_COMA\_DAY/\>\<FIRST\_COMA\_HOUR/\>\<FIRST\_COMA\_MINUTE/\>\<BACK\_COMA\_DAY/\>\<BACK\_COMA\_HOUR/\>\<BACK\_COMA\_MINUTE/\>\<LAST\_MODIFY\_DATE\_TIME\> **2019-01-16 08:40:30** \</LAST\_MODIFY\_DATE\_TIME\>\</FirstPage\>\</FirstPages\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| FirstPages |
 | 是 | 节点 |
 |
| FirstPage | FirstPages | 是 | 节点 | 病案首页节点，多个患者多个节点 |
| PATIENT\_ID | FirstPage | 是 | str | 住院流水号 |
| VISIT\_ID | FirstPage | 是 | str | 住院次数 |
| INP\_NO | FirstPage | 是 | str | 住院号 |
| NAME | FirstPage | 是 | str | 姓名 |
| SEX | FirstPage | 是 | str | 性别 |
| DATE\_OF\_BIRTH | FirstPage | 是 | str | 出生日期 |
| AGE | FirstPage | 是 | str | 年龄 |
| CITIZENSHIP | FirstPage | 是 | str | 国籍 |
| NATION | FirstPage | 是 | str | 民族 |
| BIRTH\_PLACE | FirstPage | 是 | str | 出生地 |
| JIGUAN | FirstPage | 是 | str | 籍贯 |
| ID\_NO | FirstPage | 是 | str | 身份证号 |
| OCCUPATION | FirstPage | 是 | str | 职业 |
| MARITAL\_STATUS | FirstPage | 是 | str | 婚姻 |
| MAILING\_ADDRESS | FirstPage | 是 | str | 现住址 |
| HOME\_TEL | FirstPage | 是 | str | 现住址电话 |
| ZIP\_CODE | FirstPage | 是 | str | 现住址邮编 |
| NOMEN | FirstPage | 是 | str | 户口地址 |
| HOME\_ZIP | FirstPage | 是 | str | 户口地址邮编 |
| SERVICE\_AGENCY | FirstPage | 是 | str | 工作单位 |
| WORK\_TEL | FirstPage | 是 | str | 工作单位电话 |
| WORK\_ZIP | FirstPage | 是 | str | 工作单位邮编 |
| NEXT\_OF\_KIN | FirstPage | 是 | str | 联系人姓名 |
| RELATIONSHIP | FirstPage | 是 | str | 联系人关系 |
| NEXT\_OF\_KIN\_ADDR | FirstPage | 是 | str | 联系人地址 |
| NEXT\_OF\_KIN\_PHONE | FirstPage | 是 | str | 联系人电话 |
| PATIENT\_CLASS | FirstPage | 是 | str | 入院途径 |
| ADMISSION\_DATE\_TIME | FirstPage | 是 | str | 入院时间 |
| DEPT\_ADMISSION\_TO | FirstPage | 是 | str | 入院科室 |
| BED\_ADMISSION\_TO | FirstPage | 是 | str | 入院病房 |
| DISCHARGE\_DATE\_TIME | FirstPage | 是 | str | 出院时间 |
| DEPT\_DISCHARGE\_FROM | FirstPage | 是 | str | 出院科室 |
| BED\_DISCHARGE\_FROM | FirstPage | 是 | str | 出院病房 |
| BABY\_BIRTH\_WEIGHT | FirstPage | 是 | str | 婴儿出生体重 |
| BABY\_ADMIN\_WEIGHT | FirstPage | 是 | str | 婴儿入院体重 |
| IN\_SOURCE | FirstPage | 是 | str | 病人来源 |
| CLINICANDPATHOLOGICAL | FirstPage | 是 | str | 临床与病理诊断符合 |
| CLINICANDOUT | FirstPage | 是 | str | 门诊与出院诊断符合 |
| INANDOUT | FirstPage | 是 | str | 入院与出院 |
| BEFOREANDAFTEROPRATION | FirstPage | 是 | str | 术前与术后 |
| RADIOLOGYANDPATHOLOGICAL | FirstPage | 是 | str | 放射与病理 |
| OPFROZENANDPARAFFIN | FirstPage | 是 | str | 冰冻与石蜡 |
| MTD\_VALUE | FirstPage | 是 | str | 病例分型 |
| ISINCLINICALPATHWAY | FirstPage | 是 | str | 是否临床路径 |
| CP\_NAME | FirstPage | 是 | str | 临床路径名称 |
| IS\_CP\_VARIATION | FirstPage | 是 | str | 是否变异 |
| EMER\_TREAT\_TIMES | FirstPage | 是 | str | 抢救次数 |
| ESC\_EMER\_TIMES | FirstPage | 是 | str | 抢救成功次数 |
| YWGM | FirstPage | 是 | str | 是否药物过敏 |
| ALERGY\_DRUGS | FirstPage | 是 | str | 过敏药物名称 |
| AUTOPSY\_INDICATOR\_NAME | FirstPage | 是 | str | 死亡患者尸检 |
| BLOOD\_TYPE | FirstPage | 是 | str | 血型 |
| BLOOD\_TYPE\_RH | FirstPage | 是 | str | RH血型 |
| DIRECTOR | FirstPage | 是 | str | 科主任 |
| CHIEF\_DOCTOR | FirstPage | 是 | str | 主副主任医师 |
| ATTENDING\_DOCTOR | FirstPage | 是 | str | 主治医师 |
| DOCTOR\_IN\_CHARGE | FirstPage | 是 | str | 住院医师 |
| LIABILITY\_NURSE | FirstPage | 是 | str | 责任护士 |
| ADVANCED\_STUDIES\_DOCTOR | FirstPage | 是 | str | 进修医师 |
| PRACTICE\_DOCTOR\_OF\_GRADUATE | FirstPage | 是 | str | 实习医师 |
| CONSULTING\_DOCTOR | FirstPage | 是 | str | 门急诊医师 |
| CATALOGER | FirstPage | 是 | str | 编码员 |
| DOCTOR\_OF\_CONTROL\_QUALITY | FirstPage | 是 | str | 质控医师 |
| NURSE\_OF\_CONTROL\_QUALITY | FirstPage | 是 | str | 质控护士 |
| DATE\_OF\_CONTROL\_QUALITY | FirstPage | 是 | str | 质控时间 |
| MR\_QUALITY | FirstPage | 是 | str | 病案质量 |
| DISCHARGE\_DISPOSITION | FirstPage | 否 | str | 离院方式 |
| ZYMC\_SQ | FirstPage | 否 | str | 离院方式为转院时转院名称 |
| ZYJG | FirstPage | 否 | str | 离院方式为转社区卫生机构时机构名称 |
| ZRYJH | FirstPage | 否 | str | 是否有31天再住院计划 |
| ZYMD | FirstPage | 否 | str | 再住院目的 |
| FIRST\_COMA\_DAY | FirstPage | 否 | str | 颅脑损伤患者入院前昏迷天数 |
| FIRST\_COMA\_HOUR | FirstPage | 否 | str | 颅脑损伤患者入院前昏迷小时数 |
| FIRST\_COMA\_MINUTE | FirstPage | 否 | str | 颅脑损伤患者入院前昏迷分钟数 |
| BACK\_COMA\_DAY | FirstPage | 否 | str | 颅脑损伤患者入院后昏迷天数 |
| BACK\_COMA\_HOUR | FirstPage | 否 | str | 颅脑损伤患者入院后昏迷小时数 |
| BACK\_COMA\_MINUTE | FirstPage | 否 | str | 颅脑损伤患者入院后昏迷分钟数 |
| LAST\_MODIFY\_DATE\_TIME | FirstPage | 否 | str | 最后更新时间 |

#### 3.3.3.5注意事项

无

### 3.3.4获取患者手术信息 EMR\_GetOperation

#### 3.3.4.1服务名 MessageCategory （消息类别）

EMR\_GetOperation

#### 3.3.4.2用途

提供患者手术信息

#### 3.3.4.3业务请求消息BusinessRequest

| \<?xmlversion= **"1.0"** encoding= **"utf-8"**?\>\<EmrParameters\>\<ADMINISSION\_DATE\_TIMELOW= **"2017-01-01 00:00:00"** HEIGHT= **"2017-01-01 00:00:00"** /\>\<DISCHARGE\_DATE\_TIMELOW= **"2017-01-01 00:00:00"** HEIGHT= **"2017-01-01 00:00:00"** /\>\<LAST\_MODIFY\_DATE\_TIMELOW= **"2017-01-01 00:00:00"** HEIGHT= **"2017-01-01 00:00:00"** /\>\<PATIENT\_IDVALUE= **"100000401214"** /\>\<VISIT\_IDVALUE= **"1"** /\>\<INP\_NOVALUE= **"293045"** /\>\<OUTPATIENT\_NOVALUE= **"100000401214"** /\>\</EmrParameters\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| ADMINISSION\_DATE\_TIME | EmrParameters | 各个条件之间为AND关系，参数条件有且最少一个，可任意组合。 | str | 入院时间条件，查询时间段内患者诊断数据，属性LOW为开始时间，属性HEIGHT为结束时间 |
| DISCHARGE\_DATE\_TIME | EmrParameters | str | 出院时间条件，查询时间段内患者诊断数据，属性LOW为开始时间，属性HEIGHT为结束时间。 |
| LAST\_MODIFY\_DATE\_TIME | EmrParameters | str | 最后修改时间条件，查询时间段内患者诊断数据，属性LOW为开始时间，属性HEIGHT为结束时间。 |
| PATIENT\_ID | EmrParameters | str | 住院流水号字段，相关值填入VALUE属性。 |
| VISIT\_ID | EmrParameters | str | 住院次数字段，相关值填入VALUE字段。 |
| INP\_NO | EmrParameters | str | 住院号字段，相关值填入VALUE属性。 |
| OUTPATIENT\_NO | EmrParameters | str | 门诊号字段，相关值填入VALUE属性 |

#### 3.3.4.4返回业务数据 BusinessResponse

| \<?xmlversion= **"1.0"** encoding= **"UTF-8"**?\>\<Operations\>\<Operation\>\<FILE\_VISIT\_TYPE\> **2** \</FILE\_VISIT\_TYPE\>\<PATIENT\_ID\> **100000415093** \</PATIENT\_ID\>\<VISIT\_ID\> **1** \</VISIT\_ID\>\<INP\_NO\> **303437** \</INP\_NO\>\<DISCHARGE\_DATE\_TIME\> **2017-12-06T16:38:00+08:00** \</DISCHARGE\_DATE\_TIME\>\<ADMISSION\_DATE\_TIME\> **2017-12-01T00:14:00+08:00** \</ADMISSION\_DATE\_TIME\>\<NAME\> **陈文苑** \</NAME\>\<OPERATION\_NO\> **1** \</OPERATION\_NO\>\<OPERATION\_CODE\> **66.4 02** \</OPERATION\_CODE\>\<OPERATION\_DESC\> **腹腔镜下单侧输卵管切除术** \</OPERATION\_DESC\>\<OPERATION\_CODE\_HQMS\> **66.4 002** \</OPERATION\_CODE\_HQMS\>\<OPERATION\_NAME\_HQMS\> **腹腔镜下单侧输卵管切除术** \</OPERATION\_NAME\_HQMS\>\<OPERATION\_TYPE\> **0** \</OPERATION\_TYPE\>\<OPERATING\_DATE\> **2017-12-01T13:25:11+08:00** \</OPERATING\_DATE\>\<OPERATING\_END\_DATE\> **2017-12-01T14:55:11+08:00** \</OPERATING\_END\_DATE\>\<OPERATION\_SCALE\> **三级** \</OPERATION\_SCALE\>\<OPERATOR\> **李剑琦** \</OPERATOR\>\<OPERATOR\_ID\>0000221\</OPERATOR\_ID\>\<FIRST\_ASSISTANT\> **李兆生** \</FIRST\_ASSISTANT\>\<SECOND\_ASSISTANT\> **-** \</SECOND\_ASSISTANT\>\<WOUND\_GRADE\> **0** \</WOUND\_GRADE\>\<HEAL\> **甲** \</HEAL\>\<ANAESTHESIA\_METHOD\> **全麻** \</ANAESTHESIA\_METHOD\>\<ANESTHESIA\_DOCTOR\> **蔡孟杰** \</ANESTHESIA\_DOCTOR\>\<IS\_CHANGETIME\> **否** \</IS\_CHANGETIME\>\<OPERATION\_DESC\_PART\> **盆腔** \</OPERATION\_DESC\_PART\>\</Operation\>\</Operations\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| FILE\_VISIT\_TYPE | Operation | 是 | str | 0：门诊 2：住院 |
| PATIENT\_ID | Operation | 是 | str |
 |
| VISIT\_ID | Operation | 是 | str |
 |
| INP\_NO | Operation | 是 | str |
 |
| NAME | Operation | 否 | str |
 |
| ADMISSION\_DATE\_TIME | Operation | 否 | str |
 |
| ADMISSION\_DATE\_TIME | Operation | 否 | str |
 |
| OPERATION\_NO | Operation | 否 | str |
 |
| OPERATION\_CODE | Operation | 否 | str | 本院手术编码 |
| OPERATION\_DESC | Operation | 否 | str | 医生修改后的手术描述 |
| OPERATION\_CODE\_HQMS | Operation | 否 | str | HQMS手术编码，对应北京ICD9标准手术编码 |
| OPERATION\_NAME\_HQMS | Operation | 否 | str | HQMS手术名称，对应北京ICD9标准手术名称 |
| OPERATION\_TYPE | Operation | 否 | str | 0：手术 1：诊断性操作 2治疗性操作 |
| OPERATING\_DATE | Operation | 否 | str |
 |
| OPERATING\_END\_DATE | Operation | 否 | str |
 |
| OPERATION\_SCALE | Operation | 否 | str |
 |
| OPERATOR | Operation | 否 | str |
 |
| OPERATOR\_ID | Operation | 否 | str |
 |
| FIRST\_ASSISTANT | Operation | 否 | str |
 |
| SECOND\_ASSISTANT | Operation | 否 | str |
 |
| WOUND\_GRADE | Operation | 否 | str |
 |
| HEAL | Operation | 否 | str |
 |
| ANAESTHESIA\_METHOD | Operation | 否 | str |
 |
| ANESTHESIA\_DOCTOR | Operation | 否 | str |
 |
| IS\_CHANGETIME | Operation | 否 | str |
 |
| OPERATION\_DESC\_PART | Operation | 否 | str |
 |

#### 3.3.4.5注意事项

无

## 3.4LIS提供接口

    1.
### 获取检验列表 LIS\_GetPatientList

#### 3.4.1.1服务名 MessageCategory （消息类别）

LIS\_GetPatientList

#### 3.4.1.2用途

获取检验信息列表

#### 3.4.1.3业务请求消息BusinessRequest

| \<Request\> \<AccessKey\>gysy-eai\</AccessKey\> \<RequestData\> \<StartDate\>2020-12-01 00:00:00\</StartDate\>. \<EndDate\>2020-12-11 00:00:00\</EndDate\> \<pat\_in\_no\>6100294435\</pat\_in\_no\> \<pat\_admiss\_times\>\</pat\_admiss\_times\> \<pat\_ori\_id\>1\</pat\_ori\_id\> \<Report\_ID\>\</Report\_ID\> \<pat\_bar\_code\>\</pat\_bar\_code\> \</RequestData\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Pat\_in\_no | Request | 否 | str | 门诊、住院号 |
| Pat\_admiss\_times | Request | 否 | str | 住院次数 |
| Pat\_ori\_id | Request | 否 | str | ~~来源（107门诊108住院109体检）~~ 来源ID，0门诊；1住院;2体检 |
| ~~Pat\_social\_no~~ | ~~Request~~ | ~~否~~ | ~~str~~ | ~~就诊卡号~~ |
| ~~Pat\_pid~~ | ~~Request~~ | ~~否~~ | ~~str~~ | ~~长号~~ |
| StartDate | Request | 否 | str | 时间范围：开始时间 |
| EndDate | Request | 否 | str | 时间范围：结束时间 |
| Pat\_bar\_code | Request | 否 | str | 条码 |
| Report\_ID | Request | 否 | str | 报告ID |
| ~~Pat\_identity\_name~~ | ~~Request~~ | ~~否~~ | ~~str~~ | ~~身份证号码~~ |
| ~~注：Pat\_in\_no、Pat\_social\_no、Pat\_pid必须有一个有值，其他参数可选。~~ 注：Pat\_in\_no支持住院号、门诊号、就诊卡号、长号、身份证查询如果是按条码有值或报告ID，不需要开始结束时间；如果不是按条码或报告ID，必须要录入开始结束时间 |

#### 3.4.1.4返回业务数据 BusinessResponse

| **\<Response\>**  **\<ResultCode\>1\</ResultCode\>**  **\<ResultContent\>**** 成功 ****\</ResultContent\>**  **\<ResponseData\>**  **\<Items\>**  **\<Item\>**  **\<branchId\>01\</branchId\>**  **\<applyId\>0011001, 0011002\</applyId\>**  **\<source\>1\</source\>**  **\<sourceName\>**** 住院 ****\</sourceName\>**  **\<clinicId\>\</clinicId\>**  **\<admissTimes\>1\</admissTimes\>**  **\<visitNumber\>101110234\</visitNumber\>**  **\<tjNo\>\</tjNo\>**  **\<pat\_identity\_name\>\</pat\_identity\_name\>**  **\<pat\_name\>**** 测试 ****\</pat\_name\>**  **\<pat\_sex\>1\</pat\_sex\>**  **\<pat\_age\>26**** 岁 ****\</pat\_age\>**  **\<report\_id\>10154202012021\</report\_id\>**  **\<pat\_c\_name\>**** 肝功 ****6**** 项 ****\</pat\_c\_name\>**** \<pat\_c\_sub\_codes\> **10006\</pat\_c\_sub\_codes\>** \<pat\_jy\_date\>2020/12/2 16:15:08\</pat\_jy\_date\> **** \<pat\_report\_name\> ****吕兆祺**** \</pat\_report\_name\> **** \<pat\_report\_date\>2020/12/2 17:01:31\</pat\_report\_date\> **** \<pat\_sid\>1\</pat\_sid\> **** \<pat\_jy\_name\> ****吕兆祺**** \</pat\_jy\_name\> **** \<pat\_chk\_name\> ****吕兆祺**** \</pat\_chk\_name\> **** \<pat\_flag\>2\</pat\_flag\> **** \<pat\_doc\_name\> ****林智恒**** \</pat\_doc\_name\> **** \<signContent\>\</signContent\> **** \<pat\_itr\_id\>10154\</pat\_itr\_id\> **** \<pat\_report\_type\>gen\</pat\_report\_type\> **** \<pat\_apply\_date\>2020/12/2 16:14:55\</pat\_apply\_date\> **** \<pat\_dep\_name\> ****中医科**** \</pat\_dep\_name\> **** \<pat\_dep\_id\>0000469\</pat\_dep\_id\> **** \<pat\_bar\_code\>8009224904\</pat\_bar\_code\> **** \<pat\_sam\_rem\>\</pat\_sam\_rem\> **** \<pat\_sam\_id\>10011\</pat\_sam\_id\> **** \<sam\_name\> ****血清**** \</sam\_name\> **** \<pat\_doc\_code\>13317\</pat\_doc\_code\> **** \</Item\> **** \<Item\> **** \<branchId\>01\</branchId\> **** \<applyId\>0011003\</applyId\> **** \<source\>1\</source\> **** \<sourceName\> ****住院**** \</sourceName\> **** \<clinicId\>\</clinicId\> **** \<admissTimes\>1\</admissTimes\> **** \<visitNumber\>101110234\</visitNumber\> **** \<tjNo\>\</tjNo\> **** \<pat\_identity\_name\>\</pat\_identity\_name\> **** \<pat\_name\> ****测试**** \</pat\_name\> **** \<pat\_sex\>1\</pat\_sex\> **** \<pat\_age\>26 ****岁**** \</pat\_age\> **** \<report\_id\>10004202012021\</report\_id\> **** \<pat\_c\_name\> ****组合**** 1+ ****组合**** 2\</pat\_c\_name\> ****\<pat\_c\_sub\_codes\>** 10001,10002\</pat\_c\_sub\_codes\> **\<pat\_jy\_date\>2020/12/2 17:15:33\</pat\_jy\_date\>**  **\<pat\_report\_name\>**** 吕兆祺 ****\</pat\_report\_name\>**  **\<pat\_report\_date\>2020/12/2 17:17:26\</pat\_report\_date\>**  **\<pat\_sid\>1\</pat\_sid\>**  **\<pat\_jy\_name\>**** 测试 ****\</pat\_jy\_name\>**  **\<pat\_chk\_name\>**** 吕兆祺 ****\</pat\_chk\_name\>**  **\<pat\_flag\>2\</pat\_flag\>**  **\<pat\_doc\_name\>**** 杨振军 ****\</pat\_doc\_name\>**  **\<signContent\>\</signContent\>**  **\<pat\_itr\_id\>10004\</pat\_itr\_id\>**  **\<pat\_report\_type\>mic\</pat\_report\_type\>**  **\<pat\_apply\_date\>2020/12/2 17:15:17\</pat\_apply\_date\>**  **\<pat\_dep\_name\>**** 中医科 ****\</pat\_dep\_name\>**  **\<pat\_dep\_id\>0000469\</pat\_dep\_id\>**  **\<pat\_bar\_code\>8009224908\</pat\_bar\_code\>**  **\<pat\_sam\_rem\>\</pat\_sam\_rem\>**  **\<pat\_sam\_id\>10007\</pat\_sam\_id\>**  **\<sam\_name\>**** 全血 ****\</sam\_name\>**  **\<pat\_doc\_code\>13630\</pat\_doc\_code\>**  **\</Item\>**  **\</Items\>**  **\</ResponseData\>**** \</Response\>** |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Response | str | 0：成功，-1：失败 |
| ResultContent | Response | str | 失败详细信息 |
| ResponseData | Response | 节点 |
 |
| Items | ResponseData | 节点 | 检验报告集合 |
| Item | Items | 节点 | 1..\*，检验报告实体 |
| BranchId | Item | str | 院区ID |
| ApplyId | Item | str | 申请单号，如果一份报告中包含多个申请单，则用","连接输出 |
| Source | Item | str | 来源ID，0门诊；1住院;2体检 |
| ClinicId | Item | str | 门诊流水号，当Source = 0 时返回 |
| AdmissTimes | Item | str | 住院次数，当Source = 1 时返回 |
| VisitNumber | Item | str | 住院流水号，当Source = 1 时返回 |
| TjNo | Item | str | 体检流水号，当Source = 2 时返回 |
| Pat\_identity\_name | Item | str | 身份证号码 |
| Pat\_name | Item | str | 姓名 |
| Pat\_sex | Item | str | 性别(0-未知 1-男 2-女) |
| Pat\_age | Item | str | 年龄 |
| report\_id | Item | str | 报告单号 |
| Pat\_c\_name | Item | str | 检验项目 |
| Pat\_c\_sub\_codes | Item | str | 检验项目ID，多个用英文逗号[,]分割 |
| Pat\_jy\_date | Item | Datetime | 检测日期 |
| Pat\_report\_name | Item | str | 报告人名称 |
| Pat\_report\_date | Item | Datetime | 报告时间 |
| Pat\_sid | Item | str | 样本号 |
| Pat\_jy\_name | Item | str | 录入者 |
| Pat\_chk\_name | Item | str | 检查者 |
| Pat\_flag | Item | str | 打印标识（2未打印，4已打印） |
| Pat\_doc\_name | Item | str | 开单医生 |
| SignContent | Item | str | CA验证结果签名值 |
| Pat\_itr\_id | Item | str | 仪器id |
| Pat\_report\_type | Item | str | 报告类型(gen为普通报告 mic为微生物报告) |
| Pat\_apply\_date | Item | str | 申请时间 |
| Pat\_dep\_name | Item | str | 开单科室 |
| Pat\_dep\_id | Item | str | 开单科室编码 |
| Pat\_bar\_code | Item | str | 条码 |
| Pat\_sam\_rem | Item | str | 标本状态 |
| Pat\_sam\_id | Item | str | 样本类型编码 |
| Sam\_name | Item | str | 样本类型名称 |
| Pat\_doc\_code | Item | str | 开单医生编码 |

#### 3.4.1.5注意事项

注：Pat\_in\_no支持住院号、门诊号、就诊卡号、长号、身份证查询

如果是按条码有值或报告ID，不需要开始结束时间；如果不是按条码或报告ID，必须要录入开始结束时间

### 3.4.2获取常规结果 LIS\_GetRoutineResult

#### 3.4.2.1服务名 MessageCategory （消息类别）

LIS\_GetRoutineResult

#### 3.4.2.2用途

获取常规检验报告结果

#### 3.4.2.3业务请求消息BusinessRequest

| \<Request\> \<AccessKey\>gysy-eai\</AccessKey\> \<RequestData\> \<report\_id\>10179202012021\</report\_id\> \<Itm\_ids\>11690,11692\</Itm\_ids\> \</RequestData\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| report\_id | RequestData | 是 | str | 报告单号 |
| itm\_ids | RequestData | 否 | str | 项目id（多个用,隔开） |
|
 |

#### 3.4.2.4返回业务数据 BusinessResponse

| **\<Response\>**  **\<ResultCode\>1\</ResultCode\>**  **\<ResultContent\>**** 成功 ****\</ResultContent\>**  **\<ResponseData\>**  **\<Items\>**  **\<Item\>**  **\<report\_id\>10179202012021\</report\_id\>**  **\<com\_id\>10455\</com\_id\>**  **\<com\_name\>**** 甲状腺自身抗体三项 ****\</com\_name\>**  **\<itm\_id\>11690\</itm\_id\>**  **\<itm\_name\>**** 抗甲状腺过氧化物酶抗体 ****\</itm\_name\>**  **\<itm\_ecd\>A-TPO\</itm\_ecd\>**  **\<res\_chr\>1.00\</res\_chr\>**  **\<res\_ref\_flag\>\</res\_ref\_flag\>**  **\<res\_ref\_l\>0\</res\_ref\_l\>**  **\<res\_ref\_h\>34\</res\_ref\_h\>**  **\<res\_ref\_exp\>\</res\_ref\_exp\>**  **\<res\_unit\>IU/ml\</res\_unit\>**  **\<itm\_prt\_flag\>1\</itm\_prt\_flag\>**  **\</Item\>**  **\<Item\>**  **\<report\_id\>10179202012021\</report\_id\>**  **\<com\_id\>10455\</com\_id\>**  **\<com\_name\>**** 甲状腺自身抗体三项 ****\</com\_name\>**  **\<itm\_id\>11692\</itm\_id\>**  **\<itm\_name\>**** 促甲状腺素受体抗体 ****\</itm\_name\>**  **\<itm\_ecd\>A-TSHR\</itm\_ecd\>**  **\<res\_chr\>3.00\</res\_chr\>**  **\<res\_ref\_flag\>↑\</res\_ref\_flag\>**  **\<res\_ref\_l\>0\</res\_ref\_l\>**  **\<res\_ref\_h\>1.75\</res\_ref\_h\>**  **\<res\_ref\_exp\>\</res\_ref\_exp\>**  **\<res\_unit\>IU/l\</res\_unit\>**  **\<itm\_prt\_flag\>1\</itm\_prt\_flag\>**  **\</Item\>**  **\</Items\>**  **\</ResponseData\>**** \</Response\>** |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Response | str | 0：成功，-1：失败 |
| ResultContent | Response | str | 失败详细信息 |
| ResponseData | Response | 节点 |
 |
| Items | ResponseData | 节点 | 检验报告集合 |
| Item | Items | 节点 | 1..\*，检验报告实体 |
| report\_id | Items | str | 报告单号 |
| Com\_id | Items | str | 组合id |
| Com\_name | Items | str | 组合名称 |
| Itm\_id | Items | str | 项目ID |
| Itm\_name | Items | str | 项目名称 |
| Itm\_ecd | Items | str | 项目代码 |
| Res\_chr | Items | str | 检测结果 |
| Res\_ref\_flag | Items | str | 异常提示 |
| Res\_ref\_l | Items | str | 参考值下限 |
| Res\_ref\_h | Items | str | 参考值上限 |
| Res\_ref\_exp | Items | str | 参考范围 |
| Res\_unit | Items | str | 项目单位 |
| Itm\_prt\_flag | Items | str | 打印标志（0不打印 1打印） |

#### 3.4.2.5注意事项

无

### 3.4.3获取条码信息 LIS\_GetBarcodeInfo

#### 3.4.3.1服务名 MessageCategory （消息类别）

LIS\_GetBarcodeInfo

#### 3.4.3.2用途

通过条码号获取条码信息

#### 3.4.3.3业务请求消息BusinessRequest

| **\<Request\>**  **\<AccessKey\>gysy-eai\</AccessKey\>**  **\<RequestData\>**  **\<bc\_bar\_code\>8009224938\</bc\_bar\_code\>**  **\</RequestData\>**** \</Request\>** |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Bc\_bar\_code | RequestData | 是 | str | 条码号 |
|
 |

#### 3.4.3.4返回业务数据 BusinessResponse

| **\<Response\>**  **\<ResultCode\>1\</ResultCode\>**  **\<ResultContent\>**** 成功 ****\</ResultContent\>**  **\<ResponseData\>**  **\<Items\>**  **\<Item\>**  **\<branchId\>01\</branchId\>**  **\<applyId\>0011003\</applyId\>**  **\<source\>1\</source\>**  **\<sourceName\>**** 住院 ****\</sourceName\>**  **\<clinicId\>\</clinicId\>**  **\<admissTimes\>1\</admissTimes\>**  **\<visitNumber\>101110234\</visitNumber\>**  **\<tjNo\>\</tjNo\>**  **\<pat\_identity\_name\>\</pat\_identity\_name\>**  **\<pat\_name\>**** 测试 ****\</pat\_name\>**  **\<pat\_sex\>1\</pat\_sex\>**  **\<pat\_age\>26**** 岁 ****\</pat\_age\>**  **\<bc\_bar\_code\>8009224909\</bc\_bar\_code\>**  **\<bc\_in\_no\>6100294435\</bc\_in\_no\>**  **\<bc\_times\>\</bc\_times\>**  **\<bc\_his\_name\>**** 急诊血细胞分析 ****+**** 急诊降钙素原（全血） ****\</bc\_his\_name\>**  **\<bc\_sam\_rem\_id\>\</bc\_sam\_rem\_id\>**  **\<bc\_sam\_rem\>\</bc\_sam\_rem\>**  **\<bc\_lis\_code\>11564\</bc\_lis\_code\>**  **\<bc\_lis\_name\>\</bc\_lis\_name\>**  **\<bc\_yz\_id\>\</bc\_yz\_id\>**  **\<bc\_status\>60\</bc\_status\>**  **\<bc\_status\_name\>**** 报告 ****\</bc\_status\_name\>**  **\<bc\_sam\_id\>10007\</bc\_sam\_id\>**  **\<bc\_sam\_name\>\</bc\_sam\_name\>**  **\</Item\>**  **\</Items\>**  **\</ResponseData\>**** \</Response\>** |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Response | str | 0：成功，-1：失败 |
| ResultContent | Response | str | 失败详细信息 |
| ResponseData | Response | 节点 |
 |
| Items | ResponseData | 节点 | 检验项目集合 |
| Item | Items | 节点 | 1..\*，检验项目实体 |
| BranchId | Item | str | 院区ID |
| ApplyId | Item | str | 申请单号，如果一份报告中包含多个申请单，则用","连接输出 |
| Source | Item | str | 来源ID，0门诊；1住院;2体检 |
| ClinicId | Item | str | 门诊流水号，当Source = 0 时返回 |
| AdmissTimes | Item | str | 住院次数，当Source = 1 时返回 |
| VisitNumber | Item | str | 住院流水号，当Source = 1 时返回 |
| TjNo | Item | str | 体检流水号，当Source = 2 时返回 |
| Pat\_identity\_name | Item | str | 身份证号码 |
| Pat\_name | Item | str | 姓名 |
| Pat\_sex | Item | str | 性别(0-未知 1-男 2-女) |
| Pat\_age | Item | str | 年龄 |
| Bc\_bar\_code | Item | str | 条码号 |
| Bc\_his\_name | Item | str | 检测项目 |
| Bc\_Sam\_rem\_id | Item | str | 标本状态ID |
| Bc\_Sam\_rem | Item | str | 标本状态名称 |
| Bc\_lis\_code | Item | str | 项目代码 |
| Bc\_lis\_name | Item | str | 检测项目名称 |
| Bc\_yz\_id | Item | str | 医嘱ID |
| Bc\_status | Item | str | 条码当前状态 |
| Bc\_status\_name | Item | str | 条码当前状态名称 |
| Bc\_sam\_id | Item | str | 标本ID |
| Bc\_sam\_name | Item | str | 标本名称 |

#### 3.4.3.5注意事项

无

    1.
### 状态回写 LIS\_OperationRecord

#### 3.4.4.1服务名 MessageCategory （消息类别）

LIS\_OperationRecord

#### 3.4.4.2用途

回写条码状态

#### 3.4.4.3业务请求消息BusinessRequest

| **\<Request\>**  **\<AccessKey\>gysy-eai\</AccessKey\>**  **\<RequestData\>**  **\<bc\_bar\_code\>8009224929\</bc\_bar\_code\>**  **\<operationstatus\>5\</operationstatus\>**  **\<operationtime\>2021-08-14 10:25:27\</operationtime\>**  **\<operationname\>**** 许珏 ****\</operationname\>**  **\<operationworkid\>16485\</operationworkid\>**  **\<operationremark\>**** 备注 ****\</operationremark\>**  **\</RequestData\>**** \</Request\>** |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Bc\_bar\_code | RequestData | 是 | str | 条码号 |
| OperationStatus | RequestData | 是 | str | 操作状态 |
| OperationTime | RequestData | 是 | str | 操作时间 |
| OperationName | RequestData | 是 | str | 操作人员名称 |
| OperationWorkId | RequestData | 是 | str | 操作人员工号 |
| OperationRemark | RequestData | 否 | str | 备注 |
|
 |

#### 3.4.4.4返回业务数据 BusinessResponse

| **\<Response\>**  **\<ResultCode\>1\</ResultCode\>**  **\<ResultContent\>**** 成功 ****\</ResultContent\>**  **\<ResponseData /\>**** \</Response\>** |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0成功 1失败 |
| ResultContent | Result | str | 错误信息 |

#### 3.4.4.5注意事项

无

    1.
### 获取PDF报告 LIS\_GetPatientReport

#### 3.4.5.1服务名 MessageCategory （消息类别）

LIS\_GetPatientReport

#### 3.4.5.2用途

获取检验PDF报告

#### 3.4.5.3业务请求消息BusinessRequest

| \<?xml version="1.0" encoding="utf-8"?\>\<Request\>\<AccessKey\>\</AccessKey\>\<MethodName\>LIS\_GetPatientReport\</MethodName\>\<RequestData\>\<Report\_ID\>1025820180416104\</Report\_ID\>\<CustomReportSuffix\>英文\</CustomReportSuffix\>\</RequestData\>\</Request\>
 |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Report\_ID | Request | 是 | str | 报告单号 |
| CustomReportSuffix | Request | 否 | str | 中英文报告(中文传空，获取英文报告传参英文) |
|
 |

#### 3.4.5.4返回业务数据 BusinessResponse

| \<?xml version="1.0" encoding="utf-8"?\>\<Response\>\<ResultCode\>1\</ResultCode\>\<ResultContent\>成功\</ResultContent\>\<ResponseData\>\<Items\>\<Item\>\<Report\_ID\>\</Report\_ID\>\<PDFFile\>PDF(base64)\</PDFFile\>\</Item\>\</Items\>\</ResponseData\>\</Response\>
 |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Report\_ID |
 | str | 报告单号 |
| PDFFile |
 | str | PDF，base64 |

#### 3.4.5.5注意事项

无

    1.
### 危急值处理 LIS\_OperationUrgentRecord

#### 3.4.6.1服务名 MessageCategory （消息类别）

LIS\_OperationUrgentRecord

#### 3.4.6.2用途

危急值处理回写

#### 3.4.6.3业务请求消息BusinessRequest

| \<?xml version="1.0" encoding="utf-8"?\>\<Request\>\<AccessKey\>\</AccessKey\>\<RequestData\>\<Report\_ID\>10222201908094\</Report\_ID\>\<OperationTime\>2018-04-16 10:25:27\</OperationTime\>\<OperationName\>许珏\</OperationName\>\<OperationWorkId\>16485\</OperationWorkId\>\<OperationContent\>已处理\</OperationContent\>\<OperationIP\>192.168.1.1\</OperationIP\>\</RequestData\>\</Request\>
 |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Report\_ID | RequestData | 是 | str | 报告id |
| OperationTime | RequestData | 是 | str | 操作时间 |
| OperationName | RequestData | 是 | str | 医生名称 |
| OperationWorkId | RequestData | 是 | str | 医生工号 |
| OperationContent | RequestData | 否 | str | 内容 |
| OperationIP | RequestData | 否 | str | 操作电脑IP |
|
 |

#### 3.4.6.4返回业务数据 BusinessResponse

| \<?xml version="1.0"?\>\<Response\>\<ResultCode\>1\</ResultCode\>\<ResultContent\>成功\</ResultContent\>\<ResponseData\>\</ResponseData\>\</Response\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0成功 1失败 |
| ResultContent | Result | str | 错误信息 |

#### 3.4.6.5注意事项

无

    1.
### 获取微生物结果 LIS\_GetMicroResult

#### 3.4.7.1服务名 MessageCategory （消息类别）

LIS\_GetMicroResult

#### 3.4.7.2用途

获取微生物结果

#### 3.4.7.3业务请求消息BusinessRequest

| \<?xml version="1.0" encoding="utf-8"?\>\<Request\>\<AccessKey\>\</AccessKey\>\<RequestData\>\<Report\_ID\>1025820180416104\</Report\_ID\>\</RequestData\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Report\_ID | RequestData | 是 | str | 报告单号 |
|
 |

#### 3.4.7.4返回业务数据 BusinessResponse

| \<?xml version="1.0"?\>\<Response\>\<ResultCode\>1\</ResultCode\>\<ResultContent\>成功\</ResultContent\>\<ResponseData\>\<Items\>\<Item\>\<BacId\>100067\</BacId\>\<BacEname\>Staphylococcus aureus\</BacEname\>\<BacCname\>金黄色葡萄球菌\</BacCname\>\<BacCount\> \<10^3 CFU/ml\</BacCount\>\<BacExpertDesc\>\</BacExpertDesc\>\<BacTime\>2021/9/30 9:00:09\</BacTime\>\<AntId\>10037\</AntId\>\<AntEname\>青霉素G\</AntEname\>\<AntResult\>S\</AntResult\>\<AntMicValue\>3\</AntMicValue\>\<ResMethod\>\</ResMethod\>\<ObrBacId\>10086\</ObrBacId\>\<AntEname\>阿莫西林/棒酸\</AntEname\>\<AntResult\>I\</AntResult\>\<AntMicValue\>3.8\</AntMicValue\>\<ResMethod\>\</ResMethod\>\<PatDescribe\>\</PatDescribe\>\<PatPositiveFlag\>\</PatPositiveFlag\>\<SortNo\>\</SortNo\>\<Item\>\</Items\>\</ResponseData\>\</Response\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| BacId |
 | str | 检出菌ID |
| BacEname |
 | str | 检出菌英文名称 |
| BacCname |
 | str | 检出菌中文名称 |
| BacCount |
 | str | 菌落计数 |
| BacExpertDesc |
 | str | 专家评语 |
| BacTime |
 | str | 鉴定时间 |
| AntId |
 | str | 抗生素编码 |
| AntEname |
 | str | 抗生素名称 |
| AntResult |
 | str | 药敏结果 |
| AntMicValue |
 | str | MIC值 |
| AntKbValue |
 | str | KB值 |
| ResMethod |
 | str | 方法（暂无） |
| PatDescribe |
 | str | 涂片结果/阴性、阳性描述 |
| PatPositiveFlag |
 | str | 涂片阳性标志（ 0阴性 1阳性 ） |
| SortNo |
 | str | 排序 |

#### 3.4.7.5注意事项

无

## 3.5PACS提供接口

### 3.5.1检查报告列表 PACS\_getReportList

#### 3.5.1.1服务名 MessageCategory （消息类别）

PACS\_getReportList

#### 3.5.1.2用途

供第三方系统获取PACS系统的患者报告列表

#### 3.5.1.3业务请求消息BusinessRequest

| \<InPutXml\>\<req\>\<cardNo\>0000118231\</cardNo\>\<cardType\>0\</cardType\>\<beginDate\>2018-01-05\</beginDate\>\<endDate\>2021-07-06\</endDate\>\<SystemType\>2\</SystemType\>\</req\> \</InPutXml\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| cardNo | Request | 是 | str | 卡号 |
| cardType | Request | 是 | str | 卡类型（0：门诊 1：住院 2：体检） |
| beginDate | Request | 是 | str | 开始时间 |
| endDate | Request | 是 | str | 结束时间 |
| SystemType | Request | 是 | str | 检查类型 1：超声 2：放射 |

#### 3.5.1.4返回业务数据 BusinessResponse

| **\<res\>**  **\<resultCode\>0\</resultCode\>**  **\<resultDesc\>**** 成功 ****\</resultDesc\>**  **\<itemList\>**  **\<itemInfo\>**  **\<BranchId\>01\</BranchId\>**  **\<ApplyId\>46568538180828021\</ApplyId\>**  **\<Source\>1\</Source\>**  **\<SourceName\>**** 住院 ****\</SourceName\>**  **\<ClinicId\>\</ClinicId\>**  **\<AdmissTimes\>1\</AdmissTimes\>**  **\<VisitNumber\>101110234\</VisitNumber\>**  **\<TjNo\>\</TjNo\>**  **\<itemName\>**** 彩超检查****(****经腹部****)****妇科（组） ****\</itemName\>**  **\<executeDate\>20190624\</executeDate\>**  **\<status\>1\</status\>**  **\<appDate\>2019-06-24 07:53:25\</appDate\>**  **\<remark\>**** 双侧颈动脉及椎动脉管壁毛糙；右侧颈总动脉硬化斑形成；右侧椎动脉内径稍细。 ****双侧颈总动脉、颈内动脉、椎动脉血流未见明显异常。**** 甲状腺右侧叶多发混合回声小结节，拟 ****BI-RADS 3**** 类。 ****双侧颈侧区未见明显异常肿大淋巴结。**  **双侧乳腺结构紊乱，拟**** BI-RADS 1 ****类；双侧腋窝区未见明显肿大淋巴结。**** 子宫后位，子宫萎缩。宫颈多发囊肿。 ****双侧附件区未见明显异常包块声像。**** 肝大小正常，肝脏实质回声稍增粗，肝光点分布尚均匀，请结合临床。 ****肝内未见异常彩色血流信号。**** 胆囊超声检查未见明显异常。胆总管内径正常范围。 ****胰腺、脾脏超声检查未见明显异常。**** 双肾超声检查未见明显异常。 双肾血流未见明显异常。 ****双侧输尿管未见明显扩张。膀胱超声检查未见异常。**** \</remark\> **** \</itemInfo\> **** \<itemInfo\> **** \<BranchId\>01\</BranchId\> **** \<ApplyId\>46568538180828022\</ApplyId\> **** \<Source\>1\</Source\> **** \<SourceName\> ****住院**** \</SourceName\> **** \<ClinicId\>\</ClinicId\> **** \<AdmissTimes\>1\</AdmissTimes\> **** \<VisitNumber\>101110234\</VisitNumber\> **** \<TjNo\>\</TjNo\> **** \<itemName\> ****心脏彩超（组）**** \</itemName\> **** \<executeDate\>20190701\</executeDate\> **** \<status\>1\</status\> **** \<appDate\>2019-07-01 07:50:21\</appDate\> **** \<remark\> ****中度二尖瓣返流。**** 轻 ****-**** 中度三尖瓣返流。 ****左室舒张功能减退。**** 左室收缩功能正常。 ****房间隔膨胀瘤。**** \</remark\> **** \</itemInfo\> **** \</itemList\> ****\</res\>** |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | res | str | 0：成功，-1：失败 |
| ResultContent | res | str | 失败详细信息 |
| itemList | res | 节点 | 检查报告集合 |
| itemInfo | itemList | 节点 | 1..\*，检查报告实体 |
| BranchId | itemInfo | str | 院区ID |
| ApplyId | itemInfo | str | 申请单号 |
| Source | itemInfo | str | 来源ID，0门诊；1住院;2体检 |
| ClinicId | itemInfo | str | 门诊流水号，当Source = 0 时返回 |
| AdmissTimes | itemInfo | str | 住院次数，当Source = 1 时返回 |
| VisitNumber | itemInfo | str | 住院流水号，当Source = 1 时返回 |
| TjNo | itemInfo | str | 体检流水号，当Source = 2 时返回 |
| itemName | itemInfo | str | 检查项目 |
| executeDate | itemInfo | str | 报告时间 |
| status | itemInfo | str | 状态 |
| appDate | itemInfo | str | 申请时间 |
| remark | itemInfo | str | 报告提示 |
| itemNum | itemInfo | str | 项目代码 |
| 根据请求报文不同，返回不同的检查项目类型 |

#### 3.5.1.5注意事项

无

### 3.5.2获取PDF报告 PACS\_getpdfreport

#### 3.5.2.1服务名 MessageCategory （消息类别）

PACS\_getpdfreport

#### 3.5.2.2用途

供第三方获取PDF格式报告

#### 3.5.2.3业务请求消息BusinessRequest

| \<InPutXml\>\<req\> \<itemId\>46506978311065463\</itemId\>\<SystemType\>2\</SystemType\>\</req\>\</InPutXml\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| itemId | Request | 是 | str | 申请单号 |
| SystemType | Request | 是 | str | 检查类型 1：超声 2：放射 |
|
 |

#### 3.5.2.4返回业务数据 BusinessResponse

| \<return "\>\<![CDATA[\<res\> \<resultCode\>0\</resultCode\> \<resultDesc\>成功\</resultDesc\> \<examItemList\>\<pdfdir\>Pdfreport\</pdfdir\> \</examItemList\>\</res\>]]\>\</return\>
 |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| resultCode | Result | str | 响应码 |
| resultDesc | Result | str | 响应信息 |
| Pdfreport | examItem | str | PDF报告based64 |

#### 3.5.2.5注意事项

无

### 3.5.3接受危急值处理信息 PACS\_dangerous

#### 3.5.3.1服务名 MessageCategory （消息类别）

PACS\_dangerous

#### 3.5.3.2用途

接受危机系统返回的处理结果

#### 3.5.3.3业务请求消息BusinessRequest

| \<InPutXml\>\<req\> \<itemId\>123456\</itemId\>\<SystemType\>2\</SystemType\>\<Patientname\>李四\</Patientname\>\<Hisid\>11111\</Hisid\>\<Result1\>出血\</Result1\>\<Result2\>已处理\</Result2\>\<Dept\>内科\</Dept\>\<Replydoctor\>张三\</Replydoctor\>\<Noticetime\>2021-02-13 12:12:12\</Noticetime\>\</req\>\</InPutXml\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| itemId | Request | 是 | str | 申请单号 |
| SystemType | Request | 是 | str | 检查类型 1：超声 2：放射 |
| Hisid | Request | 是 | str | His系统的病人id |
| Result1 | Request | 是 | str | 危急值内容 |
| Result2 | Request | 是 | str | 处理意见 |
| Replydoctor | Request | 是 | str | 处理医生 |
| Dept | Request | 是 | str | 处理诊室 |
| Noticetime | Request | 是 | str | 处理时间 |
| Patientname | Request | 是 | str | 患者姓名 |

#### 3.5.3.4返回业务数据 BusinessResponse

| \<return "\>\<![CDATA[\<res\> \<resultCode\>0\</resultCode\> \<resultDesc\>成功\</resultDesc\> \<examItemList\> \</examItemList\>\</res\>]]\>\</return\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| resultCode | Result | str | 响应码 |
| resultDesc | Result | str | 响应信息 |

#### 3.5.3.5注意事项

无

### 3.5.4检查报告明细 PACS\_getExamDetail

#### 3.5.4.1服务名 MessageCategory （消息类别）

PACS\_getExamDetail

#### 3.5.4.2用途

供第三方获取报告详细内容

#### 3.5.4.3业务请求消息BusinessRequest

| \<InPutXml\>\<req\> \<itemId\>46506978311065463\</itemId\>\<SystemType\>2\</SystemType\>\</req\>\</InPutXml\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| itemId | Request | 是 | str | 申请单号 |
| SystemType | Request | 是 | str | 检查类型 1：超声 2：放射 |
|
 |

#### 3.5.4.4返回业务数据 BusinessResponse

| \<return "\>\<![CDATA[\<res\> \<resultCode\>0\</resultCode\> \<resultDesc\>成功\</resultDesc\> \<examItemList\> \<examItem\> \<examNo/\>\<pdfdir\>Pdfreport\</pdfdir\> \<examName\>彩超检查(经腹部)妇科（组）\</examName\> \<content\> 右侧颈总动脉IMT0.9mm，左侧颈总动脉IMT1.1mm，双侧颈总动脉、颅外段颈内动脉、颈外动脉、椎动脉管壁内膜毛糙，右侧颈总动脉分叉处管壁可见一个规则均质强回声斑，大小约2.6\*1.0mm，管腔未见明显扩张或狭窄，走向正常。CDFI：上述动脉管腔彩色血流信号充盈好，血流方向正常，未见异常彩色血流信号，血流指标如下: 右侧：CCA Vmax:58cm/s，RI:0.72，ICA Vmax:69cm/s，RI:0.60，VA（内径2.0mm） Vmax:44cm/s，RI:0.64；左侧：CCA Vmax:78cm/s，RI:0.58，ICA Vmax:84cm/s，RI:0.68，VA（内径4.8mm） Vmax:40cm/s，RI:0.65。甲状腺右叶横径为18mm，甲状腺右叶前后径为10mm，甲状腺右叶上下径为43mm，甲状腺左叶横径为17mm，甲状腺左叶前后径为11mm，甲状腺左叶上下径为45mm，甲状腺峡部厚为2mm。甲状腺大小正常，形态规则，包膜光滑，内部回声欠均匀，甲状腺右侧叶内可见数个类圆形混合回声团，最大7\*4mm，边界清晰，内部回声欠均匀。CDFI示：甲状腺右侧叶内混合回声团周边可见小条状低速血流信号，内部未见明显血流信号，双侧甲状腺上动脉血流速度正常。双侧颈侧区未见明显异常肿大淋巴结。双侧乳腺厚薄不均，腺内结构稍紊乱，呈强回声条与条状暗区相间隔。CDFI示：双侧乳腺未见异常血流信号。双侧腋窝区未见明显肿大团块回声。子宫纵径为41mm，子宫厚径为30mm，子宫横径为40mm，内膜厚为2mm，宫颈长为23mm，双侧卵巢显示不清。子宫后位，形态规则，宫腔线欠清晰，子宫内膜回声欠均匀，宫颈内部可见多个类圆形无回声区，最大为6\*5mm，边界清晰。宫内节育环未见，宫腔内未见异常声像，宫壁光点分布均匀，未见实性团块回声。CDFI：子宫及双附件区未见明显彩色血流信号。肝脏大小、形态正常，肝包膜平滑，肝内血管清晰，肝脏实质回声稍增粗，肝光点分布尚均匀。 CDFI：肝内未见异常彩色血流信号，门静脉为入肝血流，肝静脉、门静脉未见扩张及变窄，血流信号通畅。胆囊大小、形态正常，囊壁光滑，囊内未见明显异常回声。胆总管内径超声测值正常范围。胰腺大小、形态正常，轮廓清晰，实质回声均匀，胰管未见扩张。脾脏大小、形态正常，轮廓清晰，包膜完整，脾内未见异常回声，脾静脉未见扩张。双肾大小、形态正常，轮廓线清晰，实质回声低，皮髓质分界清晰，集合系统无分离，肾内未见病变回声。CDFI示：双肾血流信号丰富，双肾内未见明显异常血流信号。双侧输尿管未见明显扩张。膀胱充盈良好，膀胱壁不厚，内膜平整，腔内未见明显占位病变。\</content\> \<prompt\> 双侧颈动脉及椎动脉管壁毛糙；右侧颈总动脉硬化斑形成；右侧椎动脉内径稍细。双侧颈总动脉、颈内动脉、椎动脉血流未见明显异常。甲状腺右侧叶多发混合回声小结节，拟BI-RADS 3类。双侧颈侧区未见明显异常肿大淋巴结。 双侧乳腺结构紊乱，拟BI-RADS 1类；双侧腋窝区未见明显肿大淋巴结。子宫后位，子宫萎缩。宫颈多发囊肿。双侧附件区未见明显异常包块声像。肝大小正常，肝脏实质回声稍增粗，肝光点分布尚均匀，请结合临床。肝内未见异常彩色血流信号。胆囊超声检查未见明显异常。胆总管内径正常范围。胰腺、脾脏超声检查未见明显异常。双肾超声检查未见明显异常。 双肾血流未见明显异常。双侧输尿管未见明显扩张。膀胱超声检查未见异常。\</prompt\> \</examItem\> \</examItemList\>\</res\>]]\>\</return\>
 |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| resultCode | Result | str | 响应码 |
| resultDesc | Result | str | 响应信息 |
| examName | examItem | str | 项目名称 |
| content | examItem | str | 检查所见 |
| prompt | examItem | str | 检查提示 |
| examNo | examItem | str | 项目编号 |
| Pdfreport | examItem | str | PDF报告based64 |

#### 3.5.4.5注意事项

无

### 3.5.5产前检查报告列表 PACS\_astraia\_getReportList

#### 3.5.5.1服务名 MessageCategory （消息类别）

PACS\_astraia\_getReportList

#### 3.5.5.2用途

供第三方系统获取产前系统的患者报告列表

#### 3.5.5.3业务请求消息BusinessRequest

| \<req\>\<cardNo\>\</cardNo\>\<cardType\>\</cardType\>\<beginDate\>\</beginDate\>\<endDate\>\</endDate\>\<SystemType\>1\</SystemType\>\</req\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| cardNo | Request | 是 | str | 卡号 |
| cardType | Request | 是 | str | 卡类型 |
| beginDate | Request | 是 | str | 开始时间 |
| endDate | Request | 是 | str | 结束时间 |
| SystemType | Request | 是 | str | 检查类型 3：产前 |

#### 3.5.5.4返回业务数据 BusinessResponse

| \<res\> \<resultCode\>0\</resultCode\> \<resultDesc\>成功\</resultDesc\> \<itemList\> \<itemInfo\> \<itemId\>444441111111\</itemId\>\<examId\>123456\</examId\> \<itemName\>NT\</itemName\> \<executeDate\>20190624\</executeDate\> \<remark\> 子宫内妊娠，如孕12+4周，单活胎。\</remark\> \</itemInfo\> \<itemInfo\> \<itemId\>444441111112\</itemId\>\<examId\>333221\</examId\> \<itemName\>III级\</itemName\> \<executeDate\>20190701\</executeDate\> \<remark\> 子宫内妊娠，如孕24+2周，单活胎胎儿后颅窝增宽腹腔积液心胸比增大羊水过少建议胎儿医学科就诊进行咨询\</remark\> \</itemInfo\> \<itemInfo\> \<itemId\>444441111113\</itemId\>\<examId\>334221\</examId\> \<itemName\>I级\</itemName\> \<executeDate\>20200616\</executeDate\> \<remark\> 子宫内妊娠，如孕28+2周，单活胎\</remark\> \</itemInfo\> \<itemInfo\> \<itemId\>444441111114\</itemId\>\<examId\>343421\</examId\> \<itemName\>I级\</itemName\> \<executeDate\>20200617\</executeDate\> \<remark\> 子宫内妊娠，如孕33+6周，单活胎\</remark\> \</itemInfo\> \<itemInfo\> \<itemId\>4444411111115\</itemId\>\<examId\>431561\</examId\> \<itemName\>I级\</itemName\> \<executeDate\>20200902\</executeDate\> \<remark\> 子宫内妊娠，如孕36+6周，单活胎\</remark\> \</itemInfo\> \<itemInfo\> \<itemId\>4444411111116\</itemId\>\<examId\>633411\</examId\> \<itemName\>I级\</itemName\> \<executeDate\>20210513\</executeDate\> \<remark\> 子宫内妊娠，如孕39+6周，单活胎\</remark\> \</itemInfo\> \</itemList\>\</res\>
 |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| itemId | Result | str | 申请单号 |
| itemName | Result | str | 检查项目 |
| executeDate | itemInfo | str | 报告时间 |
| status | itemInfo | str | 状态 |
| appDate | itemInfo | str | 申请时间 |
| remark | itemInfo | str | 报告提示 |

#### 3.5.5.5注意事项

无

### 3.5.6获取产前系统PDF报告 PACS\_astraia\_getPdfReport

#### 3.5.6.1服务名 MessageCategory （消息类别）

PACS\_astraia\_getPdfReport

#### 3.5.6.2用途

供第三方获取产前系统的PDF格式报告

#### 3.5.6.3业务请求消息BusinessRequest

| \<req\> \<itemId\>123456\</itemId\>\<SystemType\>1\</SystemType\>\</req\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| itemId | Request | 是 | str | 申请单号 |
| SystemType | Request | 是 | str | 检查类型 3：产前 |

#### 3.5.6.4返回业务数据 BusinessResponse

| \<res\> \<resultCode\>0\</resultCode\> \<resultDesc\>成功\</resultDesc\> \<examItemList\>\<pdfdir\>Pdfreport\</pdfdir\> \</examItemList\>\</res\>
 |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| resultCode | Result | str | 响应码 |
| resultDesc | Result | str | 响应信息 |
| Pdfreport | examItem | str | PDF报告based64 |

#### 3.5.6.5注意事项

无

### 3.5.7产前检查报告明细 PACS\_astraia\_getExamDetail

#### 3.5.7.1服务名 MessageCategory （消息类别）

PACS\_astraia\_getExamDetail

#### 3.5.7.2用途

供第三方获取产前报告详细内容

#### 3.5.7.3业务请求消息BusinessRequest

| \<req\> \<itemId\>12345\</itemId\>\<SystemType\>1\</SystemType\>\</req\>
 |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| itemId | Request | 是 | str | 申请单号 |
| SystemType | Request | 是 | str | 检查类型 3：产前 |

#### 3.5.7.4返回业务数据 BusinessResponse

| \<res\> \<resultCode\>0\</resultCode\> \<resultDesc\>成功\</resultDesc\> \<examItemList\> \<examItem\> \<examNo/\>\<pdfdir\>Pdfreport\</pdfdir\> \<examName\>I级检查\</examName\> \<content\> 孕周:40周+0天; BPD:101.7mm; HC:342.1mm; AC:371.3mm; FL:73.5mm; HL:64.7mm; EFW:4061g; 胎儿心跳：可见; 胎位:LOT; 脐带:颈后脐带影0周\</content\> \<prompt\> 子宫内妊娠，如晚孕，单活胎\</prompt\> \</examItem\> \</examItemList\>\</res\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| resultCode | Result | str | 响应码 |
| resultDesc | Result | str | 响应信息 |
| examName | examItem | str | 项目名称 |
| content | examItem | str | 检查所见 |
| prompt | examItem | str | 检查提示 |
| examNo | examItem | str | 项目编号 |
| Pdfreport | examItem | str | PDF报告based64 |

#### 3.5.7.5注意事项

无

## 3.6体检提供接口

### 3.6.1获取检验申请单 PEIS\_RepLisQuery

#### 3.6.1.1服务名 MessageCategory （消息类别）

PEIS\_RepLisQuery

#### 3.6.1.2用途

提供检验申请单信息

#### 3.6.1.3业务请求消息BusinessRequest

| \<?xml version="1.0" encoding="utf-8"?\>\<Request\>\<TjNo\>体检流水号\</TjNo\>\<StartTime\>申请开始时间\</StartTime\>\<EndTime\>申请结束时间\</EndTime\>\</Request\>
 |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| TjNo | Request | 是 | str | 体检流水号 |
| StartTime | Request | 否 | str | 时间范围：开始时间 |
| EndTime | Request | 否 | str | 时间范围：结束时间 |
|
 |

#### 3.6.1.4返回业务数据 BusinessResponse

| \<?xml version="1.0"?\>\<Response\>\<Status\>0成功 -1失败\</Status\>\<Message\>错误信息\</Message\>\<Entity\>\<RegisterNo\>100061913\</RegisterNo\>\<Admiss\_Times\>1\</Admiss\_Times\>\<Patient\_Name\>樊震\</Patient\_Name\>\<Sex\>2\</Sex\>\<Age\>28\</Age\>\<DOB\>1992-10-19 0:00:00\</DOB\>\<Address\>河南省新乡市卫滨区解放大道南３２８号１２号楼３单元１７号\</Address\>\<Phone\>18738548544\</Phone\>\<Source\>2\</Source\>\<Card\_No\>510513000001\</Card\_No\>\<TjNo\>510513000001\</TjNo\>\<Exam\_Company\_name /\>\<Dept\_Name\>体检科\</Dept\_Name\>\<Dept\_Code\>S01\</Dept\_Code\>\<DOCT\_CODE\>001\</DOCT\_CODE\>\<DOCT\_NAME\>体检中心\</DOCT\_NAME\>\<APPLY\_DATE\>2021-5-22 18:37:26\</APPLY\_DATE\>\<ID\_No\>410703199210192042\</ID\_No\>\<bc\_oldlis\_barcode\>河南省新乡市卫滨区解放大道南３２８号１２号楼３单元１７号\</bc\_oldlis\_barcode\>\<EMPID\>100061913\</EMPID\>\<Items\>\<ReqItemnames\>\<TjNo\>510513000001\</TjNo\>\<Order\_code\>601893\</Order\_code\>\<Order\_name\>肝功能\</Order\_name\>\<Sam\_code\>601893\</Sam\_code\>\<Sam\_name\>肝功能\</Sam\_name\>\<Order\_id\>1224824\</Order\_id\>\<urgent\_flag\>0\</urgent\_flag\>\<price\>25.000\</price\>\<Del\_flag\>0\</Del\_flag\>\</ReqItemnames\>\<ReqItemnames\>\<TjNo\>510513000001\</TjNo\>\<Order\_code\>601894\</Order\_code\>\<Order\_name\>肾功能\</Order\_name\>\<Sam\_code\>601894\</Sam\_code\>\<Sam\_name\>肾功能\</Sam\_name\>\<Order\_id\>1224825\</Order\_id\>\<urgent\_flag\>0\</urgent\_flag\>\<price\>15.000\</price\>\<Del\_flag\>0\</Del\_flag\>\</ReqItemnames\>\</Items\>\</Entity\>\</Response\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Status | Response | str | 0：成功，-1：失败 |
| Message | Response | str | 失败详细信息 |
| Entity | Response | 节点 | 实例节点 |
| RegisterNo | Entity | str | 体检号 |
| Admiss\_Times | Entity | Int | 就诊次数 |
| Patient\_Name | Entity | str | 姓名 |
| Sex | Entity | str | 性别 |
| Age | Entity | str | 年龄 |
| DOB | Entity | str | 出生日期 |
| Address | Entity | str | 地址 |
| Phone | Entity | str | 电话 |
| Source | Entity | str | 病人来源 |
| Card\_No | Entity | str | 就诊卡号 |
| TjNo | Entity | str | 体检流水号 |
| Exam\_Company\_name | Entity | str | 体检单位 |
| Dept\_Name | Entity | str | 申请科室名称 |
| Dept\_Code | Entity | str | 申请科室编码 |
| DOCT\_CODE | Entity | str | 申请医生编码 |
| DOCT\_NAME | Entity | str | 申请医生姓名 |
| APPLY\_DATE | Entity | str | 申请时间 |
| ID\_No | Entity | str | 证件号码 |
| bc\_oldlis\_barcode | Entity | str | 户籍地 |
| EMPID | Entity | str | 患者主索引 |
| Items | Entity | str | 检验项目节点 |
| ReqItemnames | Items | str | 检验项目实体 |
| TjNo | ReqItemnames | str | 体检流水号 |
| Order\_code | ReqItemnames | str | 检验项目代码 |
| Order\_name | ReqItemnames | str | 检验项目名称 |
| Sam\_code | ReqItemnames | str | 医嘱标本代码 |
| Sam\_name | ReqItemnames | str | 医嘱标本名称 |
| Order\_id | ReqItemnames | str | 医嘱号 |
| urgent\_flag | ReqItemnames | str | 加急标志 |
| price | ReqItemnames | str | 价格 |
| Del\_flag | ReqItemnames | str | 作废标志 |

#### 3.6.1.5注意事项

TjNo必须有值，其他参数可选。

### 3.6.2获取检查申请单信息 PEIS\_CustomerInfo

#### 3.6.2.1服务名 MessageCategory （消息类别）

PEIS\_CustomerInfo

#### 3.6.2.2用途

提供体检检查申请单信息

#### 3.6.2.3业务请求消息BusinessRequest

| \<?xml version="1.0" encoding="utf-8"?\>\<Request\>\<CardNum\>体检流水号\</CardNum\>\<ItemType\>项目类别\</ItemType\>\</Request\>
 |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| CardNum | Request | 是 | str | 体检流水号 |
| ItemType | Request | 否 | str | 项目类别：以下各类别代码CT：CT、核磁：MR、放射：DR、超声：US、内镜：ES、病理：PIS、心电：ECG |
| CardNum必填；ItemType不填则返回所有非检验项目 |

#### 3.6.2.4返回业务数据 BusinessResponse

| \<?xml version="1.0"?\>\<Response\>\<Status\>0成功 -1失败\</Status\>\<Message\>错误信息\</Message\>\<Entity\>\<PatientID\>客户唯一号\</PatientID\>\<Name\>姓名\</Name\>\<Sex\>性别\</Sex\>\<Birthday\>出生日期\</Birthday\>\<IDCardNum\>身份证号\</IDCardNum\>\<Addr\>地址\</Addr\>\<Tele\>电话\</Tele\>\<CardNum\>卡号(体检流水号)\</CardNum\>\<OrderCode\>订单号\</OrderCode\>\<ItemCode\>项目编号\</ItemCode\>\<ItemId\>医嘱号\</ItemId\>\<ItemName\>项目名称\</ItemName\>\</Entity\>\</Response\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Status | Response | str | 0：成功，-1：失败 |
| Message | Response | str | 失败详细信息 |
| Entity | Response | 节点 | 实例节点 |
| PatientID | Entity | str | 客户唯一号 |
| Name | Entity | str | 姓名 |
| Sex | Entity | str | 性别 |
| Birthday | Entity | str | 出生日期 |
| IDCardNum | Entity | str | 身份证号 |
| Addr | Entity | str | 地址 |
| Tele | Entity | str | 电话 |
| CardNum | Entity | str | 卡号(体检流水号) |
| OrderCode | Entity | str | 订单号 |
| ItemCode | Entity | str | 项目编号 |
| ItemId | Entity | str | 医嘱号 |
| ItemName | Entity | str | 项目名称 |

#### 3.6.2.5注意事项

CardNum必填；ItemType不填则返回所有非检验项目

### 3.6.3项目状态回写 PEIS\_UpdateItemCheckStatus

#### 3.6.3.1服务名 MessageCategory （消息类别）

PEIS\_UpdateItemCheckStatus

#### 3.6.3.2用途

回写项目检查状态

#### 3.6.3.3业务请求消息BusinessRequest

| \<?xml version="1.0" encoding="utf-8"?\>\<Request\>\<CardNum\>体检流水号\</CardNum\>\<ItemCode\>项目编号\</ItemCode\>\<ItemId\>医嘱号\</ItemId\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| CardNum | Request | 是 | str | 体检流水号 |
| ItemCode | Request | 是 | str | 项目编号 |
| ItemId | Request | 是 | str | 医嘱号 |
| CardNum必填；ItemCode、ItemId对接方可选其一进行传值 |

#### 3.6.3.4返回业务数据 BusinessResponse

| \<?xml version="1.0"?\>\<Response\>\<Status\>0成功 -1失败\</Status\>\<Message\>错误信息\</Message\>\</Response\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Status | Response | str | 0：成功，-1：失败 |
| Message | Response | str | 失败详细信息 |

#### 3.6.3.5注意事项

无

### 3.6.4结果状态回写 PEIS\_UpdateItemGetReport

#### 3.6.4.1服务名 MessageCategory （消息类别）

PEIS\_UpdateItemGetReport

#### 3.6.4.2用途

回写项目检查结果状态

#### 3.6.4.3业务请求消息BusinessRequest

| \<?xml version="1.0" encoding="utf-8"?\>\<Request\>\<CardNum\>体检流水号\</CardNum\>\<ItemCode\>项目编号\</ItemCode\>\<ItemId\>医嘱号\</ItemId\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| CardNum | Request | 是 | str | 体检流水号 |
| ItemCode | Request | 是 | str | 项目编号 |
| ItemId | Request | 是 | str | 医嘱号 |
| CardNum必填；ItemCode、ItemId对接方可选其一进行传值 |

#### 3.6.4.4返回业务数据 BusinessResponse

| \<?xml version="1.0"?\>\<Response\>\<Status\>0成功 -1失败\</Status\>\<Message\>错误信息\</Message\>\</Response\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Status | Response | str | 0：成功，-1：失败 |
| Message | Response | str | 失败详细信息 |

#### 3.6.4.5注意事项

无

### 3.6.5获取体检报告 PEIS\_RepBGReport

#### 3.6.5.1服务名 MessageCategory （消息类别）

PEIS\_RepBGReport

#### 3.6.5.2用途

获取体检报告

#### 3.6.5.3业务请求消息BusinessRequest

| \<?xml version="1.0" encoding="utf-8"?\>\<Request\>\<CardNum\>体检流水号\身份证号\</CardNum\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| CardNum | Request | 是 | str | 体检流水号\身份证号 |
|
 |

#### 3.6.5.4返回业务数据 BusinessResponse

| \<?xml version="1.0"?\>\<Response\>\<Status\>0成功 -1失败\</Status\>\<Message\>错误信息\</Message\>\<Entity\>\<PatientID\>客户唯一号\</PatientID\>\<Name\>姓名\</Name\>\<Sex\>性别\</Sex\>\<Birthday\>出生日期\</Birthday\>\<IDCardNum\>身份证号\</IDCardNum\>\<Addr\>地址\</Addr\>\<Tele\>电话\</Tele\>\<CardNum\>卡号(体检流水号)\</CardNum\>\<Report\>base64格式PDF体检报告\</Report\>\</Entity\>\</Response\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Status | Response | str | 0：成功，-1：失败 |
| Message | Response | str | 失败详细信息 |
| Entity | Response | 节点 | 实例节点 |
| PatientID | Entity | str | 客户唯一号 |
| Name | Entity | str | 姓名 |
| Sex | Entity | str | 性别 |
| Birthday | Entity | str | 出生日期 |
| IDCardNum | Entity | str | 身份证号 |
| Addr | Entity | str | 地址 |
| Tele | Entity | str | 电话 |
| CardNum | Entity | str | 卡号(体检流水号) |
| Report | Entity | str | base64格式PDF体检报告 |

#### 3.6.5.5注意事项

无

## 3.7EMPI提供接口

### 3.7.1查询患者服务 EMPI\_QueryPatient

#### 3.7.1.1服务名 MessageCategory （消息类别）

EMPI\_QueryPatient

#### 3.7.1.2用途

查询患者基本信息、EMPI编号

#### 3.7.1.3业务请求消息BusinessRequest

| \<root\>\<IDCardNum\>440111111111111111\</IDCardNum\>\<RealName\>测试患者1号\</RealName\>\<LinkTel\>联系电话\</LinkTel\>\</root\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| CardType | root | 否 | str | 患者证件类型 |
| IDCardNum | root | 否 | str | 身份证号 |
| RealName | root | 否 | str | 姓名 |
| LinkTel | root | 否 | str | 联系电话 |
| GenderCode | root | 否 | str | 性别编码 |
| GenderName | root | 否 | str | 性别名称 |
| DateOfBirth | root | 否 | str | 生日 |
| FullAddress | root | 否 | str | 家庭住址 |
| MedicalCardNum | root | 否 | str | 卡号 |

#### 3.7.1.4返回业务数据BusinessResponse

| **\<?xml version = "1.0" encoding = "utf-8"?\>**** \<Result\> **** \<Success\>0\</Success\> **** \<Message\> ****查询成功**** \</Message\> **** \<Patient\> **** \<Rows\> **** \<IDCardNum\>440111111111111111\</IDCardNum\> **** \<RealName\> ****测试患者**** 1 ****号**** \</RealName\> **** \<LinkTel\> ****联系电话**** \</LinkTel\> **** \<GenderCode\>1\</GenderCode\> **** \<GenderName\> ****男性**** \</GenderName\> **** \<DateOfBirth\>2021/4/1 0:00:00\</DateOfBirth\> **** \<FullAddress\> ****家庭住址**** \</FullAddress\> **** \<AddrStateCode\>\</AddrStateCode\> **** \<AddrStateName\>\</AddrStateName\> **** \<AddrCityCode\>\</AddrCityCode\> **** \<AddrCityName\>\</AddrCityName\> **** \<AddrCountyCode\>\</AddrCountyCode\> **** \<AddrCountyName\>\</AddrCountyName\> **** \<AddrStreetNameBase\>\</AddrStreetNameBase\> **** \<AddrStreetName\>\</AddrStreetName\> **** \<HouseNumber\>\</HouseNumber\> **** \<PostalCode\>\</PostalCode\> **** \<MaritalStatusCode\>0\</MaritalStatusCode\> **** \<MaritalStatusName\>\</MaritalStatusName\> **** \<EthnicGroupCode\>\</EthnicGroupCode\> **** \<EthnicGroupName\>\</EthnicGroupName\> **** \<OccupationCode\>\</OccupationCode\> **** \<OccupationName\>\</OccupationName\> **** \<EmployerOrgName\>\</EmployerOrgName\> **** \<EmployerOrgTel\>\</EmployerOrgTel\> **** \<HealthCardNum\>\</HealthCardNum\> **** \<HealthCardScopingOrg\>\</HealthCardScopingOrg\> **** \<HealthFileNum\>\</HealthFileNum\> **** \<HealthFileScopingOrg\>\</HealthFileScopingOrg\> **** \<LinkManTel\>\</LinkManTel\> **** \<LinkManName\>\</LinkManName\> **** \<ProvOrgCode\>222\</ProvOrgCode\> **** \<ProvOrgName\>\</ProvOrgName\> **** \<MedInsTypeCode\>\</MedInsTypeCode\> **** \<MedInsTypeName\>\</MedInsTypeName\> **** \<AuthorEmpCode\>\</AuthorEmpCode\> **** \<AuthorEmpName\>\</AuthorEmpName\> **** \<SocialSecurityCardNum\>\</SocialSecurityCardNum\> **** \<MedicalCardNum\>4401111111111\</MedicalCardNum\> **** \<EMailAddress\>\</EMailAddress\> **** \<BloodTypeABOCode\>0\</BloodTypeABOCode\> **** \<BloodTypeABOName\>2021-04-01 06:05:31\</BloodTypeABOName\> **** \<BloodTypeRh\>0\</BloodTypeRh\> **** \<NationalityCode\>\</NationalityCode\> **** \<NationalityName\>\</NationalityName\> **** \<EmpiId\>93d45163-f4f1-4707-9b56-3e945ad7d151\</EmpiId\> **** \</Rows\> **** \</Patient\> ****\</Result\>** |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Success | Result | str | 是否成功：0成功，1失败 |
| Message | Result | str | 消息 |
| IDCardNum | Rows | str | 身份证号 |
| RealName | Rows | str | 姓名 |
| LinkTel | Rows | str | 联系电话 |
| GenderCode | Rows | str | 性别代码 |
| GenderName | Rows | str | 性别描述 |
| DateOfBirth | Rows | str | 出生时间 |
| FullAddress | Rows | str | 非结构化户籍地址 |
| AddrStateCode | Rows | str | 常住地址省代码 |
| AddrStateName | Rows | str | 常住地址省名称 |
| AddrCityCode | Rows | str | 常住地址市代码 |
| AddrCityName | Rows | str | 常住地址市名称 |
| AddrCountyCode | Rows | str | 常住地址县代码 |
| AddrCountyName | Rows | str | 常住地址县名称 |
| AddrStreetNameBase | Rows | str | 常住地址乡 |
| AddrStreetName | Rows | str | 常住地址村 |
| HouseNumber | Rows | str | 常住地址门牌号码 |
| PostalCode | Rows | str | 邮政编码 |
| MaritalStatusCode | Rows | str | 婚姻状况代码 |
| MaritalStatusName | Rows | str | 婚姻状况描述 |
| EthnicGroupCode | Rows | str | 民族代码 |
| EthnicGroupName | Rows | str | 民族描述 |
| OccupationCode | Rows | str | 职业类别代码 |
| OccupationName | Rows | str | 职业类别名称 |
| EmployerOrgName | Rows | str | 工作单位名称 |
| EmployerOrgTel | Rows | str | 工作单位联系电话 |
| HealthCardNum | Rows | str | 居民健康卡号 |
| HealthCardScopingOrg | Rows | str | 健康卡发放机构 |
| HealthFileNum | Rows | str | 城乡居民健康档案编号 |
| HealthFileScopingOrg | Rows | str | 建档医疗机构组织机构代码 |
| LinkManTel | Rows | str | 联系人电话 |
| LinkManName | Rows | str | 联系人姓名 |
| ProvOrgCode | Rows | str | 登记机构代码 |
| ProvOrgName | Rows | str | 登记机构名称 |
| MedInsTypeCode | Rows | str | 医疗保险类别代码 |
| MedInsTypeName | Rows | str | 医疗保险类别名称 |
| AuthorEmpCode | Rows | str | 登记人代码 |
| AuthorEmpName | Rows | str | 登记人姓名 |
| SocialSecurityCardNum | Rows | str | 社会保障卡卡号 |
| MedicalCardNum | Rows | str | 就诊卡号 |
| EMailAddress | Rows | str | 电子邮件地址 |
| BloodTypeABOCode | Rows | str | 患者ABO血型系统中的编码 |
| BloodTypeABOName | Rows | str | 患者ABO血型系统中的名称 |
| BloodTypeRh | Rows | str | 血型Rh |
| NationalityCode | Rows | str | 国籍代码 |
| NationalityName | Rows | str | 国籍名称 |
| EmpiId | Rows | str | 患者主索引唯一ID |

#### 3.7.1.5注意事项

无

### 3.7.2患者注册服务 EMPI\_RegisterPatient

#### 3.7.2.1服务名 MessageCategory （消息类别）

EMPI\_RegisterPatient

#### 3.7.2.2用途

向平台注册新患者，平台分配EMPI编号

#### 3.7.2.3业务请求消息BusinessRequest

| \<root\> \<CardType\>01\</CardType\> \<IDCardNum\>440111111111111111\</IDCardNum\> \<RealName\>测试患者1号\</RealName\> \<LinkTel\>联系电话\</LinkTel\> \<GenderCode\>1\</GenderCode\> \<GenderName\>男性\</GenderName\> \<DateOfBirth\>2021-04-01\</DateOfBirth\> \<FullAddress\>家庭住址\</FullAddress\> \<MedicalCardNum\>4401111111111\</MedicalCardNum\> \<DomainPatId\>P121221221\</DomainPatId\>\</root\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| CardType | root | 否 | str | 患者证件类型 |
| IDCardNum | root | 否 | str | 身份证号 |
| RealName | root | 是 | str | 姓名 |
| LinkTel | root | 否 | str | 联系电话 |
| GenderCode | root | 否 | str | 性别编码 |
| GenderName | root | 否 | str | 性别名称 |
| DateOfBirth | root | 否 | str | 生日 |
| FullAddress | root | 否 | str | 家庭住址 |
| MedicalCardNum | root | 否 | str | 卡号 |

#### 3.7.2.4返回业务数据BusinessResponse

| \<?xml version="1.0" encoding="utf - 8"?\>\<Result\> \<Success\>0\</Success\> \<Message\>注册成功\</Message\> \<Data\>704a0b73-fc0b-4ac9-8faa-4313e33391e3\</Data\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Success | Result | str | 是否成功：0成功，1失败 |
| Message | Result | str | 消息 |
| Data | Result | str | 患者主索引唯一ID |

#### 3.7.2.5注意事项

无

## 3.8MDM提供接口

### 3.8.1获取令牌 MDM\_Auth

#### 3.8.1.1服务名 MessageCategory （消息类别）

MDM\_Auth

#### 3.8.1.2用途

获取MDM系统令牌

#### 3.8.1.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>\</Token\> \</Header\> \<Body\> \<AppCode\>aladmin\</AppCode\> \<TenantID\>MDMD111\</TenantID\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| AppCode | Body | 是 | str | 用户Code（对接时需要联系管理员分配应用账号） |
| TenantID | Body | 是 | str | 租户ID（对接时需要联系管理员分配租户ID） |

#### 3.8.1.4返回业务数据BusinessResponse

| \<Header\> \<Token\>DF1911A6E15A3448D1865BEA70BA88ED\</Token\> \<StatusCode\>Success\</StatusCode\> \<Message\>登录成功\</Message\> \</Header\> \<Body\> \<Name\>阿里巴巴\</Name\> \<Code\>1343821922160480256\</Code\> \<IsAdmin\>false\</IsAdmin\> \<IsSSO\>false\</IsSSO\> \<IsThird\>true\</IsThird\> \</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| Message | Header | str | 消息 |
| Name | Body | str | 名称 |
| Code | Body | str | 用户ID |
| IsAdmin | Body | bool | 是否管理员 |
| IsSSO | Body | bool | 是否单点登录 |
| IsThird | Body | bool | 是否外部用户 |

#### 3.8.1.5注意事项

无

### 3.8.2获取元数据契约列表 MDM\_GetTableList

#### 3.8.2.1服务名 MessageCategory （消息类别）

MDM\_GetTableList

#### 3.8.2.2用途

获取元数据契约列表（有读权限）

#### 3.8.2.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \</Header\> \<Body\>0\</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| Body | request | 是 | str | 菜单ID(默认传0) |

#### 3.8.2.4返回业务数据BusinessResponse

| \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\> \<TotalCount\>5\</TotalCount\> \<PageList\> \<TablesInfoModel\> \<IdentityNo\>5537168611\</IdentityNo\> \<Name\>weqrqr\</Name\> \<AliasName\>说是\</AliasName\> \<IsInit\>true\</IsInit\> \<BelongType\>1\</BelongType\> \<DataType\>MetaDataType\</DataType\> \<Creater\>1D3BE25ED2\</Creater\> \<CreateTime\>2020-12-17T17:03:13.514+08:00\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<SimpleSpell\>ss\</SimpleSpell\> \<Status\>9005\</Status\> \<VersionType\>5002\</VersionType\> \<CurrentIdentityNo\>5537168611\</CurrentIdentityNo\> \<VersionName\>默认\</VersionName\> \<IsDelete\>False\</IsDelete\> \</TablesInfoModel\> \<TablesInfoModel\> \<IdentityNo\>5569974565\</IdentityNo\> \<Name\>cschs\</Name\> \<AliasName\>发布再初始化\</AliasName\> \<IsInit\>true\</IsInit\> \<BelongType\>1\</BelongType\> \<DataType\>MetaDataType\</DataType\> \<Creater\>1D3BE25ED2\</Creater\> \<CreateTime\>2020-12-17T16:58:06.494+08:00\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<SimpleSpell\>fbzcsh\</SimpleSpell\> \<Status\>9005\</Status\> \<VersionType\>5002\</VersionType\> \<CurrentIdentityNo\>5569974565\</CurrentIdentityNo\> \<VersionName\>默认\</VersionName\> \<IsDelete\>False\</IsDelete\> \</TablesInfoModel\> \<TablesInfoModel\> \<IdentityNo\>4843545819\</IdentityNo\> \<Name\>company\</Name\> \<AliasName\>公司\</AliasName\> \<IsInit\>true\</IsInit\> \<BelongType\>1\</BelongType\> \<DataType\>BusinessDataType\</DataType\> \<Creater\>gqq\</Creater\> \<CreateTime\>2020-11-06T15:53:59.708+08:00\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<SimpleSpell\>gs\</SimpleSpell\> \<Status\>9005\</Status\> \<VersionType\>5002\</VersionType\> \<CurrentIdentityNo\>0\</CurrentIdentityNo\> \<IsDelete\>False\</IsDelete\> \</TablesInfoModel\> \<TablesInfoModel\> \<IdentityNo\>5373020891\</IdentityNo\> \<Name\>dell\</Name\> \<AliasName\>戴尔\</AliasName\> \<IsInit\>true\</IsInit\> \<BelongType\>1\</BelongType\> \<DataType\>MetaDataType\</DataType\> \<Creater\>gqq\</Creater\> \<CreateTime\>2020-11-03T16:42:08.78+08:00\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<SimpleSpell\>de\</SimpleSpell\> \<Status\>9005\</Status\> \<VersionType\>5002\</VersionType\> \<CurrentIdentityNo\>0\</CurrentIdentityNo\> \<IsDelete\>False\</IsDelete\> \</TablesInfoModel\> \<TablesInfoModel\> \<IdentityNo\>5734697670\</IdentityNo\> \<Name\>bianmaqi\</Name\> \<AliasName\>编码器表\</AliasName\> \<IsInit\>true\</IsInit\> \<BelongType\>1\</BelongType\> \<DataType\>BusinessDataType\</DataType\> \<Creater\>wk\</Creater\> \<CreateTime\>2020-10-29T15:18:35.839+08:00\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<SimpleSpell\>bmqb\</SimpleSpell\> \<Status\>9005\</Status\> \<VersionType\>5002\</VersionType\> \<CurrentIdentityNo\>0\</CurrentIdentityNo\> \<IsDelete\>False\</IsDelete\> \</TablesInfoModel\> \</PageList\> \</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| TotalCount | Body | int | 总数 |
| PageList | Body | 节点 | 列表集合 |
| TablesInfoModel | PageList | 节点 |
 |
| IdentityNo | TablesInfoModel | long | 表ID |
| Name | TablesInfoModel | str | 表名 |
| AliasName | TablesInfoModel | str | 别名 |
| IsInit | TablesInfoModel | bool | 是否初始化 |
| Description | TablesInfoModel | str | 表描述 |
| Prefix | TablesInfoModel | str | 前缀 |
| Suffix | TablesInfoModel | str | 后缀 |
| BelongType | TablesInfoModel | int | 归属类型 |
| DataType | TablesInfoModel | int | 数据类型 |
| Creater | TablesInfoModel | str | 创建人 |
| CreateTime | TablesInfoModel | DateTime | 创建时间 |
| Updater | TablesInfoModel | str | 修改人 |
| UpdateTime | TablesInfoModel | DateTime | 修改时间 |

#### 3.8.2.5注意事项

无

### 3.8.3获取元数据结构详情 MDM\_GetTableSchema

#### 3.8.3.1服务名 MessageCategory （消息类别）

MDM\_GetTableSchema

#### 3.8.3.2用途

根据元数据唯一ID获取元数据结构详情

#### 3.8.3.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \</Header\> \<Body\> \<TabId\>5362926957\</TabId\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| TabId | Body | 否 | long | 表ID （取接口获取元数据契约列表IdentityNo字段） |

#### 3.8.3.4返回业务数据BusinessResponse

| \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\> \<Code\>0\</Code\> \<Count\>0\</Count\> \<Data\> \<TableColAllInfoResponseModel\> \<TableIdentityNo\>5362926957\</TableIdentityNo\> \<ColIdentityNo\>5252443357\</ColIdentityNo\> \<ColName\>Category\</ColName\> \<SimpleSpell\>lb\</SimpleSpell\> \<ColAliasName\>类别\</ColAliasName\> \<DataType\>nvarchar(50)\</DataType\> \<IsShow\>true\</IsShow\> \<IsIdentity\>false\</IsIdentity\> \<IsNullable\>false\</IsNullable\> \<IsComPositeUnique\>false\</IsComPositeUnique\> \<IsPrimary\>false\</IsPrimary\> \<IsUnique\>false\</IsUnique\> \<SeqNo\>0\</SeqNo\> \<Creater\>0EC8A04807\</Creater\> \<CreateTime\>2020-12-23T10:29:38\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<ColLength\>0\</ColLength\> \<DecimalDigits\>0\</DecimalDigits\> \<FirstSpellSearch\>false\</FirstSpellSearch\> \</TableColAllInfoResponseModel\> \<TableColAllInfoResponseModel\> \<TableIdentityNo\>5362926957\</TableIdentityNo\> \<ColIdentityNo\>5425418721\</ColIdentityNo\> \<ColName\>Description\</ColName\> \<SimpleSpell\>sm\</SimpleSpell\> \<ColAliasName\>说明\</ColAliasName\> \<DataType\>nvarchar(50)\</DataType\> \<IsShow\>true\</IsShow\> \<IsIdentity\>false\</IsIdentity\> \<IsNullable\>false\</IsNullable\> \<IsComPositeUnique\>false\</IsComPositeUnique\> \<IsPrimary\>false\</IsPrimary\> \<IsUnique\>false\</IsUnique\> \<SeqNo\>0\</SeqNo\> \<Creater\>0EC8A04807\</Creater\> \<CreateTime\>2020-12-23T10:30:18\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<ColLength\>0\</ColLength\> \<DecimalDigits\>0\</DecimalDigits\> \<FirstSpellSearch\>false\</FirstSpellSearch\> \</TableColAllInfoResponseModel\> \<TableColAllInfoResponseModel\> \<TableIdentityNo\>5362926957\</TableIdentityNo\> \<ColIdentityNo\>4690525276\</ColIdentityNo\> \<ColName\>Tpye\</ColName\> \<SimpleSpell\>lx\</SimpleSpell\> \<ColAliasName\>类型\</ColAliasName\> \<DataType\>nvarchar(50)\</DataType\> \<IsShow\>true\</IsShow\> \<IsIdentity\>false\</IsIdentity\> \<IsNullable\>false\</IsNullable\> \<IsComPositeUnique\>false\</IsComPositeUnique\> \<IsPrimary\>false\</IsPrimary\> \<IsUnique\>false\</IsUnique\> \<SeqNo\>0\</SeqNo\> \<Creater\>0EC8A04807\</Creater\> \<CreateTime\>2020-12-23T10:32:04\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<ColLength\>0\</ColLength\> \<DecimalDigits\>0\</DecimalDigits\> \<FirstSpellSearch\>false\</FirstSpellSearch\> \</TableColAllInfoResponseModel\> \<TableColAllInfoResponseModel\> \<TableIdentityNo\>5362926957\</TableIdentityNo\> \<ColIdentityNo\>5288590647\</ColIdentityNo\> \<ColName\>Code\</ColName\> \<SimpleSpell\>bm\</SimpleSpell\> \<ColAliasName\>编码\</ColAliasName\> \<DataType\>nvarchar(50)\</DataType\> \<IsShow\>true\</IsShow\> \<IsIdentity\>false\</IsIdentity\> \<IsNullable\>false\</IsNullable\> \<IsComPositeUnique\>false\</IsComPositeUnique\> \<IsPrimary\>false\</IsPrimary\> \<IsUnique\>false\</IsUnique\> \<SeqNo\>0\</SeqNo\> \<Creater\>0EC8A04807\</Creater\> \<CreateTime\>2020-12-23T10:32:37\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<ColLength\>0\</ColLength\> \<DecimalDigits\>0\</DecimalDigits\> \<FirstSpellSearch\>false\</FirstSpellSearch\> \</TableColAllInfoResponseModel\> \<TableColAllInfoResponseModel\> \<TableIdentityNo\>5362926957\</TableIdentityNo\> \<ColIdentityNo\>5664171246\</ColIdentityNo\> \<ColName\>Value\</ColName\> \<SimpleSpell\>nr\</SimpleSpell\> \<ColAliasName\>内容\</ColAliasName\> \<DataType\>nvarchar(50)\</DataType\> \<IsShow\>true\</IsShow\> \<IsIdentity\>false\</IsIdentity\> \<IsNullable\>false\</IsNullable\> \<IsComPositeUnique\>false\</IsComPositeUnique\> \<IsPrimary\>false\</IsPrimary\> \<IsUnique\>false\</IsUnique\> \<SeqNo\>0\</SeqNo\> \<Creater\>0EC8A04807\</Creater\> \<CreateTime\>2020-12-23T10:32:56\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<ColLength\>0\</ColLength\> \<DecimalDigits\>0\</DecimalDigits\> \<FirstSpellSearch\>false\</FirstSpellSearch\> \</TableColAllInfoResponseModel\> \</Data\> \<Msg /\> \</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| TableIdentityNo | TableColAllInfoResponseModel | long | 表ID |
| ColIdentityNo | TableColAllInfoResponseModel | long | 字段ID (修改操作 必填) |
| ColName | TableColAllInfoResponseModel | str | 字段名 |
| SimpleSpell | TableColAllInfoResponseModel | str | 首拼 |
| ColAliasName | TableColAllInfoResponseModel | str | 字段别名 |
| DataType | TableColAllInfoResponseModel | str | 数据类型 |
| DefaultValue | TableColAllInfoResponseModel | str | 默认值 |
| IsShow | TableColAllInfoResponseModel | bool | 是否只读 |
| IsIdentity | TableColAllInfoResponseModel | bool | 是否标志 |
| IsNullable | TableColAllInfoResponseModel | bool | 是否可为空 |
| IsComPositeUnique | TableColAllInfoResponseModel | bool | 复合主键 |
| IsPrimary | TableColAllInfoResponseModel | bool | 是否主键 |
| IsUnique | TableColAllInfoResponseModel | bool | 是否唯一 |
| SeqNo | TableColAllInfoResponseModel | int | 序号 |
| Description | TableColAllInfoResponseModel | str | 字段说明 |
| Creater | TableColAllInfoResponseModel | str | 创建人 |
| Updater | TableColAllInfoResponseModel | str | 更新人 |
| CreateTime | TableColAllInfoResponseModel | str | 创建时间 |
| UpdateTime | TableColAllInfoResponseModel | str | 修改时间 |
| ColLength | TableColAllInfoResponseModel | int | 字段长度 |
| DecimalDigits | TableColAllInfoResponseModel | int | 小数位数 |
| FirstSpellSearch | TableColAllInfoResponseModel | bool | 首拼查询 |

#### 3.8.3.5注意事项

无

### 3.8.4获取元数据字段属性 MDM\_GetColSchema

#### 3.8.4.1服务名 MessageCategory （消息类别）

MDM\_GetColSchema

#### 3.8.4.2用途

根据元数据唯一ID获取元数据字段属性

#### 3.8.4.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \</Header\> \<Body\> \<TabId\>5362926957\</TabId\> \<ColId\>5252443357\</ColId\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| TabId | Body | 是 | int | 表ID（取接口获取元数据结构详情中的TableIdentityNo字段） |
| ColId | Body | 是 | int | 字段ID（取接口获取元数据结构详情中的ColIdentityNo字段） |

#### 3.8.4.4返回业务数据BusinessResponse

| \<Header\> \<Token\>string\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\> \<TableIdentityNo\>5362926957\</TableIdentityNo\> \<ColIdentityNo\>5252443357\</ColIdentityNo\> \<ColName\>Category\</ColName\> \<SimpleSpell\>lb\</SimpleSpell\> \<ColAliasName\>类别\</ColAliasName\> \<DataType\>nvarchar\</DataType\> \<IsShow\>true\</IsShow\> \<IsIdentity\>false\</IsIdentity\> \<IsNullable\>false\</IsNullable\> \<IsComPositeUnique\>false\</IsComPositeUnique\> \<IsPrimary\>false\</IsPrimary\> \<IsUnique\>false\</IsUnique\> \<SeqNo\>0\</SeqNo\> \<Creater\>0EC8A04807\</Creater\> \<CreateTime\>2020-12-23T10:29:38\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<ColLength\>50\</ColLength\> \<DecimalDigits\>0\</DecimalDigits\> \<FirstSpellSearch\>false\</FirstSpellSearch\> \</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| TableIdentityNo | Body | long | 表ID |
| ColIdentityNo | Body | long | 字段ID |
| ColName | Body | str | 字段名 |
| SimpleSpell | Body | str | 首拼 |
| ColAliasName | Body | str | 字段别名 |
| DataType | Body | str | 数据类型 |
| DefaultValue | Body | str | 默认值 |
| IsShow | Body | bool | 是否只读 |
| IsIdentity | Body | bool | 是否标志 |
| IsNullable | Body | bool | 是否可为空 |
| IsComPositeUnique | Body | bool | 复合主键 |
| IsPrimary | Body | bool | 是否主键 |
| IsUnique | Body | bool | 是否唯一 |
| SeqNo | Body | int | 序号 |
| Description | Body | str | 字段说明 |
| Creater | Body | str | 创建人 |
| Updater | Body | str | 更新人 |
| CreateTime | Body | str | 创建时间 |
| UpdateTime | Body | str | 修改时间 |
| ColLength | Body | int | 字段长度 |
| DecimalDigits | Body | int | 小数位数 |
| FirstSpellSearch | Body | bool | 首拼查询 |

#### 3.8.4.5注意事项

无

### 3.8.5插入数据 MDM\_InsertData

#### 3.8.5.1服务名 MessageCategory （消息类别）

MDM\_InsertData

#### 3.8.5.2用途

插入数据（有写权限）

#### 3.8.5.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \</Header\> \<Body\> \<TableIdentityNo\>5362926957\</TableIdentityNo\> \<Content\>{"Category":"3","Description":"3","Tpye":"3","Code":"3","Value":"测试3","Creater":"3A4BC53E0","CreateTime":"2021-01-20 17:05:20"}\</Content\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| TableIdentityNo | Body | 是 | str | 主键（取接口获取元数据结构详情中的TableIdentityNo字段） |
| Content | Body | 是 | str | 新增数据内容(获取元数据字段属性。传输内容为序列化的Json字符串) |

#### 3.8.5.4返回业务数据BusinessResponse

| \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\>true\</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| Body | M002T01Result | bool | 是否成功：true 、false |

#### 3.8.5.5注意事项

无

### 3.8.6设置数据有效状态 MDM\_BatchSetValid

#### 3.8.6.1服务名 MessageCategory （消息类别）

MDM\_BatchSetValid

#### 3.8.6.2用途

设置数据有效状态（有写权限）

#### 3.8.6.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \</Header\> \<Body\> \<TableID\>5362926957\</TableID\> \<KeyIDs\> \<int\>58905\</int\> \<int\>58906\</int\> \</KeyIDs\> \<IsValid\>false\</IsValid\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| TableID | Body | 是 | long | 表ID（取接口获取元数据结构详情中的TableIdentityNo字段） |
| KeyIDs | Body | 是 | Array | 要修改的主键ID（取接口获取元数据字段属性） |
| IsValid | Body | 是 | bool | 是否有效 |

#### 3.8.6.4返回业务数据BusinessResponse

| \<M002T02Response xmlns="http://tempuri.org/"\> \<M002T02Result\> \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\>true\</Body\> \</M002T02Result\>\</M002T02Response\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| Body | M002T02Result | bool | 是否成功：true 、false |

#### 3.8.6.5注意事项

无

### 3.8.7更新一条数据 MDM\_UpdateData

#### 3.8.7.1服务名 MessageCategory （消息类别）

MDM\_UpdateData

#### 3.8.7.2用途

更新一条数据（有写权限）

#### 3.8.7.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \</Header\> \<Body\> \<TableIdentityNo\>5362926957\</TableIdentityNo\> \<Content\>{"KEYID":"58905","Category":"3","Description":"3","Tpye":"3","Code":"3","Value":"修改测试修改测试修改测试测试3","Creater":"3A4BC53E0","CreateTime":"2021-01-20 17:05:20","LastUpdateTime":"2021-01-20 18:05:20"}\</Content\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| TableIdentityNo | Body | 是 | str | 主键（取接口获取元数据结构详情中的TableIdentityNo字段） |
| Content | Body | 是 | str | 数据内容(取接口获取元数据字段属性。传输内容为序列化的Json字符串) |
| IsBusiness | Body | 是 | str | 是否业务 |

#### 3.8.7.4返回业务数据BusinessResponse

| \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\>true\</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| Body | M002T01Result | bool | 是否成功：true 、false |

#### 3.8.7.5注意事项

无

### 3.8.8注销一条数据 MDM\_DeleteData

#### 3.8.8.1服务名 MessageCategory （消息类别）

MDM\_DeleteData

#### 3.8.8.2用途

注销一条数据（有写权限）

#### 3.8.8.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>1FD9DDC41F08F201E8483CC10D9CC9BB\</Token\> \</Header\> \<Body\> \<TableId\>5362926957\</TableId\> \<Key\>KEYID\</Key\> \<Value\>58905\</Value\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| TableIdentityNo | Body | 是 | long | 表ID(取接口获取元数据结构详情中的TableIdentityNo字段) |
| Key | Body | 是 | str | 主键字段(取接口获取元数据字段属性) |
| Value | request | 是 | str | 值 |

#### 3.8.8.4返回业务数据BusinessResponse

| \<Header\> \<Token\>1FD9DDC41F08F201E8483CC10D9CC9BB\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\>true\</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| Body | M002T04Result | bool | 是否成功：true 、false |

#### 3.8.8.5注意事项

无

### 3.8.9获取主数据列表 MDM\_GetDataPageList

#### 3.8.9.1服务名 MessageCategory （消息类别）

MDM\_GetDataPageList

#### 3.8.9.2用途

获取主数据列表（有读权限）

#### 3.8.9.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>1FD9DDC41F08F201E8483CC10D9CC9BB\</Token\> \</Header\> \<Body\> \<TableIdentityNo\>5362926957\</TableIdentityNo\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| TableIdentityNo | Body | 是 | str | 表ID(取接口获取元数据结构详情中的TableIdentityNo字段) |
| Content | Body | 否 | str | 查询条件(取接口获取元数据字段属性) |
| FuzzySearch | Body | 否 | str | 模糊搜索条件 |
| BetweenSearchs | Body | 否 | List\<BetweenSearchItem\> | 区间搜索条件 |
| FirstSpellSearch | Body | 否 | str | 首拼搜索条件 |
| KeyIDs | Body | 否 | List\<int\> | KeyID列表 |
| IsValid | Body | 否 | bool | 是否有效 |
| IsDelete | Body | 否 | bool | 查询注销数据 |

#### 3.8.9.4返回业务数据BusinessResponse

| \<Header\> \<Token\>1FD9DDC41F08F201E8483CC10D9CC9BB\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\> \<Data\> \<string\>{"rowId":7496,"KEYID":58903,"Category":"2","Description":"2","Tpye":"2","Code":"2","Value":"测试","MasterDataCode":"","CreateTime":"2021-01-20 17:05:20","LastUpdateTime":"","IsDelete":0,"LastUpdater":"","Creater":"3A4BC53E0","FirstSpell":"","IsValid":true}\</string\> \<string\>{"rowId":7497,"KEYID":58905,"Category":"3","Description":"3","Tpye":"3","Code":"3","Value":"测试3","MasterDataCode":"","CreateTime":"2021-01-20 17:05:20","LastUpdateTime":"2021-01-20 18:05:20","IsDelete":0,"LastUpdater":"","Creater":"3A4BC53E0","FirstSpell":"","IsValid":false}\</string\> \<string\>{"rowId":7498,"KEYID":58906,"Category":"4","Description":"4","Tpye":"4","Code":"4","Value":"测试4","MasterDataCode":"","CreateTime":"2021-01-20 17:05:20","LastUpdateTime":"","IsDelete":0,"LastUpdater":"","Creater":"3A4BC53E0","FirstSpell":"","IsValid":false}\</string\> \</Data\> \<Struct\> \<PropertyModel\> \<ColName\>Category\</ColName\> \<ColAliasName\>类别\</ColAliasName\> \<DataType\>nvarchar(50)\</DataType\> \<IsNullable\>false\</IsNullable\> \<IsPrimary\>false\</IsPrimary\> \</PropertyModel\> \<PropertyModel\> \<ColName\>Description\</ColName\> \<ColAliasName\>说明\</ColAliasName\> \<DataType\>nvarchar(50)\</DataType\> \<IsNullable\>false\</IsNullable\> \<IsPrimary\>false\</IsPrimary\> \</PropertyModel\> \<PropertyModel\> \<ColName\>Tpye\</ColName\> \<ColAliasName\>类型\</ColAliasName\> \<DataType\>nvarchar(50)\</DataType\> \<IsNullable\>false\</IsNullable\> \<IsPrimary\>false\</IsPrimary\> \</PropertyModel\> \<PropertyModel\> \<ColName\>Code\</ColName\> \<ColAliasName\>编码\</ColAliasName\> \<DataType\>nvarchar(50)\</DataType\> \<IsNullable\>false\</IsNullable\> \<IsPrimary\>false\</IsPrimary\> \</PropertyModel\> \<PropertyModel\> \<ColName\>Value\</ColName\> \<ColAliasName\>内容\</ColAliasName\> \<DataType\>nvarchar(50)\</DataType\> \<IsNullable\>false\</IsNullable\> \<IsPrimary\>false\</IsPrimary\> \</PropertyModel\> \<PropertyModel\> \<ColName\>IsValid\</ColName\> \<DataType\>bit\</DataType\> \<DefaultValue\>1\</DefaultValue\> \<IsNullable\>true\</IsNullable\> \<IsPrimary\>false\</IsPrimary\> \</PropertyModel\> \</Struct\> \<Count\>7498\</Count\> \</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| Data | Body | List\< str \> | 数据 |
| Struct | Body | 节点 | 元数据结构 |
| ColName | PropertyModel | str | 字段名 |
| ColAliasName | PropertyModel | str | 字段别名 |
| DataType | PropertyModel | str | 数据类型 |
| IsNullable | PropertyModel | bool | 是否可为空 |
| IsPrimary | PropertyModel | bool | 是否主键 |

#### 3.8.9.5注意事项

无

### 3.8.10获取映射数据契约列表 MDM\_GetMapperPageList

#### 3.8.10.1服务名 MessageCategory （消息类别）

MDM\_GetMapperPageList

#### 3.8.10.2用途

获取映射数据契约列表（有读权限）

#### 3.8.10.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>1FD9DDC41F08F201E8483CC10D9CC9BB\</Token\> \</Header\> \<Body\> \<MapperID\>\</MapperID\> \<MapperName\>\</MapperName\> \<Status\>\</Status\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| Body | request | 是 | 节点 |
 |
| MapperID | Body | 否 | str | 映射器ID |
| MapperName | Body | 否 | str | 映射器名称 |
| Status | Body | 否 | str | 状态 |

#### 3.8.10.4返回业务数据BusinessResponse

| \<Header\> \<Token\>1FD9DDC41F08F201E8483CC10D9CC9BB\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\> \<TotalCount\>15\</TotalCount\> \<PageList\> \<MapperModel\> \<MapperID\>E4CBADA2\</MapperID\> \<MapperName\>映射器16\</MapperName\> \<EffectiveStartTime\>2021-01-20T00:00:00+08:00\</EffectiveStartTime\> \<EffectiveEndTime\>2021-01-24T00:00:00+08:00\</EffectiveEndTime\> \<MapperType\>0\</MapperType\> \<MapperDesc\>映射器16\</MapperDesc\> \<Status\>9001\</Status\> \<IsEdit\>false\</IsEdit\> \<IsExportAll\>false\</IsExportAll\> \<IsQualityControl\>true\</IsQualityControl\> \<QualityControlStatu\>9003\</QualityControlStatu\> \</MapperModel\> \<MapperModel\> \<MapperID\>DF8BB978\</MapperID\> \<MapperName\>映射器14\</MapperName\> \<EffectiveStartTime\>2021-01-20T00:00:00+08:00\</EffectiveStartTime\> \<EffectiveEndTime\>2021-01-24T00:00:00+08:00\</EffectiveEndTime\> \<MapperType\>0\</MapperType\> \<MapperDesc\>映射器14\</MapperDesc\> \<Status\>9001\</Status\> \<IsEdit\>false\</IsEdit\> \<IsExportAll\>false\</IsExportAll\> \<IsQualityControl\>true\</IsQualityControl\> \<QualityControlStatu\>9003\</QualityControlStatu\> \</MapperModel\> \<MapperModel\> \<MapperID\>50D9E71A\</MapperID\> \<MapperName\>映射器14\</MapperName\> \<EffectiveStartTime\>2021-01-20T00:00:00+08:00\</EffectiveStartTime\> \<EffectiveEndTime\>2021-01-24T00:00:00+08:00\</EffectiveEndTime\> \<MapperType\>0\</MapperType\> \<MapperDesc\>映射器14\</MapperDesc\> \<Status\>9001\</Status\> \<IsEdit\>false\</IsEdit\> \<IsExportAll\>false\</IsExportAll\> \<IsQualityControl\>true\</IsQualityControl\> \<QualityControlStatu\>9003\</QualityControlStatu\> \</MapperModel\> \</PageList\> \</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| TotalCount | Body | int | 总数 |
| PageList | Body | List\<MapperModel\> | 映射器列表 |
| MapperID | MapperModel | str | 映射器ID |
| MapperName | MapperModel | strg | 映射器名称 |
| EffectiveStartTime | MapperModel | DateTime | 有效开始时间 |
| EffectiveEndTime | MapperModel | DateTime | 有效结束时间 |
| MapperDesc | MapperModel | str | 映射器描述 |
| MapperResultTable | MapperModel | str | 映射结果表 |
| CreateDate | MapperModel | DateTime | 创建时间 |
| CreateUser | MapperModel | str | 创建人 |
| LastUpdateDate | MapperModel | str | 更新人 |
| LastUpdateUser | MapperModel | str | 创建人 |
| Status | MapperModel | str | 状态 |
| IsQualityControl | MapperModel | bool | 是否添加质控 |
| QualityControlStatu | MapperModel | str | 质控状态 |

#### 3.8.10.5注意事项

无

### 3.8.11获取映射数据结构详情 MDM\_GetMapperInfo

#### 3.8.11.1服务名 MessageCategory （消息类别）

MDM\_GetMapperInfo

#### 3.8.11.2用途

根据映射数据唯一ID获取映射数据结构详情

#### 3.8.11.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>string\</Token\> \</Header\> \<Body\> \<MapperIDs\> \<string\>E4CBADA2\</string\> \</MapperIDs\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| MapperIDs | Body | 是 | str | 映射器ID |

#### 3.8.11.4返回业务数据BusinessResponse

| \<Header\> \<Token\>string\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\> \<MapperID\>5E28898D\</MapperID\> \<MapperName\>映射器M\</MapperName\> \<EffectiveStartTime\>2020/12/31 0:00:00\</EffectiveStartTime\> \<EffectiveEndTime\>2021/1/31 0:00:00\</EffectiveEndTime\> \<MapperDesc\>映射器M\</MapperDesc\> \<MainTable\>MNTOne\</MainTable\> \<MapperResultTable\>MDM\_YSQM1D90\</MapperResultTable\> \<CreateDate\>2020-12-30T17:47:39.47+08:00\</CreateDate\> \<LastUpdateDate\>2020-12-30T18:17:44.276+08:00\</LastUpdateDate\> \<Status\>9002\</Status\> \<MapperFields\> \<MapperFieldResponseModel\> \<MapperID\>5E28898D\</MapperID\> \<TableName\>MNTOne\</TableName\> \<FieldName\>ID\</FieldName\> \<IsRelationCol\>false\</IsRelationCol\> \<Status\>9002\</Status\> \<FieldAlias\>ID\</FieldAlias\> \<FieldType\>nvarchar(20)\</FieldType\> \<DataMapperType\>0\</DataMapperType\> \<ColFullNames /\> \<FieldExpression\>MNTOne.ID\</FieldExpression\> \</MapperFieldResponseModel\> \<MapperFieldResponseModel\> \<MapperID\>5E28898D\</MapperID\> \<TableName\>MNTOne\</TableName\> \<FieldName\>Value\</FieldName\> \<IsRelationCol\>false\</IsRelationCol\> \<Status\>9002\</Status\> \<FieldAlias\>Value\</FieldAlias\> \<FieldType\>int\</FieldType\> \<DataMapperType\>0\</DataMapperType\> \<ColFullNames /\> \<FieldExpression\>MNTOne.Value\</FieldExpression\> \</MapperFieldResponseModel\> \<MapperFieldResponseModel\> \<MapperID\>5E28898D\</MapperID\> \<TableName\>MNTwo\</TableName\> \<FieldName\>ID\</FieldName\> \<IsRelationCol\>false\</IsRelationCol\> \<Status\>9002\</Status\> \<FieldAlias\>ID\</FieldAlias\> \<FieldType\>nvarchar(20)\</FieldType\> \<DataMapperType\>0\</DataMapperType\> \<ColFullNames /\> \<FieldExpression\>MNTwo.ID\</FieldExpression\> \</MapperFieldResponseModel\> \</MapperFields\> \<MapperRelations\> \<MapperRelationResponseModel\> \<MapperID\>5E28898D\</MapperID\> \<RelationID\>73BBC85A\</RelationID\> \<TableName\>MNTOne\</TableName\> \<FieldName\>ID\</FieldName\> \<FieldType\>nvarchar(20)\</FieldType\> \<RelationType\>1001\</RelationType\> \<RelationTableName\>MNTwo\</RelationTableName\> \<RelationFieldName\>ID\</RelationFieldName\> \<RelationFieldType\>nvarchar(20)\</RelationFieldType\> \<RuleItems /\> \</MapperRelationResponseModel\> \</MapperRelations\> \<TableInfos\> \<TableInitResponseModel\> \<IdentityNo\>4724926149\</IdentityNo\> \<Name\>MNTOne\</Name\> \<AliasName\>MNT1\</AliasName\> \<SimpleSpell\>mnt1\</SimpleSpell\> \<IsInit\>true\</IsInit\> \<Creater\>ABDC4A441E\</Creater\> \<CreateTime\>2020-12-30T15:41:38\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<ColInfos\> \<TableColAllInfoResponseModel\> \<TableIdentityNo\>4724926149\</TableIdentityNo\> \<ColIdentityNo\>5045374985\</ColIdentityNo\> \<ColName\>ID\</ColName\> \<SimpleSpell\>id\</SimpleSpell\> \<ColAliasName\>ID\</ColAliasName\> \<DataType\>nvarchar(20)\</DataType\> \<IsShow\>true\</IsShow\> \<IsIdentity\>false\</IsIdentity\> \<IsNullable\>false\</IsNullable\> \<IsComPositeUnique\>false\</IsComPositeUnique\> \<IsPrimary\>false\</IsPrimary\> \<IsUnique\>false\</IsUnique\> \<SeqNo\>0\</SeqNo\> \<Creater\>ABDC4A441E\</Creater\> \<CreateTime\>2020-12-30T15:42:25\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<ColLength\>0\</ColLength\> \<DecimalDigits\>0\</DecimalDigits\> \<FirstSpellSearch\>false\</FirstSpellSearch\> \</TableColAllInfoResponseModel\> \<TableColAllInfoResponseModel\> \<TableIdentityNo\>4724926149\</TableIdentityNo\> \<ColIdentityNo\>5058785791\</ColIdentityNo\> \<ColName\>Value\</ColName\> \<SimpleSpell\>value\</SimpleSpell\> \<ColAliasName\>Value\</ColAliasName\> \<DataType\>int\</DataType\> \<IsShow\>true\</IsShow\> \<IsIdentity\>false\</IsIdentity\> \<IsNullable\>false\</IsNullable\> \<IsComPositeUnique\>false\</IsComPositeUnique\> \<IsPrimary\>false\</IsPrimary\> \<IsUnique\>false\</IsUnique\> \<SeqNo\>0\</SeqNo\> \<Creater\>ABDC4A441E\</Creater\> \<CreateTime\>2020-12-30T15:42:42\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<ColLength\>0\</ColLength\> \<DecimalDigits\>0\</DecimalDigits\> \<FirstSpellSearch\>false\</FirstSpellSearch\> \</TableColAllInfoResponseModel\> \</ColInfos\> \</TableInitResponseModel\> \<TableInitResponseModel\> \<IdentityNo\>5756407939\</IdentityNo\> \<Name\>MNTwo\</Name\> \<AliasName\>MNTwo\</AliasName\> \<SimpleSpell\>mntwo\</SimpleSpell\> \<Description\>MNTwo\</Description\> \<IsInit\>true\</IsInit\> \<Creater\>ABDC4A441E\</Creater\> \<CreateTime\>2020-12-30T15:42:02\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<ColInfos\> \<TableColAllInfoResponseModel\> \<TableIdentityNo\>5756407939\</TableIdentityNo\> \<ColIdentityNo\>5291550024\</ColIdentityNo\> \<ColName\>ID\</ColName\> \<SimpleSpell\>id\</SimpleSpell\> \<ColAliasName\>ID\</ColAliasName\> \<DataType\>nvarchar(20)\</DataType\> \<IsShow\>true\</IsShow\> \<IsIdentity\>false\</IsIdentity\> \<IsNullable\>false\</IsNullable\> \<IsComPositeUnique\>false\</IsComPositeUnique\> \<IsPrimary\>false\</IsPrimary\> \<IsUnique\>false\</IsUnique\> \<SeqNo\>0\</SeqNo\> \<Creater\>ABDC4A441E\</Creater\> \<CreateTime\>2020-12-30T15:43:10\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<ColLength\>0\</ColLength\> \<DecimalDigits\>0\</DecimalDigits\> \<FirstSpellSearch\>false\</FirstSpellSearch\> \</TableColAllInfoResponseModel\> \<TableColAllInfoResponseModel\> \<TableIdentityNo\>5756407939\</TableIdentityNo\> \<ColIdentityNo\>4892622924\</ColIdentityNo\> \<ColName\>Value\</ColName\> \<SimpleSpell\>value\</SimpleSpell\> \<ColAliasName\>Value\</ColAliasName\> \<DataType\>int\</DataType\> \<IsShow\>true\</IsShow\> \<IsIdentity\>false\</IsIdentity\> \<IsNullable\>false\</IsNullable\> \<IsComPositeUnique\>false\</IsComPositeUnique\> \<IsPrimary\>false\</IsPrimary\> \<IsUnique\>false\</IsUnique\> \<SeqNo\>0\</SeqNo\> \<Creater\>ABDC4A441E\</Creater\> \<CreateTime\>2020-12-30T15:43:23\</CreateTime\> \<UpdateTime xsi:nil="true" /\> \<ColLength\>0\</ColLength\> \<DecimalDigits\>0\</DecimalDigits\> \<FirstSpellSearch\>false\</FirstSpellSearch\> \</TableColAllInfoResponseModel\> \</ColInfos\> \</TableInitResponseModel\> \</TableInfos\> \</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| MapperID | Body | str | 映射器ID |
| MapperName | Body | str | 映射器名称 |
| EffectiveStartTime | Body | DateTime | 有效开始时间 |
| EffectiveEndTime | Body | DateTime | 有效结束时间 |
| MapperDesc | Body | str | 映射器描述 |
| MapperResultTable | Body | str | 映射结果表 |
| CreateDate | Body | DateTime | 创建时间 |
| CreateUser | Body | str | 创建人 |
| LastUpdateDate | Body | str | 更新人 |
| LastUpdateUser | Body | str | 创建人 |
| Status | Body | str | 状态 |
| MapperFields | Body | List\<MapperFieldResponseModel\> | 字段列表 |
| MapperRelations | Body | List\<MapperRelationResponseModel\> | 关系列表 |
| TableInfos | Body | List\<TableInitResponseModel\> | 表信息集合 |
| MapperID | MapperFieldResponseModel | str | 映射器ID |
| TableName | MapperFieldResponseModel | str | 表名 |
| FieldName | MapperFieldResponseModel | str | 字段名 |
| FieldAlias | MapperFieldResponseModel | str | 字段别名 |
| FieldType | MapperFieldResponseModel | str | 字段类型 |
| DataMapperType | MapperFieldResponseModel | str | 计算规则 |
| ColFullNames | MapperFieldResponseModel | str[] | 包含的列 |
| FieldExpression | MapperFieldResponseModel | str | 表达式 |
| MapperID | MapperRelationResponseModel | str | 映射器ID |
| RelationID | MapperRelationResponseModel | str | 关系ID |
| TableName | MapperRelationResponseModel | str | 表名 |
| FieldName | MapperRelationResponseModel | str | 字段名 |
| FieldType | MapperRelationResponseModel | str | 字段类型 |
| RelationType | MapperRelationResponseModel | int | 关系类型 |
| RelationTableName | MapperRelationResponseModel | str | 关联表名 |
| RelationFieldName | MapperRelationResponseModel | str | 关联字段名 |
| RelationFieldType | MapperRelationResponseModel | str | 关联字段类型 |
| RuleExpression | MapperRelationResponseModel | str | 关联表达式 |
| RuleItems | MapperRelationResponseModel | List\<RuleItemResponse\> | 规则列表 |
| TableName | RuleItemResponse | str | 表名 |
| FieldName | RuleItemResponse | str | 字段名 |
| RuleType | RuleItemResponse | int | 规则类型 |
| RuleParams | RuleItemResponse | str[] | 规则参数 |
| IdentityNo | TableInfos | long | 表ID |
| Name | TableInfos | str | 表名 |
| AliasName | TableInfos | str | 别名 |
| SimpleSpell | TableInfos | str | 首拼 |
| Description | TableInfos | str | 表描述 |
| IsInit | TableInfos | bool | 是否初始化 |

#### 3.8.11.5注意事项

无

### 3.8.12获取映射数据字段属性 MDM\_GetFieldSetByMapperID

#### 3.8.12.1服务名 MessageCategory （消息类别）

MDM\_GetFieldSetByMapperID

#### 3.8.12.2用途

根据映射数据唯一ID获取映射数据字段属性

#### 3.8.12.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>1343821922160480256\</Token\> \</Header\> \<Body\> \<MapperID\>E4CBADA2\</MapperID\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| MapperID | Body | 是 | str | 映射器ID |

#### 3.8.12.4返回业务数据BusinessResponse

| \<Header\> \<Token\>1343821922160480256\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\> \<MapperFieldResponseModel\> \<MapperID\>E4CBADA2\</MapperID\> \<TableName\>ICDnine\</TableName\> \<FieldName\>Description\</FieldName\> \<IsRelationCol\>true\</IsRelationCol\> \<Status\>9002\</Status\> \<FieldAlias\>说明\</FieldAlias\> \<FieldType\>nvarchar(50)\</FieldType\> \<DataMapperType\>0\</DataMapperType\> \<ColFullNames /\> \<FieldExpression\>ICDnine.Description\</FieldExpression\> \</MapperFieldResponseModel\> \<MapperFieldResponseModel\> \<MapperID\>E4CBADA2\</MapperID\> \<TableName\>ICDnine\</TableName\> \<FieldName\>Tpye\</FieldName\> \<IsRelationCol\>false\</IsRelationCol\> \<Status\>9002\</Status\> \<FieldAlias\>类型\</FieldAlias\> \<FieldType\>nvarchar(50)\</FieldType\> \<DataMapperType\>0\</DataMapperType\> \<ColFullNames /\> \<FieldExpression\>ICDnine.Tpye\</FieldExpression\> \</MapperFieldResponseModel\> \<MapperFieldResponseModel\> \<MapperID\>E4CBADA2\</MapperID\> \<TableName\>ICDten\</TableName\> \<FieldName\>Category\</FieldName\> \<IsRelationCol\>true\</IsRelationCol\> \<Status\>9002\</Status\> \<FieldAlias\>类别\</FieldAlias\> \<FieldType\>nvarchar(50)\</FieldType\> \<DataMapperType\>0\</DataMapperType\> \<ColFullNames /\> \<FieldExpression\>ICDten.Category\</FieldExpression\> \</MapperFieldResponseModel\> \</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| MapperID | MapperFieldResponseModel | str | 映射器ID |
| TableName | MapperFieldResponseModel | str | 表名 |
| FieldName | MapperFieldResponseModel | str | 字段名 |
| IsRelationCol | MapperFieldResponseModel | bool | 是否为关联列 |
| FieldAlias | MapperFieldResponseModel | str | 字段别名 |
| FieldType | MapperFieldResponseModel | str | 字段类型 |
| DataMapperMethod | MapperFieldResponseModel | str | 计算规则 |
| ColNames | MapperFieldResponseModel | str[] | 包含的列 |
| FieldExpression | MapperFieldResponseModel | str | 表达式 |

#### 3.8.12.5注意事项

无

### 3.8.13获取映射数据列表 MDM\_GetMapperData

#### 3.8.13.1服务名 MessageCategory （消息类别）

MDM\_GetMapperData

#### 3.8.13.2用途

获取映射数据列表（有读权限）

#### 3.8.13.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>9286C6F29AFBB57A80B52AE3AE2721BC\</Token\> \</Header\> \<Body\> \<MapperID\>43429F45\</MapperID\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| MapperID | Body | 是 | str | 映射器ID |
| IsMatch | Body | 否 | bool | 是否匹配 |
| IsLock | Body | 否 | bool | 是否锁定 |
| IsDelete | Body | 否 | bool | 查询注销数据 |
| PageRequest | Body | 否 | str | 分页参数 |
| PageIndex | Body | 否 | int | 页码 |
| PageSize | Body | 否 | int | 每页个数 |

#### 3.8.13.4返回业务数据BusinessResponse

| \<Header\> \<Token\>9286C6F29AFBB57A80B52AE3AE2721BC\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\>{"Count":2,"PageList":[{"rowId":1,"Id":1,"BusinsessID":"","IsMatch":false,"Islocking":false,"IsDelete":false,"IsValid":true,"CreateTime":"2021-01-14T18:07:10.683","LastUpdateTime":"2021-01-14T18:07:10.683","Creater":"","LastUpdater":"","Section\_table\_Head":"朱医生","Internal\_medicine\_Name":null},{"rowId":2,"Id":2,"BusinsessID":"","IsMatch":false,"Islocking":false,"IsDelete":false,"IsValid":true,"CreateTime":"2021-01-14T18:07:10.683","LastUpdateTime":"2021-01-14T18:07:10.683","Creater":"","LastUpdater":"","Section\_table\_Head":"王医生","Internal\_medicine\_Name":null}]}\</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| PageList | Body | Array | 映射数据 |

#### 3.8.13.5注意事项

无

### 3.8.14获取已订阅的字典 MDM\_GetSubscribe

#### 3.8.14.1服务名 MessageCategory （消息类别）

MDM\_GetSubscribe

#### 3.8.14.2用途

获取已订阅的字典

#### 3.8.14.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \</Header\> \<Body\> \<SubscribeID\>\</SubscribeID\> \<UserID\>\</UserID\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| SubscribeID | Body | 否 | str | 订阅ID |
| UserID | Body | 否 | str | 第三方应用ID |

#### 3.8.14.4返回业务数据BusinessResponse

| \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \<StatusCode\>Success\</StatusCode\> \<Message\>成功\</Message\> \</Header\> \<Body\> \<SubscribeID\>073C9064\</SubscribeID\> \<UserID\>1343821922160480256\</UserID\> \<SubscribeToken\>0971eb2fdce44de0b6d661de7ea408c6\</SubscribeToken\> \<Status\>9002\</Status\> \<SubscribeDetails\> \<SubscribeDetailResponseModel\> \<SubscribeID\>073C9064\</SubscribeID\> \<SubscribeType\>5001\</SubscribeType\> \<SubscribeObjectID\>5373020891\</SubscribeObjectID\> \<SubscribeTime\>2021-01-19T09:33:53.742Z\</SubscribeTime\> \</SubscribeDetailResponseModel\> \</SubscribeDetails\> \</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| Message | Header | str | 消息 |
| SubscribeID | Body | str | 订阅ID |
| UserID | Body | str | 第三方应用ID |
| SubscribeToken | Body | str | 订阅Token |
| SubscribeDetails | Body | Array | 订阅明细 |
| SubscribeID | SubscribeDetailResponseModel | str | 订阅ID |
| SubscribeType | SubscribeDetailResponseModel | str | 订阅类型(主数据:5001,映数据:5002) |
| SubscribeObjectID | SubscribeDetailResponseModel | str | 订阅对象ID(映射数据表ID或者主数据ID) |
| SubscribeTime | SubscribeDetailResponseModel | str | 订阅时间 |

#### 3.8.14.5注意事项

无

### 3.8.15添加订阅字典 MDM\_AddSubscribe

#### 3.8.15.1服务名 MessageCategory （消息类别）

MDM\_AddSubscribe

#### 3.8.15.2用途

添加订阅字典

#### 3.8.15.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \</Header\> \<Body\> \<SubscribeType\>Table\</SubscribeType\> \<SubscribeObjectID\> \<string\>\</string\> \<string\>5475108722\</string\> \</SubscribeObjectID\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| SubscribeType | Body | 是 | str | 订阅类型（主数据：Table；映射数据：Mapper） |
| SubscribeObjectID | Body | 否 | Array | 订阅对象ID(映射数据表ID或者主数据ID) |

#### 3.8.15.4返回业务数据BusinessResponse

| \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\>073C9064\</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| Body |
 | str | 订阅ID |

#### 3.8.15.5注意事项

无

### 3.8.16获取已订阅字典的数据 MDM\_GetSubscribeList

#### 3.8.16.1服务名 MessageCategory （消息类别）

MDM\_GetSubscribeList

#### 3.8.16.2用途

获取已订阅字典的数据

#### 3.8.16.3业务请求消息BusinessRequest

| \<request\> \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \</Header\> \<Body\> \<BeginTime\>2020-12-20\</BeginTime\> \<EndTime\>2021-01-20\</EndTime\> \<SubscribeType\>Table\</SubscribeType\> \</Body\> \</request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| Token | Header | 是 | str | 令牌 |
| SubscribeType | Body | 是 | str | 订阅类型（主数据：Table；映射数据：Mapper） |
| BeginTime | Body | 否 | str | 开始时间(不传默认取从当前时间开始往前推一个月) |
| EndTime | Body | 否 | str | 结束时间(不传默认取从当前时间开始往前推一个月) |

#### 3.8.16.4返回业务数据BusinessResponse

| \<Header\> \<Token\>ED5A089BD95C40DA892AD7CDDC725FC5\</Token\> \<StatusCode\>Success\</StatusCode\> \</Header\> \<Body\> \<Count\>35\</Count\> \<PageList\> \<BusinessLogModel\> \<BusinessType\>DataLog\</BusinessType\> \<BusinessID\>5373020891\</BusinessID\> \<LogTime\>2021-01-19T14:24:36.4\</LogTime\> \<Content\>{"LogDateTime":"2021-01-19 14:24:36","Operator":"3A4BC53E0","OperatorName":"mdmAdmin","Content":"{\"ID\":\"6\",\"size\":\"14\",\"LastUpdater\":\"3A4BC53E0\",\"LastUpdateTime\":\"2021-01-19 14:24:38\",\"KEYID\":8}","CompareContent":"{\"ID\":\"6\",\"size\":\"18\",\"KEYID\":\"8\"}","OperationType":"编辑","ApproveID":null,"LogType":"DataLog"}\</Content\> \</BusinessLogModel\> \<BusinessLogModel\> \<BusinessType\>DataLog\</BusinessType\> \<BusinessID\>4843545819\</BusinessID\> \<LogTime\>2021-01-12T11:28:05.143\</LogTime\> \<Content\>{"LogDateTime":"2021-01-12 11:28:05","Operator":"0EC8A04807","OperatorName":"wkd","Content":"{\"CID\":\"问问\",\"Cname\":\"而我\",\"Ctime\":\"2021-01-12 11:26:27\",\"Mifrom\":\"传参\",\"Cprice\":\"12.32\",\"Creater\":\"0EC8A04807\",\"CreateTime\":\"2021-01-12 11:26:34\"}","CompareContent":null,"OperationType":"添加","ApproveID":"HYY01210112112633610","LogType":"DataLog"}\</Content\> \</BusinessLogModel\> \</PageList\> \</Body\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| Token | Header | str | 返回令牌 |
| StatusCode | Header | int | Success（成功） |
| Count | Body | Int | 总数 |
| BusinessType | BusinessLogModel | str | 业务类型（MDM系统内部区分字段，对接时可忽略） |
| BusinessID | BusinessLogModel | str | 主数据ID或者映射数据ID |
| LogTime | BusinessLogModel | str | 时间 |
| Content | BusinessLogModel | str | 内容 |

#### 3.8.16.5注意事项

无

## 3.9妇幼保健提供接口

### 3.9.1门诊电子病历（Lian\_GetOutpatientEmr）

#### 3.9.1.1服务名 MessageCategory （消息类别）

Lian\_GetOutpatientEmr

#### 3.9.1.2用途

根据挂号流水号和卡号，获取门诊病人现病史、主诉、既往史、过敏史、个人史、体格检查、专科检查、辅助检查等电子病历信息

#### 3.9.1.3业务请求消息BusinessRequest

| \<Request\>\<VisitNo\> **123456** \</VisitNo\>\<CardNo\> **4401000011112222** \</CardNo\>\</Request\> |
| --- |

**各元素说明**

| **节点名称** | **父节点名称** | **是否必填** | **数据类型** | **说明** |
| --- | --- | --- | --- | --- |
| VisitNo | Request | 否 | str | 挂号流水号（每次只能传一个） |
| CardNo | Request | 否 | str | 卡号（只用卡号查询，可获取该病人多个电子病历） |

**注：挂号流水号和卡号至少传其中一个，不能两者都为空。**

#### 3.9.1.4返回业务数据BusinessResponse

| \<Result\>\<ResultCode\>0\</ResultCode\>\<ResultMessage\>\</ResultMessage\>\<Content\>\<Pregnancy\>\<Name\> **TEST** \</Name\>\<CardNo\> **4401000011112222** \</CardNo\>\<VisitNo\> **123456** \</VisitNo\>\<Phi\> **现病史** \</Phi\>\<Chiefcomplaint\> **主诉** \</Chiefcomplaint\>\<PastMedicalHistory\> **既往史** \</PastMedicalHistory\>\<AllergyHistory\> **过敏史** \</AllergyHistory\>\<PersonalMedicalHistory\> **个人史** \</PersonalMedicalHistory\>\<PhyicalExam\> **体格检查** \</PhyicalExam\>\<GynExam\> **专科检查** \</GynExam\>\<Exam\> **辅助检查** \</Exam\>\<Note\> **备注** \</Note\>\</Pregnancy\>\</Content\>\</Result\> |
| --- |

**各元素说明**** ：**

| **节点名称** | **父节点名称** | **数据类型** | **说明** |
| --- | --- | --- | --- |
| ResultCode | Result | str | 0：成功，-1：失败 |
| ResultMessage | Result | str | 失败详细信息 |
| Content | Result | 节点 | 实例节点 |
| Pregnancy | Content | 节点 | 1..1，重复节点，一个节点为一个挂号流水号对应病历信息。当入参使用卡号而挂号流水号为空时，返回该卡号对应所有病历信息。 |
| Name | Pregnancy | str | 姓名 |
| CardNo | Pregnancy | str | 卡号 |
| VisitNo | Pregnancy | str | 流水号 |
| Phi | Pregnancy | str | 现病史 |
| Chiefcomplaint | Pregnancy | str | 主诉 |
| PastMedicalHistory | Pregnancy | str | 既往史 |
| AllergyHistory | Pregnancy | str | 过敏史 |
| PersonalMedicalHistory | Pregnancy | str | 个人史 |
| PhyicalExam | Pregnancy | str | 体格检查 |
| GynExam | Pregnancy | str | 专科检查 |
| Exam | Pregnancy | str | 辅助检查 |
| Note | Pregnancy | str | 备注 |

#### 3.9.1.5注意事项

注：入参中，挂号流水号和卡号至少传其中一个，不能两者都为空。
