class Video < ActiveRecord::Base
  validates_presence_of :title, :body, :link
end
