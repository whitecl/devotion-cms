class DevotionsController < ApplicationController
  before_filter :authenticate_contributor!, except: [:show]

  def index
    # Let's use this action for 'my devotions'
    redirect_to days_path
  end

  def show
    @devotion = Devotion.find(params[:id])
    # Only show the devotion if it exists and it is published.
    redirect_to days_path unless @devotion && @devotion.published?
  end

  def new
    @contributor = current_contributor
    @devotion = @contributor.devotions.new
  end

  def create
    @contributor = current_contributor
    @devotion = @contributor.devotions.new(params[:devotion])

    if @devotion.save
      redirect_to days_path # should go to preview
    else
      render 'new'
    end
  end
end
