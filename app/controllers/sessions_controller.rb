class SessionsController < ApplicationController

  def new
    @employer = Employer.new
    @employer.build_email
  end

  def create
    employer = Employer.joins(:email).where(emails:{email:params[:email]}).first
    # If the employer exists AND the password entered is correct.
    if employer && employer.authenticate(params[:password])
        session[:employer_id] = employer.id
        redirect_to employer_path(employer)
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    session[:employer_id] = nil
    redirect_to '/login'
  end
end
