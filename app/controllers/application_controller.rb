class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :generate_navigation_data

  def generate_navigation_data
    seasons = Season.sorted_by_start_date

    @navigation_seasons = seasons.reject{|season| !season.has_published_days?}
  end
end
