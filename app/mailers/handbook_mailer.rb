class HandbookMailer < ActionMailer::Base
  default :from => "from@example.com"

  def availability_notification(handbook)
    attachments["corporate_handbook.pdf"] = File.read("#{Rails.root}/public/handbooks/#{handbook.id}/corporate_handbook.pdf") 
    mail(:to => handbook.email, :subject => "A brand new, personalized company handbook for #{handbook.name} is ready!")
  end

end
