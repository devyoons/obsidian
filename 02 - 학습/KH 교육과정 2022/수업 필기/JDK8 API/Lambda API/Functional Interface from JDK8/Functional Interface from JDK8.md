---
별칭:
  - "강의 - Functional Interface from JDK8"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/aa77b64500a34984bb0c65ef08da5714
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: Functional Interface from JDK8

## 강의 내용

> (노션 원본에 본문 없음)

## 데이터베이스: Functional Interface from JDK8

| Name | Method Name | Parameter | Return Type |
|---|---|---|---|
| java.util.function.Supplier<R> | get():R | 없음 | R |
| java.util.function.BiConsumer<T,U> | accept(T, U):void | T,U | void |
| java.util.function.BiFunction<T, U, R> | apply(T, U):R | T,U | R |
| java.util.function.Consumer<T> | accept(P):void | T | void |
| java.lang.Runnable | run():void | 없음 | void |
| java.util.function.BiPredicate<T, U> | test(T,U):boolean | T,U | boolean |
| java.util.function.Function<T,R> | apply(T):R | T | R |
| java.util.function.Predicate<T> | test(T):boolean | T | boolean |

## 하위 노트


## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JDK8 API/Lambda API/Lambda API|Lambda API]]
