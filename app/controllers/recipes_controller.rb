class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def new 
    @recipe = Recipe.new
    2.times { @recipe.ingredients.build }
  end

  def create 
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:notice] = "Recipe was succesfully created!"
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def index 
    @recipes = Recipe.all
  end

  def show 
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice] = "Recipe successfully updated!"
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    flash[:notice] = "Recipe deleted!"
    redirect_to recipes_path
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params 
      params.require(:recipe).permit(:title, :description, :method, ingredients_attributes:[:id, :name, :amount, :measure, :_destroy])
    end

end
