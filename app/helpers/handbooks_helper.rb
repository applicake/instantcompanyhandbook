module HandbooksHelper

  # returns true if the given ip_address behaved
  # suspiciously, i.e.: if the user created more than
  # three handbooks in the following five hours
  def requires_captcha? ip_address
    Handbook.where(
      :ip_address => ip_address, 
      :created_at => 5.hours.ago ... Time.now
    ).order('created_at DESC').count >= 3
  end

  # just some DSL (Domain Specific Language),
  # returns false if the given ip_address behaved
  # suspiciously, see: requires_captcha? method
  def captcha_unnecessary? ip_address
    !requires_captcha?(ip_address)
  end
end
