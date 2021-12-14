# 🎯 Disney Dataset
## 📌 Hypothesis Testing
## 📖 Define a question
disney เป็นค่ายภาพยนตร์ที่ผลิตภาพยนตร์ออกมามากมายตั้งแต่ปีคริสต์ศักราชที่ 1937 จนถึงปี 2016 ซึ่งมีจำนวนทั้งหมด   513 เรื่อง โดยทางกลุ่มสนใจเกี่ยวกับหนังประเภท Adventure ซึ่งมีทั้งหมด 119 เรื่องจากทั้งหมด และได้ตั้งสมมุติฐานว่ารายได้เฉลี่ยอย่างน้อยของหนังประเภท Adventure อย่างน้อยต้องมากกว่า 80,000,000 บาท โดยที่มีค่าเฉลี่ยรายได้ของหนังทั้งหมดอยู่ที่ 71,308,507 บาท และส่วนเบี่ยงเบนมาตรฐานอยู่ที่ 71,308,507 ซึ่งทางเราจะกำหนดค่า alpha เท่ากับ 0.05 

# 📑 Steps
1. Assign variables:
    ```{R}
    u0 or p0
    xbar or pbar
    n
    sd (or sigma)
    alpha (default is 0.05)
    ```
2. State the hypothesis
3. Select Level of significance (alpha)
4. Select Test statistic (This formula for one population)
    ```{R}
    z/t <- (xbar - u0) / (sd/sqrt(n))
    z <- (pbar-p0) / sqrt((p0*(1-p0))/n)
    ```
5. Finding P-value approach or Critical Value approach
    ```{R}
    P-value for Z:  pvalue <- pnorm(z)
    Critical Value for Z:  zalpha <- qnorm(alpha)
    P-value for T: pvalue <- pt(q, df,lower.tail = TRUE)
    talpha for T: talpha <- qt(p, df, lower.tail = TRUE)
   ```
6. Compare P-value with alpha or z/t with zalpha/talpha
7. Conclusion


## Step 0 Loading library and dataset 
```{R}
#library
library(dplyr)
library(readr)
#dataset
Disney <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/011-Disney/main/Term_assignment_%5BGroup%5D/Midterm/Disney_clean.csv");
View(Disney);
```
## วิธีหาข้อมูล
1. จำนวนหนังทั้งหมดที่เป็นแนว Adventure
```{R}
Disney %>% group_by(genre) %>% count() 
```
Result
```{R}
   genre                   n
   <chr>               <int>
 1 Action                 36
 2 Adventure             119
 3 Black Comedy            3
 4 Comedy                162
 5 Concert/Performance     2
 6 Documentary            16
 7 Drama                 103
 8 Horror                  5
 9 Musical                15
10 Romantic Comedy        22
11 Thriller/Suspense      23
12 Western                 7
```
2. รายได้เฉลี่ยของหนังทั้งหมด
```{R}
Disney %>%  summarise(avg = mean(total_gross, na.rm = TRUE)) 
```
Result
```{R}
       avg
  71308507
```
3. ส่วนเบี่ยงเบนมาตราฐาน
```{R}
Disney  %>% summarise(stdev.s = sd(total_gross, na.rm = TRUE))
```
Result
```{R}
   stdev.s
  96770913
```

## Step 1. Assign variables: 
```{R}
n <- 119
sd <- 71308507
xbar <- 71308507
u0 <- 80000000
```
## Step 2 State the hypothesis 
```{R}
Ho:u >= 80000000
Ha:u < 80000000   
```

##  Step 3 Level of significance (alpha) 
```{R}
alpha <- 0.05
```

## Step 4 Select Test statistic (This formula for one population) 
```{R}
z/t <- (xbar - u0) / (sd/sqrt(n))

```
Result
```{R}
z/t <- -0.9797675
```


## Step 5 Finding P-value approach or Critical Value approach  
```{R}
# P-value approach
pvalue <- pnorm(z); pvalue

# Critical Value approach
zalpha <- qnorm(alpha);zalpha
```
Result
```{R}
pvalue <- 0.1636005
zalpha <- -1.644854
```

##  6. Compare P-value with alpha or z/t with zalpha/talpha 
```{R}
# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(z<=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}
```
Result
```{R}
P-value approach : "Accept H0"
Critical value approach : "Accept H0"
```

## 7. Conclusion 
```{R}
จากการทดสอบสมมุติฐานสรุปว่ายอมรับสมมุติฐานข้างต้นคือ หนังประเภท Adventure จะมีรายได้เฉลี่ย อย่างน้อยต้องมากกว่า 80,000,000 บาท 
```