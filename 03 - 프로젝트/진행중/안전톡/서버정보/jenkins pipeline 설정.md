---
별칭:
  - "서버 - jenkins pipeline 설정"
태그:
  - type/server
  - context/work
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/진행중/안전톡/안전톡 (스마트 건설현장 플랫폼)|안전톡 (스마트 건설현장 플랫폼)]]"
환경: 
노션원본: https://www.notion.so/1c724612498b80009311f76f7bdaf3cb
---

# 서버: jenkins pipeline 설정

## 내용

---

- awasoft dev 서버
    
    
    | 내부 IP&PORT | 192.168.0.10:22 |
    | --- | --- |
    | 외부 IP | 115.89.221.210 |
    | ID | awasoft |
    | PW | awasoft12! |
    
1. ssh nas서버 접속
    
    
    | 내부 IP&PORT | 192.168.0.97:22 |
    | --- | --- |
    | 외부 IP | 115.89.221.210 |
    | PORT | 40004 |
    | ID | yoo123_ |
    | PW | 1234 |
    
    ```bash
    $ ssh yoo123_@115.89.221.210 -p 40004
    
    #비밀번호 입력
    1234
    ```
    

1. jenkins 컨테이너에 접속하여 SSH Key 생성
    
    ```bash
    # jenkins 컨테이너에 접속
    $ sudo docker exec -it jenkins bash
    
    # SSH key 생성할 디렉토리로 이동
    $ cd /var/jenkins_home
    
    # SSH Key 발급
    $ ssh-keygen -t rsa
    Generating public/private rsa key pair.
    Enter file in which to save the key (/var/jenkins_home/.ssh/id_rsa): # 엔터
    Created directory '/var/jenkins_home/.ssh'.
    Enter passphrase (empty for no passphrase): # 엔터
    Enter same passphrase again: # 엔터
    Your identification has been saved in /var/jenkins_home/.ssh/id_rsa
    Your public key has been saved in /var/jenkins_home/.ssh/id_rsa.pub
    The key fingerprint is:
    SHA256:K9q/0B1JL4VOZ2ssMQvPCTkKHwO8NSgTb6zLW7w/wUM jenkins@jenkins
    The key's randomart image is:
    +---[RSA 3072]----+
    |  .o..           |
    |  ooo.o  . .     |
    |   o=oo.= * +    |
    |   o.oE+ X % .   |
    |  .  oo S @ =    |
    | . o  +. o =     |
    |  o o ooo .      |
    |   o +.o         |
    |  . o.ooo.       |
    +----[SHA256]-----+
    ```
    
2. 생성한 SSH Key를 원격 서버에 복사하여 등록합니다.
    
    ```bash
    # 현재 jenkins 컨테이너 서버
    $ cat ~/.ssh/id_rsa.pub
    
    # 위 명령어를 입력하여 key 내용을 복사합니다.
    ssh-rsa ----... 생략
    
    #jenkins 컨테이너에서 나갑니다.
    $ exit
    
    #해당 원격 서버에 복사한 공개키를 "authorized_keys" 폴더로 생성해줍니다.
    $ vim ~/.ssh/authorized_keys
    ```
    
3. jenkins 컨테이너에서 원격서버에 ssh 접속이 잘되는지 확인합니다.
    
    ```bash
    $ sudo docker exec -it jenkins bash
    $ ssh -i ~/.ssh/id_rsa -p40004 yoo123_@115.89.221.210
    ```
    

1. gitea accessToken 발급
    
    
    | accessToken | 4cef205a4a0852705fbce5add8f0f0af95448ce5 |
    | --- | --- |
    - gitea admin 계정에서 `설정` → `애플리케이션` → `토큰명입력` → `amdin 읽기 & 쓰기선택` → 생성
    - ** 생성된 키는 한번만 확인할 수 있으므로 잘 복사해둡니다.
        
        ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/cf20603f_image.png]]
        
    
    - jenkins → `jenkins관리` → `Credentials` → `global` → `add credentials`
        
        ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/fc5989be_image.png]]
        
    - `Gitea Personal Access Token` 선택 후 gitea에서 발급 받은 accessToken을 붙여넣어줍니다.
        
        ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/2864c3ee_image.png]]
        

[CI/CD 구축 - 2. Jenkins 와 Gitea 연동](https://velog.io/@thdrldud369/CICD-%EA%B5%AC%EC%B6%95-2.-Jenkins-%EC%99%80-Gitea-%EC%97%B0%EB%8F%99)

- SSH agent 플러그인 설치

[SSH Agent Plugin in Jenkins](https://junhyunny.github.io/information/jenkins/ssh-agent-plugin-in-jenkins/)

- 한 item에 job 여러개

[[Jenkins] 멀티모듈 파이프 라인 (feat. Jenkinsfile)](https://spring91.tistory.com/m/34)

## 관련 노트

- 상위: [[03 - 프로젝트/진행중/안전톡/안전톡 v2 - 개발·배포·회의록 (2025~)|안전톡 v2 - 개발·배포·회의록 (2025~)]]
- 프로젝트: [[03 - 프로젝트/진행중/안전톡/안전톡 (스마트 건설현장 플랫폼)|안전톡 (스마트 건설현장 플랫폼)]]
