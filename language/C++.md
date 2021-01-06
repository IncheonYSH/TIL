# 입력, 출력, 포인터, 참조자
```c++
#include <iostream>
#include <iomanip>


int ExampleFunction() // 여기서 int& ExampleFunction() 으로 쓸 경우 k 값이 리턴되는 동시에 사라지므로 dangling reference 가 형성되어 에러가 발생한다.
{
    int k = 5;
    return k;
}


int main(void)
{
    
    float a = 3.14159f;
    double b = 3.14159;
    int c = 123;

    std::cout << "a: " << std::setprecision(4) << a << std::endl;
    std::cout << "a: ";
    std::cout.precision(3); // 전체 자리수 3자리
    std::cout << a << std::endl;
    std::cout << "b: " << std::setfill('_') << std::setw(5) << std::setprecision(2) << b << std::endl;
    std::cout << std::fixed; // 소수점 아래 자리수 제한
    std::cout.precision(3); // 소수점 아래 3 자리
    std::cout << "b: " << b << std::endl;
    std::cout.unsetf(std::ios::fixed); // std::fixed 해제
    std::cout << "b: " << std::setfill('_') << std::setw(5) << std::setprecision(2) << b << std::endl;
    std::cout << "c: " << std::setw(5) << c << std::endl;

    printf("a: %.4f\n", a);
    printf("b: %6.2f\n", b);
    printf("c: %6d\n", c);
    std::cout << std::endl;


    /// <summary>
    /// 포인터
    /// </summary>
    int pa = 50; // 변수 pa 정의
    int* p; // 포인터 p 정의, 이때 특정 변수의 시작 주소만을 가리키므로 데이터 형 또한 함께 지정해 주어야 한다.
    p = &pa; // p는 변수 pa 의 메모리 주소
    *p = 30; // 주소값 p 에 해당하는 데이터(a)를 정의
    std::cout << pa << std::endl; // 30 
    std::cout << std::endl;


    /// <summary>
    /// 참조자(Reference)
    /// </summary>
    int rex;
    int& reference_rex = rex; // 참조자 정의, 반드시 어떤 변수의 참조자인지 명시하여야 한다. 또한 이 경우 레퍼런스는 메모리 상에 존재하지 않는다.
    rex = 10;
    reference_rex = 20; // 한 번 어떤 변수의 참조자가 되면 더이상 다른 변수를 참조할 수는 없다.
    std::cout << "rex: " << rex << std::endl; // 20
    std::cout<< "reference_rex: " << reference_rex << std::endl; //20

    //int& refa = 1; 은 불가능하다. 상수는 리터럴이므로 수정할 수 없다. 따라서 참조자를 통한 수정도 불가능하다.
    const int& ref = 1; // 상수 참조자로 선언하였으므로 리터럴도 참조할 수 있다. 이 경우 refa = 1; 과 같다.
    int refa = ref;
    // ref = 4; 이미 위에서 참조자를 정의하였으므로 다른 값을 참조할 수 없다.
    // 또한 레퍼런스의 레퍼런스,레퍼런스의 배열, 레퍼런스의 포인터는 존재할 수 없다.
    std::cout << "refa: " << refa << std::endl;

    // int& reference_test = ExampleFunction(); 함수의 리턴값은 실행 후 바로 사라지므로 dangling reference가 형성된다.
    const int& reference_test = ExampleFunction(); // 예외로 상수 참조자를 선언하면 함수의 리턴값을 레퍼런스로 받을 수 있다.
    std::cout << "reference_test: " << reference_test << std::endl;
    return 0;
}
```

```powershell
a: 3.142
a: 3.14
b: __3.1
b: 3.142
b: __3.1
c: __123
a: 3.1416
b:   3.14
c:    123

30

rex: 20
reference_rex: 20
refa: 1
reference_test: 5
```

