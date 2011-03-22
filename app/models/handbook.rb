class Handbook < ActiveRecord::Base
  attr_accessible :name, :logo
  has_attached_file :logo	
end
