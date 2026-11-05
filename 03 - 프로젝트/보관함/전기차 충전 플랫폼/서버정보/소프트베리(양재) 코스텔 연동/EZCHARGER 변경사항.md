---
별칭:
  - "서버 - EZCHARGER 변경사항"
tags:
  - type/server
  - context/work
  - theme/dev
  - status/completed
  - domain/도구-기타
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
환경: 
노션원본: https://www.notion.so/14524612498b80ba9c91e8cfa07e785c
주제:
  - "[[00 - 대시보드/주제/OCPP·EV 충전|OCPP·EV 충전]]"
---

# 서버: EZCHARGER 변경사항

## 내용

---

---

### 1️⃣ StatusNotification 2024.04.19 이한별

#### req

```bash
[
	 2,
	 "8d8e1ab6-35d6-495d-89ce-785f70022cad",
	 "StatusNotification",
	 {
		 "connectorId": 0,
		 "errorCode": "NoError",
		 "status": "Available"
	 }
]
```

| FIELD NAME  | FIELD TYPE  | DESCRIPTION |
| --- | --- | --- |
| connectorId | integer | 상태가 보고되는 커넥터의 Id. '0'값일 경우 충
전기의 main controller가 사용 |
| errorCode | ChargePointErrorCode | 충전기가 보고한 오류 코드 |
| status | ChargePointStatus | 충전기의 현재 상태 |
| `vendorId` | CiString255Type | 제조사 정보 |
| `vendorErrorCode` | CiString50Type | 제조사 충전기 에러 코드 |
- `vendorId`, `vendorErrorCode` 추가사항

### 2️⃣ 기타사항 : 충전기에서 발생하는 에러 코드 전송 2024.04.19 이한별

#### StatusNotification.req

- 제조사 모던텍 “moderntec” 추가
- 에러코드에 대한 경우 로직이 추가된 것으로 보임. 아래 문서 필요
    
    ![[03 - 프로젝트/보관함/전기차 충전 플랫폼/서버정보/소프트베리(양재) 코스텔 연동/첨부/30194a0c_image.png]]
    

### 3️⃣ DataTransfer - GetUserInfo 2024.05.21 , 2024.06.11 이한별, 이재헌

| ChargingUserInfo추가 | 2024.05.21  | 이한별 |
| --- | --- | --- |
| ChargingUserInfo → GetChargingUserInfo 로 변경 | 2024.05.29 | 이한별 |
| GetChargingUserInfo → GetUserInfo 로 변경 | 2024.06.11 | 이재헌 |
- MacAddress 후에 서버에서 충전기로 전송하는 정보 (완속 충전기 전용)
- 구현되어있지 않음

### 4️⃣ DataTransfer - GetIdTagProfile (시그넷한정) 2024.05.31 이재헌

- 기존 문서에 없는 메시지이며, 프로토콜 문서에 있는 메시지라서 틀만 있고 구현되어있지 않음
- 어느시점에 어디서 시작하는 메시지인지 확인 및 기능에 대한 설명 필요

### 5️⃣ DataTransfer - BatteryInfo 2024.06.26 이한별

- 구현되어있지 않음
- 어느시점에 어디서 시작하는 메시지인지 확인 및 기능에 대한 설명 필요

### 6️⃣ UpdateFirmware, FirmwareStatusNotification 2024.08.26 이한별

- 기존 문서에는 없었으나 협의하에 구현되어있는 부분
- updateFirmware
    - retrieveDate 날짜 타입 변경
    - 나머지 동일

### 7️⃣ DataTransfer - StopTransactionSubInfo(시그넷한정) 2024.11.21 이재헌

- 구현되어있지 않음
- 어느시점에 어디서 시작하는 메시지인지 확인 및 기능에 대한 설명 필요

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/서버정보/소프트베리(양재) 코스텔 연동/소프트베리(양재) 코스텔 연동|소프트베리(양재) 코스텔 연동]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
