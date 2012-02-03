class AddSentCountToDevotionDays < ActiveRecord::Migration
  def change
    add_column :devotion_days, :sent_count, :integer
  end
end
