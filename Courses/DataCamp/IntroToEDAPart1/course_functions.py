import numpy as np


# ECDF
def ecdf(data):
    """Compute ECDF for a one-dimensional array of measurements."""
    # Number of data points: n
    n = len(data)

    # x-data for the ECDF: x
    x = np.sort(data)

    # y-data for the ECDF: y
    y = np.arange(1, n + 1) / n

    return x, y


# Histogram number of bins
def number_of_bins(data):
    n_elements = len(data)
    return int(np.sqrt(n_elements))


# Bernoulli Trials
def perform_bernoulli_trials(n, p):
    """Perform n Bernoulli trials with success probability p
        and return number of successes."""
    # Initialize number of successes: n_success
    n_success = 0

    # Perform trials
    for i in range(n):
        # Choose random number between 0 and 1
        random_number = np.random.random()

        if random_number < p:
            n_success += 1

    return n_success
