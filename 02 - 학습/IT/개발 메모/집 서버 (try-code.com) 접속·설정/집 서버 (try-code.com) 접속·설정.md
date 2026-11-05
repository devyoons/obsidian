---
별칭:
  - "학습 - 집 서버 (try-code.com) 접속·설정"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/인프라
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/6849ecba7070415f9819431225538cc5
주제:
  - "[[00 - 대시보드/주제/서버·인프라|서버·인프라]]"
---

# 학습: 집 서버 (try-code.com) 접속·설정

## 세부 내용

ssh [yoon@110.9.24.96](mailto:yoon@110.9.24.96) -p 20022
Xksekswl!

[[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/nginx|nginx]]

[[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/도커 설치|docker]]

[[02 - 학습/IT/개발 메모/집 서버 (try-code.com) 접속·설정/gitlab|gitlab]]

[[02 - 학습/IT/개발 메모/집 서버 (try-code.com) 접속·설정/jenkins|jenkins]]

```bash
# 443번 포트에서 백엔드로 요청 프록시 처리
server {
    listen 443 ssl; # managed by Certbot
    server_name try-code.com www.try-code.com;

    access_log /var/log/nginx/try-code.com/access.log;
    error_log /var/log/nginx/try-code.com/error.log;

    location / {
        proxy_pass http://localhost:9103;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    ssl_certificate /etc/letsencrypt/live/try-code.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/try-code.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

```

[[02 - 학습/IT/개발 메모/집 서버 (try-code.com) 접속·설정/nexus|nexus]]

```bash
[gitlab]
git.try-code.com
------------------------
id : root
pw : codedev!

id : jenkins
pw : codedev!

id : dev1
pw : codedev!
------------------------

[jenkins]
ci.try-code.com
-----------------------
id : admin
pw : admin

[nexus]
repo.try-code.com
-----------------------
id : admin
pw : admin
```

## 하위 노트

- [[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/도커 설치|docker]]
- [[02 - 학습/IT/개발 메모/집 서버 (try-code.com) 접속·설정/gitlab|gitlab]]
- [[02 - 학습/IT/개발 메모/집 서버 (try-code.com) 접속·설정/jenkins|jenkins]]
- [[02 - 학습/IT/개발 메모/집 서버 (try-code.com) 접속·설정/nexus|nexus]]
- [[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/nginx|nginx]]

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
