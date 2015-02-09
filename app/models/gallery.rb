class Gallery < ActiveRecord::Base
  has_many :images
  validates_presence_of :name
end
