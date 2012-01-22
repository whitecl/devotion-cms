class DevotionsController < ApplicationController
  before_filter :authenticate_contributor!, except: [:show]

  def index
    @contributor = current_contributor
    @devotions = @contributor.devotions
  end

  def show
    @devotion = Devotion.find(params[:id])
    # Only show the devotion if it exists and it is published.
    redirect_to days_path unless @devotion && @devotion.published?
  end

  def preview
    @devotion = Devotion.find(params[:id])

    # Preview is only ok if devotion is owned by logged-in contributor (maybe coordinators in the future)
    redirect_to days_path unless @devotion.contributor == current_contributor
  end

  def new
    @contributor = current_contributor
    @devotion = @contributor.devotions.new
  end

  def create
    @contributor = current_contributor
    @devotion = @contributor.devotions.new(params[:devotion])

    if @devotion.save
      redirect_to preview_devotion_path(@devotion)
    else
      render 'new'
    end
  end

  def edit
    @contributor = current_contributor
    # ask in contributor scope to make sure it belongs to this contributor
    @devotion = @contributor.devotions.find(params[:id])

    redirect_to days_path unless @devotion
  end

  def update
    @contributor = current_contributor
    # ask in contributor scope to make sure it belongs to this contributor
    @devotion = @contributor.devotions.find(params[:id])

    if @devotion.update_attributes(params[:devotion])
      redirect_to preview_devotion_path(@devotion)
    else
      render 'edit'
    end
  end
end
