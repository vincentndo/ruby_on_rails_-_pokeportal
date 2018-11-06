class TrainersController < ApplicationController
  before_action :authenticate_trainer!

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
    if current_trainer.id == @trainer.id
        @trained_pokemons = Pokemon.where(trainer_id: params[:id])
    else
        @trained_pokemons = Pokemon.where(trainer_id: params[:id], health: 1..Float::INFINITY)
    end
  end

end
