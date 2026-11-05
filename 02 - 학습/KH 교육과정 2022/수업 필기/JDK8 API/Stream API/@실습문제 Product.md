---
별칭:
  - "강의 - @실습문제 Product"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/21cb7706348a49baab9eab17fd7a49c6
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: @실습문제 Product

## 강의 내용

`ProductVO`를 요소로하는 `List<Product>`를 생성하고, 다음 예제를 stream api를 이용하여 해결하세요.

```markdown
1.전자기기류만 모두 출력하세요.

2.apple사가 전제품 10% 할인한다고 할때, 해당제품명과 할인된 가격을 출력하세요.

3. 디초코 상표명이 "dechocolatecoffee"로 변경되었다. 
	 스트림상에서 디초코 상품들의 상표명을 "dechocolatecoffee"로 변경하고 출력하세요.

4.금액이 십만원 이상인 상품을 따로 list로 생성하고 출려하세요.

5.상품이름순으로 정렬후 출력하세요. (sorted(Comparator)메소드 이용)

6.가격순으로 내림차순정렬후 출력하세요.
```

```java
@Data
@NoArgsConstructor
@AllArgsConstructor
class Product {
	private String productName;
	private String brand;
	private String category;
	private int price;	
}

public class Stream03Product {
	List<Product> list = new ArrayList<>() {
		{
			add(new Product("아이폰X", "apple", "전자기기류", 1000000));
			add(new Product("맥프로", "apple", "전자기기류", 6300000));
			add(new Product("베지밀", "정식품", "음료류", 1000000));
			add(new Product("파스타면", "de cecco", "식품류", 10000));
			add(new Product("LG G7", "LG", "전자기기", 700000));
			add(new Product("기계식키보드", "LEOPOLD", "전자기기류", 100000));
			add(new Product("고양이", "베르나르베르베르", "도서", 15000));
			add(new Product("간다, 봐라", "법정스님", "도서", 8900));
			add(new Product("까페라떼", "디초코", "음료류", 4000));
			add(new Product("아포가토", "디초코", "디저트류", 4500));
		}
	};
}
```

## 문제풀이

```arduino
package com.kh.java.stream;

public class StreamProductStudy {
	
	List<Product> list = new ArrayList<>() {
		{
			add(new Product("아이폰X", "apple", "전자기기류", 1000000));
			add(new Product("맥프로", "apple", "전자기기류", 6300000));
			add(new Product("베지밀", "정식품", "음료류", 1000000));
			add(new Product("파스타면", "de cecco", "식품류", 10000));
			add(new Product("LG G7", "LG", "전자기기", 700000));
			add(new Product("기계식키보드", "LEOPOLD", "전자기기류", 100000));
			add(new Product("고양이", "베르나르베르베르", "도서", 15000));
			add(new Product("간다, 봐라", "법정스님", "도서", 8900));
			add(new Product("까페라떼", "디초코", "음료류", 4000));
			add(new Product("아포가토", "디초코", "디저트류", 4500));
		}
	};

	public static void main(String[] args) {
		StreamProductStudy s = new StreamProductStudy();
		s.test1();
	}

	/**
	 * @실습문제 : 
	 * productList.png에서 상품을 vo클라스로 작성하고, 이를 객체화해서 productList를 생성하세요.
	 * 
	 */
	private void test1(){
		
		
		//1.전자기기류만 모두 출력하세요.
		list
			.stream()
			.filter(p -> "전자기기류".equals(p.getCategory()))
			.forEach(System.out::println);
		
		//2.apple사가 전제품 10% 할인한다고 할때, 해당제품명과 할인된 가격을 출력하세요.
		list
			.stream()
			.filter(p -> "apple".equals(p.getBrand()))
			.forEach(p -> System.out.println("제품명 : " + p.getProductName() + ", 할인된 가격 : " + (int)(p.getPrice() * 0.9) + "원"));
		 
		//3. 디초코 상표명이 "dechocolatecoffee"로 변경되었다. 
		// 스트림상에서 디초코 상품들의 상표명을 "dechocolatecoffee"로 변경하고 출력하세요.
		list
			.stream()
			.filter(p -> "디초코".equals(p.getBrand()))
			.peek(p -> p.setBrand("dechocolatecoffee"))
			.forEach(System.out::println);

		//4.금액이 십만원 이상인 상품을 따로 list로 생성하고 출려하세요.
		//풀이1
		List<Product> valuableList = new ArrayList<>();
		list
			.stream()
			.filter(p -> p.getPrice() >= 100000)
			.forEach(p -> valuableList.add(p));
		System.out.println("고가상품 = " + valuableList);
		
		//풀이2 collect메소드 이용
		valuableList = 
				list
					.stream()
					.filter(p -> p.getPrice() >= 100000)
					.collect(Collectors.toList());
		System.out.println("고가상품 = " + valuableList);
		
		//5.상품이름순으로 정렬후 출력하세요.
		//sorted(Comparator)메소드 이용
		list
			.stream()
			.sorted((p1, p2) -> p1.getProductName().compareTo(p2.getProductName()))
			.forEach(System.out::println);
		
		//System.out.println(list);//이는 실제 리스트에 아무런 영향이 없음.
		
		System.out.println("-----------------------------------------------------------------------------------------------");
		
		
		//6.가격순으로 내림차순정렬후 출력하세요.
		list
			.stream()
			.sorted((p1, p2) -> p2.getPrice() - p1.getPrice())
			.forEach(System.out::println);
	}
}

@Data
@NoArgsConstructor
@AllArgsConstructor
class Product {
	private String productName;
	private String brand;
	private String category;
	private int price;	
}
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JDK8 API/Stream API/Stream API|Stream API]]
