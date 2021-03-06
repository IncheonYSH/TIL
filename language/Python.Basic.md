# 네이밍

| 타입                 | Public               | Internal                          |
| -------------------- | -------------------- | --------------------------------- |
| 패키지               | `lower_with_under`   |                                   |
| 모듈                 | `lower_with_under`   | `_lower_with_under`               |
| 클래스               | `CapWords`           | `_CapWords`                       |
| 예외                 | `CapWords`           |                                   |
| 함수                 | `lower_with_under()` | `_lower_with_under()`             |
| 글로벌/클래스 상수   | `CAPS_WITH_UNDER`    | `_CAPS_WITH_UNDER`                |
| 글로벌/클래스 변수   | `lower_with_under`   | `_lower_with_under`               |
| 인스턴스 변수        | `lower_with_under`   | `_lower_with_under`               |
| 메서드 이름          | `lower_with_under()` | `_lower_with_under()` (protected) |
| 함수/메서드 매개변수 | `lower_with_under`   |                                   |
| 지역 변수            | `lower_with_under`   |                                   |

<br>

<br>

# 문자열

* 문자열에 하위 문자열이 포함되어 있는지 확인

  ```python
  # in
  >>> `given` in `It is a given string`
  True
  >>> `gaven` in `It is a given string`
  False
  ```

  <br>

* 문자열에 포함된 하위 문자열의 시작 인덱스 반환

  ```python
  # str.find (매칭되지 않으면 -1 반환)
  >>> givenStr = 'It is a given string'
  >>> givenStr.find('given')
  8
  >>> givenStr.find('gaven')
  - 1
  
  # str.index (매칭되지 않으면 ValueError 반환)
  >>> givenStr = 'It is a given string'
  >>> givenStr.index('given')
  8
  >>> givenStr.index('gaven')
  Traceback (most recent call last):
    File "<pyshell#7>", line 1, in <module>
      givenStr.index('gaven')
  ValueError: substring not found
  ```

  <br>

* 문자열 합치기

  ```python
  # 리스트의 요소를 하나의 문자열로 반환
  '구분자'.join(list)
  ```

  <br>

* 특정 문자의 개수

  ```python
  .count(self, x, __start, __end) # x의 개수를 [start, end) 의 범위에서 탐색
  ```

  <br>
  
* 대체할 문자 여러개 매핑

  ```python
  m = str.maketrans("BEFORE","AFTER") # B -> A, E -> F, F -> T ...로 매핑한 dict 객체 반환
  str.translate(m) # 매핑한 dict 에 따라 문자열 변경
  ```

  <br>

  <br>

# 리스트

* 원하는 값의 index 여러개 반환

  ```python
  Example = [1, 2, 3, 4, 1, 2, 3, 4]
  
  # filter
  list(filter(lambda e:Example[e]) == 1, range(len(Example)))
  
  # enumerate
  # 인덱스와 값을 동시에 리턴하는 함수 활용
  [i for i, ele in enumerate(Example) if ele == 1]
  
  """
  모두 결과값으로 [0, 4]를 얻는다
  """
  ```

  <br>

* pop

  ```python
  a = [1, 2, 3]
  a.pop() 
  # 리스트 a의 마지막 요소를 리턴하고 그 요소를 리스트에서 삭제한다. 이 경우 3 을 반환하고 a = [1, 2] 가 된다.
  # a.pop(0) 과 같이 삭제할 인덱스 지정 가능, 하지만 이렇게 처리하면 O(N) 의 시간복잡도를 가진다.
  ```

  <br>

* 특정 값의 인덱스

  ```python
  # 리스트의 항목 중 값이 x와 같은 첫번째 인덱스 반환, 존재하지 않으면 Value Error
  # start, end 는 생략 가능
  list.index(x[, start[, end]]) 
  
# 찾는 경우가 없을때 -1 반환
  list.find(x)
  ```
  
  <br>
  
* 정렬

  ```python
  sorted(list) # 오름차순
  sorted(list, reverse = True) # 내림차순
  
  list.sort() # None 을 반환, 리스트를 제자리에서 수정
  ```

  <br>

  <br>

# collections.deque

* 객체 생성

  ```python
  import collections
  deq = collections.deque(['a', 'b', 'c'])
  print(deq)
  
  # 실행 결과
  deque(['a', 'b', 'c'])
  ```

  <br>

* _append(x)_

  _copy()_

  _index(x, [start[, end]])_

  _pop()_

  _extend(iterable)_

  _len(d)_

  > list 객체에서의 사용법과 같다. append, extend 의 경우 모두 deque 객체의 뒤쪽에 요소들이 추가된다.

  <br>

* appendleft(x)

  > deque 객체의 앞쪽에 요소 추가

  ```python
  import collections
  deq = collections.deque(['a', 'b', 'c'])
  deq.appendleft('d')
  print(deq)
  
  # 실행 결과
  deque(['d', 'a', 'b', 'c'])
  ```

  <br>

* _popleft()_

  _extendleft(iterable)_

  > appendleft(x) 의 경우와 유사하게 작동한다. extendleft(_iterable_) 의 경우 iterable 객체가 원래 순서의 반대로 정렬되어 앞쪽에 추가된다.

  <br>

  <br>

# 집합

* 생성

  > 집합 안에는 set, list, dic 자료형은 불가능하고 tuple 형태만 가능하다.

  ```python
  s1 = set([1, 2, 3]) # 리스트 [1, 2, 3] 을 집합으로 변환
  print(s1)
  ```

  ```powershell
  # 출력
  {1, 2, 3}
  ```

  <br>

* 원소 하나 추가

  > `set.add(element)`

  ```python
  s1 = set([1, 2, 3])
  s1.add(4)
  print(s1)
  ```

  ```powershell
  # 출력
  {1, 2, 3, 4}
  ```

  <br>

* 원소 여러개 추가

  > `set.update(list)`

  ```python
  s1 = set([1, 2, 3])
  s1.update([4, 5, 6])
  print(s1)
  ```

  ```python
  # 출력
  {1, 2, 3, 4, 5, 6}
  ```

<br>

<br>

# 딕셔너리

* 반복문에서 키, 값 모두 반환

  ```python
  for key, value in dict.items():
  ```

  <br>

* 반복문에서 키만 모두 반환

  ```python
  for key in dict.keys():
  ```

  <br>

* 반복문에서 값만 모두 반환

  ```python
  for value in dict.values():
  ```

  <br>

  <br>

# 진법 변환

* 10진법에서 다른 진법으로 변환

  > 문자열을 리턴함

  |        | 사용 함수                                           | 접두어 |
  | ------ | --------------------------------------------------- | ------ |
  | 2진법  | `bin(num)`, `format(num, '#b')`                     | `0b`   |
  | 8진법  | `oct(num)`, `format(num, '#o')`                     | `0o`   |
  | 16진법 | `hex(num)`, `format(num, '#x')`,`format(num, '#X')` | `0x`   |

  <br>

  * `bin()`, `oct()`, `hex()`

      > 문자열을 리턴함

      ```python
      >>> bin(42) 
      '0b101010'
      >>> oct(42)
      '0o52'
      >>> hex(42)
      '0x2a'
      ```

      <br>

  * `format(num, base)`

      > 문자열을 리턴함
      
      ```python
      >>> format(42, '#b')
      '0b101010'
      >>> format(42, '#o')
      '0o52'
      >>> format(42, '#x')
      '0x2a'
      >>> format(42, '#X')
      '0X2A'
      ```
      
      <br>
      
      > 접두어 없이 출력
    
    ```python
    >>> format(42, 'b')
      '101010'
    >>> format(42, 'o')
      '52'
      >>> format(42, 'x')
      '2a'
      >>> format(42, 'X')
      '2A'
      >>> format(42, 'd')
      '42'
    ```
    
  
  <br>
  
* 10진법으로 변환

  > `int(string, base)`

  ```python
  >>> int('0b101010', 2)
  42
  >>> int('0o52', 8)
  42
  >>> int('0x2a', 16)
  42
  ```

<br>

<br>

# 비트 연산자

* `&`

  > AND

  <br>

* `|`

  > OR

  <br>

* `^`

  > XOR
  >
  > 2개의 입력이 같으면 0, 서로 다르면 1

  |  A   |  B   |  X   |
  | :--: | :--: | :--: |
  |  0   |  0   |  0   |
  |  0   |  1   |  1   |
  |  1   |  0   |  1   |
  |  1   |  1   |  0   |

  <br>

* `~`

  > NOT

<br>

<br>

# 기타 유용한 함수, 모듈

* map

  > 여러 개의 데이터를 한 번에 다른 형태로 변환하여 map 객체로 반환
  >
  > map(function, iterable)

  ```python
  from itertools import combinations
  a = ['a', 'b', 'c', 'd']
  list(map("".join, combinations(a, 2)))
  ```

  ```powershell
  # 출력
  ['ab', 'ac', 'ad', 'bc', 'bd', 'cd']
  a = ["1", "2", "3"]
  ```

  <br>

* divmod

  > 몫과 나머지 리턴

  ```python
  # n 을 m 으로 나눈 몫과 나머지를 각각 x, y에 할당
  x, y = divmod(n, m) 
  ```

  <br>

* all

  > 인자로 주어진 리스트의 모든 요소가 True 일때 True 반환
  
  ```python
  # 오름차순 정렬인지 확인
  is_sorted = all(ages[i] < ages[i+1] for i in range(len(ages)-1))
  ```
  
  <br>


* zip

  > 길이가 같은 반복가능한 개체들을 인자로 여러개 받아들여 순서대로 각 객체들에 있는 요소들을 앞에서부터 각각 하나씩 순서대로 반환하는 함수
  
  ```python
  agesX = ages[:-1]  # [13, 16, 19, 30]
  agesY = ages[1:]   # [16, 19, 30, 24]
  
  for x, y in zip(agesX, agesY):
      print(x, y)
      # 13, 16
      # 16, 19
      # 19, 30
      # 30, 24
  ```

<br>

* decimal

  > 십진 고정 소수점 모듈

  ```python
  from decimal import *
  getcontext().prec = 6 # 소수점 자리수 제한, 기본값은 28
  print(Decimal(1) / Decimal(7))
  
  # 실행 결과
  # 0.142857
  ```

  <br>

  > 수학 함수

  ```python
  from decimal import *
  Decimal(2).sqrt()
  Decimal(1).exp()
  Decimal('10').ln()
  Decimal('10').log10()
  ```

  <br>


* itertools

  > `itertools.combinations(list, n)`
  >
  > 리스트에서 가능한 순서쌍 튜플을 itertools.combinations 객체로 리턴
  
  ```python
  from itertools import combinations
  a = [1, 2, 3, 4]
  result = list(combinations(a, 2))
  print(result)
  ```
  
  ```powershell
  # 출력
  [(1, 2), (1, 3), (1, 4), (2, 3), (2, 4), (3, 4)]
  ```

<br>

  <br>


# 파일 읽기

```python
import sys

input() # 한줄 읽기
sys.stdin = open('input', 'r') # 표준입력을 특정 파일로 설정(읽기전용)
input().split(구분문자) # 한줄을 읽은 뒤 구분문자로 나눠서 문자로 이뤄진 리스트로 입력
N, M = map(int, input().split()) # 리스트에 있는 데이터를 주어진 형식에 맞춰 변환함
a = list(map(int, sys.stdin.readline().split())) # [1, 2, 3, 4] sys.stdin의 첫줄만
arr = [list(map(int, line.split())) for line in sys.stdin] #[[1, 2], [3, 4], [5, 6], [7]]
sys.stdin.readline() # 파일에서 한줄 읽어들이기
sys.stdin.readlines() # 파일 전체의 내용을 읽은 후 각 행으로 나뉘어진 리스트 반환
```

<br>

<br>

# Mutable 객체의 복사

 ```python
a = [1, 2, 3]
b = a
a[0] = 100
print(a) # [100, 2, 3]
print(b) # [100, 2, 3]
 ```

* a, b 의 메모리 주소가 같게 된다.

* 따라서 리스트 a의 값을 변경하면 b의 값도 같이 변한다.  

  <br>

---

 ```python
import copy

a = [1, 2, 3]
b = copy.copy(a) # b = a[:] 로 써도 같은 결과를 얻는다.
a[0] = 100
print(a) # [100, 2, 3]
print(b) # [1, 2, 3]
print(id(a)) # 1718770288640
print(id(b)) # 1718770581632
 ```

* 객체 a의 내용물을 복사한 뒤 이를 b에 새로 할당한다.

* 따라서 a, b 는 각각 다른 메모리를 참조하는 다른 객체를 나타낸다.  

  <br>

---

 ```python
a = [[1, 2], [3, 4], [5, 6]]
b = a[:] # b = copy.copy(a) 로 써도 같은 결과를 얻는다.
a[0][0] = 0

print(a) # [[0, 2], [3, 4], [5, 6]]
print(b) # [[0, 2], [3, 4], [5, 6]]

print(id(a[0])) # 2618809862336
print(id(b[0])) # 2618809862336
 ```

* Mutable 객체 안의 mutable 객체는 여전히 a, b 가 같은 메모리 주소를 참조한다.

  <br>

---

```python
import copy

a = [[1, 2], [3, 4], [5, 6]]
b = copy.deepcopy(a)
a[0][0] = 0

print(a) # [[0, 2], [3, 4], [5, 6]]
print(b) # [[1, 2], [3, 4], [5, 6]]

print(id(a[0])) # 2387479420992
print(id(b[0])) # 2387479582336
```

* Mutable 객체 안의 mutable 객체까지도 복사된 후 새로 b 에 할당되었다.
* 따라서 a[0] 와 b[0] 의 메모리 주소가 다르다.



