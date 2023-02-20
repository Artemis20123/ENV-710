# q1 会考察离散分布
ans1a = dbinom(4, 12, 0.23)

1 - pbinom(4, 12, 0.23)
ans1b = pbinom(4, 12, 0.23, lower.tail = F)
pbinom(5:12, 12, 0.23)

# q2 pros and cons
# 最好都用，然后自己判断
# boxplot (generally even,对称)/ # histogram(general sense)
## little better than histogram (manually selected bins)

# qq plot (best)
# 需要自己判断是否normality
## stright forward
## do not show numbers

# skewness and kurtosis

# Shapiro-Wilk normality test
## 需要注意sample size，太大的话经常无法识别为正态分布


# q3
## a: two sample; one-sided
## b: one sample; two-sided
## c
set.seed(1000)
c = rnorm(20, 5, 4.9)
## 不要这样做，原文没有给数据。需要根据公式直接算
t.test (x = c, mu = 8.4, alternative = "less")
## d
pt()

# q4 two-sample test
## 需要先测方差和是否正态分布
## 假设显著性水平0.05
## var test, 拒绝no difference假设的话p<0.05
## x = test, y = comparison

## q5
## count data: poison distribution

## 不会有experimental design以后的内容，因为课上没讨论过
## 关于statistical power，大概率不会有，因为都是一些理论问题，会很容易能从网上查到答案