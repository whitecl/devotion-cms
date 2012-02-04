class DaysController < ApplicationController
  def index
    @days = DevotionDay.published.order('publish_date DESC')

    if @days.empty?
      redirect_to about_days_path
    end
  end

  def show
    @day = DevotionDay.find(params[:id])

    redirect to days_path unless @day
  end

  def about
  end
end
