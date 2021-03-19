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
                          '관람객 평점',
                          '기자 평론가 평점 ')
# write.csv(movie_info,"C:/RStudy/rank50.csv")
write.csv(movie_info,"./rank50.csv")

# Problem 3
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

review_Minari <- review_crawling(187310, 5)
review_DemonSlayer <- review_crawling(196051, 5)
review_MISSIONPOSSIBLE <- review_crawling(189124, 5)