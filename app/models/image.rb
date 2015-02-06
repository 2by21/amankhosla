class Image < ActiveRecord::Base
  belongs_to :gallery

  has_attached_file :photo, :styles => { 
      :medium => "800x800", 
      :thumb => "259x199",
      :icon => "100x77"
    }, 
    :use_timestamp => false

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
