---
별칭:
  - "학습 - WAS 서버 설정"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/10624612498b80019374eb7f10345943
---

# 학습: WAS 서버 설정

## 세부 내용

---

---

## 1. Nginx 설치

---

1. 설치 명령어 실행
    
    ```bash
    $ sudo apt update
    $ sudo apt install nginx
    ```
    

1. 현재 내 IP 확인 후 IP 주소로 브라우저에 검색하여 확인
    
    ```bash
    $ ip addr
    ```
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/ae3363f9_image.png]]
    
    해당 ip로 접속하면 nginx가 정상 실행중인 경우 위 페이지를 확인할 수 있다.
    
2. 도메인 설정 사이트에서 사용할 도메인 설정
    - My가비아 > DNS 관리툴 > 설정 > 레코드 수정 > Web Server가 설치된 인스턴스 IP로 레코드 등록
    - 도메인 타입은 `A`, 서브 도메인 타입은 `CNAME`
    - 서브 도메인에 `값/위치`는 `도메인.`으로 넣어준다.
    - 추후 SSL 인증서 발급시 TXT 타입도 추가하지만 나중에 작업할 때 추가하도록 한다.
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/0fe97e98_image.png]]
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/b299fd06_image.png]]
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/6883717c_image.png]]
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/0778f60f_image.png]]
        

1. nginx 설정 파일 생성
    - 도메인 주소로된 파일은 추후 필요없을 예정. nginx에 접속이 잘돼는지 확인용 (ex: domain.com)
    - nexus, gitlab, jenkins, web, app, mng 각 서브도메인별로 파일 생성하여 설정해야함. (ex: git.domain.com)
    
    ```bash
    $ sudo vi /etc/nginx/sites-available/{생성할 파일명}
        
    # 예시
    $ sudo vi /etc/nginx/sites-available/git.domain.com
      
    # 파일 전부 생성한 후에 목록 확인
    $ ls /etc/nginx/sites-available
      
    # 출력결과
    ci.domain.com  default  git.domain.com  repo.domain.com  web.domain.com  app.domain.com  mng.domain.com
    ```
    

**위 생성한 파일 내용 예시**

- 아래 파일 내용에서는 SSL인증서를 참조하는 내용도 포함되어있지만, 아직 SSL인증서를 발급하기 이전이기 때문에 `$ sudo systemctl nginx -t` 명령어로 nginx 상태 확인시 오류메세지를 날린다.
- 우선 conf 파일을 먼저 생성 및 작성한 뒤에 SSL인증서를 발급 받고 `$ systemctl nginx restart`명령어를 통해 재시작하여 적용한다.
    
    
    **기본 도메인 설정파일** 
    
    - nginx 접속 확인용으로 사용 후 추후에 주석처리한다.
    
    ```bash
    # 80번 포트에서 모든 요청을 HTTPS로 리다이렉트
    server {
    
        listen 80;
        listen [::]:80;
    
        server_name {도메인주소} www.{도메인주소};
    
        # 모든 요청을 HTTPS로 리다이렉트
        # return 404; # managed by Certbot
        return 301 https://$host$request_uri;
    
    }
    
    # 443번 포트에서 백엔드로 요청 프록시 처리
    server {
        listen 443 ssl; # managed by Certbot
        server_name {도메인주소} www.{도메인주소};
    
        access_log /var/log/nginx/domain.com/access.log;
        error_log /var/log/nginx/domain.com/error.log;
    
        # Root location block to serve static content
        location / {
            root /var/www/html;
            index index.html index.htm index.nginx-debian.html;
            try_files $uri $uri/ =404;
        }
    
        # SSL/TLS configuration using Let's Encrypt certificate
        ssl_certificate /etc/letsencrypt/live/{도메인주소}/fullchain.pem; # managed by Certbot
        ssl_certificate_key /etc/letsencrypt/live/{도메인주소}/privkey.pem; # managed by Certbot
        include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
        ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
    }
    ```
    

**gitlab**

```bash
# 파일명 : git.domain.com
server {
    listen 80;
    listen [::]:80;

    server_name git.{도메인주소}.com www.git.{도메인주소}.com;

    # 모든 요청을 HTTPS로 리다이렉트
    return 301 https://$host$request_uri;

}

# 443번 포트에서 백엔드로 요청 프록시 처리
server {
    listen 443 ssl; # managed by Certbot
    server_name git.{도메인주소}.com www.git.{도메인주소}.com;

    access_log /var/log/nginx/{도메인주소}/access.log;
    error_log /var/log/nginx/{도메인주소}/error.log;

    # Root location block to serve static content
    location / {
        proxy_pass http://{사설ip}:{포트};
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        client_max_body_size 50M;
        proxy_buffer_size          128k;
        proxy_buffers              4 256k;
        proxy_busy_buffers_size    256k;

    }

    # SSL/TLS configuration using Let's Encrypt certificate
    ssl_certificate /etc/letsencrypt/live/{도메인주소}/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/{도메인주소}/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}
```

**nexus**

```bash
# 파일명 : repo.domian.com
server {
    listen 80;
    listen [::]:80;

    server_name repo.{도메인주소}.com www.repo.{도메인주소}.com;

    # 모든 요청을 HTTPS로 리다이렉트
    return 301 https://$host$request_uri;
}

# 443번 포트에서 백엔드로 요청 프록시 처리
server {
    listen 443 ssl; # managed by Certbot
    server_name repo.{도메인주소}.com www.repo.{도메인주소}.com;

    access_log /var/log/nginx/{도메인주소}/access.log;
    error_log /var/log/nginx/{도메인주소}/error.log;

    location / {
        proxy_pass http://{사설ip}//:{포트};
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /v1 {
        proxy_pass http://{사설ip}:{포트};
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /v2 {
        proxy_pass http://{사설ip}:{포트};
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    ssl_certificate /etc/letsencrypt/live/{도메인주소}/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/{도메인주소}/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

```

**jenkins**

```bash
# 파일명 : ci.domain.com
server {
    listen 80;
    listen [::]:80;

    server_name ci.{도메인주소}.com www.ci.{도메인주소}.com;

    return 301 https://$host$request_uri;
}

# 443번 포트에서 백엔드로 요청 프록시 처리
server {
    listen 443 ssl; # managed by Certbot
    server_name ci.{도메인주소}.com www.ci.{도메인주소}.com;

    access_log /var/log/nginx/{도메인주소}/access.log;
    error_log /var/log/nginx/{도메인주소}/error.log;

    location / {
        proxy_pass http://{사설ip}:{포트};
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    ssl_certificate /etc/letsencrypt/live/{도메인주소}/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/{도메인주소}/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

```

1. sites-enabled에 심볼릭 링크 생성
    - 두 개의 폴더에 동시에 존재하는 것처럼 가장하는 방법입니다.
    - `sites-available` 디렉토리에 있는 파일이 원본파일이자, 작업파일이고 결과적으로 `sites-enabled` 디렉토리에 있는 파일을 참조합니다.

```bash
$ sudo ln -s /etc/nginx/sites-available/{위에서 생성한 파일명} /etc/nginx/sites-enabled/{위에서 생성한 파일명}

# 예시
$ sudo ln -s /etc/nginx/sites-available/git.domain /etc/nginx/sites-enabled/git.domain.com
```

1. 심볼릭 링크를 확인하기 위한 명령어

```bash
$ readlink /etc/nginx/sites-enabled/{확인할 파일명}
```

1. SSL 인증서 발급
- certbot 설치
    - Ubuntu 18.04 이하: python-certbot-nginx 설치
    - Ubuntu 18.04 이상: python3certbot-nginx 설치

```bash
$ apt-get update
$ sudo apt-get install certbot
$ apt-get install python3-certbot-nginx
```

- SSL/TLS 인증서 발급
- d 도메인을 나열해 여러 도메인에 대해 인증서 발급 가능

```bash
$ sudo certbot certonly --manual -d "*.domain.com" -d "domain.com" --preferred-challenges dns
```

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/d2466bc6_image.png]]

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/8ff827c1_image.png]]

- DNS TXT 코드를 발급해주면 가비아 DNS 설정에서 타입은 TXT,_`acme-challenge`라는 호스트로 값을 넣어준다.
    - 연결확인을 위해 아래 명령어로 확인할 수 있다.
    또는 [https://toolbox.googleapps.com/apps/dig/#TXT/_acmechallenge.domain.com](https://toolbox.googleapps.com/apps/dig/#TXT/_acme-challenge.domain.com) 에 접속하여 검색으로 알 수 있다.

```bash
$ dig _acme-challenge.{도메인} TXT
```

1. nginx 설정 파일 확인 및 재시작

```bash
# 설정 파일 확인
$ sudo nginx -t

# nginx 재시작
$ sudo service nginx restart
```

#### nginx 관련 명령어

```bash
# nginx config 수정 후 적용 명령어
 $ sudo nginx -s reload
 
 # nginx 상태 확인
 $ sudo systemctl status nginx
 
 # nginx 기동
 $ sudo systemctl start nginx

 # 정상 시작 상태 확인
 $ sudo systemctl status nginx
```

#### 방화벽 관련 명령어

```bash
# ufw 상태 확인
$ sudo ufw status verbose

# ufw 활성화/비활성화
$ sudo ufw enable / $ sudo ufw disable

# 443포트(HTTPS) 허용
$ sudo ufw allow 443

# 443포트(HTTPS) TCP 허용
$ sudo ufw allow 443/tcp

```

## 2. Docker 설치

---

1. docker 설치
    - 리눅스의 응용 프로그램들을 프로세스 격리 기술들을 사용해 컨테이너로 실행하고 관리하는 오픈 소스 프로젝트
    
    ```bash
    # 우분투 시스템 패키지 업데이트
    $ sudo apt-get update
    
    # 필요한 패키지 설치
    $ sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    
    # Docker의 공식 GPG키를 추가
    $ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    
    # 시스템 패키지 업데이트
    $ sudo apt-get update
    
    # Docker 설치
    $ sudo apt-get install docker-ce docker-ce-cli containerd.io
    # 위 명령어가 에러가나서 찾아보니 우분투에서는 도커 설치 명령어를 제공한다고함
    
    $ sudo apt install -y docker.io nfs-common dnsutils curl
    
    # 도커 실행상태 확인
    $ sudo systemctl status docker
    
    ```
    
- 에러참고
    
    [http://3.36.24.220/topic/1472/sudo-apt-get-install-docker-ce-docker-ce-cli-containerd-io-docker-compose-plugin-%EC%84%A4%EC%B9%98-%EC%8B%9C-%EC%98%A4%EB%A5%98/3](http://3.36.24.220/topic/1472/sudo-apt-get-install-docker-ce-docker-ce-cli-containerd-io-docker-compose-plugin-%EC%84%A4%EC%B9%98-%EC%8B%9C-%EC%98%A4%EB%A5%98/3)
    

1. docker compose 설치
    - 여러 개의 도커 컨테이너를 하나의 어플리케이션을 구성하기 위해 사용
    
    ```bash
    # 도커 컴포즈 설치
    $ sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      
    # 도커 컴포즈 권한 부여
    $ sudo chmod +x /usr/local/bin/docker-compose
      
    # 심볼릭 링크 연결
    $ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    ```
    

1. 네트워크 생성
    - 여러 컨테이너 간의 통신을 원활하게 관리하고 분리된 네트워크 환경을 제공하기 위함
    
    ```bash
    $ sudo docker network create {생성할 네트워크명}
    
    # 예시
    $ sudo docker network create ev-network
    ```
    

## 3. GitLab 가이드

### 1. GitLab 설치

---

**GitLab 디렉토리 구조**

```bash
   infra
     └── gitlab
           ├── docker-compose.yml (생성필요)
           └── volume (생성필요)
```

1. infra/gitlab 폴더 생성

```bash
$ cd ~ # 홈 디렉토리로 이동
$ mkdir infra # 'infra' 디렉토리 생성
$ mkdir gitlab # 'gitlab' 디렉토리 생성
$ cd gitlab # 'gitlab' 디렉토리로 이동
```

1. 바인드 마운트용 (Bind mount) 디렉토리 생성

```bash
# 바인드 마운트에 사용할 디렉토리 생성
$ mkdir volume
$ cd volume

# 백업 데이터를 저장할 'backup' 디렉토리 생성
$ mkdir backup

# GitLab 데이터를 저장할 'data' 디렉토리 생성
$ mkdir data

# GitLab 로그 데이터를 저장할 'logs' 디렉토리를 생성
$ mkdir logs

# GitLab 설정 데이터를 저장할 'config' 디렉토리를 생성
$ mkdir config
```

1. 도커 컴포즈 (docker-compose) 작성

```bash
# 도커 컴포즈 파일 생성
$ cd ~ infra/gitlab # 'gitlab' 디렉토리로 이동
$ vim docker-compose.yml # docker-compose.yml 생성 및 작성
```

**docker-compose.yml**

```yaml
services:
 gitlab:
   image: 'gitlab/gitlab-ce:latest' # GitLab의 커뮤니티 에디션 최신 버전 이미지 사용
   networks:
     - ev-network # GitLab 컨테이너가 연결될 네트워크 설정
   container_name: 'gitlab' # 컨테이너 이름을 'gitlab'으로 설정
   restart: always # 컨테이너가 종료될 경우 항상 재시작하도록 설정
   hostname: '{호스트 이름}'# GitLab이 설치된 ip 혹은 호스트명을 입력 ex) git.try-code.com
   environment:
     GITLAB_OMNIBUS_CONFIG: | # GitLab의 환경 설정을 정의
       external_url '{도메인 주소}' ex) https://git.try-code.com # GitLab에서 clone을 이용할때 사용되는 주소
       gitlab_rails['gitlab_shell_ssh_port'] = 51022 # 호스트에서 매핑할 컨테이너 ssh port 번호
       nginx['listen_https']=false # nginx https 설정
       nginx['listen_port']=80 # nginx 포트 설정
     TZ: 'Asia/Seoul'
   ports:
     - "51080:80" # 호스트의 51080 포트를 GitLab의 80번 포트(HTTP)에 매핑 
     - "51022:22" # GitLab의 SSH 접근을 위한 포트 설정.
     - "51443:443" # 호스트의 51443 포트를 GitLab의 443번 포트(HTTPS)에 매핑

   volumes:
     - './volume/config:/etc/gitlab' # GitLab 설정 파일을 호스트 디렉토리와 매핑
     - './volume/logs:/var/log/gitlab' # GitLab 로그 파일을 호스트 디렉토리와 매핑
     - './volume/data:/var/opt/gitlab' # GitLab 데이터 파일을 호스트 디렉토리와 매핑
     - './volume/backup:var/opt/gitlab/backups' # GitLab 백업 파일을 저장할 디렉토리 매핑
   shn_size : '20gb' # (잘못된 옵션. Docker Compose에서는 지원하지 않는 옵션이므로 삭제 필요)
   deploy:
       resources:
           limits:
               memory: 50gb # 컨테이너가 사용할 수 있는 메모리 제한을 50GB로 설정
   networks:
       ev-network:
           external: true  # ev-network라는 외부 네트워크 사용 설정

```

- external_url에 port까지 명시하면 아래 ports 설정에서 명시한 port로 작성해야한다. (아래 예시)

```yaml
   environment:
      GITLAB_OMNIBUS_CONFIG: | # GitLab의 환경 설정을 정의
        external_url 'http://192.168.0.179:51080' 
    ports:
      - "51080:80" # 호스트의 51080 포트를 GitLab의 80번 포트(HTTP)에 매핑 
```

1. 도커 컴포즈 실행 명령
    - docker-compose.yml 파일이 있는 디렉토리에서 다음 명령어로 GitLab을 실행
    
    ```bash
    $ docker-compose up -d # 백그라운드에서 GitLab 컨테이너를 실행
    $ docker-compose down # 실행 중인 GitLab 컨테이너를 중지하고 종료
    ```
    
2. GitLab 접속
- 브라우저에서 `http://{서버 IP 주소}:{gitlab 포트}` 으로 접속할 수 있습니다.
    - `http://192.168.0.179:51080` or `http://localhost:51080`

1. 초기 비밀번호 확인 후 변경

```bash
# 다음 명령어를 사용하여 GitLab의 루트 계정 초기 비밀번호를 확인
$ docker exec -it <실행중인 컨테이너 ID> grep 'Password:' /etc/gitlab/initial_root_password

# 출력된 비밀번호를 복사하여 브라우저에서 로그인 후 비밀번호를 변경한다.
```

### 2. 인증 설정

---

#### 1. ssh Key 설정

1. key 생성

```bash
$  ssh-keygen -t rsa -b 4096 -C “EV_INFRA_PROJECT”/
```

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/a781a31f_image.png]]

```bash
$  cd ~/.ssh
$  ssh-add
```

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/884a0745_image.png]]

1. key 등록 (pub key at git)
- 깃랩 로그인 -> UserSetting -> SSH keys 클릭
- id_rsa.pub 공개키 등록

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/d0a192bb_image.png]]

1. key  핸드셰이킹

```bash
$  cd ~/.ssh
$  ssh -T git@git.any-ev.com -p 41010
```

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/41dc675b_image.png]]

1. SSH clone 작동 확

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/3d96460f_image.png]]

#### 2. AccessToken 설정

---

1. AccessToken 등

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/b5ddb9fd_image.png]]

- 최초 https 클론을 시도할때 계정암호 가 아닌 accesstoken 을 묻는다.
- 패스워드를 입력하면 위 사진 처럼 인증 실패한다.
- 인증 성공을 위해선 패스워드가 아닌 accesstoken을 사용하여 인증해야한다.

1. 깃랩 로그인 → `UserSetting` → `AccesToken` 클릭
2. 권한 설정 후 생성
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/0bc8a137_image.png]]
    
    주의사항 : accesstoken은 한번 생성된 뒤로는 다시 확인 불가능하니 따로 저장해두록 한다.
    

1. git clone 진행 및 확인

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/14f7aee6_image.png]]

### 3. git 배포가이드

---

#### 1. 젠킨스 pipline 연결 전 gitlab에 프로젝트 올리기

1. GitLab에 프로젝트를 푸시할 계정을 추가
    - Add people 클릭
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/1486bbe9_image.png]]
        
    
    - Account 사용자 정보 입력 후 Access level을 지정한 뒤 create user를 클릭
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/94d65748_image.png]]
        
    - 좌측 메뉴바에서 `Admin area` > `Users` > 생성한 사용자에 `Edit` 클릭하여 사용자에 초기비밀번호를 설정
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/82b09562_image.png]]
        
2. GitLab에 접속하여 프로젝트 생성
    - `Create a project` 클릭
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/33ae6555_image.png]]
        
    - `Create blank project` 클릭
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/6b4cd320_image.png]]
        
    - 프로젝트명 입력후 기존 생성한 group을 지정하여 README 파일 없이 생성
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/63b2e639_image.png]]
        

1. Git 설치
    
    ```bash
    $ sudo apt-get install git
    ```
    
2. 올릴 프로젝트 경로로 이동 후 초기화
    
    ```bash
    $ git init
    ```
    
3. 원격 저장소와 연결
    
    ```bash
    $ git remote add origin {원격저장소주소}
    ```
    
- 원격저장소 주소 복사
    
    *VM에서 접속할 시 localhost가 들어가야함*
    
    *ex) `http://localhost:51080/jenkins/csms-api.git`*
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/b463aedf_image.png]]
    

1. 원격 저장소와 연결 확인
    
    ```bash
    $ git remote -v
    ```
    
2. 올릴 파일을 스토리지에 추가
    
    ```bash
    $ git add .
    ```
    
3. 커밋
    
    ```bash
    $ git commit -m "메세지 내용"
    ```
    
4. 커밋 내용 확인
    
    ```bash
    $ git shortlog
    ```
    
5. 원격 저장소에 푸시
    
    ```bash
    $ git push origin main
    ```
    
    - 푸시가 안되는 경우
    
    ```bash
    $ git config --global init.defaultBranch main
    ```
    
6. GitLab에 등록된 username과 password를 입력  *"accessToken 발급 사전 작업 되어있어야함"*
    - 등록이 안되어있다면 1번 내용을 통해 등록
    - 프로젝트 계정 권한 주는 방법
        - 프로젝트 > `Setting` > `Repository` > `Protedcted branches` 클릭하여 권한은 `Developers + Maintainers로` 변경
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/46203cab_image.png]]
        

## 4. 젠킨스(CD)가이드

### 1. 젠킨스 설치

---

**Jenkins 디렉토리 구조**

```bash
   infra
     └── jenkins
           ├── docker-compose.yml (생성필요)
           ├── Dockerfile (생성필요)
           └── volume (생성필요)
```

1. 시스템 패키지 리스트를 업데이트하여 최신 패키지를 사용할 수 있도록 함
    
    ```bash
    $ sudo apt-get update
    ```
    
2. Java17 설치
    
    ```bash
    $ sudo apt-get install openjdk-17-jdk  # OpenJDK 17 버전 설치
    ```
    
3. infra/jenkins 폴더 생성
    
    ```bash
    $ cd ~/infra # 'infra' 디렉토리로 이동
    $ mkdir jenkins # 'jenkins' 디렉토리 생성
    $ cd jenkins # 'jenkins' 디렉토리로 이동
    ```
    
4. 도커 파일 (Dockerfile) 작성
    
    ```bash
    $ vim Dockerfile # Dockerfile 생성 및 작성
    ```
    
    **Dockerfile**
    
    ```bash
    From jenkins/jenkins:jdk17 # Jenkins 이미지에서 jdk17을 사용하여 기본 이미지를 생성
    
    USER root # root 권한으로 설정
    
    # 필수 패키지 설치(lsb-release는 시스템 정보를 가져오는 데 사용)
    RUN apt-get update && apt-get install -y lsb-release
    
    # Docker GPG 키 다운로드 (도커 패키지를 신뢰할 수 있도록 서명된 키를 다운로드)
    RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
    https://download.docker.com/linux/debian/gpg
    
    # Docker 리포지토리 추가 (도커 설치를 위해 Debian 기반의 리포지토리를 추가)
    RUN echo "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
    
    # 도커 클라이언트 설치 (Docker CLI 도구 설치)
    RUN apt-get update && apt-get install -y docker-ce-cli
    
    # sshpass 설치 (자동화된 SSH 로그인 도구 설치)
    RUN apt-get install -y sshpass
    
    # 로케일 설정 (한국어 환경을 설정하고 UTF-8 인코딩 적용)
    RUN apt-get install -y locales git \
       && localedef -f UTF-8 -i ko_KR ko_KR.UTF-8
    ENV LC_ALL ko_KR.UTF-8 # 모든 로케일 설정을 한국어로 변경
    
    # git 설치
    Run apt-get install -y git
    
    # docker 그룹 추가 
    RUN groupadd -f docker # docker 그룹이 존재하지 않으면 생성
    
    # jenkins 사용자를 docker 그룹과 root 그룹에 추가
    RUN usermod -aG docker jenkins
    RUN usermod -aG root jenkins
    
    # 이후 jenkins 사용자로 돌아감
    USER jenkins
    ```
    
5. 도커 컴포즈 (docker-compose) 작성
    
    ```bash
    # 도커 컴포즈 파일 생성
    $ cd ~/infra # 'infra' 디렉토리로 이동
    $ mkdir jenkins # 'jenkins' 디렉토리 생성
    $ cd jenkins # 'jenkins' 디렉토리로 이동
    $ vim docker-compose.yml # docker-compose.yml 생성 및 작성
    ```
    
    **docker-compose.yml**
    
    ```bash
    version: '3.3' # Docker Compose 파일의 버전 설정
    services:
      jenkins:
        privileged: true # 컨테이너 시스템의 주요 자원에 접근할 수 있게 지정
        networks:
          - ev-network # Jenkins가 연결될 네트워크 설정
        build:
          context: . # Dockerfile이 있는 위치
          dockerfile: Dockerfile # Jenkins 이미지 생성에 사용할 Dockerfile 지정
        container_name: 'jenkins' # 컨테이너 이름을 'jenkins'로 지정
        restart: always # 컨테이너가 종료되면 자동으로 재시작하도록 설정
        ports:
          - '51008:8080' # Jenkins의 웹 인터페이스 포트 (51008을 로컬의 8080으로 매핑)
          - '51007:50000' # Jenkins 에이전트 연결 포트 (51007을 로컬의 50000으로 매핑)
        volumes:
          - './volume/jenkins_home:/var/jenkins_home' # Jenkins 홈 디렉토리를 호스트와 공유
          - '/var/run/docker.sock:/var/run/docker.sock' # 도커 소켓을 공유하여 도커 명령어 사용 가능하게 설정
        environment:
          TZ: "Asia/Seoul" # 시스템 시간대를 한국으로 설정
    networks:
      ev-network:
        external: true # 외부 네트워크 사용
    ```
    
6. volume 폴더의 소유권을 변경하여 Jenkins가 해당 폴더에 접근할 수 있도록 설정
    
    ```bash
    $ cd ~/infra/jenkins  # jenkins 디렉토리로 이동
    $ sudo chown -R 1000:1000 ./volume  # 폴더의 소유권을 UID 1000(보통 jenkins 사용자)로 변경
    ```
    
7. Jenkins 도커 컴포즈 실행
    
    ```bash
    $ docker-compose up -d  # 백그라운드에서 Jenkins 컨테이너 실행
    ```
    
8. Jenkins 접속하여 초기 비밀번호 수정 
    - 브라우저에서 `http://{서버 IP 주소}:{포트번호}` 으로 접속할 수 있습니다.
    - `http://192.168.0.1:51080` or `http://localhost:51080`
9. 초기 비밀번호 확인후 변경
    
    ```bash
    # 초기 비밀번호 파일이 있는 경로로 이동
    $ sudo docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
    
    # 출력된 비밀번호를 복사하여 브라우저에서 로그인 후 비밀번호를 변경한다.
    ```
    
10. 젠킨스 설치
    - install suggested plugins 클릭
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/3a0dfedb_image.png]]
        
    - 설치 진행 화면
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/1637d297_image.png]]
        

### 2. 젠킨스 credential 설정

---

#### 1. gitlab AccessToken을 젠킨스 웹에 등록

- 젠킨스에서 gitlab 레퍼지토리에 있는 소스코드를 체크아웃할때 사용됩니다.
1. gitlab에 jenkins 계정을 추가하여 권한을 부여합니다.
2. 크레덴셜 생성을 위해서 우선 gitlab에 accessToken을 생성합니다.
3. `Dashboard` > `Jenkins관리` > `Credential` > `global` 로 이동을 합니다.

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/f8a732a3_image.png]]

1. username 항목에는 gitlab 계정, password 항목에는 accessToken을 넣고 id와 description 항목에는 자유롭게 넣어주시면 됩니다.

#### 2. 젠킨스 서버에서 SSH키를 발급하여 젠킨스 웹에 등록

- 젠킨스에서 deployServer ssh 접속을 할때 쓰입니다.
- 크레덴셜 생성을 위해 젠킨스에서 ssh-key를 등록합니다.
1. jenkins는 docker container 위에서 작동되고 있으니 우선 docker에서 젠킨스서버에 접속합니다.
    
    ```bash
    # 기본 접속 명령어
    $ docker exec -it {컨테이너명} bash
    
    # 예시
    $ docker exec -it jenkins bash
    
    # root 계정으로 접속 명령어
    $ docker exec -it -u root {컨테이너명} /bin/bash # /bin/bash가 안돼면 /bin/sh로 변경
    ```
    
2. ssh 키를 발급한 뒤 젠킨스에서 gitlab에 접근이 가능한지 확인합니다.
    
    ```bash
    # ssh 키 발급
    $ ssh-keygen -t rsa
    
    # ssh 키 생성 확인
    $ cd /var/jenkins-home/.ssh
    $ ls
    id-rsa   id-rsa.pub
    
    # 공개키를 원격서버로 복사
    $ ssh-copy-id -i /var/jenkins_home/.ssh/id_rsa.pub -p {원격서버 ssh 접속 port} {계정명}@{외부IP}
    
    # 예시
    $ ssh-copy-id -i /var/jenkins_home/.ssh/id_rsa.pub -p 20022 evdev@112.0.24.90
    
    # id-rsa 키 확인
    $ cat /var/jenkins-home/.ssh/id-rsa
    # 출력된 키를 복사한 후에 젠킨스 웹사이트에 접속하여 아래 이미지와 같이 추가한다.
    ```
    
    - Dashboard > Jenkins관리 > Credential > global 로 이동
        - ID 부분에 `jenkins-ssh-key`로 설정했는데 추후 프로젝트에 있는 `Jenkinsfile`에서 해당ID를 사용하니 참고하세요.
        
        ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/2a3390bb_image.png]]
        

<aside>
💡

위와 같이 설정하시면 jenkins에서 deploy서버에 ssh 접속을 password 없이 하실 수 있습니다.

더 정확한 정보는 구글에 'ssh-copy-id'키워드로 검색하세요.

</aside>

### 3. 젠킨스 파이프라인 구축

---

#### 1. 젠킨스 job 생성

1. 젠킨스 화면 로그인
2. `Dashboard` > `관리자` > `MyViews` > `All` 이동
    - `새로운 Item` 클릭
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/dfae6733_image.png]]
    
3. Job 이름 입력 > Pipeline 선택 > 'OK’
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/47ba39fc_image.png]]
    
4. Job의 Description 입력합니다.
    - git에서 ci/cd sample 프로젝트를 참고하시길 바랍니다.
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/e843ccfa_image.png]]
    
5. 설정 부분에서 `이 빌드는 매개변수가 있습니다.` 체크합니다.
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/0a6eec5d_image.png]]
    

1. 매개변수는 `git parameter` 상세정보를 입력합니다.
    - 매개변수 추가 항목에서 git parameter 매개변수가 없을시 추가
    - Jenkins 관리 항목 > plugin 클릭 > `Availabel plugins` 클릭 'git parameter' 검색 후 install
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/d79107c8_image.png]]
    
    <aside>
    💡
    
    매개변수를 gitlab에서 push 후 브랜치 이름을 매개변수 BRANCH 로 받고,
    
    브랜치를 선택해서 빌드 할수 있도록 설정 하려고 합니다.
    
    파라미터 타입은 브랜치가 아니라 git의 태그를 이용하여서 빌드를 진행 할 수 도 있습니다.
    
    더 상세한 정보는 'git parameter 젠킨스'와 같은 키워드로 구글링 해보시면 됩니다.
    
    </aside>
    
2. Pipeline Definition `Pipeline script from SCM` 선택
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/798bc931_image.png]]
    
    - pipeline 스크립트를 jenkins 파일 형식으로 작성하기위해 remote repository를 설정 합니다.
    - 젠킨스 대시보드에서 작성 할 수 도 있지만 원할한 소스 관리를 위해 통합해서 작성합니다.
    - 예시프로젝트 [http://git.any-ev.com/ev/cicdsample.git](http://git.any-ev.com/ev/cicdsample.git) 의 깃 주소를 입력하고 repository에 맞는 credential을 찾아서 등록합니다.
    - credential이란 간단히 설명해서 git랩으로 부터 소스를 체크아웃 하기 위해 미리 gitlab의 계정정보(access-key 방식 혹은 ssh-key 방식)를 등록해두는것이라고 생각하시면 됩니다.
    - 현재는 jenkins라는 계정을 gitlab에 등록하여 이미 credential을 만들어 두었습니다.
    - 'gitlab credential jenkins'키워드로 검색해보시면 됩니다.
3. Build 브랜치 설정, script path 지정, lightweight checkout 해제

![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/360c6957_image.png]]

- git parameter BRANCH를 이용해서 체크아웃 브랜치를 설정 합니다.
- 고급설정에서 브랜치 필터를 걸 수 도 있습니다.스크립트 패스를 소스 기준 최상단에 적용하였기에 jenkinsfile로 직접 접근 합니다.
- 추후에 운영과 개발 스테이징과 같은 deploy 환경이 여러개일 경우'deploy/jenkins_dev','deploy/jenkins_ops','deploy/jenkins_stg' 형태로 분기하면서 관리 할 수 있습니다.
1. 저장 후 job 생성 확인
    - 대시보드로 돌아가면 정상적으로 생성된것을 확인 할 수 있습니다.
    
    ```bash
    # 도커 관련 플러그인
    Docker, Docker Commons, Docker Pipeline, Docker API, docker-build-step
    
    # gitlab 관련 플러그인
    Git, Git client, Git Parameter, GitLab, GitLab API, GitLab Authentication
    
    # 젠킨스 사각화 플러그인
    pipeline-stage-view 
    ```
    

#### 2. 젠킨스 deploy 방법 (JenkinsFile 작성)

- 각각의 파이프라인 스테이지에서 ci cd 작업을 진행합니다.

1. Build

- jenkins 스크립트를 scm에서 읽어 옵니다.

2. Pull Code

- scm에서 코드를 pull 합니다.

3. Buid Code by Gradle

- 코드를 ./gradlew 빌드를 진행합니다.

4. DockerFile Build

- 빌드 완료 후 jib을 이용해 실행 도커 이미지를 만들며 만들어진 도커이미지를 프라이빗 도커허브에 deploy합니다.

5. Deploy Container to DeployServer

- 프라이빗 도커레포지토리에서 4.에서 빌드된 도커이미지를 pull하여 새로운 deploy container를 배포합니다.

```bash
def mainDir="./"
def nexusUrl="{도커 이미지를 푸시할 Nexus 레지스트리 URL}"
def repository="{도커 이미지를 저장할 레지스트리의 저장소 이름}"
def deployHost="{배포할 원격 서버의 IP 주소}"
def deployHostPort= "{원격 서버로 접근할 때 사용할 포트 (SSH 접속 포트)}"
def deployUser="{원격 서버에 접근할 사용자 계정}"
def TAGNAME="{도커 이미지의 버전}"
def nexusId="{넥서스 ID}"
def nexusPw="{넥서스 PW}"
def containerName="{도커 컨테이너 이름}"
def localRoot="{도커 컨테이너에서 로컬에 매핑할 로그 디렉토리}"
def remoteRoot="{도커 컨테이너 내부에서 로그가 저장될 디렉토리}"
def backupRoot="{기존 로그 파일을 백업할 디렉토리}"
def dockerNetwork="{도커 컨테이너가 연결될 네트워크 이름}"
def localUserGroup="{도커 컨테이너 실행 시 사용할 사용자와 그룹 ID}"

// Using git within checkout
pipeline {
    agent any # 어떤 노드에서든 작업을 실행할 수 있도록 설정
     stages { # 파이프라인의 단계 정의 
            stage('Build') {
                 steps {
                     echo "${BRANCH}" # 현재 브랜치 출력
                     echo "${TAGNAME}" # 현재 태그 출력
                     echo "CSMS - WS CI/CD 시작" # 빌드 프로세스 시작을 알림
                 }
             }
            stage('Pull Codes from Gitlab'){ # gitlab에서 최신 코드를 가져온다.
                steps{
                    echo "Gitlab에서 코드 pull"
                    checkout scm
                }
            }
            stage('Build Codes by Gradle') { # 그래들을 사용하여 프로젝트 코드를 클린 빌드한다.
                steps {
                   echo "그래들 빌드중............"
                    sh """
                    cd ${mainDir}
                    ./gradlew clean build
                    """
                }
            }
            # 넥서스에 로그인한 후, 도커 이미지를 두 개의 태그로 빌드해 푸시한다. 
            # 하나는 특정 버전(${TAGNAME})이고, 다른 하나는 최신(latest) 태그입니다.
            stage(' Build Docker Image by Jib & Push to Nexus Registry') {
                        steps {
                            echo "도커이미지 빌드중............"
                            echo "이미지 이름 : ${nexusUrl}/${repository}:${TAGNAME}"

                            sh """
                                cd ${mainDir}
                                docker login -u ${nexusId} -p ${nexusPw} ${nexusUrl}
                                ./gradlew jib -Djib.to.image=${nexusUrl}/${repository}:${TAGNAME} -Djib.console='plain';
                                ./gradlew jib -Djib.to.image=${nexusUrl}/${repository}:latest -Djib.console='plain'
                            """
                        }
            }
            stage('Deploy container to DeployServer'){
                        steps{
                            echo "도커 run ......................"
                            sshagent(credentials : ["{젠킨스 ssh-key ID}"]) { # ssh로 원격 서버에 접속

                                sh"""
                                 ssh -o StrictHostKeyChecking=no ${deployUser}@${deployHost} -p ${deployHostPort} \ 
                                 'docker login -u ${nexusId} -p ${nexusPw} ${nexusUrl}; \ # 원격 서버에서 넥서스 로그인
                                  docker stop ${containerName}; \ # 실행 중인 도커 컨테이너 중지
                                  docker rm ${containerName}; \ # 실행 중인 도커 컨테이너 삭제
                                  docker rmi ${nexusUrl}/${repository}:latest; \ # 기존의 최신 도커 이미지 삭제
                                  mkdir -p ${localRoot}; \ # 로그 디렉토리 생성
                                  mkdir -p ${backupRoot}; \ # 백업 디렉토리 생성
                                  
                                  # 현재 로그 파일을 압축해 백업 디렉토리로 이동
                                  cd ${localRoot}; \ 
                                  tar -czvf ws-log-\$(date + '%y%m%d%H%M').tar.gz *; \
                                  mv *.tar.gz ${backupRoot}; \
                                  
                                  # 기존 로그 파일을 삭제
                                  rm -rf ${localRoot}/*; \
                                  
                                  # 새로운 도커 컨테이너를 원격 서버에서 실행
                                  # 로그 디렉토리를 로컬과 매핑하여, 지정된 네트워크에 연결
                                  docker run -d -p 48090:8080  --user ${localUserGroup} -v ${localRoot}:${remoteRoot} -t --network ${dockerNetwork} --name ${containerName} ${nexusUrl}/${repository}:latest;'
                                 """
                            }
                        }
                    }
      }
   }

```

**예시**

```bash
# 예시
def mainDir="./"
def nexusUrl="repo.any-ev.com"
def repository="ws-container-registry"
def deployHost="192.168.0.41"
def deployHostPort= "22"
def deployUser="evdev"
def TAGNAME="1.0.1"
def nexusId="[NEXUS_ID]"
def nexusPw="[NEXUS_PWD]"
def containerName="csms-ws"
def localRoot="/home/evdev/deploy/log/csms-ws"
def remoteRoot="/logs"
def backupRoot="/home/evdev/deploy/log/backup/csms-ws"
def dockerNetwork="ev-network"
def localUserGroup="1003:1003"

// Using git within checkout
pipeline {
    agent any
     stages {
            stage('Build') {
                 steps {
                     echo "${BRANCH}"
                     echo "${TAGNAME}"
                     echo "CSMS - WS CI/CD 시작"
                 }
             }
            stage('Pull Codes from Gitlab'){
                steps{
                    echo "Gitlab에서 코드 pull"
                    checkout scm
                }
            }
            stage('Build Codes by Gradle') {
                steps {
                   echo "그래들 빌드중............"
                    sh """
                    cd ${mainDir}
                    ./gradlew clean build
                    """
                }
            }
            stage(' Build Docker Image by Jib & Push to Nexus Registry') {
                        steps {
                            echo "도커이미지 빌드중............"
                            echo "이미지 이름 : ${nexusUrl}/${repository}:${TAGNAME}"

                            sh """
                                cd ${mainDir}
                                docker login -u ${nexusId} -p ${nexusPw} ${nexusUrl}
                                ./gradlew jib -Djib.to.image=${nexusUrl}/${repository}:${TAGNAME} -Djib.console='plain';
                                ./gradlew jib -Djib.to.image=${nexusUrl}/${repository}:latest -Djib.console='plain'
                            """
                        }
            }
            stage('Deploy container to DeployServer'){
                        steps{
                            echo "도커 run ......................"
                            sshagent(credentials : ["jenkins-ed25519"]) {

                                sh"""
                                 ssh -o StrictHostKeyChecking=no ${deployUser}@${deployHost} -p ${deployHostPort} \
                                 'docker login -u ${nexusId} -p ${nexusPw} ${nexusUrl}; \
                                  docker stop ${containerName}; \
                                  docker rm ${containerName}; \
                                  docker rmi ${nexusUrl}/${repository}:latest; \
                                  mkdir -p ${localRoot}; \
                                  mkdir -p ${backupRoot}; \
                                  cd ${localRoot}; \
                                  tar -czvf ws-log-\$(date + '%y%m%d%H%M').tar.gz *; \
                                  mv *.tar.gz ${backupRoot}; \
                                  rm -rf ${localRoot}/*; \
                                  docker run -d -p 48090:8080  --user ${localUserGroup} -v ${localRoot}:${remoteRoot} -t --network ${dockerNetwork} --name ${containerName} ${nexusUrl}/${repository}:latest;'
                                 """
                            }
                        }
                    }
      }
   }

```

## 5. 넥서스(CD) 설정

- publlic 도커hub를 이용하지 않고 private docker repository를 구축하여 이용한다.

### 1. 넥서스 설치

---

**Nexus 디렉토리 구조**

```bash
   infra
     └── nexus
           ├── docker-compose.yml (생성필요)
           ├── Dockerfile (생성필요)
           ├── start.sh (생성필요)
           ├── nexus.crt (추후생성)
           └── volume (생성필요)
```

**Proxy 없이 vm 환경에서 구동되어야 하는 경우 https 설정**

- 목적 : Jenkins에서 Nexus를 Docker Registry로 사용할 때 로그인시 연결 문제가 발생할 경우, 다음과 같은 방법으로 해결한다.
- 현재 프로젝트는 vm 형태가 아닌 Nginx 프록시를 이용하기 때문에 굳이 설정할 필요는 없다.

---

#### 1. Docker를 이용한 Nexus 설치

- Jenkins가 버전이 업데이트가 된 이후로 부터 HTTP만으로의 Docker Registry로의 로그인이 안되는 문제가 발생했다.
- 여러 검증 결과, HTTP만으로는 진행이 불가 하기 때문에, 인증서를 적용한 HTTPS를 이용해서 Docker Registry로의 로그인을 구현하고자 한다.
- 인증서를 적용한 HTTPS를 이용해서 Docker Registry로의 로그인 구현 방법은 다음과 같은 절차로 진행하면 된다.
- Docker 컨테이너 Push/Pull을 암호화 해서 처리하기 위해서는 반드시 HTTPS 방식으로 처리하는게 중요하기 때문에 이번에 같이 적용하면 계속 HTTPS로 사용가능하다.
- Nexus에서 인증서 적용하여 HTTPS로 Docker Registry 로그인 및 컨테이너 이미지 관리를 위해 다음과 같이 Dockerfile을 변경한다.
- 추가 Script를 Docker Build시 포함 할 수 있도록 적용한다.

1. infra/nexus 폴더 생성
    
    ```bash
    $ cd ~/infra # 'infra' 디렉토리로 이동
    $ mkdir nexus # 'nexus' 디렉토리 생성
    $ cd nexus # 'nexus' 디렉토리로 이동
    ```
    
2. 도커 파일 (Dockerfile) 작성
    
    ```bash
    $ vim Dockerfile # Dockerfile 생성 및 작성
    ```
    
    **Dockerfile**
    
    ```bash
    FROM sonatype/nexus3:3.32.0
     
    USER root
     
    RUN chown -R nexus:nexus ${NEXUS_HOME}/etc \
        && sed '/^application-port/s:$:\napplication-port-ssl=8443:' -i ${NEXUS_HOME}/etc/nexus-default.properties \
        && sed '/^nexus-args/s:$:,${jetty.etc}/jetty-https.xml:' -i ${NEXUS_HOME}/etc/nexus-default.properties \
        && rm -rf ${NEXUS_HOME}/etc/ssl && ln -s ${NEXUS_DATA}/etc/ssl ${NEXUS_HOME}/etc/ssl
     
    COPY start.sh /usr/local/bin
     
    USER nexus
     
    EXPOSE 8443
     
    CMD start.sh
    ```
    
3. 도커 컴포즈 (docker-compose) 작성
    
    ```bash
    $ vim docker-compose.yml # docker-compose.yml 생성 및 작성
    ```
    
    **docker-compose.yml**
    
    ```bash
    version: '3.9'
    services:
      nexus:
        build:
          context: .
          dockerfile: Dockerfile
        image: any-ev_nexus:myversion
        container_name: 'nexus'
        user: root
        restart: always
        ports:
          - 18081:8081
          - 15443:5443
        volumes:
          - './volume/nexus-data:/nexus-data'
        environment:
          TZ: 'Asia/Seoul'
          SAN_DNS: 'nexus'
        networks:
          - ev-network
    networks:
      ev-network:
        external: true
    ```
    
4. 스크립트 파일 (`start.sh`) 작성
    
    ```bash
    $ vim start.sh
    ```
    

**start.sh**

```bash
if [ ! -e "$NEXUS_DATA/etc/ssl/keystore.jks" ]; then
mkdir -p "$NEXUS_DATA/etc/ssl"
chmod go-rwx "$NEXUS_DATA/etc/ssl"
keytool -genkeypair -keystore $NEXUS_DATA/etc/ssl/keystore.jks -storepass password -keypass password \
        -alias jetty -keyalg RSA -keysize 2048 -validity 5000 \
        -dname "CN=*.${HOSTNAME}, OU=FastCampus, O=FastCampus, L=Gangnam, ST=Seoul, C=KR" \
        -ext "SAN=DNS:${SAN_DNS}" -ext "BC=ca:true"
fi

sh -c ${SONATYPE_DIR}/start-nexus-repository-manager.sh

```

1. 스크립트파일 실행권한부여 및 파일생성 현황 확인
    
    ```bash
    $ chmod +x start.sh 
    $ ls -al
    ```
    
2. nexus 도커 컴포즈 실행
    
    ```bash
    $ docker-compose up -d
    ```
    
3. 초기 비밀번호 찾기
    
    ```bash
    # nexus 서버 접속
    $ docker exec -it nexus /bin/bash
    
    # 비밀번호 찾기
    $ cd /nexus-data
    $ ls -al
    $ cat admin.password
    ```
    
4. 찾은 비밀번호로 nexus 웹사이트에 접속하여 로그인 후 수정
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/0a090229_image.png]]
    

### 2. Blob Store + Repositories 생성

1. `톱니바퀴(설정)` > `Blob Stores` > `Create Blob Stroe`
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/c9fdabc0_image.png]]
    
2. 아래 이미지와 같이 Blob Store를 생성
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/0c7d97da_image.png]]
    
3. `Repositories` > `Create repository`
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/acd7da1f_image.png]]
    
4. `docker (hosted)`
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/b1c9d40d_image.png]]
    
5. 아래 이미지와 같이 Repositories를 생성
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/fca453b1_image.png]]
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/f8df666a_image.png]]
    
    ![[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/첨부/81027ad7_image.png]]
    

### 3. 인증서 Export

---

- Nexus 컨테이너에서 HTTPS용도로 사용할 인증서를 생성하고 Export 해야한다.
- 해당 인증서는 오직 현재 서버(VM)위에서 기동중인 Nexus 컨테이너의 Docker Registry를 연결할 때만 사용해야 한다.
1. Nexus에서 내장되어 있는 `keytool`을 이용해서 `nexus.crt`라는 Nexus 인증서를 생성후 Export 한다.
    - 인증서명은 nexus.crt로 생성된다.
    
    ```bash
    $ docker exec nexus keytool -printcert -sslserver 127.0.0.1:8443 -rfc | tee nexus.crt
    -----BEGIN CERTIFICATE-----
    MIIDpzCCAo+gAwIBAgIECefZAjANBgkqhkiG9w0BAQsFADBxMQswCQYDVQQGEwJL
    ... 중략 ...
    tLLOW1jWZibfItnWEePdaeer7DNxDoOPONdO
    -----END CERTIFICATE-----
    ```
    
2. 생성된 nexus.crt 인증서 내용을 확인한다.
    - 출력된 내역중 CN, DNS등의 정보가 입력된 정보 (FastCampus, Private DNS 도메인명) 과 동일한 값이 입력이 되었으면 정상적으로 인증서가 생성된 것이다.
    
    ```bash
    $ openssl x509 -in nexus.crt -text |grep -i ' cn\|dns\|before'  -2
    ```
    

### 4. 인증서 Import

---

- 해당 인증서를 서버(VM) 내에 Import해서 인증서를 활성화 하고, Nexus에 적용할 수 있도록 nexus.crt파일을 설정한다.

```bash
$ sudo cp -av nexus.crt  /usr/local/share/ca-certificates/nexus.crt
$ sudo update-ca-certificates
```

- Docker Registory 접속할 때에도 인증서를 참조할 수 있도록 Docker 디렉토리 아래 서버(VM)의 프라이빗 ip dns 이름 및 5443 포트의 디렉토리를 생성한다.
- nexus.crt 인증서를 복사해 CA인증서로 등록한다.

```bash
$ sudo mkdir /etc/docker/certs.d/<Nexus VM의 프라이빗 ip dns 이름>\:5443/ -p
$ sudo cp -av nexus.crt /etc/docker/certs.d/<Nexus VM의 프라이빗 ip dns 이름>\:5443/ca.crt
```

### 5. Deploy VM로컬에서 Nexus Docker Registry로의 로그인 테스트

- Deploy VM 서버 로컬에서 Nexus 서버에 있는 nexus.crt 인증서를 복사하여 Jenkins 서버에 붙여넣기하여 파일을 생성한다.

```bash
$ vi nexus.crt
-----BEGIN CERTIFICATE-----
MIIDpzCCAo+gAwIBAgIECefZAjANBgkqhkiG9w0BAQsFADBxMQswCQYDVQQGEwJL
... 중략 ...
tLLOW1jWZibfItnWEePdaeer7DNxDoOPONdO
-----END CERTIFICATE-----
```

- Docker Registory 접속할 때에도 인증서를 참조할 수 있도록 Docker 디렉토리 아래 서버(VM)의 프라이빗 ip dns 이름 및 5443 포트의 디렉토리를 생성한다.
- nexus.crt 인증서를 복사해 CA인증서로 등록한다.

```bash
$ sudo mkdir /etc/docker/certs.d/{Nexus 도메인 주소}\:5443/ -p
$ sudo cp -av nexus.crt /etc/docker/certs.d/{Nexus 도메인 주소}\:5443/ca.crt

# 예시
# 포트는 nexus 사이트에서 repositories 생성시 설정한 HTTP PORT를 넣은것이다.
# 5443으로 설정한 경우 5443으로 기입해주면 된다.
$ sudo mkdir /etc/docker/certs.d/repo.any-ev\:5443/ -p
$ sudo cp -av nexus.crt /etc/docker/certs.d/repo.any-ev\:5443/ca.crt
```

- Nexus Docker Registry로의 로그인을 다음과 같이 수행한다.
- URL 입력시 반드시 Nexus VM의 Private DNS 도메인명으로 입력한다.
- 포트는 nexus 사이트에서 repositories 생성시 설장한 HTTP 포트 5443으로 설정한다.
- test 계정의 ID 및 Password를 입력한다.

```bash
$ docker login -u '{Nexus 로그인 계정 ID}' -p '{Nexus 로그인 계정 Password}' https://{Nexus 도메인 주소}:{nexus에서 설정한 http port}

# 예시
$ docker login -u 'admin' -p 'a1234' https://repo.any-ev:5443
```

- Login Succeeded가 출력되면 정상적으로 Nexus Docker Registry에 로그인이 된것이다.

## 6. Redis 설치

---

**Redis 디렉토리 구조**

```bash
   infra
     └── jenkins
           ├── docker-compose.yml (생성필요)
           ├── Dockerfile (생성필요)
           └── volume (생성필요)
```

1. infra/jenkins 폴더 생성
    
    ```bash
    $ cd ~/infra # 'infra' 디렉토리로 이동
    $ mkdir redis # 'redis' 디렉토리 생성
    $ cd redis # 'redis' 디렉토리로 이동
    ```
    
2. 도커 컴포즈 (docker-compose) 작성
    
    ```bash
    $ cd ~/infra # 'infra' 디렉토리로 이동
    $ mkdir redis # 'redis' 디렉토리 생성
    $ vim docker-compose.yml # docker-compose.yml 생성 및 작성
    ```
    

**docker-compose.yml**

```bash
version: '3.7'
services:
  redis:
    image: redis:alpine # 경량화된 Alpine 기반의 Redis 이미지 사용
    container_name: ev_redis # 컨테이너 이름을 'ev_redis'로 설정
    command : redis-server --requirepass redis_evdev12! --port 6379 # Redis 서버를 시작할 때 비밀번호와 포트 설정
    ports:
      - '41006:6379' # 로컬 호스트의 41006 포트를 Redis의 기본 포트 6379로 매핑
    volumes:
      - './volume/data:/data' # Redis의 데이터 저장소를 호스트와 공유하여 데이터가 영구 저장되도록 설정
      - './volume/conf/redis.conf:/usr/local/conf/redis.conf' # 사용자 정의 Redis 설정 파일을 컨테이너와 공유
    restart: always # 컨테이너가 종료되면 항상 재시작하도록 설정
    deploy:
      resources:
        limits:
          memory: 8gb # Redis가 사용할 메모리 제한을 8GB로 설정
    networks:
      - ev-network # 외부 네트워크 'ev-network'에 연결하여 다른 컨테이너와 통신 가능하게 함
networks:
  ev-network:
    external: true # 'ev-network'라는 외부 네트워크를 사용하여 여러 서비스와 연결

```

1. 도커 컴포즈 실행
    
    ```bash
    $ docker-compose up -d
    ```
    
2. 컨테이너 실행 확인
    
    ```bash
    $ docker ps
    ```
    
3. 레디스 접속
    
    ```bash
    $ docker exec -it {컨테이너명} /bin/sh # /bin/sh 안돼면 /bin/bash 로 변경
    
    # 예시
    $ docker exec -it redis /bin/sh
    ```
    
4. 레디스 cli 접속
    
    ```bash
    $ redis-cli
    ```
    
5. 비밀번호 입력
    - 비밀번호 설정 위치 : docker-compose.yml에 --requirepass "비밀번호”
    
    ```bash
    $ auth {비밀번호}
    ```
    
6. 연결 확인
    - 명령어 입력 후 "pong"이 출력되면 정상
    
    ```bash
    $ ping
    ```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발서버 구축 가이드 (WAS·Docker·Nginx)/개발서버 구축 가이드 (WAS·Docker·Nginx)|개발서버 구축 가이드 (WAS·Docker·Nginx)]]
