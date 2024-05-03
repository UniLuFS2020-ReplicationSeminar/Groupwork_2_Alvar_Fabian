
library(tidytext)

# Combine title, body, and date into one text column for text cleaning
processed_articles_df <- articles_df %>%
  mutate(
    combined_text = paste(title, body, date),
    cleaned_text = combined_text %>%
      tolower() %>%
      str_remove_all("[[:punct:]]") %>%
      str_remove_all("[[:digit:]]")
  ) %>%
  unnest_tokens(output = word, input = cleaned_text)

# Remove stop words 
clean_tokens_df <- processed_articles_df %>%
  anti_join(stop_words, by = "word")