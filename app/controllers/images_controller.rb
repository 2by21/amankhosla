class ImagesController < ApplicationController

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new(image_params)
    @image.gallery = @gallery
    if @image.save
      redirect_to @gallery
    end
  end

  private

    def image_params
      params.require(:image).permit(:photo)
    end
end
