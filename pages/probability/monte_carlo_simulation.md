# Monte Carlo Simulation

By using the computer, we can mimic a large enough samples, so we can determine the limits and tendency.


```r
beads <- rep(c("red", "blue"), times = c(2,3))
# beads "red", "red", "blue", "blue", "blue"
sample(beads, 1)
# blue

# So if we want to simulate this event 10000 times
B <- 10000
events <- replicate(B, sample(beads, 1)) 

tab <- table(events)
tab
# events
# blue   red
# 5962   4038

prop.table(tab) #proportion table
# events
# blue   #red
# 0.5962 0.4038


# Sample function has the option to select how many picks, example without replacement (default)
sample(beads, 5) # This will return all the beads in the beads collection

# Sample with replacement
sample(beads, 5, replacement=TRUE)

# So we can OMIT the replicate function by doing this
sample(beads, B, replacement=TRUE)

```
