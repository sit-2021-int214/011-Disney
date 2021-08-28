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


2.) From survey , the mean Age is 20.37
```{R}
mean(survey$Age) 
```
คำอธิบาย
```{R}
หาค่าเฉลี่ยของอายุ จากตาราง survey โดยใช้คำสั่ง mean
```


3.) From survey, interquartile range ‘ s age is 2.5 .
```{R}
IQR(survey$Age) 
```
คำอธิบาย
```{R}
หาค่าพิสัยระหว่างควอไทล์ใช้คำสั่ง IQR คำนวณ ซึ่งมีสูตรคำนวณว่า Q3 - Q1
```

4.) From survey, the range Age is 16.75 73.00
```{R}
range(survey$Age)
```
คำอธิบาย
```{R}
Rang เป็นการหาค่าขอบเขตที่น้อยที่สุดของของข้อมูลทั้งหมด บอกได้ถึงขนาดช่วงที่เล็กที่สุด ซึ่งก็สามารถคำนวณได้จากการนำค่ามากที่สุดลบค่าน้อยที่สุด

```

5.) From survey, of 237 people, 189 had never smoked, and one of them did not provide information.
```{R}
Mode(survey$Smoke, na.rm = TRUE)
summary(factor(survey$Smoke))
```
คำอธิบาย
```{R}
หาความถี่ของคนที่ไม่เคยสูบบุหรี่เลยโดยใช้คำสั่ง Mode และใช้คำสั่ง summary แสดงข้อมูลสรุป Smoke จาก Data set: survey
```

### Team: K-on
1. นางสาว จริยาวดี แถมศรี        StudentID: 63130500008
2. นางสาว จินต์จุฑา ธนศุภวิมล     StudentID: 63130500010
3. นางสาว ณัฐวรา บุญยังกองแก้ว   StudentID: 63130500035
4. นางสาว ณิชกานต์ สถาพร       StudentID: 63130500037 
5. นางสาว ปณาลี ปาลศรี         StudentID: 63130500075
