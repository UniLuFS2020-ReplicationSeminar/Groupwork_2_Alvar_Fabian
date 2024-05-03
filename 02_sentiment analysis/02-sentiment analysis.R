library(tidytext)
library(dplyr)
library(ggplot2)

# Load the data
articles <- read.csv("articles.csv", sep = ",")

# Data Preparation for Sentiment Analysis
words <- articles %>%
  unnest_tokens(word, bodyText) %>%
  anti_join(stop_words)




