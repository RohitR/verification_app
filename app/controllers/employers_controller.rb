class EmployersController < ApplicationController
  before_action :authorize,only: [:show,:edit]
  def new
    @employer=Employer.new
    @employer.build_email
    @employer.build_phone
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      session[:employer_id] = @employer.id
      redirect_to root_url(@employer)
    else
      render 'new'
    end
  end

  def edit
    @employer= Employer.find(params[:id])
  end

  def update
    @employer = Employer.find(params[:id])
    if @employer.update_attributes(employer_params)
      flash[:notice] = "Employer credentials updated successfully."
      redirect_to employer_path(@employer)
    else
      render 'edit'
    end
  end

  def show
    @employer = Employer.find(params[:id] || current_employer.id)
  end

  def confirm_email
    employer = Employer.joins(:email).where(emails:{confirm_token: params[:id]}).first

    if employer
      employer.email.email_activate
      flash[:success] = "Welcome ! Your email has been confirmed."
      redirect_to employer_path(employer)
    else
      flash[:error] = "Sorry. Employer does not exist"
      redirect_to '/login'
    end
end


private

  def employer_params
    params.require(:employer).permit(:name, :location, :gender,:password, :password_confirmation,email_attributes:[:email,:id],phone_attributes:[:id,:phone])
  end
end
