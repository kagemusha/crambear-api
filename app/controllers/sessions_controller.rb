class SessionsController < Devise::SessionsController
  include TokenAuthentication
  include UserJson

  respond_to :json

  def create
    user = User.find_by_email(sign_in_params[:email])
    if user && user.valid_password?(sign_in_params[:password])
      sign_in(resource_name, user)
      user.new_auth_token!
      render json: get_user_json(user)
    else
      failure
    end
  end

  private


  def sign_in_params
    params.require(:user).permit(:email, :password)
  end

  def respond_to_on_destroy
    if current_user
      current_user.destroy_auth_token!
      head :ok
    else
      failure
    end
  end

  def failure
    head :unauthorized
  end
end
