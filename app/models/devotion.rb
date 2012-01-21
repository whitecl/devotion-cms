class Devotion < ActiveRecord::Base
  belongs_to :contributor
  belongs_to :devotion_day

  def full_verse_location
    bible_book.to_s + " " + bible_chapter.to_s + ":" + bible_verse.to_s
  end
end
