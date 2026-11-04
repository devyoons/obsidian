---
별칭:
  - "강의 - DTO 관련 (lombok설치)"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/15afec5334d64855b578b8a2635aaa5f
---

# 강의: DTO 관련 (lombok설치)

## 강의 내용

---

---

### 기본생성자, 파라미터 생성자 어노테이션

<aside>
📌 **boilerplate code 반복되는 지겨운 코드에서 벗어나기!**

</aside>

- 롬복 dependency추가 및 설치
    1. **pom.xml 에 롬복 dependency 추가!**
        - lombok.jar 를 참조하지만 **IDE에도 lombok설치가 필수적이다.**
    
    ```xml
    <dependency>
    	<groupId>org.projectlombok</groupId>
    	<artifactId>lombok</artifactId>
    	<version>1.18.8</version>
    	<scope>provided</scope>
    </dependency>
    ```
    
    1. `C:\Users\사용자이름\.m2\repository\org\projectlombok\lombok\1.18.8` 경로에서 `.jar` 파일을 copy
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/acd3b53b_Untitled.png]]
    
    ---
    
    1. `C:\dev\spring 3.9.18_kh\sts-bundle\sts-3.9.18.RELEASE` STS.exe가 있는 폴더에 위 복사한 내용을 붙여넣기한다.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/e52ecd20_Untitled.png]]
    
    ---
    
    1. cmd 를 열어준다.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/ce43852a_Untitled.png]]
    
    ---
    
    1. `java -jar lom` + `tab키 후 enter` → lombok installer 설치창이 뜬다.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a416efd6_Untitled.png]]
    
    ---
    
    1. 멍청해서 잘 찾지를 못함 Specify location…으로 STS 경로는 찾아준다. 
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a5899349_Untitled.png]]
    
    ---
    
    1. STS.ini 파일을보면 lombok 절대경로로 지정되어 있는데 위 설정을 함으로써 STS.ini파일에 저 코드가 추가가 된거고 STS실행시 같이 실행되도록하는것
    - ***절대경로로 되어 있으므로 추후 STS 경로가 바뀐다면 lombok실행안됌***
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/20c39222_Untitled.png]]
    
    STS 위치를 옮기면 절대경로로 되어있어서 lombok실행이 안됌. 주의!
    
    ---
    
    1. STS 를 껐다키면 적용이 됌. 리스타트말고 완전히 껐다 키자
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/4564a797_Untitled.png]]
    

`@Getter` : Getter 메소드를 생성해 준다.

`@Setter` : Setter 메소드를 생성해 준다.

`@NoArgsConstructor` : 파라미터가 없는 기본 생성자를 생성

`@AllArgsConstructor` : 모든 필드 값을 파라미터로 받는 생성자

`@ToString` : toString 메소드를 클래스 필드를 확인해서 적절히 만들어 준다.

`@EqualsAndHashCode` : equlas와 hashcode 메소드를 만들어 준다.

`@RequiredArgsConstructor` : 어노테이션은 `final`이나 `@NonNull`인 필드 값만 파라미터로 받는 생성자
`@Delegate` : 한 클래스에 다른 클래스의 메소드를 위임.

`@Data` : 클래스안의 모든 private 필드에 대해 `@Getter`와 `@Setter`를 적용하여 세터/게터를 만들어주고 클래스내에 `@ToString` 과 `@EqualsAndHashCode`를 적용시켜 메소드를 오버라이드 해주며 `@RequiredArgsConstructor`를 지정해 준다.

예시

```java
package com.kh.spring.demo.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Dev {
	private int no;
	private String name;
	private int career;
	private String email;
	private Gender gender;
	private String[] lang;
	private LocalDateTime createdAt;
}
```

[LocalDateTime](https://covenant.tistory.com/255)

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
