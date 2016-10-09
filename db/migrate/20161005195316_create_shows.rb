class CreateShows < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.string :venue
      t.datetime :date
      t.string :type
      t.string :url

      t.timestamps
    end
    add_index :shows, [:date]
  end
end
