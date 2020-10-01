#Bar plot

airport_df <- read.csv("../datasets/dfw_airline.csv")
barplot(as.matrix(airport_df)/6, cex.axis = 0.8, cex.names = 0.7, 
        xlab = "Cause of delay",
        ylab = "Count")

