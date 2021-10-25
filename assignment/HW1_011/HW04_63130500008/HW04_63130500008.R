#library
library(dplyr)
library(readr)
library(ggplot2)

install.packages("tidyverse")
library(tidyverse)
library(forcats)
# read data
books <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
View(books)
glimpse(books)

#introduce() 
books %>% introduce();


fa  <-  factor ( "a" ) 
fb  <-  factor ( "b" ) 
fab  <-  factor ( c ( "a" ,  "b" ))

c ( fa ,  fb ,  fab ) 
fct_c ( fa ,  fb ,  fab )


fs  <-  list ( fa ,  fb ,  fab ) 
fct_c ( !!! fs ) 


#ริวิวมากสุด ราคาเท่าไหร่ 
books %>% select(Reviews,Book_title,Price) %>%
  arrange(desc(Reviews)) %>% head(n = 10L);

#เรทติ้งมากสุดราคาเท่าไหร่ 
books %>% select(Rating,Book_title,Price) %>%
  arrange(desc(Rating)) %>% head(n = 10L);

#หน้ามากสุดราคาเท่าไหร่  
books %>% select(Number_Of_Pages,Book_title,Price) %>%
  arrange(desc(Number_Of_Pages)) %>% head(n = 10L);

#หนังสือราคาเท่าไหร่  
books %>% select(Price,Description,Book_title) %>%
  arrange(desc(Price)) %>% head(n = 10L)


#หนังสือที่แพงที่สุด ประเภทไหน
books %>% select(Type,Book_title,Price) %>%
  arrange(desc(Price)) %>% head(n = 10L);

#หนังสือแต่ละประเภทมีกี่เล่มและราคาแพงที่สุดคือราคาเท่าไหร่
books %>% group_by(Type) %>% 
summarise(count =n(),
          Price_max = max(Price)); 


books %>% 
  filter(Rating >4.5 & Reviews !=0)



book_summary <- books%>% select(Rating,Reviews,Price,Type);



ggplot(book_summary, aes(Rating,fct_recode(Reviews,Rating)))+
  geom_point()

ggplot(books,aes(x=Price))+geom_bar()

marvel_plot <- ggplot(Marvels,aes(x=years)) + geom_bar(stat="identity", width = 0.5)

