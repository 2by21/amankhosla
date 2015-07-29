class AudiosController < ApplicationController
  before_action :authenticate
  layout 'admin_layout'

  def new
    @audio = Audio.new
  end

  def index
    @audio = Audio.first
  end

  def create
    @audio = Audio.new(audio_params)
    if @audio.save
      redirect_to audios_path
    end
  end

  def destroy
    Audio.destroy_all
    redirect_to audios_path
  end

  private

    def audio_params
      params.require(:audio).permit(:sound_file)
    end
end
