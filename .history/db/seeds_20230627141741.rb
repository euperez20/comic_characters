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
    origin_name = origin_data.present? ? origin_data['name'] : 'Unknown'
    origin = Origin.find_or_create_by(origin: origin_name)
  
    # Extract publisher data from the JSON object
    publisher_data = character['publisher']
    publisher_name = publisher_data.present? ? publisher_data['name'] : 'Unknown'
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
      origin: origin.origin, # Access the 'origin' attribute of the 'origin' object
      publisher: publisher.name, # Access the 'name' attribute of the 'publisher' object
      real_name: character['real_name'],
      power: character['power']
    )

    Character.all.each do |character|
        origin_name = character.origin_name
        origin = Origin.find_by(name: origin_name)
      
        if origin
          character.origin_id = origin.id
        else
          # Si no se encuentra el origen en la base de datos, puedes manejarlo de acuerdo a tus necesidades
          # Por ejemplo, asignar un origen predeterminado o mostrar un mensaje de error.
          puts "Origin not found for character #{character.name}"
        end
      
        publisher_name = character.publisher_name
        publisher = Publisher.find_by(name: publisher_name)
      
        if publisher
          character.publisher_id = publisher.id
        else
          # Si no se encuentra el editor en la base de datos, puedes manejarlo de acuerdo a tus necesidades
          # Por ejemplo, asignar un editor predeterminado o mostrar un mensaje de error.
          puts "Publisher not found for character #{character.name}"
        end
      
        character.save
      end
      




  end
  