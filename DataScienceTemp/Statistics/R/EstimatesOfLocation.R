library("matrixStats")

state <- read.csv("../datasets/state.csv")
population_mean <- mean(state[["Population"]])
population_mean_trimm <- mean(state[["Population"]], trim = 0.1)
population_median <- median(state[["Population"]])

message(sprintf("Population mean: %f",population_mean))
message(sprintf("Population mean trim (0.1): %f", population_mean_trimm))
message(sprintf("Population median: %f", population_median))

population_weighted_mean <- weighted.mean(state[["Murder.Rate"]], w=state[["Population"]])
population_weighted_median <- weightedMedian(state[["Murder.Rate"]], w=state[["Population"]])
message(sprintf("Population mean weight: %f", population_weighted_mean))
message(sprintf("Population median weight %f", population_weighted_median))