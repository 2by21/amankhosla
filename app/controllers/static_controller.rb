class StaticController < ApplicationController
  before_filter :force_tablet_html
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
    render 'shows-clinics.html.erb', :layout => false
  end

  def welcome
    if is_mobile_device?
      redirect_to home_path and return
    end
    render layout: 'landing' and return
  end

  private
    def force_tablet_html
      session[:tablet_view] = false
    end
  
end
