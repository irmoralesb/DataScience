import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
from course_functions import ecdf
from sklearn.datasets import load_iris

sns.set()

# Load iris data and get only versicolor petal
iris_ds = load_iris(return_X_y=False, as_frame=True)

# We need to get the versicolor target id
iris_number_array = np.where(iris_ds.target_names == "versicolor")
iris_number = iris_number_array[0]
versicolor_petal_length = iris_ds.data.loc[iris_ds.target == iris_number[0], ["petal length (cm)"]]

# Compute number of data points: n_data
n_data = len(versicolor_petal_length)

# Number of bins is the square root of number of data points: n_bins
n_bins = np.sqrt(n_data)

# Convert number of bins to integer: n_bins
n_bins = int(n_bins)

# Plot the histogram
plt.hist(versicolor_petal_length, bins=n_bins)

# Label axes
_ = plt.xlabel('petal length (cm)')
_ = plt.ylabel('count')

# Show histogram
plt.show()

# Now let's see the comparison among all the iris' petal length
iris_ds_data_merged = iris_ds.data
iris_ds_data_merged["species"] = iris_ds.target_names[iris_ds.target]

sns.swarmplot(x="species", y="petal length (cm)", data=iris_ds_data_merged)

# Label the axes
plt.xlabel("species")
plt.ylabel("petal length (cm)")
# Show the plot
plt.show()

# Using ECDF

# Compute ECDF for versicolor data: x_vers, y_vers
x_vers, y_vers = ecdf(versicolor_petal_length["petal length (cm)"])

# Generate plot
plt.plot(x_vers, y_vers, marker=".", linestyle="none")

# Label the axes
plt.xlabel("versicolor petal length")
plt.ylabel("ECDF")

# Display the plot
plt.show()

## Using ECDF to compare

iris_number_array = np.where(iris_ds.target_names == "setosa")
iris_number = iris_number_array[0]
setosa_petal_length = iris_ds.data.loc[iris_ds.target == iris_number[0], ["petal length (cm)"]]

iris_number_array = np.where(iris_ds.target_names == "virginica")
iris_number = iris_number_array[0]
virginica_petal_length = iris_ds.data.loc[iris_ds.target == iris_number[0], ["petal length (cm)"]]
# Compute ECDFs
x_set, y_set = ecdf(setosa_petal_length["petal length (cm)"])
x_vers, y_vers = ecdf(versicolor_petal_length["petal length (cm)"])
x_virg, y_virg = ecdf(virginica_petal_length["petal length (cm)"])

# Plot all ECDFs on the same plot
plt.plot(x_set, y_set, marker=".", linestyle="none")
plt.plot(x_vers, y_vers, marker=".", linestyle="none")
plt.plot(x_virg, y_virg, marker=".", linestyle="none")

# Annotate the plot
plt.legend(('setosa', 'versicolor', 'virginica'), loc='lower right')
_ = plt.xlabel('petal length (cm)')
_ = plt.ylabel('ECDF')

# Display the plot
plt.show()

# PERCENTILES
percentiles = np.array([2.5, 25, 50, 75, 97.5])
versicolor_percentiles = np.percentile(versicolor_petal_length, percentiles)
setosa_percentiles = np.percentile(setosa_petal_length, percentiles)
virginica_percentiles = np.percentile(virginica_petal_length, percentiles)

# Graph the ECDF with Percentiles

plt.plot(x_set, y_set, marker=".", linestyle="none")
plt.plot(setosa_percentiles, percentiles / 100, marker="D", color="red", linestyle="none")
plt.plot(x_vers, y_vers, marker=".", linestyle="none")
plt.plot(versicolor_percentiles, percentiles / 100, marker="D", color="red", linestyle="none")
plt.plot(x_virg, y_virg, marker=".", linestyle="none")
plt.plot(virginica_percentiles, percentiles / 100, marker="D", color="red", linestyle="none")
plt.show()

# BOXPLOT

# Create box plot with Seaborn's default settings
_ = sns.boxplot(x="species", y="petal length (cm)", data=iris_ds_data_merged)

# Label the axes
_ = plt.xlabel("species")
_ = plt.ylabel("petal length (cm)")

# Show the plot
plt.show()

# CORRELATION BETWEEN TO PROPERTIES
iris_number_array = np.where(iris_ds.target_names == "versicolor")
iris_number = iris_number_array[0]
versicolor_petal_width = iris_ds_data_merged.loc[iris_ds.target == iris_number[0], ["petal width (cm)"]]
# Make a scatter plot
_ = plt.plot(versicolor_petal_length, versicolor_petal_width, marker=".", linestyle="none")

# Label the axes
_ = plt.xlabel("versicolor petal length")
_ = plt.ylabel("versicolor petal width")

# Show the result
plt.show()

# Compute the covariance matrix: covariance_matrix
covariance_matrix = np.cov(versicolor_petal_length["petal length (cm)"], versicolor_petal_width["petal width (cm)"])

# Print covariance matrix
print(covariance_matrix)

# Extract covariance of length and width of petals: petal_cov
petal_cov = covariance_matrix[0][1]

# Print the length/width covariance
print(petal_cov)


## PEARSON COEFFICIENT
def pearson_r(x, y):
    """Compute Pearson correlation coefficient between two arrays."""
    # Compute correlation matrix: corr_mat
    corr_mat = np.corrcoef(x, y)

    # Return entry [0,1]
    return corr_mat[0, 1]


# Compute Pearson correlation coefficient for I. versicolor: r
r = pearson_r(versicolor_petal_length["petal length (cm)"], versicolor_petal_width["petal width (cm)"])

# Print the result
print("Pearson Correlation {}".format(r))
