class DaysController < ApplicationController
  def index
    @days = DevotionDay.published.order('publish_date DESC')
  end

  def show
    @day = DevotionDay.find(params[:id])

    redirect to days_path unless @day
  end
end
