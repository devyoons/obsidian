---
별칭:
  - "업무 - 급속 테스트시 확인할 log"
태그:
  - type/work-doc
  - context/work
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
노션원본: https://www.notion.so/14d24612498b80e4b9d6eb091aa2bc86
---

# 업무: 급속 테스트시 확인할 log

## 내용

---

---

#### websocker conneceted

```bash
[2024-11-19-14:43-27.511] [DEBUG][net.ez.ws.interceptor.SecurityInterceptor]
rawMessage [upgrade:"websocket", connection:"upgrade", x-real-ip:"112.218.73.204", x-forwarded-for:"112.218.73.204", host:"cp.any-ev.com", sec-websocket-protocol:"ocpp1.6", sec-websocket-key:"MDIwMjMwMzI3MzkwMDAwMA==", sec-websocket-version:"13"]

[2024-11-19-14:43-27.511] [DEBUG][net.ez.ws.interceptor.SecurityInterceptor]
rawMessage servletRequest !!! : SecurityContextHolderAwareRequestWrapper[ org.springframework.security.web.header.HeaderWriterFilter$HeaderWriterRequest@614a97b8]

[2024-11-19-14:43-27.511] [DEBUG][net.ez.ws.interceptor.SecurityInterceptor]
rawMessage servletRequest.Authorization !!! : null

[2024-11-19-14:43-27.511] [WARN ][net.ez.ws.interceptor.SecurityInterceptor]
[upgrade:"websocket", connection:"upgrade", x-real-ip:"112.218.73.204", x-forwarded-for:"112.218.73.204", host:"cp.any-ev.com", sec-websocket-protocol:"ocpp1.6", sec-websocket-key:"MDIwMjMwMzI3MzkwMDAwMA==", sec-websocket-version:"13"]

[2024-11-19-14:43-27.512] [DEBUG][org.apache.ibatis.logging.jdbc.BaseJdbcLogger]
==>  Preparing: /* findSecurityProfileById */ SELECT TCM.SCRT_LV FROM T_CHRR_M1 as TCM JOIN T_CHST_M1 AS STATION JOIN T_BIZP_MGMT_M1 AS BIZP ON BIZP.BIZP_TYPE_CODE = '9' ON TCM.CHST_ID = STATION.CHST_ID WHERE BIZP.BIZP_ID = STATION.BIZP_ID AND TCM.CHRR_MGMT_ID = ?

[2024-11-19-14:43-27.512] [DEBUG][org.apache.ibatis.logging.jdbc.BaseJdbcLogger]
==> Parameters: 99999603(String)

[2024-11-19-14:43-27.513] [DEBUG][net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator]
 com.zaxxer.hikari.pool.ProxyPreparedStatement.execute(ProxyPreparedStatement.java:44)
3. /* findSecurityProfileById */

        SELECT TCM.SCRT_LV
          FROM T_CHRR_M1 as TCM
          JOIN T_CHST_M1 AS STATION
          JOIN T_BIZP_MGMT_M1 AS BIZP
            ON BIZP.BIZP_TYPE_CODE = '9'
            ON TCM.CHST_ID = STATION.CHST_ID
         WHERE BIZP.BIZP_ID = STATION.BIZP_ID
           AND TCM.CHRR_MGMT_ID = '99999603'

[2024-11-19-14:43-27.514] [DEBUG][org.apache.ibatis.logging.jdbc.BaseJdbcLogger]
<==      Total: 1

[2024-11-19-14:43-27.514] [DEBUG][org.apache.ibatis.logging.jdbc.BaseJdbcLogger]
==>  Preparing: /* findSecurityProfileById */ SELECT TCM.SCRT_LV FROM T_CHRR_M1 as TCM JOIN T_CHST_M1 AS STATION JOIN T_BIZP_MGMT_M1 AS BIZP ON BIZP.BIZP_TYPE_CODE = '9' ON TCM.CHST_ID = STATION.CHST_ID WHERE BIZP.BIZP_ID = STATION.BIZP_ID AND TCM.CHRR_MGMT_ID = ?

[2024-11-19-14:43-27.514] [DEBUG][org.apache.ibatis.logging.jdbc.BaseJdbcLogger]
==> Parameters: 99999603(String)

[2024-11-19-14:43-27.514] [DEBUG][net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator]
 com.zaxxer.hikari.pool.ProxyPreparedStatement.execute(ProxyPreparedStatement.java:44)
3. /* findSecurityProfileById */

        SELECT TCM.SCRT_LV
          FROM T_CHRR_M1 as TCM
          JOIN T_CHST_M1 AS STATION
          JOIN T_BIZP_MGMT_M1 AS BIZP
            ON BIZP.BIZP_TYPE_CODE = '9'
            ON TCM.CHST_ID = STATION.CHST_ID
         WHERE BIZP.BIZP_ID = STATION.BIZP_ID
           AND TCM.CHRR_MGMT_ID = '99999603'

[2024-11-19-14:43-27.515] [DEBUG][org.apache.ibatis.logging.jdbc.BaseJdbcLogger]
<==      Total: 1

[2024-11-19-14:43-27.515] [DEBUG][net.ez.ws.interceptor.SecurityInterceptor]
rawMessage ====================================== SecurityBefore HandShake start
headers : [upgrade:"websocket", connection:"upgrade", x-real-ip:"112.218.73.204", x-forwarded-for:"112.218.73.204", host:"cp.any-ev.com", sec-websocket-protocol:"ocpp1.6", sec-websocket-key:"MDIwMjMwMzI3MzkwMDAwMA==", sec-websocket-version:"13"]

[2024-11-19-14:43-27.515] [DEBUG][net.ez.ws.interceptor.SecurityInterceptor]
rawMessage ------------------------> SecurityProcess1 start

[2024-11-19-14:43-27.515] [DEBUG][net.ez.ws.interceptor.SecurityInterceptor]
rawMessage ------------------------> SecurityProcess2 start

[2024-11-19-14:43-27.515] [DEBUG][net.ez.ws.interceptor.SecurityInterceptor]
rawMessage ------------------------> protocol :[ocpp1.6]

[2024-11-19-14:43-27.516] [DEBUG][net.ez.ws.interceptor.SecurityInterceptor]
rawMessage ------------------------> SecurityProcess3 start = LEVEL0

[2024-11-19-14:43-27.516] [DEBUG][net.ez.ws.interceptor.SecurityInterceptor]
profile.needBasicAuthentication() : false

[2024-11-19-14:43-27.516] [DEBUG][net.ez.ws.interceptor.SecurityInterceptor]
else

[2024-11-19-14:43-27.518] [DEBUG][net.ez.ws.websockethandler.BaseWebSocketHandler]
rawMessage requestUr at BaseWebSocketHandler = ws://cp.any-ev.com/ocpp/99999603

[2024-11-19-14:43-27.518] [DEBUG][net.ez.ws.websockethandler.BaseWebSocketHandler]
rawMessage requestUr at BaseWebSocketHandler = StandardWebSocketSession[id=12bdbe1d-897e-245a-ea3d-27ee7ce6e50b, uri=ws://cp.any-ev.com/ocpp/99999603]

[2024-11-19-14:43-27.518] [DEBUG][org.apache.ibatis.logging.jdbc.BaseJdbcLogger]
==>  Preparing: /* findChargePointIdByManagementId */ SELECT CHRR_ID FROM V_CHRG_POINT WHERE CHRR_MGMT_ID = ?

[2024-11-19-14:43-27.518] [DEBUG][org.apache.ibatis.logging.jdbc.BaseJdbcLogger]
==> Parameters: 99999603(String)

[2024-11-19-14:43-27.518] [DEBUG][net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator]
 com.zaxxer.hikari.pool.ProxyPreparedStatement.execute(ProxyPreparedStatement.java:44)
3. /* findChargePointIdByManagementId */

         SELECT CHRR_ID
           FROM V_CHRG_POINT
          WHERE CHRR_MGMT_ID = '99999603'

[2024-11-19-14:43-27.519] [DEBUG][org.apache.ibatis.logging.jdbc.BaseJdbcLogger]
<==      Total: 1

[2024-11-19-14:43-27.520] [DEBUG][net.ez.ws.websockethandler.WebSocketSessionHandler]
[websoketServerIp or dockerIp] : 192.168.0.41 // [websoketServerPort or dockecPort] : 48090

[2024-11-19-14:43-27.520] [DEBUG][net.ez.ws.websockethandler.WebSocketSessionHandler]
rawMessage MY ChargePoint: ChargePointEntity(sessionId=12bdbe1d-897e-245a-ea3d-27ee7ce6e50b, registrationStatus=Pending, booted=false, chargePointStatus=Available, websoketServerIp=192.168.0.41, websoketServerPort=48090, chargePointManagementId=99999603, chargePointRdbId=CHRR0000000000012515, meChargePointInfo=net.ez.core.data.MEChargePointInfo@17f4e81c)

[2024-11-19-14:43-27.523] [DEBUG][net.ez.ws.websockethandler.WebSocketSessionHandler]
rawMessage [99999603] is connected!

```

#### BootNotification

req

```bash
[
	2,
	"1000000",
	"BootNotification",
		{
			"chargePointModel":"EZ-MC007-PIW",
			"chargePointSerialNumber":"10202739",
			"chargePointVendor":"EzCharger",
			"firmwareVersion":"EZIC042902_0402_1",
			"iccid":"",
			"imsi":"",
			"chargeBoxSerialNumber":"99999603",
			"meterType":"7250008235",
			"meterSerialNumber":"02023032739"
		}
]
```

res

```bash
 [
	 3,
	 "1000000",
	 {
		 "currentTime":"2024-11-19T05:43:27.618485591Z",
		 "interval":30,
		 "status":"Accepted"
	 }
 ]
```

#### StatusNotification

req 

- `vendorId` , `vendorErrorCode` 무시

```bash
[
	2,
	"1000001",
	"StatusNotification",
		{
			"connectorId":0,
			"errorCode":"NoError",
			"vendorId":"EasyCharger",
			"vendorErrorCode":"0",
			"status":"Available",
			"timestamp":"2024-11-19T05:43:27.000Z"
		}
]
```

res

```bash
[3,"1000001",{}]
```

#### DataTransfer - GetpricingProfile

req

```bash
[
	2,
	"1000507",
	"DataTransfer",
		{
			"vendorId":"EasyCharger",
			"messageId":"GetPricingProfile",
			"data":"
				{ \"connectorId\":1 }"
		}
]
```

res

```bash
 [
	 3,
	 "1000507",
	 {
		 "status":"Accepted",
		 "data":"{
			 \"connectorId\":1,
			 \"profileVersion\":1,
			 \"pricingProfile\":[
				 {
					 \"priceType\":\"Member\",
					 \"currency\":\"KRW\",
					 \"schedule\":[
						 {
							 \"startPeriod\":0,
							 \"unitPrice\":3500.0
						 }
					 ]
				 },{
					 \"priceType\":\"NonMember\",
					 \"currency\":\"KRW\",
					 \"schedule\":[
						 {
							 \"startPeriod\":0,
							 \"unitPrice\":4900.0
						 }
					 ]
				 }
			 ]
		 }"
	 }
 ]
```

#### Authorize

```bash
[2,"1000108","Authorize",{"idTag":"1019160086931326"}]
```

```bash
[
	3,
	"1000108",
	{
		"idTagInfo":
			{
				"expiryDate":"2024-12-19T06:18:45.719094074Z",
				"parentIdTag":"P_TAG",
				"status":"Accepted"
			}
	}
]
```

#### StartTransaction

```bash
[
	2,
	"1000110",
	"StartTransaction",
	{
		"connectorId":1,
		"meterStart":0,
		"timestamp":"2024-11-19T06:18:51.000Z",
		"idTag":"1019160086931326"
	}
]
```

```bash
[
	3,
	"1000110",
	{
		"idTagInfo":
			{
				"expiryDate":"2024-12-19T06:18:52.655777744Z",
				"parentIdTag":"P_TAG",
				"status":"Accepted"
			},
		"transactionId":4002
	}
]
```

#### DataTransfer - GetPrice

```bash
[
	2,
	"1000132",
	"DataTransfer",
	{
		"vendorId":"EasyCharger",
		"messageId":"GetPrice",
		"data":"
			{ 
				\"connectorId\":1, 
				\"transactionId\":4002 
			}"
	}
]
```

```bash
[
	3,
	"1000132",
	{
		"status":"Accepted",
		"data":"
			{
				\"connectorId\":1,
				\"currency\":\"KRW\",
				\"unitPrice\":3500.0,
				\"reqamt\":0
			}"
	}
]
```

#### MeterValue

```bash
[
	2,
	"1000125",
	"MeterValues",
		{
			"connectorId":1,
			"meterValue":[
				{
					"timestamp":"2024-11-19T06:21:52.490Z",
					"sampledValue":
						[
							{
								"value":"125",
								"measurand":"Energy.Active.Import.Register",
								"unit":"Wh"
							},{
								"value":"39",
								"measurand":"Temperature",
								"unit":"Celsius"
							},{
								"value":"210",
								"measurand":"Voltage",
								"unit":"V"
							},{
								"value":"12",
								"measurand":"Current.Import",
								"unit":"A"
							}
						]
				}
			],
			"transactionId":4002
		}
]
```

```bash
[3,"1000125",{}]
```

#### StopTransaction

req

```bash
[
	2,
	"1000133",
	"StopTransaction",
		{
			"meterStop":199,
			"transactionId":4002,
			"idTag":"1019160086931326",
			"timestamp":"2024-11-19T06:23:33.000Z",
			"reason":"EVDisconnected"
		}
]
```

res

```bash
 [
	 3,
	 "1000133",
		 {
			 "idTagInfo":
				 {
					 "expiryDate":"2024-12-19T06:23:34.136530354Z",
					 "parentIdTag":"P_TAG",
					 "status":"Accepted"
				 }
		 }
 ]
```

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/OCPP 2.0.1 설계 문서|OCPP 2.0.1 설계 문서]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
