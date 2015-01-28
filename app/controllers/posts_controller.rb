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

    if post.previous.nil?
      @prev_post = post
      @post = post.next
      @next_post = @post.next
    elsif post.next.nil?
      @next_post = post
      @post = post.previous
      @prev_post = @post.previous
    else
      @post = Post.find(params[:id])
      @prev_post = @post.previous
      @next_post = @post.next
    end

    @first_date = @prev_post.created_at.strftime("%m/%y")
    @second_date = @post.created_at.strftime("%m/%y")
    @third_date = @next_post.created_at.strftime("%m/%y")

    respond_to do |format|
      format.json { render :json => [@prev_post, @post, @next_post, @first_date, @second_date, @third_date]}
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
