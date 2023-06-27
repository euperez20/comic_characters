require 'rest-client'
require 'json'

# Define the endpoint of the API and your API key
endpoint = 'https://comicvine.gamespot.com/api/characters/'
api_key = 'YOUR_API_KEY'
limit = 50
offset = 0

# Make the HTTP request to the API
response = RestClient.get(endpoint, params: { api_key: api_key, limit: limit, offset: offset, format: 'json' })
data = JSON.parse(response.body)

# Loop through the characters and create records in the database using ActiveRecord
data['results'].each do |character|
  # Find or create the associated origin
  origin = Origin.find_or_create_by(origin: character['origin']['name'])

  # Find or create the associated publisher
  publisher = Publisher.find_or_create_by(name: character['publisher']['name'])

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
