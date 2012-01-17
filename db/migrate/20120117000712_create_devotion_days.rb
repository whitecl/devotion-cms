class CreateDevotionDays < ActiveRecord::Migration
  def change
    create_table :devotion_days do |t|
      t.integer :day_no
      t.date :publish_date
      t.text :coordinator_notes
      t.references :season

      t.timestamps
    end
  end
end
