library(rvest)
url_rank <- 'https://movie.naver.com/movie/sdb/rank/rmovie.nhn'
title <- c()
link <- c()
html_rank <- read_html(url_rank, encoding = 'EUC-KR')
title_parse <- html_nodes(html_rank,'.tit3 a')
title <- html_text(title_parse)
link <- html_attr(title_parse, 'href')
for (i in 1:50){
  link[i] <- paste('https://movie.naver.com', link[i], sep="")
}

audience_star <- c()
critic_star <- c()

# Problem 1
# 개봉전 영화, 평점 정보가 없는 영화 구분하여 기록
for (i in 1:50){
  url_movie <- link[i]
  html_movie <- read_html(url_movie, encoding = 'UTF-8')
  audience_parse <- html_nodes(html_movie,
                               '#actualPointPersentBasic .star_score .st_off .st_on')
  if (length(audience_parse) == 0){
    audience_star[i] <- '개봉 전'
    critic_star[i] <- '개봉 전'
    next
  } else {
    audience_parse <- html_nodes(html_movie,
                               '.netizen_score .sc_view .star_score em')
  }

  critic_parse <- html_nodes(html_movie,
                             '.special_score .sc_view .star_score em')
  
  if (html_text(audience_parse) == '관람객 평점 없음'){
    audience_star[i] <- '평점 없음'
  }
  else{
    audience_star[i] <- gsub('[가-힣[:space:]]',"",html_text(audience_parse), perl = T)
  }

  if (html_text(critic_parse) == '0.00'){
    critic_star[i] <- '평점 없음'
  }
  else{
    critic_star[i] <- html_text(critic_parse)
  }
  
}
movie_info <- data.frame(title, link, audience_star, critic_star)
colnames(movie_info) <- c('영화 제목',
                          '세부 링크',
                          '네티즌 관람객 평점',
                          '기자 평론가 평점 ')
write.csv(movie_info,"C:/RStudy/rank50.csv")


# Problem 3
# 한줄평 전부 수집
review_crawling <- function(movie_num){
  tot_review <- c()
  url_review <- paste('https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=',
                        as.character(movie_num),
                        '&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page=',
                        as.character(1), sep="")
  html_review <- read_html(url_review, encoding = 'UTF-8')
  review_parse <- html_nodes(html_review,
                               '.score_total .total em')
  max_page <- (as.integer(gsub('[\r\n\t,]',"",html_text(review_parse), perl = TRUE)) %/% 10) + 1  
  for (i in 1:max_page){
    url_review <- paste('https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=',
                        as.character(movie_num),
                        '&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page=',
                        as.character(i), sep="")
    html_review <- read_html(url_review, encoding = 'UTF-8')
    review_parse <- html_nodes(html_review,
                               '.score_reple p')
    review <- gsub('[\r\n\t]',"",html_text(review_parse), perl = TRUE)
    review <- gsub('^관람객',"", review, perl = TRUE)
    tot_review <- append(tot_review, review)
  }
  return(tot_review)
}

review_Minari <- review_crawling(187310) # 미나리
review_DemonSlayer <- review_crawling(196051) # 귀멸의 칼날
review_MISSIONPOSSIBLE <- review_crawling(189124) # 미션 파서블


# Word cloud
library(wordcloud)
library(RColorBrewer)
library(KoNLP)

# 사전에 단어 추가
add_word <- function(word_vector){
  for(i in word_vector){
    mergeUserDic(data.frame(c(i), "ncn"))
  }
}

# 전처리(한글자 단어 제거, 특수문자 제거, 단일 자음모음 제거, 사용자 지정 제거 단어)
clean_data <- function(Data, blacklist) {
  Data <- gsub('[~!@#$%&*()_+=?<>]','',Data)
  Data <- gsub('[ㄱ-ㅎ]','',Data)
  Data <- gsub('[0-9]','',Data)
  Data <- gsub('(ㅜ|ㅠ)','',Data)
  for (i in blacklist) {
    i <- paste(i, '\\S*', sep='')
    Data <- gsub(i,'',Data)
  }
  Data <- Filter(function(x){nchar(x)>=2}, Data)
  return(Data)
}

# 전처리 후 wordcloud 생성
movie_wordcloud <- function(Data, limit, whitelist, blacklist){
  useSejongDic(backup = T)
  add_word(whitelist)
  exnoun <- sapply(Data, extractNoun, USE.NAMES = F)
  exnoun <- unlist(exnoun)
  exnoun <- clean_data(exnoun, blacklist)
  count_noun <- table(exnoun)
  top_word <- head(sort(count_noun, decreasing = T), limit)
  pal <- brewer.pal(8,"Dark2")
  wordcloud(names(top_word), top_word, random.order = F, random.color = F, rot.per=0, colors = pal)
}

whitelist <- c("노잼", "꿀잼", "극혐", "알바", "댓글알바", "댓글")
blacklist <- c("스포일러", "영화", "작품", "연기", "결말", "감독", "감상평", "들이", "해서", "때문", "진짜", "뭔가",
"하기", "무엇", "좋았습니", "하게", "무엇", "누구")
movie_wordcloud(review_Minari, 100, whitelist, c(blacklist, "미나리"))
