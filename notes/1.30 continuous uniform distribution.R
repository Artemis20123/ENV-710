# q1

## represents the probability density only (in continuous distribution)
## it does not represent the probability (area), the density only requires the height (at each point)
q1 = dunif(x = 6, min = 1, max = 120)
q1 = dunif(x = 5, min = 1, max = 120)
q1 = dunif(x = 5.5, min = 1, max = 120)


q2 = punif(q = 10, min = 1, max = 120) - punif(q = 5, min = 1, max = 120)

q3 = punif(q = 110, min = 1, max = 120) - punif(q = 75, min = 1, max = 120)

mean = 121/2
var = (120-1)^2/12
sd = sqrt(var)

# mode: 众数 none


# q2
dnorm(x =33, mean = 100, sd = 22)
dnorm (100,100,22)

## 对于连续分布，不用再担心阈值的问题，不用往前或往后取值
pnorm(140, 100, 22) - pnorm (135, 100, 22)
pnorm(70,100,22)
1- pnorm(120,100,22)

## visualization

x <- seq(50, 150, length=101)
y <- dnorm(x,100,22)

### l: line type, p: point type
plot (x,y,type = "l")


## 用ggplot才需要构建dataframe
### 构建dataframe的不同方法
z = cbind(x,y)
df = as.data.frame(z)
### method 2
dat = data.frame(d = dnorm(50:150,100,22), n = 50:150)
ggplot(dat,aes(y=d,x=n)) + geom_line()

### 原本的数据库只有x轴的数据，y的数据是stat_function算出来的。args=arguments
my_norm = ggplot(data = data.frame(x = c(50, 150)), aes(x)) +
  stat_function(fun = dnorm, n = 101, args = list(mean = 100, sd = 22)) + ylab("") +
  scale_y_continuous(breaks = NULL) + theme_bw()

###
my_norm + stat_function(fun = dnorm,  args = list(mean = 100, sd = 22), xlim = c(50,60), geom = "area", fill = "red", alpha = 0.5)
