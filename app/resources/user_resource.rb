class UserResource < JSONAPI::Resource
    attributes :email, :name, :auth_token
    has_many :card_sets
end