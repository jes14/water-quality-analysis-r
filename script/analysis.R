library(dplyr)
library(ggplot2)
library(readr)

## Import data
data <- read_csv("./data/brisbane_water_quality.csv")

print(head(data, 5))

## Creating a ggplot
plot <- ggplot(data, aes(x = Timestamp, y = `Average Water Speed`)) + 
  geom_line() +
  labs(title = "Average Water Speed Over Time", x = "Timestamp", y = "Average Water Speed") +
  theme_minimal()

# ggsave("./plots/plot.png", plot = plot)

print(plot)

# Creating a ggplot
ggplot <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# ggsave("./plots/ggplot.png", plot = ggplot)

print(ggplot)

## Creating a line ggplot
lineggplot <- ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

# ggsave("./plots/lineggplot.png", plot = lineggplot)
print(lineggplot)


## Filter the data by month (August 2023)
data$Timestamp <- as.POSIXct(data$Timestamp, format="%Y-%m-%d %H:%M:%S")

colnames(data) <- make.names(colnames(data))

data$Timestamp <- as.POSIXct(data$Timestamp, format="%Y-%m-%d %H:%M:%S")

august_data <- data %>%
  filter(format(Timestamp, "%Y-%m") == "2023-08")

print(colnames(data))
print(summary(august_data))

augustggplot <- ggplot(august_data, aes(x=Timestamp, y=Average.Water.Speed)) +
  geom_line() +
  labs(title="Average Water Speed in August 2023",
       x="Timestamp",
       y="Average Water Speed") +
  theme_minimal()

print(augustggplot)

# ggsave("./plots/augustggplot.png", plot = augustggplot)
