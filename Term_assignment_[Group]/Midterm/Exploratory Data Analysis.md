
# Exploratory Data Analysis


```{R}
#library
library(dplyr)
library(readr)
#dataset
Disney <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/011-Disney/main/Term_assignment_%5BGroup%5D/Midterm/Disney_clean.csv");
glimpse(Disney);
```
In this dataset has All Disney movies with their release dates, genre, rating, total gross and inflation adjusted gross(2016).
Disney has produced many movies, this data has all Disney movies till 2016. Inside that dataset has 579 rows 6 column.
- movie_title (character) รายชื่อของหนัง
- release_date (character) วันที่ออกฉาย
- genre (character) ประเภทของหนัง
- mpaa_rating (character) เรตของหนัง
- total_gross (numeric) รายได้ที่หักต้นทุนของหนัง
- inflation_adjusted_gross (numeric) อัตราเงินเฟ้อ

```{R}
Rows: 579
Columns: 6
$ movie_title              <chr> "Snow White and the Seven Dwarfs", "Pinocchio", "Fant~
$ release_date             <chr> "1937-12-21", "1940-02-09", "1940-11-13", "1946-11-12~
$ genre                    <chr> "Musical", "Adventure", "Musical", "Adventure", "Dram~
$ mpaa_rating              <chr> "G", "G", "G", "G", "G", "", "G", "", "G", "", "G", "~
$ total_gross              <int> 184925485, 84300000, 83320000, 65000000, 85000000, 28~
$ inflation_adjusted_gross <dbl> 5228953251, 2188229052, 2187090808, 1078510579, 92060~
```
---

เช็คว่ามีค่า null ในตัว dataset หรือไม่
```{R}
is.na(Disney)
```

สำรวจข้อมูลเบื้องต้น
```{R}
summary(Disney)
```
Result
```
    movie_title         release_date        genre             mpaa_rating        total_gross        inflation_adjusted_gross
 Length:579         Length:579         Length:579         Length:579          Min.   :        0         Min.   :0.000e+00    
 Class :character   Class :character   Class :character   Class :character    1st Qu.: 12788864         1st Qu.:2.274e+07  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character    Median : 30702446         Median :5.516e+07                                            
                                                                              Mean   : 64701789         Mean   :1.188e+08       
                                                                              3rd Qu.: 75709033         3rd Qu.:1.192e+08       
                                                                              Max.   :936662225         Max.   :5.229e+09    
```




