---
별칭:
  - "업무 - Python 커넥션"
tags:
  - type/work-doc
  - context/work
  - theme/dev
  - status/completed
  - domain/도구-기타
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
노션원본: https://www.notion.so/0f6582da07c24fa48e210c35df9341a1
주제:
  - "[[00 - 대시보드/주제/Python|Python]]"
  - "[[00 - 대시보드/주제/Redis|Redis]]"
  - "[[00 - 대시보드/주제/개발 도구|개발 도구]]"
---

# 업무: Python 커넥션

## 내용

---

최종 변경 : 2023.07.27

---

[Python guide](https://redis.io/docs/clients/python/)

---

#### Python redis 모듈

- 모듈 설치
    
```bash
//pip3 
pip3 install redis

//pip
pip install redis

//python 특정 버전을 명시하여 설치
python3.11 -m pip install redis
```


---

#### redis 모듈 불러오기 및 객체 생성

```python
import redis

redisConnect = redis.Redis(host='레디스서버아이피', port=6379, decode_responses=True, password="비밀번호", db=데이터베이스번호)
```

Redis 클래스의 생성자 파라미터 설명

- host : 레디스 서버 IP 주소
- port : 레디스 서버 포트 번호
- decode_response : 설정한 encode 옵션으로 decode하여 결과 출력
- username : 사용자 아이디 (생략시 default)
- password : 레디스 서버 비밀번호 (비밀번호 미설정시 생략가능)
- db : 레디스 database 번호 (생략시 0번 인덱스)
- ssl : ssl 설정 가능 (ssl=True)
- ssl_certfile
- ssl_keyfile
- ssl_ca_certs

---

#### 메소드

```python
#레디스 모듈 불러오기
import redis

#레디스 접속 및 커넥션 객체 생성
redisConnect = redis.Redis(host='아이피', port=6379, decode_responses=True, password="비밀번호")

##############################################################################################

#String set
redisConnect.set("2", "lee")
redisConnect.set("3", "jeong")
redisConnect.set("4", "ahn")

#set with expire
redisConnect.expire("3", 100)

#String get
temp = redisConnect.get("2")
print(temp)
#존재하지 않는 경우 None 출력

#String del
redisConnect.delete("4")

#scan
temp = redisConnect.scan("0")
print(temp)

#keys
temp = redisConnect.keys("*")
print(temp)
```

자세한 사항은 공식 Docs 참조

---

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/레디스/레디스|레디스]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
