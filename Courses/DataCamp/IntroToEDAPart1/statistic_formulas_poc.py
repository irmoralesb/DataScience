import numpy as np
from sklearn.datasets import load_iris
# Load iris data and get only versicolor petal
iris_ds = load_iris(return_X_y=False, as_frame=True)

# We need to get the versicolor target id
iris_number_array = np.where(iris_ds.target_names == "versicolor")
iris_number = iris_number_array[0]
versicolor_petal_length = iris_ds.data.loc[iris_ds.target == iris_number[0], ["petal length (cm)"]]
# Array of differences to mean: differences
versicolor_mean = np.mean(versicolor_petal_length)
differences = versicolor_petal_length - versicolor_mean

# Square the differences: diff_sq
diff_sq = differences ** 2

# Compute the mean square difference: variance_explicit
variance_explicit = np.mean(diff_sq)

# Compute the variance using NumPy: variance_np
variance_np = np.var(versicolor_petal_length)

# Print the results
print(variance_explicit, variance_np)

#Now showing the Standard Deviation

# Compute the variance: variance
variance = np.var(versicolor_petal_length)

# Print the square root of the variance
print(np.sqrt(variance))

# Print the standard deviation
print(np.std(versicolor_petal_length))
