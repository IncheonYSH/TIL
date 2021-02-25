# 문자열

* 문자열에 하위 문자열이 포함되어 있는지 확인

  ```python
  # str.in
  >>> `given` in `It is a given string`
  True
  >>> `gaven` in `It is a given string`
  False
  ```

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

# 리스트

* 원하는 값의 index 여러개 반환

  ```python
  Example = [1, 2, 3, 4, 1, 2, 3, 4]
  
  #filter
  list(filter(lambda e:Example[e]) == 1, range(len(Example)))
  
  #enumerate
  [i for i, ele in enumerate(Example) if ele == 1]
  
  """
  모두 결과값으로 [0, 4]를 얻는다
  """
  ```

* pop

  ```python
  a = [1, 2, 3]
  a.pop() 
  # 리스트 a의 마지막 요소를 리턴하고 그 요소를 리스트에서 삭제한다. 이 경우 3 을 반환하고 a = [1, 2] 가 된다.
  # a.pop(0) 과 같이 삭제할 인덱스 지정 가능
  ```

* 특정 값의 인덱스

  ```python
  list.index(x[, start[, end]]) 
  # 리스트의 항목 중 값이 x와 같은 첫번째 인덱스 반환, 존재하지 않으면 Value Error
  # start, end 는 생략 가능
  ```

  <br>

# 집합

```python
s1 = set([1, 2, 3]) # 리스트 [1, 2, 3] 을 집합으로 변환
```

* 집합 안에는 set, list, dic 자료형은 불가능하고 tuple 형태만 가능하다

<br>

# 이진 연산

```python
###############################
# bin, oct, hex
###############################
>>> bin(42) # 2진법, 0b, 문자열 반환
'0b101010'
>>> oct(42) # 8진법, 0o, 문자열 반환
'0o52'
>>> hex(42) # 16진법, 0x, 문자열 반환
'0x2a'

###############################
# 10진법으로 변환
###############################
>>> int('0b101010', 2) # 2진법 -> 10진법
42
>>> int('0o52', 8) # 8진법 -> 10진법
42
>>> int('0x2a', 16) # 16진법 -> 10진법

############################
# format
############################
>>> format(42, '#b')
'0b101010'
>>> format(42, '#o')
'0o52'
>>> format(42, '#x')
'0x2a'
>>> format(42, '#X')
'0X2A'

#######################
# 진법 변환시 접두어 제외
#######################
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



# 기타 함수

* divmod

  ```python
  x, y = divmod(n, m) # n 을 m 으로 나눈 몫과 나머지를 각각 x, y에 할당 
  ```

* all

  ```python
  is_sorted = all(ages[i] < ages[i+1] for i in range(len(ages)-1)) 
  # 인자로 주어진 리스트의 모든 요소가 True 일때 True 반환
  ```

* zip

  ```python
  # 길이가 같은 반복가능한 개체들을 인자로 여러개 받아들여 순서대로 각 객체들에 있는 요소들을 앞에서부터 각각 하나씩 순서대로 반환하는 함수
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



