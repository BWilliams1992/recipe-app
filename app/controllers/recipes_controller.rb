class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def new 
    authorize! :create, Recipe, message: "Please sign in to create recipes"
    @recipe = Recipe.new
    @ingredient = @recipe.ingredients.build
    @recipe_ingredient = @recipe.recipe_ingredients.build(recipe_id: @recipe.id, ingredient_id:@ingredient.id)

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
    # if params[:search]
    #   @parameter = params[:search].downcase
    #   @recipes = Recipe.where("Lower(title) LIKE :search", search: @parameter).paginate(page:params[:page], per_page: 6)
    # else
    #   @recipes = Recipe.where(private: false).paginate(page:params[:page], per_page: 6)
    # end
    @recipes = Recipe.search(params[:search]).paginate(page:params[:page], per_page: 6)
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
      params.require(:recipe).permit(:title, :description, :method, :private, :main_image, ingredients_attributes:[:id, :name, :_destroy])
    end

end
