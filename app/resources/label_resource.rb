class LabelResource < JSONAPI::Resource
  attributes :name
  has_one :card_set
end