---
별칭:
  - "서버 - Intellij 로컬 도커로 실행 설정"
태그:
  - type/server
  - context/work
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/진행중/안전톡/안전톡 (스마트 건설현장 플랫폼)|안전톡 (스마트 건설현장 플랫폼)]]"
환경: 
노션원본: https://www.notion.so/3e924612498b8028a8e3f461c54b0250
---

# 서버: Intellij 로컬 도커로 실행 설정

## 내용

### 시작하기 전에

**이 설정은 무엇인가요?**

IntelliJ 의 Docker Compose 실행 설정을 이용해서, 로컬에서 nginx + 백엔드(`safety-back`) + 프론트엔드(`safety-web` / `safety-mng` / `safety-wrk` 중 하나)를 한 번에 켜고 끌 수 있게 만드는 설정입니다.

**무엇이 달라지나요?**

- 기존: 로컬에서 nginx 설정 파일의 포트번호를 직접 수정한 뒤 실행해야 했습니다.
- 변경 후: nginx 설정 파일을 수정할 필요 없이, IntelliJ 에서 실행(▶) / 종료만 하면 됩니다.

**어떻게 동작하나요?**

- nginx 컨테이너가 80 포트로 요청을 받아서 `/api/` 는 백엔드로, 그 외(`/`)는 실행 중인 프론트엔드로 전달합니다.
- 프론트엔드는 어떤 것을 켜든 `safety-front-container` 라는 같은 이름으로 nginx 에 연결되기 때문에, 켜는 프론트가 바뀌어도 nginx 설정은 그대로입니다.
- 실행 후 `http://localhost` 로 접속하면 됩니다.

**사전 준비**

- Docker Desktop 설치 및 실행
- IntelliJ 에 Docker 플러그인 활성화 (Settings → Plugins)

아래 1~4번에서 필요한 파일을 만들고, 5번에서 IntelliJ 실행 설정을 등록합니다.

### 1. nginx 설정 파일 생성

- 최상위 프로젝트에 `.docker/` 경로를 만들고 `nginx.conf` 파일을 생성합니다.
    
    ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/e3542597_image.png]]
    

**경로:** `.docker/nginx.conf`

```
events {
    worker_connections 1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;

    sendfile        on;
    keepalive_timeout  65;
    charset utf-8;

    server {
        listen       80;
        server_name  localhost;

        # 한글깨짐 방지
        charset utf-8;

        # 백엔드 API 서버 요청 처리
        location ^~ /api/ {
            proxy_pass http://safety-back-container:8080/api/;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;

            # Authorization 헤더 포함되도록 명시적으로 추가
            proxy_pass_header Authorization;
            proxy_set_header Authorization $http_authorization;

            client_max_body_size 100M;

            # CORS 설정 추가
            add_header Access-Control-Allow-Origin *;
            add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS, DELETE, PUT';
            add_header Access-Control-Allow-Headers 'Content-Type, Authorization, X-Requested-With';
        }

        # 프론트엔드 서버 요청 처리 (어떤 프론트엔드를 켜든 내부 포트 8080으로 통일)
        location / {
            proxy_pass http://safety-front-container:8080;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            client_max_body_size 100M;
        }

        # 웹한글기안기 서버 요청 시 리다이렉트
        location = /webhwpctrl {
            return 301 $scheme://$host$request_uri/;
        }

        # 웹한글기안기 서버를 프록시 처리
        location ^~ /webhwpctrl/ {
            proxy_pass http://222.234.222.224:8080/webhwpctrl/;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto https;
            proxy_set_header X-Forwarded-Port $server_port;
            client_max_body_size 100M;
        }

        # AI Chat 리다이렉트
        location = /puz {
            return 301 $scheme://$host$request_uri/;
        }

        # AI Chat 프록시 처리
        location ^~ /puz/ {
            proxy_pass http://115.89.221.210:13838/;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto https;
            proxy_set_header X-Forwarded-Port $server_port;
            client_max_body_size 100M;
        }
    }
}
```

### 2. 각 프로젝트 Dockerfile.local 생성

- `back`, `mng`, `wrk`, `web` 프로젝트 루트에 각각 `Dockerfile.local` 파일을 생성합니다.
    
    ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/071b6062_image.png]]
    

**경로:** `safety-back/Dockerfile.local`, `safety-mng/Dockerfile.local`, `safety-wrk/Dockerfile.local`, `safety-web/Dockerfile.local`

```docker
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# 호스트에서 새로 빌드한 JAR를 이미지 생성 시점에 포함 (마운트 캐시 문제 방지)
COPY build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
```

### 3. 최상위 build.gradle 수정

- 최상위 프로젝트의 `build.gradle`에서 각 서브 모듈의 JAR 파일명을 `프로젝트명.jar`(예: `safety-wrk.jar`)로 고정합니다. `tasks.named('bootJar')` 블록이 추가된 부분입니다.
    
    ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/ddd7647e_image.png]]
    

```groovy
subprojects {
    apply plugin: 'java'
    apply plugin: 'java-library'
    apply plugin: 'org.springframework.boot'
    apply plugin: 'io.spring.dependency-management'

    repositories {
        mavenCentral()
    }

    ext['testcontainers.version'] = '1.20.4'

    dependencies {

        compileOnly 'org.projectlombok:lombok'
        annotationProcessor 'org.projectlombok:lombok'

        // JWT
        implementation 'io.jsonwebtoken:jjwt-api:0.11.2'
        runtimeOnly 'io.jsonwebtoken:jjwt-impl:0.11.2'
        runtimeOnly 'io.jsonwebtoken:jjwt-jackson:0.11.2'

        // LocalDateTime 직렬화
        implementation 'com.fasterxml.jackson.datatype:jackson-datatype-jsr310:2.15.2'

        // AOP
        implementation 'org.springframework.boot:spring-boot-starter-aop'

        // logback 제외
        implementation 'com.fasterxml.jackson.dataformat:jackson-dataformat-yaml'
        implementation 'org.springframework.boot:spring-boot-starter-log4j2'
        implementation 'org.slf4j:slf4j-api:2.0.13'
        modules {
            module("org.springframework.boot:spring-boot-starter-logging") {
                replacedBy("org.springframework.boot:spring-boot-starter-log4j2", "Use Log4j2 instead of Logback")
            }
        }
    }

    // 각 서브 모듈의 JAR 파일명을 프로젝트명.jar (예: safety-wrk.jar) 로 고정 << 이 부분 추가
    tasks.named('bootJar') {
        archiveFileName = "${project.name}.jar"
    }
}
```

### 4. docker-compose.local.yml 생성

- 최상위 프로젝트에 `docker-compose.local.yml` 파일을 생성합니다.
    
    ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/dd19236c_image.png]]
    

**경로:** `docker-compose.local.yml`

```yaml
services:
  local-nginx:
    image: nginx:alpine
    container_name: local-nginx-container
    ports:
      - "80:80"
    volumes:
      - ./.docker/nginx.conf:/etc/nginx/nginx.conf:ro
    extra_hosts:
      - "host.docker.internal:host-gateway"
    depends_on:
      - safety-back
    networks:
      - awa-network

  safety-back:
    build:
      context: ./safety-back
      dockerfile: Dockerfile.local
    container_name: safety-back-container
    environment:
      - SPRING_PROFILES_ACTIVE=local
      - SERVER_PORT=8080
      - API_BASE_URL=http://safety-back-container:8080
    ports:
      - "9090:8080"
    networks:
      - awa-network
    restart: always

  # ----------------------------------------------------
  # 프론트엔드 서비스들 (컨테이너 이름과 내부 포트 8080으로 통일)
  # ----------------------------------------------------
  safety-web:
    build:
      context: ./safety-web
      dockerfile: Dockerfile.local
    container_name: safety-web-container
    profiles: ["web"]
    environment:
      - SPRING_PROFILES_ACTIVE=local
      - SERVER_PORT=8080  # 내부 포트 통일
      - API_BASE_URL=http://safety-back-container:8080
    ports:
      - "9093:8080"
    networks:
      awa-network:
        aliases:
          - safety-front-container
    restart: always

  safety-mng:
    build:
      context: ./safety-mng
      dockerfile: Dockerfile.local
    container_name: safety-mng-container
    profiles: ["mng"]
    environment:
      - SPRING_PROFILES_ACTIVE=local
      - SERVER_PORT=8080  # 내부 포트 통일
      - API_BASE_URL=http://safety-back-container:8080
    ports:
      - "8091:8080"
    networks:
      awa-network:
        aliases:
          - safety-front-container
    restart: always

  safety-wrk:
    build:
      context: ./safety-wrk
      dockerfile: Dockerfile.local
    container_name: safety-wrk-container
    profiles: ["wrk"]
    privileged: true
    user: "1001:3000"
    environment:
      - SPRING_PROFILES_ACTIVE=local
      - SERVER_PORT=8080  # 내부 포트 통일
      - API_BASE_URL=http://safety-back-container:8080
    ports:
      - "8092:8080"
    networks:
      awa-network:
        aliases:
          - safety-front-container
    restart: always

networks:
  awa-network:
    name: awa-network
    driver: bridge
```

### 5. Intellij Docker compose 실행 설정

1. 우측 상단 실행 구성 드롭다운을 클릭한 뒤 **Edit Configurations...** 를 선택합니다.
    
    ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/e8c33b31_image.png]]
    
2. 좌측 상단의 **+ (Add New Configuration)** 를 클릭하고 **Docker → Docker Compose** 를 선택합니다.
    
    ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/0b9b4201_image.png]]
    
3. **Name** 에 구분하기 쉬운 이름을 입력합니다. (예: `safety-local-web`)
    
    ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/f03d113f_image.png]]
    
4. **Compose files** 에 최상위 프로젝트의 `docker-compose.local.yml` 을 지정합니다.
    
    ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/df3ee5e2_image.png]]
    
    ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/7e631401_image.png]]
    
5. **Services** 에 실행할 서비스를 지정합니다. 프론트엔드는 `profiles` 로 나뉘어 있고 컨테이너 이름이 같아서 하나만 선택해야 합니다.
    - 공통: `local-nginx`, `safety-back`
    - 프론트: `safety-web` / `safety-mng` / `safety-wrk` 중 하나
        
        ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/370be453_image.png]]
        
        ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/677acee3_image.png]]
        
6. **Before launch** 의 **+ → Run Gradle task** 에 `bootJar` 를 추가합니다. Dockerfile.local 이 `build/libs/*.jar` 를 복사하므로 JAR 를 먼저 빌드해야 합니다.
    
    ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/75d96263_image.png]]
    
    ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/f6c8dbb9_image.png]]
    
    ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/bf9f7315_image.png]]
    
7. **Before launch** 의 + **→ Run External Tool → + →** 아래와 같이 설정 정보를 입력합니다.
    - Name : Docker Down
    - Program: docker
    - Arguments: compose -f docker-compose.local.yml down local-nginx safety-back safety-web safety-mng safety-wrk
    - Working directory: + → Macros 에서 ProjectFileDir 선택 → Insert → OK
        
        ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/2272e83e_image.png]]
        
        ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/d98d682f_image.png]]
        
8. **Apply → OK** 를 누른 뒤 상단의 실행(▶) 버튼으로 실행합니다.
    
    ![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/b9cb2a72_image.png]]
    
9. 실행 후 `http://localhost` 로 접속해서 확인합니다.

#### 6. 알림서버도 안전톡 프로젝트 설정과 동일하게 docker 설정

- build.gradlle 수정

```jsx
plugins {
    id 'java'
    id 'org.springframework.boot' version '3.3.2'
    id 'io.spring.dependency-management' version '1.1.4'
}

group = 'kr.co.awa'
version = '0.0.1-SNAPSHOT'

java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(21)
    }
}

configurations {
    compileOnly {
        extendsFrom annotationProcessor
    }
}

repositories {
    mavenCentral()
}

ext {
    set('springCloudVersion', "2023.0.2") // Spring Cloud 호환 버전
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web'
    implementation 'org.springframework.boot:spring-boot-starter-validation'
    compileOnly 'org.projectlombok:lombok'
    developmentOnly 'org.springframework.boot:spring-boot-devtools'
    runtimeOnly 'org.mariadb.jdbc:mariadb-java-client'
    implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:3.0.3'
    implementation 'org.bgee.log4jdbc-log4j2:log4jdbc-log4j2-jdbc4.1:1.16'
    annotationProcessor 'org.projectlombok:lombok'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
    testRuntimeOnly 'org.junit.platform:junit-platform-launcher'

    implementation 'org.springdoc:springdoc-openapi-starter-webmvc-ui:2.0.2'

    implementation 'org.mybatis:mybatis-typehandlers-jsr310:1.0.2'

    // logback 제외
    implementation 'com.fasterxml.jackson.dataformat:jackson-dataformat-yaml'
    implementation 'org.springframework.boot:spring-boot-starter-log4j2'
    implementation 'org.slf4j:slf4j-api:2.0.13'
    modules {
        module("org.springframework.boot:spring-boot-starter-logging") {
            replacedBy("org.springframework.boot:spring-boot-starter-log4j2", "Use Log4j2 instead of Logback")
        }
    }

    // Feign Client
    implementation 'org.springframework.cloud:spring-cloud-starter-openfeign'

    // Firebase Admin SDK (FCM용)
    implementation 'com.google.firebase:firebase-admin:9.2.0'

    // JSON 처리용 Jackson
    implementation 'com.fasterxml.jackson.core:jackson-databind'

    // 이메일
    implementation 'org.springframework.boot:spring-boot-starter-mail'
    implementation 'org.springframework.boot:spring-boot-starter-thymeleaf'
    implementation 'nz.net.ultraq.thymeleaf:thymeleaf-layout-dialect'
}

dependencyManagement {
    imports {
        mavenBom "org.springframework.cloud:spring-cloud-dependencies:${springCloudVersion}"
    }
}

// 이 부분 추가
bootJar {
    archiveFileName = 'awa-alim.jar'
}

tasks.withType(JavaCompile).configureEach {
    options.compilerArgs += ["-parameters"]
}

tasks.named('test') {
    useJUnitPlatform()
}

```

- docker-compose-local.yml 생성

```jsx
version: '3.8'

services:
  awa-alim:
    build:
      context: .
      dockerfile: Dockerfile
    environment:
      - SPRING_PROFILES_ACTIVE=local
      - SERVER_PORT=8080
    ports:
      - "9088:8080"
    volumes:
      - /home/awasoft/logs/alim:/logs
```

![[03 - 프로젝트/진행중/안전톡/서버정보/첨부/2b52f2a1_image.png]]

## 관련 노트

- 상위: [[03 - 프로젝트/진행중/안전톡/안전톡 v2 - 개발·배포·회의록 (2025~)|안전톡 v2 - 개발·배포·회의록 (2025~)]]
- 프로젝트: [[03 - 프로젝트/진행중/안전톡/안전톡 (스마트 건설현장 플랫폼)|안전톡 (스마트 건설현장 플랫폼)]]
