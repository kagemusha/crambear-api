class CardSerializer < ActiveModel::Serializer

  attributes :id, :front, :back
  has_one :card_set

end
