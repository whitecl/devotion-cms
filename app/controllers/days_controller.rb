class DaysController < ApplicationController
  def index
    redirect_day = DevotionDay.published.order('publish_date DESC').first

    if redirect_day
      redirect_to day_path(redirect_day.id)
    else
      redirect_to about_days_path
    end
  end

  def show
    @day = DevotionDay.find(params[:id])

    redirect_to days_path unless @day
    redirect_to days_path unless @day.published?
  end

  def about
  end

  def faq
  end
end
