class Video < ActiveRecord::Base
  belongs_to :devotion

  validate :source_is_valid

  def self.allowed_video_sources
    ['youtube', 'vimeo']
  end

  def source_is_valid
    Video.allowed_video_sources.include? self.source
  end

  def delete_if_empty
    if self.source.nil? || self.source.empty? || self.code.nil? || self.code.empty?
      self.delete
    end
  end

end
