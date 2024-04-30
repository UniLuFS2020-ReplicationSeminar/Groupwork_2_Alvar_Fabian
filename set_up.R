
# Authentication
if (!require("dotenv")) install.packages("dotenv", repos = "https://cloud.r-project.org/")
library(dotenv)

# Load other necessary packages

library(tidyverse)
library(httr)
library(jsonlite)


# Load environment variables
load_dot_env()

# Retrieve the API key
api_key <- Sys.getenv('api_key')

# Test whether access to API key is working
# Set up the base URL for the content search endpoint
url <- "https://content.guardianapis.com/search"

# Define query parameters
cnt <- list(
  'q' = 'cryptocurrency'
)

# Make the HTTP request
response <- GET(url = url, query = cnt)
response


files <- list.files

