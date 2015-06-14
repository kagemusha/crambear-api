class CardsController < ApplicationController

  def index
    set = CardSet.find(params[:card_set_id])
    render json: set.cards
  end

  def show
    card = Card.find(params[:id])
    render json: card
  end

end
