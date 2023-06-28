class AddOriginAndPublisherToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_reference :characters, :origin, foreign_key: true
    add_reference :characters, :publisher, foreign_key: true
  end
end
