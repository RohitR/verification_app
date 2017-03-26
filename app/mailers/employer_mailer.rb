class EmployerMailer < ActionMailer::Base
    default :from => "2255rohith@gmail.com"

 def email_verifiaction(employer)
    @employer = employer
    mail(:to => "#{employer.name} <#{employer.email.email}>", :subject => "Email Verification")
 end
end
