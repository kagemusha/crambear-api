class CardSetsController < JsonApiController
  before_action :ensure_authenticated_user, except: [:index, :show]


  def index
    if current_user && !params[:public]
      sets = current_user.card_sets.includes("cards")
    else
      sets = CardSet.where(public: true).includes("cards")
    end
    render json: get_json(sets.to_a)
  end


  def show
    set = CardSet.find(params[:id])
    if set.public? || current_user == set.user
      render json: get_json(set)
    else
      render json: {error: 'Forbidden'}, :status => 403
    end
  end


  private

  def set_params
    params.require(:card_set).permit(:name)
  end


  def get_json(data)
    setSerializer = JSONAPI::ResourceSerializer.new(
        CardSetResource, include: ['cards', 'tags'],
        fields: {
            cards: [:card_set, :front, :back],
            tags:  [:card_set, :name]
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
