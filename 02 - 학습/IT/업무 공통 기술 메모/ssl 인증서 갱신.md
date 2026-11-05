---
별칭:
  - "학습 - ssl 인증서 갱신"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/인프라
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/13724612498b80baa4d7e35e8a653d6c
주제:
  - "[[00 - 대시보드/주제/서버·인프라|서버·인프라]]"
  - "[[00 - 대시보드/주제/보안|보안]]"
---

# 학습: ssl 인증서 갱신

## 세부 내용

- 테스트 명령어
    - `/etc/letsencrypt` : 해당 경로에서 아래 명령어를 쳐야함

```bash
$ sudo certbot renew --dry-run
```

- webroot로 원하는 도메인으로 할 때

```bash
$ sudo certbot certonly --dry-run --webroot -w /var/www/letsencrypt -d web.any-ev.com
```

- 인증서 목록, 만료일 확인

```bash
$ sudo certbot certificates

##
  /etc/letsencrypt/renewal/ci.almondpet.com.conf
  /etc/letsencrypt/renewal/cp.any-ev.com.conf
  /etc/letsencrypt/renewal/git.almondpet.com-0001.conf
  /etc/letsencrypt/renewal/git.almondpet.com.conf
  /etc/letsencrypt/renewal/git.awasoft.co.kr.conf
  /etc/letsencrypt/renewal/lab.awasoft.co.kr.conf
  /etc/letsencrypt/renewal/maria.any-ev.com.conf
  /etc/letsencrypt/renewal/www.any-ev.com.conf

```

```jsx
sudo systemctl stop nginx
sudo systemctl start nginx
sudo service nginx status
```

[만료된 SSL 인증서 갱신하기](https://blog.pium.life/update-ssl/)

[SSL(https) 설정 및 갱신 (Let’s Encrypt) - apache](https://sjwiq200.tistory.com/2)

## 관련 노트

- 상위: [[02 - 학습/IT/업무 공통 기술 메모/공통 기술 메모 (Spring·타임리프·DB·SSL 등)|공통 기술 메모 (Spring·타임리프·DB·SSL 등)]]
