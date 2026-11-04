---
별칭:
  - "업무 - OCPP 1.6 프로토콜 분석 및 CSMS-1.6 설계 문서"
태그:
  - type/work-doc
  - context/work
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
노션원본: https://www.notion.so/983230420e684f3fb79e4c5b41af30e3
---

# 업무: OCPP 1.6 프로토콜 분석 및 CSMS-1.6 설계 문서

## 내용

| 버전 | 작성자 | 작성일 | 내역 | 검토/승인자 | 검토/승인일 |
| --- | --- | --- | --- | --- | --- |
| 1.0.1 |  | November 3, 2023  | - functional block 별 유즈케이스 선별
- 프로토콜 유즈케이스별 시퀀스 다이어그램 작성 
- 결제별 시퀀스 다이어그램 작성
- JsonScheme 를 이용한 각 메세지별 PDU 정리

 |  | November 6, 2023  |
|  |  |  |  |  |  |

> **이 문서는 ez-charger의 ocpp1.6를 참조하여  작성 되었습니다.**
> 

---

**목차**

## A. CSMS 서버 구성

---

### 1. AS-IS CSMS 서버 구성

✅ AS-IS CSMS 서버의 문제점

| 충전기 소켓 세션 관리 | 충전기 세션을 현재 CSMS in Memory에서 관리하고 있습니다. 이는 추후에 CSMS의 업데이트나 CSMS 서버 다운시에 복구가 힘든 부분이 있습니다. |
| --- | --- |
| 충전 트랜잭션 관리 | 모든 충전세션의 관리를 인메모리에서 하고 있습니다. 물론 db에 내역을 남기고는 있지만 충전세션 또한 서버 시에 복구가 어렵다는 점이 존재 합니다. |
| 메세지 관리 | 모든 메세지의 관리를 서버내 inmemory로 관리하고 있습니다. 서버 다운 시  데이터 복구가 불가능합니다. |
| 웹소켓 서버에서의 직접 db 관리 | 웹소켓 서버의 안전성을 떨어 트립니다. |
| APP 서버의 다중 역할 | **현재 모바일 서버에서 CSMS의 각종 CRUD 작업과 비즈니스 로직과 관련된 기능을 수행하고 있습니다. 이는 앱서버의 부하의 원인이 될것이며, 서비스의 품질을 떨어트릴 뿐만 아니라 CSMS본연의 역할에도 문제를 일으킵니다.** |

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/as-is.svg]]

### 2. TO_BE CSMS 서버 구성

✅ TO-BE CSMS 서버의 새로운 구성

| 충전기 소켓 세션 관리 | 충전기 세션을 Redis 캐시로 관리 합니다. 별개의 reis 서버로 세션을 관리 하기에 WS t서버에 문제가 생겨도 충전기 정보를 유지 할 수 있습니다. |
| --- | --- |
| 충전 트랜잭션 관리 | 기존의 충전 트랜잭션을 redis로 관리합니다. |
| 메세지 관리 | 기존의 메세지를 inMemory 방식에서 redis 캐시로 관리 합니다. |
| 웹소켓 서버에서의 직접 db 관리 | WS 서버에서의 db의 직접 접근을 이용하지 않습니다. |
| 모바일서버와 CSMS API 서버의 분리 | CSMS 의 구성을 
WS , API 두가지 형태로 나눴습니다.
API 서버는 기존 (ASIS)의 APP의 기능들을 수용하며 DBtransaction기능을 수행하며, third-party 의 rest-api 형태의 통신을 제공합니다.
WS 서버는 충전기와의 통신을 역할만을  수용 하고 그외의 모든 job은 수용하지 않습니다. |

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/to_be서버.svg]]

#### 1. Redis Cache의 이용

<aside>
📌 자바의 **`ConcurrentHashMap`**은 웹소켓 세션 관리에 자주 쓰이는 데이터 구조 중 하나입니다. 하지만, 웹소켓 서버가 다운되는 경우에는  맵에 저장된 모든 데이터가 손실됩니다.

이런 문제를 해결하려면 웹소켓 세션과 관련된 데이터의 영속성을 확보해야 합니다. 레디스(Redis) 같은 인메모리 데이터 스토어는 네트워크를 통해 접근 가능하며, 여러 서버 인스턴스 간에 세션 상태를 공유할 수 있게 해줍니다. 이렇게 하면 단일 서버 인스턴스의 실패가 전체 시스템의 세션 관리에 영향을 미치지 않도록 할 수 있습니다.

</aside>

- (AS-IS) **`ConcurrentHashMap`을 사용한 방식**
    - **충전기 상태 관리 (`ChargePointStore`)**: 서버 인스턴스의 메모리에 충전기 상태를 저장함. 서버가 종료되면 데이터가 손실됨.
    - **결과 상태 관리 (`ResultStore`)**: 요청에 대한 응답 상태를 임시로 저장함. 서버가 종료되면 응답 데이터가 손실됨.
    - **작업 상태 관리 (`TaskStore`)**: 특정 요청 유형에 대한 작업 객체를 저장함. 서버 재시작 시 작업 객체 정보가 손실됨.
    - **이전 요청 관리 (`PreviousRequestStore`)**: 이전 요청을 추적하여 중복 처리를 방지함. 서버가 종료되면 추적 정보가 손실됨.
    
- (TO-BE)**분산 캐시 를 사용하는 방식**
    - **충전기 상태 관리**: 레디스와 같은 분산 캐시에 충전기 상태를 저장하여, 여러 서버 인스턴스 간에 상태 공유 가능.
    - **결과 상태 관리**: 각 요청에 대한 응답 상태를 분산 캐시에 저장하여, 요청 상태가 서버 재시작과 무관하게 유지됨.
    - **작업 상태 관리**: 작업 객체의 지속성을 위해 분산 캐시를 사용하여, 서버 재시작 후에도 작업 상태 복원 가능.
    - **이전 요청 관리**: 중복 요청을 식별하기 위해 이전 요청의 메타데이터를 분산 캐시에 저장하여, 장애 발생 시에도 요청 추적 정보 보존.

#### 2. 구조 개요

<aside>
📌 해당 프로젝트는 **API 서버**와 **WebSocket (WS) 서버** 두 부분으로 구분되어 설계되었습니다.

- **독립적 확장성**: 각 서버는 별도의 트래픽 패턴과 리소스 요구사항에 맞춰 독립적으로 확장이 가능합니다.
- **관심사의 분리**: API와 WS는 각각 별도의 기능적 측면을 중점으로 하며, 이를 통해 각 서버의 목적과 기능을 명확하게 정의할 수 있습니다.
- **통신의 안정성**: CRUD 연산 중 발생할 수 있는 예외 상황에도 WS의 통신 안정성을 유지합니다.
</aside>

- **WebSocket (WS) 서버**
    - 충전 장치와의 실시간 통신을 통한 충전 세션 및 메시지 관리
    - 실시간 통신 기반의 세션 유지 및 메시지 전달
    - 충전기의 상태 변화나 이벤트 발생 시 즉시 반응 및 알림
    - 다수의 충전기와의 통신을 효율적으로 관리
- **API 서버**
    - 비즈니스 로직 처리 (충전 상태 확인, 요금 결제 등)
    - 추후 서드파티 시스템과의 API 인터페이스 기능 고려
    - 데이터베이스와의 연동을 통한 데이터 관리 및 CRUD 연산 처리
    - 외부 시스템 또는 사용자에게 필요한 데이터 제공 및 인증 처리
    

운영 환경에서 API 서버와 WS 서버는 동일한 OS 내에서 구동됩니다. 이로 인해 서비스 간의 통신 오버헤드는 최소화됩니다.

## B. 결제별 충전 시퀀스

#### 1. 현장 IC 결제

✅ 현장 IC 결제 충전 플로우입니다.

#### 2. 현장 RF 결제

✅ 현장 RF 결제 (회원, 로밍) 충전 플로우입니다.

#### 3. APP 결제

✅ App 결제 충전 플로우입니다.

## C. 기능단위 별 구현

### 1. 보안(Security)

✅ **보안 프로필 레벨 2를 이용합니다.**

- 보안레벨 2 : TLS with Basic Authentication

| 프로필 | 충전기 인증 | CSMS 인증 | 통신 보안 |
| --- | --- | --- | --- |
| 레벨1 (보안이 적용 되지 않은 기본 인증) | HTTP 기본 인증 | - | - |
| 레벨2(TLS를 이용한 기본 인증) | HTTP 기본 인증 | TLS 인증서 인증 | TLS |
| 레벨3(TLS 클라이언트 인증) | TLS 인증서 인증 | TLS 인증서 인증 | TLS |

### 2. BootNotification (부팅)

✅ **BootNotification 시퀀스 플로우입니다.**

- pending이 되었을때는 time Interval을 주기로 계속 부팅을 다시 시도합니다.
- pending 상황에서는 Component, Variable의 값을 변경할 수 있습니다.

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/9aef4d61_Untitled.png]]

#### ➡️ BootNotification.req

```json
[ 
    2,
    "4c0f335f-6a89-439c-b0ec-fefd0cedae4b",
    "BootNotification",
    {
        "chargePointModel": "EZ-MC007-PRR",
        "chargePointVendor": "EasyCharger",
        "chargePointSerialNumber": "10000101",
        "imsi": "01229544582",
        "firmwareVersion": "EZ0103K"
    }
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| chargePointModel | string[0..25] | **`Required`** 충전기의 모델을 식별하는 값 |
| chargePointVendor | string[0..20] | **`Required`** 충전기 공급업체를 식별하는 값 |
| chargePointSerialNumber | string[0..25] | 충전기의 일련 번호를 식별하는값 |
| imsi | string[0..20] | SIM 카드 모뎀의 IMSI |
| firmwareVersion | string[0..50] | 충전기의 펌웨어 버전 |

#### ⬅️ BootNotification.res

```json
[ 
    3,
    "4c0f335f-6a89-439c-b0ec-fefd0cedae4b",
    {
        "currentTime": "2022-11-02T19:38:56.564",
        "interval": 120,
        "status": "Accepted"
    } 
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| currentTime | ZonedDateTime | **`Required`** 중앙 시스템의 current time |
| interval | Integer | **`Required`** RegistrationStatus가 `Accepted`면 heartbeat 간격(초)이 포함. 중앙 시스템이 Accepted 외의 상태를 반환하는 경우, 다음 BootNotification을 요청하기 전에 최소한의 대기 시간을 나타낸다 |
| status | RegistrationStatus | **`Required`** 충전기가 중앙 시스템에 등록되었는지 여부를 표시 |

<aside>
📌 RegistrationStatus 분류 
`Accepted`, `Pending`, `Rejected`

</aside>

### 3. Authorize (권한인증)

✅ **Authorization 시퀀스 플로우입니다. (PnC인증 X)**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/2ddd59c6_Untitled.png]]

✅ **Authorization 시퀀스 플로우입니다. (PnC인증 O)**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/3fb45542_Untitled.png]]

#### ➡️ Authorize.req

```json
[ 
    2,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    "Authorize",
    { 
        "idTag": "1010010192054138"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| idTag | String[0..512] | **`Required`** authorized 되야 할 identifer가 포함 |

#### ⬅️ Authorize.res

```json
[
    3,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    {
        "idTagInfo": {
            "parentIdTag": "P_TAG",
            "expiryDate": "2022-11-02T19:39:07.533",
            "status": "Accepted"
        }
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| parentIdTag | String[0..20] | 부모 식별자 |
| status | AuthorizationStatus | **required.** 중앙 시스템에서 idTag를 승인했는지의 여부 |
| expiryDate | ZonedDateTime | Authorization Cache 에서 idTag를 제거해야하는 날짜를 포함 |

<aside>
📌 AuthorizationStatus 분류
`Accepted`, `Blocked`, `Expired`, `Invalid`, `ConcurrentTx`

</aside>

### 4. StatusNotification (충전기 상태)

✅ **StatusNotification 시퀀스 플로우 입니다.**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/0d04b718_Untitled.png]]

#### ➡️ StatusNotification.req

```json
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

| Field Name | Field Type | Description |
| --- | --- | --- |
| connectorId | integer | **required.** 상태가 보고되는 커넥터의 Id. '0'값일 경우 충전기의 main controller가 사용 |
| errorCode | ChargePointErrorCode | **required.** 충전기가 보고한 오류 코드 |
| status | ChargePointStatus | **required.** 충전기의 현재 상태 |

<aside>
📌 ChargePointStatus 분류

작동상태 - `Available`, `PreParing`, `Charging`, `suspendedEV`, `SuspendedEVSE`, `Finishing`
작동하지않는 상태 - `Unvailable`, `Faulted`

</aside>

#### ⬅️ StatusNotification.res

```json
[
    3,
    "8d8e1ab6-35d6-495d-89ce-785f70022cad",
    {}
]
```

### 5. StartTransaction (충전 시작)

✅ **StartTransaction 시퀀스 플로우입니다.**

- APP결제인 경우 선결제이므로 APP에서 주문 등록합니다.

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/8fb6f7b1_Untitled.png]]

#### ➡️ StartTransaction.req

```json
[
    2,
    "e80edccf-31a9-4065-8f2a-d04dad311fc5",
    "StartTransaction",
    {
        "reservationId": 2,
        "connectorId": 1,
        "idTag": "1010010192054138",
        "meterStart": 0,
        "timestamp": "2022-11-02T19:39:21Z"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| connectorId | Integer | **`Required`** 커넥터 ID |
| resercationId | integer | 상태가 보고되는 커넥터의 Id. '0'값일 경우 충전기의 main controller가 사용 |
| idTag | String | **`Required`** 권한 인증된 식별자 포함 |
| meterStart | Integer | **`Required`** 충전기의 현재 상태 |
| timestamp | ZonedDateTime | 트랜잭션이 시작된 날짜 및 시간 |

#### ⬅️ StartTransaction.res

```json
[
    3,
    "e80edccf-31a9-4065-8f2a-d04dad311fc5",
    {
        "idTagInfo":
        {
            "expiryDate":"2024-05-19T07:07:52.01712914Z",
            "parentIdTag":"P_TAG",
            "status":"Accepted"
        },
        "transactionId":1007
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| idTagInfo | idTagInfo | **`Required`** 커넥터 ID |
| transactionId | Integer | **`Required`** 실시간 충전 ID |
- IdTagInfo

| Field Name | Field Type | Description |
| --- | --- | --- |
| expiryDate | ZonedDateTime | Authorization Cache 에서 idTag를 제거해야하는 날짜를 포함 |
| parentIdTag | String | 부모 식별자 |
| status | AuthorizationStatus | **`Required`** 중앙 시스템에서 idTag를 승인했는지의 여부 |

<aside>
📌 AuthorizationStatus 분류
`Accepted`, `Bloked`, `Expired`, `Invalid`, `ConcurrentTx`

</aside>

### 6. MeterValues (충전 정보)

✅ **MeterValues 시퀀스 플로우 입니다.**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/86ed4ed2_Untitled.png]]

#### ➡️ MeterValues.req

```json
[
    2,
    "0874e15b-2c5e-42d2-b903-a5d3cff08c3f",
    "MeterValues",
    {
        "connectorId": 1,
        "meterValue": 
        [
            {
                "timestamp": "2023-09-18T06:04:55Z",
                "sampledValue": 
                    [
                        {
                            "value": "125",
                            "measurand": "Energy.Active.Import.Register",
                            "unit": "Wh"
                        },{
                            "value": "-119",
                            "measurand": "Temperature",
                            "unit": "Celsius"
                        },{
                            "value": "204",
                            "measurand": "Voltage",
                            "unit": "V"
                        },{
                            "value": "13",
                            "measurand": "Current.Import",
                            "unit": "A"
                        },{
                            "value":"61",
                            "measurand":"SoC",
                            "unit":"Percent"
                        }
                    ]
            }
        ],
        "transactionId": 616
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| connectorId | Integer | **`Required`** 충전기 커넥터 ID |
| transactionId | Integer | 실시간 충전 ID |
| meterValue | List<MeterValue> | **`Required`** timestamps가 있는 샘플링 된 meter value |

#### ⬅️ MeterValues.res

```json
[
    3,
    "e3669ba6-f071-45c0-9b52-c440127b0708",
    {}
]
```

### 7. StopTransaction (충전 중지)

✅ **StopTransaction 시퀀스 플로우 입니다.**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/a59aa2b7_Untitled.png]]

#### ➡️ StopTransaction.req

```json
[
    2,
    "e80edccf-31a9-4065-8f2a-d04dad311fc5",
    {
        "idTag":"ORDER000000000002228",
        "meterStop":66,
        "timestamp":"2024-04-23T13:23:48Z",
        "transactionId":1075,
        "reason":"Remote"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| idTag | String | 충전을 중지하도록 요청한 식별자 |
| meterStop | Integer | **`Required`** 트랜잭션 종료 시 커넥터의 MeterValue 값을 Wh단위로 표시 |
| timestamp | ZonedDateTime | 트랜잭션이 중지된 날짜와 시간 |
| transactionId | Integer | 실시간 충전 ID |
| reason | Reason | 트랜잭션이 중지된 이유 |
| transactionData | List<MeterValue> | builing purpose과 관련된 트랜잭션 사용 세부정보 |

<aside>
📌 Reason 분류
`DeAuthorized`, `EmergencyStop`, `EVDisconnected`, `HardReset`, `Local`, `Other`, `PowerLoss`, `Reboot`, `Remote`, `SoftReset`, `UnlockCommand`

</aside>

#### ⬅️ StopTransaction.res

```json
[
    2,
    "e80edccf-31a9-4065-8f2a-d04dad311fc5",
    {
        "idTagInfo":
            {
                "expiryDate":"2024-05-23T13:23:48.543511927Z",
                "parentIdTag":"P_TAG",
                "status":"Accepted"
            }
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| parentIdTag | String[0..20] | 부모 식별자 |
| status | AuthorizationStatus | **`Required`** 중앙 시스템에서 idTag를 승인했는지의 여부 |
| expiryDate | ZonedDateTime | Authorization Cache 에서 idTag를 제거해야하는 날짜를 포함 |

<aside>
📌 AuthorizationStatus 분류
`Accepted`, `Blocked`, `Expired`, `Invalid`, `ConcurrentTx`

</aside>

### 8. RemoteStartTransaction (원격 충전 시작)

✅ **RemoteStartTransaction 시퀀스 플로우 입니다.**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/f0d3e299_Untitled.png]]

#### ➡️ RemoteStartTransaction.req

```json
[
    2,
    "e80edccf-31a9-4065-8f2a-d04dad311fc5",
    "RemoteStartTransaction",
    {
        "connectorId":1,
        "idTag":"ORDER000000000005065"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| connectorId | Integer | `Required` 충전기 커넥터 id |
| idTag | String | `Required` 중앙 시스템에서 idTag를 승인했는지의 여부 |

#### ⬅️ RemoteStartTransaction.res

```json
[
    3,
    "e80edccf-31a9-4065-8f2a-d04dad311fc5",
    {
        "status":"Accepted"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| status | RemoteStartStopStatus | `Required` 충전기가 트랜잭션 시작 요청을 수락하는지의 여부 |

<aside>
📌 RemoteStartStopStatus 분류
`Accepted` , `Reject`

</aside>

### 9. RemoteStopTransaction (원격 충전 중지)

✅ **RemoteStopTransaction 시퀀스 플로우 입니다.**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/accad60c_Untitled.png]]

#### ➡️ RemoteStopTransaction.req

```json
[
    2,
    "53bfa520-8669-11ed-b3c1-fb5fb4e7057c",
    "RemoteStopTransaction",
    {
        "transactionId":2017
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| transactionId | Integer | `Required` 실시간 충전 ID |

#### ⬅️ RemoteStopTransaction.res

```json
[
    3,
    "53bfa520-8669-11ed-b3c1-fb5fb4e7057c",
    {
        "status":"Accepted"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| status | RemoteStartStopStatus | `Required` StartTransaction에서 받은 트랜잭션 ID |

<aside>
📌 RemoteStartStopStatus 분류
`Accepted` , `Reject`

</aside>

### 10. Reset (재부팅)

**✅ Reset 시퀀스 플로우 입니다.**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/ba8cb643_Untitled.png]]

#### ➡️ Reset.req

```json
[
    2,
    "53bfa520-8669-11ed-b3c1-fb5fb4e7057c",
    "Reset",
    {
        "type": "Hard"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| type | ResetType | `Required` 리부팅 방법 설정 |

#### ⬅️ Reset.res

```json
[
    3,
    "53bfa520-8669-11ed-b3c1-fb5fb4e7057c",
    {
        "status":"Accepted"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| status | ResetStatus | `Required` 충전기에서 리부팅 수락 여부 |

<aside>
📌 ResetStatus분류
`Accepted` , `Reject`

</aside>

### 11. DataTransfer (데이터 전송)

#### 11-0. DataTransferCommonMessage

- ➡️ **DataTransfer.req**
    - messageId로 메세지를 구분하며, 해당 메세지에 필요한 값은 data로 요청합니다.
    
    ```json
    [
        2,
        "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
        "DataTransfer",
        {
            "vendorId":"EasyCharger",
            "messageId":"GetPrice",
            "data":"{ \"connectorId\":1, \"transactionId\":1190 }"}
    ]
    ```
    
    <aside>
    📌 messageId 분류
    `GetPrice`, `GetPricingProfile`, `PayInfo`, `PartialCancel`, `PhoneNumber`, `MACAddress`, `GetParkingFee`, `ParkingFee`, `PayInfoParking`
    
    </aside>
    
- ⬅️ **DataTransfer.res**
    - 성공여부와 요청 받은 메세지에 해당하는 data값을 응답합니다.
    
    ```json
    [
        3,
        "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
        {
            "status":"Accepted",
            "data":"{\"connectorId\":1,\"currency\":\"KRW\",\"unitPrice\":4200.0}"
        }
    ]
    ```
    

#### **11-1. GetPrice**

**✅ DataTransfer-GetPrice 시퀀스 플로우 입니다.**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/2737fc9e_Untitled.png]]

➡️ **GetPrice.req**

```json
[
    2,
    "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
    "DataTransfer",
    {
        "vendorId":"EasyCharger",
        "messageId":"GetPrice",
        "data":"{ \"connectorId\":1, \"transactionId\":1190 }"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| connectorId | Integer | `Required` 충전기 커넥터 ID |
| transactionId | Integer | `Required` 실시간 충전 ID |

⬅️ **GetPrice.res**

```json
[
    3,
    "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
    {
        "status":"Accepted",
        "data":"{\"connectorId\":1,\"currency\":\"KRW\",\"unitPrice\":4200.0}"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| connectorId | Integer | `Required` 충전기 커넥터 ID |
| currency | String | `Required` 화폐 코드 |
| unitPrice | float | `Required` 단가 |
| reqamt | Integer | `Required` 요청금액 |

#### **11-2. G**etPricingProfile

**✅ DataTransfer-GetPricingProfile 시퀀스 플로우 입니다.**

: 충전기에서 첫 디스플레이 화면에서 회원, 비회원 단가를 보여주기 위해서 중앙시스템에 요청하는 메세지

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/6d7d0e7c_Untitled.png]]

➡️ **GetPricingProfile.req**

```json
[
    2,
    "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
    "GetPricingProfile",
    {
        "vendorId":"EasyCharger",
        "messageId":"GetPrice",
        "data":"{ \"connectorId\":1 }"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| connectorId | Integer | `Required` 충전기 커넥터 ID |

⬅️ **GetPricingProfile.res**

```json
[
    3,
    "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
    {
        "status":"Accepted",
        "data":"{\"connectorId\":1,\"profileVersion\":1,\"pricingProfile\":[{\"priceType\":\"Member\",\"currency\":\"KRW\",\"schedule\":[{\"startPeriod\":0,\"unitPrice\":4200.0}]},{\"priceType\":\"NonMember\",\"currency\":\"KRW\",\"schedule\":[{\"startPeriod\":0,\"unitPrice\":4900.0}]}]}"
    }
]

```

| Field Name | Field Type | Description |
| --- | --- | --- |
| connectorId | Integer | `Required` 충전기 커넥터 ID |
| profileVersion | Integer | `Required` Pricing Profile 버전 |
| pricingProfile | List<PricingProfileResponse> | `Required` 충전기에서 설정되는 충전단가 |
- PricingProfileResponse
    
    
    | Field Name | Field Type | Description |
    | --- | --- | --- |
    | priceType | PriceType | `Required` 회원, 비회원 구분 |
    | currency | String | `Required` 화폐 코드 |
    | schedule | List<PricingScheduleResponse> | `Required` 시작기간과 충전 단가 |

#### 11-3. PayInfo

**✅ DataTransfer-PayInfo시퀀스 플로우 입니다.**

: 충전기에서 IC 카드 리더기를 통해서 결제된 경우, 결제 정보를 서버로 전송하기 위한 메시지

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/c770f069_Untitled.png]]

➡️ **PayInfo.req**

```json
[
    2,
    "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
    "PayInfo",
    {
        "vendorId":"EasyCharger",
				"messageId":"PayInfo",
				"data":"{ \"authAmount\": 1000, \"authDate\": \"20240419\", \"authTime\": \"193822\", \"authNo\": \"30035929    \", \"transactionNo\": \"NS240419193822218682\", \"payResult\": \"1\", \"connectorId\": 1, \"transactionId\": 1016 }"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| authAmount | Integer | `Required` 승인 금액 |
| authDate | String | `Required` 승인 날짜 |
| authTime | String | `Required` 승인 시간 |
| authNo | String | `Required` 승인 번호 |
| transactionNo | String | `Required` 트랜잭션 고유번호 |
| payResult | String | `Required` 결제 상태 코드 |
| connectorId | Integer | 충전기 커넥터 ID |
| transactionId | long | 실시간 충전 ID |

⬅️ **PayInfo.res**

```json
[
    3,
    "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
    {
        "status":"Accepted",
        "data":"{\"status\":\"Accepted\"}"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| status | CommonStatus | `Required` 데이터 전송의 성공 여부 |

<aside>
📌 CommonStatus 구분
`Accepted`*,* `Rejected`

</aside>

#### 11-4. PartialCancel

**✅ DataTransfer-PartialCancel 시퀀스 플로우 입니다.**

: 충전기에서 IC카드 리더기를 통해서 결제된 금액보다 충전 금액이 적을 경우, 해당 차액 만큼을 부분취소한 거래 이력을 서버로 전송하는 메세지

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/97ae8678_Untitled.png]]

➡️ **PartialCancel .req**

```json
[
    2,
    "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
    "PartialCancel",
    {
        "vendorId":"EasyCharger",
				"messageId":"PartialCancel",
				"data":"{ \"authAmount\": 976, \"authDate\": \"20240420\", \"authTime\": \"215354\", \"authNo\": \"30035952    \", \"transactionNo\": \"NS240420215211261946\", \"orgAuthNo\": \"30035952    \", \"orgTransactionNo\": \"NS240420215211261946\", \"payResult\": \"1\", \"connectorId\": 1  }"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| authAmount | Integer | `Required` 승인 금액 |
| authDate | String | `Required` 승인 날짜 |
| authTime | String | `Required` 승인 시간 |
| authNo | String | `Required` 승인 번호 |
| transactionNo | String | `Required` 트랜잭션 고유번호 |
| payResult | String | `Required` 결제 상태 코드 |
| connectorId | Integer | 충전기 커넥터 ID |
| transactionId | long | 실시간 충전 ID |

⬅️ **PartialCancel.res**

```json
[
    3,
    "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
    {
        "status":"Accepted",
        "data":"{\"status\":\"Accepted\"}"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| status | CommonStatus | `Required` 데이터 전송의 성공 여부 |

<aside>
📌 CommonStatus 구분
`Accepted`*,* `Rejected`

</aside>

#### 11-5. **GetParkingFee**

**✅ DataTransfer-GetParkingFee시퀀스 플로우 입니다.**

: 충전기에서 주차장 요금 정보를 서버에 요청하는 메세지

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/d04bc1e9_Untitled.png]]

➡️ **GetParkingFee.req**

```json
[
    2,
    "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
    "PartialCancel",
    {
        "vendorId":"EasyCharger",
        "messageId":"GetParkingFee", 
        "data":"{\"connectorId\":1}"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| connectorId | Integer | `Required` 충전기 커넥터 ID |

⬅️ **GetParkingFee.res**

```json
[
    3,
    "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
    {
        "status":"Accepted",
        "data":"{\"connectorId\":1,\"unitprice\":1000,\"unitduration\":10,\"unit\":1,\"after\":1}"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| connectorId | Integer | `Required` 충전기 커넥터 ID |
| unitprice | Integer | `Required` 단가 |
| unitduration | Integer | `Required` 단가 부가 시간 |
| unit | ParkingTimeUnitEnumType | `Required` 주차 시간 단위 (0 : sec, 1 : min, 2 : hour) |
| after | Integer | `Required` 주차시간 단위 기준으로 after 시간 후에 unit |

#### 11-6. **PayInfoParking**

**✅ DataTransfer-PayInfoParking시퀀스 플로우 입니다.**

: 충전기에서 IC카드 리더기를 통해 결제한 사용자의 미출차 요금 정보를 서버로 보내는 메세지 

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/27899d51_Untitled.png]]

➡️ **PayInfoParking.req**

```json
[
    2,
    "1000012",
    "DataTransfer",
    {
        "vendorId": "EasyCharger",
        "messageId": "PayInfoParking",
        "data": "{ \"authAmount\": 200, \"authDate\": \"20221103\", \"authTime\": \"110830\", \"authNo\": \"11080354 \",\"transactionNo\": \"NS221103110830D20997\", \"payResult\":\"1\", \"connectorId\": 1, \"transactionId\": 703 }"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| authAmount | Integer | `Required` 승인 금액 |
| authDate | String | `Required` 승인 날짜 |
| authTime | String | `Required` 승인 시간 |
| authNo | String | `Required` 승인 번호 |
| transactionNo | String | `Required` 트랜잭션 고유번호 |
| payResult | String | `Required` 결제 상태 코드 |
| connectorId | Integer | 충전기 커넥터 ID |
| transactionId | long | 실시간 충전 ID |

⬅️ **PayInfoParking.res**

```json
[
    3,
    "1000012",
    {
        "status": "Accepted",
        "data": "{\"status\":\"Accepted\"}"
    }
]

```

| Field Name | Field Type | Description |
| --- | --- | --- |
| status | CommonStatus | `Required` 데이터 전송의 성공 여부 |

<aside>
📌 CommonStatus 구분
`Accepted`*,* `Rejected`

</aside>

#### 11-7. **ParkingFee**

**✅ DataTransfer-ParkingFee 시퀀스 플로우 입니다.**

: 충전기에서 선불로 결제한 사용자의 미출차 요금 정보를 서버로 보내는 메세지

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/7dc9ad91_Untitled.png]]

#### 11-8. **MACAddress**

**✅ DataTransfer-MACAddress 시퀀스 플로우 입니다.**

: 충전기에서 커넥터 연결된 차량의 MAC 주소를 서버로 보내는 메세지 

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/2ed65606_Untitled.png]]

➡️ **MACAddress.req**

```json
[
    2,
    "1000012",
    "DataTransfer",
    {
        "vendorId": "EasyCharger",
        "messageId": "MACAddress",
        "data":"{\"connectorId\":1,\"mac\":\"test\"}"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| mac | String | `Required` MAC Address |
| connectorId | Integer | `Required` 충전기 커넥터 ID |

⬅️ **MACAddress.res**

```json
[
    3,
    "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
    {
        "status":"Accepted",
        "data":"{}"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| connectorId | Integer | `Required` 충전기 커넥터 ID |

#### 11-9. **PhoneNumber**

**✅ DataTransfer-PhoneNumber 시퀀스 플로우 입니다.**

: 충전기에서 IC 결제를 진행하는 사용자의 핸드폰 번호를 인증하기 위한 메세지

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/c8901b04_Untitled.png]]

➡️ **PhoneNumber.req**

```json
[
    2,
    "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
    "PhoneNumber",
    {
        "vendorId":"EasyCharger",
        "messageId":"PhoneNumber", 
        "data":"{\"connectorId\":1,\"phone\":\"01066667899\"}"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| connectorId | Integer | `Required` 충전기 커넥터 ID |
| phone | String | `Required` 연락처 |

⬅️ **PhoneNumber.res**

```json
[
    3,
    "d9b2fd73-cc2d-4b7b-976b-1e125630dea9",
    {
        "status":"Accepted",
        "data":"{\"number\":\"15\"}"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| number | String | `Required` 인증번호 |

### 12. FirmwareManagement (펌웨어 관리)

**✅ FirmwareUpdate 시퀀스 플로우 입니다.**

#### ➡️ UpdateFirmware.req

```json
[ 
    2,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    "UpdateFirmware",
    {
        "location":"ftp://ftpuser:!aaa1234@112.219.38.5:41001/ftp/upload/2024/05/17/ezic7k_fota_24042901.zip",
        "retries":3,
        "retrieveDate":"2024-05-17T05:09:54.892803504Z",
        "retryInterval":10
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| location | String | `Required` 다운받을 파일 경로 |
| retries | Integer | 재시도 횟수 |
| retrieveDate | ZonedDateTime | 재시도 날짜 |
| retryInterval | Integer | 재시도 간격 |

#### ⬅️ UpdateFirmware.res

```json
[ 
    3,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f"
    {}
]
```

#### ➡️ FirmwareStatusNotification.req

```json
[ 
    2,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    "FirmwareStatusNotification",
    {
        "status":"Installed"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| status | FirmwareStatus | `Required` 업데이트 상태 |

<aside>
📌 FirmwareStatus 구분
`Downloaded`*,* `DownloadFailed`*,* `Downloading`, `Idle`, `InstallationFailed`, `Installing`, `Installed`

</aside>

#### ⬅️ FirmwareStatusNotification.res

```json
[ 
    3,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f"
    {}
]
```

### 13. SetChargingProfile (스마트 차징)

**✅ SetChargingProfile 시퀀스 플로우 입니다.**

: 충전기 그룹의 전체 출력 대비 충전기 출력을 실시간으로 제어하기 위한 용도로 사용한다.

- BootNotification, StartTransaction, StopTransaction시 서버에서 충전기별로 ChargingProfile 전송

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/42cdb97b_Untitled.png]]

#### ➡️ **SetChargingProfile.req**

- BootNotification → `chargingProfilePurpose` : `TxProfile`
- StartTransaction, StopTransaction → `chargingProfilePurpose` : `ChargePointMaxProfile`
- `chargingProfileKindType` → `Absolute` 로 고정

```json
[ 
    2,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    "SetChargingProfile",
    {
        "connectorId":0,
        "csChargingProfiles":
            {
                "chargingProfileId":12345678,
                "stackLevel":0,
                "chargingProfilePurpose":"TxProfile",
                "chargingProfileKindType":"Absolute",
                "chargingSchedule":
                    {
                        "chargingRateUnit":"W",
                        "chargingSchedulePeriod":
                            [
                                {
                                    "startPeriod":0,
                                    "limit":7000
                                }
                            ]
                    }
            }
     }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| connectorId | Integer | `Required` 충전기 커넥터 ID |
| csChargingProfiles | ChargingProfile | `Required` 전력, 전압 정보 기술 |
- ChargingProfile

| Field Name | Field Type | Description |
| --- | --- | --- |
| chargingProfileId | Integer | `Required` 충전기 커넥터 ID |
| transactionId | Integer | 실시간 충전 ID |
| stackLevel | Integer | `Required` charging schedule 우선순위 |
| chargingProfilePurpose | ChargingProfilePurposeType | `Required` charging schedule 목적 |
| chargingProfileKindType | ChargingProfileKindType | `Required` charging schedule 종류 |
| chargingSchedule | ChargingSchedule | `Required` charging schedule data |

<aside>
📌 ChargingProfileKindType 구분
`Absolute`, `Recurring`, `Relative`

</aside>

- ChargingSchedule

| Field Name | Field Type | Description |
| --- | --- | --- |
| `chargingRateUnit` | `ChargingRateUnitType` | `Required` charging rate unit : W or A |
| `chargingSchedulePeriod` | `List<ChargingSchedulePeriod>` | `Required` charging schedule period |
- ChargingSchedulePeriod

| Field Name | Field Type | Description |
| --- | --- | --- |
| startPeriod | Integer | `Required` 시작 시간 |
| limit | BigDecimal | `Required` 충전기 설정 용량 값 |

#### ⬅️ **SetChargingProfile.res**

```json
[
    3,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    {
        "status":"Accepted"
    }
]
```

| Field Name | Field Type | Description |
| --- | --- | --- |
| status | ChargingProfileStatus | `Required` 데이터 전송의 성공 여부 |

<aside>
📌 ChargingProfileStatus 구분
`Accepted`, `Rejected`, `NotSupported`

</aside>

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/OCPP 2.0.1 설계 문서|OCPP 2.0.1 설계 문서]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
