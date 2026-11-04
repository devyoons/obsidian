---
별칭:
  - "업무 - ocpp 1.6"
태그:
  - type/work-doc
  - context/work
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
노션원본: https://www.notion.so/4a62d639c5854a768b806edef744434a
---

# 업무: ocpp 1.6

## 내용

---

---

#### 1. 앱 결제 APPPayment

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/ocpp/첨부/b35eeabc_Untitled.png]]

1. 사용자가 앱을 통해 API로 `RemoteStartTransactionRequest`를 WS(웹소켓)으로 요청을 보낸다.
2. WS는 API로부터 받은 요청을 CS(충전기)로 요청을 보낸다.
    - idTag : 주문 ID
    - connectorId : 충전기 커넥터 번호 - 인증과 트랜잭션을 위해 충전기가 사용해야 할 식별자
3. CS(충전기)는 충전 시작에 대한 응답을 준다. 
    - status : 충전기가 트랜잭션 시작 요청을 수락하는지의 여부
        - 승인 - Accepted
        - 거절 - Reject

ws - RemoteStartTransactionV16Handler.java

```java
public class RemoteStartTransactionV16Handler implements FromCSMSMessageProcessor<RemoteStartTransactionRequest, RemoteStartTransactionResponse>{
    protected final MessageSender sender;
    protected final ResultMessageHistoryRedisService resultMessageHistory;
    @Override
    public RemoteStartTransactionResponse sendMessage(RemoteStartTransactionRequest remoteStartTransactionRequest, ChargePointEntity chargePoint) throws ExecutionException, InterruptedException {
        Executor executor = Executors.newSingleThreadExecutor();
        CompletableFuture<RemoteStartTransactionResponse> infos= CompletableFuture.supplyAsync(()->{
            return sender.sendRequest(remoteStartTransactionRequest,chargePoint.getChargePointManagementId());
        },executor).thenApply(messageId ->{
            try{
                Thread.sleep(3000);
                return  (RemoteStartTransactionResponse) resultMessageHistory.getResultMessageWithId(messageId.getUniqueId());
            } catch (InterruptedException | RuntimeException e) {
                log.error("rawMessage "+"SetChargingProfileResponse ::{}",e.getMessage());
                e.printStackTrace();
                return new RemoteStartTransactionResponse(RemoteStartStopStatus.Rejected);
            }
        });
        return infos.get();
    }
}
```

- 위 코드는 비동기 방식으로 request를 보내고, 해당 요청에 대한 응답을 받아온다.
- `CompletableFuture.supplyAsync()`를 사용하여 비동기 작업을 생성합니다.
- `sendRequest()` 메서드는 remoteStartTransactionRequest를 보내고, 해당 메시지에 대한 고유한 ID를 반환합니다.
- `thenApply()` 메서드를 사용하여 비동기 작업이 완료되면 해당 결과를 처리합니다.
- `resultMessageHistory.getResultMessageWithId()` 메서드를 사용하여 메시지 ID에 해당하는 응답 메시지를 가져옵니다.
- 가져온 응답 메시지를 `RemoteStartTransactionResponse`로 변환하여 반환합니다.
- `infos.get()`을 호출하여 CompletableFuture가 완료될 때까지 대기합니다.
- 최종적으로 비동기 작업의 결과인 RemoteStartTransactionResponse를 반환합니다.
- 3초인 이유는 redis에 요청해서 저장되어있는 id를 받아오기 위함

ws - MessageSender.java

```java
public RequestHistoryEntity sendRequest(Request request, String chargePointManagementId){
    try {
    String uuid = Generators.timeBasedGenerator().generate().toString();
    String action = Request.getActionType(request);
    String sessionId = chargePointManagerService.findById(chargePointManagementId).getSessionId();
    WebSocketSession session = sessionRepository.getSessions().get(sessionId);
    CallMessage callMessage = CallMessage.builder()
            .uniqueId(uuid)
            .action(action)
            .payload(request)
            .build();

    RequestHistoryEntity entity = requestRepository.addRequest(uuid,request);
        String message = serializer.serialize(callMessage);
        log.debug("rawMessage "+"Request Message::{}",message);
        session.sendMessage(new TextMessage(message));
        return entity;
    } catch (ExecutionControl.NotImplementedException | IOException e) {
        log.error("rawMessage "+"SEND_REQUEST ERROR : ");
        log.error("rawMessage "+e.getMessage());
        throw new RuntimeException(e);
    }
}
```

<aside>
💡 이 코드는 요청을 전송하고 해당 요청에 대한 히스토리를 추적하는 데 사용됩니다. 
요청이 성공적으로 전송되면 히스토리 엔티티가 생성되고, 해당 엔티티는 나중에 요청 상태를 추적하거나 재전송 등의 작업에 사용될 수 있습니다.

</aside>

- `Generators.timeBasedGenerator().generate().toString()` 를 사용하여 고유한 UUID를 생성
- `Request.getActionType(request)` 를 통해 요청 객체에서 액션 타입을 가져옵니다.
- `chargePointManagementId` 를 사용하여 해당 충전소 관리 서비스(chargePointManagerService)에서 세션 ID를 검색한다.
- 세션 ID를 사용하여 WebSocket 세션을 가져옵니다.
- CallMessage객체를 생성하고, 이 객체에 UUID, 액션, 요청 페이로드를 설정합니다.
- 요청 페이로드와 UUID를 사용하여 요청 히스토리 엔티티를 생성하고, 저장소에 추가합니다.
- `serializer.serialize(callMessage)` 를 사용하여 메시지를 직렬화합니다.
- WebSocket 세션을 통해 직렬화된 메세지를 전송합니다.
- 요청 히스토리 엔티티를 반환합니다.

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/ocpp/ocpp|ocpp]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
