
# create a dice
## fix the result of sample
set.seed(230201)

rolls = sample(1:6, 6, replace = TRUE)
rolls1 = sample(1:6,6)
r3 = sample(1:6, 6, replace = TRUE)

## or
roll = round(runif(n = 6, min = 1, max = 6))

r_large= sample(1:6, 600, replace = TRUE)
hist (r_large)
mean (r_large)

z = c()
## for large sample
for (i in 1:100) {
  z[i] = mean(round(runif(30,1,6)))
}
z

## 总体均值，总体方差；样本均值方差；如何用样本估计总体（看笔记）
样本方差：代表了样本对总体估计的精确程度，和总体方差的含义不同