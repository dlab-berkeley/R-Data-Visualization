## Solutions for challenges in R-Data-Visualizations
install.packages("tidyverse", "here")
library(tidyverse)
library(here)
setwd(here())

# Challenge 1: Histograms in ggplot() ----

# read in data
d <- readRDS("./data/ACS_age_income.rds")

# explore data
head(d)

# create histogram
ggplot(data = d, aes(x = income)) + 
  # make the bins $10,000 wide
  geom_histogram(binwidth = 10000,
                 color = "black", 
                 fill = "gray80") + 
  theme_bw() + 
  ggtitle("Histogram of Income") + 
  xlab("Income ($)") + 
  ylab("Frequency") 

# Challenge 2: Boxplots in ggplot() ----

# read in data
d <- readRDS("./data/ACS_age_income.rds")

# explore data
head(d)

# boxplot
d |>
  ggplot(aes(x = educ, y = income)) + 
  geom_boxplot() +
  ggtitle("Income by Education Level") +
  xlab("Education") +
  ylab("Income ($)") +
  theme_bw()

# Challenge 3: Scatter plots ----
d <- readRDS("./data/ACS_age_income.rds")

## Part 1 ----
d |>
  ggplot(aes(x = age, y = income, color = educ)) +
  geom_point()

## Part 2 ----
d_avg_inc <- d |>
  group_by(age, educ) |>
  summarize(avg_income = mean(income, na.rm = T)) 

d_avg_inc|>
  # use color and shape to make the points more distinct 
  ggplot(aes(x = age, y = avg_income, color = educ, shape = educ)) +
  geom_point() +
  theme_bw() +
  # move the legend and remove the legend title
  theme(legend.position = "bottom",
        legend.title = element_blank()) +
  ggtitle("Average Income by Age for Education Levels") +
  xlab("Age") +
  ylab("Avergae Income ($)")
