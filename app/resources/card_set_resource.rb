class CardSetResource < JSONAPI::Resource
  attributes :name, :card_count
  has_one :user
  has_many :cards
  has_many :tags

  def card_count
    @model.cards.count
  end

  def save
    @model.user ||= context[:current_user]
    super
  end
end