# Lab 5: T-tests & Power Analysis
# Adapted from lab notes by Maggie Swift

# POWER is how good your test is at detecting differences. It is affected
# by SIGNIFICANCE LEVEL (alpha), SAMPLE SIZE, and EFFECT SIZE. 

# To compare (given we're not going to change the alpha from 0.05):

# POWER is LOW if:
# ... (a) the SAMPLE SIZE is SMALL (not enough data), and/or
# ... (b) the EFFECT SIZE is SMALL (the difference is too tiny to notice).
# POWER is HIGH if:
# ... (a) the SAMPLE SIZE is LARGE (lots of data), and/or
# ... (b) the EFFECT SIZE is LARGE (the difference is big enough to notice).

# EFFECT SIZE is how big that difference is. If we can estimate the size
# of the effect we're looking to measure (either by looking at older data, 
# or by convention choosing a moderate 0.5), we can estimate how large a 
# SAMPLE SIZE we need to achieve the statistical POWER that we desire.

################################################################################
rm(list=ls())
install.packages('pacman') #a helpful new library for loading packages
pacman::p_load(ggplot2, pwr, reshape2)
################################################################################

# Let's say we want to know how much sugar a given kindergartner will eat, 
# given the time of day. For our experiment, we will sit each kindergartner 
# in a room at 9:00 AM and again at 6:00 PM, with a bowl of candies in
# front of them. Each kindergartner will be told that they can eat as many 
# as they want.

# In order to set up this experiment, we need to find out how many kinder-
# gartners to sample. Another researcher in our building ran a similar
# experiment on first-graders last year, and saw an effect size (d) of 0.9.
# We want to have a strong case, so we set our desired statistical power
# to a higher value.

alpha   <- 0.05
type <- ''
alternative <-'' # which is appropriate? 
p.desired <- 0.8 # let's assume we're thinking the effect will be large.
d.prev  <- 0.8 # what do we set the initial effect size as?

# Put it all together! n=NULL because we want to know what to choose for n.
result <- pwr.t.test(n=NULL, d=d.prev, power=p.desired, sig.level=alpha, type= type, alternative=alternative)
result$n


################################################################################

# All right, so our sample size should be 15 children. We run our 
# experiment and get the following results:
n <- 15
kg.df <- data.frame(kid=1:n, 
                    am=c(10, 12, 15, 10, 9, 0, 20, 10, 13, 11, 10, 13, 4, 19, 10),
                    pm=c(20, 24, 13, 23, 25, 18, 4, 20, 20, 18, 19, 26, 29, 15, 16)
)
attach(kg.df)

################################################################################
# Let's do some analysis! First, let's plot to see what we've got:
xlab <- "Time of Day"
ylab <- "Number of Candies Eaten"
title <- "Kindergartners' preferences for candies by time of day"
boxplot(am, pm, xlab=xlab, ylab=ylab, main=title, pch=19)

# Using ggplot and reshape2 to melt!!!!
library(reshape)
library(ggplot2)
kg.melt <- melt(kg.df, id="kid")
ggplot(kg.melt, aes(x=variable, y=value)) + 
  geom_boxplot() +
  xlab(xlab) +
  ylab(ylab) + 
  ggtitle(title)

################################################################################
# Running a t-test:
# ... Which type is appropriate? Paired or unpaired? Two-sided or left/right?
pair <- c(TRUE, FALSE)
alt <- c('two.sided', 'l', 'g')
t <- t.test(am, pm, paired=pair, alternative=alt)
t

################################################################################
# Finding the effect size: 
# ... What does this tell us?

# could do it all in 1, or ...
d <- abs(mean(am) - mean(pm)) / sqrt((sd(am)^2 + sd(pm)^2)/2)
# break it up for easier reading/debugging
mu.am <- mean(am)
mu.pm <- mean(pm)
sigma.p <- sqrt((sd(am)^2 + sd(pm)^2)/2)
d <- abs(mu.am - mu.pm) / sigma.p
d

################################################################################
# Finding the power of a t-test: 
# ... Which one should we use?
# ... What does the power tell us?
type = c('two.sided', 'l', 'g')
result <- pwr.t.test(n=n, d=d, sig.level=0.05, alternative=type)
result$power

################################################################################
# What can we now conclude about the effect of time of day on kids' desire
# for sugar?