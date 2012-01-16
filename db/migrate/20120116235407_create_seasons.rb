class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.boolean :skip_sundays

      t.timestamps
    end
  end
end
