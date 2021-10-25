# Part 1
# Library
library(readr)      # read .csv file
library(dplyr)      # use %>% function
library(ggplot2)    # Plotting graph
library(stringr)    # Changing of data format
library(forcats)    # Provide a suite of tools that solve common
library(DescTools)  # For better use in exploring data and more function
library(scales)     # use find percent

# Dataset
Books <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/027-Quickest-Electric-Cars/main/assignment/Homework04/HW04_63130500087/data.csv")
View(Books)

# Explore dataset
glimpse(Books)

# Find the NA of each column.
is.na(topbooks$Rating) %>% sum()
is.na(topbooks$Reviews) %>% sum()
is.na(topbooks$Book_title) %>% sum()
is.na(topbooks$Description) %>% sum()
is.na(topbooks$Number_Of_Pages) %>% sum()
is.na(topbooks$Type) %>% sum()
is.na(topbooks$Price) %>% sum()

# Clean data column "Type" cleaned the word "Box set"
Books$Type <- Books$Type %>% str_remove("Boxed Set -") %>% str_trim()
View(Books)

------------------------------------------------------------

# Part 2
# Package stringr
# str_remove
Books$Type %>% str_remove("Boxed Set -")
# str_count
str_count(Books$Description, "[aeiou]")

# Package readr
# read_csv
Books <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/027-Quickest-Electric-Cars/main/assignment/Homework04/HW04_63130500087/data.csv")
# cols_condense()
cols_condense(Books)
# spec
spec(Books)

# Package forcats

# Package dplyr
# select()
Books %>% select(Rating,Book_title,Price)
# glimpse()
glimpse(Books)
# count()
Books %>% count()
Books %>% count(Type == "ebook")
# filter()
Books %>% filter(Number_Of_Pages <= 200)
# arrange()
Books %>% arrange(Price) #
Books %>% arrange(desc(Rating)) #
# distinct()
Books %>% select(Type) %>% distinct()
# summarise()
Books %>% summarise(Books)
# group_by()
Books %>% group_by(Type)
# tally()
Books %>% group_by(Type) %>% tally(sort = TRUE)
# group_size()
group_size(Books)
# as.factor()
as.factor(Books$Price)

# Package ggplot2
# coord_flip()
ggplot(Books,aes(x = Type)) + geom_bar() + coord_flip()

------------------------------------------------------------

# Part 3
# What are the top 3 books with the highest ratings?
Books %>% select(Book_title,Rating) %>% arrange(desc(Rating)) %>% head(n = 3L)
# What are some books that price less than 200 ?
Books %>% select(Book_title,Number_Of_Pages) %>% filter(Number_Of_Pages < 200)
# What books are not reviewed at all and how many?
Books %>% select(Book_title,Reviews) %>% filter(Reviews == 0)
# How many books are reviewed in all 270 books?
SumReviews <- Books %>% count(Reviews)
sum(SumReviews)
# How many e-books are there?
Books %>% filter(Type == "ebook") %>% group_by(Type) %>% tally(sort = TRUE)
# Which book doesn't know the type of book and how much per book?
Books %>% select(Book_title,Type,Price) %>% filter(Type == "Unknown Binding")
# What types of books are there and How many books are there in each type of book?
Books %>% group_by(Type) %>% count()
# What is the average price for each type of book?
Books %>% group_by(Type) %>% select(Price) %>% summarise(avg = mean(Price, na.rm = TRUE)) 
# Which book and in what genre has a rating of more than 4.50?
Books %>% select(Rating,Book_title,Type) %>% filter(Rating > 4.50)

------------------------------------------------------------

# Part 4
# 1: Graph show type of book
# Bar Chart
ggplot(Books,aes(x = Type, fill = Type)) + geom_bar() + ggtitle("Type of Book")
type_plot <- ggplot(Books,aes(x = Type, fill = Type)) + geom_bar() + ggtitle("Type of Book") + coord_flip() + 
             xlab("Types") + ylab("Number of Books") + 
             scale_fill_manual(values = c("#eeb189", "#f9acc0", 
                                          "#d9debb", "#c4b3c3", "#86a5c4" ))
type_plot
  
# Pie Chart
group_type <- data.frame(table(Books$Type))
group_type <- group_type %>% rename("Type" = Var1,"count" = Freq)

group_type %>% ggplot(aes(x = "",y = count, fill = Type)) + 
               geom_bar(stat ="identity", width = 1, color = "white") +
               coord_polar("y", start = 0)+
               theme_void() +
               geom_text(aes(label = percent(count/sum(count))),
               position = position_stack(vjust = 0.5), size = 4, color = "black") + 
               ggtitle("Type of Book") +
               scale_fill_manual(values = c("#eeb189", "#f9acc0", 
                                            "#d9debb", "#c4b3c3", "#86a5c4" ))

# 2: Scatter Plot
# Graph show relation between price and rating
Books %>% ggplot(aes(x = Rating,y = Price)) + geom_point()
ratingPrice_plot <- Books %>% ggplot(aes(x = Rating,y = Price)) + 
                    geom_point(aes(color=Type)) + ggtitle("Relation Between Price and Rating")
ratingPrice_plot
ratingPrice_plot + geom_smooth()
ratingPrice_plot + geom_smooth(method="lm") + theme_minimal() + 
                   theme(panel.grid = element_line(linetype = "dashed"))

# 3: Box Plot
# Graph show Number of Pages in the Book.
rating_plot <- Books %>% ggplot(aes(x = Number_Of_Pages)) + geom_boxplot(outlier.colour = "#d54700") + 
               ggtitle("Number of Pages in the Book") + theme_light() 
rating_plot
