class Backoffice::GameController < Backoffice::ApplicationController
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

  def new
    @game = Game.new
  end

  def create
    game = Game.new(game_params)
    game.save
    if game
      redirect_to backoffice_game_show_path(game.id), notice: "Create success"
    else
      redirect_to request.headers["HTTP_REFERER"], alert: "Create failed, plz contact admin"
    end
  end

  def edit
    @game = Game.find(params[:id])
    if @game.nil?
      redirect_to backoffice_game_index_path, alert: "Game #{params[:id].to_s} doesn't exist"
    end
  end

  def update
    @game = Game.find(params[:id])

    if @game.nil?
      redirect_to backoffice_game_index_path, alert: "Event #{params[:id].to_s} doesn't exist"
    else
      if @game.update(game_params)
        redirect_to backoffice_game_show_path(@game.id), notice: "Update success"
      else
        redirect_to backoffice_game_index_path, alert: "Failed to update game."
      end
    end
  end

private
  def game_params
    params.require(:game).permit( :name, :icon, :url, :editor, :info )
  end
end
