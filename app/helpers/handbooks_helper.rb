module HandbooksHelper

  # returns true if the given ip_address behaved
  # suspiciously (esp. when such user created many 
  # handbooks)
  def requires_captcha? ip_address
    # debug
    true
  end
end
