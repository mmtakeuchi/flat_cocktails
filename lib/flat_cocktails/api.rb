class FlatCocktails::API
    BASE_URL = "https://www.thecocktaildb.com/api/json/v1/1/"

    def self.get_ingredients
        response = RestClient.get(BASE_URL + "list.php?i=list")
        data = JSON.parse(response)

        data["drinks"].each do |ingredient|
            FlatCocktails::Ingredients.new(name: ingredient["strIngredient1"])
        end
    end

    def self.get_cocktails(input)
        FlatCocktails::Ingredients.all.each.with_index(1) do |ingredient, i|
            if input.to_i == i
                response = RestClient.get(BASE_URL + "filter.php?i=#{ingredient.name}")
                data = JSON.parse(response)

                data["drinks"].each do |cocktails|
                    FlatCocktails::Cocktails.new(name: cocktails["strDrink"])
                end
            end
        end
    end

    def self.get_details(input)
        FlatCocktails::Cocktails.all.each.with_index(1) do |cocktail, i|
            if input.to_i == i
                response = RestClient.get(BASE_URL + "search.php?s=#{cocktail.name}")
                data = JSON.parse(response)

                data["drinks"].each do |details|
                    name = details["strDrink"]
                    glass = details["strGlass"]
                    ingredients = details.select {|k| k.start_with?("strIngredient")}.compact.values
                    measures = details.select {|k| k.start_with?("strMeasure")}.compact.values
                    instructions = details["strInstructions"]
                    FlatCocktails::Details.new(
                        name: name,
                        glass: glass,
                        ingredients: measures.zip(ingredients),
                        instructions: instructions
                    )
                end
            end
        end
    end
end
