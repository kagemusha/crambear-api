class RegistrationsController < Devise::RegistrationsController
  include TokenAuthentication
  include UserJson

  respond_to :json

  def create
    user = ActiveRecord::Base.transaction do
      User.create(sign_up_params)
    end
    if user.valid?
      sign_up(resource_name, user)
      user.new_auth_token!
      render json: get_user_json(user)
    else
      render json: user.errors,
             status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
