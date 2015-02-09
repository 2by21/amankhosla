class Tool < ActiveRecord::Base
  validates_presence_of :link, :text
end
