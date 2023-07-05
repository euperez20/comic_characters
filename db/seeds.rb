# Obtén la lista de powers desde la API y guarda los datos en la base de datos
require 'json'
require 'net/http'

url = URI.parse('https://comicvine.gamespot.com/api/powers/?api_key=5f517188a6f8c4e8daff13e9950f1321b0200271&offset=0&format=json')
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url.request_uri)
response = http.request(request)
powers_data = JSON.parse(response.body)

powers_data['results'].each do |power_data|
  power = Power.create!(
    name: power_data['name'],
    description: power_data['description'],
    # otros atributos del power
  )
end

# Relaciona powers aleatorios con characters existentes
characters = Character.all

characters.each do |character|
  random_powers = Power.all.sample(3) # Asigna 3 powers aleatorios a cada character
  character.powers << random_powers
end
