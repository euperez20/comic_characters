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
