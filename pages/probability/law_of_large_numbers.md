# Law of Large Numbers

> when n is very large, the average of the draws converges to the average of the urn.

* This only applies for large number of trials
* Basically the Standard Error gets close to 0


## How Large is Large in CTL

In many cases as few as 30 draws is enough to make CTL useful, and in others perhasps 10, but it depends on the situation. But we need be aware if the probability of success is very small we need larger sample sizes.

For instance the lottery, with a chance to win of 1 in 1,000,000. we may use the CTL, but we need to note that the success case is... in a extreme case 4 winners, so this sum in not well approximated by the normal distribution, so the CTL doesn't apply, even with very large samples. This is generally true when the changes of success is very low, in this case, the Poisson distribution is more appropiated.