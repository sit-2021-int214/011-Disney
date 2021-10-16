# 1. การอ่านข้อมูลในไฟล์ CSV

### ใช้ library
```{R}
library(readr) #A fast and friendly way to read rectangular data 
```  

### คำสั่งการเรียกดูข้อมูลใน dataset
```{R}
Disney <- read_csv("https://www.dropbox.com/s/xdmajrcuns8pc96/disney_movies.csv?dl=1")
View(Disney)
```

# 2.ทำการ Data Transformation + Data Cleaning

### ใช้ library
```{R}
library(readr)      # A fast and friendly way to read rectangular data
library(stringr)    # Character manipulation
```

### บันทึกลงในตัวแปรใหม่ในกรณีที่ไม่มั่นในในการทำData Transformation + Data Cleaning
```{R}
ds <- Disney
```

### เพิ่มคอลัมน์ใหม่ที่เก็บข้อมูลปีที่ปล่อยหนังออกมา
```{R} 
Disney <- Disney
Disney$release_year	<- substr(Disney$release_date,1,4)
View(Disney)
```

### เรียกดูข้อมูลหลังจากเพิ่มคอลัมน์มาใหม่
```{R}
View(Disney)
```

### ดู types of values
ไม่มีการปรับเปลี่ยน types of values เพราะ types of values ถูกต้องแล้ว
```{R}
glimpse(Disney)
```

### การเก็บตัวแปรกรอบข้อมูลด้วยไฟล์นามสกุล csv หลังจากที่ทำการ Data Cleaning เสร็จเรียบร้อย
ใช้ คำสั่ง write.csv(mtcars , file = “/Users/somsak_mac2/Documents/thaiXelatex/Statistics with R/mtcars.csv”)
เป็นคำสั่งสำหรับการ save กรอบข้อมูล ข้อความที่อยู่ในวงเล็บ mtcars คือตัวแปรกรอบข้อมูลที่ต้องการจะเก็บ file = และข้อความที่อยู่ภายในเครื่องหมาย " " คือเส้นทางและ folder และชื่อไฟล์นามสกุล csv ที่ต้องการเก็บนั้นเอง เอง

```{R}
str(Disney)
write.csv(Disney, file ="D:/INT214/midterm/Disney_clean.csv")
```
