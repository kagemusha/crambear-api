class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  include TokenAuthentication

  protected

  def ensure_authenticated_user
    head :unauthorized unless current_user
  end

end
