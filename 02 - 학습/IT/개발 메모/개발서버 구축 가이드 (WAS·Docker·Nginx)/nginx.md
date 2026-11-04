---
별칭:
  - "학습 - nginx"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/62e08741948549758383d82128282e33
---

# 학습: nginx

## 세부 내용

[Nginx란 무엇인가?](https://blog.naver.com/gi_balja/223028077537)

[Ubuntu 22.04에 Nginx 설치하기](https://yoonnyoon.tistory.com/220)

[가비아 + Linux + Nginx + Cerbot/SSL을 활용한 https 설정](https://dkswnkk.tistory.com/675)

설치 환경 - ubuntu jammy 22.04

1. 설치 명령어 실행
    
    ```bash
    $ sudo apt update
    $ sudo apt install nginx
    ```
    
- 명령어 결과
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/스크린샷_2024-09-07_23-02-22.png]]
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/스크린샷_2024-09-07_23-02-42.png]]
    

1. 현재 내 IP 확인 후 IP 주소에 접속해 설치 확인
    
    ```bash
    # 우분투에서 내 IP 확인하는 명령어
    $ ip addr
    ```
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/스크린샷_2024-09-07_23-04-14.png]]
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/a315aae6_image.png]]
    

1. 도메인 연동

가비아 - 레코드 설정

- My가비아 > DNS 관리툴 > 설정 > 레코드 수정
- Web Server가 설치된 인스턴스 IP로 레코드 등록

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/4c0eb481_image.png]]

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/f8e0df50_image.png]]

- 현재 EV 전기차 기준으로 sub 도메인 설정
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/382096db_image.png]]
    
- 타입에 따른 DNS 설정
    - A 레코드 (서브 도메인 생성)
        - A 레코드를 추가하면 서브 도메인을 생성하여 IP로 사이트를 연결하실 수 있습니다.
        - 예) test.gabia.com 생성을 원하시면, 호스트명에 test를 입력하시고 연결하시려는 사이트의 ip주소를 입력해 주세요.
    - MX 레코드(메일 설정)
        - MX 레코드는 메일 연결에 사용됩니다. 입력된 정보를 변경/삭제할 경우 해당 서비스 사용이 변경/중단될 수 있으니, 설정한 메일 정보를 반드시 확인하세요.
        - MX 설정 시 메일 호스트 주소 입력 내용 끝에 ".(마침표)"를 입력하셔야 정상 세팅 됩니다.
        - 예) kr1-aspmx1.worksmobile.com.
    - CNAME 레코드
        - CNAME 정보는 메일, 블로그 연결 등에 사용됩니다. 입력된 정보를 변경/삭제할 경우 해당 서비스 사용이 변경/중단될 수 있으니, 설정한 메일 정보를 반드시 확인하세요.
        - 한글 도메인은 사용 업체에 따라 CNAME을 설정하더라도 메일을 지원하지 않을 수 있습니다.
    - TXT 레코드
        - SPF 레코드를 입력하고자 하는 경우 위 TXT 레코드란에 입력해 주세요.
        - 사용하는 도메인이 스팸으로 차단되는 것을 방지하기 위하여 SPF 레코드 등록을 권장합니다.
    - SRV 레코드
        - ※ SRV 레코드 설정 시, 대상 값 입력 내용 끝에 "."을 입력하셔야 정상 세팅됩니다.
        - 예) sipdir.online.lync.com.

4. nginx - /etc/nginx/sites-available에 설정 파일 생성

- nginx 설정 파일은 /etc/conf/nginx.conf에 존재
- 해당 설정 파일에서는 /etc/nginx/sites-enabled의 파일들을 include함
- sites-enabled의 파일들은 sites-available의 파일들을 심볼릭 링크한 것

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/71b58595_image.png]]

설정 파일 생성

```bash
설정 파일 생성

$ sudo vi /etc/nginx/sites-available/도메인명

# 예제: sudo vi /etc/nginx/sites-available/try-code.com
```

설정 파일 내용

```bash
server {
	server_name 도메인명;

	access_log 액세스_로그파일_위치/로그파일명.log;
	error_log 에러_로그파일_위치/로그파일명.log;

	location / {
		proxy_pass 스프링_프로젝트_인스턴스의_IP주소; 
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header Host $http_host;
	}
}

# 예제
server {
  server_name try-code.com www.try-code.com;

  access_log /var/log/nginx/try-code.com/access.log;
  error_log /var/log/nginx/try-code.com/error.log;

  location / {
				  # nginx만 확인할때는 80으로 진행했음
          proxy_pass http://localhost:80;
          
          # https 설정을 하기전에 이 내용이 있으면 안되는듯?
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header Host $http_host;
  }
}

```

- 심볼릭 링크란?
    - 링크를 연결해 **원본 파일을 직접 사용하는 것과 같은 효과**를 내는 **링크**
    - Windows의 **바로가기**와 유사한 개념
    - 특정 폴더에 링크를 걸어 NAS, library 원본 파일을 사용하기 위해 사용
- nginx.conf의 일부
    
    sites-enabled의 파일들을 include 하고 있다.
    
    ```coffeescript
    http {
      ...
    
    ### Virtual Host Configs##
      include /etc/nginx/conf.d/*.conf;
      include /etc/nginx/sites-enabled/*;
    
      ...
    }
    ```
    
- 위 참고한 블로그
    
    [[OSD] 3. 도메인 연결 및 nginx 서버 설정하기](https://xiv-dev.tistory.com/6)
    

5. nginx - /etc/nginx/sites-enabled에 심볼릭 링크 생성

```bash
$ sudo ln -s /etc/nginx/sites-available/{위에서 생성한 파일명} /etc/nginx/sites-enabled/{위에서 생성한 파일명}

# 예제
$ sudo ln -s /etc/nginx/sites-available/try-code.com /etc/nginx/sites-enabled/try-code.com
```

```bash
#심볼릭 링크를 확인하기 위한 명령어
$ readlink /etc/nginx/sites-enabled/{확인할 파일명}
```

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/75135259_image.png]]

6. nginx - 설정 파일 확인

```bash
$ sudo nginx -t
```

- test failed
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/61835e97_image.png]]
    
    : `/var/log/nginx/try-code.com/` 디렉토리가 없어서 발생하는 오류
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/15a531c7_image.png]]
    
    : 해당 디렉토리를 생성. 오류 해결
    

1. nginx - 재시작

```bash
$ sudo service nginx restart
```

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/de9df860_image.png]]

#### SSL 적용

1. certbot 설치

- Ubuntu 18.04 이하: python-certbot-nginx 설치
- Ubuntu 18.04 이상: python**3**certbot-nginx 설치

```bash
$ apt-get update
$ sudo apt-get install certbot
$ apt-get install python3-certbot-nginx
```

2. SSL/TLS 인증서 발급

- d 도메인을 나열해 여러 도메인에 대해 인증서 발급 가능
- 해당 명령어 실행 후 아까 추가했던 설정 파일(/etc/nginx/sites-available/도메인명)을 보면 `# managed by Certbot` 주석이 달린 코드들이 추가된 것을 볼 수 있음

```bash
$ sudo certbot --nginx -d 도메인
$ sudo certbot --nginx -d 도메인 -d 서브도메인2 -d 서브도메인3

# 예시
$ sudo certbot --nginx -d try-code.com -d www.try-code.com -d ci.try-code.com -d git.try-code.com -d repo.try-code.com -d web.try-code.com
```

- 아래꺼가 됨

```bash
sudo certbot certonly --manual --preferred-challenges dns -d "git.tandanji.com" -d "tandanji.com"
```

- `[ERROR]` The Certificate Authority failed to verify the temporary nginx configuration changes made by Certbot. Ensure the listed domains point to this nginx server and that it is accessible from the internet.
    
    [Ubuntu 방화벽 확인](https://m.blog.naver.com/adsl6662/221175610821)
    
    - 위 에러가 났었는데 현재 nginx가 도메인으로 연결된 후로부터 ssl 인증서 발급이 제대로 이루어짐

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/a4347559_image.png]]

- `/etc/nginx/sites-available/try-code.com` 파일을 열어서 확인하면 풀체인, 프라이브키.pem 키가 설정되어있다.

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/a527f12d_image.png]]

- ssl 발급이후 도메인 입력시 연결거부됨
    - `/etc/nginx/sites-available/try-code.com` 수정함
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/65ded222_image.png]]
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/63e18bac_image.png]]
    
- 위 방법으로도 안돼서 다른 방법을 찾음
    
    ```bash
    /etc/nginx/sites-available/default 설정파일에서 다음 부분을 수정해준다.
    
    # Default server configuration
    # 
    server { 
                listen 80 default_server;
                listen [::]:80 default_server;
    
     위의 내용을 아래와 같이 
    
    # Default server configuration
    # server { 
                    listen 80; 
                    listen [::]:80 ipv6only=on default_server;
    ```
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/897fc507_image.png]]
    
    이렇게 바꿔주었다고 해도 다시 nignx만 재시작 하긴 힘들다.
    
    이럴때는 강제로 80번 포트를 사용하는 프로세스를 다 죽이고 재시작을 시킨다.
    
    ```bash
    $ sudo fuser -k 80/tcp
    $ sudo service nginx restart
    ```
    

- 오타가 문제였음
    - `/etc/nginx/sites-available/try-code.com` 수정하면서 마지막에 rui;라고 작성해서 문제가 됨

- **방화벽 설정 확인**: 서버의 방화벽이 포트 443을 차단하고 있지 않은지 확인
    
    ```bash
     # 정책 조회
    sudo ufw show raw
    
     # 기본 정책 허용
    sudo ufw default allow
    
     # 기본 정책 차단
    sudo ufw default deny 
    
     # 443포트(HTTPS) 허용
    sudo ufw allow 443
    
     # 443포트(HTTPS) TCP 허용
    sudo ufw allow 443/tcp
    
     # 443포트(HTTPS) UDP 허용
    sudo ufw allow 443/udp
    
     # 443포트(HTTPS) 허용
    sudo ufw allow https
    
    # 현재 적용된 정책을 인덱스 포함하여 출력
    sudo ufw status numbered
    
     # 1번 정책 삭제
    sudo ufw delete 1
    ```
    

- 인증서 발급시 와일드 카드 사용방법
    - 
    
    [[Infra] Nginx에 서브도메인 연결하기](https://leeleelee3264.github.io/post/2023-03-25-subdomain-with-nginx/)
    

- 와일드 카드 사용해서 ssl 인증서 발급
    - 발급하기 이전에 /etc/nginc/sites-available/{서브도메인 or 도메인별 설정파일생성}
        - gitlab을 예시로 각 서브도메인 설정하면 됨
        
        ```bash
        server {
            listen 80;
            listen [::]:80;
        
            server_name git.try-code.com www.git.try-code.com;
        
            # 모든 요청을 HTTPS로 리다이렉트
            return 301 https://$host$request_uri;
        
        }
        
        # 443번 포트에서 백엔드로 요청 프록시 처리
        server {
            listen 443 ssl; # managed by Certbot
            server_name git.try-code.com www.git.try-code.com;
        
            access_log /var/log/nginx/try-code.com/access.log;
            error_log /var/log/nginx/try-code.com/error.log;
        
            # Root location block to serve static content
            location / {
                proxy_pass http://localhost:51080;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
        
            }
        
            # SSL/TLS configuration using Let's Encrypt certificate
            ssl_certificate /etc/letsencrypt/live/try-code.com/fullchain.pem; # managed by Certbot
            ssl_certificate_key /etc/letsencrypt/live/try-code.com/privkey.pem; # managed by Certbot
            include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
            ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
        }
        
        ```
        
        ```bash
        # jenkins
        erver {
            listen 80;
            listen [::]:80;
        
            server_name ci.try-code.com www.ci.try-code.com;
        
            return 301 https://$host$request_uri;
        }
        
        # 443번 포트에서 백엔드로 요청 프록시 처리
        server {
            listen 443 ssl; # managed by Certbot
            server_name ci.try-code.com www.ci.try-code.com;
        
            access_log /var/log/nginx/try-code.com/access.log;
            error_log /var/log/nginx/try-code.com/error.log;
        
            location / {
                proxy_pass http://localhost:51008;
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
        

```bash
$ sudo certbot certonly --manual -d "*.try-code.com" -d "try-code.com" --preferred-challenges dns
```

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/8bd22c29_image.png]]

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/5a46fd9f_image.png]]

- 아래 사이트에서 설정이 잘됐는지 확인
    - 사이트에서 확인하기
        
        [Dig (DNS lookup)](https://toolbox.googleapps.com/apps/dig/#TXT/_acme-challenge.domain.com)
        
    - 명령어로 확인하기
        
        ```bash
        $ dig _acme-challenge.{도메인} TXT
        ```
        

참고한 사이트

[Let's Encrypted certbot으로 와일드카드 SSL인증서 발급 받기](https://velog.io/@suhongkim98/Lets-Encrypted-certbot으로-와일드카드-인증서-발급받기)

[[Infra] Nginx에 서브도메인 연결하기](https://leeleelee3264.github.io/post/2023-03-25-subdomain-with-nginx/)

[[Docker] Nginx 를 사용한 SubDomain(서브도메인) 분기](https://jm4488.tistory.com/58)

[Ubuntu 방화벽 확인](https://m.blog.naver.com/adsl6662/221175610821)

[서브도메인 생성 및 nginx 설정](https://velog.io/@wook2pp/서브도메인-생성-및-nginx-설정)

[[Nginx] 서브 도메인 설정, HTTPS 적용](https://9yujin.tistory.com/6)

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
