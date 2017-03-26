class PhoneVerifyController < ApplicationController


  # GET /verify
  def new
    resp=SendPinJob.perform_now(current_employer.phone)
    flash.now[:notice] = "A pin has been sent to #{current_employer.phone.phone}. Please verify this number at https://www.twilio.com/console/phone-numbers/verified to get the sms."
  end

  # PUT /verify
  def update
    if Time.now > current_employer.phone.pin_sent_at.advance(minutes: 60)
      flash.now[:alert] = "Your pin has expired. Please request another."
      render :new and return
    elsif params[:pin].try(:to_i) == current_employer.phone.pin
      current_employer.phone.update_attribute(:verified, true)
      redirect_to root_url(current_employer), notice: "Your phone number has been verified!"
    else
      flash.now[:alert] = "The code you entered is invalid."
      render :new
    end
  end

  # POST /verify
  def create
    current_employer.phone.send_pin!
    redirect_to new_verify_url, notice: "A PIN number has been sent to your phone"
  end

  def verify_email
    EmployerMailer.email_verifiaction(current_employer).deliver
    redirect_to root_url(current_employer), notice: "An Email has been sent to #{current_employer.email.email}"
  end

end
