class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :api_detail_url
      t.integer :count_of_issue_appearances
      t.string :deck
      t.string :description
      t.string :string
      t.string :gender
      t.string :image
      t.string :origin
      t.string :publisher
      t.string :real_name
      t.string :power

      t.timestamps
    end
  end
end
