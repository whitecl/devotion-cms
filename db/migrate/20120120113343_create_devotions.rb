class CreateDevotions < ActiveRecord::Migration
  def change
    create_table :devotions do |t|
      t.references :contributor
      t.references :devotion_day
      t.string :title
      t.text :bible_text
      t.string :bible_book
      t.string :bible_chapter
      t.string :bible_verse
      t.text :content
      t.string :your_name
      t.text :about_me

      t.timestamps
    end
    add_index :devotions, :devotion_day_id
  end
end
