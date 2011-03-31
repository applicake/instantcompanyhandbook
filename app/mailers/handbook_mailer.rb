class HandbookMailer < ActionMailer::Base
  default :from => "from@example.com"

  def availability_notification(handbook)
    attachments["Company_Handbook.pdf"] = File.read("#{Rails.root}/public/handbooks/#{handbook.id}/Company_Handbook.pdf") 
    mail(:to => handbook.email, :subject => "A brand new, personalized company handbook for #{handbook.name} is ready!")
  end

end
