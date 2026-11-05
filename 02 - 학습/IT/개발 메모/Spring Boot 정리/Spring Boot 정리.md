---
별칭:
  - "학습 - Spring Boot 정리"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/백엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/19512d5d383d41adaeaec32b98c4fbf8
주제:
  - "[[00 - 대시보드/주제/Spring|Spring]]"
---

# 학습: Spring Boot 정리

## 세부 내용

환경설정

![[02 - 학습/IT/개발 메모/Spring Boot 정리/첨부/0590a668_Untitled.png]]

- `@ResponseBody` 를 사용
    - HTTP의 BODY에 문자 내용을 직접 반환
    - `viewResolver` 대신에 `HttpMessageConverter` 가 동작
    - 기본 문자처리: `StringHttpMessageConverter`
    - 기본 객체처리: `MappingJackson2HttpMessageConverter`
    - byte 처리 등등 기타 여러 HttpMessageConverter가 기본으로 등록되어 있음
    
     
    
    > 참고: 클라이언트의 HTTP Accept 해더와 서버의 컨트롤러 반환 타입 정보 둘을 조합해서
    HttpMessageConverter 가 선택된다.
    > 

Spring Boot 3.x

## 하위 노트


## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
