class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def new 
    authorize! :create, Recipe, message: "Please sign in to create recipes"
    @recipe = Recipe.new
    2.times { @recipe.ingredients.build }
  end

  def create 
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:notice] = "Recipe was succesfully created!"
      @my_recipes = @recipe.user.collections.find_by_title("My Recipes")
      @my_recipes.recipes << @recipe
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def index 
    @recipes = Recipe.where(private: false).paginate(page:params[:page], per_page: 6)
  end

  def show 
    authorize! :read, @recipe
    if user_signed_in?
      @collections = current_user.collections
    end
  end

  def edit
    authorize! :edit, @recipe, message: "Cannot edit a recipe you do not own!"
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

  def add_to_collection
    @recipe = Recipe.find(params[:recipe_id])
    @collection = Collection.find(params[:collection_id])

    @collection.recipes << @recipe

    redirect_to @collection
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params 
      params.require(:recipe).permit(:title, :description, :method, :private, :main_image, ingredients_attributes:[:id, :name, :amount, :measure, :_destroy])
    end

end
