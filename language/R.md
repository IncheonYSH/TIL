# 기초 문법

#### 변수 사용

```R
x <- 3 # x 에 스칼라 할당
x <- c(1, 2, 3) # x 에 벡터 할당
x <- NULL # x 에 null 할당
v <- ls() # 현재 변수 리스트
rm(x) # 변수 x 삭제
rm(list=ls()) # 모든 변수 삭제
help(rm) # help
```

<br>

#### 명령어

```R
getwd() # Get Working directory
setwd('C:\\Rstudy') # Set working directory

cat("TEST") # 개행 없이 출력
sink("output.txt") # "output.txt" 에 출력 저장 시작
cat("TEST\n") 
sink() # "저장 끝"

head(iris) # 데이터의 앞부분
tail(iris) # 데이터의 뒷부분
sumamry(iris) # 데이터 분포
```

<br>

#### 벡터

```R
a <- 1:1000 # 1, 2, 3, ... , 1000 벡터 생성
a <- c(1, 2, 3) # 1, 2, 3 벡터 생성
seq(from, to, by | length.out) # from: 초기값, to 종료값, by: 증가분, length.out: from 부터 to 사이의 원소 개수 지정(default = by)
rep(x, times | each) # x: 반복할 벡터, times: 전달된 벡터의 전체 반복 횟스, each: 전달된 벡터 x의 개별 원소의 반복 횟수(default = times)
length(x) # 벡터 길이
str(x) # 벡터 구조
x[1:2] # 벡터 내 원소 접근
x[-c(1, 2)] # 1, 2 인덱스 제외한 원소

names(x) # 벡터 x의 원소에 이름 설정
names(x) <- value
identical(x, y) # 두 벡터가 동일한지 판단
value %in% x # x 벡터에 value 값이 있는지 판단 

x <- runif(5) # 0~1 사이의 값을 5개 생성(난수)
any ( x > 0.9) # x의 원소중 하나라도 조건을 만족하는지
all ( x > 0.9) # x의 원소가 모두 조건을 만족하는지
is.vector(x) # x가 벡터인지 판별



```

```R
> a <- seq(1,10,1)
> a
 [1]  1  2  3  4  5  6  7  8  9 10
> b <- rep(a, 2)
> b
 [1]  1  2  3  4  5  6  7  8  9 10  1  2  3  4  5  6  7  8  9 10
> b <- rep(a, each = 2)
> b
 [1]  1  1  2  2  3  3  4  4  5  5  6  6  7  7  8  8  9  9 10 10
##################################################################################
> x <- c(1, 2, 3)
> x
[1] 1 2 3
> x <- rep(x, c(3, 2, 1))
> x
[1] 1 1 1 2 2 3
> length(x)
[1] 6
> str(x)
 num [1:6] 1 1 1 2 2 3

> x[1:3]
[1] 1 1 1

> x[-c(1, 2)]
[1] 1 2 2 3
############################################################################
> x <- c(1, 3, 4)
> names(x)
NULL
> names(x) <- c("a", "b", "c")
> x
a b c 
1 3 4 
> x["a"]
a 
1 
> names(x)[2]
[1] "b"
```

<br>

<br>

# 데이터 구조

### 1. 팩터(factor)

   > 1차원 데이터 구조(질적자료, 범주형 데이터)

   ```R
f <- c("apple", "banana", "melon", "melon", "apple", "banana", "berry")
f <- unique(f) # 반복되는것 제외
str(f)
mode(f)
f <- factor(f, levels = c(1, 2, 3, 4))

########################################################

x <- c(1, 2, 3, 1, 1, 4)
f <- factor(x, levels = c(1, 2, 3, 4), labels = c("melon", "apple", "banana", "berry"))

   ```

```R
> f <- c("apple", "banana", "melon", "melon", "apple", "banana", "berry")
> f
[1] "apple"  "banana" "melon"  "melon"  "apple"  "banana" "berry" 
> f <- unique(f) # 반복되는것 제외
> str(f)
 chr [1:4] "apple" "banana" "melon" "berry"
> mode(f)
[1] "character"
> f <- factor(f, levels = c(1, 2, 3, 4))
> f
[1] <NA> <NA> <NA> <NA>
Levels: 1 2 3 4

####################################################

> x <- c(1, 2, 3, 1, 1, 4)
> f <- factor(x, levels = c(1, 2, 3, 4), labels = c("melon", "apple", "banana", "berry"))
> f
[1] melon  apple  banana melon  melon  berry 
Levels: melon apple banana berry
```

<br>

### 연습문제

```r
d <- 1:100
d

odd <- d[d %% 2 == 1]
odd

odd[-c(length(d)-10:length(d))]

pick <- odd[c(3, 7, 32)]
pick

names(pick) <- c('3rd', '7th', '32th')
pick

det <- names(pick) %in% "7th"
pick[!det]

pick["3rd"] <- 3
pick

answer_2 <- 5000 * (5000 + 1) / 2
answer_2

list_5000 <- 1:5000
sum(list_5000)

answer_3 <- 50 * (2 + 100) / 2
answer_3

even <- d[d %% 2 == 0]
sum(even)

vl <- c('T', 'T', 'F', 'T')
sum(vl)
```

<br>

### 2. 행렬

```r
v1 <- c(1, 2, 3)
v2 <- c(4, 5, 6)
v3 <- c(7, 8, 9)

mat1 <- rbind(v1, v2, v3) # 열 방향으로 bind
mat2 <- cbind(v1, v2, v3) # 행 방향으로 bind
mat3 <- matrix(1:9, nrow = 3) 
mat4 <- matrix(1:12, nrow=3, dimnames=list(c("R1", "R2", "R3"), 
                                           c("C1", "C2", "C3", "C4"))) # 행, 열에 name 지정
colnames(mat4) <- c("A", "B", "C", "D") # 열 이름 따로 지정 가능
rownames(mat4)

mat4[a, b] # 행렬 원소 접근

###########
# 연산
###########

X %*% Y # 행렬곱
t(X) # Transpose matrix
solve(X) # Inverse matrix
```

<br>

### 3. 데이터 프레임

```r
data.frame(..., row.names = NULL, # row.names: 행의 이름으로 사용할 값 저장, 기본값은 NULL
           stringAsFactors = default.stringAsFactors()) 

sex <- c('F','M','M','M','F')
age <- c(21, 20, 25, 30, 26)
name <- c('철수', '길동', '관순', '감찬', '영희')

student <- data.frame(sex, age, name)
student
str(student) # info
student$sex # factor(student$sex) # sex row를 factor 로 변경
student[,1]
student$name[2]
View(student) # 데이터프레임 조회
student <- edit(student) # gui 로 데이터 수정(수정 후 저장해야 적용됨)
student

```

<br>

### 연습문제

```r
# 148p problem 9
favorite <- c("여름", "봄", "여름", "겨울", "봄",
              "겨울", "여름", "여름", "봄", "가을"
              )
favorite <- factor(favorite, levels = c("봄", "여름", "가을", "겨울"))
favorite
str(favorite)

# 149p problem 10
country <- c("호주", "독일", "영국", "일본", "미국",
             "중국", "호주", "영국", "중국", "일본",
             "터키", "미국", "중국", "중국", "호주",
             "터키", "독일", "일본", "중국", "독일"
             )
country <- factor(country, levels = c("독일", "미국", "영국", "일본",
                                      "중국", "터키", "호주"
                                      ))
levels(country)
as.integer(country)

# 194p problem 01
answer_01 <- p("데이터프레임")

# 194p problem 02
blank_A <- "관측값"
blank_B <- "변수"

# 194p problem 03
x <- c(2, 4, 6, 8)
y <- c(10, 12, 14, 16)
z <- c(18, 20, 22, 24)
m <- cbind(x, y, z)
m

matrix(c(2, 10, 18,
         4, 12, 20,
         6, 14, 22,
         8, 16, 24),
       nrow = 4, byrow = TRUE)

matrix(c(2, 4, 6, 8, 
         10, 12, 14, 16, 
         18, 20, 22, 24),
       ncol = 3, byrow = FALSE)

# 194p problem 04
x <- c(9, 7, 5, 3)
y <- c(8, 11, 2, 9)
m <- rbind(x, y)
colnames(m) <- c("a", "b", "c", "d")
rownames(m) <- c("x", "y")
m

# 195p problem 05
# (1)
m <- t(m)
m

#(2)
df <- data.frame(m)
df

#(3)
info <- vector(length=ncol(df))
df.new <- cbind(df, info)
df.new

#(4)
str(df.new)

# 195p problem 06
blood <- c("A", "O", "AB", "B", "B")
rh <- c("+", "+", "-", "+", "+")
age <- c(21, 30, 43, 17, 26)

# (1)
df <- data.frame(blood, rh, age)
df

# (2)
names(df)

# (3)
df.nb <- df[df$blood != "B",]
df.nb

# 195p problem 07
#(1)
# 50 2

#(2)
# speed, dist, num

# 195p problem 08
T
T
F
T
F

# 196p problem 09
번호 <- 1:7
제목 <- c("그대랑", "다툼", "빨래", "두통", "보조개", "매듭", "이상해")
좋아요 <- c(16075, 8218, 12119, 738, 3200, 16144, 5110)
# (1)
love <- data.frame(번호, 제목, 좋아요)
love

# (2)
best <- love[love$좋아요 == max(love$좋아요),]
best

# 196p problem 10
스티브 <- c(97, 100, 83, 95, 92)
엔더맨 <- c(88, 82, 90, 91, 87)
크리퍼 <- c(100, 96, 76, 89, 95)
mid <- rbind(스티브, 엔더맨, 크리퍼)
colnames(mid) <- c("국어", "역사", "수학", "과학", "영어")
mid <- data.frame(mid)
mid

스티브 <- c(94, 95, 90, 92, 89)
엔더맨 <- c(92, 95, 87, 95, 94)
크리퍼 <- c(100, 100, 85, 84, 96)
final <- rbind(스티브, 엔더맨, 크리퍼)
colnames(final) <- c("국어", "역사", "수학", "과학", "영어")
final <- data.frame(final)
final

average <- (mid + final) / 2
average

# 197p problem 11
str(cars)

nrow(cars)
ncol(cars)

head(cars)

summary(cars)

colMeans(cars)

max(cars$dist)

cars[cars$dist == max(cars$dist),]


# 197p problem 12
is.matrix(InsectSprays)

summary(InsectSprays)

tail(InsectSprays)

unique(InsectSprays[, colnames(InsectSprays) == "spray"])

## length(group_by(InsectSprays$spray))

InsectSprays.e <- InsectSprays[InsectSprays$spray == "E",]
InsectSprays.e

mean(InsectSprays.e$count)
```

<br>

### 4. 리스트

```r
h.list <- c("balling", "tennis", "ski")
person <- list(name='Tom', age=25, student=TRUE, hobby=h.list) # 자료형이 다른 값을 한번에 저장할 수 있다. key = value 형식의 구조 
person()
person[1:3]
person[[1]]
person$hobby[2]

```

```r
$name
[1] "Tom"

$age
[1] 25

$student
[1] TRUE

> person[[1]]
[1] "Tom"
> person$hobby[2]
[1] "tennis"
```

