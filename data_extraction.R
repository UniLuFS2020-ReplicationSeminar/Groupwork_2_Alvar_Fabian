library(rvest)
library(jsonlite)
library(httr)
library(stringr)

# Define the base URL for the Guardian API content endpoint
url <- "https://content.guardianapis.com/search"

# Setup query parameters
articles_0424 <- list(
  "q" = "cryptocurrency OR Bitcoin OR Ethereum OR blockchain",  # Keywords for the search
  "from-date" = "2024-04-01",  # From 01.05.2014
  "to-date" = format(Sys.Date(), "%Y-%m-%d"),  # Up to today's date
  "order-by" = "newest",  # Order by publication date (newest first)
  "show-fields" = "all",  # Fetch all fields (title, body, etc.)
  "page-size" = 50,  # Number of results per page
  "api-key" = api_key  # Use the API key
)

# Make the HTTP request
response <- GET(url = url, query = articles_0424)

# Check the status of the response
status_code(response)

# Extract the content from the response
content <- content(response, "text", encoding = "UTF-8")

# Parse the JSON content
parsed_content <- fromJSON(content)

# Extract the necessary textual data (article bodies) which will be analyzed for sentiment
if (!is.null(parsed_content$response$results)) {
  articles_data <- parsed_content$response$results
  
  # Create a data frame with the necessary information
  articles_df <- data.frame(
    title = sapply(articles_data, function(x) x$fields$headline),
    body = sapply(articles_data, function(x) x$fields$bodyText),
    date = sapply(articles_data, function(x) x$webPublicationDate),
    stringsAsFactors = FALSE
  )
} else {
  print("No data found or there was an error in fetching the data.")
  articles_df <- data.frame()  # Create an empty data frame in case of failure
}










