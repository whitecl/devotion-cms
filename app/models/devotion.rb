class Devotion < ActiveRecord::Base
  belongs_to :contributor
  belongs_to :devotion_day

  validates_presence_of :title, :content

  def published?
    (self.devotion_day && self.devotion_day.published?)
  end

  def full_verse_location
    if !bible_book.empty? && !bible_chapter.empty? && !bible_verse.empty?
      bible_book.to_s + " " + bible_chapter.to_s + ":" + bible_verse.to_s
    else
      ''
    end
  end
end
