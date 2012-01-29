class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :source
      t.string :code
      t.references :devotion

      t.timestamps
    end
    add_index :videos, :devotion_id
  end
end
