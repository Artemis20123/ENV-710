# packages



# 二项分布，9个值，x=2,3，。。。10
dbinom(x = 2:10, size = 20, prob = 0.6)

# 九个随机变量的pmf (probability mass function)之和
sum (dbinom(2:10,20,0.6))

# randomly generate 30 times of binomial distributions
rbinom(n=30,size=1,prob=0.2)

# cumulative probability (sum of P(x=0) to P(x=4))
pbinom(q=4,size=10,prob=0.2)
## get the right part
1-pbinom(q = 4, size = 20, prob = 0.15)
pbinom(4,20,0.15,lower.tail = FALSE)

#find the 75th quantile of a binomial distribution with 10 trials and prob of success on each trial = 0.2
qbinom(p=0.75,size =10, prob=0.2)

#q1
dbinom(x = 7, size = 20, prob = 0.15)

#q2 below equations are equal
sum (dbinom(x = 5:20, size = 20, prob = 0.15))
1-pbinom(q = 4, size = 20, prob = 0.15)
pbinom(4,20,0.15,lower.tail = FALSE)

#q3
mean = 20 * 0.15
mean

#q4
dev = sqrt(20*0.15*(1-0.15))
dev

# ggplot visualization
install.packages("tidyverse")
library(ggplot2)
## 建立数据库
df = data.frame(p = dbinom(0:20,size = 20, prob = 0.15), n = c(0:20))
df$col = c(rep(1,5),rep(2,16)) # scenario 2
df$col <- c(rep(1,7), 2, rep(1,13))
my_gg <- ggplot(df, aes(y=p, x=n, fill = col)) +
  geom_bar(stat="identity") +
  xlab("X") + ylab("Probability") +
  scale_fill_identity() +
  theme_bw()
show (my_gg)
