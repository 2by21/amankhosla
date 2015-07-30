class MobileTextsController < ApplicationController
  before_action :authenticate
  layout 'admin_layout'

  # GET /mobile_texts
  # GET /mobile_texts.json
  def index
    @mobile_text = MobileText.first
  end

  # GET /mobile_texts/1
  # GET /mobile_texts/1.json
  def show
  end

  # GET /mobile_texts/new
  def new
    @mobile_text = MobileText.new
  end

  # GET /mobile_texts/1/edit
  def edit
    @mobile_text = MobileText.first
  end

  # POST /mobile_texts
  # POST /mobile_texts.json
  def create
    @mobile_text = MobileText.new(mobile_text_params)
      if @mobile_text.save
       redirect_to mobile_texts_path
      end
  end

  def update
    @mobile_text = MobileText.first
    if @mobile_text.update(mobile_text_params)
      redirect_to mobile_texts_path
    end
  end


  def destroy
    MobileText.all.destroy
    redirect_to mobile_texts_path
  end

  private
    def mobile_text_params
      params.require(:mobile_text).permit(:text, :msg, :scroll_msg)
    end
end
