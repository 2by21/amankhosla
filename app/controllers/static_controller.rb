class StaticController < ApplicationController

  def home
    @posts = Post.all
    @video = Video.first
    @videos = Video.all
    @shows = Show.all
    @bio = Bio.first
    @tools = Tool.all
    @galleries = Gallery.all
    @projects = Project.all
    links = Link.all.order('created_at DESC')
    @link1 = links[0]
    @link2 = links[1]
    @link3 = links[2]
    @link4 = links[3]
  end

  def welcome
    render layout: 'landing'
  end
  
end
