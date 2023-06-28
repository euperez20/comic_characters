require 'json'
require 'rest-client'

# Método para realizar una solicitud a la API y obtener los datos en formato JSON
def fetch_data(url)
  response = RestClient.get(url)
  JSON.parse(response.body)
end

# Carga de datos de los orígenes (origins)
origin_url = 'https://comicvine.gamespot.com/api/origins/?api_key=5f517188a6f8c4e8daff13e9950f1321b0200271&format=json'
origin_data = fetch_data(origin_url)

origin_data['results'].each do |origin|
  Origin.create(
    origin: origin['name'],
    api_detail_url: origin['api_detail_url']
  )
end

puts 'Origins data seeded successfully.'

# Carga de datos de los editores (publishers)
publisher_url = 'https://comicvine.gamespot.com/api/publishers/?api_key=5f517188a6f8c4e8daff13e9950f1321b0200271&format=json'
publisher_data = fetch_data(publisher_url)

publisher_data['results'].each do |publisher|
  Publisher.create(
    name: publisher['name'],
    api_detail_url: publisher['api_detail_url']
  )
end

puts 'Publishers data seeded successfully.'

# Carga de datos de los personajes (characters)
character_url = 'https://comicvine.gamespot.com/api/characters/?api_key=5f517188a6f8c4e8daff13e9950f1321b0200271&format=json'
character_data = fetch_data(character_url)

character_data['results'].each do |character|
  origin_name = character['origin']['name'] || 'Unknown'
  origin = Origin.find_by(origin: origin_name)

  publisher_name = character['publisher']['name'] || 'Unknown'
  publisher = Publisher.find_by(name: publisher_name)

  Character.create(
    name: character['name'],
    api_detail_url: character['api_detail_url'],
    count_of_issue_appearances: character['count_of_issue_appearances'],
    deck: character['deck'],
    description: character['description'],
    gender: character['gender'],
    image: character['image'],
    origin: origin,
    publisher: publisher,
    real_name: character['real_name'],
    power: character['power']
  )
end

puts 'Characters data seeded successfully.'