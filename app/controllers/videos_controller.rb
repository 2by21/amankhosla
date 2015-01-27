class VideosController < ApplicationController

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to admin_path
    end
  end

  private

    def video_params
      params.require(:video).permit(:title, :body, :link)
    end

end
