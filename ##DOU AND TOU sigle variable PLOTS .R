#INdividual plots


# ---- 1. Load data ----
file_path <- "/Users/piascaramiglia/Documents/Tarajoq/Final_data.csv"
data <- read.csv(file_path)

library(ggplot2)

# ---- 2. DOU PLOT with REGION ----
data_dou <- data[, c("DOU..median.of.replicates.", "Region")]
colnames(data_dou) <- c("DOU", "Region")
data_dou <- na.omit(data_dou)

p_dou <- ggplot(data_dou, aes(y = DOU, x = 1, color = Region)) +
  geom_boxplot(width = 0.2, fill = "lightblue", color = "black") +
  geom_jitter(width = 0.1, size = 3, alpha = 0.7) +
  scale_color_manual(values = c("East" = "red", "West" = "blue")) +
  labs(title = "Distribution of Dissolved Oxygen Uptake (DOU) by Region",
       x = "",
       y = "DOU (mL O₂ L⁻¹ d⁻¹)",
       color = "Region") +
  theme_minimal() +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())


# ---- 3. TOU PLOT with REGION ----
data_tou <- data[, c("TOU..median.of.repliates..mLO2.L.1.d.1.", "Region")]
colnames(data_tou) <- c("TOU", "Region")
data_tou <- na.omit(data_tou)

p_tou <- ggplot(data_tou, aes(y = TOU, x = 1, color = Region)) +
  geom_boxplot(width = 0.2, fill = "lightblue", color = "black") +
  geom_jitter(width = 0.1, size = 3, alpha = 0.7) +
  scale_color_manual(values = c("East" = "red", "West" = "blue")) +
  labs(title = "Distribution of Total Oxygen Uptake (TOU) by Region",
       x = "",
       y = "TOU (mL O₂ L⁻¹ d⁻¹)",
       color = "Region") +
  theme_minimal() +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())

# ---- 4. Print plots ----
print(p_dou)
print(p_tou)












####global boxplots
# ---- 1. Load data ----
file_path <- "/Users/piascaramiglia/Documents/Tarajoq/Final_data.csv"
data <- read.csv(file_path)
library(ggplot2)
library(dplyr)
library(tidyr)

# ---- 2. Select and merge DOU + TOU ----
data_long <- data %>%
  select(DOU = DOU..median.of.replicates.,
         TOU = TOU..median.of.repliates..mLO2.L.1.d.1.,
         Region) %>%
  pivot_longer(cols = c("DOU", "TOU"),
               names_to = "Variable", values_to = "Value") %>%
  na.omit()

# ---- 3. Combined plot ----
p_combined <- ggplot(data_long, aes(x = Region, y = Value, color = Region)) +
  geom_boxplot(width = 0.5, alpha = 0.4) +
  geom_jitter(width = 0.2, size = 2, alpha = 0.7) +
  facet_wrap(~Variable, scales = "fixed") +
  scale_color_manual(values = c("East" = "red", "West" = "blue")) +
  labs(title = "Comparison of DOU and TOU by Region",
       x = "Region",
       y = "Oxygen Uptake (mL O₂ L⁻¹ d⁻¹)") +
  theme_minimal()

print(p_combined)

