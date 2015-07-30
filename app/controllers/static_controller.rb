class StaticController < ApplicationController
  has_mobile_fu

  def home
    @posts = Post.all
    @video = Video.order(created_at: :desc).first
    @videos = Video.all.order(created_at: :desc)
    @shows = Show.all.order(created_at: :desc)
    @bio = Bio.first
    @tools = Tool.all
    @galleries = Gallery.all
    @projects = Project.all
    @clinics = Clinic.all.order(created_at: :desc)
    links = Link.all.order('created_at DESC')
    @link1 = links[0]
    @link2 = links[1]
    @link3 = links[2]
    @link4 = links[3]
  end

  def showsclinics
    @shows = Show.all.order(created_at: :desc)
    @clinics = Clinic.all.order(created_at: :desc)
    render 'showsclinics.mobile.erb', :layout => false
  end

  def welcome
    if is_mobile_device?
      redirect_to home_path and return
    end
    render layout: 'landing' and return
  end
  
end
