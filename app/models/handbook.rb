class Handbook < ActiveRecord::Base

  before_create :assign_uuid
  after_commit :generate_pdf

  attr_accessible :name, :logo, :email
  has_attached_file :logo	, :styles => {:pdf_corner => [ '200x150', :png] }, :default_style => :pdf_corner

  validates :email, :presence => true, :email => true
  validates :name, :presence => true

  # generates an uuid using uuidtools and assigns
  # it to the handbook
  def assign_uuid
    self.id = UUIDTools::UUID.timestamp_create().to_s
  end

  def generate_pdf
    pdf = Prawn::Document.new(
      :page_size => [733, 1000],
      :page_layout => :landscape,
      :left_margin => 0, 
      :right_margin => 0,
      :top_margin => 0,
      :bottom_margin => 0
    )

    pdf.font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"

    # hack, putting in a hardcoded image; todo: fix!
    pdf.image "#{Rails.public_path + '/images/front.jpg'}", :at => [0, 733], :width => 1000, :height =>733 
    pdf.bounding_box [50,633], :width => 900, :height => 533 do
      pdf.bounding_box [0,533], :width => 900, :height => 200 do
        pdf.text(
          "#{name.upcase}", 
          :size => 48, 
          :align => :center, 
          :valign => :center
        )
      end
    end

    Photo.all.sort_by {|p| p.order} .each do |photo|
      pdf.start_new_page
      pdf.image "#{photo.data.path}", :at => [0, 733], :width => 1000, :height =>733 
      if photo.logo_overlay && logo.exists?
        # ~30px margin; todo: refactor
        pdf.bounding_box [30,703], :width => 938, :height => 671 do
          pdf.image logo.path, :position => :right, :vposition => :bottom
        end
      end

    end

    p = "public/handbooks/#{id}"
    Dir.mkdir(p) unless File.directory?(p)
    pdf.render_file "#{p}/Company_Handbook.pdf"

    HandbookMailer.availability_notification(self).deliver if email

  end
  handle_asynchronously :generate_pdf

end
