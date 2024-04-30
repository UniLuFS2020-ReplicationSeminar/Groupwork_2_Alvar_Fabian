

# Read in and extract the API key from the csv file
api_key_data <- read.csv("api_key.csv", header = FALSE)
api_key <- api_key_data$V1[1] 

# Set up the base URL for the content search endpoint
base_url <- "https://content.guardianapis.com/search"










