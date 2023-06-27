class CreateOrigins < ActiveRecord::Migration[7.0]
  def change
    create_table :origins do |t|
      t.string :origin

      t.timestamps
    end
  end
end
