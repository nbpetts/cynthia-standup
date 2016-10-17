class AddFrontPageToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :front_page, :boolean
  end
end
