class GameController < ApplicationController
  load_and_authorize_resource

  def index
    @games = Game.all.order(created_at: :desc)
  end

  def show
    @game = Game.find_by(id: params[:id])
    if @game.nil?
      redirect_to backoffice_game_index_path, alert: "Game #{params[:id].to_s} doesn't exist"
    end
  end
end
