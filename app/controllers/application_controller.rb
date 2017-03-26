class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_employer
    @current_employer ||= Employer.find(session[:employer_id]) if session[:employer_id]
  end
  helper_method :current_employer

  def authorize
    redirect_to '/login' unless current_employer
  end
end
