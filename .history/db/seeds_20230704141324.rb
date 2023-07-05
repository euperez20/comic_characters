require 'net/http'
require 'json'

def import_powers_from_dataset
  url = "https://comicvine.gamespot.com/api/powers/?api_key=5f517188a6f8c4e8daff13e9950f1321b0200271&offset=0&format=json"
  response = Net::HTTP.get(URI(url))
  json_data = JSON.parse(response)

  json_data["results"].each do |power_data|
    power = Power.new(
      name: power_data["name"],
      description: power_data["description"]
    )
    power.save
  end
end
