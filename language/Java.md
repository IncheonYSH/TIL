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
  * spring 사용시
  implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
  runtimeOnly 'org.mariadb.jdbc:mariadb-java-client'
  
  * hibernate 사용시(버전확인필수)
  implementation 'org.hibernate:hibernate-core:5.5.3.Final'
  implementation 'org.mariadb.jdbc:mariadb-java-client:2.1.2'
  runtimeOnly 'org.mariadb.jdbc:mariadb-java-client'
  
  ---------------------------------------------------------------------------
  
  * application.properties
spring.datasource.driverClassName=org.mariadb.jdbc.Driver
  spring.datasource.url=jdbc:mariadb://(ip):(포트)/(db명)
spring.datasource.username=(유저명)
  spring.datasource.password=(암호)
  
  spring.jpa.show-sql=true
  spring.jpa.hibernate.ddl-auto=none
  
  ----------------------------------------------------------------------------
  
  * persistence.xml(hibernate)
  <persistence xmlns="http://java.sun.com/xml/ns/persistence"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://java.sun.com/xml/ns/persistence http://java.sun.com/xml/ns/persistence/persistence_2_0.xsd"
          version="2.0">
      <persistence-unit name="jpatest">
          <properties>
              <property name="javax.persistence.jdbc.Driver" value="org.mariadb.jdbc.Driver" />
              <property name="javax.persistence.jdbc.url" value="jdbc:mariadb://(db주소):(포트)/(db이름)" />
              <property name="javax.persistence.jdbc.user" value="(db접근유저명)" />
              <property name="javax.persistence.jdbc.password" value="(패스워드)" />
              <property name="hibernate.dialect" value="org.hibernate.dialect.MariaDBDialect" />
              <property name="hibernate.show_sql" value="true" />
              <property name="hibernate.format_sql" value="true" />
              <property name="hibernate.use_sql_comment" value="true" />
          </properties>
      </persistence-unit>
  </persistence>
  
  ```

<br>

# JPA

* 구동 방식

  > 1. Persistence 클래스에서 persistence.xml 설정 정보를 조회함
  > 2. EntityMangerFactory 클래스 생성
  > 3. 필요할때마다 Factory 클래스에서 EntityManger 생성

* 주의 사항

  > 1. EntityMangerFactory  는 하나만 생성해서 애플리케이션 전체에서 공유한다
  > 2.  EntityManger 는 쓰레드간에 공유하면 안된다.
  > 3. JPA 의 모든 데이터 변경은 트랜잭션 안에서 실행하여야 한다.

* JPQL

  > SQL 을 추상화한 **객체 지향 쿼리**
  >
  > 즉 JPQL은 엔티티 객체를 대상으로 쿼리를 작성함

  **쿼리 작성 방법 **

  ` select m from Member m where  m.age > 18`

  * 엔티티와 속성은 대소문자를 구분한다
  * JPQL 키워드는 대소문자를 구분하지 않는다
  * 테이블 이름이 아니라 **엔티티 이름**을 사용한다(객체를 대상으로 쿼리를 작성한다)
  * 별칭은 필수적이다

  **결과 조회 API**

  * `query.getResultList() ` : 결과가 하나 이상인경우 사용가능, 리스트를 반환한다
  * `query.getSingleResult()` : 결과가 정확히 하나일경우 사용(아니면 예외발생), 단일 객체를 반환한다

  **파라미터 바인딩**

  ```java
  SELECT m FROM Member m where m.username := username
  query.setParameter("username", usernameParam);
  
  SELECT m FROM Member m where m.username = ?1
  query.setParameter(1, usernameParam);
  ```

  join fetch 를 사용하면 지연로딩이 발생하지 않게 된다.

  NamedQuery 를 사용하면 어플리케이션 로딩 시점에 문제를 발견할 수 있다(Spring 에서는 이렇게 함)

* 매핑 어노테이션

  ```java
  @Entity 
  public class Member{
      
      @Id
      @GeneratedValue(startegy = GenerationType.AUTO)// auto_increment 
      private Long id;
      
      /** 유용한 옵션
      nullable = false(not null과 같은 옵션),
      unique = true,
      length 필드 길이 제한,
      columnDefinition, length, precision, scale 등
      */
      @Column(name = "USERNAME")
      private String name;
      
      // 실무에서는 가급적 enumtype 을 STRING으로 할것
      @Enumerated(EnumType.STRING)
      private MemberType memberType;    
      
      private int age;
      
      /**
      @CLOB
      @BLOB
      바이너리파일로 밀어넣을때, CLOB(charactor), BLOB(byte)
      
      @Transient
      매핑하지않는필드, 객체에서만 가지고 있고 db와 매핑하지 않음
      */    
  }
  
  public enum MemberType{
      ADMIN, USER
  }
  ```

* 연관관계 매핑 이론

  > 가급적이면 단방향 매핑을 사용하는것이 좋다.

  * 매핑 어노테이션

    ```java
    @ManyToOne
    @OneToMany
    @OneToOne
    @ManyToMany
    
    @JoinColumn
    @JoinTable 
    ```

  * 복합키 어노테이션

    ```java
    @IdClass
    @Embeddedld
    @Embeddable
    @Mapsld
    ```

  * 단방향 매핑

  * 양방향 매핑

    > 객체를 양방향으로 참조하려면 단방향 연관관계를 2개 만들어야 한다.
    >
    > 반면 테이블은 외래 키 하나로 두 테이블의 연관관계를 관리한다.

    ```markdown
    * 연관관계의 Owner
    
    양방향 매핑 규칙
    * 객체의 두 관계 중 하나를 연관관계의 주인으로 지정
    * 연관관계의 주인만이 외래 키를 관리한다(등록, 수정 등)
    * 주인이 아닌 쪽은 읽기만 가능하다
    * 주인은 mappedBy 속성을 사용하지 않는다
    * 주인이 아니면 mappedBy 속성으로 주인을 지정한다
    
    그렇다면 무엇을 주인으로 설정할것인가?
    * 외래키가 있는 곳을 주인으로 정해야 한다(99퍼센트 이상)
    ```

* 영속성 컨텍스트

  > 엔티티를 영구 저장하는 환경
  >
  > EntityManager.persist(entity);

  ![](Java/%EB%82%B4%EB%B6%80%EA%B5%AC%EC%A1%B0.jpg)
  
  * 영속성 컨텍스트는 논리적인 개념
  * 눈에 보이지 않는다
  * 엔티티 매니저를 통해서 영속성 컨텍스트에 접근
  
  ```markdown
  * 영속 컨텍스트(entityManager) 의 특징
  
  1. 1차캐시
  2. 동일성 보장
  3. 트랜잭션을 지원하는 쓰기 지연
  4. 변경 감지
  5. 지연 로딩
  ```
  
  1. entity 조회, 1차캐시
  
     ```java
     // 엔티티를 생성한 상태(비영속)
     Member member = new Member();
     member.setId("member1");
     member.setUsername("회원1");
     
     // 엔티티 영속(1차 캐시에 저장됨)
     em.persist(member);
     
     // db를 조회하지 않고 먼저 1차캐시에서 조회함
     // 1차캐시는 글로벌캐시가 아님. 스레드간에 공유되지않는다.
     Member findMember = em.find(Member.class, "member1");
     
     // 1차캐시에 없으므로 db에서 조회한다.
     Member findMember2 = em.find(Member.class, "member2");
     ```
  
  2. 동일성 보장
  
     ```java
     Member a = em.find(Member.class, "member1");
     Member b = em.find(Member.class, "member1");
     
     System.out.println(a == b); // 동일성 비교 true
     ```
  
  3. 트랜잭션을 지원하는 쓰기 지연
  
     ```java
     EntityManager em = emf.createEntityManager();
     EntityTransaction transaction = em.getTransaction();
     
     // 엔티티 매니저는 데이터 변경시 트랜잭션을 시작해야 한다.
     transaction.begin();
     
     em.persist(memberA);
     em.persist(memberB);
     // 여기까지 INSERT 구문을 데이터베이스에 보내지 않는다.
     
     // 커밋하는순간 데이터베이스에 INSERT SQL 을 보낸다.
     transaction.commit(); // 
     ```
  
  4. 변경 감지
  
     ```java
     // 내부적으로 스냅샷을 사용하기 때문에 아래와 같은 코드로 작동할 수 있다.
     EntityManager em = emf.createEntityManager();
     EntityTransaction transaction = em.getTransaction();
     
     // 트랜젝션 시작
     transaction.begin();
     
     // 영속 엔티티 조회
     Member memberA = em.find(Member.class, "memberA");
     
     // 영속 엔티티 데이터 수정
     memberA.setUsername("hi");
     memberA.setAge(10);
     
     // em.update(member) 와 같은 코드는 필요없다
     
     // 트랜젝션 커밋
     transaction.commit();
     
     //---------------------------------------------
     // 엔티티 삭제
     Member memberA = em.find(Member.class, "memberA");
     em.remove(memberA);
     ```
  
  5. flush
  
     > 영속성 컨텍스트의 변경내용을 데이터베이스에 반영
     >
     > 영속성 컨텍스트를 비우지 않는다. 변경내용을 데이터베이스에 동기화 할 뿐이다.
  
     ```markdown
     * 영속성 컨텍스트를 플러시 하는 방법
     em.flush() - 직접 호출한다
     트랜잭션 커밋(commit()) - 플러시가 자동으로 호출된다
     JPQL 쿼리 실행 - 플러시가 자동으로 호출된다(jdbc, mybatis 등과 같이 사용할 경우 수동으로 flush 해야한다)
     
     * 준영속 상태로 만드는 방법
     em.detach(entity) - 특정 엔티티만 준영속 상태로 전환(persist 이전 상태로)
     em.clear() - 영속성 컨텍스트를 완전히 초기화한다
     em.close() - 영속성 컨텍스트를 종료한다
     ```
  
  6. 지연 로딩
  
     > 지연 로딩 `fetch = FetchType.LAZY` 를 사용하여 프록시 객체로 조회한다.
     >
     > 즉시 로딩은 예상하지 못한 SQL이 발생하므로 가급적 지연 로딩을 사용하여야 한다.
     >
     > 지연 로딩을 사용하기 위해서는 영속성 컨텍스트가 유지되고 있어야 한다.
