library(dplyr)
library(ggplot2)
library(readr)

data <- read_csv("./data/brisbane_water_quality.csv")

print(head(data, 5))

plot <- ggplot(data, aes(x = Timestamp, y = `Average Water Speed`)) + 
  geom_line() +
  labs(title = "Average Water Speed Over Time", x = "Timestamp", y = "Average Water Speed") +
  theme_minimal()

ggsave("./plots/plot.png", plot = plot)

print(plot)