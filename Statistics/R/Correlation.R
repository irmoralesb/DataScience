sp500_px <- read.csv(file.path('..', 'datasets', 'sp500_data.csv.gz'), row.names=1)
sp500_sym <- read.csv(file.path('..', 'datasets', 'sp500_sectors.csv'), stringsAsFactors = FALSE)

etfs <- sp500_px[row.names(sp500_px) > '2012-07-01',
                 sp500_sym[sp500_sym$sector == 'etf', 'symbol']]
library(corrplot)
corrplot(cor(etfs), method='ellipse')
