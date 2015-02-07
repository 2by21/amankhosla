class BiosController < ApplicationController
  before_action :authenticate

  layout 'admin_layout'

  def edit
    @bio = Bio.first
  end

  def update
    @bio = Bio.first
    if @bio.update(bio_params)
      redirect_to admin_path
    end
  end

  private

    def bio_params
      params.require(:bio).permit(:text)
    end
end
