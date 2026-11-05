---
별칭:
  - "강의 - Maven Lifecycle"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/도구-기타
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/1bc55c9758424397a806770def0ceb7b
주제:
  - "[[00 - 대시보드/주제/개발 도구|개발 도구]]"
---

# 강의: Maven Lifecycle

## 강의 내용

- 목차

## Maven이란

### Plugin:Goal

<aside>
💡 Maven은 여러 plug-in으로 구성되어 있으며, 각 plug-in은 여러 goal을 수행할 수 있다. goal은  Maven의 실행단위이다.

</aside>

- 메이븐은 플러그인을 구동해주는 프레임워크(plugin execution framework)이다. 모든 작업은 플러그인에서 수행한다.
- 플러그인은 다른 산출물(artifacts)와 같이 저장소에서 관리된다.
- 메이븐은 여러 플러그인으로 구성되어 있으며, 각각의 플러그인은 하나 이상의 goal(명령, 작업)을 포함하고있다.
    
    [](https://t1.daumcdn.net/cfile/tistory/99989C3E5A533FC31E)
    
- 플러그인과 골의 조합으로 실행한다. ex. `mvn <plugin>:<goal>` = `mvn archetype:generate`
- 메이븐은 여러 goal을 묶어서 lifecycle phases 로 만들고 실행한다. ex. `mvn <phase>` = `mvn install`

[[02 - 학습/KH 교육과정 2022/수업 필기/Maven Lifecycle/플러그인 목록/플러그인 목록|플러그인 목록]]

## 실행 Phase

### Phase

1. clean
2. default
3. site

![[02 - 학습/KH 교육과정 2022/수업 필기/Maven Lifecycle/첨부/c69cfc19_Untitled.png]]

default phase 에 대한 다이어그램이다.

### clean

빌드 시 생성되었던 산출물을 삭제

1. pre-clean : clean 작업 전에 사전작업
2. `clean` : 이전 빌드에서 생성된 모든 파일 삭제
3. post-clean : 사후작업

### default

프로젝트 배포절차, 패키지 타입별로 다르게 정의됨.

1. `validate` : 프로젝트 상태 점검, 빌드에 필요한 정보 존재유무 체크
2. initialize : 빌드 상태를 초기화, 속성 설정, 작업 디렉터리 생성
3. generate-sources : 컴파일에 필요한 소스 생성
4. process-sources : 소스코드를 처리
5. generate-resources : 패키지에 포함될 자원 생성
6. `compile` : 프로젝트의 소스코드를 컴파일
7. process-classes : 컴파일 후 후처리
8. generate-test-source : 테스트를 위한 소스 코드를 생성
9. process-test-source : 테스트 소스코드를 처리
10. generate-test-resources : 테스팅을 위한 자원 생성
11. process-test-resources : 테스트 대상 디렉터리에 자원을 복사하고 가공
12. test-compile : 테스트 코드를 컴파일
13. process-test-classes : 컴파일 후 후처리
14. `test` : 단위 테스트 프레임워크를 이용해 테스트 수행
15. prepare-package : 패키지 생성 전 사전작업
16. `package` : 개발자가 선택한 war, jar 등의 패키징 수행
17. pre-integration-test : 통합테스팅 전 사전작업
18. `integration-test` : 통합테스트
19. post-integration : 통합테스팅 후 사후작업
20. `verify` : 패키지가 품질 기준에 적합한지 검사
21. `install` : 패키지를 로컬 저장소에 설치
22. `deploy` : 패키지를 원격 저장소에 배포

### site

프로젝트 문서화 절차

1. pre-site : 사전작업
2. site : 사이트문서 생성
3. post-site : 사후작업 및 배포 전 사전작업
4. site-deploy : 생성된 문서를 웹 서버에 배포

## See Also

[maven (메이븐 구조, 차이점, 플러그인, 라이프사이클, 의존성, pom.xml)](https://sjh836.tistory.com/131)

[egovframework:dev:dep:build:maven [eGovFrame]](https://www.egovframe.go.kr/wiki/doku.php?id=egovframework:dev:dep:build:maven)

[Maven Lifecycle and Basic Maven Commands - GeeksforGeeks](https://www.geeksforgeeks.org/maven-lifecycle-and-basic-maven-commands/amp/)

## 하위 노트

- [[02 - 학습/KH 교육과정 2022/수업 필기/Maven Lifecycle/플러그인 목록/플러그인 목록|플러그인 목록]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
