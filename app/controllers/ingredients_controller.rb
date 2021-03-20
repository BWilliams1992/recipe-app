class IngredientsController < ApplicationController 

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :amount, :measure)
    end
end