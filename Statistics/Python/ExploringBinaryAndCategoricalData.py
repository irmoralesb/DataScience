import pandas as pd
import matplotlib.pyplot as plt

airlines_df = pd.read_csv("../datasets/dfw_airline.csv")
ax = airlines_df.transpose().plot.bar(figsize=(4, 4), legend=False)
ax.set_xlabel("Cause of delay")
ax.set_ylabel("Count")
plt.show()
