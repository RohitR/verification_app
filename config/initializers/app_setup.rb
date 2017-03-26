Rails.application.configure do
config.action_mailer.default_url_options = { :host => "https://ancient-beyond-38861.herokuapp.com" }
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'gmail.com',
  user_name:            'verifyapp123@gmail.com',
  password:             'verifyapp123',
  authentication:       :plain,
  enable_starttls_auto: true
}
end
