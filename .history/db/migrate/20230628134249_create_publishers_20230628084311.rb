class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :api_detail_url

      t.timestamps
    end

    add_index :publishers, :name, unique: true
  end
end
      t.timestamps
    end
  end
end
