class UsersController < ApplicationController
  include TokenAuthentication

  def show
    current_user.new_auth_token!
    render json: current_user
  end

end
