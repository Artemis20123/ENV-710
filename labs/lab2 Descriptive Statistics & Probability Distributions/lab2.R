afdat <-
  read.csv("d:/Users/Lijh/Desktop/710 R & statistics/lab2/AfrPlots.csv",
           header = TRUE)
head(afdat)

var0 <- seq(1:5)
rm(var0)

var1 <- c(0, 4, NA, 2, NA, 7)
mean(var1)
# remove na in the list
mean(var1, na.rm = TRUE)

# function: skewness calculation


myskewness(afdat$BasalArea)

var(afdat$BasalArea)
mean(afdat$BasalArea)
sd(afdat$BasalArea)

a = seq(1:10)

# q1
afdat <-
  read.csv("d:/Users/Lijh/Desktop/710 R & statistics/lab2/AfrPlots.csv",
           header = TRUE)

library(ggplot2)

# q1-a
# Figure 1: Distribution of the difference in average DBH (cm) during the census
MeanGr1 = afdat$MeanGr[!is.na(afdat$MeanGr)]
MeanGr2 = as.data.frame(MeanGr1)

dukeblue <- "#00009C"
  ggplot2::ggplot(afdat, aes(x = MeanGr)) + geom_histogram(fill = dukeblue,
                                                                 colour = "white",
                                                                 bins = 20) +
    xlab(expression(paste("Average DBH difference", "  (cm)"))) +
    ylab("Count") + theme_bw()

# Figure 2: Boxplot of the distribution of the average DBH (cm) difference
  ggplot2::ggplot(afdat, aes(x = MeanGr, y = "")) + stat_boxplot(geom = "errorbar",
                 width = 0.15,
                 color = 1) + geom_boxplot(
    fill = dukeblue,
    alpha = 0.5,
    color = 1,
    outlier.colour = 2
  ) + xlab(expression(paste("Average DBH difference", "  (cm)"))) + ylab("") + theme_bw()

# q1-b
# excess kurtosis
kurtosis <- function(y) {
    n <- length(y)
    kurt <- 1 / (n * sd(y) ^ 4) * sum((y - mean(y, na.rm = TRUE)) ^ 4) - 3
    kurt
}

MeanGr1 = afdat$MeanGr[!is.na(afdat$MeanGr)]
answer = kurtosis(MeanGr1)

# q1-c
library (scales)
Mean = mean(afdat$MeanGr, na.rm = TRUE)
Median = median(afdat$MeanGr, na.rm = TRUE)
Sd = sd(afdat$MeanGr, na.rm = TRUE)
COV = percent(Sd / Mean, accuracy = .01)

# q2-a
p1 = sum(dbinom(6:20,20,0.5))
p2 = pbinom(q = 5, 20, 0.5, lower.tail = FALSE)

# q2-b
pbi = function (x, n, p) {
  bi = factorial(n)/(factorial(x)*factorial(n-x))*p^x*(1-p)^(n-x)
  bi
}

p3 = sum(pbi(6:20,20,0.5))

# q3
p_17_correct = pbinom(16, 20, 0.25, lower.tail = FALSE)
p_17_correct1 = sum(dbinom(17:20, 20, 0.25))

# q4_a
p_9 = dpois(9, 4)
Poiss = function (x, l) {
  pois = l^x/factorial(x)*exp(-l)
  pois
}
answer = Poiss(9,4)

# q4_b
P_9_13 = sum(dpois(9:13,4))
P_9_13_1 = ppois(13,4) - ppois(8,4)
P_9_infinite = ppois(8, 4, lower.tail = F)
P_9_infinite_1 = 1 - sum(dpois(0:8, 4))
