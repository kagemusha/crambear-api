    class CardsController < JsonApiController

      def get_related_resources
        if (params[:source] == 'card_sets')
          card_set = CardSet.find params[:card_set_id]
          card_serializer = JSONAPI::ResourceSerializer.new(
              CardResource, include: ['tags'],
              fields: {
                  tags: [:name]
              }
          )
          cards_json = card_serializer.serialize_to_hash(card_set.cards.map { |card| CardResource.new card})
          render json: cards_json.to_json
        else
          super
        end
      end
    end
