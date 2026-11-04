---
별칭:
  - "학습 - ORA-01502 :  인덱스 분할 영역 'INDEX_NAME'은 사용할 수 없는 상태입니다."
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/b2cf5ca9db53468da5ef1cfce9349307
---

# 학습: ORA-01502 :  인덱스 분할 영역 'INDEX_NAME'은 사용할 수 없는 상태입니다.

## 세부 내용

[각 DB별 테이블 인덱스 정보 확인하는 쿼리](https://datalibrary.tistory.com/123)

[ORA-01502 (인덱스 분할 영역은 사용할 수 없은 상태입니다) 해결 방법](https://dorothy67.tistory.com/entry/ORA-01502-%EC%9D%B8%EB%8D%B1%EC%8A%A4-%EB%B6%84%ED%95%A0-%EC%98%81%EC%97%AD%EC%9D%80-%EC%82%AC%EC%9A%A9%ED%95%A0-%EC%88%98-%EC%97%86%EC%9D%80-%EC%83%81%ED%83%9C%EC%9E%85%EB%8B%88%EB%8B%A4-%ED%95%B4%EA%B2%B0-%EB%B0%A9%EB%B2%95)

- 인덱스 명 조회

```sql
SELECT Table_name
, Index_name
, Column_name
, Column_position
--, * 
FROM SYS.ALL_IND_COLUMNS
WHERE TABLE_NAME = 'T_AFMF_TNRM_INSR01M1' [테이블]
AND TABLE_OWNER = 'TER_MAIN'; [스키마]
```

```sql
ALTER INDEX 인덱스명 REBUILD; 혹은

ALTER INDEX 인덱스명 REBUILD PARTITION 파티션명;
```

## 관련 노트

- 상위: [[02 - 학습/IT/업무 공통 기술 메모/잡동사니/잡동사니|잡동사니]]
