class ApplicationController < ActionController::Base
  protect_from_forgery


  # prawnto configuration

  prawnto :inline=>true

  prawnto :prawn => {
    :left_margin => 0, 
    :right_margin => 0,
    :top_margin => 0,
    :bottom_margin => 0,
    :page_size => 'A4',
    :page_layout => :landscape
  }



end
