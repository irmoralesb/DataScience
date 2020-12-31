import numpy as np

#ECDF
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
