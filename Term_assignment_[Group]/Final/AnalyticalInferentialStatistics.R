#0.Loading library and dataset
#library
library(dplyr)
library(readr)
#dataset
Disney <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/011-Disney/main/Term_assignment_%5BGroup%5D/Midterm/Disney_clean.csv");
View(Disney);

#ข้อมูลหาจาก
#จำนวนหนังทั้งหมดที่เป็นแนว Adventure
Disney %>% group_by(genre) %>% count() 
#รายได้เฉลี่ยของหนังทั้งหมด
Disney %>%  summarise(avg = mean(total_gross, na.rm = TRUE)) 
#ส่วนเบี่ยงเบนมาตราฐาน
Disney  %>% summarise(stdev.s = mean(total_gross, na.rm = TRUE))


# Step 1. Assign variables:
n <- 119
sd <- 71308507
xbar <- 71308507
u0 <- 80000000

# Step 2 State the hypothesis
##h0:u<80000000   ,ho:u>=80000000

# Step 3 Level of significance (alpha)
alpha <- 0.05


# Step 4 Select Test statistic (This formula for one population)
z/t <- (xbar - u0) / (sd/sqrt(n))


# Step 5 Finding P-value approach or Critical Value approach

# P-value approach
pvalue <- pnorm(z); pvalue

# Critical Value approach
zalpha <- qnorm(alpha);zalpha


# 6. Compare P-value with alpha or z/t with zalpha/talpha
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




