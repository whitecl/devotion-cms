class DaysController < ApplicationController
  def index
    @days = DevotionDay.published
  end
end
