# Percentiles

state <- read.csv("../datasets/state.csv")

quantile_data <- quantile(state[["Murder.Rate"]], p=c(0.05,0.25,0.5,0.75,0.95))

message(sprintf("Percentiles:\n%f",quantile_data ))

# Boxplot

boxplot(state[["Population"]]/1000000, ylab="Population (millions)")


# Frequency tables and Histograms


breaks <- seq(from=min(state[['Population']]),
              to=max(state[['Population']]), length=11)
pop_freq <- cut(state[['Population']], breaks=breaks,
                right=TRUE, include.lowest=TRUE)
table(pop_freq)

#message(sprintf("Table\n%f", table(pop_freq)))

# Histogram

hist(state[['Population']], breaks=breaks, xlab = "Population")


hist(state[["Murder.Rate"]], freq = FALSE)
lines(density(state[["Murder.Rate"]]), lwd=3, col="blue")
