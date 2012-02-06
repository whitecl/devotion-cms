class AddNavigationTitleToSeason < ActiveRecord::Migration
  def change
    add_column :seasons, :navigation_title, :string
  end
end
