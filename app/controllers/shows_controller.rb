class ShowsController < ApplicationController
  layout 'admin_layout'  
  before_action :authenticate
  def index
    @shows = Show.all
  end

  def new
    @show = Show.new
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    if @show.update(show_params)
      redirect_to admin_path
    end
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      redirect_to admin_path
    end
  end

  def destroy
    @show = Show.find(params[:id])
    if @show.destroy
      redirect_to admin_path
    end
  end

  private
    def show_params
      params.require(:show).permit(:what, :when, :where, :how)
    end
end
