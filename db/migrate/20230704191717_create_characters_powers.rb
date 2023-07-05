class CreateCharactersPowers < ActiveRecord::Migration[7.0]
  def change
    create_table :characters_powers do |t|
      t.references :character, foreign_key: true
      t.references :power, foreign_key: true

      t.timestamps
    end
  end
end
