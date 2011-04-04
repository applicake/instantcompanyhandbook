Recaptcha.configure do |config|
  keys = YAML.load_file("#{Rails.root}/config/passwords.yml")['recaptcha'].symbolize_keys
  config.public_key = keys[:public_key]
  config.private_key = keys[:private_key]
end
