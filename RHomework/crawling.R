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
# 한 페이지에 리뷰 10개
# 원하는 페이지 수 만큼 가능, default 10
review_crawling <- function(movie_num, max_page = 10){
  tot_review <- c()
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

review_Minari <- review_crawling(187310, 280)
review_DemonSlayer <- review_crawling(196051, 20)
review_MISSIONPOSSIBLE <- review_crawling(189124, 20)
review_group <- data.frame(review_Minari, review_DemonSlayer, review_MISSIONPOSSIBLE)
names(review_group) <- c("미나리", "귀멸의 칼날", "미션 파서블")
head(review_group)

# Word cloud
library(wordcloud)
library(RColorBrewer)
library(KoNLP)

add_word <- function(word_vector){
  for(i in word_vector){
    mergeUserDic(data.frame(c(i), "ncn"))
  }
}

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

movie_wordcloud <- function(Data, limit, blacklist){
  exnoun <- sapply(Data, extractNoun, USE.NAMES = F)
  exnoun <- unlist(exnoun)
  exnoun <- clean_data(exnoun, blacklist)
  count_noun <- table(exnoun)
  top_word <- head(sort(count_noun, decreasing = T), limit)
  pal <- brewer.pal(8,"Dark2")
  wordcloud(names(top_word), top_word, random.order = F, random.color = F, rot.per=0, colors = pal)
}

useSejongDic(backup = T)
whitelist <- c("노잼", "꿀잼", "극혐", "알바", "댓글알바", "댓글")
blacklist <- c("스포일러", "영화", "작품", "연기", "결말", "감독", "스포일러", "감상평", "들이", "해서", "때문", "진짜", "뭔가",
"하기", "무엇", "좋았습니", "하게", "무엇", "누구")
add_word(whitelist)
movie_wordcloud(review_Minari, 100, c(blacklist, "미나리"))
