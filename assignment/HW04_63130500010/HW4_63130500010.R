
# Explore the dataset
------------------------
# Library
library(readr)
library(dplyr)
library(stringr)
library(ggplot2)

# dataset
book <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

# viewdataset
glimpse(book)

# สำรวจข้อมูลเบื้องต้น
summary(book)

--------------------------------------------------------------------------------

# Transform data with dplyr and finding insight the data  
-----------------------------------------------------------
# แสดงประเภทของหนังสือว่ามีอะไรบ้างและแต่ละประเภทมีจำนวนเท่าไหร่
book %>% group_by(Type) %>% count()

# รายการสั่งสินค้าใดบ้างที่มียอดขายรวมมากกว่า 100 ขึ้นไป 
book %>% select(Book_title,Price) %>% filter((Price) > 100)

# 3 อันดับหนังสือเล่มไหนที่มีจำนวนหน้าเยอะที่สุด
book %>% select(Book_title,Number_Of_Pages) %>% arrange(desc(Number_Of_Pages)) %>% head(n = 3L)

# หนังสือเรื่องไหนที่ได้เรตติ้งมากที่สุด
max_rating <- book %>% group_by(Book_title) %>% summarise(Rating = max(Rating))
max_rating %>% select(Book_title,Rating) %>% filter(Rating == max(max_rating$Rating))

# หนังสือเรื่องไหนที่มีจำนวนรีวิวเยอะที่สุด
max_view <- book %>% group_by(Book_title) %>% summarise(Review = max(Reviews))
max_view %>% select(Book_title,Review) %>% filter(Review == max(max_view$Review))

# แสดงหนังสือที่ได้เรตติ้งมากที่สุด 5 อันดับแรก
book %>% select(Book_title,Rating) %>% arrange(desc(Rating)) %>% head(n = 5L)

# แสดงหนังสือที่ไม่มีคน review เลยและบอกราคาของหนังสือเล่มนั้นๆ
book %>% select(Book_title,Reviews,Price) %>% filter(Reviews==0)

--------------------------------------------------------------------------------

#GGplot2
-----------
# แผนภูมิกราฟแสดงจำนวน ประเภทของหนังสือ
type_plot <- ggplot(book,aes(x=Type))+ geom_bar() + ggtitle("Type of book") 
type_plot

# กราฟแสดงความสัมพันธ์ระหว่าง review and rating
review_plot <-book %>% 
  filter(Reviews <= 500 ) %>% 
  ggplot(aes(x=Rating,y=Reviews))
  + geom_point(aes(color=Type)) 
  + ggtitle("relation Rating and Reviews")
  + geom_smooth()
review_plot 

