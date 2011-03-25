class Handbook < ActiveRecord::Base


  before_create :assign_uuid
  after_commit :generate_pdf

  attr_accessible :name, :logo, :email
  has_attached_file :logo	, :styles => {:pdf_corner => '200x150'}, :default_style => :pdf_corner

  validates :email, :presence => true, :email => true
  validates :name, :presence => true

  # generates an uuid using uuidtools and assigns
  # it to the handbook
  def assign_uuid
    self.id = UUIDTools::UUID.timestamp_create().to_s
  end

  def generate_pdf
    # generating pdf file through prawn
    # via a background job using spawn
    # https://github.com/tra/spawn
    spawn :nice => 5, :argv => "spawn #{id}" do

      pdf = Prawn::Document.new(
        :page_size => [500, 1000],
        :page_layout => :landscape,
        :left_margin => 0, 
        :right_margin => 0,
        :top_margin => 0,
        :bottom_margin => 0
      )

      pdf.text "#{name}"
      Photo.all.sort_by {|p| p.order} .each do |photo|
        pdf.start_new_page
        pdf.image "#{photo.data.path}", :at => [0, 500], :width => 1000, :height => 500
        if logo
          # pdf.bounding_box :position => :right, :vposition => :bottom do
            pdf.image logo.path, :position => :right, :vposition => :bottom
          # pdf.bounding_box [800,150], :width => 200, :height => 150 do
            # pdf.text "The rain in spain falls mainly on the plains " * 5
            # pdf.move_down 20
            # pdf.stroke do
            #   pdf.line pdf.bounds.top_left,    pdf.bounds.top_right
            #   pdf.line pdf.bounds.bottom_left, pdf.bounds.bottom_right
            # end
          # end
          # end
        end
      end

      p = "public/handbooks/#{id}"
      Dir.mkdir(p) unless File.directory?(p)
      pdf.render_file "#{p}/corporate_handbook.pdf"

      HandbookMailer.availability_notification(self).deliver if email

    end
  end

end
