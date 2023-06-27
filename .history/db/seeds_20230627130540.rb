seed:Origin
require 'rest-client'
require 'json'

# Define the endpoint of the API and your API key
endpoint = 'https://comicvine.gamespot.com/api/origins/'
api_key = '5f517188a6f8c4e8daff13e9950f1321b0200271'
limit = 100
offset = 0

# Make the HTTP request to the API
response = RestClient.get(endpoint, params: { api_key: api_key, limit: limit, offset: offset, format: 'json' })
data = JSON.parse(response.body)

# Loop through the origins and create records in the database using ActiveRecord
data['results'].each do |origin|
  Origin.create!(
    origin: origin['name']
  )
end
