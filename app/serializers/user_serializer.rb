class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :auth_token, :name
  has_many :card_sets

end
