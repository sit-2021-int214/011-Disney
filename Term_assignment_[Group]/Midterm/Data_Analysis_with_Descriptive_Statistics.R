#Disney Dataset
 
#Define a question
#1. เรื่องที่ทำรายได้มากที่สุด
#2. ในแต่ละปีผลิตได้กี่เรื่อง
#3. วันที่ออกฉายแต่ละเรื่องในปี 2016
#4. 3 อันดับแรกของ disney แนวเรื่องไหน ที่ผลิตออกมามากที่สุด
#5. มีประเภทหนังอะไรบ้าง เช่น ดราม่า คอมเมดี้ แอคชั่น
#6. มีเรตหนังอะไรบ้างและมีจำนวนเท่าไหร่ในแต่หละเรตนั้น
#7. อยากรู้ว่า movie rating PG มีเรื่องอะไรบ้าง และเป็นประเภทอะไรบ้าง
#8. อัตราเงินเฟ้อที่ปรับในขั้นต้นเฉลี่ยของหนังแต่ละประเภท


# Step 0 Loading library and dataset
#library
library(dplyr)
library(readr)
#dataset
Disney <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/011-Disney/main/Term_assignment_%5BGroup%5D/Midterm/Disney_clean.csv");
View(Disney);

#1. เรื่องที่ทำรายได้มากที่สุด
#Explain here
Disney %>% filter(total_gross == max(total_gross));

#2. ปีที่ผลิตหนังได้มากที่สุดและผลิตมาทั้งหมดกี่เรื่อง
#Explain here
Disney <- Disney %>% count(release_year);
Disney %>% select(release_year,n) %>% filter(n == max(n));

#3. วันที่ออกฉายแต่ละเรื่องในปี 2016
#Explain here
Disney %>% select(movie_title,release_date,release_year)%>% filter(release_year == "2016");

#4. 3 อันดับแรกของ disney แนวเรื่องไหน ที่ผลิตออกมามากที่สุด
#Explain here
Disney %>% count(genre,sort = TRUE) %>% head(n = 3L);

#5. มีประเภทหนังอะไรบ้าง เช่น ดราม่า คอมเมดี้ แอคชั่น
#Explain here
Disney %>% group_by(genre) %>% count();

#6. มีเรตหนังอะไรบ้างและมีจำนวนเท่าไหร่ในแต่หละเรตนั้น
#Explain here
Disney %>% group_by(mpaa_rating) %>% count();

#7. อยากรู้ว่า movie rating R มีเรื่องอะไรบ้าง และเป็นประเภทอะไรบ้าง
#Explain here
Disney %>% select(movie_title,mpaa_rating) %>% filter(mpaa_rating == "Not Rated");

#8. อัตราเงินเฟ้อที่ปรับในขั้นต้นเฉลี่ยของหนังแต่ละประเภท
#Explain here
Disney %>% group_by(genre) %>% select(inflation_adjusted_gross) %>% summarise(avg = mean(inflation_adjusted_gross, na.rm = TRUE))

