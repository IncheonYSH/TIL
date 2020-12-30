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



# 집합

```python
s1 = set([1, 2, 3]) # 리스트 [1, 2, 3] 을 집합으로 변환


```

* 집합 안에는 set, list, dic 자료형은 불가능하고 tuple 형태만 가능하다








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

