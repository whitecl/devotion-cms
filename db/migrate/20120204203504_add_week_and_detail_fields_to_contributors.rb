class AddWeekAndDetailFieldsToContributors < ActiveRecord::Migration
  def change
    add_column :contributors, :desired_week, :string
    add_column :contributors, :devotion_quick_description, :text
  end
end
