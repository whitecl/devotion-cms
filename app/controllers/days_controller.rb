class DaysController < ApplicationController
  def index
    @days = DevotionDay.published
  end

  def show
    @day = DevotionDay.find(params[:id])

    redirect to days_path unless @day
  end
end
