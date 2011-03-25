class HandbookMailer < ActionMailer::Base
  default :from => "from@example.com"

  def availability_notification(handbook)
    attachments["corporate_handbook.pdf"] = File.read("#{Rails.root}/public/handbooks/#{handbook.id}/corporate_handbook.pdf") 
    mail(:to => handbook.email, :subject => "Your Corporate Handbook is ready!")
  end

end
