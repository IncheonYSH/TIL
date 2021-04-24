# 배열(Array)

* 여러 데이터를 하나의 이름으로 묶어 관리하기 위한 자료구조
  * value 와 index의 쌍으로 구성되어있다.
  * index + value : element

<br>

<br>

# 연결 리스트(linked list)

* 노드(Node) 를 기본 단위로 한다.

* 각 노드는 데이터를 포함하며, 다른 노드와 연결된다.

* 노드간의 연결은 포인터로 구현된다.

  <br>

  ![](./Datastructure/Singly_linked_list.png)

  <center>Singly linked list</center>

  <br>

  ![](Datastructure/Doubly-linked-list.png)

  <center>Doubly linked list</center>

  <br>

  ![](./Datastructure/Circularly-linked-list.png)

  <center>Circular linked list</center>

  <br>

* 삽입, 삭제의 시간 복잡도는 O(1), 검색의 시간 복잡도는 O(n) 이다.

  <br>

  <br>
  
* In Python

  ```python
  class Node:
          def __init__(self):
              self.data = None
              self.link = None
  
  class LinkedList:
      def __init__(self, *args):
          self.data_arrary = args
          self.head = None
  
          if len(self.data_arrary) != 0:
              node = Node()
              node.data = self.data_arrary[0]
              self.head = node
              for i in self.data_arrary[1:]:
                  pre = node
                  node = Node()
                  node.data = i
                  pre.link = node
  
      def __str__(self):
          chain = []
          if self.head != None:
              current = self.head
              chain.append(current.data)
              while current.link != None:
                  current = current.link
                  chain.append(current.data)
          return "LinkedList({})".format(chain)
      
      # 데이터 삽입
      def insert_data(self, find_data, insert_data):
          if self.head.data == find_data:
              node = Node()
              node.data = insert_data
              node.link = self.head
              self.head = node
          else:
              current = self.head
              while current.link != None:
                  pre = current
                  current = current.link
                  if current.data == find_data:
                      node = Node()
                      node.data = insert_data
                      node.link = current
                      pre.link = node
                       
      # 데이터 삭제
      def delete_data(self, data):
          if self.head.data == data:
              current = self.head
              self.head = current.link
          else:
              current = self.head
              while current.link != None:
                  pre = current
                  current = current.link
                  if current.data == data:
                      pre.link = current.link
          del(current)
  ```

  ```python
  a = LinkedList('a', 'b', 'c')
  print(a)
  
  a.insert_data('a', 'A')
  a.insert_data('b','B')
  a.insert_data('c','C')
  print(a)
  
  a.delete_data('a')
  a.delete_data('b')
  a.delete_data('c')
  print(a)
  ```

  ```powershell
  # 출력
  LinkedList(['a', 'b', 'c'])
  LinkedList(['A', 'a', 'B', 'b', 'C', 'c'])
  LinkedList(['A', 'B', 'C'])
  ```

  

# Hash table

### Direct-address table

* 배열을 사용하여 레코드를 레코드에 대응되는 키와 매핑시킨 자료구조

* 크기가 U인 테이블 T를 생성한 뒤, `key k` 를 `slot k`에 저장한다.
* `actual key K` 는 전체 `key U` 의 부분집합이다.

<img src="./Algorithm/Direct_address_tables.png" alt="figure" style="zoom: 80%;" />

* 검색, 삽입, 삭제의 시간 복잡도는 O(1) 이다.

* 전체 레코드와 최대 크기가 다르면 메모리 낭비가 발생한다.

* 최대 키 값에 대한 정보가 있어야 한다.

  <br>

###  Hashing

* `key k` 를 저장할 떄 `slot k` 에 저장하는 것이 아니라 `slot h(k)` 에 저장한다. `h(k)` 는 `key k` 의 해쉬 값이고, `h()` 를 해쉬 함수라 한다.
* 해쉬 함수는 임의의 크기의 데이터를 고정된 크기의 데이터로 만든다.
* `h()` 함수에 따라 hash 충돌 문제가 발생할 수 있다. 이 경우 연결 리스트로 저장하여 충돌을 해결한다.

<img src="./Algorithm/Hashing.png" alt="figure" style="zoom: 80%;" />

<img src="./Algorithm/Hashing_list.png" alt="figure" style="zoom: 80%;" />

* 하지만 이 경우 긴 리스트를 만든다면 hash table 을 사용하는 이점이 없으므로 적절한 hash 함수를 사용하여야 한다.
* 사용 가능한 슬롯이 `m` 개라고 할 때 각각의 `key` 가 중복 없이 `m` 개의 슬롯으로 동일한 확률로 hash 되고, 다른 hash 값과 독립적으로 hash 되는 경우가 이상적인 경우이다.