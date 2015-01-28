class AdminsController < ApplicationController

  def index
    @posts = Post.all
    @videos = Video.all
    @shows = Show.all
    @links = Link.all
    @bio = Bio.first
    render layout: "admin_layout"
  end
end
