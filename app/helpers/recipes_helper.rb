module RecipesHelper
  def collections_to_options_array(collections)
    array = []
    collections.each do |collection|
      array.push([collection.title,collection.id])
    end
    return array
  end
end
