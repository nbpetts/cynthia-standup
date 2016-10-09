class ChangeShowColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :shows, :type, :show_type
  end
end
