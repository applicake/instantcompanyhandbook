# recaptcha keys - kept in an .yml file, loaded selectively, 
# environment independant; sample file: /config/recaptcha.yml :
#
# public_key: 111111111111111111111
# private_key: 222222222222222222222
Recaptcha.configure do |config|
  keys = YAML.load_file("#{Rails.root}/config/recaptcha.yml").symbolize_keys
  config.public_key = keys[:public_key]
  config.private_key = keys[:private_key]
end
