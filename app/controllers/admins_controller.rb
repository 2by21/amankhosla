class AdminsController < ApplicationController

  def index
    @posts = Post.all
    @video = Video.new
    @videos = Video.all
    @shows = Show.all
    @show = Show.new
  end
end
