class Photo < ActiveRecord::Base
  has_attached_file :data, :styles => {:large => '2068x1448>', :thumbnail => '256x256#'}, :default_style => :thumbnail
end
