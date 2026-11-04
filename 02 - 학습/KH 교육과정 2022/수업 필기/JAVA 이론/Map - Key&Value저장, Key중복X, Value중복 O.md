---
별칭:
  - "강의 - Map : Key&Value저장, Key중복X, Value중복 O"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/dd60d74e045e4deda296bc0e81a801af
---

# 강의: Map : Key&Value저장, Key중복X, Value중복 O

## 강의 내용

---

---

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/4b7095e6_Untitled.png]]

Map에는 Properties클래스도 존재한다.

### Map 인터페이스

- **키(Key)와 값(value)으로 구성된 객체를 저장**하는 구조
- **key(고유한 속성)는 중복될 수 없다** → 중복값 추가시 **기존key제거**(value는 중복되거나 말거나)
- Map컬렉션은 **키(Key)로 데이터를 관리**한다.
- 검색을 위한 자료 구조
- key를 이용하여 값을 저장하거나 검색, 삭제할 때 사용하면 편리함
- 대표적인 클래스 **HashMap, Hashtable, LinkedHashMap, TreeMap**
- 공통적으로 사용되는 주요 메서드 **put, get, remove, keySet**
- Map계열은 **Key가 어디에 있는지를 빨리 찾기 위한 구조**

<aside>
❓ K와 V는 기본자료형 (int, double, boolean 등)은 사용할 수 없고 **클래스나 인터페이스 타입만 사용이 가능**

</aside>

---

### HashMap?

**키(Key)**와 **값(value)**을 묶어 **하나의 데이터**로 저장한다. 키와 값은 **모두 객체**이다

해싱(Hashing)을 사용하여 많은 양의 데이터를 검색하는데 높은 성능을 보인다.

✏️많은 양의 데이터를 저장하는데 적합하다.

HashMap은 인덱스가 없다 → 인덱스가 없다는건 순서대로 접근할 수 없다

- KeySet : Key를 별도의 Set으로 반환
- entrySet : entry(Key, Value)를 별도의 Set으로 반환

<aside>
❓ 키(Key) 컬렉션 내의 저장된 값을 찾는데 사용되기 때문에 유일해야 한다(중복저장X)

값(value) 키(Key)와 달리 데이터의 중복을 허용한다.

</aside>

키가 중복되는 경우에는 기존에 있는 키에 해당하는 값을 덮어 쓴다.

---

### 생성자, 메소드 설명

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/e3a8dad1_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/8902f712_Untitled.png]]

---

## 🧐HashMap 선언하기

#### 1. HashMap 생성하기

```java
Map<K, V> map = new HashMap<K, V>(); 
														앞에 타입 명시했기 때문에 생략가능
```

#### 2. put : 키와 값 추가

```java
Map<Integer, String> map1 = new HashMap<>();
		map1.put(1, "홍길동");
		map1.put(2, "신사임당");
		map1.put(3, "세종대왕");

		System.out.println("map1 = " + map1);

//결과 
map1 = {1=홍길동, 2=신사임당, 3=세종대왕}
```

#### 3. get(K) : 지정된 키 값 리턴 → key로 value찾기

```java
Map<String, Object> map = new HashMap<String, Object>();

		map.put("Hello", "안녕하세요");
		map.put("num", 123);
		map.put("today", new Date());

		System.out.println(map.get("num"));
		System.out.println(map.get("Hello"));
		System.out.println(map.get("today"));

//결과
123
안녕하세요
Mon Feb 28 23:45:07 KST 2022
```

#### 4. remove(K) : 키 값에 해당되는 데이터 삭제

```java

Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("Hello", "안녕하세요");
		map.put("num", 123);
		map.put("today", new Date());

		System.out.println("remove : " + map.remove("num"));

//결과
remove : 123
```

#### 5. size() : 저장된 키의 개수 리턴

```java
		map.put("Hello", "안녕하세요");
		map.put("num", 123);
		map.put("today", new Date());

		System.out.println(map.size());

//결과
3
```

#### 6. 다른 맵 병합

```java
		Map<Integer, String> map1 = new HashMap<>();
		map1.put(1, "홍길동");
		map1.put(2, "신사임당");
		map1.put(3, "세종대왕");
		
		Map<Integer, String> map2 = new HashMap<>();
		map2.put(3, "논개");
		map2.put(4, "이화주");
		map2.put(5, "유관순");
		
		System.out.println("map1 = " + map1);
		System.out.println("map2 = " + map2);
		
		// map1에 map2내용을 추가
		map1.putAll(map2);
		System.out.println("map1 = " + map1);
		
		// 다른 맵을 인자로 하는 생성자
		Map<Integer, String> map3 = new HashMap<>(map2);
		System.out.println("map3 = " + map3);

//결과
map1 = {1=홍길동, 2=신사임당, 3=세종대왕}
map2 = {3=논개, 4=이화주, 5=유관순}
map1 = {1=홍길동, 2=신사임당, 3=논개, 4=이화주, 5=유관순}
map3 = {3=논개, 4=이화주, 5=유관순}
```

#### 7. keySet() , entrySet() : 모든 요소 순회 열람 → 둘 다 Set으로 반환

<aside>
🔻 **Map**은 **Index가 없기 때문에 순서대로 접근할 수 없다** . 순서대로 접근을 위해 **Set으로 반환**
 →모든 키를 Set컬렉션으로 넘긴 다음 **반복자`(iterator)`를 통해 키를 하나씩 얻을 수 있다**.

</aside>

- **iterator 사용법**

```java
Map<K, V> map = HashMap<K, V>();

Set<K> ketSet = map.ketSet();        //map은 HashMap의 객체를 참조하는 변수

Iterator<K> keyIterator = keySet.iterator();
```

1. **keySet() : key를 별도의 Set으로 반환 → key값은 중복이 없기 때문에 값 유실이 없음**
    - **while문**으로 저장된 **모든 key 리턴**
        
        ```java
        Map<Integer, String> map = new HashMap<>();
        		map.put(1, "홍길동");
        		map.put(2, "신사임당");
        		map.put(3, "세종대왕");
        		
        		Set<Integer> keySet = map.keySet(); //Integer는 map 키타입을 가져온것
        		Iterator<Integer> iter = keySet.iterator();
        		while(iter.hasNext()) {
        			Integer no = iter.next();
        			String value = map.get(no);
        			System.out.println(no + " = " + value);
        		}
        
        //결과 
        1 = 홍길동
        2 = 신사임당
        3 = 세종대왕
        ```
        
    - **foreach문**으로 저장된 **모든 key 리턴**
        
        ```java
        Map<Integer, String> map = new HashMap<>();
        		map.put(1, "홍길동");
        		map.put(2, "신사임당");
        		map.put(3, "세종대왕");
        		
        		Set<Integer> keySet = map.keySet();
        		for(Integer key : keySet) {
        			String value = map.get(key);
        			System.out.println(key + " = " + value);
        		}
        
        //결과
        1 = 홍길동
        2 = 신사임당
        3 = 세종대왕
        ```
        
2. **entrySet() : 저장된 모든 키(key)와 값(value) 리턴 → entry (key, value)를 별도의 Set으로 반환**
    - **while문**으로 저장된 **모든 key 리턴**
    
    ```java
    Map<Integer, String> map = new HashMap<>();
    		map.put(1, "홍길동");
    		map.put(2, "신사임당");
    		map.put(3, "세종대왕");
    
    		Iterator<Map.Entry<Integer, String>> iter2 = map.entrySet().iterator();
    		while(iter2.hasNext()) {
    			Map.Entry<Integer, String> stu = iter2.next();
    			System.out.println(stu.getKey() + " = " +stu.getValue());
    		}
    //결과
    1 = 홍길동
    2 = 신사임당
    3 = 세종대왕
    ```
    
    - **foreach문**으로 저장된 **모든 key 리턴**
    
    ```java
    Map<Integer, String> map = new HashMap<>();
    		map.put(1, "홍길동");
    		map.put(2, "신사임당");
    		map.put(3, "세종대왕");
    
    		for(Map.Entry<Integer, String> entry : entrySet) {
    			Integer key = entry.getKey();
    			String value = entry.getValue();
    			System.out.println(key + " = " + value);
    		}
    //결과
    1 = 홍길동
    2 = 신사임당
    3 = 세종대왕
    ```
    

#### 8. containsKey , containsValue

<aside>
🔻 해당 객체가 equals , hashcode 오버라이드를 통해 동일성 비교가 가능한 경우여야 한다.

</aside>

1. **containsKey : 특정 키(key)값 검사 : 맵에서 인자로 보낸 키가 있으면 true 없으면 false를 반환**

```java
Map<Integer, Student> studentMap = new HashMap<>();
		studentMap.put(1, new Student(1,"홍길동"));
		studentMap.put(2, new Student(2,"신사임당"));
		studentMap.put(3, new Student(3,"논개"));
		
		System.out.println(studentMap.containsKey(1));
		System.out.println(studentMap.containsKey(100));

//결과
true
false
```

1. **containsValue : 특정 값(value)값 검사 : 맵에서 인자로 보낸 값이 있으면 true 없으면 false를 반환**

```java
public void test5() {
		Map<Integer, Student> studentMap = new HashMap<>();
		studentMap.put(1, new Student(1,"홍길동"));
		studentMap.put(2, new Student(2,"신사임당"));
		studentMap.put(3, new Student(3,"논개"));
		
		//특정 value값 검사
		System.out.println(studentMap.containsValue(new Student(3,"논개")));
		//위 코드는 같은 주소값을 같고 있지 않지만 필드의 내용이 같다

//결과
false
```

- 뒤 내용이 false인 이유를 알아야함 
new는 새로운 객체를 생성한 것이기 때문에 다른 주소값을 가진 객체가 생성된것이기 때문
- equals( ) + hashCode( ) → @Override

<aside>
🔻 동등성 (==) : 객체 안의 값들을 활용한 비교
동일성 (equals) : 객체가 할당받은 메모리 주소 비교  → 값비교시 equalse 오버라이드

</aside>

- **동일성으로 값을 비교**하기 위해서는 `equals()` 메서드를 오버라이드해야한다.

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
