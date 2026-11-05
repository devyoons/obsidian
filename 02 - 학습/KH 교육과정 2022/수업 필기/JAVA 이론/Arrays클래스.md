---
별칭:
  - "강의 - Arrays클래스"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/87fe2b910b8f4172ad8c11eb9bbb46fa
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: Arrays클래스

## 강의 내용

## 배열의 비교와 출력 - equals(), toString()

#### toString()

```java
1차원배열 int[] arr = {1, 2, 3, 3};
2차원배열 int[][] arr2D = {{11, 12},{21, 22}};

1차원배열 System.out.println(Arrays.toString(arr));
2차원배열 System.out.println(Arrays.deepToString(arr2D));
```

#### equals()

```java
String[][] str2D = new String[][]{{"aaa","bbb"},{"AAA","BBB"}};
String[][] str2D2 = new String[][]{{"aaa","bbb"},{"AAA","BBB"}};

두 배열이 같은지 비교하려면

System.out.println(Arrays.equals(str2D, str2D2)); //false 배열이 2차원인데 1차원비교를해서 
System.out.println(Arrays.deepEquals(str2D, str2D2)); // true
```

#### 배열의 복사 - copyOf(), copyOfRange()

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/c34f35a3_Untitled.png]]

#### 배열의 정렬 - sort()

```java
int[] arr = {3, 2, 0, 1, 4};
Arrays.sort(arr); // 배열 arr을 정렬한다.
System.out.print(Arrays.toString(arr)); // [0, 1, 2, 3, 4]
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
