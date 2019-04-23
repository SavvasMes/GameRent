class GameCategoriesController < ApplicationController
  def index
    @game_categories = GameCategory.page params[:page]
  end

  def new
    @game_category= GameCategory.new
    render :edit
  end

  def create
    @game_category= GameCategory.new game_category_params

    if @game_category.save
      redirect_to game_categories_path, notice: 'Category Saved'
    else
      render :edit
    end
  end

  def edit
    @game_category = GameCategory.find params[:id]
  end

  def update
    @game_category = GameCategory.find params[:id]

    if @game_category.update_attributes game_category_params
      flash[:notice] = "Game Category Updated <b>successfully!</b>"
      redirect_to game_categories_path
    else
      render :edit
    end
  end

  def destroy
    @game_category = GameCategory.find params[:id]
    @game_category.destroy
    flash.now[:notice] = "Game Category deleted <b>successfully!</b>"
    redirect_to game_categories_path
  end

  private
  def game_category_params
    params.require(:game_category).permit(:name, :description)
  end
end
