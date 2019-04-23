class GamesController < ApplicationController
  def index
    @games = Game.page params[:page]
  end

  def new
    @game = Game.new
    render :edit
  end

  def create
    @game = Game.new game_params

    if @game.save
      redirect_to games_path, notice: 'Game Saved'
    else
      render :edit
    end
  end

  def show
    @game = Game.find params[:id]
  end

  def edit
    @game = Game.find params[:id]
  end

  def update
    @game = Game.find params[:id]

    if @game.update_attributes game_params
      flash[:notice] = "Game Updated <b>successfully!</b>"
      redirect_to games_path
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find params[:id]
    @game.destroy
    flash.now[:notice] = "Game deleted <b>successfully!</b>"
    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:name, :game_category_id, :release_date, :quantity, :description)
  end
end
