import pandas as pd
import seaborn as sns
import matplotlib.pylab as plt

# Correlation with heatmap

sp500_sym = pd.read_csv("../datasets/sp500_sectors.csv")
sp500_px = pd.read_csv("../datasets/sp500_data.csv", index_col=0)

telecomSymbols = sp500_sym[sp500_sym['sector'] == 'telecommunications_services']['symbol']

etfs = sp500_px.loc[sp500_px.index > "2012-07-01", sp500_sym[sp500_sym["sector"] == "etf"]["symbol"]]
sns.heatmap(etfs.corr(), vmin=-1, vmax=1, cmap=sns.diverging_palette(20, 220, as_cmap=True))
plt.show()

# Filter data for dates July 2012 through June 2015
telecom = sp500_px.loc[sp500_px.index >= '2012-07-01', telecomSymbols]
telecom.corr()
print(telecom)

# Scatter Plot

ax = telecom.plot.scatter(x='T', y='VZ', figsize=(4, 4), marker='$\u25EF$')
ax.set_xlabel('ATT (T)')
ax.set_ylabel('Verizon (VZ)')
ax.axhline(0, color='grey', lw=1)
ax.axvline(0, color='grey', lw=1)

plt.tight_layout()
plt.show()

ax = telecom.plot.scatter(x='T', y='VZ', figsize=(4, 4), marker='$\u25EF$', alpha=0.5)
ax.set_xlabel('ATT (T)')
ax.set_ylabel('Verizon (VZ)')
ax.axhline(0, color='grey', lw=1)
print(ax.axvline(0, color='grey', lw=1))