class StaticController < ApplicationController

	def home
    @posts = Post.all
    @video = Video.first
    @shows = Show.all
	end
	
end
