class CardSetResource < JSONAPI::Resource
  attribute :name
  has_one :user
  has_many :cards
  has_many :tags

  def save
    @model.user ||= context[:current_user]
    super
  end
end