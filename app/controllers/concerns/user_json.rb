module UserJson
  def get_user_json(user)
    user_serializer = JSONAPI::ResourceSerializer.new(
        UserResource, include: ['card_sets'],
        fields: {
            cards_sets: [:name]
        }
    )
    user_serializer.serialize_to_hash(UserResource.new user)
  end
end