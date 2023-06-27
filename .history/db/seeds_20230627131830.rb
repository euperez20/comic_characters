require 'rest-client'
require 'json'

# Define the endpoint of the API and your API key
endpoint = 'https://comicvine.gamespot.com/api/characters/'
api_key = '5f517188a6f8c4e8daff13e9950f1321b0200271'
limit = 50
offset = 0

# Make the HTTP request to the API
response = RestClient.get(endpoint, params: { api_key: api_key, limit: limit, offset: offset, format: 'json' })
data = JSON.parse(response.body)

# Loop through the characters and create records in the database using ActiveRecord
data['results'].each do |character|
    # Extract origin data from the JSON object
    origin_data = character['origin']
    origin_name = origin_data['name'] || 'Unknown'
    origin = Origin.find_or_create_by(origin: origin_name)
  
    # Extract publisher data from the JSON object
    publisher_data = character['publisher']
    publisher_name = publisher_data['name'] || 'Unknown'
    publisher = Publisher.find_or_create_by(name: publisher_name)
  
    # Create the character record with the associated origin and publisher
    Character.create!(
      name: character['name'],
      api_detail_url: character['api_detail_url'],
      count_of_issue_appearances: character['count_of_issue_appearances'],
      deck: character['deck'],
      description: character['description'],
      gender: character['gender'],
      image: character['image']['medium_url'],
      origin: origin,
      publisher: publisher,
      real_name: character['real_name'],
      power: character['power']
    )
  end
  