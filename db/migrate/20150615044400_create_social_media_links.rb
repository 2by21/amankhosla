class CreateSocialMediaLinks < ActiveRecord::Migration
  def change
    create_table :social_media_links do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
