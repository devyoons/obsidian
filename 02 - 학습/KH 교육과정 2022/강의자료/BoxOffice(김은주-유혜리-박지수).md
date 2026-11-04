---
별칭:
  - "학습 - BoxOffice(김은주-유혜리-박지수)"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/f7e192df7cd1453a9c114e2498f873cf
---

# 학습: BoxOffice(김은주-유혜리-박지수)

## 세부 내용

## 주제-영화 예매 프로그램

[https://www.youtube.com/watch?v=E566SCJHCV4](https://www.youtube.com/watch?v=E566SCJHCV4)

- 회원관리 (유혜리 팀원)
    - 회원가입
        - 아이디, 비밀번호, 연령
    - 로그인
        - 아이디, 비밀번호 일치 확인
- 영화예매 (박지수, 김은주 팀원)
    - 예매할 영화 선택 → 상영 회차 선택 → 관람 인원 → 결제
        - 결제방법, 상영중인 영화, 성인 비성인 구분까지 코드
            - 성인/비성인 관람 구분
                
                ```java
                Anum = Integer.parseInt(JOptionPane.showInputDialog("성인 인원 수를 입력해 주세요."));
                Tnum = Integer.parseInt(JOptionPane.showInputDialog("청소년 인원 수를 입력해 주세요."));
                ```
                
            - 상영중인 영화
                1. 더 배트맨
                2. 이상한 나라의 수학자
                3. 언차티드
                4. 블랙라이트
                5. 스파이더맨 노웨이홈
            - 결제방법 (카드/현금) 선택
                
                ```java
                choice = Integer.parseInt(JOptionPane.showInputDialog("결제 하실 금액은 총 " + pay_price + "원 입니다.  \n"
                						+ "지불 방식을 선택하세요 \n"
                						+ "1. 카드 2. 현금")); 
                				
                					if(choice == 1) {
                						JOptionPane.showMessageDialog(null, pay_price + " 원 결제 완료 되었습니다. \n 즐거운 관람되세요"); 
                						break;
                					}
                					else if(choice == 2) {
                						
                						while(true) {
                							customer_money= Integer.parseInt(JOptionPane.showInputDialog("총 금액은 " + pay_price +" 원 입니다."));
                							if(customer_money < pay_price) {
                								JOptionPane.showMessageDialog(null, "금액이 부족합니다. 다시 결제 해주세요."); 
                								continue;
                							}
                							else {
                								customer_money -= pay_price;
                								JOptionPane.showMessageDialog(null, "결제 완료되었습니다. \n 잔액은 " +customer_money + " 원 입니다. \n"
                										+ "즐거운 관람 되세요"); 
                								break;
                							}
                						} break; // 현금 결제 완료후 탈출
                ```
                
            
            [[02 - 학습/KH 교육과정 2022/강의자료/첨부/payment_부분.zip|payment 부분.zip]]
            
        - 영화 별 상영회차
        - 예매취소
    - 예매내역확인(출력)
- 매점
    - 간식, 음료

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/강의자료/KH 강의자료 (PDF)|KH 강의자료 (PDF)]]
