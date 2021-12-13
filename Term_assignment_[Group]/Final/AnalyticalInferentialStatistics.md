# 🎯 Disney Dataset
## 📌 Hypothesis Testing
## 📖 Define a question
disney เป็นค่ายภาพยนตร์ที่ผลิตภาพยนตร์ออกมามากมายตั้งแต่ปีคริสต์ศักราชที่ 1937 จนถึงปี 2016  ทำให้มีภาพยนตร์ออกมาหลายประเภทและหลากหลายเรื่องโดยทางกลุ่มสนใจเกี่ยวกับรายได้เฉลี่ยของหนังตั้งแต่ปี 1937 ถึง 2016 และได้ตั้งสมมุติฐานว่ารายได้เฉลี่ยอย่างน้อยของหนังทุกประเภทตั้งแต่ปี 1937-2016  อย่างน้อยต้องมากกว่า 80,000,000 บาท โดยที่มีค่าเฉลี่ยรายได้ของหนังตั้งแต่ปี 1937 ถึง 2016 อยู่ที่ 71308506.64 บาท และส่วนเบี่ยงเบนมาตรฐานอยู่ที่ 96770912.72  ซึ่งทางเราจะกำหนดค่า alpha เท่ากับ 0.05 

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
    P-value for Z:    ```{R} pvalue <- pnorm(z) ```
    Critical Value for Z:   ```{R} zalpha <- qnorm(alpha) ```
    P-value for T:   ```{R} pvalue <- pt(q, df,lower.tail = TRUE) ```
    talpha for T:    ```{R}talpha <- qt(p, df, lower.tail = TRUE) ```
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

## Step 1. Assign variables: 
```{R}
n <- 79
sd <- 96770912.72
xbar <- 71308506.64
u0 <- 80000000
```
## Step 2 State the hypothesis 
```{R}
Ho:u<80000000   
Ho:u>=80000000
```

##  Step 3 Level of significance (alpha) 
```{R}
alpha <- 0.05
```

## Step 4 Select Test statistic (This formula for one population) 
```{R}
z/t <- (xbar - u0) / (sd/sqrt(n))
z <- (pbar-p0) / sqrt((p0*(1-p0))/n)
```


## Step 5 Finding P-value approach or Critical Value approach  
```{R}
# P-value approach
pvalue <- pnorm(z); pvalue

# Critical Value approach
zalpha <- qnorm(alpha);zalpha
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

## 7. Conclusion 