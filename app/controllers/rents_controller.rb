class RentsController < ApplicationController
  def new
    @game = Game.find params[:game_id]
    @rent = @game.rents.build
  end

  def create
    @game = Game.find params[:game_id]
    @rent = @game.rents.build rent_params
    if @rent.save
      redirect_to @game, notice: 'Rent Successful'
    else
      render :new
    end
  end

  def edit
    @rent = Rent.find params[:id]
    @rent.return_date = Date.current
    @rent.save
    redirect_back(fallback_location: root_path)
  end

  private

  def rent_params
    params.require(:rent).permit(:customer_id, :comments)
  end
end
