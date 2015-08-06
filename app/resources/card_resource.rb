class CardResource < JSONAPI::Resource
  attributes :front, :back
  has_one :card_set
end