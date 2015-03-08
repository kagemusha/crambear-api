class CardSetSerializer < ActiveModel::Serializer

  attributes :id, :name, :public

  has_many :cards
end
