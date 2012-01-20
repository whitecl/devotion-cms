class DevotionDay < ActiveRecord::Base
  belongs_to :season

  has_many :devotions
end
