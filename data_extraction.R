library(rvest)
library(jsonlite)
library(httr)
library(stringr)

# Define the base URL for the Guardian API content endpoint
url <- "https://content.guardianapis.com/search"

# Setup query parameters
articles <- list(
  "q" = "cryptocurrency OR Bitcoin OR Ethereum OR blockchain",  # Keywords for the search
  "from-date" = "2024-04-01",  # From 01.05.2014
  "to-date" = format(Sys.Date(), "%Y-%m-%d"),  # Up to today's date
  "order-by" = "newest",  # Order by publication date (newest first)
  "show-fields" = "all",  # Fetch all fields (title, body, etc.)
  "page-size" = 50,  # Number of results per page
  "api-key" = api_key  # Use the API key
)

# Make the HTTP request
response <- GET(url = url, query = articles)


