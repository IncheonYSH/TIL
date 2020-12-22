# Git



### 로컬 저장소 설정

```bash
$ git init
```

 * .git 폴더 생성
 * (master) 로 현재 작업중인 브랜치 확인

#### 1. staging

```bash
$ git add . # 디렉토리 내 모든 파일 staging
$ git add <file name> # 특정 파일만 staging
```



#### 2. committing

```bash
$ git commit -m 'version name' # commit
```



#### 3. User Config

```bash
$ git config --global user.name 'IncheonYSH'
$ git config --global user.email 'ysh121095@gmail.com'

$ git config --global -l
user.name=IncheonYSH
user.email=ysh121095@gmail.com
```



### 원격저장소(github 업로드)



#### 1. 원격저장소 설정

```bash
$ git remote add origin <url>  #원격저장소 추가
$ git remote rm origin <url> #원격저장소 제거
```



#### 2. branch 설정

````bash
$ git branch -M main #Master 브랜치 이름 Main 으로 변경
````



#### 3. push

```bash
$ git remote add origin <url> #push 할 github의 url
$ git push -u origin <branch name> #<branch name> 으로 업로드
```



#### 4. 원격 저장소 확인하기

```bash
$ git remote -v
origin  https://github.com/IncheonYSH/TIL.git (fetch)
origin  https://github.com/IncheonYSH/TIL.git (push)
```







# Mark down

**볼드**

*이탤릭*

~~취소선~~

# # 글씨 크기

## ## 글씨 크기

### ### 글씨 크기

#### #### 글씨 크기

##### ##### 글씨 크기

###### ```(언어)
###### ```
