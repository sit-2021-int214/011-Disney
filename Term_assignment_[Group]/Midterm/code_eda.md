# 🎯 Disney Dataset
 -  [Dataset from](./011-Disney/Term_assignment_[Group]/Midterm/Disney_clean.csv) : Dataset from

## 📑 Steps
1. กำหนดหัวข้อที่จะทำ
2. ค้นหาข้อมูล Data จาก Kaggle
3. ช่วยกันเลือกว่าควรจะเอาชุดข้อมูลไหนจากทั้งหมดที่ได้ค้นหามา
4. ทำการ Data Cleaning และ Data Transformation ข้อมูลที่ได้เลือกมา
5. ทำการวิเคราะห์ข้อมูลที่ได้ทำการ Data Cleaning และ Data Transformation 
 
## 📖 Define a question
1. เรื่องที่ทำรายได้มากที่สุด
2. ในแต่ละปีผลิตได้กี่เรื่อง
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
Disney <- read.csv("D:/INT214/midterm/Disney_clean.csv");
View(Disney);
```

# 1. เรื่องที่ทำรายได้มากที่สุด 🍊
#### Explain here
```{R}
Disney %>% filter(total_gross == max(total_gross));
```
#### Result
```{R}
 X                          movie_title release_date     genre mpaa_rating total_gross inflation_adjusted_gross release_year
1 565 Star Wars Ep. VII: The Force Awakens   2015-12-18 Adventure       PG-13   936662225                936662225         2015
```

# 2. ในแต่ละปีผลิตได้กี่เรื่อง 🍉
#### Explain here
```{R}
Disney %>% count(release_year);
```
#### Result
```{R}
   release_year  n
1          1937  1
2          1940  2
3          1946  1
4          1950  1
5          1954  1
6          1955  1
7          1959  1
8          1961  3
9          1962  1
10         1963  1
11         1967  1
12         1968  1
13         1970  2
14         1971  1
15         1975  1
16         1977  4
17         1979  1
18         1980  2
19         1981  4
20         1982  3
21         1983  4
22         1984  2
23         1985  6
24         1986  7
25         1987 10
26         1988 12
27         1989 11
28         1990 15
29         1991 16
30         1992 22
31         1993 27
32         1994 30
33         1995 32
34         1996 28
35         1997 23
36         1998 22
37         1999 21
38         2000 19
39         2001 14
40         2002 22
41         2003 19
42         2004 19
43         2005 17
44         2006 19
45         2007 14
46         2008 13
47         2009 16
48         2010 14
49         2011 14
50         2012 10
51         2013 11
52         2014 12
53         2015 11
54         2016 14
```


# 3. วันที่ออกฉายแต่ละเรื่องในปี2016 🍒
#### Explain here
```{R}
Disney %>% select(movie_title,release_date,release_year)%>% filter(release_year == "2016");
```
#### Result
```{R}
                      movie_title release_date release_year
1                 The Finest Hours   2016-01-29         2016
2                         Zootopia   2016-03-04         2016
3                  The Jungle Book   2016-04-15         2016
4               A Beautiful Planet   2016-04-29         2016
5       Captain America: Civil War   2016-05-06         2016
6  Alice Through the Looking Glass   2016-05-27         2016
7                     Finding Dory   2016-06-17         2016
8                          The BFG   2016-07-01         2016
9                    Pete’s Dragon   2016-08-12         2016
10        The Light Between Oceans   2016-09-02         2016
11                  Queen of Katwe   2016-09-23         2016
12                  Doctor Strange   2016-11-04         2016
13                           Moana   2016-11-23         2016
14    Rogue One: A Star Wars Story   2016-12-16         2016
```


# 4. 3อันดับแรกของ disneyแนวเรื่องไหน ที่ผลิตออกมามากที่สุด 🍅
#### Explain here
```{R}
Disney %>% count(genre,sort = TRUE) %>% head(n = 3L);
```
#### Result
```{R}
      genre   n
1    Comedy 182
2 Adventure 129
3     Drama 114
```

# 5. มีประเภทหนังอะไรบ้าง เช่น ดราม่า คอมเมดี้ แอคชั่น 🍆
#### Explain here
```{R}
Disney %>% group_by(genre) %>% count();
```
#### Result
```{R}
# A tibble: 13 x 2
# Groups:   genre [13]
   genre                   n
   <chr>               <int>
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

 
# 6. มีเรตหนังอะไรบ้างและมีจำนวนเท่าไหรในแต่หละเรตนั้น 🍎
#### Explain here
```{R}
Disney %>% group_by(mpaa_rating) %>% count();
```
#### Result
```{R}
# A tibble: 6 x 2
# Groups:   mpaa_rating [6]
  mpaa_rating     n
  <chr>       <int>
1 G              86
2 Not Rated       3
3 PG            187
4 PG-13         145
5 R             102
6 NA             56
```


# 7. อยากรู้ว่า movie rating Not Rated มีเรื่องอะไรบ้าง และเป็นประเภทอะไรบ้าง 🍋
#### Explain here
```{R}
Disney %>% select(movie_title,mpaa_rating) %>% filter(mpaa_rating == "Not Rated");
```
#### Result
```{R}
              movie_title mpaa_rating
1              Bon Voyage!   Not Rated
2          The Jungle Book   Not Rated
3 America's Heart and Soul   Not Rated
```


# 8. อัตราเงินเฟ้อที่ปรับในขั้นต้นเฉลี่ยของหนังแต่ละประเภท 🍋
#### Explain here
```{R}
Disney %>% group_by(genre) %>% select(inflation_adjusted_gross) %>% summarise(avg = mean(inflation_adjusted_gross, na.rm = TRUE))
```
#### Result
```{R}
# A tibble: 13 x 2
   genre                      avg
   <chr>                    <dbl>
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









