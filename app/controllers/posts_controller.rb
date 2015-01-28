class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render layout: "admin_layout"
  end

  def edit
    @post = Post.find(params[:id])
    render layout: "admin_layout"
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_path
  end

  def surrounding
    post = Post.find(params[:id])

    posts = post.surrounding

    respond_to do |format|
      format.json { render :json => [posts[0], posts[1], posts[2], posts[3], posts[4], posts[5]] }
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
