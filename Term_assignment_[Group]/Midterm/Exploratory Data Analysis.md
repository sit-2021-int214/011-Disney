
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
Disney has produced many movies, this data has all Disney movies till 2016.
- x (numeric) 
- movie_title (character) รายชื่อของหนัง
- release_date (character) วันที่ออกฉาย
- genre (character) ประเภทของหนัง
- mpaa_rating (character) เรตของหนัง
- total_gross (numeric) รายได้ที่หักต้นทุนของหนัง
- inflation_adjusted_gross (numeric) อัตราเงินเฟ้อ
- release_year (numeric) ปีที่ออกฉาย

```{R}
Rows: 579
Columns: 8
$ X                        <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16~
$ movie_title              <chr> "Snow White and the Seven Dwarfs", "Pinocchio", "Fant~
$ release_date             <chr> "1937-12-21", "1940-02-09", "1940-11-13", "1946-11-12~
$ genre                    <chr> "Musical", "Adventure", "Musical", "Adventure", "Dram~
$ mpaa_rating              <chr> "G", "G", "G", "G", "G", NA, "G", NA, "G", NA, "G", "~
$ total_gross              <dbl> 184925485, 84300000, 83320000, 65000000, 85000000, 28~
$ inflation_adjusted_gross <dbl> 5228953251, 2188229052, 2187090808, 1078510579, 92060~
$ release_year             <int> 1937, 1940, 1940, 1946, 1950, 1954, 1955, 1959, 1961,~
```
