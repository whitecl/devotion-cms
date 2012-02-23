module ApplicationHelper

  def oembed_generic(url)
    require 'oembed'
    OEmbed::ProviderDiscovery.get(url).html.html_safe
  end

  def attachment_url(attachment)
    "#{root_url}#{attachment.url.gsub(/^\//, '')}"
  end

  def expand_content_urls(content)
    content.gsub('/system', "#{root_url}system")
  end
end
