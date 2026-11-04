---
별칭:
  - "학습 - nexus"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/24a83854fdea4c678a4b1d54aa816003
---

# 학습: nexus

## 세부 내용

서버 접속

```bash
docker exec -it nexus /bin/bash
```

```bash
cd /nexus-data
ls -al
cat admin.password
```

`8443` 포트는 일반적으로 **HTTPS** 통신에 사용되는 포트입니다. `443` 포트가 기본 HTTPS 포트이지만, 많은 애플리케이션에서 `8443` 포트를 대신 사용하기도 합니다. 이 포트는 주로 **SSL/TLS**를 통해 보안이 설정된 HTTP 연결(HTTPS)을 처리하는 데 사용됩니다.

해당 설정에서 `8443`은 Nexus Repository의 HTTPS 통신을 위한 포트로 사용되고 있습니다. 구체적으로는:

- **`application-port-ssl=8443`**: Nexus 애플리케이션이 HTTPS를 통해 연결을 받을 때 사용하는 포트가 `8443`임을 설정합니다.
- **`jetty-https.xml`**: Nexus의 내장 웹 서버인 Jetty에서 HTTPS를 설정할 때 사용하는 구성 파일로, 이를 통해 SSL/TLS를 활성화하게 됩니다.

따라서 이 설정은 Nexus Repository에 HTTPS 연결을 활성화하고, 그 연결을 `8443` 포트에서 처리하도록 구성하는 내용입니다.

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/집 서버 (try-code.com) 접속·설정/집 서버 (try-code.com) 접속·설정|집 서버 (try-code.com) 접속·설정]]
