
 
## 📖 Define a question
1. เรื่องที่ทำรายได้มากที่สุด
2. ปีที่ผลิตหนังได้มากที่สุดและผลิตมาทั้งหมดกี่เรื่อง
3. วันที่ออกฉายแต่ละเรื่องในปี2016
4. 3อันดับแรกของ disneyแนวเรื่องไหน ที่ผลิตออกมามากที่สุด
5. มีประเภทหนังอะไรบ้าง เช่น ดราม่า คอมเมดี้ แอคชั่น
6. มีเรตหนังอะไรบ้างและมีจำนวนเท่าไหรในแต่หละเรตนั้น
7. อยากรู้ว่า movie rating Not Rated มีเรื่องอะไรบ้าง และเป็นประเภทอะไรบ้าง
8. อัตราเงินเฟ้อที่ปรับในขั้นต้นเฉลี่ยของหนังแต่ละประเภท


## ❗❗❗ Step 0 Loading library and dataset ❗❗❗
```{R}
#library
library(dplyr)
library(readr)
#dataset
Disney <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/011-Disney/main/Term_assignment_%5BGroup%5D/Midterm/Disney_clean.csv");
View(Disney);
```

## 1. เรื่องที่ทำรายได้มากที่สุด 🍊
#### Explain here
```{R}
Disney %>% filter(total_gross == max(total_gross));
```
#### Result
```{R}
                movie_title                 release_date      genre     mpaa_rating    total_gross    inflation_adjusted_gross   release_year
1 565 Star Wars Ep. VII: The Force Awakens   2015-12-18     Adventure       PG-13       936662225             936662225              2015
```

## 2. ปีที่ผลิตหนังได้มากที่สุดและผลิตมาทั้งหมดกี่เรื่อง 🍉
#### Explain here
```{R}
Disney <- Disney %>% count(release_year);
Disney %>% select(release_year,n) %>% filter(n == max(n));
```
#### Result
```{R}
  release_year     n
1    1995         32
```


## 3. วันที่ออกฉายแต่ละเรื่องในปี 2016 🍒
#### Explain here
```{R}
Disney %>% select(movie_title,release_date,release_year)%>% filter(release_year == "2016");
```
#### Result
```{R}
     movie_title                   release_date    release_year
1 The Finest Hours                  2016-01-29         2016
2 Zootopia                          2016-03-04         2016
3 The Jungle Book                   2016-04-15         2016
4 A Beautiful Planet                2016-04-29         2016
5 Captain America: Civil War        2016-05-06         2016
6 Alice Through the Looking Glass   2016-05-27         2016
7 Finding Dory                      2016-06-17         2016
8 The BFG                           2016-07-01         2016
9 Pete’s Dragon                     2016-08-12         2016
10 The Light Between Oceans         2016-09-02         2016
11 Queen of Katwe                   2016-09-23         2016
12 Doctor Strange                   2016-11-04         2016
13 Moana                            2016-11-23         2016
14 ogue One: A Star Wars Story      2016-12-16         2016
```


## 4. 3 อันดับแรกของ disney แนวเรื่องไหน ที่ผลิตออกมามากที่สุด 🍅
#### Explain here
```{R}
Disney %>% count(genre,sort = TRUE) %>% head(n = 3L);
```
#### Result
```{R}
   genre      n
1 Comedy     182
2 Adventure  129
3 Drama      114
```

## 5. มีประเภทหนังอะไรบ้าง เช่น ดราม่า คอมเมดี้ แอคชั่น 🍆
#### Explain here
```{R}
Disney %>% group_by(genre) %>% count();
```
#### Result
```{R}
   genre                   n
 1 Action                 40
 2 Adventure             129
 3 Black Comedy            3
 4 Comedy                182
 5 Concert/Performance     2
 6 Documentary            16
 7 Drama                 114
 8 Horror                  6
 9 Musical                16
10 Romantic Comedy        23
11 Thriller/Suspense      24
12 Western                 7
13 NA                     17
```

 
## 6. มีเรตหนังอะไรบ้างและมีจำนวนเท่าไหร่ในแต่ละเรตนั้น 🍎
#### Explain here
```{R}
Disney %>% group_by(mpaa_rating) %>% count();
```
#### Result
```{R}
  mpaa_rating     n
1 G              86
2 Not Rated       3
3 PG            187
4 PG-13         145
5 R             102
6 NA             56
```


## 7. อยากรู้ว่า movie rating Not Rated มีเรื่องอะไรบ้าง และเป็นประเภทอะไรบ้าง 🍋
#### Explain here
```{R}
Disney %>% select(movie_title,mpaa_rating) %>% filter(mpaa_rating == "Not Rated");
```
#### Result
```{R}
      movie_title           mpaa_rating
1 Bon Voyage!                Not Rated
2 The Jungle Book            Not Rated
3 America's Heart and Soul   Not Rated
```


## 8. อัตราเงินเฟ้อที่ปรับในขั้นต้นเฉลี่ยของหนังแต่ละประเภท 🍋
#### Explain here
```{R}
Disney %>% group_by(genre) %>% select(inflation_adjusted_gross) %>% summarise(avg = mean(inflation_adjusted_gross, na.rm = TRUE))
```
#### Result
```{R}
   genre                  avg
 1 Action              137473420.
 2 Adventure           190397412.
 3 Black Comedy         52243492.
 4 Comedy               84667730.
 5 Concert/Performance  57410839 
 6 Documentary          12718026.
 7 Drama                71893022.
 8 Horror               23413849.
 9 Musical             603597861 
10 Romantic Comedy      77777084.
11 Thriller/Suspense    89653790.
12 Western              73815707.
13 NA                   21623728.
```


