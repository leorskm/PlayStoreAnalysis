library(dplyr)
library(readr)
library(tidyr)
library(stringr)

# Load the dataset
data <- read_csv("path_to_your_data/googleplaystore.csv")

# Handling missing values
data$Rating <- ifelse(is.na(data$Rating), median(data$Rating, na.rm = TRUE), data$Rating)
data$Type <- ifelse(is.na(data$Type), Mode(data$Type), data$Type) # Define Mode function or use which.max(table(data$Type))

# Converting data types
data$Reviews <- as.numeric(data$Reviews)
data$Installs <- as.numeric(gsub("\\D", "", data$Installs))
data$Price <- as.numeric(gsub("\\$", "", data$Price))

# Standardizing the 'Size' column
data$Size <- as.numeric(gsub("M", "e6", gsub("k", "e3", gsub("Varies with device", NA, data$Size))))

# Date conversion and extraction
data$Last.Updated <- as.Date(data$Last.Updated, format="%d-%b-%y")
data$Updated.Year <- format(data$Last.Updated, "%Y")
data$Updated.Month <- format(data$Last.Updated, "%m")

# Price category
data$Price.Category <- ifelse(data$Price == 0, "Free", "Paid")

# Install ranges
install_bins <- c(0, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000)
labels <- c("0-100", "100-1K", "1K-10K", "10K-100K", "100K-1M", "1M-10M", "10M-100M", "100M-1B")
data$Install.Range <- cut(data$Installs, breaks = install_bins, labels = labels, right = FALSE)

library(stats)

# Scaling features
data_scaled <- scale(data[c("Rating", "Reviews", "Installs")], center = TRUE, scale = TRUE)

# K-Means Clustering
set.seed(123) # for reproducibility
kmeans_result <- kmeans(data_scaled, centers = 5, nstart = 25)

# Adding cluster labels to the dataframe
data$Cluster <- kmeans_result$cluster

library(ggplot2)

# Cluster Distribution
ggplot(data, aes(x=factor(Cluster))) +
  geom_bar() +
  ggtitle("Distribution of Clusters")

# Scatter plot for Rating vs. Reviews
ggplot(data, aes(x=Rating, y=log10(Reviews + 1), color=factor(Cluster))) + # Adding 1 to avoid log10(0)
  geom_point(alpha=0.5) +
  ggtitle("Rating vs. Reviews by Cluster") +
  labs(color = "Cluster")

# Scatter plot for Rating vs. Installs
ggplot(data, aes(x=Rating, y=log10(Installs + 1), color=factor(Cluster))) + # Adding 1 to avoid log10(0)
  geom_point(alpha=0.5) +
  ggtitle("Rating vs. Installs by Cluster") +
  labs(color = "Cluster")
