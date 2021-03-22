
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

# Problem 1
# 개봉전 영화, 평점 정보가 없는 영화 구분하여 기록
audience_star <- c()
critic_star <- c()

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
  tot_score <- c()
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
    score_parse <- html_nodes(html_review,
                               '.star_score em')
    review_parse <- html_nodes(html_review,
                               '.score_reple p')
    score <- gsub('[\r\n\t]',"",html_text(score_parse), perl = TRUE)
    review <- gsub('[\r\n\t]',"",html_text(review_parse), perl = TRUE)
    review <- gsub('^관람객',"", review, perl = TRUE)
    tot_review <- append(tot_review, review)
    tot_score <- append(tot_score, score)
  }
  result <- data.frame(tot_review, tot_score)
  names(result) <- c("review", "score")
  return(result)
}

review_Minari <- review_crawling(187310) # 미나리
review_DemonSlayer <- review_crawling(196051) # 귀멸의 칼날
review_MISSIONPOSSIBLE <- review_crawling(189124) # 미션 파서블
write.csv(review_Minari,"C:/RStudy/review_Minari.csv")
write.csv(review_DemonSlayer,"C:/RStudy/review_DemonSlayer.csv")
write.csv(review_MISSIONPOSSIBLE,"C:/RStudy/review_MISSIONPOSSIBLE.csv")

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
"하기", "무엇", "좋았습니", "하게", "무엇", "누구", "윤여", "오랜만", "정도")
movie_wordcloud(review_Minari, 100, whitelist, c(blacklist, "미나리"))


# 감성분석
library(KoNLP)
library(stringr)
library(glmnet)
library(plyr)

# custom dict
setwd('C:/Users/SH/Desktop/bigdata/강의메모/RHomework')
dict_pos <- readLines("custom_pos.txt", encoding = "UTF-8")
dict_neg <- readLines("custom_neg.txt", encoding = "UTF-8")

sentimental <- function(sentences, positive, negative){
  scores = laply(sentences, function(sentence, positive, negative) {
    sentence <- gsub('[[:punct:]]', '', sentence) # 문장부호 제거
    sentence <- gsub('[[:cntrl:]]', '', sentence) # 특수문자 제거
    sentence <- gsub('\\d+', '', sentence)        # 숫자 제거
    
    word.list <- NaN
    if(class(try(ss <- SimplePos09(sentence)))=="try-error"){
      word.list <- NA
    } else {
      ss <- gsub('/[A-Za-z0-9]+','', sentence)
      word.list <- ss
    }

    word.list <- str_split(sentence, '\\s+|[+]') 
    words <- unlist(word.list)                    
    
    pos.matches <- match(words, positive)           # words의 단어를 positive에서 matching
    neg.matches <- match(words, negative)
    
    pos.matches <- !is.na(pos.matches)            # NA 제거, 위치(숫자)만 추출
    neg.matches <- !is.na(neg.matches)
    
    score <- sum(pos.matches) - sum(neg.matches)  # 긍정 - 부정   
    return(score)
  }, positive, negative)
  scores.df <- data.frame(score=scores, text=sentences)
  return(scores.df)
}

custom_sentimental <- sentimental(review_DemonSlayer$review, dict_pos, dict_neg)
write.csv(custom_sentimental,"C:/RStudy/custom_sentimental.csv")

# glmnet
sam_index <- sample(1:length(review_DemonSlayer$review),1000)
head(sam_index)

sam_com <- review_DemonSlayer$review[sam_index]
sam_score <- review_DemonSlayer$score[sam_index]

data_list <- list()
for (i in 1:length(sam_com)){
  if(class(try(ss <- SimplePos09(sam_com[i]))) == "try-error"){
    data_list[[i]] <- NA
  } else {
    data_list[[i]] <- ss
  }
}

head(data_list,1)

head_morpheme <- function(x){
  sapply(str_split(x,"/"),function(x){x[1]})
}

data_split <- sapply(data_list, head_morpheme)
words_split <- unlist(data_split)

tbl <- table(words_split)
top_words<-names(sort(tbl, decreasing = T)[1:300])
head(top_words)

dtm <- matrix(0, ncol=length(top_words), nrow=length(sam_com))
colnames(dtm) <- top_words

top_words %in% data_split[[1]]
dtm[1,top_words %in% data_split[[1]]] <- 1
dtm[1,]

for(i in 1:length(data_split)){
  dtm[i,top_words %in% data_split[[i]]] <- 1
  cat("\n",i)
}
tail(dtm,3)

score2 <- ifelse(sam_score >3,1,0)

d_index <- apply(dtm, 1, sum) != 0
dtm_fin <- dtm[d_index, ] #학습 리뷰 데이터(dtm)
score_fin <-score2[d_index] #리뷰에 대한 라벨
length(score_fin)
dim(dtm_fin)

ss<- sample(1:length(score_fin),length(score_fin)*0.7)
head(dtm_fin[ss,]) #학습데이터
head(dtm_fin[-ss,]) #테스트데이터

fit = glmnet(dtm_fin[ss,],score_fin[ss],alpha = 1, family = "binomial",nlambda = 100)
s <- fit$lambda[length(fit$lambda)]
s
coef(fit, s=s)

pred <- predict(fit,dtm_fin[-ss,],s=s)
pred

pred2 <- ifelse(pred > 0,1,0)
pred2
sum(pred2 == score_fin[-ss] )/length(pred2) ## 0.7885906

fit = glmnet(dtm_fin[ss,],score_fin[ss],alpha = 0, family = "binomial",nlambda = 100)
s <- fit$lambda[length(fit$lambda)]
s
coef(fit, s=s)

pred <- predict(fit,dtm_fin[-ss,],s=s)
pred

pred2 <- ifelse(pred > 0,1,0)
pred2
sum(pred2 == score_fin[-ss] )/length(pred2) ## 0.8657718


fit = glmnet(dtm_fin[ss,],score_fin[ss],alpha = 0, family = "binomial",nlambda = 100)
s <- fit$lambda[length(fit$lambda)]
coef_data <- coef(fit, s=s)
class(coef_data)
coef_data <- as.matrix(coef_data)
