##DOU AND TOU sigle variable PLOTS

colnames(data) 
# ---- 1. Load and inspect data ----
file_path <- "/Users/piascaramiglia/Documents/Tarajoq/Final_data.csv"
data <- read.csv(file_path)

# ---- 2. Subset only DOU column ----
data_dou <- data[, "DOU..median.of.replicates.", drop = FALSE]
colnames(data_dou) <- "DOU"

# Remove missing values
data_dou <- na.omit(data_dou)

# ---- 3. Simple plot of DOU ----
library(ggplot2)
ggplot(data_dou, aes(y = DOU, x = 1)) +
  geom_boxplot(width = 0.2, fill = "lightblue") +
  geom_jitter(width = 0.1, size = 3, alpha = 0.7) +
  labs(title = "Distribution of Dissolved Oxygen Uptake (DOU)",
       x = "",
       y = "DOU") +
  theme_minimal() +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())












# ---- 1. Load and inspect data ----
file_path <- "/Users/piascaramiglia/Documents/Tarajoq/Final_data.csv"
data <- read.csv(file_path)

# ---- 2. Subset only DOU column ----
data_dou <- data[, "TOU..median.of.repliates..mLO2.L.1.d.1.", drop = FALSE]
colnames(data_dou) <- "TOU"

# Remove missing values
data_dou <- na.omit(data_dou)

# ---- 3. Simple plot of DOU ----
library(ggplot2)
ggplot(data_dou, aes(y = TOU, x = 1)) +
  geom_boxplot(width = 0.2, fill = "lightblue") +
  geom_jitter(width = 0.1, size = 3, alpha = 0.7) +
  labs(title = "Distribution of Total Oxygen Uptake (TOU)",
       x = "",
       y = "TOU") +
  theme_minimal() +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())





