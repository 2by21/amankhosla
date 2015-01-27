class StaticController < ApplicationController

	def home
    @posts = Post.all
    @video = Video.first
	end
	
end
