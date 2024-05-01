library(rvest)
library(jsonlite)
library(httr)
library(stringr)

# Define the base URL for the Guardian API content endpoint
url <- "https://content.guardianapis.com/search"

# Setup query parameters
articles <- list(
  "q" = "cryptocurrency",  # Keywords for the search
  "from-date" = "2014-05-01",  # From 
  "to-date" = format(Sys.Date(), "%Y-%m-%d"),  # Up to today's date
  "order-by" = "newest",  # Order by publication date (newest first)
  "show-fields" = "title,bodyText,lastModified",  # Fetch only specified fields
  "page-size" = 10,  # Number of results per page
  "api-key" = api_key  # Use the API key
)

# Make the HTTP request
response <- GET(url = url, query = articles)
data <- content(response, "text", encoding = "UTF-8")
parsed_data <- fromJSON(data)

# Extract the articles
articles <- parsed_data$response$results
articles

# Creating a csv file to store the data
write.csv(articles, file = "articles.csv", row.names = FALSE)


