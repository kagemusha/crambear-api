class CardSetSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :public

  has_many :cards
end
