class GalleriesController < ApplicationController
  layout 'admin_layout'
  before_action :authenticate

  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to admin_path
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      redirect_to admin_path
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    if @gallery.destroy
      redirect_to admin_path
    end
  end

  private

    def gallery_params
      params.require(:gallery).permit(:name)
    end

end
