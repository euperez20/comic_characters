character_data['results'].each do |character|
  origin_name = character['origin']['name'] || 'Unknown'
  publisher_name = character['publisher']['name'] || 'Unknown'

  Character.create(
    name: character['name'],
    count_of_issue_appearances: character['count_of_issue_appearances'],
    deck: character['deck'],
    description: character['description'],
    gender: character['gender'],
    image: character['image']['original_url'],
    origin: Origin.find_or_create_by(name: origin_id),
    publisher: Publisher.find_or_create_by(name: publisher_name),
    real_name: character['real_name'],
    power: character['power']
  )
end
