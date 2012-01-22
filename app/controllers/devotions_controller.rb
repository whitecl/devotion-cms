class DevotionsController < ApplicationController
  def index
    redirect_to days_path
  end

  def show
    @devotion = Devotion.find(params[:id])
    # Only show the devotion if it exists and it is published.
    redirect_to days_path unless @devotion && @devotion.published?
  end
end
