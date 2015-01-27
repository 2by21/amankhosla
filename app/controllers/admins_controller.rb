class AdminsController < ApplicationController

  def index
    @posts = Post.all
    @videos = Video.all
    @shows = Show.all
    render layout: "admin_layout"
  end
end
