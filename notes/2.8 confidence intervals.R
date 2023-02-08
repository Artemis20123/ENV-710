# abs: 绝对值
z95 = abs(qnorm(p = 0.05/2, mean = 0, sd = 1))  ## parameter Z(alpha/2)
# or just
z95_1= qnorm(p = 1-0.05/2, mean = 0, sd = 1)

qnorm(p = 0.05/2, mean = 0, sd = 1)

z90 = abs(qnorm(p = 0.1/2, mean = 0, sd = 1))
c1_left = 26.1 - z95 * 6.07 / sqrt(75)
c1_right = 26.1 + z95 * 6.07 / sqrt(75)

c1 = c(c1_left, c1_right)
c1

c2_left = 26.1 - z90 * 6.07 / sqrt(75)
c2_right = 26.1 + z90 * 6.07 / sqrt(75)

c2 = c(c2_left, c2_right)
c2

# t distribution for small sample size. t parameter: t(n-1)(alpha/2)
t = abs(qt(p = 0.05/2, df = 14))

## 3.cars models
### 由于25.5就落在置信区间内，因此很难拒绝零假设。很大可能真值就在25.5下面
### H0 u = 25.5 (一般零假设是= 相等建立的假设)
### Ha u > 25.5 (此处题意，test the hypothesis higher than 25.5)(若问change，则是不等于)
### P(sample mean > 25.5 | H0) = 
### 将这个分布标准化为0,1 正态分布。 Z = （样本均值 - 零假设）/ （样本均值方差）