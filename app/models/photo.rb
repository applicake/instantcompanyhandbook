require 'paperclip_processors/watermark'

class Photo < ActiveRecord::Base

  attr_accessible :data, :order, :logo_overlay

  # paperclip-held image file, and its attributes;
  # note: watermark is a custom processor, can be found 
  # in the ./lib/paperclip_processors/watermark.rb
  has_attached_file :data, :processors => [:watermark], :styles => {
    :large => '1000x733!', 
    :thumbnail => '256x256#', 
    # the image with an overlay logo
    :tcrl => {:geometry => '1000x733!', :watermark_path => "#{Rails.public_path}/images/tcrl_overlay.png", :position => 'SouthEast'}
  }, :default_style => :large

  validates_attachment_presence :data
  # validates_attachment_size :data, :less_than => 5.megabytes  
  # validates_attachment_content_type :data, :content_type => ['image/jpeg', 'image/png']  
end
