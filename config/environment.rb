# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Rails.application.configure do
  config.action_mailer.default_url_options = { :host => "localhost:3000" }
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gmail.com',
    user_name:            'verifyapp123@gmail.com',
    password:             'verifyapp23',
    authentication:       :plain,
    enable_starttls_auto: true
  }


end
