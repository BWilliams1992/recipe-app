class IngredientsController < ApplicationController 

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :recipe_ingredient, recipe_ingredients_attributes:[:id , :amount, :measure, :_destroy])
    end
end