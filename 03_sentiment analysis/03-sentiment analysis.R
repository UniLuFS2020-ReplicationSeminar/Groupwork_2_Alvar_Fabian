
# Load the AFINN sentiment lexicon and join with tokenized words
sentiment_analysis <- clean_tokens_df %>%
  inner_join(get_sentiments("afinn"), by = "word") %>%
  group_by(article_id) %>%
  summarise(
    sentiment_score = sum(value),  
    .groups = 'drop'  
  )

# Display sentiment scores for each article, sorted by score
sentiment_analysis %>%
  arrange(desc(sentiment_score)) %>%
  print(n = Inf)  # show all 200 articles

# Show the average sentiment score
sentiment_analysis %>%
  summarise(
    average_sentiment_score = mean(sentiment_score)
  )









