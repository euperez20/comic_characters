class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :api_detail_url
      t.integer :count_of_issue_appearances
      t.string :deck
      t.string :description
      t.string :gender
      t.string :image
      t.references :origin, foreign_key: true
      t.references :publisher, foreign_key: true
      t.string :real_name
      t.string :power

      t.timestamps
    end

  
    add_index :characters, :publisher_id
  end
end