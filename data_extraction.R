# Example query parameters
query_params <- list(
  'q' = 'cryptocurrency OR Bitcoin OR Ethereum OR blockchain',  # Keywords for the search
  'section' = 'technology',  # Focus on technology section for relevant articles
  'from-date' = '2020-01-01',  
  'to-date' = format(Sys.Date(), "%Y-%m-%d"),  # Up to today's date
  'order-by' = 'relevance',  # Order by relevance 
  'show-fields' = 'all',  # Fetch all fields (title, body, etc.)
  'page-size' = 50,  # Number of results per page
  'api-key' = api_key  # Use the API key
)

# Make the HTTP request
response <- GET(url = base_url, query = query_params)