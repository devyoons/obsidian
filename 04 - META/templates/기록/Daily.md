---
tags:
  - type/daily
  - context/personal
날짜: <% tp.date.now("YYYY-MM-DD", 0, tp.file.title, "YYYY-MM-DD") %>
---


## 오늘 할 일
- [ ] [due:: <% tp.date.now("YYYY-MM-DD", 0, tp.file.title, "YYYY-MM-DD") %>]

### 진행 중인 할 일
```tasks
not done
starts before tomorrow
path includes 일일 기록
path does not include {{query.file.path}}
description regex matches /\S/
sort by due
hide toolbar
hide task count
hide postpone button
```

### 기간 할 일
- 

## 메모
- 

## 내일 할 일
- [ ] [due:: <% tp.date.now("YYYY-MM-DD", 1, tp.file.title, "YYYY-MM-DD") %>]
