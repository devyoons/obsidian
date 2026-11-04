---
별칭:
  - "학습 - Nginx"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 2024-12-18
수정일: 2026-11-04
"노션생성일": "December 18, 2024 11:50 PM"
노션원본: https://www.notion.so/16024612498b810cbe42cee4394b91b9
---

# 학습: Nginx

## 세부 내용

### Setup

```css
apt install nginx
```

### Setting

<aside>
💡 세팅파일은 `sudo find / -name nginx.conf` 을 통해서 찾을 수 있음

</aside>

```bash
& nano /etc/nginx/sites-available/default
...
& service nginx reload
```

```json
//프록시
server {
        listen 80;
        listen [::]:80;

        server_name 도메인;

        location / {
                proxy_pass http://localhost:3000/;
        }
}
```

```sql
//SPA (React, etc..)
// 수정 필요
server {
        listen 80;
        listen [::]:80;
        server_name 도메인;
        ssl off;
        root /var/www/위치;
        index index.html;

        location / {
                try_files $uri $uri/ =404;
        }

}
```

```sql
server {
        listen 80;
        listen [::]:80;
        server_name 도메인;
        ssl off;
        root /var/www/위치;
        index index.html;

        location / {
                try_files $uri $uri/ =404;
        }

}
```

## 관련 노트

- 상위: [[02 - 학습/IT/공부기록/그 외/그 외|그 외]]
