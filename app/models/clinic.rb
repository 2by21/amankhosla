class Clinic < ActiveRecord::Base
  validates_presence_of :what, :when, :where, :how
end
