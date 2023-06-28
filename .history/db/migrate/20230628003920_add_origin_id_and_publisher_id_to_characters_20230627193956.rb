class AddOriginIdAndPublisherIdToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :origin_id, :integer
    add_column :characters, :publisher_id, :integer
    add_index :characters, :origin_id
    add_index :characters, :publisher_id
  end
end
