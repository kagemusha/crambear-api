class TagResource < JSONAPI::Resource
  attributes :name
  has_one :card_set
  has_many :cards
end