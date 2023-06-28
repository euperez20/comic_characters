class RenameOriginIdColumnInCharacters < ActiveRecord::Migration[7.0]
  def change
    rename_column :characters, :origin_id, :old_origin_id
  end
end
