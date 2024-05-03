library(tidytext)
library(dplyr)
library(ggplot2)
library(tm)

install.packages("quanteda")
install.packages("readr")
install.packages("quanteda.textstats")  # For sentiment analysis dictionaries
install.packages("quanteda.dictionaries")  # For sentiment analysis dictionaries
install.packages("lexicon")
install.packages("textdata")

library(quanteda)
library(readr)
library(quanteda.textstats)
library(textdata)

# Load the data from .csv file
articles_data <- read_csv("articles.csv")

# Create a corpus from the text column
corpus_text <- corpus(articles_data$fields.bodyText)
corpus_text

# Clean the corpus: remove punctuation, numbers, and stopwords
corpus_clean <- corpus_text %>%
  tokens(remove_punct = TRUE, remove_numbers = TRUE) %>%
  tokens_remove(stopwords("en"))

# Create a document-feature matrix
dfm_text <- dfm(tokens(corpus_clean), tolower = TRUE)

# Load the sentiment dictionary
data("sentiments")
sentiments

# Perform sentiment analysis
sentiment_scores <- textstat_sentiment(dfm_text, dictionary = "afinn")
