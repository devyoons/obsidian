---
별칭:
  - "학습 - git 여러개 프로젝트 올리기"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/인프라
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/10d24612498b80f6822fd004a7b01d4c
주제:
  - "[[00 - 대시보드/주제/Git·GitHub|Git·GitHub]]"
---

# 학습: git 여러개 프로젝트 올리기

## 세부 내용

```bash
yoonseo@yoonseo MINGW64 /C/project/study (main)
$ git init
Reinitialized existing Git repository in C:/project/study/.git/

yoonseo@yoonseo MINGW64 /C/project/study (main)
$ git remote add origin git@github.com:yoonseo94/study.git
error: remote origin already exists.

yoonseo@yoonseo MINGW64 /C/project/study (main)
$ git remote add origin git@github.com:yoonseo94/study.git
error: remote origin already exists.

yoonseo@yoonseo MINGW64 /C/project/study (main)
$ git init
Initialized empty Git repository in C:/project/study/.git/

yoonseo@yoonseo MINGW64 /C/project/study (main)
$ git add 2024_09_vue_study/backend/
warning: in the working copy of '2024_09_vue_study/backend/.gitignore', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/backend/build.gradle', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/backend/gradle/wrapper/gradle-wrapper.properties', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/backend/gradlew', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/backend/settings.gradle', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/backend/src/main/java/com/net/demo/backend/BackendApplication.java', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/backend/src/main/resources/application.yml', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/backend/src/test/java/com/net/demo/backend/BackendApplicationTests.java', LF will be replaced by CRLF the next time Git touches it

yoonseo@yoonseo MINGW64 /C/project/study (main)
$ git add 2024_09_vue_study/frontend/
warning: in the working copy of '2024_09_vue_study/frontend/.gitignore', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/frontend/README.md', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/frontend/babel.config.js', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/frontend/jsconfig.json', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/frontend/package-lock.json', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/frontend/package.json', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/frontend/public/index.html', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/frontend/src/App.vue', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/frontend/src/components/Footer.vue', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/frontend/src/components/Header.vue', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/frontend/src/main.js', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2024_09_vue_study/frontend/vue.config.js', LF will be replaced by CRLF the next time Git touches it

yoonseo@yoonseo MINGW64 /C/project/study (main)
$ git commit -m "2024.09 vue study"
[main (root-commit) 49e1a01] 2024.09 vue study
 46 files changed, 13370 insertions(+)
 create mode 100644 2024_09_vue_study/backend/.gitignore
 create mode 100644 2024_09_vue_study/backend/build.gradle
 create mode 100644 2024_09_vue_study/backend/gradle/wrapper/gradle-wrapper.jar
 create mode 100644 2024_09_vue_study/backend/gradle/wrapper/gradle-wrapper.properties
 create mode 100644 2024_09_vue_study/backend/gradlew
 create mode 100644 2024_09_vue_study/backend/gradlew.bat
 create mode 100644 2024_09_vue_study/backend/settings.gradle
 create mode 100644 2024_09_vue_study/backend/src/main/java/com/net/demo/backend/BackendApplication.java
 create mode 100644 2024_09_vue_study/backend/src/main/java/com/net/demo/backend/controller/AccountController.java
 create mode 100644 2024_09_vue_study/backend/src/main/java/com/net/demo/backend/controller/CartController.java
 create mode 100644 2024_09_vue_study/backend/src/main/java/com/net/demo/backend/controller/ItemController.java
 create mode 100644 2024_09_vue_study/backend/src/main/java/com/net/demo/backend/entity/Cart.java
 create mode 100644 2024_09_vue_study/backend/src/main/java/com/net/demo/backend/entity/Item.java
 create mode 100644 2024_09_vue_study/backend/src/main/java/com/net/demo/backend/entity/Member.java
 create mode 100644 2024_09_vue_study/backend/src/main/java/com/net/demo/backend/repository/CartRepository.java
 create mode 100644 2024_09_vue_study/backend/src/main/java/com/net/demo/backend/repository/ItemRepository.java
 create mode 100644 2024_09_vue_study/backend/src/main/java/com/net/demo/backend/repository/MemberRepository.java
 create mode 100644 2024_09_vue_study/backend/src/main/java/com/net/demo/backend/service/JwtService.java
 create mode 100644 2024_09_vue_study/backend/src/main/java/com/net/demo/backend/service/JwtServiceImpl.java
 create mode 100644 2024_09_vue_study/backend/src/main/resources/application.yml
 create mode 100644 2024_09_vue_study/backend/src/test/java/com/net/demo/backend/BackendApplicationTests.java
 create mode 100644 2024_09_vue_study/frontend/.gitignore
 create mode 100644 2024_09_vue_study/frontend/README.md
 create mode 100644 2024_09_vue_study/frontend/babel.config.js
 create mode 100644 2024_09_vue_study/frontend/jsconfig.json
 create mode 100644 2024_09_vue_study/frontend/package-lock.json
 create mode 100644 2024_09_vue_study/frontend/package.json
 create mode 100644 2024_09_vue_study/frontend/public/favicon.ico
 create mode 100644 2024_09_vue_study/frontend/public/img/landscape-1315124_640.jpg
 create mode 100644 2024_09_vue_study/frontend/public/img/post-impressionist-1428128_640.jpg
 create mode 100644 2024_09_vue_study/frontend/public/img/vincent-van-gogh-85799_640.jpg
 create mode 100644 2024_09_vue_study/frontend/public/index.html
 create mode 100644 2024_09_vue_study/frontend/src/App.vue
 create mode 100644 2024_09_vue_study/frontend/src/assets/logo.png
 create mode 100644 2024_09_vue_study/frontend/src/components/Card.vue
 create mode 100644 2024_09_vue_study/frontend/src/components/Footer.vue
 create mode 100644 2024_09_vue_study/frontend/src/components/Header.vue
 create mode 100644 2024_09_vue_study/frontend/src/main.js
 create mode 100644 2024_09_vue_study/frontend/src/pages/Cart.vue
 create mode 100644 2024_09_vue_study/frontend/src/pages/Home.vue
 create mode 100644 2024_09_vue_study/frontend/src/pages/Login.vue
 create mode 100644 2024_09_vue_study/frontend/src/pages/Order.vue
 create mode 100644 2024_09_vue_study/frontend/src/scripts/lib.js
 create mode 100644 2024_09_vue_study/frontend/src/scripts/router.js
 create mode 100644 2024_09_vue_study/frontend/src/scripts/store.js
 create mode 100644 2024_09_vue_study/frontend/vue.config.js

yoonseo@yoonseo MINGW64 /C/project/study (main)
$ git remote add origin git@github.com:yoonseo94/study.git

yoonseo@yoonseo MINGW64 /C/project/study (main)
$ git push -u origin main
Enumerating objects: 78, done.
Counting objects: 100% (78/78), done.
Delta compression using up to 16 threads
Compressing objects: 100% (64/64), done.
Writing objects: 100% (78/78), 591.32 KiB | 2.74 MiB/s, done.
Total 78 (delta 5), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (5/5), done.
To github.com:yoonseo94/study.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.

```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
