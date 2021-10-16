# 🎯 Disney Dataset
 -  [Dataset from](.011-Disney/Term_assignment_[Group]/Midterm/Disney_clean.csv) : Dataset from

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
7. อยากรู้ว่า movie rating PG มีเรื่องอะไรบ้าง และเป็นประเภทอะไรบ้าง
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


```

# 2. ในแต่ละปีผลิตได้กี่เรื่อง 🍉
#### Explain here
```{R}
Disney %>% count(release_year);
```
#### Result
```{R}


```


# 3. วันที่ออกฉายแต่ละเรื่องในปี2016 🍒
#### Explain here
```{R}
Disney %>% select(movie_title,release_date,release_year)%>% filter(release_year == "2016");
```
#### Result
```{R}


```


# 4. 3อันดับแรกของ disneyแนวเรื่องไหน ที่ผลิตออกมามากที่สุด 🍅
#### Explain here
```{R}
Disney %>% count(genre,sort = TRUE) %>% head(n = 3L);
```

#### Result
```{R}


```

# 5. มีประเภทหนังอะไรบ้าง เช่น ดราม่า คอมเมดี้ แอคชั่น 🍆
#### Explain here
```{R}
Disney %>% group_by(genre) %>% count();
```

#### Result
```{R}


```


 
# 6. มีเรตหนังอะไรบ้างและมีจำนวนเท่าไหรในแต่หละเรตนั้น 🍎
#### Explain here
```{R}
Disney %>% group_by(mpaa_rating) %>% count();
```

#### Result
```{R}


```



# 7. อยากรู้ว่า movie rating R มีเรื่องอะไรบ้าง และเป็นประเภทอะไรบ้าง 🍋
#### Explain here
```{R}
Disney %>% select(movie_title,mpaa_rating) %>% filter(mpaa_rating == "R");
```

#### Result
```{R}


```

# 8. อัตราเงินเฟ้อที่ปรับในขั้นต้นเฉลี่ยของหนังแต่ละประเภท 🍋
#### Explain here
```{R}
Disney %>% group_by(genre) %>% select(inflation_adjusted_gross) %>% summarise(avg = mean(inflation_adjusted_gross, na.rm = TRUE))
```

#### Result
```{R}


```








