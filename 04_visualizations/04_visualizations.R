
library(ggplot2)

# Plot of sentiment analysis
ggplot(sentiment_analysis, aes(x = article_id, y = sentiment_score, fill = sentiment_score > 0)) +
  geom_col(show.legend = FALSE) +
  scale_fill_manual(values = c("red", "green")) +
  labs(title = "Sentiment Analysis of Articles", x = "Article ID", y = "Sentiment Score") +
  theme_minimal()

# Add the average sentiment score to the plot
ggplot(sentiment_analysis, aes(x = article_id, y = sentiment_score, fill = sentiment_score > 0)) +
  geom_col(show.legend = FALSE) +
  scale_fill_manual(values = c("red", "green")) +
  labs(title = "Sentiment Analysis of Articles", x = "Article ID", y = "Sentiment Score") +
  theme_minimal() +
  geom_hline(yintercept = mean(sentiment_analysis$sentiment_score), color = "blue", linetype = "dashed")

# Histogram of sentiment scores
ggplot(sentiment_analysis, aes(x = sentiment_score)) +
  geom_histogram(bins = 30, fill = "dodgerblue", color = "black") +
  labs(title = "Distribution of Sentiment Scores Across Articles",
       x = "Sentiment Score",
       y = "Count of Articles") +
  theme_minimal()

# Save the plots
ggsave("sentiment_analysis_plot.png")
ggsave("sentiment_analysis_plot_with_average.png")
ggsave("histogram_plot.png")
