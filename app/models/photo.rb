class Photo < ActiveRecord::Base

  attr_accessible :data, :order

  has_attached_file :data, :styles => {:large => '2068x1448>', :thumbnail => '256x256#'}, :default_style => :thumbnail
  # validates_attachment_presence :data
  # validates_attachment_size :data, :less_than => 5.megabytes  
  # validates_attachment_content_type :data, :content_type => ['image/jpeg', 'image/png']  
end
