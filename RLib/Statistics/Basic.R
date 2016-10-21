

## Simulate from a Normal distribution
##-----------------------------------------
num = 100000
mean = 100
sd = 50
dist = rnorm(num, mean, sd)

## Simulate from a Poisson distribution
##----------------------------------------
p.dist = rpois(num, mean)


## draw summary histogram
##----------------------------------------------------------
dist.summary <- function(dist, name, num.bins = 120) {
    ## function to plot and print a summary
    ## of the distribution
    maxm <- max(dist)
    minm <- min(dist)
    bw <- (maxm - minm) / num.bins
    breaks <- seq(minm - bw / 2, maxm + bw / 2, by = bw)
    hist(dist, col = 'blue', breaks = breaks, xlab = name,
 main = paste('Distribution of ', name))

    std <- round(sd(dist), digits = 2)
    print(paste('Summary of', name, '; with std = ', std))
    print(summary(dist))
}

dist.summary(dist, "Demo for Statistics", 100)

## Compute the upper and lower emperical quantiles
##--------------------------------------------------------------
comp.ci <- function(vec, quantile = 0.05) 
{
    lower <- quantile / 2.0
    upper <- 1.0 - lower
    c(quantile(vec, probs = lower, na.rm = TRUE),
 quantile(vec, probs = upper, na.rm = TRUE))
}

comp.ci(dist , 0.05)
