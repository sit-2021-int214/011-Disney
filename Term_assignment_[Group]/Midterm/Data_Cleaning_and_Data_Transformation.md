# Data Transformation + Data Cleaning 📙
### 1. การอ่านข้อมูลในไฟล์ CSV 🌾

# ใช้ library 📚
```{R}
library(readr)   # A fast and friendly way to read rectangular data
```

# คำสั่งการเรียกดูข้อมูลใน dataset 📊
```{R}
Disney <- read_csv("https://www.dropbox.com/s/xdmajrcuns8pc96/disney_movies.csv?dl=1")
View(Disney)
```

# 2.ทำการ Data Transformation + Data Cleaning 🌾

# ใช้ library 📚
```{R}
library(readr)      # A fast and friendly way to read rectangular data
library(stringr)    # Character manipulation
library(dplyr)      # dplyr is a grammar of data manipulation, providing a consistent set of verbs 
                      that help you solve   the most common data manipulation challenges:
```

# เรียกดูข้อมูล 📊
```{R}
View(Disney)
```

# ดูรายละเอียดของข้อมูลที่มี 🧐
```{R}
glimpse(Disney)
```

# เพิ่มตารางใหม่ที่เก็บข้อมูลปีที่ปล่อยออกมา 🧐
```{R} 
Disney <- Disney
Disney$release_year	<- substr(Disney$release_date,1,4)
``` 
 
# เปลี่ยน Datatype ของ Column 🧐
```{R} 
Disney$release_year <- as.integer(Disney$release_year)
```

# เช็คหา Columns ที่มีค่าซ้ำกัน 🧐
```{R} 
Disney %>% duplicated() %>% table()
Disney <- Disney %>% distinct()
```

# เช็ค Datatype ของแต่ละ Column 🧐
```{R} 
is.character(Disney$movie_title)
is.character(Disney$release_date)
is.character(Disney$ genre)
is.character(Disney$ mpaa_rating)
is.double(Disney$ total_gross )
is.double(Disney$ inflation_adjusted_gross)
is.integer(Disney$ release_year)
```

# หาค่า NA ของแต่ละ Columns 🧐
```{R} 
is.na(Disney$movie_title) %>% sum()
is.na(Disney$release_date) %>% sum()
is.na(Disney$ genre) %>% sum()
is.na(Disney$ mpaa_rating) %>% sum()
is.na(Disney$ total_gross ) %>% sum()
is.na(Disney$ inflation_adjusted_gross) %>% sum()
is.na(Disney$ release_year) %>% sum()
```

# ลบ Columns ทั้งหมดที่มีค่า NA 🧐
```{R} 
#genre
Disney$genre <- replace(Disney$genre,Disney$genre == 'Unknown', NA)
Disney<- Disney %>% na.omit()

#mpaa_rating
Disney$mpaa_rating <- replace(Disney$mpaa_rating,Disney$mpaa_rating == 'Unknown', NA)
Disney<- Disney %>% na.omit()
```

# การเก็บตัวแปรกรอบข้อมูลด้วยไฟล์นามสกุล csv หลังจากที่ทำการ Data Transformation + Data Cleaning เรียบร้อย 🧐
```{R} 
str(Disney)
write.csv(Disney, file ="D:/INT214/midterm/Disney_clean.csv")

การเก็บตัวแปรกรอบข้อมูลด้วยไฟล์นามสกุล csv หลังจากที่ทำการ Data Cleaning เสร็จเรียบร้อย
ใช้ คำสั่ง write.csv(mtcars , file = “/Users/somsak_mac2/Documents/thaiXelatex/Statistics with R/mtcars.csv”)
เป็นคำสั่งสำหรับการ save กรอบข้อมูล ข้อความที่อยู่ในวงเล็บ mtcars คือตัวแปรกรอบข้อมูลที่ต้องการจะเก็บ file = และข้อความที่อยู่ภายในเครื่องหมาย " " คือเส้นทางและ folder และชื่อไฟล์นามสกุล csv ที่ต้องการเก็บนั้นเอง เอง
```
