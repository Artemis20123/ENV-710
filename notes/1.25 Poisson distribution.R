#注意不同的公式里x变量的表述不同（x,q,p)
# 保留两位小数

pods= c(8,1,4,0,4,4,6,2,2,4,5,1,4,3,4,3,3,4,6,3,3,8,6,5,2,3,0,8,6,6)
lam = mean(pods)

# X = 5
q1 = dpois(x = 5, lambda = lam)

# 6 or more
q2 = 1- ppois(q = 5, lambda = 3.933333)
## note that it is also 5 here
ppois(q = 5, lambda = 3.933333, lower.tail = FALSE)
1- sum(dpois(x = 0:5, lambda = 3.93333))

# 3 & 4
q3 = sum(dpois(x = 3:4, lambda = lam))
q3_1 = ppois(q = 4, lambda = lam) - ppois(q = 2, lambda = lam)


# ggplot visualization
pods= c(8,1,4,0,4,4,6,2,2,4,5,1,4,3,4,3,3,4,6,3,3,8,6,5,2,3,0,8,6,6)
df = as.data.frame(pods)
## 查看变量属性
## class(df)
v = ggplot(df, aes(x= pods)) + geom_bar(fill = "blue")
show(v)

# theoretical distribution
the_pod = dpois(x = 0: 10, lambda = lam)
c = c(1:31)
# after cbind, it is not a dataframe. it is matrix/ array
df2 = cbind(c, the_pod)
class (df2)
df3 = as.data.frame(df2)
v1 = ggplot(df2, aes(x= c, y= the_pod)) + geom_bar(stat= "identity", fill = "blue")
show(v1)
barplot(the_pod)