class EggsController < ApplicationController
  layout 'admin_layout'
  before_action :authenticate

  def index
    @eggs = Egg.all
  end

  def new
    @egg = Egg.new
  end

  def create
    @egg = Egg.new(egg_params)
    if @egg.save
      redirect_to admin_path
    end
  end

  def edit
    @egg = Egg.find(params[:id])
  end

  def update
    @egg = Egg.find(params[:id])
    if @egg.update(egg_params)
      redirect_to admin_path
    end
  end

  def destroy
    @egg = Egg.find(params[:id])
    @egg.destroy
    redirect_to admin_path
  end

  private
    def egg_params
      params.require(:egg).permit(:link)
    end
end
