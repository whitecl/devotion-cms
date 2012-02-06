class Season < ActiveRecord::Base
  has_many :devotion_days

  validates_presence_of :title, :start_date, :end_date

  after_create :generate_devotion_days

  scope :sorted_by_start_date, order(:start_date)

  def has_published_days?
    self.devotion_days.published.count > 0
  end

  def length_in_days
    (self.end_date - self.start_date).to_i + 1
  end

  def generate_devotion_days
    # Generate a devotion day for each day this season covers.
    day_counter = 1 # We have to count devotion day_nos separately since we can skip sundays.
    self.length_in_days.times do |i|

      # Skip this day if it's sunday and the coordinator asked not to use sunday.
      unless self.skip_sundays && (self.start_date + i.days).sunday?
        self.devotion_days.create({
          day_no: day_counter,
          publish_date: self.start_date + i.days
        })
        day_counter += 1
      end
    end
  end

end
