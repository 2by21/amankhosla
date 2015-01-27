class ShowsController < ApplicationController
  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      redirect_to admin_path
    end
  end

  private
    def show_params
      params.require(:show).permit(:what, :when, :where, :how)
    end
end
