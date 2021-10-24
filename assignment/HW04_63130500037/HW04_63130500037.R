# R-Assignment 4
#Created by ณิชกานต์  สถาพร  (ID: 63130500037)
#Choose Dataset:
#Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, Kaggle) >> Using CSV
#Outlines
#1.Explore the dataset
#2.Learning function from Tidyverse
#3.Transform data with dplyr and finding insight the data
#4.Visualization with GGplot2

# Part A: Finding Insight the data in R
#Part 1: Explore the dataset
# Library
library(dplyr)
library(readr)
# Dataset
topbooks <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")


#Explore the dataset
View(topbooks)
glimpse(topbooks)

#หาค่า NA ของแต่ละ Columns
is.na(topbooks$Rating) %>% sum()
is.na(topbooks$Reviews) %>% sum()
is.na(topbooks$Book_title) %>% sum()
is.na(topbooks$Description) %>% sum()
is.na(topbooks$Number_Of_Pages) %>% sum()
is.na(topbooks$Type) %>% sum()
is.na(topbooks$Price) %>% sum()



#Part 2: Learning function from Tidyverse
# Library
install.packages("tidyverse")
library(stringr) 
library(tidyr)

#1 ทำการสร้างคอลัมน์ใหม่ขึ้นมาจากคอลัมน์ Type โดยตารางที่แสดงใหม่จะให้แสดงเพียงตัวอักษรตัวแรกเท่านั้น
topbooks$ abbreviation <- substr(topbooks$Type,1,1) 

#2 ให้ทำการรวมคอลัมน์ของ Rating กับ abbreviation จากการสร้างที่ผ่านมาเข้าด้วยกัน
topbooks %>% unite(R_and_T,c(Rating,abbreviation),remove = FALSE)


#Part 3: Transform data with dplyr and finding insight the data
# Library
library(dplyr)

#1 5อันดับแรกของหนังสือที่ได้รับคะแนนมากที่สุด
topbooks %>% select(Book_title,Rating) %>%
  arrange(desc(Rating)) %>% head(n = 5L)

#2 หนังสือทั้งหมดมีกี่ประเภทและแต่ละประเภทมีทั้งหมดกี่เรื่อง
topbooks %>% select(Type) %>% count(Type,sort = FALSE)
#หรือ
topbooks %>% group_by(Type) %>% count()
#หรือ
topbooks %>% count(Type) 

#3 อันดับประเภทหนังสือที่มีหน้ามากที่สุดและชื่อหนังชื่ออะไร
topbooks %>% select(Number_Of_Pages,Type,Book_title) %>%
  arrange(desc(Number_Of_Pages)) %>% head(n = 3L)

#4 5 อันดับชื่อหนังสือที่มีรีวิวมากที่สุดและอยู่ในประเภทไหน
topbooks %>% select(Reviews,Book_title,Type) %>%
  arrange(desc(Reviews)) %>% head(n = 5L)

#5 ราคาเฉลี่ยของหนังสือแต่ละประเภท
topbooks %>% group_by(Type) %>% select(Price) %>% 
  summarise(avg = mean(Price, na.rm = TRUE)) 

#6 5 อันดับราคาหนังสือที่มีราคาแพงมากที่สุดอยู่ในประเภทอะไรและชื่อหนังสือคืออะไร
topbooks %>% select(Price,Type,Book_title) %>%
  arrange(desc(Price)) %>% head(n = 5L)

#7 5 อันดับราคาหนังสือที่มีราคาถูกที่สุดอยู่ในประเภทอะไรและชื่อหนังสือคืออะไร
topbooks %>% select(Price,Type,Book_title) %>%
  arrange(Price) %>% head(n = 5L)

#8 ค้นหาหนังสือที่มีคะแนนมากกว่า 4.60 ขึ้นไปและอยู่ในประเภทอะไร
topbooks %>% select(Book_title,Rating,Type) %>% filter(Rating > 4.60)

#9 คะแนนเฉลี่ยของหนังสือแต่ละประเภท
topbooks %>% group_by(Type) %>% select(Rating) %>% 
  summarise(avg = mean(Rating, na.rm = TRUE)) 

#10 ค้นหาจำนวนหนังสือในแต่หละประเภทที่มีราคาสูงกว่าราคาเฉลี่ย
topbooks %>% 
  filter(Price > mean(Price, na.rm = TRUE)) %>%
  group_by(Type) %>% count() 



# Part 4: Visualization with GGplot2
# Library
install.packages("ggplot2")
library(tidyr)
library(ggplot2)
library(dplyr)

#สร้างกราฟเส้นเพื่อแสดงค่าเฉลี่ยของหนังสือแต่ละประเภท
topbooks_avg <- topbooks %>% group_by(Type) %>% select(Price) %>% 
summarise(avg = mean(Price, na.rm = TRUE)) 
#GGplot2
  ggplot(topbooks_avg,aes(x=Type,y=avg,group=1))+
  geom_line(color="red",size=2)+
  geom_point(color="blue",size=3)+ 
  geom_text(aes(label=avg ,vjust= -0.40)) +
  ggtitle("Average price for each type of book")+
  xlab("Type of books") + 
  ylab("average") 
  
#สร้างกราฟแท่งเพื่อแสดงจะนวนหนังสือที่อยู่ในแต่ละประเภท
  number_of_books <- topbooks %>% select(Type) %>% 
  count(Type,sort = FALSE)
#GGplot2
  ggplot(number_of_books,aes(x=Type,y=n,fill=Type)) +
  geom_bar(stat ="identity") +
  geom_text(aes(label=n), vjust= -0.25)+
  ggtitle("Number of books in each category") +
  xlab("Type of book") + 
  ylab("Number of books") 



