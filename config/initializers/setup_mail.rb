# Loading email config from #{Rails.root}/config/smtp.yml file, for
# a given rails environment. 
#
# Note that by default yaml hash keys are strings and 
# ActionMailer::Base.smtp_settings requires symbols; we're using 
# the symbolize_keys (a.k.a. to_options) method from core rails 
# extensions
# 
#
# Sample file for a Gmail smtp with custom domain (custom-domain.com)
#
# development:
#   address: smtp.gmail.com  
#   port: 587
#   domain: custom-domain.com
#   user_name: companyhandbook@custom-domain.com
#   password: INSERT_PASSWORD_HERE
#   authentication: plain  
#   enable_starttls_auto: true  
# 
# production:
#   address: smtp.gmail.com
#   port: 587  
#   domain: custom-domain.com
#   user_name: companyhandbook@custom-domain.com
#   password: INSERT_PASSWORD_HERE
#   authentication: plain  
#   enable_starttls_auto: true  

# ActionMailer::Base.smtp_settings = YAML.load_file("#{Rails.root}/config/smtp.yml")[Rails.env]

CorporateHandbook::Application.configure do
  config.action_mailer.smtp_settings = YAML.load_file("#{Rails.root}/config/smtp.yml")[Rails.env].symbolize_keys
end
