# 문법

* 상수 선언

  ```java
  final int a = 2;
  ```

* 기본형 타입

  ```java
  boolean a1 = true;
  char c = 'f';
  int x = 59;
  long big = 3456789L;
  float f = 32.5f;
  double d = 23.34;
  ```

* 타입변환

  ```java
  // 묵시적 형변환
  int x = 50000;
  long y = x;
  
  // 명시적 현변환
  long x = 50000;
  int y = (int) x;
  ```

* 연산자

  >- 최우선연산자 ( ., [], () )
  >- 단항연산자 ( ++,--,!,~,+/-  : 부정, bit변환>부호>증감)
  >- 산술연산자 ( *,/,%,+,-,shift) < 시프트연산자 ( >>,<<,>>> ) >
  >- 비교연산자 ( >,<,>=,<=,==,!= )
  >- 비트연산자 ( &,|,,~ )
  >- 논리연산자 (&& , || , !)
  >- 삼항연산자 (조건식) ? :
  >- 대입연산자 =,*=,/=,%=,+=,-=

  ```java
  // 단항 연산자의 순서에 따른 연산순위 변화
  
  int a = 5; 
  System.out.println(++a - 5); 
  //결과는 1 
  
  int a = 5; 
  System.out.println(a++ - 5); 
  //결과는 0
  System.out.println(a); 
  //결과는 6
  ```

* 삼항연산자

  ```java
  int a1 = (/*조건문*/) ? /*true일때*/ : /*false 일때*/;
  ```

* switch

  ```java
  int value = 1;
  
  switch(value){
      case 1:
          System.out.println("1");
          break;
      case 2:
          System.out.println("1");
          break;
      default:
          System.out.println("others");
  }
  ```

* do while

  ```java
  int value = 0;
  // 키보드에서 input
  Scanner scan = new Scanner(System.in);
  
  do{
      value = scan.nextInt();
      System.out.println("입력받은 값:" + value);
  }while(value != 10);
  
  System.out.println("End");
  ```

* for

  >for(시작; 조건; 다음 루프 조작){
  >
  >}

  ```java
  int total = 0;
  for(int i = 1; i <= 100; i++){
      if(i % 2 != 0){
          continue;
      }
      total = total + i;
  }
  
  System.out.println(total);
  ```

* 배열

  > 참조형 타입

  ```java
  // int 100개를 가질수 있는 배열 선언
  int[] array1 = new int[100];
  
  // 배열 초기화
  int[] array2 = new int[]{1, 2, 3, 4};
  int[] array3 = {1, 2, 3, 4};
  
  //2차원 배열
  int[][] array4 = new int[3][4];
  array4[0][1] = 10;
  
  int[][] array5 = new int[3][];
  array5[0] = new int[1];
  array5[0][0] = 10;
  
  int[][] array6 = {{1}, {1, 2}, {1, 2, 3}};
  
  // 배열의 길이 출력. 결과값 4
  System.out.println(array3.length)
  ```

* for each

  ```java
  int[] iarr = {10, 20, 30, 40, 50};
  for(int value : iarr){
      System.out.println(value);
  }
  ```

  <br>

# 클래스

* 참조형 타입

  > 기본형 타입을 제외한 모든 타입

  ```java
  String str = new String("hello");
  ```

* String

  ```java
  // 선언
  // str1 과 str2 는 메모리 주소가 다르다
  String str1 = new String("hello");
  String str2 = new String("hello");
  
  // 생성자 new 없이 생성가능
  // 인스턴스가 상수 영역에 존재함. 따라서 아래 str3 와 str4는 같은 메모리 공간을 가리킨다
  String str3 = "hello";
  String str4 = "hello";
  
  // 참조형 타입에서 연산자 == 는 변수가 가리키는 메모리 주소(레퍼런스)가 같은지를 비교한다.
  // 따라서 str1 == str2 는 false 이다.
  // str3 == str4 는 true 이다.
  
  /* 메서드 */
  // substring
  // 인수가 한개면 인수로 받은 인덱스부터 인덱스의 끝까지 자른다
  // 인수가 두개면 인수로 받은 인덱스 사이의 문자열을 자른다(Python 의 str[n:m] 과 비슷하게 작동함)
  // lo 출력
  System.out.println(str1.substring(3));
  
  // length
  // 문자열의 길이 리턴
  // 10 출력
  System.out.println(str1.length());
  
  // concat
  // 문자열 결합
  // hello world 출력
  System.out.println(str1.concat(" world"));
  ```

* field

  ```java
  public class Song{
      String songTitle;
      String singer;
      String albumName;
      int trackNumber;    
  }
  ```

* 메서드 선언

  ```java
  public class MyClass{
      // public 리턴타입 메소드명 (매개변수)
      // void - 리턴이 없음
      public void method1(){
          System.out.println("m1 이 실행됨");
      }
      
      public void method2(int x){
          System.out.println(x + "m2 실행")
      }
      
      public int method3(){
          System.out.println("m3 실행")
          return 10;
      }
      
      public int method4(int x, int y){
          System.out.println(x + y);
      }
      
      public int method5(int x){
          return x * 2;
      }
  }
  ```

* static

  > `static` 을 사용하면 인스턴스화 하지 않아도 메서드를 사용할 수 있다.

  ```java
  public class MyClass{
      int globalScope = 10;
      static int staticVal = 7;
      
      public static void main(String[] args){
          // 아래 구문은 에러를 발생시킨다.
          // System.out.println(globalScope);
          
          // 아래 구문은 사용가능하다
          System.out.println(staticVal);
          
          // 아래 구문은 사용가능하다
          Myclass cls1 = new MyClass();
          System.out.println(cls1.globalScope);
          
          // static 변수를 수정하는 아래 구문에 의해
          // 100
          // 100 이 출력된다.
          Myclass cls2 = new myClass();
          cls1.staticVal = 50;
          cls2.staticVal = 100;
          System.out.println(cls1.staticVal);
          System.out.println(cls2.staticVal);
      }
  }
  ```

* enum

  > 열거형

  ```java
  public class EnumEx{
      public static final String MALE = "MALE";
      public static final String FEMALE = "FEMALE";
      public static void main(String[] args){
          String gender1;
          gender1 = EnumEx.MALE;
          gender1 = EnumExam.FEMALE;
          
          gender1 = "boy";
          
          Gender gender2;
          gender2 = Gender.MALE;
          gender2 = Gender.FEMALE;
          
          // 아래 구문은 에러를 발생시킨다.
          // gender2 = "boy";
      }
  }
  
  enum Gender{
      MALE, FEMALE;
  }
  ```

* 생성자

  > * 생성자는 필드를 초기화한다.
  > * 생성자가 존재하지 않으면 자동으로  기본 생성자가 생성된다.
  >
  > * 매개변수가 없는 생성자가 기본생성자이다.

  ```java
  // 인스턴스가 생성될 때 반드시 특정 필드를 가지도록 하려면 다음과 같이 작성한다.
  public class Car{
      string name;
      int number;
      
      public Car(String n){
          name = n;
      }
  }
  ```

*  this

  > python 의 self 랑 판박이

  ```java
  public class Car{
      string name;
      int number;
      
      public Car(String name){
          this.name = name;
      }
  }
  ```

* 메서드 오버로딩

  ```java
  public class MyClass{
      public int plus(int x, int y){
          return x + y;
      }
      
      public int plus(int x, int y, int z){
          return x + y + z;
      }
      
      public String plus(String x, String y){
          return x + y;
      }
      
      //에러 발생함
      //public int plus(int i, int j){
      //    return i + j;
      //}
  }
  ```

* 생성자 오버로딩, 상속

  ```java
  public class Car{
      String name;
      int number;
      public Car(String name){
          this.name = name;
      }
      
      public Car(String name, int number){
          this.name = name;
          this.number = number;
      }
      
      // 기본생성자 선언
      public Car(){
          // 자기 자신의 생성자를 호출하여 코드 중복실행 방지
          this("이름없음", 0);
      }
  }
  ```

  ```java
  public class MyClass{
      public static void main(String[] args){
      	Car car1 = new Car("소방차");
      	Car car2 = new Car("구급차", 1111);
      	Car car3 = new Car();
          Bus bus1 = new Bus();
      }
  }
  ```

  ```java
  public class Bus extends Car{
      public void boop{
          System.out.println("boop");
      }    
  }
  ```

* super

  ```java
  public class Car{
      public Car(String name){
          System.out.println("Class Car");
      }
  }
  
  public class Truck extends Car{
      public Truck(){
          // 부모의 생성자를 직접 호출하지 않으면 기본생성자만 호출하게 되는데
          // 이 예제의 경우 기본 생성자가 존재하지 않으므로
          // super 로 부모생성자를 직접 호출하지않으면 에러가 발생한다.
          super("소방차");
          System.out.println("Class Truck");
      }
  }
  ```

* 인터페이스

  > 추상 메소드와 상수를 정의가능하다
  >
  > 인터페이스 자체가 객체를 생성하지는 못한다

  ```java
  public interface TV{
      public int MAX_VOLUME = 100;
      public int MIN_VOLUME = 0;
      
      public void turnOn();
      public void turnOff();
      public void changeVolume(int volume);
      public void changeChannel(int channel);
  }
  ```


<br>

# Optional

> null 이 될 수도 있는 객체를 다룰때

```java
Optional<Order> maybeOrder;
Optional<Member> optMember;
Optional<Address> address;
```

* get

  > Optional 객체가 비어있으면 `NoSuchElementException ` 처리

<br>

# Spring boot

* 데이터베이스 연동(with mariaDB)

  ```markdown
  * build.gradle
  implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
  runtimeOnly 'org.mariadb.jdbc:mariadb-java-client'
  
  * application.properties
  spring.datasource.driverClassName=org.mariadb.jdbc.Driver
  spring.datasource.url=jdbc:mariadb://(ip):(포트)/spring_test
  spring.datasource.username=(유저명)
  spring.datasource.password=(암호)
  
  spring.jpa.show-sql=true
  spring.jpa.hibernate.ddl-auto=none
  ```

  

  