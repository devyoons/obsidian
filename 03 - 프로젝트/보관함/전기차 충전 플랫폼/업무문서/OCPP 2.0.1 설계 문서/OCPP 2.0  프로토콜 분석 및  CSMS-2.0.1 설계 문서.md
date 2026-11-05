---
별칭:
  - "업무 - OCPP 2.0  프로토콜 분석 및  CSMS-2.0.1 설계 문서"
tags:
  - type/work-doc
  - context/work
  - theme/dev
  - status/completed
  - domain/기초-자격증
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
노션원본: https://www.notion.so/404411feeb784ff79a7348fd2c42dc5d
주제:
  - "[[00 - 대시보드/주제/소프트웨어 설계|소프트웨어 설계]]"
  - "[[00 - 대시보드/주제/OCPP·EV 충전|OCPP·EV 충전]]"
---

# 업무: OCPP 2.0  프로토콜 분석 및  CSMS-2.0.1 설계 문서

## 내용

| 버전 | 작성자 | 작성일 | 내역 | 검토/승인자 | 검토/승인일 |
| --- | --- | --- | --- | --- | --- |
| 0.1 |  | October 20, 2023 | - functional block 별 유즈케이스 선별
- 프로토콜 유즈케이스별 시퀀스 다이어그램 작성 
- 결제별 시퀀스 다이어그램 작성

 |  | October 27, 2023  |
|  |  |  |  |  |  |

> **이 문서는  ez-charger의 ocpp1.6의 서비스 플로우를 를 참조하여  작성 되었습니다.**
> 

---

**목차**

## A. CSMS 서버 구성

---

### 1. AS-IS CSMS 서버 구성

✅ **AS-IS CSMS 서버의 문제점**

| 충전기 소켓 세션 관리 | 충전기 세션을 현재 CSMS in Memory에서 관리하고 있습니다. 이는 추후에 CSMS의 업데이트나 CSMS 서버 다운시에 복구가 힘든 부분이 있습니다. |
| --- | --- |
| 충전 트랜잭션 관리 | 모든 충전세션의 관리를 인메모리에서 하고 있습니다. 물론 db에 내역을 남기고는 있지만 충전세션 또한 서버 시에 복구가 어렵다는 점이 존재 합니다. |
| 메세지 관리 | 모든 메세지의 관리를 서버내 inmemory로 관리하고 있습니다. 서버 다운 시  데이터 복구가 불가능합니다. |
| 웹소켓 서버에서의 직접 db 관리 | 웹소켓 서버의 안전성을 떨어 트립니다. |
| APP 서버의 다중 역할 | **현재 모바일 서버에서 CSMS의 각종 CRUD 작업과 비즈니스 로직과 관련된 기능을 수행하고 있습니다. 이는 앱서버의 부하의 원인이 될것이며, 서비스의 품질을 떨어트릴 뿐만 아니라 CSMS본연의 역할에도 문제를 일으킵니다.** |

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/as-is.svg]]

### 2. To_BE CSMS 서버 구성

✅ **TO-BE CSMS 서버의 새로운 구성**

| 충전기 소켓 세션 관리 | 충전기 세션을 Redis 캐시로 관리 합니다. 별개의 reis 서버로 세션을 관리 하기에 WS t서버에 문제가 생겨도 충전기 정보를 유지 할 수 있습니다. |
| --- | --- |
| 충전 트랜잭션 관리 | 기존의 충전 트랜잭션을 redis로 관리합니다. |
| 메세지 관리 | 기존의 메세지를 inMemory 방식에서 redis 캐시로 관리 합니다. |
| 웹소켓 서버에서의 직접 db 관리 | WS 서버에서의 db의 직접 접근을 이용하지 않습니다. |
| 모바일서버와 CSMS API 서버의 분리 | CSMS 의 구성을 
WS , API 두가지 형태로 나눴습니다.
API 서버는 기존 (ASIS)의 APP의 기능들을 수용하며 DBtransaction기능을 수행하며, third-party 의 rest-api 형태의 통신을 제공합니다.
WS 서버는 충전기와의 통신을 역할만을  수용 하고 그외의 모든 job은 수용하지 않습니다. |

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/201c3844_Untitled.png]]

---

## B. OCPP 2.0.1  설명

<aside>
🗒️ OCPP 2.0.1은 OCPP 1.6 또는 OCPP 1.5와는 호환되지 않는 새로운 기능을 도입하며 다양한 개선 및 새로운 기능을 제공합니다. 아래는 OCPP 2.0.1의 주요 향상점과 새로운 기능에 대한 설명입니다. OCPP 2.0.1의 모든 단위기능은 OCA  OCPP2.0.1 에 대한 가이드에 대해 명세되어 있습니다. 하단 문서는 간추린 내용이며 상세한 내용은 첨부된 가이드를 참고하셔야 합니다.

</aside>

### 2.0.1 새로운 기능 요약

**1. 장치 관리**

- **재고 보고:** 장치 관리의 핵심 요소 중 하나로, 충전 스테이션의 재고 상태 및 가용성을 보고합니다.
- **개선된 오류 및 상태 보고:** OCPP 2.0에서는 오류 및 상태 보고 메커니즘이 개선되어 빠른 문제 식별과 해결을 지원합니다.
- **개선된 구성:** 충전 스테이션의 설정을 더 효율적으로 관리하고 구성합니다.
- **사용자 정의 모니터링:** CSO는 충전 스테이션의 모니터링을 사용자 정의하고 원하는 데이터를 추적할 수 있습니다.

**2. 개선된 거래 관리**

- **모든 거래 관련 기능에 대한 하나의 메시지:** OCPP 2.0에서는 거래 데이터 보고가 통합되어 StartTransaction, StopTransaction, MeterValue 및 StatusNotification 메시지를 통합한 'TransactionEvent'로 대체됩니다.
- **데이터 축소:** WebSocket 압축을 지원하여 데이터 양을 더욱 줄일 수 있습니다.

**3. 사이버 보안 개선**

- **클라이언트 측 인증서의 키 관리:** 인증서의 키 관리를 통해 더 강력한 보안을 지원합니다.
- **안전한 펌웨어 업데이트:** 충전 스테이션의 펌웨어를 안전하게 업데이트할 수 있습니다.
- **보안 이벤트 로그:** 보안 이벤트 및 활동을 추적하는 이벤트 로그가 도입되었습니다.

**4. 확장된 스마트 충전**

- **에너지 관리 시스템 (EMS)에서 직접 스마트 충전 입력:** EMS가 충전 스테이션에 직접 스마트 충전 명령을 제공할 수 있습니다.
- **로컬 컨트롤러를 사용한 향상된 스마트 충전:** 로컬 컨트롤러를 통해 스마트 충전을 더 효과적으로 관리할 수 있습니다.
- **CSMS, 충전 스테이션 및 EV의 통합 스마트 충전:** ISO 15118-1 표준을 지원하며, CSMS, 충전 스테이션 및 EV 간의 통합 스마트 충전을 지원합니다.

**5. ISO 15118 지원**

- **Plug & Charge:** ISO 15118 표준을 통해 플러그 & 충전을 지원하며, 사용자 친화적인 충전 프로세스를 제공합니다.
- **스마트 충전 및 EV의 입력을 통한 스마트 충전:** ISO 15118 표준을 통해 스마트 충전을 지원하며, EV가 충전 프로세스에 입력을 제공할 수 있습니다.

**6. 고객 경험 개선**

- **더 많은 승인 옵션:** RFID 카드/토큰 이외의 승인 시스템을 지원합니다.
- **디스플레이 메시지:** CSO는 충전 스테이션에 표시되는 메시지를 구성하고 제어할 수 있습니다.
- **EV 운전자 선호 언어:** EV 운전자의 언어 선호도를 고려하여 메시지를 표시할 수 있습니다.
- **요금 및 비용 표시:** 충전 스테이션은 충전 시작 전 및 충전 중에 요금을 표시하며, 트랜잭션 완료 후 최종 비용을 표시할 수 있습니다.

**7. 전송 프로토콜: OCPP-J 개선**

- **간단한 메시지 라우팅:** OCPP 메시지 라우팅을 더 효율적으로 구현하기 위한 간단한 솔루션이 추가되었습니다.
- **SOAP 지원 없음:** OCPP 2.0은 더 이상 SOAP을 전송 프로토콜로 지원하지 않습니다.

**8. 마이너한 변경/확장**

- **메시지 이름 변경:** 몇 가지 메시지 이름이 더 명확하게 변경되었습니다.
- **TransactionId 식별 및 메시지 순서 지정:** 거래 식별자가 충전 스테이션에서 생성되며, 메시지에 증분 시퀀스 번호가 할당됩니다.
- **확장된 enumType:** 더 많은 사용 사례를 지원하기 위해 enumType이 확장되었습니다.
- **오프라인 트랜잭션 이벤트 표시:** 오프라인 상태에서도 트랜잭션 이벤트를 메시지에서 선택적으로 표시할 수 있습니다.
- **개인 메시지:** EV 운전자에게 표시되는 메시지로, 요금 정보, 사용자 인사 및 충전 권한 거부 이유를 제공합니다.

이러한 개선 사항과 새로운 기능은 OCPP 2.0의 핵심을 형성하며 충전 스테이션 및 전기차 충전 네트워크의 운영을 효율적으로 지원합니다.

## C. OCPP-J RPC 구현

<aside>
🗒️ OCPP 1.6과 동일합니다.

</aside>

## D. 결제별 충전 시퀀스

✅ OCPP 1.6의 충전시퀀스와 유사하게 구성

- 결제 → 충전 → 충전 중지 순으로 충전 시퀀스는 구성 되어있습니다.
- 충전은 원격 중지와 현장 중지 두가지 경우를 구성했습니다.

#### 1. 현장 IC 결제

✅ 현장 IC 결제 이후 충전 시퀀스 플로우입니다.

- AS-IS의 DataTransfer 규약을 동일하게 적용

#### 2. 현장 RF 결제

✅ 현장 RF 결제 (회원, 로밍) 충전 플로우입니다.

### 3. APP 결제

✅ App 결제 충전 플로우입니다.

---

## E. 기능단위 별 구현

### 1. 보안(Security)

✅ **보안 프로필 레벨 2를 이용합니다.**

- 보안레벨 2 : TLS with Basic Authentication

| 프로필 | 충전기 인증 | CSMS 인증 | 통신 보안 |
| --- | --- | --- | --- |
| 레벨1 (보안이 적용 되지 않은 기본 인증) | HTTP 기본 인증 | - | - |
| 레벨2(TLS를 이용한 기본 인증) | HTTP 기본 인증 | TLS 인증서 인증 | TLS |
| 레벨3(TLS 클라이언트 인증) | TLS 인증서 인증 | TLS 인증서 인증 | TLS |

---

### 2. BootNotification (부팅)

✅ **BootNotification 시퀀스 플로우입니다.**

- pending이 되었을때는 time Interval을 주기로 계속 부팅을 다시 시도합니다.
- pending 상황에서는 Component, Variable의 값을 변경할 수 있습니다.
- 충전기 자동 펌웨어 상태 확인 및 업데이트 필요 충전기 업데이트 요청 (RF 펌웨어만 동작)
- 충전소 스마트 차징 상태 확인 및 스마트 차징 프로필(기본 값)요청 스케줄러 등록

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/6a5a17ff_Untitled.png]]

#### ➡️ BootNotification.req

```json
[ 
    2,
    "4c0f335f-6a89-439c-b0ec-fefd0cedae4b",
    "BootNotification",
    {
        "reason":"PowerUp",
        "chargingStation":
            {
                "serialNumber":"10102034",
                "model":"EZ-MC007-PIW",
                "vendorName":"EasyCharger",
                "firmwareVersion":"EZ104Lpt_V05"
            }
    }
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| reason | BootReasonEnumType | **`Required`** 메세지 보내는 이유 |
| chargingStation | ChargingStationType | **`Required`** 충전소 식별 |
- **ChargingStationType**
    
    
    | Field Name | Field Type  | Description |
    | --- | --- | --- |
    | serialNumber | String[0..25] | 충전기의 일련 번호를 식별하는값 |
    | model | String[0..25] | **`Required`** 충전기의 모델을 식별하는 값 |
    | vendorName | String[0..50] | **`Required`** 충전기 공급업체를 식별하는 값 |
    | firmwareVersion | String[0..50] | 충전기의 펌웨어 버전 |
    | modemType | ModemType | 통신 링크의 기능 매개변수를 정의 |
- **ModemType**
    
    
    | Field Name | Field Type  | Description |
    | --- | --- | --- |
    | iccid | String[0..20] | SIM 카드의 ICCID |
    | imsi | String[0..20] | SIM 카드의 IMSI |

<aside>
📌 BootReasonEnumType 구분
`ApplicationReset`, `FirmwareUpdate`, `LocalReset`, `PowerUp`, `RemoteReset`, `Triggered`, `Unknown`, `Watchdog`

</aside>

#### ➡️ BootNotification.res

```json
[ 
    3,
    "4c0f335f-6a89-439c-b0ec-fefd0cedae4b",
    {
        "currentTime":"2024-05-16T14:24:12.269811719Z",
        "interval":30,
        "status":"Accepted"
    }
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| currentTime | ZonedDateTime | **`Required`** 중앙 시스템의 current time |
| interval | integer | **`Required`** RegistrationStatus가 `Accepted`면 heartbeat 간격(초)이 포함. 중앙 시스템이 Accepted 외의 상태를 반환하는 경우, 다음 BootNotification을 요청하기 전에 최소한의 대기 시간을 나타낸다 |
| status | RegistrationStatusEnumType | **`Required`** 충전기가 중앙 시스템에 등록되었는지 여부를 표시 |
| statusInfo | StatusInfoType | 자세한 상태 정보 |

<aside>
📌 RegistrationStatusEnumType 구분
`Accepted`, `Pending`, `Rejected`

</aside>

### 3. Reset(재부팅)

**✅ Reset 시퀀스 플로우 입니다.**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/28c1d08f_Untitled.png]]

#### ➡️ Reset.req

```json
[ 
    2,
    "4c0f335f-6a89-439c-b0ec-fefd0cedae4b",
    "Reset",
    {
        "type":"Immediate",
        "evseId":99999981
    }
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| type | ResetEnumType | **`Required`** 설정 유형 |
| evseId | Integer | 충전기 ID |

<aside>
📌 ResetEnumType 구분
`Immediate`, `OnIdle`

</aside>

#### ⬅️ Reset.res

```json
[ 
    3,
    "4c0f335f-6a89-439c-b0ec-fefd0cedae4b",
    {
        "status":"Accepted"
    }
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| status | ResetStatusEnumType | **`Required`** 재설정을 수행할 수 있는지 여부 |
| statusInfo | StatusInfoType | 자세한 상태 정보 |
- **StatusInfoType 구분**
    
    
    | Field Name | Field Type  | Description |
    | --- | --- | --- |
    | reasonCode | String[0..20] | **`Required`** 응답에서 상태가 반환되는 이유에 대한 미리 정의된 코드 |
    | additionalInfo | String[0..512] | 자세한 정보를 제공하는 추가 텍스트 |

<aside>
📌 ResetStatusEnumType 구분
`Accepted`*,* `Rejected`*,* `Scheduled`

</aside>

---

### 4. Authorization (권한인증)

✅ **Authorization 시퀀스 플로우입니다. (PnC인증 X)**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/a851b5ce_Untitled.png]]

✅ **Authorization 시퀀스 플로우입니다. (PnC인증 O)**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/311dd1af_Untitled.png]]

#### ➡️ Authorize.req

```json
[
    2,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    "Authorize",
    {"idToken"
        {
            "idToken":"1019160086931326",
            "type":"Central"
        }
    }
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| idToken | IdTokenType | **`Required`** 인증을 위한 식별자를 포 |
- **IdTokenType**
    
    
    | Field Name | Field Type  | Description |
    | --- | --- | --- |
    | idToken | String[0..36] | **`Required`** authorized 되야 할 identifer 포함 |
    | type | IdTokenEnumType | **`Required`**  |
    - idToken에 차량번호,MACAddress, OrderId, 카드번호,IC결제 정보가 사용됩니다.

<aside>
📌 IdTokenEnumType 구분
`Central`,`eMAID`,`ISO14443`,`ISO15693`,`KeyCode`,`Local`,`MacAddress`,`NoAuthorization`

</aside>

#### ⬅️ Authorize.res

```json
[
    3,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    {
        "idTokenInfo":
            {
                "status":"Accepted"
            }
    }
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| idTokenInfo | IdTokenInfoType | **`Required`** 권한 부여에 대한 정보 |
- IdTokenInfoType
    
    
    | Field Name | Field Type  | Description |
    | --- | --- | --- |
    | status | AuthorizationStatusEnumType | **`Required`** 권한 부여에 대한 상태 |

---

### 5. TransactionEvent (충전 시작, 충전 정보, 충전 중지)

**✅ OCPP 2.0.1 Transaction 특징**

- OCPP 2.0.1 에서는 다양한 txStartPoint, txStopPoint 변수의 지장으로 충전기의 충전 시작 시점과 종료시점을 정의 할 수 있다.

| Enum타입 | **txStartPoint** | **txStopPoint** |
| --- | --- | --- |
| ParkingBayOccupancy | 주차장/충전 베이에 무언가 객체 (아마도 전기 자동차)가 감지됨을 나타냅니다. | 주차/충전 베이에서 물체(아마도 전기 자동차)가 더 이상 감지되지 않습니다. 즉, 해당 베이에서 차량이 떠났거나 감지되지 않음을 나타냅니다. |
| EvConnected | 충전 케이블의 양 끝이 연결되었거나, 무선 충전의 경우 EVSE와 EV 간의 초기 통신이 수립된 것을 나타냅니다. | 충전 케이블의 한쪽 또는 양쪽 끝이 연결 해제되었거나, 무선 충전의 경우 EVSE(전기 자동차 충전 장비)와 EV 간의 통신이 끊어진 것입니다. 이는 충전 연결 상태에 대한 이벤트입니다. |
| Authorized | 운전자 또는 전기 자동차가 승인되었음을 나타냅니다. 이것은 시작 버튼과 같은 익명 인증 형태일 수도 있습니다. | 운전자 또는 전기 자동차가 더 이상 허가되지 않았습니다. 이것은 익명 인가(예: 시작 버튼을 누름)와 같은 형태의 허가도 포함합니다. |
| PowerPathClosed | 충전을 위한 모든 전제 조건이 충족되었고, 전력이 흐를 수 있는 상태임을 나타냅니다.EVConnected and Authorized | 충전을 위한 모든 선행 조건이 더 이상 충족되지 않아 전력이 흐르지 않습니다. 이 이벤트는 EVConnected와 Authorized의 논리 OR(둘 중 하나라도 참일 경우)이며, EV가 연결 해제되거나 무효화될 때 거래가 종료되어야 하는 경우 사용됩니다. 이름과 달리 이 이벤트는 전원 릴레이의 상태와 관련이 없습니다. |
| EnergyTransfer | 전기 자동차와 EVSE 간에 에너지가 전송 중임을 나타냅니다. | EV와 EVSE 간에 에너지 전달이 일어나지 않습니다. 이 이벤트는 TxStopPoint(거래 중지 지점)로 사용하기에 권장되지 않으며, EV 또는 EVSE가 (일시적으로) 충전을 중단할 때 거래가 중지됩니다. |
| DataSigned | 전자식 미터에서 서명된 미터 값이 받아진 시점을 나타냅니다. 이것은 청구 가능한 거래가 시작되는 법적 규정에 적용될 수 **있습니다**. | 이 조건은 TxStopPoint(거래 중지 지점)로 사용할 의미가 없으며, 해당 용도로 사용해서는 안 됩니다. |

<aside>
🗒️ **NOTE**
OCPP 1.6과의 비슷한 충전 flow를 위해서 
txStartPoint : EnergyTransfer or PowerPathClosed
txStopPoint: : EnergyTransger or PowerPathClosed 의 enum타입의 변수를 사용하길 추천합니다.

</aside>

✅ OptionalField에 대한 규칙

1. evse(충전기 Id)
    - evse 필드는 EV가 연결된 후 최초의 TransactionEventRequest에서만 제공되어야 하며, 이후의 TransactionEventRequests에서는 반복해서 포함되어서는 안 됩니다.
2. idToken (아이디 토큰)
    - idToken 필드는 거래가 승인된 후 최초의 TransactionEventRequest에서 한 번만 제공되어야 합니다.
    - idToken 필드는 거래 승인이 종료된 TransactionEventRequest에서 한 번만 제공되어야 합니다.
    - idToken이 허용 상태로 승인된 경우, Authorization 캐시에 idToken이 있는 경우도 마찬가지로 한 번만 제공되어야 합니다.
    - idToken이 RequestStartTransactionRequest에서 제공되는 경우도 한 번만 제공되어야 합니다.
3. reservationId (예약 ID)
    - reservationId 필드는 거래가 idToken에 의해 승인되고 충전소에 예약이 있는 경우, 거래가 승인된 후 최초의 TransactionEventRequest에서만 제공되어야 합니다.
    - idToken이 RequestStartTransactionRequest에서 제공되는 경우도 reservationId가 처음의 TransactionEventRequest에서만 제공되어야 합니다.
4. meterValue (미터 값)
    - TransactionEventRequest(eventType=Started)는 SampledDataCtrlr.TxStartedMeasurands에서 구성된 미터 값을 포함해야 합니다.
    - TransactionEventRequest(eventType=Updated)는 SampledDataCtrlr.TxUpdatedInterval에서 구성된 간격마다 보내야 하며, SampledDataCtrlr.TxUpdatedMeasurands에서 구성된 미터 값을 포함해야 합니다.
    - TransactionEventRequest(eventType=Ended)는SampledDataCtrlr.TxEndedMeasurands에서 구성된 미터 값을 포함해야 합니다. 만약 SampledDataCtrlr.TxEndedInterval이 0이면, 거래 시작과 종료 시에만 값을 포함해야 합니다.
5. transactionInfo.chargingState (충전 상태)
    - 충전 상태가 변경될 때마다, 충전소는 chargingState를 포함하는 TransactionEventRequest를 보내야 합니다. TriggerReason이 ChargingStateChanged인 TransactionEventRequest는 chargingState를 반드시 포함해야 합니다.
6. transactionInfo.stoppedReason (거래 중지 이유)
    - 거래가 종료되면, stoppedReason은 반드시 TransactionEventRequest(eventType=Ended)에서 제공되어야 합니다. 단, 이 값이 Local인 경우는 생략할 수 있습니다.
    - 이 요구사항은 RequestStopTransactionRequest에 의해 중지된 거래에도 적용되며, 이 경우 stoppedReason 값은 반드시 Remote여야 합니다.
7. transactionInfo.remoteStartId (원격 시작 ID)
    - remoteStartId는 RequestStartTransactionRequest와 동일한 remoteStartId를 가진 다음 TransactionEventRequest에서 전송되어야 합니다.

#### ➡️ TransactionEvent.req

| Field Name | Field Type  | Description |
| --- | --- | --- |
| eventType | TransactionEventEnumType | **`Required`** 충전 상태 정보 (Started, Updated, Ended) |
| timestamp | ZonedDateTime | **`Required`** 트랜잭션이 시작된 날짜 및 시간 |
| triggerReason | TriggerReasonEnumType | **`Required`** 충전소가 메세지를 보내는 이유 |
| seqNo | Integer | **`Required`** 시퀀스 번호 |
| transactionInfo | TransactionType | 실시간 충전 ID 포함 |
| IdTokenType | idToken | 권한 인증된 식별자 포함 |
| EVSEType | evse | 충전기 정보 |
| meterValue | List<MeterValueType> | 시작 미터값 포함 |
- **TransactionType**
    
    
    | Field Name | Field Type  | Description |
    | --- | --- | --- |
    | transactionId | String[0..36] | **`Required`** 실시간 충전 ID |
- **IdTokenType**
    
    
    | Field Name | Field Type  | Description |
    | --- | --- | --- |
    | idToken | String[0..36] | **`Required`** 권한 인증된 식별자 |
    | type | IdTokenEnumType | **`Required`** idToken 유형 열거 |
- **EVSEType**
    
    
    | Field Name | Field Type  | Description |
    | --- | --- | --- |
    | id | Integer | **`Required`** 충전기 ID |
    | connectorId | Integer | 충전기 커넥터 ID |
- **MeterValueType**
    
    
    | Field Name | Field Type  | Description |
    | --- | --- | --- |
    | timestamp | ZonedDateTime | **`Required`** 충전기 ID |
    | sampledValue | SampledValueType | 충전기 커넥터 ID |
- **SampledValueType**
    
    
    | Field Name | Field Type  | Description |
    | --- | --- | --- |
    | value | BigDecimal |  |
    | measurand | MeasurandEnumType | 충전기 커넥터 ID |
    | unitOfMeasure | UnitOfMeasureType |  |
    
    <aside>
    📌 MeasurandEnumType 구분 : 종류는 많으나 아래 코드로 사용한다.
    `Energy.Active.Import.Register`, `Temperature`, `Voltage`, `Current.Import`
    
    </aside>
    

<aside>
📌 TransactionEventEnumType 구분
`Ended`, `Started`, `Updated`

</aside>

<aside>
📌 TriggerReasonEnumType 구분 : 종류는 많으나 아래 코드로 사용한다.
`ChargingStateChanged`

</aside>

<aside>
📌 IdTokenEnumType 구분 : 종류는 많으나 아래 코드로 사용한다.
`Central`

</aside>

#### ⬅️ TransactionEvent.res

| Field Name | Field Type  | Description |
| --- | --- | --- |
| idTokenInfo | IdTokenInfoType | 권한 부여 정보 |
- **IdTokenInfoType**
    
    
    | Field Name | Field Type  | Description |
    | --- | --- | --- |
    | status | AuthorizationStatusEnumType | 중앙 시스템에서 idToken 승인 여부 |
    
    <aside>
    📌 AuthorizationStatusEnumType 구분
    `Accepted`, `Blocked`, `ConcurrentTx`, `Expired`, `Invalid`, `NoCredit`, `NotAllowedTypeEVSE`, `NotAtThisLocation`, `NotAtThisTime`, `UnKnown`
    
    </aside>
    

#### 5-1. 충전 시작

✅ **충전 시작** **시퀀스 플로우입니다.**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/8082eeb9_Untitled.png]]

➡️ **TransactionEvent.req**

```json

[
    2,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    "TransactionEvent",
    {
        "eventType":"Started",
        "timestamp":"2024-05-11T08:17:44.832Z",
        "triggerReason":"ChargingStateChanged",
        "seqNo":1,
        "offline":false,
        "numberOfPhasesUsed":0,
        "cableMaxCurrent":0,
        "reservationId":0,
        "transactionInfo":
            {
                "transactionId":"1234-123124-1asdasd-12332"
            },
        "idToken":
            {
                "idToken":"1019160086931326",
                "type":"Central"
            },
        "evse":
            {
                "id":99999981,
                "connectorId":1
            },
        "meterValue":
	          [
	              {
	                  "timestamp":"2024-05-11T08:17:44.832Z",
	                  "sampledValue":
	                      [
	                          {
	                              "value":0,
	                              "measurand":"EnergyActiveImportRegister",
	                              "unitOfMeasure":
	                                  {
	                                      "unit":"Wh"
	                                  }
	                          }
	                      ]
	              }
	          ]
    }
]
```

➡️ **TransactionEvent.res**

```json
[
    3,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    {
        "idTokenInfo":
            {
                "status":"Accepted"
            }
    }
]
```

#### 5-2. 충전 진행중(OCPP 1.6 MeterValues)

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/80238152_Untitled.png]]

**➡️ TransactionEvent.req**

```json
[
    2,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    "TransactionEvent",
    {
        "eventType":"Updated",
        "timestamp":"2024-05-11T13:32:56.968Z",
        "triggerReason":"ChargingStateChanged",
        "seqNo":1,
        "offline":false,
        "numberOfPhasesUsed":0,
        "cableMaxCurrent":0,
        "reservationId":0,
        "transactionInfo":
            {
                "transactionId":"1234-123124-1asdasd-12332",
                "chargingState":"EVConnected",
                "remoteStartId":1234
            },
            "idToken":
                {
                    "idToken":"1019160086931326",
                    "type":"Central"
                },
            "evse":
                {
                    "id":99999981,
                    "connectorId":1
                }
            ,"meterValue":
                [
                    {
                        "timestamp":"2024-05-11T13:32:56.968Z",
												"sampledValue":
												    [
												        {
												            "value":125,
												            "measurand":"Energy.Active.Import.Register",
												            "unitOfMeasure":
												                {
												                    "unit":"Wh"
												                }
												        },{
												            "value":-119,
												            "measurand":"Temperature",
												            "unitOfMeasure":
												                {
												                    "unit":"Celsius"
												                }
												        },{
												            "value":204,
												            "measurand":"Voltage",
												            "unitOfMeasure":
												                {
												                    "unit":"V"
												                }
												        }, {
												            "value":13,
												            "measurand":"Current.Import",
												            "unitOfMeasure":
												                {
												                    "unit":"A"
												                }
												        }, {
												            "value":61,
												            "measurand":"SoC",
												            "unitOfMeasure":
												                {
												                    "unit":"Percent"
												                }
												        }
												    ]
                    }
                ]
    }
]
```

**➡️ TransactionEvent.res**

```json
[
    3,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    {
        "idTokenInfo":
            {
                "status":"Accepted"
            }
    }
]
```

#### 5-3. 충전 종료

✅ **충전 시작** **시퀀스 플로우입니다.**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/eb1fba01_Untitled.png]]

**➡️ TransactionEvent.req**

```json
[
    2,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    "TransactionEvent",
    {
        "eventType":"Ended",
        "timestamp":"2024-05-11T14:23:52.188Z",
        "triggerReason":"ChargingStateChanged",
        "seqNo":1,
        "offline":false,
        "numberOfPhasesUsed":0,
        "cableMaxCurrent":0,
        "reservationId":0,
        "transactionInfo":
            {
                "transactionId":"1234-123124-1asdasd-12332",
                "chargingState":"EVConnected",
                "remoteStartId":1234
            },
        "idToken":
            {
                "idToken":"1019160086931326",
                "type":"Central"
            },
        "evse":
            {
                "id":99999981,
                "connectorId":1
            },
        "meterValue":
            [
                {
                    "timestamp":"2024-05-11T14:23:52.188Z",
                    "sampledValue":
                        [
                            {
                                "value":230,
                                "measurand":"Energy.Active.Import.Register",
                                "unitOfMeasure":
                                    {
                                        "unit":"Wh"
                                    }
                            }
                        ]
                }
            ]
    }
]
```

<aside>
🗒️ 기존 OCPP 1.6에서 meterStop 값을 OCPP 2.0.1에서 마지막 전력 값으로 사용한다.

</aside>

**➡️ TransactionEvent.res**

```json
[
    3,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    {
        "totalCost":990,
        "chargingPriority":0,
        "idTokenInfo":
            {
                "status":"Accepted",
                "groupIdToken":
                    {
                        "idToken":"P_TAG",
                        "type":"Central"
                    }
            }
    }
]
```

---

### 6. RequestStartTransaction (원격 충전 시작)

✅ **RequestStartTransaction 시퀀스 플로우 입니다.**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/0b9db0b3_Untitled.png]]

#### ➡️ RequestStartTransaction.req

```json
[
    2,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    "RequestStartTransaction",
    {
        "evseId":99999981,
        "remoteStartId":1,
        "idToken":
            {
                "idToken":"ORDER000000000005081",
                "type":"Central"
            }
    }
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| evseId | Integer | **`Required`** 충전기 ID |
| remoteStartId | Integer | 충전기 커넥터 ID |
| idToken | IdTokenType | 권한 인증 식별자를 포함 |

<aside>
🗒️ OCPP 1.6 에서 사용하던 idTag를 OCPP idToken으로 이용합니다.

</aside>

#### ➡️ RequestStartTransaction.res

```json
[
    3,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    {
        "status":"Accepted"
    }
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| status | RequestStartStopStatusEnumType | **`Required`** 충전기 ID |

<aside>
📌 RequestStartStopStatusEnumType 구분
`Accepted`, `Rejected`

</aside>

### 7. RequestStopTransaction (원격 충전 중지)

✅ **RequestStopTransaction 시퀀스 플로우 입니다.**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/d79ea3c1_Untitled.png]]

#### ➡️ RequestStopTransaction**.req**

```json
[
    2,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    "RequestStopTransaction",
    {
        "transactionId":"006b3077-7ad8-441e-b69c-ab7c8a7da04f"
    }
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| transactionId | String[0..36] | **`Required`** 실시간 충전 ID |

#### ⬅️ RequestStopTransaction**.res**

```json
[
    3,
    "006b3077-7ad8-441e-b69c-ab7c8a7da04f",
    {
        "status":"Accepted"
    }
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| status | RequestStartStopStatusEnumType | **`Required`** 거래 시작 요청 성공 여부 |

### 8. HeartBeat (하트 비트)

✅ OCPP 1.6과 동일한 필드로 구성된 메세지입니다. 항상 현재 시간을 포함한 응답을 합니다.

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/2177c41e_Untitled.png]]

### 9. StatusNotification (충전기 상태)

**✅ StatusNotification 시퀀스 플로우입니다.**

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/OCPP 2.0.1 설계 문서/첨부/0ec72d63_Untitled.png]]

#### ➡️ **StatusNotification.req**

```json
[
    2,
    "8d8e1ab6-35d6-495d-89ce-785f70022cad",
    "StatusNotification",
    {
        "dateTime":"2024-05-24T01:07:50.868Z",
        "evseId":99999981,
        "connectorId":1,
        "connectorStatus":"Occupied"
    }
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| dateTime | ZonedDateTime | **`Required`** 상태 보고 시간 |
| evseId | Integer | **`Required`** 충전기 ID |
| connectorId | Integer | **`Required`** 상태가 보고되는 커넥터의 Id. '0'값일 경우 충전기의 main controller가 사용 |
| connectorStatus | ConnectorStatusEnumType | **`Required`** 충전기의 현재 상태 |

#### ⬅️ **StatusNotification.res**

```json
[
    3,
    "8d8e1ab6-35d6-495d-89ce-785f70022cad",
    {}
]
```

---

### 10. DataTransfer 데이터 전송

<aside>
🗒️ DataTransfer는 OCPP 1.6과 동일한 흐름을 가지고 있으며, 달라진 부분은 없습니다.

</aside>

---

### 11. FirmwareManagement (펌웨어트 관리)

✅ FirmwareUpdate 시퀀스 플로우 입니다. 인증서 서명없이 진행하며, OCPP 1.6과 동일한 흐름을 가지고 있습니다.

#### ➡️ UpdateFirmware.req

```json
[
    2,
    "8d8e1ab6-35d6-495d-89ce-785f70022cad",
    "StatusNotification",
    {
        "retries":3,
        "retryInterval":10,
        "requestId":99999981,
        "firmwareType":
            {
                "location":"ftp://ftpuser:!aaa111222@112.219.38.5:41001/ftp/upload/2024/05/09/ezic7k_fota_24042901.zip",
                "retrieveDateTime":"2024-05-17T00:35:38.50620731"
            }
    }
]
```

| Field Name | Field Type  | Description |
| --- | --- | --- |
| dateTime | ZonedDateTime | **`Required`** 상태 보고 시간 |
| evseId | Integer | **`Required`** 충전기 ID |
| connectorId | Integer | **`Required`** 상태가 보고되는 커넥터의 Id. '0'값일 경우 충전기의 main controller가 사용 |
| connectorStatus | ConnectorStatusEnumType | **`Required`** 충전기의 현재 상태 |

#### ⬅️ UpdateFirmware.res

```json
[ 
    3,
    "8d8e1ab6-35d6-495d-89ce-785f70022cad"
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
| status | FirmwareStatusEnumType | `Required` 업데이트 상태 |

<aside>
📌 FirmwareStatusEnumType 구분 : 종류는 많으나 아래 코드로 사용한다.
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

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
