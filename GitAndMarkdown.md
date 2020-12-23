# Git

### 로컬 저장소 설정

```bash
$ git init
```

 * .git 폴더 생성
 * (master) 로 현재 작업중인 브랜치 확인

#### 1. Staging

```bash
$ git add . # 디렉토리 내 모든 파일 staging
$ git add <file name> # 특정 파일만 staging
```



#### 2. Committing

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
$ git remote add origin <url>  # 원격저장소 추가
$ git remote rm origin <url> # 원격저장소 제거
```



#### 2. Branch 설정

````bash
$ git branch -M main # master 브랜치 main 으로 변경
$ git branch <branch name> # branch 생성
$ git checkout <branch name> # branch 전환
$ git checkout -b <branch name> # branch 생성 및 전환
(main) $ git merge <branch name> # main branch 로 branch 병합
$ git branch -d <branch name> # branch 삭제
````

* branch 생성 및 병합 전 **최초 1회 root commit** 을 발생시켜야 한다.

* **merge 충돌시**

  서로 다른 이력(commit)을 병합(merge)하는 과정에서 **동일 파일**이 수정되어 있는 상황.

   git이 auto merging을 하지 못하고, 해당 파일의 위치에 라벨링을 해준다. 

  원하는 형태의 코드로 직접 수정을 하고(*적절한 소스코드 에디터로*) merge commit을 발생 시켜야 한다.

* branch 병합 후 작업했던 branch 를 삭제하는 방향으로 작업을 진행하자

#### 

#### 3. 원격저장소에 업로드

```bash
$ git remote add origin <url> # push 할 github의 url
$ git push -u origin main # main 으로 업로드
```



#### 4. 원격 저장소 확인하기

```bash
$ git remote -v
origin  https://github.com/IncheonYSH/TIL.git (fetch)
origin  https://github.com/IncheonYSH/TIL.git (push)
```



#### 5. 원격저장소에서 로컬저장소로 파일 받기(Clone)

```bash \
$ git clone <url>
```

* 주의 : 작업 시 해당 프로젝트 폴더 내에서 작업해야함





### 원격저장소 push 에러 발생시

```bash
To https://github.com/IncheonYSH/GitPractice.git
 ! [rejected]        main -> main (fetch first)
error: failed to push some refs to 'https://github.com/IncheonYSH/GitPractice.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

* 원격저장소와 로컬의 commit 내역 불일치 시 에러가 발생함
* 원격 저장소와 로컬 저장소의 commit 히스토리 확인

```bash
$ git pull origin main # commit 내역 통합
```

* vim 편집기 창에서 `esc` + `:wq` 
	* w : write
	* q : quit 



* log 확인

``` bash
$ git log --oneline
```



* 다시 push

```bash
$ git push origin main
```





### Gitignore 

* `.gitignore` 파일을 생성 후에 작업
* notepad 에서 편집 하지 말것

```bash
<file name>  # 특정 파일(예시: data.csv)
<directory> # 특정 폴더(예시: secret/)
*.png # 특정 확장자
!<file name> # 특정 파일은 ignore 목록에서 제외
```

* 특정 개발환경에서 ignore 목록

  [https://gitignore.io](https://gitignore.io/)





### Undo

#### 1. WorkingDirectory 복구

```bash
$ git restore <file name> # working directory 의 변경내용을 버림(이전 버전으로 되돌아감)
```



#### 2. Stage area 복구(unstaging)

```bash
$ git restore --staged <file name> # <file name> 파일을 unstage 상태로 되돌림
```



#### 3. Commit 복구

```bash
$ git commit --amend # commit 메세지 편집 가능(vim 편집기)
```

* `i` 키로 편집모드 진입 후 메세지 편집
* 공개된 저장소에 이미 push 한 경우 commit 메세지를 변경해서는 안된다(Hash값이 변하므로).



#### 4. Commit 삭제

````bash
$ git revert <hash> # <hash> 에 해당하는 commit 삭제 및 삭제내역 commit
$ git reset --hard <hash> # <hash> 에 해당하는 commit 삭제, 삭제 내역 또한 남지 않음.
````

* `reset` 명령어의 경우 공동 프로젝트에서는 극히 제한된 용도로 사용하여야 한다.
  * `--mixed` : 기본 옵션. 해당 커밋 이후 변경사항을 Steaging area에 보관
  * `--hard` : 해당 커밋 이후 내용 모두 삭제(모든 작업 내용이 사라짐)
  * `--soft` : 해당 커밋 이후 변경사항을 working directory 보관







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
