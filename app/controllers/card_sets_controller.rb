class CardSetsController < ApplicationController

  def index
    sets = CardSet.where(public: true).includes("cards")
    render json: sets, include: 'cards'
  end

  def show
    set = CardSet.find(params[:id])
    render json: set, include: 'cards'
  end

end
