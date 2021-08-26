# Exercise 1

vable <-c (10.4, 5.6, 3.1, 6.4, 21.7)

mean(vable)    #9.44
sum(vable)     #47.2
median(vable)  #6.4
sd(vable)      #7.33846
var(vable)     #53.853


# Exercise 2

# List of Marvel movies (Order by Marvel Phase released)
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

# List of released year of Marvel movies
years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))

# reason to use this data structure
              #Columns can store tabular data for easy viewing, can be character and numeric data.

#The numbers of movies
length(names) #27

#Finding the 19th movies name
names[19]     #Avengers: Infinity War

#Which year is most released movies
             #2017, 2021
