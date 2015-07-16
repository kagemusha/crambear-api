class CardSetsController < JsonApiController
  before_action :ensure_authenticated_user, except: [:index, :show]


  def index
    if current_user
      sets = current_user.card_sets.includes("cards")
    else
      sets = CardSet.where(public: true).includes("cards")
    end
    render json: get_json(sets.to_a)
  end


  def show
    set = CardSet.find(params[:id])
    render json: get_json(set)
  end


  private

  def set_params
    params.require(:card_set).permit(:name)
  end


  def get_json(data)
    setSerializer = JSONAPI::ResourceSerializer.new(
        CardSetResource, include: ['cards'],
        fields: {
            cards: [:card_set, :front, :back]
        }
    )
    if data.kind_of?(Array)
      resources = data.map {|set| CardSetResource.new set}
    else
      resources = CardSetResource.new data
    end

    setSerializer.serialize_to_hash resources
  end
end
