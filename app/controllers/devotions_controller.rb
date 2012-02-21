class DevotionsController < ApplicationController
  before_filter :authenticate_contributor!, except: [:show, :preview]

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
    redirect_to days_path unless @devotion.contributor == current_contributor || admin_user_signed_in?
  end

  def new
    @contributor = current_contributor
    @devotion = @contributor.devotions.new
    2.times{ @devotion.videos.build }
  end

  def create
    @contributor = current_contributor
    @devotion = @contributor.devotions.new(params[:devotion])

    if @devotion.save
      delete_videos_if_empty
      redirect_to preview_devotion_path(@devotion)
    else
      render 'new'
    end
  end

  def edit
    @contributor = current_contributor
    # ask in contributor scope to make sure it belongs to this contributor
    @devotion = @contributor.devotions.find(params[:id])

    @devotion.videos.build

    redirect_to days_path unless @devotion
  end

  def update
    @contributor = current_contributor
    # ask in contributor scope to make sure it belongs to this contributor
    @devotion = @contributor.devotions.find(params[:id])

    if @devotion.update_attributes(params[:devotion])
      delete_videos_if_empty
      redirect_to preview_devotion_path(@devotion)
    else
      render 'edit'
    end
  end

  private

  def delete_videos_if_empty
    @devotion.videos.each do |video|
      video.delete_if_empty
    end
  end
end
