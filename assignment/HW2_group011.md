# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer

1.) หาค่า bwt สูงสุดของแมวทั้งสองเพศและจำนวนของแมวทั้งสองเพศ
```{R}
max(cats$Bwt[cats$Sex == 'F']) #3 
max(cats$Bwt[cats$Sex == 'M']) #3.9
sum(cats$Sex == 'F') #47
sum(cats$Sex == 'M') #97
```
คำอธิบาย
```{R}
-- หาค่าสูงสุดของ Body weight ของแมวทั้งสองเพศ โดยใช้คำสั่ง max(cats$Bwt) เพื่อเข้าบอกว่าเรากำลังใช้ข้อมูลชุดนั้นอยู่และตามด้วย $ เพื่อเรียก Colum ที่เราจะหา โดยในที่นี้จะหาแมวเพศผู้และเพศเมียจึงใส่คำสั่งตามดำดับ [cats$Sex == 'F'] , [cats$Sex == 'M']  

-- หาจำนวนแมวทั้งสองเพศจะใช้คำสั่งตามลำดับ  sum(cats$Sex == 'F'),sum(cats$Sex == 'M') (ใส่ $Sex == '' เพื่อให้รู้ว่าเราต้องการเพศไหน)
```


2.) หาค่าเฉลี่ยจากอายุของนักศึกษา
```{R}
mean(survey$Age)
```

3.) Descriptive statistics Statement
```{R}
<<<<<<< HEAD
Code here
```
5.) From survey, of 237 people, 189 had never smoked, and one of them did not provide information.
```{R}
Mode(survey$Smoke, na.rm = TRUE)
summary(factor(survey$Smoke))
```
คำอธิบาย
```{R}
หาความถี่ของคนที่ไม่เคยสูบบุหรี่เลยโดยใช้คำสั่ง Mode และแสดงข้อมูลสรุป Smoke จาก Data set: survey ใช้คำสั่ง summary
=======
IQR(survey$Age)
>>>>>>> 222453b707db3eb14ef73df380886ddf9366bcdd
```


### Team: K-on
| No. | Name              | Student ID   |
|:---:|-------------------|--------------|
|1.   |นางสาว จริยาวดี แถมศรี| StudentID: 63130500008|
|2.   |นางสาว จินต์จุฑา ธนศุภวิมล |StudentID: 63130500010|
|3.   |นางสาว ณัฐวรา บุญยังกองแก้ว| StudentID: 63130500035|
|4.   |นางสาว ณิชกานต์ สถาพร |StudentID: 63130500037|
|5.   |นางสาว ปณาลี ปาลศรี |StudentID: 63130500075|
