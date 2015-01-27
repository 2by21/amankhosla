class AdminsController < ApplicationController

  def index
    @posts = Post.all
    @video = Video.new
    @videos = Video.all
  end
end
