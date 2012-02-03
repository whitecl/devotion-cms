class DevotionDay < ActiveRecord::Base
  belongs_to :season
  has_many :devotions

  scope :for_today, where(:publish_date => Date.today)
  scope :published, where("publish_date <= \"#{Date.today}\"")

  def published?
    self.publish_date <= Date.today
  end

  def title
    season.title.to_s + ' Day ' + self.day_no.to_s 
  end
end
