class HandbookMailer < ActionMailer::Base
  default :from => "from@example.com"

  def availability_notification(handbook)
    puts "SENDING EMAIL TO #{handbook.email}"
    m = mail(:to => handbook.email, :subject => "Your Corporate Handbook is ready!")
    p m
    puts "JUST SENT EMAIL TO #{handbook.email}"
  end

end
