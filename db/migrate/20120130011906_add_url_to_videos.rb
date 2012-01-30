class AddUrlToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :url, :string
    remove_column :videos, :source
    remove_column :videos, :code
  end
end
