class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all.order(created_at: :desc)
    respond_to do |format|
      format.json { render json: @posts }
    end
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

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
