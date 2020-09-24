import pandas as pd
import numpy as np
import wquantiles
from scipy.stats import trim_mean

state = pd.read_csv("../datasets/state.csv")

mean = state["Population"].mean()
print("Population mean: {}".format(mean))

trim_mean = trim_mean(state["Population"], 0.1)
print("Population trim mean using 0.1 is: {}".format(trim_mean))

median = state["Population"].median()
print("Population median is: {}".format(median))

weighted_mean = np.average(state["Murder.Rate"], weights=state["Population"])
print("Murder Rate weighted mean based on Population rate: {}".format(weighted_mean))

weighted_median = wquantiles.median(state["Murder.Rate"], weights=state["Population"])
print("Murder Rate weighted median based on Population: {}".format(weighted_median))
