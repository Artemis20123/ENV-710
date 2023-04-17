air <- read.csv("labs/lab9  Generalized Linear Models/AircraftDat.csv")

lm1 <- glm(y ~ as.factor(x1) + x2 + x3,
           data = air, family = poisson)
summary(lm1)

lm2.1<- update(lm1, ~.-as.factor(x1))
summary(lm2.1)

lm2.2 <- update(lm1, ~.-x2)
summary(lm2.2)

lm2.3 <- update(lm1, ~.-x3)
summary(lm2.3)

lm3.1 <- glm(y ~ as.factor(x1),
             data = air, family = poisson)
summary(lm3.1)

lm3.2 <- glm(y ~ x2,
             data = air, family = poisson)
summary(lm3.2)

lm3.3 <- glm(y ~ x3,
             data = air, family = poisson)
summary(lm3.3)

library(lmtest)

lrtest(lm1, lm2.1, lm2.2, lm2.3,lm3.1,lm3.2,lm3.3)

# which is better
# overdispersion? change the method to quasi?
# which assumptions?

Sleuth3, case2002