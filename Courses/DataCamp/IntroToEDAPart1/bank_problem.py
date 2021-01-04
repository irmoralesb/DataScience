import numpy as np
import course_functions as func
import matplotlib.pyplot as plt

# How many defaults might we expect?
#
# Let's say a bank made 100 mortgage loans. It is possible that anywhere between 0 and 100 of
# the loans will be defaulted upon. You would like to know the probability of getting a given number of defaults,
# given that the probability of a default is p = 0.05. To investigate this, you will do a simulation.
# You will perform 100 Bernoulli trials using the perform_bernoulli_trials() function you wrote in the previous
# exercise and record how many defaults we get.
# Here, a success is a default.
# (Remember that the word "success" just means that the Bernoulli trial evaluates to True,
# i.e., did the loan recipient default?) You will do this for another 100 Bernoulli trials.
# And again and again until we have tried it 1000 times. Then, you will plot a histogram describing the probability
# of the number of defaults.

number_of_trials = 1000

np.random.seed(42)
n_defaults = np.empty(number_of_trials)

for i in range(number_of_trials):
    n_defaults[i] = func.perform_bernoulli_trials(100, 0.05)

# Plot the histogram with default number of bins
_ = plt.hist(n_defaults, density=True)
_ = plt.xlabel('number of defaults out of 100 loans')
_ = plt.ylabel('probability')
plt.show()

# Will the bank fail?
#
# Plot the number of defaults you got from the previous exercise, in your namespace as n_defaults, as a CDF.
# The ecdf() function you wrote in the first chapter is available.
#
# If interest rates are such that the bank will lose money if 10 or more of its loans are defaulted upon,
# what is the probability that the bank will lose money?

x, y = func.ecdf(n_defaults)

# Plot the ECDF with labeled axes
plt.plot(x, y, marker=".", linestyle="none")
plt.xlabel("Interest")
plt.ylabel("ECDF")

# Show the plot
plt.show()

# Compute the number of 100-loan simulations with 10 or more defaults: n_lose_money
n_lose_money = np.sum(n_defaults >= 10)

# Compute and print probability of losing money
print('Probability of losing money =', n_lose_money / len(n_defaults))

# As we might expect, we most likely get 5/100 defaults.
# But we still have about a 2% chance of getting 10 or more defaults out of 100 loans.
np.random.binomial(4,0.5,)