# Object 클래스

* 클래스가 생성될 때 기본적으로 Object 클래스를 상속받게 된다.

* 모든 클래스가 가져야 할 기본적인 메서드를 가지고 있다.

  > 필요한 경우(특정 디자인 패턴 구현 등) 이러한 기본적인 메서드를 오버라이딩 해서 사용한다.

<br>

#### 특수 메서드, 속성

* `__new__()`

  > 객체가 생성될 때 자동으로 호출되어 `__init__()` 보다 먼저 실행된다. 
  >
  > 인스턴스를 반환한다(클래스의 인스턴스를 반환하지 않으면 `__init__()` 이 실행되지 않는다).
* `__init__()`

  > 초기화, 인스턴스를 생성할때 실행된다.

* `__str__()`

  > 인스턴스 자체를 출력할 때의 형식을 지정하며 문자열 객체를 반환한다.
  >
  > print() 로 인스턴스를 출력할 때 지정된 형식으로 출력한다.

* `__dict__`

  > 객체의 속성을 저장하는데 사용되는 딕셔너리 속성

  ```python
  class test:
      def __init__(self):
          self.a = None
          self.b = None
      
  a = test()
  print(a.__dict__)
  ```

  ```powershell
  # 출력
  {'a': None, 'b': None}
  ```

* `self`

  > 클래스의 인스턴스를 지칭한다. self 를 통해 클래스의 메서드와 속성에 접근할 수 있다.

* 산술 연산

  > 아래 메서드를 재정의하여 연산자 오버로딩 가능

  |  연산  |           메서드            |
  | :----: | :-------------------------: |
  | x + y  |   `__add__(self, other)`    |
  | x - y  |   `__sub__(self, other)`    |
  | x * y  |   `__mul__(self, other)`    |
  | x ** y |   `__pow__(self, other)`    |
  | x / y  | `__truediv__(self, other)`  |
  | x // y | `__floordiv__(self, other)` |
  | x % y  |   `__mod__(self, other)`    |
  |   +x   |       `__pos__(self)`       |
  |   -x   |       `__neg__(self)`       |

  > 연산자 오버로딩 예시

  ```python
  class Vector2D:
      def __init__(self, x, y):
          self.x = x
          self.y = y
      
      def __add__(self, other_vec):
          return Vector2D(self.x + other_vec.x, self.y + other_vec.y)
  
      def __str__(self):
          return "({},{})".format(self.x, self.y)
  
  v1 = Vector2D(30, 40)
  v2 = Vector2D(10, 20)
  v3 = v1 + v2
  print(v1)
  print(V2)
  print(v3)
  ```

  ```powershell
  # 출력
  (30,40)
  (10,20)
  (40,60)
  ```

* 비교 연산

  |  연산  |        메서드         |
  | :----: | :-------------------: |
  | x < y  | `__lt__(self, other)` |
  | x <= y | `__le__(self, other)` |
  | x >= y | `__ge__(self, other)` |
  | x > y  | `__gt__(self, other)` |

* 내장 함수

  |   함수   |      메서드       |
  | :------: | :---------------: |
  |  len(x)  |  `__len__(self)`  |
  | float(x) | `__float__(self)` |
  |  int(x)  |  `__int__(self)`  |
  |  str(x)  |  `__str__(self)`  |
  |  abs(x)  |  `__abs__(self)`  |
  | hash(x)  | `__hash__(self)`  |
  | iter(x)  | `__iter__(self)`  |

<br>

<br>

# 접근 제한

> 외부로부터의 고의적인 액세스 방지 역할보다는 개발 과정에서의 규약 개념으로 보아야 한다.

| 구분        | 예시          | 비고                                                         |
| ----------- | ------------- | ------------------------------------------------------------ |
| `pubic`     | `self.name`   |                                                              |
| `protected` | `self._name`  | 실제로 접근을 제한하지는 않는다.<br>경고 표시로 받아들여야 한다. |
| `private`   | `self.__name` | 내부에서 변수 이름을 바꾸는 방식으로 접근을 제한한다(`self._ClassName__name`의 형식으로 변경한다). 변경된 변수 이름으로는 접근이 가능하다[`[1]`](https://stackoverflow.com/questions/70528/why-are-pythons-private-methods-not-actually-private). |

<br>

<br>

# 기타 유용한 메서드

* hasattr(object, attribute)

  > 객체에 특정 속성이 존재하는지 판별

  ```python
  class Person:
    name = "John"
    age = 36
    country = "Norway"
  
  x = hasattr(Person, 'age')
  print(x)
  
  ```

  ```powershell
  True
  ```

  <br>

* super()

  > 자식클래스에서 부모클래스의 내용을 사용하게 함

  ```python
  class Animal():
      def __init__(self, name):
          self.name = name
      def bark(self):
          print('Hmm...')
  
  class Dog(Animal):
      def bark(self):
          print('Woof!')
      def super_bark(self):
          super().bark()
  
  max = Dog('Max')
  max.bark()
  max.super_bark()
  ```

  ```powershell
  Woof!
  Hmm...
  ```

  

  
