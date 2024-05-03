library(rvest)
library(jsonlite)
library(httr)
library(stringr)

# Define the base URL for the Guardian API content endpoint
url <- "https://content.guardianapis.com/search"

# Setup query parameters
api_key_data <- read.csv("api_key.csv", header = FALSE)
api_key <- api_key_data$V1[1]
base_url <- "https://content.guardianapis.com/search"
query_params <- list(
  q = "cryptocurrency AND blockchain OR bitcoin OR ethereum",
  "order-by" = "newest",
  "page-size" = 200,
  "api-key" = api_key,
  "show-fields" = "body"
)

# Construct URL and make a HTTP request
url <- modify_url(base_url, query = query_params)
response <- GET(url)

# Process the API response and extract article details
if (http_status(response)$category == "Success") {
  data <- content(response, "parsed")
  articles <- map(data$response$results, ~list(
    title = .x$webTitle,
    body = .x$fields$body,
    date = .x$webPublicationDate  
  ))
} else {
  stop("Failed to fetch data")
}

# Converting list to a data frame
articles_df <- map_df(data$response$results, ~data.frame(
  title = coalesce(.x$webTitle, ""),
  body = coalesce(.x$fields$body, ""),
  date = coalesce(.x$webPublicationDate, "")  
), .id = "article_id")

# Save to CSV
write.csv(articles_df, "cryptocurrency_articles.csv", row.names = FALSE)

