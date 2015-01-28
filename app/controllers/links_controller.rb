class LinksController < ApplicationController

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to admin_path
    end
  end

  private

    def link_params
      params.require(:link).permit(:url)
    end
end
