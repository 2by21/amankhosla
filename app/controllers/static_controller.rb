class StaticController < ApplicationController

	def home
    @posts = Post.all
    @video = Video.first
    @videos = Video.all
    @shows = Show.all
    @link1 = Link.find(1)
    @link2 = Link.find(2)
    @link3 = Link.find(3)
    @link4 = Link.find(4)
	end
	
end
