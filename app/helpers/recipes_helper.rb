module RecipesHelper
  #Converts a set of collections to proper format to be used by 
  #options for method
  def collections_to_options_array(collections)
    array = []
    collections.each do |collection|
      array.push([collection.title,collection.id])
    end
  #Filters out the My Recipes from the array 
    filteredArray = array.select { |item| item[0]!="My Recipes"}
    return filteredArray
  end
end
