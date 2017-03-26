require 'twilio-ruby'
class SendPinJob < ApplicationJob

  def perform(phone)
    @client = Twilio::REST::Client.new
    begin
     resp=@client.messages.create(from: '+16266001447',to: "+91#{phone.phone}", body: phone.pin)
     rescue Exception => e
    end
    phone.touch(:pin_sent_at)
    
  end

end
