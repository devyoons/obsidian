---
별칭:
  - "학습 - 새로운 nginx"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/90ae634efdc24854a9aaab0d06d5a35a
---

# 학습: 새로운 nginx

## 세부 내용

1. 설치 명령어 

```bash
$ sudo apt update
$ sudo apt install nginx
```

1. 현재 내 IP 확인 후 IP주소에 접속해 설치확인
    - 확인한 결과 내부망으로 다른 PC에서 확인하려고하면 안보임

```bash
# 우분투에서 내 IP 확인하는 명령어
$ ip addr
```

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/a315aae6_image.png]]

1. 도메인 연동
    - 가비아 - 레코드 설정
        - My가비아 > DNS 관리툴 > 설정 > 레코드 수정
        - Web Server가 설치된 인스턴스 IP로 레코드 등록

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/c1d9c915_image.png]]

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/57144d05_image.png]]

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/4ea62f6a_image.png]]

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/cf391e20_image.png]]

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/5671ef94_image.png]]

1. 폴더 및 테스트 사이트 설정하기
- 기존에 `/etc/nginx/sites-avaliable/default` 파일을 확인해보면 nginx 기본 html 경로를 확인할 수 있다.
    - 위 경로에 없으면  `/etc/nginx/conf.d` 에  있을거임
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/9caa064b_image.png]]
    

- 서브도메인 연결 확인을 위한 디렉토리와 html을 만들어준다.

```bash
# conf 파일 생성
user1@gggg:/etc/nginx/sites-available$ ls
ci.tandanji.com.conf  default  git.tandanji.con.conf  repo.tandanji.com.conf

# html 파일 생성 (디렉토리안에 각 도메인별로 html을 분리함)
user1@gggg:/etc/nginx$ cd /var/www/html
user1@gggg:/var/www/html$ ls
ci  git  index.nginx-debian.html  repo

```

- sample html 내용
    - 파일명은 index.html 로 통일해야한다. 그래야 conf 파일에서 해당 경로 안에 html을 자동으로 찾아준다.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>git</title>
</head>
<body>
    <h1>git</h1>
</body>
</html>
```

1. 서브 도메인별 conf 파일 작성

```bash
server {
   listen 80;
   listen [::]:80;

    # virtual server name i.e. domain name #
    server_name {서브도메인};

    # document root #
    root        /var/www/html/{생성한폴더명};

    # log files
    access_log  /var/log/nginx/www_access.log;
    error_log   /var/log/nginx/www_error.log;

    # Directives to send expires headers and turn off 404 error logging. #
    location ~* ^.+\.(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|rss|atom|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$ {
        access_log off; log_not_found off; expires max;
    }
}

# 예시
server {
   listen 80;
   listen [::]:80;

    # virtual server name i.e. domain name #
    server_name git.tandanji.com;

    # document root #
    root        /var/www/html/git;

    # log files
    access_log  /var/log/nginx/www_access.log;
    error_log   /var/log/nginx/www_error.log;

    # Directives to send expires headers and turn off 404 error logging. #
    location ~* ^.+\.(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|rss|atom|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$ {
        access_log off; log_not_found off; expires max;
    }
}
```

1. 심볼릭 링크 생성

```bash
$ sudo ln -s /etc/nginx/sites-available/{위에서 생성한 파일명} /etc/nginx/sites-enabled/{위에서 생성한 파일명}

# 예제
$ sudo ln -s /etc/nginx/sites-available/git.tandanji.com /etc/nginx/sites-enabled/git.tandanji.com
```

- 심볼릭 링크를 확인하기 위한 명령어

```bash
$ readlink /etc/nginx/sites-enabled/{확인할 파일명}
```

1. nginx 재시작

```bash
$ systemctl restart nginx
```

1. 같은 내부망에 있는 서버pc말고 다른 pc에서 안나올때

```bash
# Ping으로 서버 IP 확인
$ ping {서브도메인}

# nslookup으로 도메인 해석 확인
$ nslookup {서브도메인}

```

1. ssl 인증서 발급
- certbot 설치
    - Ubuntu 18.04 이하: python-certbot-nginx 설치
    - Ubuntu 18.04 이상: python**3**certbot-nginx 설치

```bash
$ apt-get update
$ sudo apt-get install certbot
$ apt-get install python3-certbot-nginx
```

- **SSL/TLS 인증서 발급**
    - d 도메인을 나열해 여러 도메인에 대해 인증서 발급 가능
    - 해당 명령어 실행 후 아까 추가했던 설정 파일(/etc/nginx/sites-available/도메인명)을 보면 `# managed by Certbot` 주석이 달린 코드들이 추가된 것을 볼 수 있음

```bash
$ sudo certbot --nginx -d 도메인
$ sudo certbot --nginx -d 도메인 -d 서브도메인2 -d 서브도메인3

# 예시
$ sudo certbot --nginx -d git.tandanji.com
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Certificate not yet due for renewal

You have an existing certificate that has exactly the same domains or certificate name you requested and isn't close to expiry.
(ref: /etc/letsencrypt/renewal/git.tandanji.com.conf)

What would you like to do?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: Attempt to reinstall this existing certificate
2: Renew & replace the certificate (may be subject to CA rate limits)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 1
Deploying certificate
Successfully deployed certificate for git.tandanji.com to /etc/nginx/sites-enabled/git.tandanji.con.conf
Congratulations! You have successfully enabled HTTPS on https://git.tandanji.com

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
If you like Certbot, please consider supporting our work by:
 * Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
 * Donating to EFF:                    https://eff.org/donate-le
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```

- # managed by Certbot 주석달린 부분은 certbot 에서 달아줌

```bash
server {

    # virtual server name i.e. domain name #
    server_name git.tandanji.com;

    # document root #
    root        /var/www/html/git;

    # log files
    access_log  /var/log/nginx/www_access.log;
    error_log   /var/log/nginx/www_error.log;

    location / {
        proxy_pass http://localhost:51080;
        #proxy_set_header   Host $host;
        #proxy_set_header   X-Real-IP $remote_addr;
        #proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
        #proxy_set_header X-Forwarded-Proto $scheme;

    }

    # Directives to send expires headers and turn off 404 error logging. #
    location ~* ^.+\.(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|rss|atom|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$ {
        access_log off; log_not_found off; expires max;
    }

    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/git.tandanji.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/git.tandanji.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
    if ($host = git.tandanji.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

   listen 80;
   listen [::]:80;
    server_name git.tandanji.com;
    return 404; # managed by Certbot

}
```

#### 웹사이트 비활성화하기

하나의 웹사이트를 일시적으로 중지하여 작업을 하고 다시 사용하려면, sites-enabled에서 심볼릭 링크를 삭제하기만 하면 됩니다

```bash
$ rm /etc/nginx/sites-enabled/test.server.site1.conf
```

그런 다음 일반적으로 Nginx를 재시작하세요. 사이트를 다시 온라인으로 전환하려면 심볼릭 링크를 다시 생성하고 Nginx를 다시 시작해야 합니다.

#### 참고사이트

[Nginx 다중 사이트 - Documentation](https://docs.rockylinux.org/ko/guides/web/nginx-multisite/#_5)

[GitLab+Docker+Nginx+ReverseProxy 환경 container registry](https://devblog.lazyig.com/107/)

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/개발서버 구축 가이드 (WAS·Docker·Nginx)|개발서버 구축 가이드 (WAS·Docker·Nginx)]]
