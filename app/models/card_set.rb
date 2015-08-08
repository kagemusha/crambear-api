class CardSet < ActiveRecord::Base
  belongs_to :user
  has_many :cards
  has_many :tags
end

