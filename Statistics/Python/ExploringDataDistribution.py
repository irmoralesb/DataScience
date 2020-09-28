import pandas as pd
import matplotlib.pyplot as plt

state = pd.read_csv("../datasets/state.csv")
quantiles = state["Murder.Rate"].quantile([0.05, 0.25, 0.5, 0.75, 0.95])
print("Percentiles.")
print("Quantiles:\n{}".format(quantiles))

# Box Plot
ax = (state["Population"] / 1_000_000).plot.box()
ax.set_ylabel("Population (millions)")
plt.show()

# Frequency tables
binnedPopulation = pd.cut(state["Population"], 10)
print("{}".format(binnedPopulation.value_counts()))

# Histograms
ax = (state["Population"] / 1000000).plot.hist(figsize=(4, 4))
ax.set_xlabel("Population (millions)")
plt.show()

# Density Plots and Estimates
ax = state["Murder.Rate"].plot.hist(density=True, xlim=[0, 12], bins=range(1, 12))
state["Murder.Rate"].plot.density(ax=ax)
ax.set_xlabel("Murder Rate (per 100,000)")
plt.show()
