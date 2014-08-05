class CardSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :front, :back
  has_one :card_set
end
