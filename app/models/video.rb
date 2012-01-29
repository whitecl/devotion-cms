class Video < ActiveRecord::Base
  belongs_to :devotion

  validate :source_is_valid
  validates_presence_of :source, :code

  def source_is_valid
    allowed_video_sources.include? self.source
  end

  def allowed_video_sources
    ['youtube', 'vimeo']
  end
end
