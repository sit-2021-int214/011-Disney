# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer

1.) หาค่า bwt สูงสุดของแมวเพศเมียและเพศผู้และจำนวนของแมวทั้งสองเพศ
```{R}
max(cats$Bwt[cats$Sex == 'F']) #3 
max(cats$Bwt[cats$Sex == 'M']) #3.9
sum(cats$Sex == 'F') #47
sum(cats$Sex == 'M') #97
```
คำอธิบาย
```{R}
```

2.) From survey , the mean Age is 20.37 
```{R}
mean(survey$Age)
```

3.) Descriptive statistics Statement
```{R}
Code here
```
5.) From survey, of 237 people, 189 had never smoked, and one of them did not provide information.
```{R}
Smoker <- factor(survey$Smoke)
summary(Smoker) 
Mode(survey$Smoke, na.rm = TRUE)
```
คำอธิบาย
```{R}
```

### Team: K-on
| No. | Name              | Student ID   |
|:---:|-------------------|--------------|
|1.   |นางสาว จริยาวดี แถมศรี| StudentID: 63130500008|
|2.   |นางสาว จินต์จุฑา ธนศุภวิมล |StudentID: 63130500010|
|3.   |นางสาว ณัฐวรา บุญยังกองแก้ว| StudentID: 63130500035|
|4.   |นางสาว ณิชกานต์ สถาพร |StudentID: 63130500037|
|5.   |นางสาว ปณาลี ปาลศรี |StudentID: 63130500075|
