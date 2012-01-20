class Devotion < ActiveRecord::Base
  belongs_to :contributor
  belongs_to :devotion_day
end
