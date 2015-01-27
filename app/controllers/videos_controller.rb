class VideosController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to admin_path
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      redirect_to admin_path
    end
  end

  def destroy
    @video = Video.find(params[:id])
    if @video.destroy
      redirect_to admin_path
    end
  end

  private

    def video_params
      params.require(:video).permit(:title, :body, :link)
    end

end
