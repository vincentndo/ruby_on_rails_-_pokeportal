class PokemonsController < ApplicationController

    def capture
        pokemon_id = params[:id]
        pokemon = Pokemon.find(pokemon_id)
        pokemon.update(trainer_id: current_trainer.id)
        redirect_to :root
    end

    def damage
        pokemon_id = params[:id]
        pokemon = Pokemon.find(pokemon_id)

        if pokemon.health > 0
            new_health = [pokemon.health - 10, 0].max
            pokemon.update(health: new_health)
        end

        redirect_to "/trainers/#{pokemon.trainer_id}"
    end

    def heal
        pokemon_id = params[:id]
        pokemon = Pokemon.find(pokemon_id)
        pokemon.update(health: 10)

        redirect_to "/trainers/#{pokemon.trainer_id}"
    end

    def new
        @pokemon = Pokemon.new
    end

    def create
        begin
            Pokemon.create!( {health: 100, level: 1, trainer_id: current_trainer.id}.merge(pokemon_params) )
            redirect_to "/trainers/#{current_trainer.id}"
        rescue ActiveRecord::RecordInvalid => e
            @error = e.record.errors
            @pokemon = Pokemon.new
            render "new"
        end
    end

    private
        def pokemon_params
            params.require(:pokemon).permit(:name, :ndex)
            params.merge({health: 100, level: 1, trainer_id: current_trainer.id})
        end

end
