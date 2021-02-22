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

<Br>

# 집합

```python
s1 = set([1, 2, 3]) # 리스트 [1, 2, 3] 을 집합으로 변환


```

* 집합 안에는 set, list, dic 자료형은 불가능하고 tuple 형태만 가능하다





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

<Br>



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

<br>

# Coroutine