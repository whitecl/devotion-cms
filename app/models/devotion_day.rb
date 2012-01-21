class DevotionDay < ActiveRecord::Base
  belongs_to :season
  has_many :devotions

  scope :published, where("publish_date <= \"#{Date.today}\"")
end
