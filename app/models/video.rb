class Video < ActiveRecord::Base
  require 'oembed'
  belongs_to :devotion

  def delete_if_empty
    if self.url.nil? || self.url.empty?
      self.delete
    end
  end

  def embed_block
    vdata = OEmbed::ProviderDiscovery.get(self.url)

    if vdata.html && !vdata.html.empty?
      vdata.html
    else
      ''
    end
  end

end
