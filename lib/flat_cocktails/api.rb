class FlatCocktails::API
    BASE_URL = "https://www.thecocktaildb.com/api/json/v1/1/"

    def self.get_ingredients
        response = RestClient.get(BASE_URL + "list.php?i=list")
        data = JSON.parse(response)

        data["drinks"].each do |ingredient|
            FlatCocktails::Ingredients.new(name: ingredient["strIngredient1"])
        end
    end


end