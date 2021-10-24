# Part 1: Explore the dataset

# Install the packages
install.packages("dplyr", "readr", "ggplot2", "DataExplorer", "stringr", "tidyverse", "forcats")  

# Activate the packages
library(dplyr) 
library(readr)  
library(ggplot2) 
library(DataExplorer) 
library(stringr)
library(tidyverse)                          
library(forcats)

# Load dataset
comsci <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

# preview the dataset
glimpse(comsci)
# result summaries of various model fitting functions 
summary(comsci)
# explain the details of the dataset 
introduce(comsci) 

# Dataset details
plot_intro(comsci)
comsci %>% plot_intro()

# Check the distribution and density of the data.
# For numeric variables
comsci %>% plot_density()
comsci %>% plot_histogram() 

# For character variables
comsci %>% plot_bar() 

# Finding Relationships
comsci %>% plot_correlation() 


# Part 2: Transform data with dplyr and finding insight the data
# 1. หาราคาเฉลี่ยของหนังสือแต่ละประเภท
comsci %>% group_by(Type) %>% select(Price) %>% summarise(avg = mean(Price, na.rm = TRUE))

# 2. หนังสือเล่มไหนบ้างที่มีตั้งแต่ 1500 หน้าขึ้นไป
comsci %>% select(Book_title, Number_Of_Pages)%>% filter(Number_Of_Pages >= 1500);

# 3. หนังสือประเภทใดที่มีจำนวนมากที่สุด
comsci %>% count(Type, sort = TRUE) %>% head(n = 1L);

# 4. บอกรายละเอียดของหนังสือที่มี rating มากที่สุุด
comsci %>% filter(Rating == max(Rating));

# 5. เรียงจำนวนการดูของหนังสือประเภท e-book ในลำดับจากน้อยไปมาก
comsci %>%  filter(Type=="ebook") %>% dplyr::select(Book_title,Type,Reviews) %>% arrange(Reviews)

# 6. เปลี่ยนชื่อ variable จาก Description เป็น Explanation
names(comsci)[4] <- 'Explanation'           # rename column
comsci                                      # check the dataset again

rename(comsci, Explanation = Description)   # rename column (tidyverse package)


# Part 3: Visualization with GGplot2
scat_plot1 <- comsci %>% filter(Reviews <= 500 )%>% ggplot(aes(x=Price,y=Number_Of_Pages))+
  geom_point(aes(color=Type)) 
scat_plot1+geom_smooth(method="lm")

ggplot(data = comsci,
       mapping = aes(x = Price, y = Rating, color = Type)) +
  geom_line() +                   # add a line graph style
  geom_point() +                  # add a graph style as a point
  facet_wrap(vars(Type)) +        # grouped into category
  theme_bw()                      # make a grid


# Part 4: Using command from tidyverse (e.g. forcats, stringr)
# forcats
comsci %>%
  mutate(Type = fct_infreq(Type)) %>%
  ggplot(aes(x = Type)) + 
  geom_bar(aes(color=Type)) + 
  coord_flip()

# stringr
A <- "INT214 Statistics for IT"
str_to_lower(A)
str_to_upper(A)
str_length(A)

str_c("I", "LOVE", "214")

x <- c("gigabyte", "elegent", "together","Anyway")
str_sub(x,0,1)
