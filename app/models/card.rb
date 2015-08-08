class Card < ActiveRecord::Base
  belongs_to :card_set
  has_and_belongs_to_many :labels
end
