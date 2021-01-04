import numpy as np
import matplotlib.pyplot as plt

n_random = 100000

np.random.seed(42)
random_numbers = np.empty(n_random)

# Generate random numbers by looping
for i in range(n_random):
    random_numbers[i] = np.random.random()

# Plot histogram to see how it is distributed
_ = plt.hist(random_numbers)
plt.show()

# We can see all numbers are repeated in a pretty much the same number
