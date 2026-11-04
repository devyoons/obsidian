---
별칭:
  - "학습 - @builder"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/bee0977eba5d4b2bb852d0e463808e74
---

# 학습: @builder

## 세부 내용

**`@Builder`** 어노테이션을 사용하여 생성자에 매개변수를 설정하는 방식으로, 객체를 생성하고 필드 값을 설정할 수 있습니다. **`@Builder`** 어노테이션을 사용하면 별도로 getter와 setter 메서드를 생성하지 않아도 됩니다.

예를 들어, 다음과 같이 **`FieldAndUserInfoResponse`** 클래스를 생성할 수 있습니다:

```java
import lombok.Builder;

public class FieldAndUserInfoResponse {
    private String userName;
    private String fieldName;
    private String webAdminType;
    private String fieldId;

    @Builder
    public FieldAndUserInfoResponse(String userName, String fieldName, String webAdminType, String fieldId) {
        this.userName = userName;
        this.fieldName = fieldName;
        this.webAdminType = webAdminType;
        this.fieldId = fieldId;
    }
}
```

그리고 이제 다음과 같이 **`builder()`** 메서드를 통해 객체를 생성하고 필드 값을 설정할 수 있습니다:

```java
FieldAndUserInfoResponse fieldAndUserInfo 
													= FieldAndUserInfoResponse.builder()
                                            .userName("홍길동")
                                            .fieldName("서비스팀")
                                            .webAdminType("타입A")
                                            .fieldId("12345")
                                            .build();
```

위의 코드를 통해 **`FieldAndUserInfoResponse`** 객체를 생성하고 필드 값을 설정할 수 있습니다. **`@Builder`** 어노테이션을 사용하면 생성자를 통해 필드 값을 설정할 수 있으므로 별도의 getter와 setter 메서드를 생성하지 않아도 됩니다. 이로 인해 코드가 더 간결하고 가독성이 향상됩니다.

## 관련 노트

- 상위: [[02 - 학습/IT/업무 공통 기술 메모/소스분석/소스분석|소스분석]]
