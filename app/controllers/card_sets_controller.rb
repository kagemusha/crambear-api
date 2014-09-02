class CardSetsController < ApplicationController

  def index
    sets = CardSet.where(public: true).includes("cards")
    render json: sets
  end

  def show
    set = CardSet.find(params[:id])
    render json: set
  end

end
