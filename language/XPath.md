# Node

| Node                          | 의미                          |
| ----------------------------- | ----------------------------- |
| root node                     | xml 자체를 표현하는 가상 노드 |
| element node                  | tag                           |
| attribute node                | 속성                          |
| text node                     | 태그 내용                     |
| namespace node                | `xmlns:` 로 시작하는 태그     |
| processing - instruction node | `<?` 태그로 시작              |
| comment node                  | 주석                          |

<br>



# 구문

| 구문 | 의미                                           |
| ---- | ---------------------------------------------- |
| /    | 하위 노드                                      |
| //   | 현재 노드에서부터 문서상의 모든 하위 노드 조회 |
| .    | 현재 노드 선택                                 |
| ..   | 현재 노드의 부모 노드 선택                     |
| @    | 현재 노드의 attribute 선택                     |
| *    | all                                            |

<br>



# 예시

```xml-dtd
<!-- div element 중 속성이 class="writing_view_box" -->
//div[@class="writing_view_box"] 

<!-- 문서의 세번째, 마지막, 처음 두 링크 -->
(//a)[3]
(//a)[last()]
(//a)[position() < 3]

```

