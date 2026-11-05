---
별칭:
  - "학습 - Git log 옵션 (1)"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/인프라
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/305babe7cdaf4069a35843aec7af1a97
주제:
  - "[[00 - 대시보드/주제/Git·GitHub|Git·GitHub]]"
---

# 학습: Git log 옵션 (1)

## 세부 내용

다양한 옵션을 통해 커밋 아이디 / 작성자 / 커밋 시간 / 커밋 등의 내용을 볼 수 있습니다.

1. `--pretty` : 로그가 보여지는 형식을 지정할 수 있습니다. (option: online, short, full, fuller, format)

```bash
$ git log --pretty=oneline 
```

- `oneline` : 커밋 내용을 한줄로 간략하게 볼 수 있습니다.
    
    ![[02 - 학습/IT/개인공부/git/첨부/fad526f5_Untitled.png]]
    

1. `--graph` : 로그를 그래프로 확인할 수 있습니다. 여러 브랜치가 존재하는 경우 브랜치 그래프가 표시됩니다.
    
```bash
$ git log --graph
```

- 브랜치가 1개인 경우

    ![[02 - 학습/IT/개인공부/git/첨부/41652ff3_Untitled.png]]

- 브랜치가 여러 개인 경우

    ![[02 - 학습/IT/개인공부/git/첨부/4d877e0b_Untitled.png]]


1. `--pretty=oneline --graph` : 동시에 사용하면 더 간결하게 로그를 확인할 수 있습니다.
    
```bash
$ git log --graph --pretty=oneline
```

![[02 - 학습/IT/개인공부/git/첨부/df09f5c2_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/IT/개인공부/git/git|git]]
