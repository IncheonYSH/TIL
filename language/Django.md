# Django

* MTV

  * Model

    데이터를 다루는 영역. 데이터베이스에 적용될 모델 설게

  * Template

    웹 어플리케이션상에서 

  * View

<br>

----

###  Init

1. 프로젝트 시작:

   가상환경 안에서 작업하여야 한다.

   ```powershell 
   django-admin startproject config .
   ```

   대부분 프로젝트는 최상위폴더에서 생성(pycharm project directory 내에 생성)

   <br>  

2. 앱 시작

   ```powershell
   django-admin startapp bookmark
   ```

   <br>  

3. settings.py 파일에서 app 등록

   ```python
   INSTALLED_APPS  = [
       ...
       ...
       ...
       'bookmark',
   ]  # "," 가 마지막 요소라도 존재하여야 한다.
   ```

   <Br>  

4. migrate => model 과 관련된 기능을 추가시키는 작업

   * dbms 의 구조를 변경하는 작업이 일어나면(Model- 테이블 생성, 테이블 수정, 필드 수정) migrate 진행

   * 생성 후 한번은 migrate만 진행

     ```powershell
     python manage.py migrate
     ```

     

   * 단, model 변경하면(모델링) - makemigration 후 migrate 명령 진행
     <br>

     

5. 서버 구동 

   ``` powershell
   python manage.py runserver
   ```

   <br>

--------

### Admin

1. admin 준비

   ```powershell
   python manage.py createsuperuser
   ```

   <Br>  

2.  db  설정

   ```python
   DATABASES = {
       'default': {
           'ENGINE': 'django.db.backends.sqlite3', # 변경하려는 db 엔진명 찾아서 기록
           'NAME': BASE_DIR/ 'db.sqlite3', # 해당 dbms 파일 경로 및 이름
       }
   }
   ```

   <br>

     

3. 시간 설정

   ``` python
   TIME_ZONE = 'Asia/Seoul' 
   ```

   <br>

   

4. 정적파일 경로 설정

   ```python
   STATIC_URL = '/static/' # js, css, image 파일 등. base_dir 의 하위 디렉토리여야 함
   ```



<br>

------

### Model

1. models.py 생성

2. build model

3. admins.py 등록

4. manage.py makemigrations 명령 수행

5. manage.py migrate

6. 반영 확인(admin 사이트에서 확인)

   : dbms 인터페이스 툴로 확인

   <br>



--------

### Url mapping

1. urls.py 파일에 urlpatterns 등록

   ```python
   from django.contrib import admin
   from django.urls import path
   
   urlpatterns = [ # url/view 매핑 방식은 동일. rul 패턴 매칭을 위에서 아래로 진행하면서 정의 해야한다.
       path('admin/', admin.site.urls),
       path('polls/', views.index, name = 'index'), # 서버주소/polls/
       path('polls/<int:question_id>', views.detail, name = 'detail'), # 서버주소/polls/5
       path('polls/<int:question_id>/results/', views.result, name = 'results'), # 서버주소/polls/5/results
       path('polls/<int:question_id>/vote', views.vote, name = 'vote'), # 서버주소/polls/5/vote
   ]
   ```

    <br>

   하지만 위와 같이 등록한다면 urlpatterns 의 길이가 너무 길어지므로 

   * url 을 각 app 별로 분리

   * `config/urls.py` 에는 앱 전용 url 만 설정

     ```python
     # config/urls.py
     
     from django.contrib import admin
     from django.urls import path
     from django.urls import include
     from polls import views
     
     urlpatterns = [ # url/view 매핑 방식은 동일. rul 패턴 매칭을 위에서 아래로 진행하면서 정의 해야한다.
         path('admin/', admin.site.urls),
         path('polls/', include('polls.urls')), # pools/ 로 시작되는 url 은 polls.urls 파일에서 처리
     ]
     ```

     <br>

     

   * app 디렉토리에 urls.py 생성 및 설정

     > 여기에서는 예시로 `polls/urls.py` 를 생성하였다

     ```python
     # polls/urls.py
     from django.urls import path
     from django.urls import include
     from polls import views
     
     urlpatterns = [
         path('', views.index, name = 'index'), # 서버주소/polls/
         path('polls/<int:question_id>', views.detail, name = 'detail'), # 서버주소/polls/5
         path('polls/<int:question_id>/results/', views.result, name = 'results'), # 서버주소/polls/5/results
         path('polls/<int:question_id>/vote', views.vote, name = 'vote'), # 서버주소/polls/5/vote
     ]
     ```

     <br>

       

   * `polls/view.py` 설정

     ```python 
     from django.shortcuts import render
     from django.http import HttpResponseRedirect
     from django.urls import reverse
     from django.shortcuts import get_object_or_404
     
     def index(request):
         return render(request, 'polls/index.html')
     ```

     

-----

### Templates

1. Templates directory  설정

   >  `'DIRS': []` 가 app/templates/app/*.html 을 의미하므로

   해당 디렉토리에 *.html 파일을 생성하여야 한다.

   ```python
   # settings.py
   
   TEMPLATES = [
       {
           'BACKEND': 'django.template.backends.django.DjangoTemplates',
           'DIRS': [], # [] 는 #app/templates/app/*.html 을 의미함
           'APP_DIRS': True,
           'OPTIONS': {
               'context_processors': [
                   'django.template.context_processors.debug',
                   'django.template.context_processors.request',
                   'django.contrib.auth.context_processors.auth',
                   'django.contrib.messages.context_processors.messages',
               ],
           },
       },
   ]
   ```

<br>

2. query 설정(views 파일 설정)

   > dbms 와의 연결은 models.py 가 해결하므로 다른 파일에서는 models 를 import 한다.

   ```python
   from django.shortcuts import render
   from django.http import HttpResponseRedirect
   from django.urls import reverse
   from django.shortcuts import get_object_or_404
   
   from polls.models import choice, question
   
   def index(request):
       
       
       latest_question_list = question.objects.all().order_by('-pub_date')
       
       # templat 에서 쓰는 변수명과 python 객체를 연결한다. 딕셔너리 자료형으로 표현해야한다.
       context = {'latest_question_list': latest_question_list,}
       
       # templates 파일을 전송할 수 있도록 처리, HttpResponse
       return render(request, 'polls/index.html', context) 
   ```

   <br>

3. Template 제어

   ```django
   {% if latest_question_list %}
       <!-- views.py 에서 넘어온 context 의 내용이 있으면 아래 작업 수행 -->
       <ul>
       {% for question in latest_question_list %}
          <li><a href="/polls/{{ question.id }}/">{{ question.question_text }}</a></li>
       {% endfor %}
       </ul>
   {% else %}
       <!-- views.py 에서 넘어온 context 의 내용이 없으면 아래 작업 수행 -->
       <p>No polls are available</p>
   {% endif %}
   ```




<br>

----

### image



4. 업로드 될 이미지 저장공간 지정

   `settings.py media` 디렉토리

```django
{% }
```

<br>

4. `url.py` 에 media 디렉토리 url 설정

   ```python
   urlpatterns += static()
   ```

   









# 어플리케이션 설계

교재 95p 참고





