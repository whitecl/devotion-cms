module ApplicationHelper

  def oembed_generic(url)
    require 'oembed'
    OEmbed::ProviderDiscovery.get(url).html.html_safe
  end
end
