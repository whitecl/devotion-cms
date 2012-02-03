ActiveAdmin.register DevotionDay do
  index do
    column :season
    column :day_no
    column :publish_date
    column :coordinator_notes
    column :sent_count
    default_actions
  end
end
