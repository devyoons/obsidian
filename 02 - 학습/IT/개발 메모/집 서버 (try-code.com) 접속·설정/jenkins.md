---
별칭:
  - "학습 - jenkins"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/7c20e7d2533a4fd1a04cea48e9f90396
---

# 학습: jenkins

## 세부 내용

초기 비밀번호 찾기

```bash
sudo docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

![[02 - 학습/IT/개발 메모/집 서버 (try-code.com) 접속·설정/첨부/8f9cc103_image.png]]

accessToken

```bash
glpat-FJhN_DpvGH-x5HjP15Jy
```

[[ERROR] Jenkins Failed to connect to repository : Error performing git command: git ls-remote -h](https://minholee93.tistory.com/entry/ERROR-Jenkins-Failed-to-connect-to-repository-Error-performing-git-command-git-ls-remote-h)

#### 젠킨스 서버에 keygen 발급

```bash
$ sudo docker exec -it jenkins bash
$ cd /var/jenkins_home
$ ssh-keygen -t rsa
$ ssh-copy-id -i /var/jenkins_home/.ssh/id_rsa.pub -p {gitlab-ssh-port} {jenkins}@{배포서버IP}

#예시
$ ssh-copy-id -i /var/jenkins_home/.ssh/id_rsa.pub -p 20022 yoon@110.9.24.96
```

[젠킨스 서버 SSH Key 생성 & 등록](https://parkhyeokjin.github.io/devops/2020/10/14/JekinsSshConfigure.html)

- ssh 접속 되는지 확인
    - 

```bash
$ ssh -i id_rsa -p20022 yoon@110.9.24.96
```

[[Jenkins] Jenkins GitLab 연동(3) Jenkins와 GitLab 연동-1](https://not-to-be-reset.tistory.com/334)

- **1. docker binary 설치**

[[Jenkins] Jenkins GitLab 연동(2) Jenkins 설치 및 Jenkins 설정](https://not-to-be-reset.tistory.com/333)

- jenkins 서버에서 docker ps 오류 안나게 연결

[[Jenkins] Jenkins GitLab 연동(2) Jenkins 설치 및 Jenkins 설정](https://not-to-be-reset.tistory.com/333)

- `permission denied` 오류
    
    `/var/run/docker.sock`에 접근할 때 여전히 `permission denied` 오류가 발생한다면, 아래 단계를 따라 다시 한 번 확인해 보세요.
    
    ### 1. **Docker 소켓 파일 권한 확인**
    
    1.1. **권한 및 소유자 확인**
    
    ```bash
    ls -l /var/run/docker.sock
    ```
    
    결과가 `srw-rw---- 1 root docker`와 같이 나와야 합니다. 권한이 `660`, 소유자가 `root`, 그룹이 `docker`이어야 합니다.
    
    1.2. **권한 조정**
    
    권한이 잘못되어 있다면 다음 명령어로 수정합니다.
    
    ```bash
    sudo chgrp docker /var/run/docker.sock
    sudo chmod 660 /var/run/docker.sock
    ```
    
    ### 2. **Docker 그룹 확인**
    
    2.1. **`docker` 그룹 정보 확인**
    
    ```bash
    getent group docker
    ```
    
    이 명령어는 `docker` 그룹의 정보를 보여줍니다. 그룹 ID와 사용자 목록을 확인합니다.
    
    2.2. **Jenkins 사용자를 `docker` 그룹에 추가**
    
    Jenkins 사용자가 `docker` 그룹에 포함되어 있는지 확인하고, 포함되지 않은 경우 추가합니다.
    
    ```bash
    sudo usermod -aG docker jenkins
    ```
    
    이후, Jenkins 컨테이너를 재시작합니다.
    
    ```bash
    docker-compose restart jenkins
    ```
    
    또는, Docker를 사용하지 않는 경우:
    
    ```bash
    docker restart jenkins
    ```
    
    ### 3. **컨테이너 내부에서 권한 확인**
    
    3.1. **Jenkins 컨테이너에 접속**
    
    ```bash
    docker exec -it jenkins bash
    ```
    
    3.2. **컨테이너 내에서 Docker 소켓 확인**
    
    ```bash
    ls -l /var/run/docker.soc
    ```
    
    컨테이너 내에서 Docker 소켓의 권한이 `srw-rw----`로 설정되어 있는지 확인합니다.
    
    ### 4. **Docker 서비스 상태 확인**
    
    4.1. **Docker 서비스가 실행 중인지 확인**
    
    ```bash
    sudo systemctl status docker
    ```
    
    Docker 서비스가 정상적으로 실행되고 있는지 확인합니다.
    
    4.2. **Docker 데몬 로그 확인**
    
    Docker 데몬의 로그를 확인하여 문제가 발생한 원인을 파악합니다.
    
    ```bash
    sudo journalctl -u docker
    ```
    
    ### 5. **Jenkins 권한 및 설정 확인**
    
    5.1. **Jenkins 사용자의 권한 확인**
    
    Jenkins 사용자가 Docker 그룹에 포함되어 있는지 확인합니다.
    
    ```bash
    id jenkins
    ```
    
    Jenkins 사용자가 `docker` 그룹에 포함되어 있어야 합니다.
    
    5.2. **Jenkins 컨테이너의 사용자 설정 확인**
    
    컨테이너 내에서 Docker 명령어를 실행하여 권한 문제가 해결되었는지 확인합니다.
    
    ```bash
    docker exec -it jenkins docker ps
    ```
    
    이 단계를 순서대로 확인하고 조치를 취한 후에도 문제가 해결되지 않으면, Docker와 Jenkins의 설정 및 로그를 재검토하여 추가적인 오류 메시지를 찾아보는 것도 도움이 될 수 있습니다.
    
- 위 permisstion denied 오류 해결방법을 했는데 안됐음. 보니까 group id가 달랐음
    
    ![[02 - 학습/IT/개발 메모/집 서버 (try-code.com) 접속·설정/첨부/af1fd124_image.png]]
    
    ### 문제 해결 방법
    
    1. **호스트 머신에서 Docker 그룹 ID 확인**
        
        호스트 머신에서 `docker` 그룹의 그룹 ID를 확인합니다.
        
        ```bash
        getent group docker
        ```
        
        예를 들어, 결과가 `docker:x:1001:jenkins`인 경우, 그룹 ID가 `1001`입니다.
        
    2. **Jenkins 컨테이너의 Docker 그룹 ID 확인**
        
        Jenkins 컨테이너 내에서 `docker` 그룹의 그룹 ID를 확인합니다.
        
        ```bash
        docker exec -it jenkins cat /etc/group | grep docker
        ```
        
        이 결과에서 그룹 ID가 호스트 머신의 `docker` 그룹과 일치하는지 확인합니다.
        
    3. **호스트 머신에서 Docker 그룹 ID 조정**
        
        호스트 머신에서 `docker` 그룹의 ID를 조정하여 컨테이너와 일치하도록 합니다.
        
        **주의:** 그룹 ID를 변경하면 시스템의 다른 사용자와 서비스에 영향을 줄 수 있습니다. 조심해서 진행하세요.
        
        ```bash
        sudo groupmod -g 125 docker
        ```
        
        위 명령어는 `docker` 그룹의 그룹 ID를 `125`로 변경합니다.
        
    4. **컨테이너에서 Docker 그룹 ID 재설정**
        
        컨테이너를 재시작하여 변경된 그룹 ID가 반영되도록 합니다.
        
        ```bash
        docker-compose restart jenkins
        ```
        
        또는, Docker를 사용하지 않는 경우:
        
        ```bash
        docker restart jenkins
        ```
        
    5. **Docker 소켓의 그룹 재설정**
        
        Docker 소켓의 그룹을 다시 설정합니다.
        
        ```bash
        sudo chgrp docker /var/run/docker.sock
        ```
        
        그룹 ID가 올바르게 설정된 후, `chmod` 명령어로 권한을 조정합니다.
        
        ```bash
        sudo chmod 660 /var/run/docker.soc
        ```
        
    6. **Jenkins 컨테이너 내에서 권한 확인**
        
        Jenkins 컨테이너 내에서 Docker 명령어를 다시 실행하여 권한 문제가 해결되었는지 확인합니다.
        
        ```bash
        docker exec -it jenkins docker ps
        ```
        
    
    이 단계를 통해 호스트 머신과 Jenkins 컨테이너 간에 Docker 그룹 ID를 일치시켜 권한 문제를 해결할 수 있습니다. 그룹 ID를 조정한 후에도 문제가 계속되면, Docker와 Jenkins의 로그를 확인하여 추가적인 오류 메시지를 검토하는 것도 도움이 될 수 있습니다.
    

```bash
jenkins@3393c00b0fda:~/.ssh$ ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/var/jenkins_home/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /var/jenkins_home/.ssh/id_rsa
Your public key has been saved in /var/jenkins_home/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:GBZQ5l/hQQ79DggzhpA6wUPBjNnsEJIXqdHef/i6iyc jenkins@3393c00b0fda
The key's randomart image is:
+---[RSA 3072]----+
|OX+=.++ .o+      |
|O=B .o=. +.o     |
| X.. .++ .+.     |
|+ o .. +... .    |
| .   ...S  o     |
|      o .   .    |
|       o         |
|    E.. .        |
|    .o++         |
+----[SHA256]-----+

jenkins@3393c00b0fda:~/.ssh$ ssh-copy-id -i /var/jenkins_home/.ssh/id_rsa.pub -p 51022 jenkins@110.9.24.96
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/var/jenkins_home/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed

/usr/bin/ssh-copy-id: ERROR: ssh: connect to host 110.9.24.96 port 51022: Connection refused

jenkins@3393c00b0fda:~/.ssh$ ssh-copy-id -i /var/jenkins_home/.ssh/id_rsa.pub -p 51022 jenkins@192.168.45.73
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/var/jenkins_home/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed

/usr/bin/ssh-copy-id: ERROR: ssh: connect to host 192.168.45.73 port 51022: Connection timed out

jenkins@3393c00b0fda:~/.ssh$ ssh-copy-id -i /var/jenkins_home/.ssh/id_rsa.pub -p 20022 yoon@110.9.24.96
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/var/jenkins_home/.ssh/id_rsa.pub"
The authenticity of host '[110.9.24.96]:20022 ([110.9.24.96]:20022)' can't be established.
ED25519 key fingerprint is SHA256:cgmN+piwQlhXcXyJr2ZZGcPU01UUesM/Ts0IoB0j00U.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys

 .-') _      ('-.         .-') _  _ .-') _     ('-.         .-') _
(  OO) )    ( OO ).-.    ( OO ) )( (  OO) )   ( OO ).-.    ( OO ) )
/     '._   / . --. /,--./ ,--,'  \     .'_   / . --. /,--./ ,--,'      ,--.  ,-.-')
|'--...__)  | \-.  \ |   \ |  |\  ,`'--..._)  | \-.  \ |   \ |  |\  .-')| ,|  |  |OO)
'--.  .--'.-'-'  |  ||    \|  | ) |  |  \  '.-'-'  |  ||    \|  | )( OO |(_|  |  |  \
   |  |    \| |_.'  ||  .     |/  |  |   ' | \| |_.'  ||  .     |/ | `-'|  |  |  |(_/
   |  |     |  .-.  ||  |\    |   |  |   / :  |  .-.  ||  |\    |  ,--. |  | ,|  |_.'
   |  |     |  | |  ||  | \   |   |  '--'  /  |  | |  ||  | \   |  |  '-'  /(_|  |
   `--'     `--' `--'`--'  `--'   `-------'   `--' `--'`--'  `--'   `-----'   `--'

yoon@110.9.24.96's password:

```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/집 서버 (try-code.com) 접속·설정/집 서버 (try-code.com) 접속·설정|집 서버 (try-code.com) 접속·설정]]
