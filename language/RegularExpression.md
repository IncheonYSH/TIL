# 정규표현식

### 메타 문자

| 메타 문자 |                             의미                             |             예시             |                             결과                             |
| :-------: | :----------------------------------------------------------: | :--------------------------: | :----------------------------------------------------------: |
|    []     | [] 안에 포함된 문자들 중 하나와 매치<br>[] 안의 두 문자에 - 를 사용하여 범위 지정<br>[]안에 ^ 사용시 not 을 의미함 | [abc]<br>[a-zA-Z]<br>\[^a-z] | abc중 하나와 매치<br>모든 알파벳 중 하나와 매치<br>소문자를 제외한 문자와 매치 |
|    \|     |                              or                              |           Py\|html           |                     Py 또는 html 과 매치                     |
|     ^     | 문자열의 시작 부분에서 일치함<br>(re.MULTILINE 사용 시 각 줄의 처음) |             ^Py              |                Py 문자열이 처음에 있을때 매치                |
|     $     | 문자열의 끝부분에서 일치함<br>(re.MULTILINE 사용 시 각 줄의 마지막) |             Py$              |                 Py 문자열이 끝에 있을때 매치                 |
|     .     |          모든 문자<br>[] 안에서 사용시 . 을 의미함           |         r.l<br>m[.]s         |        r + 모든문자 + l 와 매치<br>m + . + s 와 매치         |
|     *     |     * 앞에 오는 문자가 0개를 포함하여 몇 개가 오든 매치      |             15*7             |                   17, 157, 1557 등과 매치                    |
|     +     |       + 앞에 있는 문자가 최소 한번이상 반복되어야 매치       |             15+7             |               17은 매치안됨. 157, 1557 은 가능               |
|     ?     |          ? 앞에 있는 문자가 없거나 하나 있을때 매치          |             15?7             |                 17, 157은 매치. 1557은 불가                  |
|  {m, n}   |      {m, n} 앞의 문자가 m번이상 n번 이하 반복될때 매치       |           15{1,2}7           |               157, 1557은 매치. 17, 15557 불가               |
|    \d     |                         [0-9]와 같음                         |                              |                                                              |
|    \D     |                           \[^0-9]                            |                              |                                                              |
|    \w     |                     [0-9a-zA-Z_]와 같음                      |                              |                                                              |
|    \W     |                        \[^0-9a-zA-Z_]                        |                              |                                                              |
|    \s     |                  white space, [\t\n\r\f\v]                   |                              |                                                              |
|    \S     |            white space 가 아닌것, \[^\t\n\r\f\v]             |                              |                                                              |
|    \b     |            단어의 경계, 단어의 기준은 연속 문자열            |                              |                                                              |
|    \B     |       단어의 경계가 아님, 즉 문자열이 연속으로 이어짐        |                              |                                                              |
|    \A     | 문자열의 시작부분에서 일치<br>(re.MULTILINE 사용하더라도 전체 문자열의 처음만) |                              |                                                              |
|    \Z     | 문자열의 끝부분에서 일치<br>(re.MULTILINE 사용하더라도 전체 문자열의 마지막만) |                              |                                                              |
|     \     |                          이스케이프                          |          \\*<br>\\?          |                    문자 `*` , `?` 과 매치                    |



# Python

```python
import re
Example = re.compile('[a-z]+') # 정규표현식 컴파일, Example은 컴파일된 패턴 객체가 된다.
```

* 파이썬이 이스케이프 시퀀스로 `\` 를 사용하기 때문에 파이썬 문자열 처리 과정에서 `\\` 이 `\` 로 변경되는 문제가 생기므로 매우 간단한 형태의 정규표현식이 아니라면 raw string 을 사용하자.

```python
import re
Example = re.compile(r'[a-z]+') # 정규표현식 앞의 r이 정규표현식을 raw string 으로 인식시킨다.
```



### 컴파일 옵션

|         옵션         |                             의미                             |                             예시                             |      결과       |
| :------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :-------------: |
|  re.DOTALL<br>re.S   |             `.` 메타 문자가 `\n` 도 포함하게 됨              | Example = re.compile('a.b', re.DOTALL)<br>m = p.match('a\nb') | match 객체 반환 |
| re.MULTILINE<br>re.M | `^` , `$` 와 연관된 옵션<br>여러 줄의 문자열에서 각 줄에 매치 |          Example = re.compile('^TTT', re.MULTILINE)          |                 |
|  re.VERBOSE<br>re.X  |                 정규식을 줄 단위로 구분 가능                 | Example = re.compile(r"""<br>(<br>1557 # 주석<br>080 # 주석<br>)<br>""", re.VERBOSE) |                 |



### 컴파일된 패턴 객체의 메서드

|  메서드  |                             의미                             |        예시<br>Example = re.compile('[a-z]+')        |                        결과                        |
| :------: | :----------------------------------------------------------: | :--------------------------------------------------: | :------------------------------------------------: |
|  match   |        문자열의 **처음부터** 정규식과 매치되는지 조사        |  Example.match("tfive")<br>Example.match("1557 T")   |              match 객체 반환<br>None               |
|  search  | 문자열 전체에 대하여 정규식과 매치되는지 조사<br>처음 매칭되는 문자열만 검색 가능하다 | Example.search("tfive")<br/>Example.search("1557 t") |         match 객체 반환<br>match 객체 반환         |
| findall  |             매칭되는 모든 문자열을 리스트로 리턴             |             Example.findall("ttttt vvv")             |                 [ttttt, vvv] 반환                  |
| finditer |           findall 과 동일하나 iterator object 리턴           |             Example.findall("ttttt vvv")             | 각각의 요소가 match 객체인<br>iterator object 반환 |



### match 객체의 메서드

| 메서드  |                      의미                       | 예시<br>Example = re.compile('[a-z]+')<br>m = Example.search("ttttt 1557") |  결과   |
| :-----: | :---------------------------------------------: | :----------------------------------------------------------: | :-----: |
| group() |              매치된 문자열을 리턴               |                          m.group()                           | 'ttttt' |
| start() |        매치된 문자열의 시작 위치를 리턴         |                          m.start()                           |    0    |
|  end()  |         매치된 문자열의 끝 위치를 리턴          |                           m.end()                            |    5    |
| span()  | 매치된 문자열의 (시작, 끝)에 해당하는 튜플 리턴 |                           m.span()                           | (0, 5)  |



