import pandas as pd
from statsmodels import robust

state = pd.read_csv("../datasets/state.csv")

std_dev = state["Population"].std()
print("Population Standard Deviation: {}".format(std_dev))

# Percentile (formatted as integer) = Quantiles (formatted as decimal)
iqr = state["Population"].quantile(0.75) - state["Population"].quantile(0.25)
print("Population IQR: {}".format(iqr))

mad = robust.scale.mad(state["Population"])
print("Population MAD: {}".format(mad))
