class UsersController < ApplicationController
  include TokenAuthentication

  def show
    current_user.new_auth_token!
    userSerializer = JSONAPI::ResourceSerializer.new(
       UserResource, include: ['card_sets'],
       fields: {
           cards_sets: [:name]
       }
    )
    json = userSerializer.serialize_to_hash UserResource.new current_user
    render json: json
  end

end
