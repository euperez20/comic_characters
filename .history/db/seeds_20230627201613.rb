Character.all.each do |character|
  origin_name = character.origin_name
  origin = Origin.find_by(name: origin_name)

  if origin
    character.origin = origin
  else
    puts "Origin not found for character #{character.name}"
  end

  publisher_name = character.publisher_name
  publisher = Publisher.find_by(name: publisher_name)

  if publisher
    character.publisher = publisher
  else
    puts "Publisher not found for character #{character.name}"
  end

  character.save
end
