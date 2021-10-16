# 1. การอ่านข้อมูลในไฟล์ CSV

#ใช้ library
library(readr)   # A fast and friendly way to read rectangular data

#คำสั่งการเรียกดูข้อมูลใน dataset
Disney <- read_csv("https://www.dropbox.com/s/xdmajrcuns8pc96/disney_movies.csv?dl=1")
View(Disney)


# 2.ทำการ Data Transformation + Data Cleaning

#ใช้ library
library(readr)      # A fast and friendly way to read rectangular data
library(stringr)    # Character manipulation

# บันทึกลงในตัวแปรใหม่
ds <- Disney

# เพิ่มตารางใหม่ที่เก็บข้อมูลปีที่ปล่อยออกมา 
ds <- Disney
ds$release_year	<- substr(Disney$release_date,1,4)
View(ds)

#เรียกดูข้อมูล
View(ds)

#ดู types of values
glimpse(ds)
