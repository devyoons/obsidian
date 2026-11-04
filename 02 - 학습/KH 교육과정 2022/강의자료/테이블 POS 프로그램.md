---
별칭:
  - "학습 - 테이블 POS 프로그램"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/ebbc7b3eb14a46ed89565961db618310
---

# 학습: 테이블 POS 프로그램

## 세부 내용

**팀 명 : 공부 많이 한 팀**

**팀 원 : 김동률, 이보미, 정서영**

[https://youtu.be/VZUlAYy7kfE](https://youtu.be/VZUlAYy7kfE)

[[02 - 학습/KH 교육과정 2022/강의자료/첨부/TablePOS.zip|TablePOS.zip]]

**프로젝트 설명**
테이블마다 태블릿pc를 두어 직원을 호출하지 않고도 주문하거나 요청할 수 있는 기능

**프로젝트 특징**
 - 소켓 통신을 사용
 - 객체 직렬화를 통한 객체 전송
 - 다양한 컬렉션 사용

**프로젝트 마인드맵**
서버
 1. POS (class ShowMenu)
  - 전체 테이블의 주문 확인 (selectAllOrder)
  - 테이블별 주문 확인 (selectOrderByTable)
  - 추가 주문 내역 (selectAddOrder)
  - 총 매출 금액 보기 (getTotalSales)

 2. GetMessage (class GetOrder)
  - 클라이언트로 전송된 주문 리스트 받아 저장

클라이언트
 1. 메뉴 선택하기
  - 파스타, 피자, 리조또, 음료 (Order 객체 상속)
  - 메뉴 이름 (menuName)
  - 메뉴 가격 (price)
  - 맵기 정도 (spicy)
  - 메뉴 번호 (menuNum)

 2. 추가 주문 확인 (printAddMenu)
  - 방금 추가한 주문내역 출력하기

 3. 테이블의 총 주문 내역 보기 (checkMenu)
  - 중간 계산서 출력하기

 4. 추가 주문 전송하기 (sendOrder)
  - 서버로 주문 내역 전송하기

 5. 채팅 요청하기 (x)
  - 서버로 채팅 요청하기

 6. 끝내기

기타 질의나 의견은 단톡 위주로 진행하며, 자세한 내용은 유동적으로 디코 활용 예정

- **220303 회의록**
    - 주제선정
        - 채팅 프로그램
            
            서버를 하나두고 클라이언트가 2명 접속하는 형식
            
            1. 주문 → ‘요청하기’ 를 이용하여 채팅 기능을 넣을 것인지
            2. 포스기 → 카페, 편의점 등등 / DB 부분은 자체 해결할 것인지
        - 서치프로그램
            
            서버를 두고 단어에 대한 것을 입력하면 뜻을 출력
            
        - 커피 자판기
        - 행맨게임

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/강의자료/KH 강의자료 (PDF)|KH 강의자료 (PDF)]]
