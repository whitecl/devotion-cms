class DevotionDay < ActiveRecord::Base
  belongs_to :season
  has_many :devotions

  scope :for_today, lambda { where(:publish_date => Date.today) } 
  scope :published, lambda { where("publish_date <= \"#{Date.today}\"") }

  def published?
    self.publish_date <= Date.today
  end

  def title
    season.title.to_s + ' Day ' + self.day_no.to_s 
  end

  def has_previous
    self.day_no - 1 > 0
  end

  def has_next
    self.day_no < season.published_day_count
  end

end
