# 자료형에 따른 메서드의 시간 복잡도

> *n 은 현재 컨테이너에 있는 요소의 수, k는 매개 변수의 값이거나 매개 변수의 요소 수*

<br>

- ### list

  | **Operation**    | **Average Case** | **[Amortized Worst Case](http://en.wikipedia.org/wiki/Amortized_analysis)** |
  | ---------------- | ---------------- | ------------------------------------------------------------ |
  | Copy             | O(n)             | O(n)                                                         |
  | Append           | O(1)             | O(1)                                                         |
  | Pop last         | O(1)             | O(1)                                                         |
  | Pop intermediate | O(n)             | O(n)                                                         |
  | Insert           | O(n)             | O(n)                                                         |
  | Get Item         | O(1)             | O(1)                                                         |
  | Set Item         | O(1)             | O(1)                                                         |
  | Delete Item      | O(n)             | O(n)                                                         |
  | Iteration        | O(n)             | O(n)                                                         |
  | Get Slice        | O(k)             | O(k)                                                         |
  | Del Slice        | O(n)             | O(n)                                                         |
  | Set Slice        | O(k+n)           | O(k+n)                                                       |
  | Extend           | O(k)             | O(k)                                                         |
  | Sort             | O(n log n)       | O(n log n)                                                   |
  | Multiply         | O(nk)            | O(nk)                                                        |
  | x in s           | O(n)             |                                                              |
  | min(s), max(s)   | O(n)             |                                                              |
  | Get Length       | O(1)             | O(1)                                                         |

  <br>

- ### collections.deque(double linked list)

  | **Operation** | **Average Case** | **Amortized Worst Case** |
  | ------------- | ---------------- | ------------------------ |
  | Copy          | O(n)             | O(n)                     |
  | append        | O(1)             | O(1)                     |
  | appendleft    | O(1)             | O(1)                     |
  | pop           | O(1)             | O(1)                     |
  | popleft       | O(1)             | O(1)                     |
  | extend        | O(k)             | O(k)                     |
  | extendleft    | O(k)             | O(k)                     |
  | rotate        | O(k)             | O(k)                     |
  | remove        | O(n)             | O(n)                     |

  <br>

- ### set

  | **Operation**                     | **Average case**                                             | **Worst Case**                                | **notes**                                  |
  | --------------------------------- | ------------------------------------------------------------ | --------------------------------------------- | ------------------------------------------ |
  | x in s                            | O(1)                                                         | O(n)                                          |                                            |
  | Union s\|t                        | [O(len(s)+len(t))](https://wiki.python.org/moin/TimeComplexity_(SetCode)) |                                               |                                            |
  | Intersection s&t                  | O(min(len(s), len(t))                                        | O(len(s) * len(t))                            | replace "min" with "max" if t is not a set |
  | Multiple intersection s1&s2&..&sn |                                                              | (n-1)*O(l) where l is max(len(s1),..,len(sn)) |                                            |
  | Difference s-t                    | O(len(s))                                                    |                                               |                                            |
  | s.difference_update(t)            | O(len(t))                                                    |                                               |                                            |
  | Symmetric Difference s^t          | O(len(s))                                                    | O(len(s) * len(t))                            |                                            |
  | s.symmetric_difference_update(t)  | O(len(t))                                                    | O(len(t) * len(s))                            |                                            |

  <br>

- ### dict(hash table)

  > *iteration, copy 의 경우 n은 컨테이너의 현재 크기가 아닌 최대 크기이다.*
  >
  > *예를 들어, N개의 요소가 dict에 할당된 후 N-1 개가 삭제되고 다른 요소의 삽입이 일어나지 않는다면 dict의 크기는 N 이다.* 

  | **Operation** | **Average Case** | **Amortized Worst Case** |
  | ------------- | ---------------- | ------------------------ |
  | k in d        | O(1)             | O(n)                     |
  | Copy          | O(n)             | O(n)                     |
  | Get Item      | O(1)             | O(n)                     |
  | Set Item      | O(1)             | O(n)                     |
  | Delete Item   | O(1)             | O(n)                     |
  | Iteration     | O(n)             | O(n)                     |