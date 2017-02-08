class AddFrontPagePublishedToWritings < ActiveRecord::Migration[5.0]
  def change
    add_column :writings, :front_page, :boolean
    add_column :writings, :published, :boolean
  end
end
