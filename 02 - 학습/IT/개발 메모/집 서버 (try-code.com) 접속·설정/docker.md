---
별칭:
  - "학습 - docker"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/d39495edc96e41569e5643e7d47d15b5
---

# 학습: docker

## 세부 내용

```
[도커 설치]

- 리눅스의 응용 프로그램들을 프로세스 격리 기술들을 사용해 컨테이너로 실행하고 관리하는 오픈 소스 프로젝트

우분투 시스템 패키지 업데이트
sudo apt-get update

필요한 패키지 설치
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

Docker의 공식 GPG키를 추가
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

시스템 패키지 업데이트
sudo apt-get update

Docker 설치
sudo apt-get install docker-ce docker-ce-cli containerd.io
# 위 명령어가 에러가나서 찾아보니 우분투에서는 도커 설치 명령어를 제공한다고함
sudo apt install -y docker.io nfs-common dnsutils curl
> 참고 http://3.36.24.220/topic/1472/sudo-apt-get-install-docker-ce-docker-ce-cli-containerd-io-docker-compose-plugin-%EC%84%A4%EC%B9%98-%EC%8B%9C-%EC%98%A4%EB%A5%98/3

도커 실행상태 확인
sudo systemctl status docker

[도커 컴포즈 설치]
도커 컴포즈(docker-compose)

- 여러 개의 도커 컨테이너를 하나의 어플리케이션을 구성하기 위해 사용

도커 컴포즈 설치
sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

도커 컴포즈 권한 부여
sudo chmod +x /usr/local/bin/docker-compose

심볼릭 링크 연결
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

![[02 - 학습/IT/개발 메모/집 서버 (try-code.com) 접속·설정/첨부/6bf3dfa9_image.png]]

[https://github.com/occidere/TIL/issues/116](https://github.com/occidere/TIL/issues/116)

- `sudo` 로 `docker-compose up -d` 해야함

![[02 - 학습/IT/개발 메모/집 서버 (try-code.com) 접속·설정/첨부/9173805d_image.png]]

- 네트워크 생성

```bash
$ sudo docker network create ev-network
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/집 서버 (try-code.com) 접속·설정/집 서버 (try-code.com) 접속·설정|집 서버 (try-code.com) 접속·설정]]
