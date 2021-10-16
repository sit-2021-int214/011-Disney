# 1. การอ่านข้อมูลในไฟล์ CSV

#ใช้ library
```{R}
library(readr) #A fast and friendly way to read rectangular data 
```  

#คำสั่งการเรียกดูข้อมูลใน dataset
```{R}
Disney <- read_csv("https://www.dropbox.com/s/xdmajrcuns8pc96/disney_movies.csv?dl=1")
View(Disney)
```

# 2.ทำการ Data Transformation + Data Cleaning

#ใช้ library
```{R}
library(readr)      # A fast and friendly way to read rectangular data
library(stringr)    # Character manipulation
```

#บันทึกลงในตัวแปรใหม่
```{R}
ds <- Disney
```

#เพิ่มตารางใหม่ที่เก็บข้อมูลปีที่ปล่อยออกมา
```{R} 
ds$release_year	<- substr(Disney$release_date,1,4)
View(ds)
```

#เรียกดูข้อมูล
```{R}
View(ds)
```

#ดู types of values
```{R}
glimpse(ds)
```
##ไม่มีการปรับเปลี่ยน types of values 