state <- read.csv("../datasets/state.csv")

std_dev <- sd(state[["Population"]])
iqr <- IQR(state[["Population"]])
mad_value <- mad(state[["Population"]])

message(sprintf("Population Standard Deviation: %f", std_dev))
message(sprintf("Population IQR: %f", iqr))
message(sprintf("Population MAD: %f", mad_value))