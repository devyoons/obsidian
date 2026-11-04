---
별칭:
  - "강의 - Element.classList"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/78afa2dde42f4c909be6da7eee6113ef
---

# 강의: Element.classList

## 강의 내용

---

---

## **Element.classList**

- **`Element.classList`**는 엘리먼트의 클래스 속성의 컬렉션인 활성 **`DOMTokenList`**를 반환하는 읽기 전용 프로퍼티이다.
- **`classList`** 사용은 공백으로 구분된 문자열인 **`element.className`**을 통해 엘리먼트의 클래스 목록에 접근하는 방식을 대체하는 간편한 방법이다.
- 만약 클래스 속성이 설정되어 있지 않거나 비어있다면 **`elementClasses.length`**는 0을 반환한다.
- `add()`와 `remove()`메서드를 이용하여 변형할 수 있다.

### 메소드

**`add( String [, String [, ...]] )`**

- 지정한 클래스 값을 추가한다. 만약 추가하려는 클래스가 엘리먼트의 `class` 속성에 이미 존재한다면 무시한다.

**`remove( String [, String [, ...]] )`**

- 지정한 클래스 값을 제거한다.

**`item( Number )`**

- 컬렉션의 인덱스를 이용하여 클래스 값을 반환한다.

**`toggle( String [, force] )`**

- 하나의 인수만 있을 때: 클래스 값을 토글링한다. 즉, 클래스가 존재한다면 제거하고 `false`를 반환하며, 존재하지 않으면 클래스를 추가하고 `true`를 반환한다.
- 두번째 인수가 있을 때: 두번째 인수가 `true`로 평가되면 지정한 클래스 값을 추가하고 `false`로 평가되면 제거한다.

**`contains( String )`**

- 지정한 클래스 값이 엘리먼트의 `class` 속성에 존재하는지 확인한다.

**`replace( oldClass, newClass )`**

- 존재하는 클래스를 새로운 클래스로 교체한다.

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
