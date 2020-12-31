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
