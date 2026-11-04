---
별칭:
  - "서버 - Untitled"
태그:
  - type/server
  - context/work
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/진행중/안전톡/안전톡 (스마트 건설현장 플랫폼)|안전톡 (스마트 건설현장 플랫폼)]]"
환경: 
노션원본: https://www.notion.so/1c824612498b805eac7ec5a001a4a2a1
---

# 서버: Untitled

## 내용

ssh [yoon@110.9.24.96](mailto:yoon@110.9.24.96) -p 20022
Xksekswl!

jenkins

admin admin12!

gitea 

admin admin12!

[[Git] 기존 프로젝트에 git repository 연결하는 법](https://hyunee-p.tistory.com/134)

gitea에서 발급한 accesstoekn

```jsx
d2442ca4bb0435405496ac38deca4bc1f6c9464a
```

- awa : jenkins-access-token
    
    ```jsx
    a6476e6d5de57c6218bcd61898e9041912d612e1
    ```
    

- 참고 블로그
    
    [Spring boot 프로젝트 Jenkins CI/CD 구축기 (with Gitea)](https://velog.io/@bk87/Spring-boot-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-Jenkins-CICD-%EA%B5%AC%EC%B6%95%EA%B8%B0)
    
    [[CI/CD] [2. 연동] 젠킨스(Jenkins) 서버와 git 연동을 해보자. (feat. Gitea)](https://bongra.tistory.com/454)
    

- 
- ssh 관련
    
    [Jenkins 에서 SSH Server 등록 및 Spring Boot 서비스 배포 관련 내용 정리](https://ssow93.tistory.com/67#google_vignette)
    
    [[Jenkins] 젠킨스 sshkey 발급법(Publish over SSH 설정)](https://velog.io/@sunblock99/Jenkins-%EC%A0%A0%ED%82%A8%EC%8A%A4-sshkey-%EB%B0%9C%EA%B8%89%EB%B2%95)
    

- jenkins 서버가 ssh 키 읽게 설정하는거
    
    ### **방법 2: SSH Config 파일 사용**
    
    1. **Jenkins 서버에 SSH 설정 파일을 추가**
        - `/home/jenkins/.ssh/config` 파일을 열어 아래와 같이 추가합니다.
    2. **파일 내용**
    
    ```
    sh
    복사편집
    Host gitserver
      HostName 110.9.24.96
      Port 20022
      User git
      IdentityFile /home/jenkins/.ssh/id_rsa  # SSH private key
    
    ```
    

- 빌드시 jdk 21 안돼는 오류
    
    [Jenkins JDK 21 빌드하기!](https://velog.io/@habins226/Jenkins-JDK-21-%EB%B9%8C%EB%93%9C%ED%95%98%EA%B8%B0)
    

- 도커 권한
    
    [Docker 권한추가](https://velog.io/@thdrldud369/%EA%B6%8C%ED%95%9C%EC%B6%94%EA%B0%80)
    

- 플러그인

Post build task

## 관련 노트

- 상위: [[03 - 프로젝트/진행중/안전톡/안전톡 v2 - 개발·배포·회의록 (2025~)|안전톡 v2 - 개발·배포·회의록 (2025~)]]
- 프로젝트: [[03 - 프로젝트/진행중/안전톡/안전톡 (스마트 건설현장 플랫폼)|안전톡 (스마트 건설현장 플랫폼)]]
