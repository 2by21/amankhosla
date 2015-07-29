class AddSoundFileTouAudio < ActiveRecord::Migration
  def change
    add_attachment :audios, :sound_file
  end
end
