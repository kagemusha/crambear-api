class CardsController < ApplicationController

  def index
    set = CardSet.find(params[:card_set_id])
    render json: set.cards
  end

  def show
    set = CardSet.find(params[:id])
    render json: set
  end

end
